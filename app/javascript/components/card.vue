<template>
  <div id="app">
    <ul v-for="task in tasks">
      <draggable>
        <div v-if="task.laneId === Number(lane.id)">
          <li class="card">
            {{ task.name }}
            <!-- 【task:{{ task }}】<br>
            【lane:{{ lane }}】<br>
            【task.id:{{ task.laneId }}】<br>
            【lane.id:{{ lane.id }}】 -->
          </li>
        </div>
      </draggable>
    </ul>
  </div>
</template>

<script>
  import draggable from 'vuedraggable';
  import { getCards } from '../query/getCards.js';

  export default {
    components: {
      draggable
    },
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
    width: 150px;
    list-style: none;
    border: solid 1px;
    margin: 5px 0;
    cursor: pointer;
  }
</style>
