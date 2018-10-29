import Vue from 'vue/dist/vue.esm.js'
import App from './app.vue'

// apollo
import { ApolloClient } from 'apollo-client'
import { HttpLink } from 'apollo-link-http'
import { InMemoryCache } from 'apollo-cache-inmemory'
import VueApollo from 'vue-apollo'

import gql from 'graphql-tag'

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

// Install the vue plugin
Vue.use(VueApollo)

// クエリの定義
const selectTasks = gql `
  {
  	tasks{
      name
    }
  }
`;

new Vue({
  el: '#app',
  provide: apolloProvider.provide(),
  components: { App },
  // router,
  // store,
  template: '<App/>'
})
