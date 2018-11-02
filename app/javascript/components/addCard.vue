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
  import { createCard } from '../query/createCard.js';

  export default{
    data(){
      return{
        newCard:"",
      }
    },
    methods:{
  	// カードの追加
    	addCard: function() {
      	// フォームが空ならカードを追加しない
        if(this.newCard == "") return;
        console.log(this.newCard);
        // importしたaddCardクエリを投げる
        this.$apollo.mutate({
          mutation: createCard,
          variables: {
            task: {
              name: this.newCard,
              // laneの情報を渡さないといけない
              laneId: 1
            }
          }
        }).then(() => {
          // フォームを空にする
          this.newCard = "";
          // リロードせずに追加したカードをページに反映させたかったが、失敗
          // this.$emit('refresh')
        })
      }
    }
  }
</script>
