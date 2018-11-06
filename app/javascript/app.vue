<template>
  <div>
    <h1>Tasks</h1>
    <addLane/>
    <lane/>
  </div>
</template>

<script>
  import addLane from './components/addLane';
  import lane from './components/lane';

  export default {
    name: 'App',
    components: {
      addLane,
      lane
    }
  }
</script>

<style>
</style>
