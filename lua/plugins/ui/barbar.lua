-- Set barbar's options
vim.g.bufferline = {
  animation = true,
  auto_hide = false,
  tabpages = true,
  closable = false,
  clickable = true,
  icons = true,
  icon_custom_colors = false,
  -- Configure icons on the bufferline.
  icon_separator_active = '▎',
  icon_separator_inactive = '▎',
  -- icon_close_tab = '',
  icon_close_tab_modified = '●',
  icon_pinned = '車',
  -- If true, new buffers will be inserted at the end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,
  -- Sets the maximum buffer name length.
  maximum_length = 30,

  semantic_letters = true,
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}
