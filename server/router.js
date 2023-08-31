const express = require("express");
const router = express.Router();
//导入数据库 sqlFn('sql',[],res=>{})
const sqlFn = require("./mysql");
//图片需要的模块
const multer = require('multer')
const fs = require('fs')
//路由---接口地址
//导入mockjs
const Mock = require("mockjs");
//数据
const data = require("./data/format.json");

const vipLogin = require("./login/data/vip_login.json");
const adminLogin = require("./login/data/admin_login.json");
const adminPermission = require("./login/data/admin_permission.json");
const vipPermission = require("./login/data/vip_permission.json");

//登录-分权限 1. 超级管理员 admin   2. 其他账号 vip账号 3.
router.post("/login", (req, res) => {
  const username = req.body.user;
  // const pwd = req.body.pwd;
  if (username === 'admin') {//超级管理员
      res.send(adminLogin)
  } else {
      res.send(vipLogin)//普通VIP用户 
  }
})

//用户权限数据接口
router.get("/permission", (req, res) => {
  const token = req.query.token;
  if (token === 'admin') {
      res.send(adminPermission)
  } else {
      res.send(vipPermission)
  }
})



/* 
    首页-销量额等数据统计
*/
router.get("/home/dataCount", (req, res) => {
  res.send(
    Mock.mock({
      info: "数据统计",
      success: true,
      data: {
        list: {
          id: 1,
          "viewsTotal|10000-100000": 1,
          "views|1-30000": 1,
          viewsFun: function () {
            if (this.viewsTotal < this.views) {
              [this.viewsTotal, this.views] = [this.views, this.viewsTotal];
            }
          },
          "saleTotal|1000-100000": 1,
          "sale|1-100000": 1,
          viewsFun2: function () {
            if (this.saleTotal < this.sale) {
              [this.saleTotal, this.sale] = [this.sale, this.saleTotal];
            }
          },
          "payTotal|1000-999999": 1,
          "pay|1-9999": 1,
          viewsFun3: function () {
            if (this.payTotal < this.pay) {
              [this.payTotal, this.pay] = [this.pay, this.payTotal];
            }
          },
          "collectTotal|99-99999": 1,
          "collect|0-9999": 1,
          viewsFun4: function () {
            if (this.collectTotal < this.collect) {
              [this.collectTotal, this.collect] = [
                this.collect,
                this.collectTotal,
              ];
            }
          },
        },
      },
    })
  );
});

/* 
   首页折线图数据统计 月销量、月销售额
*/
router.get("/home/format", (req, res) => {
  res.send(data);
});

/* 
   首页 -今日 -订单统计
*/
router.get("/home/orderinfo", (req, res) => {
  res.send(
    Mock.mock({
      info: "订单统计信息",
      success: true,
      list: {
        "orderCount|1-100000": 1,
        "curOrderCount|1-1000": 1,
        count: function () {
          if (this.curOrderCount > this.orderCount) {
            [this.orderCount, this.curOrderCount] = [
              this.curOrderCount,
              this.orderCount,
            ];
          }
        },
        "money|1-200000": 1,
        "curMoney|1-1000": 1,
        moneyfun: function () {
          if (this.curMoney > this.money) {
            [this.money, this.curMoney] = [this.curMoney, this.money];
          }
        },
        "collect|1-99999": 1,
        "curCollect|1-999": 1,
        collectfun: function () {
          if (this.curCollect > this.collect) {
            [this.collect, this.curCollect] = [this.curCollect, this.collect];
          }
        },
        department: "",
        branchSchool: "",
      },
    })
  );
});

/**
 * 商品列表：获取分页 {total:'',arr:[{},{},{}],pagesize:8,}
 * 参数：page 页码
 */
router.get("/goods/projectList", (req, res) => {
  const page = req.query.page || 1;
  const sqlLen = "select * from project where id";
  sqlFn(sqlLen, null, (data) => {
    let len = data.length;
    const sql =
      "select * from project order by id desc limit 8 offset " + (page - 1) * 8;
    sqlFn(sql, null, (result) => {
      if (result.length > 0) {
        res.send({
          status: 200,
          data: result,
          pageSize: 8,
          total: len,
        });
      } else {
        res.send({
          status: 500,
          msg: "暂无数据",
        });
      }
    });
  });
});

