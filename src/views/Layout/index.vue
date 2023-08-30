<template>
  <div class="menu">
    <Menu :isClose="isClose"></Menu>
  </div>
  <div class="content" :data-is-close="isClose">
    <Content
        :isClose="isClose"
        @change="change"
    >
    </Content>
  </div>
</template>

<script>
import { ref } from 'vue';
import Menu from './Menu.vue';
import Content from './Content.vue';


export default {
  components: {
    Menu,
    Content
  },
  setup() {
    let isClose = ref(false);
    const change = () => {
      isClose.value = !isClose.value
    };

    return {
      isClose,
      change
    }
  },
}
</script>

<style lang="less">
.menu {
  position: fixed;
  left: 0;
  top: 0;
  bottom: 0;
  background: #112f50;
}


.active {
  padding-left: 64px;
}

.content {
  padding-left: 200px;
}

.content[data-is-close="true"] {
  padding-left: 64px;
  transition: padding-left 0.3s;
}

</style>