<template>
  <el-pagination
      :current-page="currentPage"
      :page-size="props.pageSize"
      layout="total, prev, pager, next, jumper"
      :total="props.total"
      @current-change="handleCurrentChange"
  />
</template>

<script setup>

import { ref } from 'vue'

const props = defineProps(['total', 'pageSize'])

const emit = defineEmits(['getCurrentPage'])

const currentPage = ref(1)

const handleCurrentChange = (val) => {
  currentPage.value = val;
  emit('getCurrentPage', val)
}

</script>

<style>

</style>