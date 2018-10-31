<template>
  <div id="app">
    <form v-on:submit.prevent>
      <input type="text" v-model="newCard">
      <button v-on:click="addCard">
        Add
      </button>
    </form>
  </div>
</template>

<script>
  import { addCard } from '../query/addCard.js';

  export default{
    data:function(){
      return{
        newCard:"",
      }
    },
    methods:{
  	// カードの追加
    	addCard: function(evt) {
      	// フォームが空ならカードを追加しない
        if(this.newCard == "") return;
        // importしたaddCardクエリを投げる
        this.$apollo.mutate({
          mutation: addCard
        }),
        // フォームを空にする
        this.newCard = "";
      }
    }
  }
</script>
