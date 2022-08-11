local status, null = pcall(require, "null-ls")
if (not status) then
  print("null is not installed")
  return
end

null.setup({
  sources = {
    null.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
  }
})
