import { createRouter, createWebHistory } from 'vue-router'
import Layout from '@/views/Layout';
import Login from '@/views/Login';
import Home from '@/views/Home';


const Goods =  () => import('@/views/Goods');
const GoodsList = () => import('@/views/Goods/GoodsList.vue');
const Category = () => import ('@/views/Goods/GoodsCategory.vue');
const AddGoods = () => import('@/views/Goods/AddGoods.vue');

const routes = [
  {
    path: '/',
    component: Layout,
    children: [
      {
        path: '/',
        name: 'home',
        component: Home,
      },
      {
        path: '/goods',
        component: Goods,
        children: [
          {
            path: 'list',
            name: 'list',
            component: GoodsList,
          },
          {
            path: 'category',
            name: 'category',
            component: Category,
          },
          {
            path: 'addgoods',
            name: 'addgoods',
            component: AddGoods,
          }
        ]
      }
    ],
  },
  {
    path: '/login',
    name: 'login',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: Login
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
