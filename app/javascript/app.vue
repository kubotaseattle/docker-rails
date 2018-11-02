<template>
  <div>
    <h1>Tasks</h1>
    <lane/>
    <!-- <router-link to="/lane">
      laneコンポーネント
    </router-link> -->
    <!-- <router-link to="/card">cardコンポーネント</router-link> -->
    <!-- <router-view/> -->
  </div>
</template>

<script>
  import lane from './components/lane';

  export default {
    name: 'App',
    components: {
      lane
    }
  }
</script>

<style>
</style>
