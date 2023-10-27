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
    km('niv', '<M-b>', ''),
    km('niv', '<M-B>', ''),
    -- Copy (If not selected, copy line)
    km('n', '<M-c>', 'yyi'),
    km('i', '<M-c>', '<C-o>yy'),
    km('v', '<M-c>', 'ygv<ESC>'),
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
    km('niv', '<M-F>', '<cmd>Telescope live_grep<CR>'),
    -- Go to line
    km('n', '<M-g>', ':'),
    km('i', '<M-g>', '<C-o>:'),
    km('v', '<M-g>', ':'),
    -- Move left
    km('n', '<M-h>', 'hi'),
    km('i', '<M-h>', '<LEFT>'),
    km('v', '<M-h>', '<ESC>hi'),
    -- Backspace
    km('ni', '<C-M-h>', '<C-o>dh'),
    km('v', '<C-M-h>', 'di'),
    -- Select left
    km('n', '<M-H>', 'hv'),
    km('i', '<M-H>', '<ESC>v'),
    km('v', '<M-H>', 'h'),
    -- Move to word end
    km('n', '<M-i>', 'ea'),
    km('i', '<M-i>', '<C-o>ea'),
    km('v', '<M-i>', '<ESC>ea'),
    -- Select to word end
    km('n', '<M-I>', 've'),
    km('i', '<M-I>', '<ESC>lve'),
    km('v', '<M-I>', 'e'),
    -- Move down
    km('n', '<M-j>', 'ji'),
    km('i', '<M-j>', '<DOWN>'),
    km('v', '<M-j>', '<ESC>ji'),
    -- Select down
    km('n', '<M-J>', 'vj'),
    km('i', '<M-J>', '<ESC>vlolj'),
    km('v', '<M-J>', 'j'),
    -- Join lines
    km('n', '<C-M-j>', 'JA'),
    km('iv', '<C-M-j>', '<ESC>JA'),
    -- Move up
    km('n', '<M-k>', 'ki'),
    km('i', '<M-k>', '<UP>'),
    km('v', '<M-k>', '<ESC>ki'),
    -- Select up
    km('n', '<M-K>', 'hvkl'),
    km('i', '<M-K>', '<ESC>vkl'),
    km('v', '<M-K>', 'k'),
    -- Move right
    km('n', '<M-l>', 'a'),
    km('i', '<M-l>', '<RIGHT>'),
    km('v', '<M-l>', '<ESC>a'),
    -- Select right
    km('n', '<M-L>', 'lv'),
    km('i', '<M-L>', '<ESC>vlol'),
    km('v', '<M-L>', 'l'),
    -- Move to the end of line
    km('n', '<M-o>', 'A'),
    km('i', '<M-o>', '<END>'),
    km('v', '<M-o>', '<ESC>A'),
    -- Select to the end of line
    km('n', '<M-O>', 'v$'),
    km('i', '<M-O>', '<ESC>v$'),
    km('v', '<M-O>', '$'),
    -- Open file palette
    km('niv', '<M-p>', '<cmd>Telescope find_files<CR>'),
    -- Command palette
    km('n', '<M-P>', '<cmd>Telescope commands<CR>'),
    -- Close current buffer
    km('niv', '<M-q>', '<cmd>bd<CR>'),
    -- Close all buffers
    km('niv', '<M-Q>', '<cmd>bufdo bd<CR>'),
    -- Replace
    km('nv', '<M-r>', ':%s/'),
    km('i', '<M-r>', '<C-o>:%s/'),
    -- Replace in project: Unsupported
    km('niv', '<M-R>', ''),
    -- Save
    km('niv', '<M-s>', '<cmd>w<CR>'),
    -- Save as
    km('n', '<M-S>', ':w '),
    km('i', '<M-S>', '<C-o>:w '),
    km('v', '<M-S>', '<ESC>:w '),
    -- Move to word start
    km('n', '<M-u>', 'bi'),
    km('i', '<M-u>', '<C-o>bi'),
    km('v', '<M-u>', '<ESC>bi'),
    -- Select to word start
    km('n', '<M-U>', 'vb'),
    km('i', '<M-U>', '<ESC>vb'),
    km('v', '<M-U>', 'b'), 
    -- Paste
    km('n', '<M-v>', 'pi'),
    km('i', '<M-v>', '<LEFT><C-o>p'),
    km('v', '<M-v>', 'pi'),
    -- Cut
    km('n', '<M-x>', 'dd'),
    km('i', '<M-x>', '<C-o>dd'),
    km('v', '<M-x>', 'd'),
    -- Move to the beginning of line
    km('n', '<M-y>', 'I'),
    km('i', '<M-y>', '<C-o>I'),
    km('v', '<M-y>', '<ESC>I'),
    -- Select to the beginning of line
    km('n', '<M-Y>', 'v^'),
    km('i', '<M-Y>', '<ESC>v^'),
    km('v', '<M-Y>', '^'),
    -- Undo
    km('niv', '<M-z>', '<cmd>undo<CR>'),
    -- Redo
    km('niv', '<M-Z>', '<cmd>redo<CR>'),
    -- Half page up
    km('n', '<M-,>', '<C-u>'),
    km('i', '<M-,>', '<C-o><C-u>'),
    km('v', '<M-,>', '<ESC><C-u>'),
    -- Select half page up
    km('n', '<M-<>', 'v<C-u>'),
    km('i', '<M-<>', '<ESC>v<C-u>'),
    km('v', '<M-<>', '<C-u>'),
    -- Half page down
    km('n', '<M-.>', '<C-d>'),
    km('i', '<M-.>', '<C-o><C-d>'),
    km('v', '<M-.>', '<ESC><C-d>'),
    -- Select half page down
    km('n', '<M->>', 'v<C-d>'),
    km('i', '<M->>', '<ESC>v<C-d>'),
    km('v', '<M->>', '<C-d>'),
    -- Move to the beginning of file
    km('n', '<M-/>', 'ggI'),
    km('iv', '<M-/>', '<ESC>ggI'),
    -- Move to the end of file
    km('n', '<M-?>', 'GA'),
    km('iv', '<M-?>', '<ESC>GA'),
    -- Toggle terminal: Unsupported
    km('niv', '<M-\'>', ''),
    -- Toggle terminal fullscreen: Unsupported
    km('niv', '<M-\">', ''),
    -- Left pane: Unsupported
    km('niv', '<M-\\>', ''),
    -- Zen mode
    km('niv', '<M-|>', '<cmd>ZenMode<CR>'),
    -- Delete word
    km('n', '<M-BS>', 'hdawi'),
    km('i', '<M-BS>', '<C-o>h<C-o>daw'),
    km('v', '<M-BS>', 'di'),
    --- non-alty keys
    km('n', '<BS>', 'dhi'),
    km('v', '<BS>', 'd'),
  }
  for _, v in ipairs(keymaps) do
    vim.keymap.set(v.mode, v.key, v.cmd, v.opt)
  end
end

return {
  setup = setup,
}