/**
 * 商品查询接口 search
 * 参数：search
 */
router.get("/goods/search", (req, res) => {
  var search = req.query.search;
  const sql =
    "select * from project where concat(`title`,`sellPoint`,`descs`) like '%" +
    search +
    "%'";
  sqlFn(sql, null, (result) => {
    if (result.length > 0) {
      res.send({
        status: 200,
        result,
      });
    } else {
      res.send({
        status: 500,
        msg: "暂无数据",
      });
    }
  });
});

/**
 * 商品删除接口 id
 */
router.get("/goods/deleteItemById", (req, res) => {
  var id = req.query.id;
  const sql = "delete from project where id=?";
  const arr = [id];
  sqlFn(sql, arr, (result) => {
    if (result.affectedRows > 0) {
      res.send({
        status: 200,
        msg: "删除成功",
      });
    } else {
      res.send({
        status: 500,
        msg: "删除失败",
      });
    }
  });
});

/**
 * 商品添加 类目选择
 * 接口说明：接口不同的参数cid 返回不同的类目数据 后台接受变量：type
 */
router.get("/goods/itemCategory/selectItemCategoryByParentId", (req, res) => {
  const type = req.query.type || 1;
  console.log("type", type);
  const sql = "select * from category where type=?";
  var arr = [type];
  sqlFn(sql, arr, (result) => {
    if (result.length > 0) {
      res.send({
        status: 200,
        result,
      });
    } else {
      res.send({
        status: 500,
        msg: "暂无数据",
      });
    }
  });
});

/**
 * 上传图片 post请求 upload
 * 说明：
 *  1.后台安装 multer 模块   同时引入fs模块
 *  2.router.js入口文件导入模块
 *      const fs=require('fs')
        const multer=require('multer')
 *  3.上传图片 
 * 
 */

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./upload/");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + "-" + file.originalname);
  },
});

var createFolder = function (folder) {
  try {
    fs.accessSync(folder);
  } catch (e) {
    fs.mkdirSync(folder);
  }
};

var uploadFolder = "./upload/";
createFolder(uploadFolder);
var upload = multer({
  storage: storage,
});
//上传图片
router.post("/upload", upload.single("file"), function (req, res, next) {
  var file = req.file;
  console.log("文件类型：%s", file.mimetype);
  console.log("原始文件名：%s", file.originalname);
  console.log("文件大小：%s", file.size);
  console.log("文件保存路径：%s", file.path);
  res.json({
    res_code: "0",
    name: file.originalname,
    url: file.path,
  });
});
//富文本接口图片地址 file
router.post('/batchUpload', upload.single('file'), function (req, res, next) {
  var file = req.file;
  console.log('文件类型：%s', file.mimetype);
  console.log('原始文件名：%s', file.originalname);
  console.log('文件大小：%s', file.size);
  console.log('文件保存路径：%s', file.path);
  res.json({
      res_code: '0',
      name: file.originalname,
      href: file.path,
      url:'http://localhost:9898/'+file.path.slice(7),
      alt:file.name
  });
});




/**
 * 商品添加
 * 参数： title cid  category sellPoint price num descs paramsInfo image
 */
 router.get("/goods/item/insertTbItem", (req, res) => {
  /**
   * 获取参数
   */
  var title = req.query.title || "";
  var cid = req.query.cid || "";
  var category = req.query.category || "";
  var sellPoint = req.query.sellPoint || "";
  var price = req.query.price || "";
  var num = req.query.num || "";
  var descs = req.query.descs || "";
  var paramsInfo = req.query.paramsInfo || "";
  var image = req.query.image || "";

  const sql = "insert into project(title, image, sellPoint, price, cid, category, num, descs, paramsInfo) values (?,?,?,?,?,?,?,?,?)"
  var arr = [title, image, sellPoint, price, cid, category, num, descs, paramsInfo];
  sqlFn(sql, arr, result => {
      if (result.affectedRows > 0) {
          res.send({
              status: 200,
              msg: "添加成功"
          })
      } else {
          res.send({
              status: 500,
              msg: "添加失败"
          })
      }
  })
})




