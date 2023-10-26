local setup = function()
  local silent = {silent = true}
  local function split_mode(mode)
    local t = {}
    for i = 1, #mode do
      table.insert(t, string.sub(mode, i, i))
    end
    return t
  end
  local function km(mode, key, cmd, opt)
    return {
      mode = split_mode(mode),
      key = key,
      cmd = cmd,
      opt = opt or silent
    }
  end
  keymaps = {
    -- Select line
    km('n', '<M-a>', 'V'),
    km('i', '<M-a>', '<C-o>V'),
    km('v', '<M-a>', '<Esc>V'),
    -- Select all
    km('n', '<M-A>', 'ggVG'),
    km('i', '<M-A>', '<C-o>gg<C-o>VG'),
    km('v', '<M-A>', '<Esc>ggVG'),
    -- Multiple cursors for words: Unsupported
    -- Copy (If not selected, copy line)
    km('n', '<M-c>', 'yyi'),
    km('i', '<M-c>', '<C-o>yy'),
    km('v', '<M-c>', 'ya'),
    -- Delete a character
    km('n', '<M-d>', 'xi'),
    km('i', '<M-d>', '<C-o>x'),
    km('v', '<M-d>', 'xi'),
    -- Delete a word
    km('n', '<M-D>', 'dwi'),
    km('i', '<M-D>', '<C-o>dw'),
    km('v', '<M-D>', 'di'),
    -- Find
    km('n', '<M-f>', '/'),
    km('i', '<M-f>', '<C-o>/'),
    km('v', '<M-f>', ':%s/'),
    -- Find in workspace: Live Grep
    km('n', '<M-F>', ':Telescope live_grep<CR>'),
    km('iv', '<M-F>', '<C-o>:Telescope live_grep<CR>'),
    -- Go to line
    km('n', '<M-g>', ':'),
    km('i', '<M-g>', '<C-o>:'),
    km('v', '<M-g>', ':'),
    -- Move left
    km('n', '<M-h>', 'h'),
    km('i', '<M-h>', '<C-o>h'),
    km('v', '<M-h>', 'h'),
    -- Select left
    km('n', '<M-H>', 'hv'),
    km('i', '<M-H>', '<ESC>hv'),
    km('v', '<M-H>', 'h'),
    -- Move down
    km('n', '<M-j>', 'j'),
    km('i', '<M-j>', '<C-o>j'),
    km('v', '<M-j>', 'j'),
    -- Select down
    km('n', '<M-J>', 'vj'),
    km('i', '<M-J>', '<ESC>vj'),
    km('v', '<M-J>', 'j'),
    -- Move up
    km('n', '<M-k>', 'k'),
    km('i', '<M-k>', '<C-o>k'),
    km('v', '<M-k>', 'k'),
    -- Select up
    km('n', '<M-K>', 'hvk'),
    km('i', '<M-K>', '<ESC>hvk'),
    km('v', '<M-K>', 'k'),
    -- Move right
    km('n', '<M-l>', 'l'),
    km('i', '<M-l>', '<C-o>l'),
    km('v', '<M-l>', 'l'),
    -- Select right
    km('n', '<M-L>', 'v'),
    km('i', '<M-L>', '<ESC>v'),
    km('v', '<M-L>', 'l'),
  }
  for _, v in ipairs(keymaps) do
    vim.keymap.set(v.mode, v.key, v.cmd, v.opt)
  end
end

return {
  setup = setup,
}
