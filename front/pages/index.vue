<template>
  <div class="container">
    <div v-for='task in tasks' :key=task.id>
      <div>{{task.name}}</div>
      <div @click='createTask'>詳細確認ボタン</div>
      <div @click='updateTask(task.id)'>更新ボタン</div>
      <div @click='deleteTask(task.id)'>削除ボタン</div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tasks: null,
      id: null,
      name: null,
      is_done: null,
      time: null
    }
  },
  async fetch() {
    const { data } = await this.$axios.get('/api/tasks')
    this.tasks = data
  },
  methods: {
    async createTask() {
      await this.$axios.post('/api/task', {
        name: 'hoge',
        is_done: true,
        time: new Date()
      })
    },
    async updateTask() {
      await this.$axios.patch('/api/task', {
        name: 'hoge',
        is_done: false,
        time: new Date()
      })
    },
    async deleteTask() {
      await this.$axios.delete('/api/task', {
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
