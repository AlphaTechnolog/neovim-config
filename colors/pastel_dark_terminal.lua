-- pastel_dark_terminal.lua
-- Description: A simple dark theme with pastel colors for terminal palette in Neovim (Lua).
-- Based on a user-provided palette with pastel modifications.

-- Ensure termguicolors is enabled for 24-bit color support
vim.opt.termguicolors = true

-- Clear existing highlights and syntax state
vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax off')
end

-- Set the colorscheme name
vim.g.colors_name = 'pastel_dark_terminal'

-- Define colors from the palette
local colors = {
  bg = '#121212',       -- Background
  fg = '#bfbfbf',       -- Foreground
  cursor = '#666666',   -- Cursor Color
  cursor_text = '#f9f9f9', -- Cursor Text Color
  selection_bg = '#ff8c00', -- Selection Background
  selection_fg = '#121212', -- Selection Foreground

  -- Palette colors (Pastel)
  p0 = '#404040',   -- Dark Grey
  p1 = '#ffadad',   -- Pastel Red
  p2 = '#b3ffb3',   -- Pastel Green
  p3 = '#ffffb3',   -- Pastel Yellow
  p4 = '#cceeff',   -- Pastel Blue
  p5 = '#ffb3ff',   -- Pastel Magenta
  p6 = '#ccffff',   -- Pastel Cyan
  p7 = '#bfbfbf',   -- Light Grey
  p8 = '#808080',   -- Medium Grey
  p9 = '#ffb3e6',   -- Pastel Pink/Red (variation)
  p10 = '#ccffcc',  -- Pastel Green (variation)
  p11 = '#fffacd',  -- Pastel Yellow (variation)
  p12 = '#b3d9ff',  -- Pastel Blue (variation)
  p13 = '#ffccff',  -- Pastel Pink (variation)
  p14 = '#b3ffff',  -- Pastel Cyan (variation)
  p15 = '#f9f9f9',  -- Very Light Grey/White
}

-- Helper function to set highlight groups
local function set_hl(group, fg, bg, style)
  _ = style
  local opts = { fg = fg, bg = bg, style = nil }
  vim.api.nvim_set_hl(0, group, opts)
end

-- --- Basic Highlight Groups ---
set_hl('Normal', colors.fg, colors.bg)
set_hl('Comment', colors.p8, nil, nil)
set_hl('Constant', colors.p1, nil)
set_hl('String', colors.p2, nil)
set_hl('Character', colors.p10, nil)
set_hl('Number', colors.p1, nil)
set_hl('Boolean', colors.p1, nil)
set_hl('Float', colors.p1, nil)
set_hl('Identifier', colors.p4, nil)
set_hl('Function', colors.p4, nil)
set_hl('Statement', colors.p5, nil)
set_hl('Conditional', colors.p5, nil)
set_hl('Repeat', colors.p5, nil)
set_hl('Label', colors.p5, nil)
set_hl('Operator', colors.p6, nil)
set_hl('Keyword', colors.p5, nil)
set_hl('Exception', colors.p5, nil)
set_hl('PreProc', colors.p6, nil)
set_hl('Include', colors.p6, nil)
set_hl('Define', colors.p6, nil)
set_hl('Macro', colors.p6, nil)
set_hl('PreCondit', colors.p6, nil)
set_hl('Type', colors.p3, nil)
set_hl('StorageClass', colors.p3, nil)
set_hl('Structure', colors.p3, nil)
set_hl('Typedef', colors.p3, nil)
set_hl('Special', colors.p14, nil)
set_hl('Underlined', nil, nil, 'underline') -- Use default fg/bg, set underline style
set_hl('Ignore', colors.p0, nil)
set_hl('Error', colors.p1, nil, 'underline')
set_hl('Todo', colors.p3, nil, 'bold')

-- --- Interface Highlight Groups ---
set_hl('LineNr', colors.p8, colors.bg)
set_hl('CursorLineNr', colors.p7, colors.p0, 'bold')
set_hl('CursorLine', nil, colors.p0)
set_hl('CursorColumn', nil, colors.p0)
set_hl('Visual', colors.selection_fg, colors.selection_bg)
set_hl('MatchParen', colors.p11, nil, 'bold,underline')
set_hl('NonText', colors.p0, nil)
set_hl('StatusLine', colors.fg, colors.p0, 'bold')
set_hl('StatusLineNC', colors.p7, colors.p0)
set_hl('VertSplit', colors.p0, colors.p0) -- Often same color for split lines
set_hl('Folded', colors.p8, colors.p0, nil)
set_hl('Title', colors.p4, nil, 'bold')
set_hl('ErrorMsg', colors.p1, nil, 'bold')
set_hl('WarningMsg', colors.p3, nil, 'bold')
set_hl('MoreMsg', colors.p2, nil, 'bold')
set_hl('Question', colors.p2, nil, 'bold')
set_hl('IncSearch', colors.selection_fg, colors.p3)
set_hl('Search', colors.selection_fg, colors.p3)
set_hl('Directory', colors.p4, nil)
set_hl('SignColumn', colors.p8, colors.bg)
set_hl('WildMenu', colors.selection_fg, colors.selection_bg)
set_hl('Pmenu', colors.fg, colors.p0)
set_hl('PmenuSel', colors.selection_fg, colors.selection_bg)

-- --- Links ---
vim.cmd('hi! link ColorColumn CursorLine')
vim.cmd('hi! link FoldColumn SignColumn')
vim.cmd('hi! link TabLineFill StatusLineNC')
vim.cmd('hi! link TabLine StatusLine')
vim.cmd('hi! link TabLineSel StatusLine')

-- Return colors table (optional, but common practice)
return colors
