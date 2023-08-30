<template>
  <el-menu
      :default-active="route.path"
      class="el-menu-vertical"
      :collapse="isClose"
      background-color="#112f50"
      text-color="#fff"
      active-text-color="#ffd04b"
      router
  >
    <el-menu-item>
      <template #title>
        <span>采购系统</span>
      </template>
    </el-menu-item>
    <el-menu-item index="/">
      <el-icon>
        <Briefcase />
      </el-icon>
      <span>系统首页</span>
    </el-menu-item>
    <el-sub-menu index="/goods">
      <template #title>
        <el-icon>
          <Grid />
        </el-icon>
        <span>产品管理</span>
      </template>
      <el-menu-item-group>
        <el-menu-item index="/goods/list">
          <span>产品列表</span>
        </el-menu-item>
        <el-menu-item index="/goods/category">
          <span>产品分类</span>
        </el-menu-item>
      </el-menu-item-group>
    </el-sub-menu>
  </el-menu>
</template>

<script>
import { useRoute } from 'vue-router';
export default {
  props: ['isClose'],
  setup() {

    const route = useRoute();

    return {
      route,
    }
  },
}

</script>

<style lang="less">
.el-menu-vertical:not(.el-menu--collapse) {
  width: 200px;
  min-height: 400px;
}

.el-menu {
  border-right: none;
}

//.active {
//  width: 68px;
//}

</style>