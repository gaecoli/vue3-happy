<template>
  <el-tree :props="props" :load="loadNode" lazy show-checkbox @node-click="clickTree" />
</template>

<script setup>
import { defineEmits } from 'vue';
import api from '@/api'

const emit = defineEmits(['changeTree'])

const props = {
  label: 'name',
  children: 'zones',
  isLeaf: 'leaf',
};

const getGoodsCategory = async (type) => {
  const res = await api.goodsItemCategory({ type });
  if (res.data.status === 200) {
    return res.data.result;
  } else {
    return [];
  }
}

const loadNode = async (node, resolve) => {
  if (node.level === 0) {
    let result = await getGoodsCategory(1)
    return resolve(result)
  }
  if (node.level >= 1) {
    let result = await getGoodsCategory(node.data.cid);
    return resolve(result);
  }
}

const clickTree = (data) => {
  emit('changeTree', data);
}

</script>

<style>

</style>