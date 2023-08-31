const express = require("express");
const router = express.Router();
//导入数据库 sqlFn('sql',[],res=>{})
const sqlFn = require("./mysql");
//导入mockjs
const Mock = require("mockjs");

//订单列表--------------------------
//1. 订单列表数据获取 page
router.get("/list", (req, res) => {
  //查询数据库
  const page = req.query.page || 1;
  const sqlLen = "select * from orderinfo where id";
  sqlFn(sqlLen, null, (data) => {
    let len = data.length;
    const sql =
      "select * from orderinfo order by id desc limit 8 offset " +
      (page - 1) * 8;
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

//2. 订单汇总接口---修改汇总状态
/* 
    批量汇总  id标识  
    sql =`delete from project where id in (101,102,103)`;
    前端数据接口：字符串  (数组转字符串)

    参数：
    1. 汇总的id号 字符串
    2. 操作人--登录者
    3. 手机号 
    4. 编号随机生成
*/
router.get("/changeStatus", (req, res) => {
  //ids='1,2,3'
  let ids = req.query.ids; //
  const sql = `update orderinfo set huizongStatus='2' where id in (${ids})`;
  console.log(sql);
  sqlFn(sql, null, (result) => {
    if (result.affectedRows > 0) {
      res.send({
        status: 200,
        msg: "修改成功",
      });
      //修改汇总清单--------------------------------
      //查询数据库
      const sqlLen = `select * from orderinfo where id in (${ids})`;
      sqlFn(sqlLen, null, (data) => {
        let sum = 0;
        data.forEach((ele) => {
          sum += Number(ele.price);
        });
        let code = ~~(Math.random() * 1000000);
        let phone =
          "151" + ~~(Math.random() * 1000000) + ~~(Math.random() * 100);
        const sql = `insert into collect(orderNum,phone,totalPrice,ids,operator) values(${code},${phone},?,?,'张三')`;
        let arr = [sum, ids];
        sqlFn(sql, arr, (result) => {
        });
      });
    } else {
      res.send({
        status: 500,
        msg: "修改失败",
      });
    }
  });
});

/* 
3. 订单详情
*/
var MockRandom = Mock.Random;
router.get("/list/detail", (req, res) => {
  let arr = [
    "猪肉",
    "鸡肉",
    "牛肉",
    "苹果",
    "羊肉",
    "莲藕",
    "青菜",
    "白菜",
    "香蕉",
    "柚子",
    "西瓜",
    "肉丸",
    "鸡胸肉",
  ];
  let result = Mock.mock({
    "id|+1": 1,
    code: "3565656",
    created: MockRandom.now("yyyy-MM-dd HH:mm:ss"), //日期
    yudingTime: MockRandom.now("yyyy-MM-dd HH:mm:ss"), //日期
    "list|10": [
      //最后一页的数据在1-10的区间产生
      {
        "title|+1": arr, //随机汉字,
        "price|10-100": 1,
        "num|1-1000": 1,
        "guige|200-1000": 200,
        sum: function () {
          return this.price * this.num;
        },
      },
    ],
    "pass|1-2": true,
    shenhename: "@cword(2,3)", //随机汉字,
    time: MockRandom.now("yyyy-MM-dd"),
    "suggestion|1": ["同意", "不同意", "@cword(2,3)"],
  });
  //返回数据
  res.send({
    status: 200,
    result,
  });
});

//4 汇总清单列表----------------------------------
router.get("/collect", (req, res) => {
  //查询数据库
  const page = req.query.page || 1;
  const sqlLen = "select * from collect";
  sqlFn(sqlLen, null, (data) => {
    let len = data.length;
    const sql =
      "select * from collect order by id desc limit 8 offset " + (page - 1) * 8;
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

//5. 撤销汇总-id----------------------------------------
router.get("/cancel", (req, res) => {
  //查询数据库
  const id = req.query.id;
  //查询
  const sql = `select ids from collect where id=${id}`;
  sqlFn(sql, null, (arr) => {
    const ids = arr[0].ids;
    //删除
    const sqldel= `delete from collect where id=${id}`;
    sqlFn(sqldel,null,result=>{
        //修改
        const sql = `update orderinfo set huizongStatus='1' where id in (${ids})`;
        sqlFn(sql,null,data=>{
            if (data.affectedRows > 0) {
                res.send({
                  status: 200,
                  msg: "修改成功",
                });
            }else{
                res.send({
                    status: 500,
                    msg: "修改失败",
                  });
            }
        })
    })

  });
});

module.exports = router;
