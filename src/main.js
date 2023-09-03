import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import echarts from "@/plugins/echarts"
// import locale from 'element-plus/lib/locale/lang/zh-cn';
// import ElementPlus from 'element-plus';


import 'normalize.css'
import './assets/css/base.css'

const app = createApp(App);

for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
    app.component(key, component)
}

// app.config.globalProperties.$echarts = echarts;
app.provide('echarts', echarts)


// app.use(ElementPlus, {locale})
app.use(router).mount('#app')
