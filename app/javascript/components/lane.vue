<template>
  <div id="app">
    <ul>
      <li v-for="lane in lanes"　class="">
        {{ lane.name }}
      </li>
    </ul>
  </div>
</template>

<script>
  import { getLanes } from '../query/getLanes.js';

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
