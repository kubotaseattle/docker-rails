<template>
  <div id="app">
    <ul v-for="task in tasks"　class="card">
      <div v-if="task.laneId === Number(lane.id)">
        <li>
          {{ task.name }}
          <!-- 【task:{{ task }}】<br>
          【lane:{{ lane }}】<br>
          【task.id:{{ task.laneId }}】<br>
          【lane.id:{{ lane.id }}】 -->
        </li>
      </div>
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
    props: {
      lane: Object
    }
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
