<template>

<form v-on:submit.prevent>
  <input type="text" placeholder="Todo..." v-model="newTodo">
  <button v-on:click="addTodo">
    Add
  </button>
</form>
<template>
