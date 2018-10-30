<template>
  <div>
    <p>testtesttest</p>
    <!-- <router-link to="/card">cardコンポーネントの中身表示したい</router-link> -->
    <router-view/>
  </div>
</template>

<script>
  import card from './components/card';

  export default {
    name: 'App'
  }
</script>

<style>
</style>
