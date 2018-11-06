<template>
  <div id="app">
    <ul v-for="task in tasks">
      <draggable :options="{group:'tasks'}"
                  class="drag-drop-area"
                  v-bind:data-cat="task.laneId"
                  v-on:end="onEnd(task.id,$event)">
        <div v-show="task.laneId === Number(lane.id)">
          <li class="card">
            {{ task.name }}
            <!-- <deleteCard/> -->
          </li>
        </div>
      </draggable>
    </ul>
  </div>
</template>

<script>
  import draggable from 'vuedraggable';
  // import deleteCard from './deleteCard';
  import { getCards } from '../query/getCards.js';
  import { updateCardLaneid } from '../query/updateCardLaneid.js';

  export default {
    components: {
      draggable,
      // deleteCard
    },
    apollo: {
      // tasksにimportしたgetCardsクエリに対する回答を格納
      tasks: {
        query: getCards
      }
    },
    props: {
      //lanesの要素1つのidとnameを親コンポーネントlaneから取得
      lane: Object
    },
    methods: {
      // onChange: function(evt, originalEvent) {
      //
      //   Dragしたタスクを対象タスクとして扱う。
      //   this.$parent.targetTask = evt.draggedContext.element;
      //   console.log(this.$parent.targetTask);
      // },
      onEnd: function(id,evt) {
        alert(evt.to.getAttribute("data-cat"));
        this.$apollo.mutate({
          mutation: updateCardLaneid,
          variables: {
            task: {
              //移動するカードのidを渡す
              // id: parseInt(this.task.id),
              id: parseInt(id),
              //着地先のlaneIdを渡す
              laneId: evt.to.getAttribute("data-cat")
            }
          }
        })
      }
    }
  }
</script>

<style scoped>
  .card{
    width: 100px;
    list-style: none;
    border: solid 1px;
    margin: 5px 0;
    cursor: pointer;
  }

  /* 空レーンにカードを移動する領域の作成 */
  .drag-drop-area{
    min-height: 1px;
  }
</style>
