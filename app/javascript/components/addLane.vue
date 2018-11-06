<template>
  <div id="app">
    <div class="form">
      <input type="text" v-model="newLane">
      <button v-on:click="addLane(newLane)">
        Add
      </button>
    </div>
  </div>
</template>

<script>
  import { createLane } from '../query/createLane.js';

  export default{
    data(){
      return{
        newLane:"",
      }
    },
    methods:{
  	// カードの追加
    	addLane: function() {
      	// フォームが空ならカードを追加しない
        if(this.newLane == "") return;
        // importしたcreateLaneクエリを投げる
        this.$apollo.mutate({
          mutation: createLane,
          variables: {
            lane: {
              name: this.newLane
            }
          }
        }).then(() => {
          // フォームを空にする
          this.newLane = "";
        })
      }
    }
  }
</script>
