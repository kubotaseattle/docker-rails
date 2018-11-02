<template>
  <div id="app">
    <div class="form">
      <input type="text" v-model="newCard">
      <button v-on:click="addCard(newCard, lane.id)">
        Add
      </button>
    </div>
      <!-- デバッグ用、あとで消す
      <p>lane.id:{{ lane.id }}</p> -->
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
    props: {
      //lanesの要素1つのidとnameを親コンポーネントlaneから取得
      lane: Object
    },
    methods:{
  	// カードの追加
    	addCard: function() {
      	// フォームが空ならカードを追加しない
        if(this.newCard == "") return;
        // importしたcreateCardクエリを投げる
        this.$apollo.mutate({
          mutation: createCard,
          variables: {
            task: {
              name: this.newCard,
              laneId: parseInt(this.lane.id)
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

<style scope>
  .form{
    margin-left: 40px;
  }

</style>
