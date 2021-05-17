<template>
  <div>
    <div>
      <h1>個別ページ</h1>
      <nuxt-link :to="`/`">戻る</nuxt-link>
    </div>
  
    <div>{{ post }}</div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      post: null,
    }
  },
  async created() {
    const { data } = await this.$axios.get(`/api/post_times/${this.$route.params.id}`)
    console.warn(data)
    this.post = data
  },
}
</script>

<style>
</style>