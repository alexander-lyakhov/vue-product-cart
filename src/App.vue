<template>
  <div>
    <v-header></v-header>
    <grid></grid>
  </div>
</template>

<script>
  import '@/styles/reset.css'
  import '@/styles/index.scss'

  import header from '@/components/header';
  import grid from '@/components/grid';

  export default {
    name: 'App',
    components: {
      'v-header': header,
      grid
    },
  }
</script>