/**
 * 修改商品
 * id, title cid  category sellPoint price num descs paramsInfo image
 */

 router.get("/goods/item/updateTbItem", (req, res) => {
  var id = req.query.id;
  var title = req.query.title || "";
  var sellPoint = req.query.sellPoint || "";
  var price = req.query.price || "";
  var cid = req.query.cid || "";
  var category = req.query.category || "";
  var num = req.query.num || "";
  var desc = req.query.descs || "";
  var paramsInfo = req.query.paramsInfo || "";
  var image = req.query.image || "";
  var sql = "update project set title=?,sellPoint=?,price=?,cid=?,category=?,num=?,descs=?,paramsInfo=?,image=? where id=?";
  var arr = [title, sellPoint, price, cid, category, num, desc, paramsInfo, image, id];
  sqlFn(sql, arr, result => {
      if (result.affectedRows > 0) {
          res.send({
              status: 200,
              msg: "修改成功"
          })
      } else {
          res.send({
              status: 500,
              msg: "修改失败"
          })
      }
  })
})


/**
 * 批量删除 batchDelete  idArr Array  id标识
 * sql = "delete from A where id in (1,2,3)"  
 * 接受 参数 字符串  （数组转字符串）
 */
 router.get("/goods/batchDelete", (req, res) => {
  let ids = req.query.ids; //
  const sql =`delete from project where id in (${ids})`;

  sqlFn(sql, null, result => {
      if (result.affectedRows > 0) {
          res.send({
              status: 200,
              msg: "删除成功"
          })
      } else {
          res.send({
              status: 500,
              msg: "删除失败"
          })
      }
  })
})



/* 
所有类目
*/
router.get("/itemCategory", (req, res) => {
  const sql = "select * from category"
  sqlFn(sql, null, result => {
      if (result.length > 0) {
          res.send({
              status: 200,
              result
          })
      } else {
          res.send({
              status: 500,
              msg: "暂无数据"
          })
      }
  })
})
/* 
  类目管理 增加一级导航类目

*/
router.get("/itemCategory/insertCategory", (req, res) => {
  console.log('-------------');
  const name = req.query.name;
  //模拟不重复的数据
  const cid = Math.ceil(new Date().getTime()/1000)
  // const type='1';
  const sql = "insert into category values (null,?,?,'1')"
  sqlFn(sql, [name,cid], result => {
      if (result.affectedRows > 0) {
          res.send({
              status: 200,
              msg: "添加成功"
          })
      } else {
          res.send({
              status: 500,
              msg: "添加失败"
          })
      }
  })
})
/* 
  类目管理 修改导航类目
*/
router.get("/itemCategory/updateCategory", (req, res) => {
  const id = req.query.id;
  const name = req.query.name;
  const sql = "update category set name=? where id=?"
  sqlFn(sql, [name,id], result => {
      if (result.affectedRows > 0) {
          res.send({
              status: 200,
              msg: "修改成功"
          })
      } else {
          res.send({
              status: 500,
              msg: "修改失败"
          })
      }
  })
})

/**
*分类管理 删除导航 id
*/
router.get("/content/deleteContentCategoryById", (req, res) => {
  const id = req.query.id;
  const sql = "delete from category where id=?"
  sqlFn(sql, [id], result => {
      if (result.affectedRows > 0) {
          res.send({
              status: 200,
              msg: "删除成功"
          })
      } else {
          res.send({
              status: 500,
              msg: "删除失败"
          })
      }
  })
})


/**
* 所有类目管理 增加子导航
* cid  name
*/
router.get("/itemCategory/insertItemCategory", (req, res) => {
  const type = req.query.cid;
  const name = req.query.name;
  const cid = Math.ceil(new Date().getTime()/1000)
  const sql = "insert into category values (null,?,?,?)"
  sqlFn(sql, [name, cid,type], result => {
      if (result.affectedRows > 0) {
          res.send({
              status: 200,
              msg: "添加成功"
          })
      } else {
          res.send({
              status: 500,
              msg: "添加失败"
          })
      }
  })
})



module.exports = router;
