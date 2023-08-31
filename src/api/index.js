import axios from "axios";
import base from "./base";


const api = {
    /*
          1. 首页顶部数据统计
      */
    getHomeCount() {
        console.log('------------------');
        return axios.get(base.homeCount);
    },
    /*
      2. 首页图表绘制
     */
    getHomeFormat() {
        return axios.get(base.homeFormat);
    },
    /*
    3. 订单信息
     */
    getHomeOrder() {
        return axios.get(base.homeOrder);
    },
    /*
    4. 产品列表
      page
    */
    getGoodsList(params) {
        return axios.get(base.goodsList, { params });
    },
    /*
      5. 产品查询
      search
    */
    getGoodsSearch(params) {
        return axios.get(base.goodsSearch, { params });
    },

    /*
      6. 删除商品
    id
    */
    deleteGoods(params) {
        return axios.get(base.deleteGoods, { params });
    },
    /*
    7.商品类目选择
    goodsItemCategory
      type
    */
    goodsItemCategory(params) {
        return axios.get(base.goodsItemCategory, { params });
    },
    /*
      8. 商品添加
        参数： title cid  category sellPoint price num descs paramsInfo image
    */
    addGoods(params) {
        return axios.get(base.addGoods, { params });
    },
    /*
      9. 商品修改 title cid  category sellPoint price num descs paramsInfo image
      changeGoods
       */
    changeGoods(params) {
        return axios.get(base.changeGoods, { params });
    },
    /*
      10. 批量删除商品
        ids=(1,2,3) 字符串 [1,2,3]=>转成字符串格式
      */
    batchDelete(params) {
        return axios.get(base.batchDelete, { params });
    },
    /*
      11. 富文本上传图片
      batchUpload
        myaxios axios本身 无二次封装---
      */
    /*
      12. 产品列表分类
      */
    itemCategory() {
        return axios.get(base.itemCategory);
    },
    /*
      13. 产品类目一级导航
        name
       */
    insertCategory(params) {
        return axios.get(base.insertCategory, { params });
    },
    /*
      14. 修改一级分类名称
        name id
      */
    updateCategory(params) {
        return axios.get(base.updateCategory, { params });
    },
    /*
      15. 删除分类名称
      deleteContentCategoryById
      id

       */
    deleteContentCategoryById(params) {
        return axios.get(base.deleteContentCategoryById, { params });
    },
    /*
      16. 新增子类名称  cid name
      insertItemCategory
      */
    insertItemCategory(params) {
        return axios.get(base.insertItemCategory, { params });
    },

    /*
        17. 登录   name pwd
      */
    login(params) {
        return axios.post(base.login, params);
    },

    /*
      18. 用户权限  token
      */
    permission(params) {
        return axios.get(base.permission, { params });
    },
};

export  function permission(params) {
    return axios.get(base.permission, { params });
}

export default api;