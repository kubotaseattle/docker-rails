import Vue from 'vue/dist/vue.esm.js'
import App from '../app.vue'

import router from '../router/index';

// apollo
import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import VueApollo from 'vue-apollo'

const httpLink = new HttpLink({
  // You should use an absolute URL here
  uri: 'http://localhost:3000/graphql',
})

// Create the apollo client
const apolloClient = new ApolloClient({
  link: httpLink,
  cache: new InMemoryCache(),
  connectToDevTools: true,
})

const apolloProvider = new VueApollo({
  defaultClient: apolloClient,
})

// vue pluginのインストール
Vue.use(VueApollo)

new Vue({
  el: '#app',
  provide: apolloProvider.provide(),
  components: {
    App
  },
  router,
  // store,
  // render: h => h(App),
  template: '<App/>'
})
