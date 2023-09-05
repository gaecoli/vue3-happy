const base = {
    host:'http://localhost:6688',
    // homeCount:api+'/home/dataCount',//首页数据统计顶部
    homeCount:'/api/home/dataCount',//首页数据统计顶部
    homeFormat:'/api/home/format',//首页折现图
    homeOrder:'/api/home/orderinfo',//首页今日订单
    //产品管理接口
    goodsList:'/api/goods/projectList',//商品列表
    goodsSearch:'/api/goods/search',//商品查询接口
    deleteGoods:"/api/goods/deleteItemById",//删除商品id
    goodsItemCategory:"/api/goods/itemCategory/selectItemCategoryByParentId",//商品添加类目选择
    addGoods:"/api/goods/item/insertTbItem",//商品添加地址
    changeGoods:"/api/goods/item/updateTbItem",//商品修改
    batchDelete:"/api/goods/batchDelete",//批量删除商品
    //富文本图片上传接口
    batchUpload:"/api/batchUpload",
    // /产品分类
    itemCategory:"/api/itemCategory",
    insertCategory:"/api/itemCategory/insertCategory",//一级类目
    updateCategory:"/api/itemCategory/updateCategory",//一级分类修改
    deleteContentCategoryById:"/api/content/deleteContentCategoryById",//删除类目
    insertItemCategory:"/api/itemCategory/insertItemCategory",//新增子类目录

    //登录接口
    login:"/api/login",//登录接口 user pwd
    permission:"/api/permission",//用户权限---token

    //广告分类
    getAdvertlist:"",
}

export const host='http://localhost:6688'

//导出图片地址
export const upload='/api/upload'

//导出wangEditor图片
export const batchUpload="/api/batchUpload"

export default base;