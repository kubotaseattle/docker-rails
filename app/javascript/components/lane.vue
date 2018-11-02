<template>
  <div id="app">
    <!-- <div class="collection"> -->
      <ul>
        <li v-for="lane in lanes"　class="lane">
          {{ lane.name }}
          <card v-bind:lane="lane"/>
          <addcard/>
          <!-- <router-link to="/card">cardコンポーネント</router-link>
          <router-link to="/addcard">addcardコンポーネント</router-link> -->
          <!-- <router-view /> -->
        </li>
      </ul>
    <!-- </div> -->
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

<style scope>
  .lane{
    float: left;
    list-style: none;
  }

</style>
