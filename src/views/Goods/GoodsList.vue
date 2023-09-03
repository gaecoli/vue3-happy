<template>
  <div class="goods-header">
    <el-form :inline="true" :model="formInline" class="demo-form-inline">
      <el-form-item label="产品名称">
        <el-input v-model="formInline.name" placeholder="产品名称" clearable />
      </el-form-item>
      <el-form-item label="产品 ID">
        <el-input v-model="formInline.id" placeholder="产品 ID" clearable />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">查询</el-button>
      </el-form-item>
    </el-form>

    <div class="action">
      <el-button :icon="Plus" type="primary" @click="addGoods">添加商品</el-button>
      <el-button :icon="Delete" type="danger" @click="deleteGoods">删除商品</el-button>
    </div>
  </div>

  <div class="goods-content">
    <el-table :data="goodsListData" border style="width: 100%;"
              @selection-change="changeTable">
      <el-table-column type="selection" width="55">
      </el-table-column>
      <el-table-column prop="id" label="商品编号" width="120">
      </el-table-column>
      <el-table-column prop="title" label="商品名称" width="180" show-overflow-tooltip>
      </el-table-column>
      <el-table-column prop="price" label="商品价格" width="120">
      </el-table-column>
      <el-table-column prop="category" label="商品类目" width="140">
      </el-table-column>
      <el-table-column prop="create_time" label="添加时间" width="180" show-overflow-tooltip>
      </el-table-column>
      <el-table-column prop="sellPoint" label="商品卖点" show-overflow-tooltip>
      </el-table-column>
      <el-table-column prop="descs" label="商品描述" show-overflow-tooltip>
      </el-table-column>
      <el-table-column label="操作">
        <template #default="scope">
          <el-button size="small" :icon="EditPen" type="primary"
                     @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
          <el-button size="small" :icon="Delete" type="danger"
                     @click="handleDelete(scope.$index, scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>

  <div class="pagination">
    <Pagination :total="total" :pageSize="pageSize" @getCurrentPage="getCurrentPage"></Pagination>
  </div>
</template>

<script>
import { reactive, ref, onMounted } from 'vue';
import { useRouter } from 'vue-router'
import { Plus, Delete, EditPen } from '@element-plus/icons-vue';
import api from '@/api/index';
import dayjs from "dayjs";
import { removeHTMLTag } from '@/utils/utils'
import Pagination from "@/components/Pagination.vue";
export default {
  components: {
    Pagination
  },
  setup() {
    const formInline = reactive({
      name: '',
      id: '',
    });

    const goodsListData = ref([]);

    const total = ref(0);
    const pageSize = ref(0);

    const searchSplitData = ref([]);

    const router = useRouter();

    const onSubmit = async () => {
      if (formInline.name) {
        const searchResult = await api.getGoodsSearch({ search: formInline.name })

        if (searchResult.data.status === 200) {
          const searchData = searchResult.data.result;
          searchSplitData.value = searchData
          goodsListData.value = searchData;
          total.value = searchData.length;
          pageSize.value = 5;

        } else {
          goodsListData.value = [];
          pageSize.value = 0;
          total.value = 0;
        }
      }
    }

    const changeTable = () => {

    }

    const handleEdit = (index, row) => {

    }

    const handleDelete = (index, row) => {

    }

    const addGoods = () => {
      router.push('/goods/addgoods');
    }

    const deleteGoods = () => {

    }

    const getCurrentPage = (val) => {
      if (searchSplitData.value.length > 0) {
        const startIndex = (val - 1) * pageSize.value;
        const endIndex = startIndex + pageSize.value;
        goodsListData.value = searchSplitData.value.slice(startIndex, endIndex)
      } else {
        getGoodsList(val)
      }
    }

    const getGoodsList = async (page) => {
      let res = await api.getGoodsList({ page });
      let data = res.data.data;
      data.forEach(element => {
        element.create_time = dayjs(element.create_time).format('YYYY-MM-DD HH:mm:ss')
        element.descs = removeHTMLTag(element.descs)
      })
      goodsListData.value = res.data.data;
      total.value = res.data.total;
      pageSize.value = res.data.pageSize
    }

    onMounted(() => {
      getGoodsList(1)
    })



    return {
      Plus,
      Delete,
      EditPen,
      formInline,
      onSubmit,
      goodsListData,
      handleEdit,
      handleDelete,
      changeTable,
      total,
      pageSize,
      getCurrentPage,
      addGoods,
      deleteGoods,
    }
  }
}
</script>

<style lang="less" scoped>

.goods-header {
  border: 1px solid #eee;
  padding: 10px;
  border-radius: 6px;

  .action {
    padding-top: 15px;
  }
}

.el-form-item {
  margin-bottom: 0;
}

.goods-content {
  margin-top: 15px;
}

</style>