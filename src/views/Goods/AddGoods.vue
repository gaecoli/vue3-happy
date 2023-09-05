<template>
  <div class="addGoods">
    <el-row :gutter="20">
      <el-col :span="4">
        <div class="menu">
          <div class="title">产品类型列表</div>
          <div class="tree">
            <GoodsTree @changeTree="changeTree"></GoodsTree>
          </div>
        </div>
      </el-col>
      <el-col :span="20">
        <div class="content">
          <div class="subTitle">商品{{ goods.title }}</div>
          <div class="wrapper">
            <el-form :model="goodsForm" :rules="rules" ref="ruleForm" label-width="100px" size="small"
                     class="demo-ruleForm">
              <el-form-item label="所属分类" prop="category">
                <span class="category"> {{ goodsForm.category }}</span>
              </el-form-item>
              <el-form-item label="商品名称" prop="title">
                <el-input v-model="goodsForm.title"></el-input>
              </el-form-item>
              <el-form-item label="商品价格" prop="price">
                <el-input v-model="goodsForm.price"></el-input>
              </el-form-item>
              <el-form-item label="商品数量" prop="num">
                <el-input v-model="goodsForm.num"></el-input>
              </el-form-item>
              <el-form-item label="商品卖点" prop="sellPoint">
                <el-input v-model="goodsForm.sellPoint"></el-input>
              </el-form-item>
              <el-form-item label="上传图片" prop="image">
                <GoodsUpload @sendImage="sendImage" :fileList="fileList"></GoodsUpload>
              </el-form-item>
<!--              <el-form-item label="商品描述" prop="descs">-->
<!--                <WangEditor @sendEditor="sendEditor" ref="myEditor"></WangEditor>-->
<!--              </el-form-item>-->
              <el-form-item label="首页轮播推荐" prop="isBanner">
                <el-switch v-model="goodsForm.isBanner" active-color="#13ce66"></el-switch>
              </el-form-item>
              <el-form-item label="是否推荐商品" prop="recommend">
                <el-switch v-model="goodsForm.recommend" active-color="#13ce66"></el-switch>
              </el-form-item>
              <el-form-item label="是否上架商品" prop="shelves">
                <el-switch v-model="goodsForm.shelves" active-color="#13ce66"></el-switch>
              </el-form-item>
<!--              <el-form-item>-->
<!--                <el-button v-show="title != '详情'" type="primary"-->
<!--                           @click="submitForm(ruleForm)">保存</el-button>-->
<!--                <el-button v-show="title != '详情'" @click="resetForm(ruleForm)">重置</el-button>-->
<!--                <el-button @click="goGoodsList()" type="info" plain>取消</el-button>-->
<!--              </el-form-item>-->
            </el-form>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { reactive, ref } from 'vue';
import GoodsTree from './GoodsTree.vue';
import GoodsUpload from './GoodsUpload.vue';

const goodsForm = reactive({
  cid: '',
  category: '',//分类
  title: '',//名称
  price: '',
  num: '',
  sellPoint: '',
  image: [],
  descs: '',
  isBanner: true,//轮推荐
  recommend: true,//推荐
  shelves: true,//商品上架
});

const fileList = ref([]);

const goods = reactive({});

const rules = reactive({
  category: [
    { required: true, message: '请输入商品类目' }
  ],
  title: [
    { required: true, message: '请输入商品名称', trigger: 'blur' },
    { min: 2, max: 10, message: '长度在 2 到 10 个字符', trigger: 'blur' }
  ],
  price: [
    { required: true, message: '请输入商品价格', trigger: 'blur' }
  ],
  num: [
    { required: true, message: '请输入商品数量', trigger: 'blur' }
  ],
  date1: [
    { type: 'date', required: true, message: '请选择日期', trigger: 'change' }
  ],
  date2: [
    { type: 'date', required: true, message: '请选择时间', trigger: 'change' }
  ],
})

const changeTree = (node) => {
  console.log('click-node', node)
  goodsForm.cid = node.cid;
  goodsForm.category = node.name;
}

const sendImage = (imgPath) => {
  goodsForm.image.push(imgPath)
}

</script>

<style lang="less" scoped>
.addGoods {
  margin: 10px;
  // background: #fff;
  padding: 10px;
}

.menu {
  border: 1px solid #eee;
  height: 600px;
  background: #fff;

  .title {
    height: 50px;
    line-height: 50px;
    color: #fff;
    background: skyblue;
    padding-left: 10px;
    font-size: 14px;
  }

  .tree {
    padding: 20px;
  }
}

.content {
  min-height: 800px;
  background: #fff;
  font-size: 14px;

  .subTitle {
    background: #eee;
    color: #000;
    padding: 10px;
    font-weight: bold;
  }

  .wrapper {
    padding: 20px;
  }

  .category {
    color: skyblue;
    font-size: 16px;
  }
}
</style>