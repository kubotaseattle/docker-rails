<template>
  <div id="app">
    <ul>
      <li v-for="lane in lanes"　class="">
        {{ lane.name }}
        <!-- <router-link to="/card">
          cardコンポーネント
        </router-link> -->
        <router-view/>
      </li>
    </ul>
  </div>
</template>

<script>
  import { getLanes } from '../query/getLanes.js';
  import card from './card';

  export default {
    apollo: {
      lanes: {
        query: getLanes
      }
    }
  }
</script>

<style>
</style>
