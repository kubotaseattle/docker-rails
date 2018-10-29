
<template>
  <div id="app">
    <h2>Tasks</h2>
    <div class="container">
      <ul class="collection">
        <h3>Todo</h3>
        <!-- タスクの移動　ドラッグ&ドロップ -->
        <draggable :list="unfinishedTasks"
                   :options="{group:'tasks'}">
          <li v-for="task in unfinishedTasks" class="collection-item">
            {{task.name}}
          </li>
        </draggable>
        <!-- タスクの追加 -->
        <form v-on:submit.prevent>
          <input type="text" placeholder="Todo..." v-model="newTodo">
          <button v-on:click="addTodo">
            Add
          </button>
        </form>
      </ul>
      <ul class="collection">
        <h3>Done</h3>
        <!-- タスクの移動　ドラッグ&ドロップ -->
        <draggable :list="finishedTasks"
                   :options="{group:'tasks'}">
          <li v-for="task in finishedTasks" class="collection-item">
            {{task.name}}
          </li>
        </draggable>
        <!-- タスクの追加 -->
        <form v-on:submit.prevent>
          <input type="text" placeholder="Done..." v-model="newDone">
          <button v-on:click="addDone">
            Add
          </button>
        </form>
      </ul>
    </div>
  </div>
</template>

<script>
import draggable from 'vuedraggable';

export default{
  components: {
    draggable,
  },
  data:function(){
    return{
      newTodo: "",
      newDone: "",
    	// タスクの初期値
      unfinishedTasks:[
        {name:"Meeting"},
        {name:"Create a document"}
      ],
      finishedTasks:[
        {name:"Yesterday Meeting"},
        {name:"Yesterday Appointment"}
      ]
    }
  },
    methods:{
      // 表示するタスクの取得
      fetchTasks(){
        this.$apollo.mutate({
          // USER_SIGNINは、app/javascript/query/authUser.js で定義
          // selectなのでmutaionではなくqueryかも
          mutation: SELECT_TASK
        })
      },
    	// Todoタスクの追加
    	addTodo: function(evt) {
      	// フォームが空ならタスクを追加しない
        if(this.newTodo == "") return;
        var unfinishedTask = {
        	name: this.newTodo
        };
        // 配列unfinishedTasksに追加
        this.unfinishedTasks.push(unfinishedTask);
        // フォームを空にする
        this.newTodo = "";
      },
      //Doneタスクの追加
      addDone: function(evt) {
        if(this.newDone == "") return;
        var finishedTask = {
        	name: this.newDone
        };
        this.finishedTasks.push(finishedTask);
        this.newDone = "";
      }
    }
  }
</script>

<style scoped>
  ul.collection{
    float: left;
  }

  li.collection-item{
    width: 200px;
    list-style: none;
    border: solid 1px;
    margin: 5px 0;
    cursor: pointer;
  }
</style>
