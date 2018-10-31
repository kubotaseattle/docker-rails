<template>
  <div id="app">
    <p>lanes:{{ lanes }}</p>
    <ul>
      <li v-for="task in tasks"　class="card">
        <!-- <div v-show="taks.laneId === lane.id"> -->
          {{ task.name }}
          <b>lane_id{{ task.laneId }}</b>
          <!-- レーンID{{ lane.id }} -->
        <!-- <div> -->
      </li>
    </ul>
  </div>
</template>

<script>
  import { getCards } from '../query/getCards.js';

  export default {
    apollo: {
      // tasksにimportしたgetCardsクエリに対する回答を格納
      tasks: {
        query: getCards
      }
    },
    props: ['lanes']
  }
</script>

<style scoped>
  .card{
    width: 200px;
    list-style: none;
    border: solid 1px;
    margin: 5px 0;
    cursor: pointer;
  }
</style>
