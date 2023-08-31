<template>
  <div class="home">
    <!--1.  顶部区域布局---------- -->
    <div class="header">
      <div class="item">
        总销售额
        <div class='num'>{{homeInfo.saleTotal}}</div>
        <div class="bottom">今日销售额：{{homeInfo.sale}}</div>
      </div>
      <div class="item">访问量
        <div class='num'>{{homeInfo.viewsTotal}}</div>
        <div class="bottom">今日访问量：{{homeInfo.views}}</div>
      </div>
      <div class="item">收藏量
        <div class='num'>{{homeInfo.collectTotal}}</div>
        <div class="bottom">今日收藏量：{{homeInfo.collect}}</div>
      </div>
      <div class="item">支付量
        <div class='num'>{{homeInfo.payTotal}}</div>
        <div class="bottom">今日支付量：{{homeInfo.pay}}</div>
      </div>
    </div>

    <!--2. 访问数据统计 ----------------->
    <div class="content">
      <div class="time-info" id='box13'>
        <div class="title">月销售额</div>
        <div id="charts" style="width: 100%; height: 300px"></div>
      </div>
      <div class="area" id="box1">比例分配</div>
    </div>


    <!-- 3.  -->
    <!-- 最新内容 -->
    <div class="home-footer">
      <el-card class="box-card">
        <template #header>
          <div class="card-header">
            <span>今日订单</span>
          </div>
        </template>
        <div class="text item">
          <el-row>
            <el-col :span="8">
              <div>111</div>
            </el-col>
            <el-col :span="8">
              <div>222</div>
            </el-col>
            <el-col :span="8">
              <div>333</div>
            </el-col>
          </el-row>
        </div>
      </el-card>
      <el-card class="box-card">
        <template #header>
          <div class="card-header">
            <span>本月订单</span>
          </div>
        </template>
        <div class="text item">
          <el-row>
            <el-col :span="8">
              <div>111</div>
            </el-col>
            <el-col :span="8">
              <div>222</div>
            </el-col>
            <el-col :span="8">
              <div>333</div>
            </el-col>
          </el-row>
        </div>
      </el-card>
      <el-card class="box-card">
        <template #header>
          <div class="card-header">
            <span>快捷入口</span>
          </div>
        </template>
        <div class="text item">
          <el-button type="primary">产品管理</el-button>
          <el-button>消息管理</el-button>
          <el-button>内容管理</el-button>
        </div>
      </el-card>
    </div>

  </div>
</template>

<script>
import { ref } from 'vue'
import api from '@/api/index'
export default {
  setup() {

    let homeInfo = ref({});
    // method 2
    // let homeInfo = reactive({ data: {} })

    api.getHomeCount().then(res => {
      homeInfo.value = res.data.data.list
      // homeInfo.data = res.data.data.list
    })


    return {
      homeInfo
    }
  }
}
</script>

<style lang="less" scoped>
.home {
  margin: 10px;
}

.header {
  display: flex;
  padding-right: 30px;

  .item {
    flex: 1;
    height: 100px;
    padding: 10px;
    background: #fff;
    border-radius: 10px;
    margin-left: 20px;
    margin-right: 20px;
    font-weight: bold;
    color: #fff;
    // text-align: center;
    position: relative;

    .num {
      font-size: 22px;
      margin: 10px;
      color: #fff;
    }

    .bottom {
      position: absolute;
      border-top: 1px solid rgb(246, 245, 245);
      padding: 10px 20px;
      bottom: 0;
      right: 0;
      left: 0;
      color: #fff;
      font-weight: normal;
    }
  }

  .item:nth-child(1) {
    background-image: linear-gradient(#df887d, #88554d);
  }

  .item:nth-child(2) {
    background-image: linear-gradient(#409eff, #2e556e);
  }

  .item:nth-child(3) {
    background-image: linear-gradient(#b54fa8, #713c7a);
  }

  .item:nth-child(4) {
    background-image: linear-gradient(#1cd2f1, #39717a);
  }
}

// 图表

.content {
  margin: 20px;
  display: flex;
  height: 320px;

  .time-info {
    flex: 2;
    background: #fff;
    margin-right: 20px;
    padding: 10px;
  }

  .area {
    flex: 1;
    background: #fff;
    padding: 10px;
  }
}

//内容

.home-footer {
  display: flex;
  padding-left: 20px;
  margin-bottom: 20px;

  .box-card {
    flex: 1;
    margin-right: 30px;

    span {
      font-weight: 600;
    }
  }
}
</style>