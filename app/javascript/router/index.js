import Vue from 'vue/dist/vue.esm';
import Router from 'vue-router';

// ルート用のコンポーネントを読み込む
import Lane from '../components/lane';
import Card from '../components/card';

// プラグインとして登録
Vue.use(Router);

const router = new Router({
  mode: 'hash',
  linkActiveClass: 'open active',
  scrollBehavior: () => ({ y: 0 }),
  // URLのパスと紐づくコンポーネントをマッピング
  routes: [
    {
      path: "/lane",
      component: Lane
    },
    {
      path: "/card",
      component: Card
    }
  ]
});

// 生成したVueRouterインスタンスをexport
export default router;
