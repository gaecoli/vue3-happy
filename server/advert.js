const express = require("express");
const router = express.Router();
//导入数据库 sqlFn('sql',[],res=>{})
const sqlFn = require("./mysql");
//导入mockjs
// const Mock = require("mockjs");

//--------------------------


/**
 * 广告分类管理--内容分类管理 导航
 */
 router.get("/content/selectContentCategoryByParentId", (req, res) => {
    console.log('req.query.id',req.query.id);
    const id = req.query.id || 1;
    const sql = `select * from content where id='${id}'`;
    sqlFn(sql, [id], result => {
        console.log(result,id);
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

/**
 * 广告分类管理 增加子导航
 */
router.get("/content/insertContentCategory", (req, res) => {
    const pid = req.query.pid;
    const name = req.query.name;
    const currentId = Math.floor(Math.random() * 10000)
    const sql = "insert into content values (?,?,?)"
    sqlFn(sql, [pid, name, currentId], result => {
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
 *  广告分类管理 修改子导航
 */
router.get("/content/updateContentCategory", (req, res) => {
    const pid = req.query.pid;
    const name = req.query.name;
    const sql = "update content set name=? where pid=?"
    sqlFn(sql, [name, pid], result => {
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
 *广告分类管理 删除子导航 pid
 */
router.get("/content/deleteContentCategoryById", (req, res) => {
    const pid = req.query.pid;
    const sql = "delete from content where pid=?"
    sqlFn(sql, [pid], result => {
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
 * 广告分类管理 内容增加
 */
router.get("/content/insertTbContent", (req, res) => {
    const pid = req.query.pid;
    const name = req.query.name;
    const contentUrl = req.query.url;
    const image = req.query.image;
    const sql = "insert into contentinfo values(null,?,?,?,?)";
    sqlFn(sql, [pid, name, contentUrl, image], result => {
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
 * 广告分类管理 内容删除
 */

router.get("/content/deleteContentByIds", (req, res) => {
    const id = req.query.id;
    const sql = "delete from contentinfo where id=?"
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
 * 内容分类管理 内容查询
 */
router.get("/content/selectTbContentAllByCategoryId", (req, res) => {
    const pid = req.query.pid;
    const sql = "select * from contentinfo where pid=?"
    sqlFn(sql, [pid], result => {
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




module.exports = router;
