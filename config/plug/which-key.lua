local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ['.'] = {'<cmd>e $MYVIMRC<CR>', 'open init'},
  ['r'] = {'<cmd>RnvimrToggle<CR>', 'ranger'},
  ['e'] = {'<cmd>NERDTreeToggle<CR>', 'explorer'},
  ['q'] = {'<cmd>q<CR>', 'quit'},
  ['x'] = {'<cmd>qa<CR>', 'quit all'},
  ['o'] = {'<cmd>only<CR>', 'only'},
  ['w'] = {'<cmd>w<CR>', 'write'},
  ['/'] = {'<cmd>let @/=""<CR>', 'clear highlight'},
  ['='] = {'<cmd>FormatAndSave<CR>', 'format and save'},
  ['v'] = {'<cmd>vs<CR>', 'v-split'},
  ['s'] = {'<cmd>sp<CR>', 'h-split'},
  [';'] = {'<cmd>TagbarToggle<CR>', 'toggle tagbar'},
  [' '] = {'<cmd>only|Startify<CR>', 'Startify'},

  l = {
    name = '+lsp' ,
    ['d'] = {'<Plug>(coc-definition)'              , 'definition'},
    ['D'] = {'<Plug>(coc-declaration)'             , 'declaration'},
    ['r'] = {'<Plug>(coc-references)'              , 'references'},
    ['='] = {'<Plug>(coc-format)'                  , 'format'},
    ['n'] = {'<Plug>(coc-diagnostic-next)'         , 'next diagnostic'},
    ['P'] = {'<Plug>(coc-diagnostic-prev-error)'   , 'prev error'},
    ['p'] = {'<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'},
    ['N'] = {'<Plug>(coc-diagnostic-next-error)'   , 'next error'},
    ['f'] = {'<Plug>(coc-fix-current)'             , 'quickfix'},
    ['R'] = {'<Plug>(coc-rename)'                  , 'rename'},
  },

  c = {
      name = '+coc' ,
      [','] = {':CocLocalConfig'                     , 'coc local config'},
      ['.'] = {':CocConfig'                          , 'coc global config'},
      ['R'] = {':CocRestart'                         , 'restart coc'},
      ['c'] = {':CocList commands'                   , 'list commands'},
      ['m'] = {':CocList marketplace'                , 'marketplace'},
      ['d'] = {':CocList diagnostics'                , 'list diagnostics'},
      ['o'] = {':CocList outline'                    , 'list outline'},
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
