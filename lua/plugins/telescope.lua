require('telescope').setup {
  defaults = {
    file_ignore_patterns = { "node_modules", "rgignore", ".ignore" }
  },
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg", "webp", "pdf" }
    }
  }
}
