import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import '@/assets/css/global.css'        // 全局样式
import ElementPlus from 'element-plus'      // element-ui
import 'element-plus/dist/index.css'            // element-ui
import zhCn from 'element-plus/es/locale/lang/zh-cn'      // element-ui-zh-cn


createApp(App).use(store).use(router).use(ElementPlus,{locale: zhCn,}).mount('#app')            //--->.use(elementPlus),

