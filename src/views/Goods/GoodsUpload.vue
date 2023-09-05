<template>
  <el-upload
      :file-list="props.fileList"
      :action="upload"
      list-type="picture-card"
      :on-success="handleUpload"
      :on-remove="handleRemove"
  >
    <el-icon><Plus /></el-icon>
  </el-upload>

  <el-dialog v-model="dialogVisible">
    <img w-full :src="dialogImageUrl" alt="Preview Image" />
  </el-dialog>
</template>

<script setup>
import { ref } from 'vue'
import { host, upload } from '@/api/base'
import { Plus } from '@element-plus/icons-vue'


const props = defineProps(['fileList'])
const emit = defineEmits(['sendImage'])

const dialogImageUrl = ref('')
const dialogVisible = ref(false)

const handleUpload = (response) => {
  const imgUrl = response.url.slice(7);
  const imgPath = host + '/' + imgUrl;
  emit('sendImage', imgPath)
}

const handleRemove = (uploadFile, uploadFiles) => {
  console.log(uploadFile, uploadFiles)

}



</script>

<style lang="less" scoped>

</style>