-- lua/plugins/init.lua
return {
  -- themes
  { "catppuccin/nvim", name = "catppuccin" },
  
  -- essentials
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "neovim/nvim-lspconfig" },
  { "nvim-lua/plenary.nvim" },
  
  -- completion engine
  { 
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    }
  },
  
  -- auto closing scopes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true
  },
    { 'adamkleo/bnf-highlighting' },

    { 'Civitasv/cmake-tools.nvim', opts = {} }
}

