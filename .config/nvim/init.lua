-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.wrap = false
-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = "a"
vim.opt.mouse = "r"
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
-- vim.opt.breakindent = true
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 50
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 20
-- [[ Basic Keymaps ]]
vim.opt.hlsearch = false
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move ←"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move →"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move ↑"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move ↓"<CR>')
vim.keymap.set('v', '<left>', '<cmd>echo "Use h to move ←"<CR>')
vim.keymap.set('v', '<right>', '<cmd>echo "Use l to move →"<CR>')
vim.keymap.set('v', '<up>', '<cmd>echo "Use k to move ↑"<CR>')
vim.keymap.set('v', '<down>', '<cmd>echo "Use j to move ↓"<CR>')
-- useful keymap to move the whole line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- for not storing the word that is replaced in the clipboard and store the origin yanked word
vim.keymap.set("x", "<leader>p", [["_dP]])
-- original insert keymap
vim.keymap.set("x", "s", '<cmd>echo "s is typing"<CR>')
vim.keymap.set("n", "s", '<cmd>echo "s is typing"<CR>')
vim.keymap.set("x", "a", '<cmd>echo "a is typing"<CR>')
vim.keymap.set("n", "a", '<cmd>echo "a is typing"<CR>')
vim.keymap.set("x", "o", '<cmd>echo "o is typing"<CR>')
vim.keymap.set("n", "o", '<cmd>echo "o is typing"<CR>')
-- original keymap for going to the end of next word
vim.keymap.set("x", "e", '<cmd>echo "e is typing"<CR>')
vim.keymap.set("n", "e", '<cmd>echo "e is typing"<CR>')
-- original delete keymap
vim.keymap.set("n", "c", '<cmd>echo "c is typing"<CR>')
vim.keymap.set("n", "<S-c>", '<cmd>echo "shift+c is typing"<CR>')
vim.keymap.set("n", "<S-d>", '<cmd>echo "shift+d is typing"<CR>')
vim.keymap.set("v", "c", '<cmd>echo "visual mode c is typing"<CR>')
vim.keymap.set("v", "<S-c>", '<cmd>echo "visual mode shift+c is typing"<CR>')
vim.keymap.set("v", "<S-d>", '<cmd>echo "visual mode shift+d is typing"<CR>')
-- original word replace keymap
vim.keymap.set("v", "r", '<cmd>echo "visual mode r is typing"<CR>')
-- s keymap cannot be override
-- vim.keymap.set('n', '<s>', '<cmd>echo "Use a/i to enter insert mode"<CR>')
-- useful words replacement command
vim.keymap.set("n", "<leader>rw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[R]eplace [W]ord" })
-- "<C-w><C-h>" is sufficient to use, don't need the following keeps to switch the window
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<leader>er', vim.cmd.Ex, { desc = '[E]xplo[r]e the directory' })
vim.keymap.set('n', '<leader>al', vim.cmd.Lazy, { desc = '[A] [L]azy command' })
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--  You can press `?` in this menu for help. Use `:q` to close the window
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require("lazy").setup({
  -- { "theprimeagen/vim-be-good", dependencies = { "nvim-lua/plenary.nvim" } },
  {
    "eandrju/cellular-automaton.nvim",
    config = function()
      vim.keymap.set("n", "<leader>mta", "<cmd>CellularAutomaton make_it_rain<CR>")
      vim.keymap.set("n", "<leader>gol", "<cmd>CellularAutomaton game_of_life<CR>")
    end,
  },
  -- keep the tabstop and softtabstop to be 2 in vim.opt, so don't need to use vim-sleuth
  -- "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
  -- "github/copilot.vim",
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
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        "nvim-telescope/telescope-fzf-native.nvim",
        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = "make",
        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      -- Useful for getting pretty icons, but requires a Nerd Font.
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
      -- The easiest way to use Telescope, is to start by doing something like:
      -- :Telescope help_tags
      -- After running this command, a window will open up and you're able to type in the prompt window. You'll see a list of `help_tags` options and a corresponding preview of the help.
      -- Two important keymaps to use while in Telescope are:
      -- - Insert mode: <c-/>
      -- - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current Telescope picker. This is really useful to discover what Telescope can do as well as how to actually do it!
      --
      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require("telescope").setup({
        -- You can put your default mappings / updates / etc. in here
        -- All the info you're looking for is in `:help telescope.setup()`
        defaults = {
          -- mappings = {
          --   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          -- },
          file_ignore_patterns = {
            -- "node_modules", ".DS_Store", ".git", "object.*%.mm"
            -- "node_modules", ".DS_Store", ".git", "object.*%.mm", "^/openrice_timothy_backend/**/*/Dockerfile", "^/ttiimmothy_metrics/**/*/Dockerfile"
            "node_modules", ".DS_Store", ".git", "Dockerfile", "object.*%.mm"
            -- "node_modules", ".DS_Store", ".git"
         },
          -- layout_config = {
          --   vertical = { width = 100 }
          -- },
        },
        pickers = {
          find_files = {
            hidden = true,
            -- symlinks follow param not working            
            -- find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*", "-L" }
            -- follow_symlinks = true,
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
      vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
      vim.keymap.set("n", "<leader>gs", builtin.live_grep, { desc = "[G]rep [S]tring" })
      vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
      -- vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
      vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({}))
          -- winblend = 80,
          -- previewer = true,
        -- }))
      end, { desc = "[/] Fuzzily search in current buffer" })
      vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
      -- It's also possible to pass additional configuration options.
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
  -- NOTE: replace tsserver with typescript-tools.nvim
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {},
  -- },
  { -- Autocompletion
    "hrsh7th/nvim-cmp",
    event = "VimEnter",
    -- event = "InsertEnter",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        "L3MON4D3/LuaSnip",
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          -- See the README about individual language/framework/plugin snippets:
          -- https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      "saadparwaiz1/cmp_luasnip",
      -- Adds other completion capabilities.
      -- nvim-cmp does not ship with all sources by default. They are split into multiple repos for maintenance purposes.
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
    },
    config = function()
      -- See `:help cmp`
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      luasnip.config.setup({})
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = "menu,menuone,noinsert" },
        -- For an understanding of why these mappings were chosen, you will need to read `:help ins-completion`
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert({
          -- Select the [n]ext item
          ["<C-n>"] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          -- Scroll the documentation window [b]ack / [f]orward
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- Accept ([y]es) the completion.
          -- This will auto-import if your LSP supports it.
          -- This will expand snippets if the LSP sent a snippet.
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          -- Manually trigger a completion from nvim-cmp.
          -- Generally you don't need this, because nvim-cmp will display completions whenever it has completion options available.
          -- ["<C-Space>"] = cmp.mapping.complete({}),
          -- Think of <c-l> as moving to the right of your snippet expansion.
          -- So if you have a snippet that's like:
          -- function $name($args)
          --   $body
          -- end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),
          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          -- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        -- your configuration comes here or leave it empty to use the default settings
        style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = false },
          keywords = { italic = false },
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "dark", -- style for sidebars, see below
          floats = "dark", -- style for floating windows
        },
      })
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_background = true,
        styles = {
          italic = false,
        },
      })
      vim.cmd.colorscheme("rose-pine")
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  { -- Collection of various small independent plugins/modules
    "echasnovski/mini.nvim",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      -- - va)  - [V]isually select [A]round [)]paren
      -- - yinq - [Y]ank [I]nside [N]ext [']quote
      -- - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })
      -- (Add)/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()
      -- Simple and easy statusline.
      -- You could remove this setup call if you don't like it, and try some other statusline plugin
      local statusline = require("mini.statusline")
      -- set use_icons to true if you have a Nerd Font
      statusline.setup({ use_icons = vim.g.have_nerd_font })
      -- You can configure sections in the statusline by overriding their default behavior. For example, here we set the section for cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end
      --  Check out: https://github.com/echasnovski/mini.nvim
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
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        -- If you are experiencing weird indenting issues, add the language to the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      -- indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
      -- There are additional nvim-treesitter modules that you can use to interact with nvim-treesitter. You should go explore a few and see what interests you:
      --
      -- - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      -- - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      -- - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
  -- {
  --    "m4xshen/hardtime.nvim",
  --    lazy = true,
  --    dependencies = { "MunifTanjim/nui.nvim" },
  --    opts = {},
  -- },
  { import = "various.plugins" },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "🌙",
      -- event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "💫",
      source = "🌪️",
      -- require = "🌙",
      -- source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
