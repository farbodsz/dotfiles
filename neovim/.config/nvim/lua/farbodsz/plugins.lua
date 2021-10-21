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
    use("tweekmonster/startuptime.vim")

    -- Theming and styling
    use("gruvbox-community/gruvbox")
    use("itchyny/lightline.vim")
    use("shinchu/lightline-gruvbox.vim")

    -- Navigation: Explorer
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
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
    use("kassio/neoterm")
    use("kshenoy/vim-signature")
    use("milkypostman/vim-togglelist")
    use("szw/vim-maximizer")
    use("liuchengxu/vista.vim")

    -- LSP
    use("neovim/nvim-lspconfig")
    use({ "hrsh7th/nvim-cmp", module = "cmp" })
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("ray-x/lsp_signature.nvim")

    -- Snippets
    use("SirVer/ultisnips")
    use("quangnguyen30192/cmp-nvim-ultisnips")

    -- Auto-completion
    use("jiangmiao/auto-pairs")
    use("tpope/vim-surround")
    use("tpope/vim-commentary")

    -- Tree sitter
    use({
      { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
      "nvim-treesitter/playground",
    })

    -- Language syntax/detection
    use({ "memgraph/cypher.vim", ft = "cypher" })
    use({ "neovimhaskell/haskell-vim", ft = "haskell" })
    use({ "towolf/vim-helm", ft = { "helm", "yaml" } })
    use({ "mboughaba/i3config.vim", ft = "i3config" })
    use({ "plasticboy/vim-markdown", ft = "markdown" })
    use({ "LnL7/vim-nix", ft = "nix" })
    use("lifepillar/pgsql.vim")
    use({ "adimit/prolog.vim", ft = "prolog" })
    use({ "MTDL9/vim-log-highlighting", ft = "log" })
    use({ "lervag/vimtex", ft = "tex" })
    use({ "KeitaNakamura/tex-conceal.vim", ft = "tex" })
    use({ "prettier/vim-prettier", run = "yarn install" })

    -- Git
    use("airblade/vim-gitgutter")
    use("tpope/vim-fugitive")
    use({ "tpope/vim-rhubarb", requires = "vim-fugitive" })
    use({ "tommcdo/vim-fugitive-blame-ext", requires = "vim-fugitive" })
    use({ "sindrets/diffview.nvim", requires = "nvim-web-devicons" })
    use("rbong/vim-flog")

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

    -- Show hex colors
    use("chrisbra/Colorizer")

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
