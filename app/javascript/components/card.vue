<template>
  <div id="app">
    <ul>
      <li v-for="task in tasks"　class="card">
        {{ task.name }}
      </li>
    </ul>
  </div>
</template>

<script>
  import { getCards } from '../query/getCards.js';

  export default {
    apollo: {
      tasks: {
        query: getCards
      }
    }
  }
</script>

<style>
  .card{
    width: 200px;
    list-style: none;
    border: solid 1px;
    margin: 5px 0;
    cursor: pointer;
  }
</style>
