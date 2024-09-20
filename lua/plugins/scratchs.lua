return {
  -- use lazy.nvim
  {
    "LintaoAmons/scratch.nvim",
    event = "VeryLazy",
    opts = {
      filetypes = {
        "ts",
        "tsx",
        "lua",
        "py",
        "sh",
      },
      file_picker = "telescope",
      window_cmd = "rightbelow vsplit", -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
      use_telescope = true,
    },
  },
}
