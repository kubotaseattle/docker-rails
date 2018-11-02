<template>
  <div id="app">
    <ul>
      <li v-for="lane in lanes"　class="lane">
        {{ lane.name }}
        <card v-bind:lane="lane"/>
        <addcard v-bind:lane="lane"/>
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

<style scope>
  .lane{
    float: left;
    list-style: none;
  }

</style>
