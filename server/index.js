//搭建express服务
const express = require('express')
const app = express()
//post 请求表单数据
app.use(express.urlencoded({ extended: true }))
//资源共享---只有打包的时候再去共享资源 研发不共享
// const cors = require('cors')
// app.use(cors())

app.use(express.static('upload'))

//路由--产品
const router = require('./router')
//订单
const order = require('./order')
//广告
const advert = require('./advert')

app.use('/',router)
app.use('/order',order)
app.use('/advert',advert)


app.listen(6688,()=>{
    console.log(6688);
})
