<template>
  <ul>
    <li v-for="task in tasks"　class="card">
      {{ task.name }}
    </li>
  </ul>
</template>

<script>
  import gql from 'graphql-tag';

  // tasksテーブルのnameカラムを取得するクエリを定義
  const selectTasks = gql `
    {
      tasks{
        name
      }
    }
  `;

  // ページ遷移時、クエリを投げてtasksに格納しているつもり
  export default {
    apollo: {
      tasks:{
        query: selectTasks
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
