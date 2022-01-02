-------------------------------------------------------------------------------
-- Plugin configuration
-------------------------------------------------------------------------------

-- Install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  vim.cmd("packadd packer.nvim")
end

-- Plugins
require("packer").startup({
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
    use("~/gruvbox-alt.nvim")
    use("itchyny/lightline.vim")

    -- Navigation: Explorer
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      cmd = "NvimTreeToggle",
      config = function()
        require("farbodsz.filetree")
      end,
    })

    -- Navigation: Telescope
    use({ "nvim-telescope/telescope.nvim", requires = "nvim-lua/plenary.nvim" })
    use({
      "nvim-telescope/telescope-fzf-native.nvim",
      requires = "telescope.nvim",
      run = "make",
    })
    use({
      "nvim-telescope/telescope-project.nvim",
      requires = "telescope.nvim",
    })

    -- Navigation: Others
    use({ "kassio/neoterm", cmd = { "REPL", "Tnew", "Topen", "Ttoggle" } })
    use("kshenoy/vim-signature")
    use("milkypostman/vim-togglelist")
    use("szw/vim-maximizer")
    use("liuchengxu/vista.vim")

    -- LSP and completion
    use({
      "neovim/nvim-lspconfig",
      -- TODO: On HEAD we get an error - fix on my side later.
      -- [lspconfig]: Cannot access configuration for prolog_lsp. Ensure this
      -- server is listed in `server_configurations.md` or added as a custom
      -- server.
      commit = "6d4ae56cd62d374ab8364b09a179a03c65e92f0d",
    })
    use("SirVer/ultisnips")
    use({ "hrsh7th/nvim-cmp", module = "cmp" })
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("quangnguyen30192/cmp-nvim-ultisnips")
    use("hrsh7th/cmp-path")
    use("onsails/lspkind-nvim")
    use("ray-x/lsp_signature.nvim")

    -- Auto-completion
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
    use({ "~/decks/vim", ft = "decks" })
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
    })
    use({ "rbong/vim-flog", requires = "vim-fugitive" })
    use({
      "pwntester/octo.nvim",
      requires = { "plenary.nvim", "telescope.nvim", "nvim-web-devicons" },
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
      "~/pointfree.nvim",
      requires = "plenary.nvim",
      ft = "haskell",
    })
    use({ "mbbill/undotree", cmd = "UndotreeToggle" })

    -- Previewing
    use({
      "iamcco/markdown-preview.nvim",
      ft = "markdown",
      run = "cd app & yarn install",
    })
    use({ "xuhdev/vim-latex-live-preview", ft = "tex" })
  end,

  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
  },
})

require("packer_compiled")
