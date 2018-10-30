<template>
  <div>
    <h1>Tasks</h1>
    <router-link to="/lane">laneコンポーネント</router-link>
    <router-link to="/card">cardコンポーネント</router-link>
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
