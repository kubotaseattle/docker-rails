<template>
  <div id="app">
    <ul>
      {{ lanes }}
      <li v-for="lane in lanes"　class="">
        {{ lane.name }}{{ lane.id }}
        <router-link to="/card">cardコンポーネント</router-link>
        <router-link to="/addcard">addcardコンポーネント</router-link>
        <router-view />
      </li>
    </ul>
  </div>
</template>

<script>
  import { getLanes } from '../query/getLanes.js';
  import card from './card';
  import addcard from './addCard';

  export default {
    apollo: {
      lanes: {
        query: getLanes
      }
    },
    components: {
      card,
      addcard
    }
  }
</script>

<style>
</style>
