-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.wrap = false
vim.o.mouse = "r"
vim.o.showmode = false
vim.o.clipboard = 'unnamedplus'
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 50
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 20
vim.o.confirm = true
-- [[ Basic Keymaps ]]
vim.o.hlsearch = false
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- NOTE: <Nop> means do nothing but overlapping the original vim feature
-- NOTE: v is visual+select mode
vim.keymap.set('n', '<left>', '<Nop>')
vim.keymap.set('n', '<right>', '<Nop>')
vim.keymap.set('n', '<up>', '<Nop>')
vim.keymap.set('n', '<down>', '<Nop>')
vim.keymap.set('v', '<left>', '<Nop>')
vim.keymap.set('v', '<right>', '<Nop>')
vim.keymap.set('v', '<up>', '<Nop>')
vim.keymap.set('v', '<down>', '<Nop>')
-- useful keymap to move the whole line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- for not storing the word that is replaced in the clipboard and store the origin yanked word
vim.keymap.set("x", "<leader>p", [["_dP]])
-- NOTE: s = substitue
-- NOTE: o = open line
-- NOTE: a = append
vim.keymap.set({"x","n"}, "s", '<Nop>')
-- vim.keymap.set({"x","n"}, "a", '<Nop>')
vim.keymap.set({"x","n"}, "o", '<Nop>')
-- NOTE: e = end of word
-- vim.keymap.set({"x","n"}, "e", '<Nop>')
-- NOTE: c = change
-- NOTE: d = delete
vim.keymap.set({"x","n"}, "c", '<Nop>')
vim.keymap.set({"x","n"}, "dd", '<Nop>')
vim.keymap.set({"x","n"}, "dw", '<Nop>')
vim.keymap.set({"x","n"}, "di", '<Nop>')
vim.keymap.set({"x","n"}, "<S-c>", '<Nop>')
vim.keymap.set({"x","n"}, "<S-d>", '<Nop>')
vim.keymap.set({"x","n"}, 'ci', 'ci')
-- original word replace keymap
-- vim.keymap.set("v", "r", '<cmd>echo "visual mode r is typing"<CR>')
-- NOTE: r in visual mode means replace the selected area with the typed character after r
vim.keymap.set("x", "r", '<Nop>')
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[R]eplace [W]ord" })
vim.keymap.set('n', '<leader>er', vim.cmd.Ex, { desc = '[E]xplo[r]e the directory' })
vim.keymap.set('n', '<leader>al', vim.cmd.Lazy, { desc = '[A] [L]azy command' })
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
-- NOTE: for disabling v in netrw
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "v", "<Nop>", { noremap = true, silent = true })
  end,
})
-- hide the file saving messages
-- vim.api.nvim_create_autocmd("User", {
--   pattern = "VeryLazy",
--   callback = function()
--     vim.opt.shortmess:append("WF")
--   end,
-- })
-- hide the file saving messages
-- if there is error when saving, the error message will be shown
vim.cmd([[
  cnoreabbrev <expr> w (getcmdtype()==':' && getcmdline() ==# 'w') ? '<cmd>silent update<CR>' : 'w'
  cnoreabbrev <expr> write (getcmdtype()==':' && getcmdline() ==# 'write') ? '<cmd>silent update<CR>' : 'write'
]])
-- silent! suppress all messages include error messages
-- vim.cmd([[
--   cnoreabbrev <expr> w (getcmdtype()==':' && getcmdline() ==# 'w') ? '<cmd>silent! update<CR>' : 'w'
--   cnoreabbrev <expr> write (getcmdtype()==':' && getcmdline() ==# 'write') ? '<cmd>silent! update<CR>' : 'write'
-- ]])
-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)
-- [[ Configure and install plugins ]]
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
  {
    "eandrju/cellular-automaton.nvim",
    config = function()
      vim.keymap.set("n", "<leader>mta", "<cmd>CellularAutomaton make_it_rain<CR>")
      vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")
    end,
  },
  { "numToStr/Comment.nvim", opts = {} },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  { -- Fuzzy Finder (files, lsp, etc)
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        "nvim-telescope/telescope-fzf-native.nvim",
        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = "make",
        -- `cond` is a condition used to determine whether this plugin should be installed and loaded.
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require("telescope").setup({
        -- You can put your default mappings / updates / etc. in here
        -- All the info you're looking for is in `:help telescope.setup()`
        defaults = {
          file_ignore_patterns = {
            "node_modules", ".DS_Store", ".git", "Dockerfile", "object.*%.mm"
         },
        },
        pickers = {
          find_files = {
            hidden = true,
            -- symlinks follow param not working            
            -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "-L" }
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown(),
          },
        },
      })
      -- Enable Telescope extensions if they are installed
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension, "ui-select")
      -- See `:help telescope.builtin`
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
      vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
      vim.keymap.set("n", "<leader>sf", function()
        builtin.find_files({
          previewer = false
        })
      end, { desc = "[S]earch [F]iles" })
      vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
      vim.keymap.set({"n","v"}, "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
      vim.keymap.set("n", "<leader>gs", builtin.live_grep, { desc = "[G]rep [S]tring" })
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
      vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({}))
      end, { desc = "[/] Fuzzily search in current buffer" })
      vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
      -- See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set("n", "<leader>s/", function()
        builtin.live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end, { desc = "[S]earch [/] in Open Files" })
      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set("n", "<leader>sn", function()
        builtin.find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = "[S]earch [N]eovim files" })
    end,
  },
  { -- Main LSP Configuration
    "neovim/nvim-lspconfig",
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },
      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible to define small helper and utility functions so you don't have to repeat yourself
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end
          -- Jump to the definition of the word under your cursor
          -- To jump back, press <C-t>.
          map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
          map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
          map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
          map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
          map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
          map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
          map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
          -- Opens a popup that displays documentation about the word under your cursor
          -- See `:help K` for why this keymap.
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
          -- Neovim 0.11 is now stable
          -- ---@param client vim.lsp.Client
          -- ---@param method vim.lsp.protocol.Method
          -- ---@param bufnr? integer some lsp support methods only in specific files
          -- ---@return boolean
          -- local function client_supports_method(client, method, bufnr)
          --   if vim.fn.has 'nvim-0.11' == 1 then
          --     return client:supports_method(method, bufnr)
          --   else
          --     return client.supports_method(method, { bufnr = bufnr })
          --   end
          -- end
          -- See `:help CursorHold` for information about when this is executed
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method('textDocument/documentHighlight', event.buf) then
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end
          if client and client:supports_method('textDocument/inlayHint', event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })
      -- tbl = table
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = {
        clangd = {},
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
      }
      -- To check the current status of installed tools and/or manually install other tools, you can run
      -- NOTE :Mason
      require("mason").setup()
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        "stylua", -- Used to format Lua code
      })
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
      for server_name, config in pairs(servers) do
        vim.lsp.config(server_name, config)
      end
    end,
  },
  { -- NOTE: replace tsserver with typescript-tools.nvim
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  { -- Autocompletion
    'saghen/blink.cmp',
    event = "VimEnter",
    version = '1.*',
    dependencies = { -- Snippet Engine & its associated nvim-cmp source
      {
        "L3MON4D3/LuaSnip",
        version = '2.*',
        build = (function()
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        dependencies = {},
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        preset = 'default',
      },
      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },
      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'lua' },
      signature = { enabled = true },
    },
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        styles = {
          italic = false,
          transparency = true,
        },
      })
      vim.cmd.colorscheme("rose-pine")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  },
  {
    -- NOTE: for searching to do comments (like warning)
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  { -- Collection of various small independent plugins/modules
    "nvim-mini/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      require("mini.ai").setup({ n_lines = 500 })
      require("mini.surround").setup()
      -- You could remove this setup call if you don't like it, and try some other statusline plugin
      local statusline = require("mini.statusline")
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end
      --  Check out: https://github.com/nvim-mini/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = "VimEnter",
    build = ':TSUpdate',
    dependencies = { "nvim-treesitter/playground" },
    opts = {
      ensure_installed = { 'bash', 'c', 'html', "javascript", "typescript", "java", "go", 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
      sync_install = false,
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
      -- ---@diagnostic disable-next-line: missing-fields
      -- require('nvim-treesitter.configs').setup(opts)
      local TS = require("nvim-treesitter")
			TS.setup(opts)
    end,
  },
  -- { import = "various.plugins" },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "🌙",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "💫",
      source = "🌪️",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
