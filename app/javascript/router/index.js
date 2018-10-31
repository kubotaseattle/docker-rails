import Vue from 'vue/dist/vue.esm';
import Router from 'vue-router';

// ルート用のコンポーネントを読み込む
import Lane from '../components/lane';
import Card from '../components/card';
import AddCard from '../components/addCard';

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
      component: Lane,
      children: [
        {
          path: "/card",
          component: Card
        },
        {
          path: "/addcard",
          component: AddCard
        }
      ]
    }
  ]
});

// 生成したVueRouterインスタンスをexport
export default router;
