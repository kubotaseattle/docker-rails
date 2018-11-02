<template>
  <div id="app">
    <!-- v-on:submit.preventでリロード防止 -->
    <form v-on:submit.prevent class="form">
      <input type="text" v-model="newCard">
      <button v-on:click="addCard(lane.id)">
        Add
      </button>
      <!-- デバッグ用、あとで消す
      <p>lane.id:{{ lane.id }}</p> -->
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
    props: {
      //lanesの1つの要素のidとnameを親コンポーネントlaneから取得
      lane: Object
    },
    methods:{
  	// カードの追加
    	addCard: function() {
      	// フォームが空ならカードを追加しない
        if(this.newCard == "") return;
        console.log(this.lane.id);
        // importしたaddCardクエリを投げる
        this.$apollo.mutate({
          mutation: createCard,
          variables: {
            task: {
              name: this.newCard,
              // laneIdの情報を受け取る
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
