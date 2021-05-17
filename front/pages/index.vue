<template>
  <div class="container">
    <div v-for='post in posts' :key=post.id>
      <div>{{post.updated_at}}</div>
      <nuxt-link :to="`/times/${post.id}`">詳細確認ボタン</nuxt-link>
      <div @click='updateTime(post.id)'>更新ボタン</div>
      <div @click='deleteTime(post.id)'>削除ボタン</div>
    </div>
    <div @click='createTime' style='margin-top: 100px;'>
      新しく作成する
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      posts: null,
      time: null
    }
  },
  async fetch() {
    const { data } = await this.$axios.get('/api/post_times')
    this.posts = data
  },
  methods: {
    async createTime() {
      await this.$axios.post('/api/post_times', {
        time: new Date()
      })
    },
    async updateTime(id) {
      await this.$axios.patch(`/api/post_times/${id}`, {
        time: new Date()
      })
    },
    async deleteTime(id) {
      await this.$axios.delete(`/api/post_times/${id}`, {
        id: this.id
      })
    }
  }
}
</script>

<style>
.container {
  margin: 0 auto;
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  flex-direction: column;
}

.title {
  font-family:
    'Quicksand',
    'Source Sans Pro',
    -apple-system,
    BlinkMacSystemFont,
    'Segoe UI',
    Roboto,
    'Helvetica Neue',
    Arial,
    sans-serif;
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>
