---@diagnostic disable: missing-fields
return {
   {
      "RRethy/base16-nvim",
      priority = 1000,
      lazy = false,
      enabled = false,
      config = function ()
         require("base16-colorscheme").with_config({
            telescope = false,
            cmp = false,
         })
         vim.o.termguicolors = true
         vim.cmd.colorscheme "base16-atelier-plateau"
         vim.cmd [[ hi Normal guibg=NONE ]]
         vim.cmd [[ hi NormalNC guibg=NONE ]]
         vim.cmd [[ hi WinSeparator guifg=#242424 ]]
         vim.cmd [[ hi LineNR guibg=NONE guifg=#282828 ]]
         vim.cmd [[ hi StatusLine guibg=#181818 ]]
         vim.cmd [[ hi StatusLineNC guibg=#161616 ]]
         vim.cmd [[ hi TelescopeNormal guibg=NONE ]]
         vim.cmd [[ hi TelescopeBorder guibg=NONE guifg=#242424 ]]
         vim.cmd [[ hi TelescopeSelection guibg=#202020 ]]
      end
   },

   {'github/copilot.vim', enabled = false},

   {
      "sainnhe/gruvbox-material",
      priority = 1000,
      lazy = false,
      enabled = true,
      config = function ()
         vim.g.gruvbox_material_better_performance = 1
         vim.g.gruvbox_material_background = 'hard'
         vim.g.gruvbox_material_foreground = 'mix'
         vim.g.gruvbox_material_disable_italic_comments = true
         vim.g.gruvbox_material_enable_italics = true
         vim.cmd.colorscheme "gruvbox-material"
      end,
   },

   {
      "sainnhe/sonokai",
      priority = 1000,
      lazy = false,
      enabled = false,
      config = function ()
         vim.g.sonokai_style = 'andromeda'
         vim.g.sonokai_better_performance = 1
         vim.cmd.colorscheme "sonokai"
      end
   },

   {
      'rose-pine/neovim',
      name = 'rose-pine',
      priority = 1000,
      lazy = false,
      enabled = false,
      config = function ()
         require("rose-pine").setup({
            variant = "main",
            dim_inactive_windows = false,
            extend_background_behind_borders = true,

            enable = {
               terminal = true,
               legacy_highlights = true,
               migrations = true,
            },

            styles = {
               bold = false,
               italic = false,
               transparency = false,
            },
         })
         vim.cmd.colorscheme "rose-pine"
      end,
   },

   {
      "folke/tokyonight.nvim",
      priority = 1000,
      lazy = false,
      enabled = false,
      config = function()
         vim.cmd.colorscheme "tokyonight-night"
      end
   },

   {
      "techtuner/aura-neovim",
      priority = 1000,
      lazy = false,
      enabled = false,
      config = function ()
         vim.opt.termguicolors = true
         vim.cmd.colorscheme "aura"
      end
   },

   {
      "nvim-telescope/telescope.nvim",
      opts = {},
      dependencies = {'nvim-lua/plenary.nvim'},
      config = function ()
         local builtin = require("telescope.builtin")
         vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
         vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
         vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
         vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      end
   },

   {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = true,
   },

   {
      'nvim-treesitter/nvim-treesitter',
      config = function ()
         ---@diagnostic disable-next-line
         require('nvim-treesitter.configs').setup({
            ensure_installed = {'lua', 'vim', 'c', 'cpp', 'zig', 'nix', 'rust', 'html', 'css', 'javascript', 'typescript', 'tsx', 'bash', 'vimdoc', 'php', 'phpdoc', 'markdown', 'markdown_inline', 'query'},
            highlight = { enable = true },
            additional_vim_regex_highlighting = true,
         })
      end
   },

   {
      'stevearc/oil.nvim',
      config = function ()
         require('oil').setup()
         vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
      end
   },

   {
      'williamboman/mason.nvim',
      enabled = false,
      dependencies = {
         'williamboman/mason-lspconfig.nvim',
      },
      config = function ()
         require('mason-lspconfig').setup()
         require('mason').setup()
      end
   },

   {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
         library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
         }
      }
   },

   {
      'saghen/blink.cmp',
      dependencies = {'rafamadriz/friendly-snippets'},
      enabled = false,
      version = '*',
      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
         keymap = { preset = 'default' },

         appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'normal',
         },

         sources = {
            default = {
               'lazydev',
               'lsp',
               'path',
               'snippets',
               'buffer'
            },

            providers = {
               lazydev = {
                  name = "LazyDev",
                  module = "lazydev.integrations.blink",
                  score_offset = 100,
               },
            },
         },
      },

      opts_extend = {'sources.default'}
   },

   {
      'neovim/nvim-lspconfig',
      after = "mason.nvim",
      dependencies = {'saghen/blink.cmp'},
      enabled = false,

      opts = {
         servers = {
            lua_ls = {},
            ols = {},
            gopls = {},
            rust_analyzer = {},
            ts_ls = {},
            zls = {},
            tailwindcss = {},
            pyright = {},
            clangd = {},
         },
      },

      config = function (_, opts)
         local lspconfig = require('lspconfig')

         for server, config in pairs(opts.servers) do
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            lspconfig[server].setup(config)
         end
      end,
   },

   {
      'tpope/vim-fugitive',
      lazy = false,

      config = function ()
         vim.cmd.cabbrev 'git Git'
      end
   },

   {
      'norcalli/nvim-colorizer.lua',
      opts = {},
      event = 'BufEnter',
   },

   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function ()
         require("lualine").setup({
            options = {
               icons_enabled = true,
               theme = "auto",
               component_separators = { left = '', right = '' },
               section_separators = { left = '', right = '' },
            },
            sections = {
               lualine_a = {
                  {
                     'mode',
                     fmt = function (_)
                        return '󰊠'
                     end
                  }
               },
               lualine_b = {
                  'filename'
               },
               lualine_c = {},
               lualine_x = {},
               lualine_y = {},
               lualine_z = {
                  'progress'
               },
            }
         })
      end
   },
}
