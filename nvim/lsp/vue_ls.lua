return {
  cmd = { 'vue-language-server', '--stdio' },
  filetypes = { 'vue' },
  init_options = {
    vue = {
      hybridMode = false,
    },
  },
}
