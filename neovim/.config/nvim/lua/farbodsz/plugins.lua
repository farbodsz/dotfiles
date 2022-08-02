-------------------------------------------------------------------------------
-- Plugin configuration
-------------------------------------------------------------------------------

local packer = require("packer")

local install_path = vim.fn.stdpath("data")
  .. "/site/pack/packer/start/packer.nvim"
local snapshot_path = vim.fn.getenv("HOME")
  .. "/.dotfiles/neovim/.config/nvim/snapshots"

-- Install packer
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd("packadd packer.nvim")
end

-- Configuration
packer.init({ snapshot_path = snapshot_path })

-- Plugins
packer.startup({
  function(use)
    use("wbthomason/packer.nvim")
    use("lewis6991/impatient.nvim")
    use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })

    -- Theming and styling
    use({
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("farbodsz.icons").setup()
      end,
    })
    use("farbodsz/gruvbox-alt.nvim")
    use("itchyny/lightline.vim")

    -- Navigation: Explorer
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      cmd = "NvimTreeToggle",
      config = function()
        require("farbodsz.filetree").setup()
      end,
    })

    -- Navigation: Telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        "nvim-telescope/telescope-project.nvim",
      },
    })

    -- Navigation: Others
    use({ "kassio/neoterm", cmd = { "REPL", "Tnew", "Topen", "Ttoggle" } })
    use({ "kshenoy/vim-signature", event = "BufEnter" })
    use("milkypostman/vim-togglelist")
    use({ "szw/vim-maximizer", cmd = { "MaximizerToggle", "MaximizerToggle!" } })
    use({ "liuchengxu/vista.vim", cmd = { "Vista", "Vista!", "Vista!!" } })

    -- LSP and completion
    use("neovim/nvim-lspconfig")
    use("onsails/lspkind-nvim")
    use("ray-x/lsp_signature.nvim")
    use("mfussenegger/nvim-jdtls")

    -- Completion
    use({ "hrsh7th/nvim-cmp", module = "cmp" })
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("hrsh7th/cmp-path")
    use("uga-rosa/cmp-dictionary")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- Other completion
    use("jiangmiao/auto-pairs")
    use("tpope/vim-surround")
    use("tpope/vim-commentary")

    -- Tree sitter
    use({
      { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-textobjects",
    })

    -- Language syntax/detection
    use({ "memgraph/cypher.vim", ft = "cypher" })
    use({ "neovimhaskell/haskell-vim", ft = "haskell" })
    use({ "towolf/vim-helm", ft = { "helm", "yaml" } })
    use({ "mboughaba/i3config.vim", ft = "i3config" })
    use({ "rhysd/vim-llvm", ft = "llvm" })
    use({ "plasticboy/vim-markdown", ft = "markdown" })
    use({ "LnL7/vim-nix", ft = "nix" })
    use({ "lifepillar/pgsql.vim", ft = { "sql", "pgsql", "plsql" } })
    use({ "adimit/prolog.vim", ft = "prolog" })
    use({ "MTDL9/vim-log-highlighting", ft = "log" })
    use({ "lervag/vimtex", ft = "tex" })
    use({ "KeitaNakamura/tex-conceal.vim", ft = "tex" })

    -- Refactoring
    use({
      "ThePrimeagen/refactoring.nvim",
      requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
      config = function()
        require("refactoring").setup({})
      end,
    })

    -- Git
    use("airblade/vim-gitgutter")
    use("tpope/vim-fugitive")
    use({ "tpope/vim-rhubarb", requires = "vim-fugitive" })
    use({ "tommcdo/vim-fugitive-blame-ext", requires = "vim-fugitive" })
    use({
      "sindrets/diffview.nvim",
      requires = {
        "plenary.nvim",
        { "nvim-web-devicons", opt = true },
      },
      -- Changes to :DiffviewFileHistory command require higher versions of git
      -- https://github.com/sindrets/diffview.nvim/issues/154
      commit = "3ffe4a70c4b434ee933cb869b1706632c4407495",
      cmd = { "DiffviewOpen", "DiffviewFileHistory" },
      config = function()
        require("farbodsz.diffview").setup()
      end,
    })
    use({ "rbong/vim-flog", requires = "vim-fugitive" })
    use({
      "pwntester/octo.nvim",
      requires = { "plenary.nvim", "telescope.nvim", "nvim-web-devicons" },
      cmd = { "Octo" },
      config = function()
        require("octo").setup()
      end,
    })

    -- Databases
    use("tpope/vim-dadbod")
    use({ "kristijanhusak/vim-dadbod-ui", requires = "vim-dadbod" })
    use({
      "kristijanhusak/vim-dadbod-completion",
      requires = "vim-dadbod",
      ft = "sql",
    })

    -- Debugging
    use({ "mfussenegger/nvim-dap", module = "dap" })
    use({ "rcarriga/nvim-dap-ui", requires = "nvim-dap" })
    use({ "theHamsta/nvim-dap-virtual-text", requires = "nvim-dap" })
    use({ "jbyuki/one-small-step-for-vimkind", requires = "nvim-dap" })

    -- Useful tools
    use({
      "norcalli/nvim-colorizer.lua",
      cmd = "ColorizerToggle",
      config = function()
        require("colorizer").setup()
      end,
    })
    use({ "tpope/vim-dispatch", cmd = { "Dispatch", "Make" } })
    use({
      "farbodsz/pointfree.nvim",
      requires = "plenary.nvim",
      ft = "haskell",
    })
    use({ "mbbill/undotree", cmd = "UndotreeToggle" })
    use({
      "jbyuki/venn.nvim",
      config = function()
        require("farbodsz.venn").setup()
      end,
    })

    -- Previewing
    use({
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      run = "cd app & yarn install",
    })
    use({ "xuhdev/vim-latex-live-preview", ft = "tex" })

    -- Firenvim
    use({
      "glacambre/firenvim",
      run = function()
        vim.fn["firenvim#install"](0)
      end,
    })
  end,

  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
  },
})

require("packer_compiled")
