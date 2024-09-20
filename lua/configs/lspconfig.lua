-- Import the shared configurations
local configs = require "nvchad.configs.lspconfig"
local execute = function(opts)
  local params = {
    command = opts.command,
    arguments = opts.arguments,
  }
  if opts.open then
    require("trouble").open {
      mode = "lsp_command",
      params = params,
    }
  else
    return vim.lsp.buf_request(0, "workspace/executeCommand", params, opts.handler)
  end
end
-- Define the servers and their specific options
local servers = {
  html = {},
  awk_ls = {},
  bashls = {},

  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          typeCheckingMode = "basic",
        },
      },
    },
  },

  cssls = {
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
      scss = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
      less = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
    filetypes = { "css", "scss", "less", "html" },
  },

  tailwindcss = {
    filetypes = {
      "html",
      "css",
      "scss",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "svelte",
      "vue",
    },
    root_dir = require("lspconfig").util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
  },

  angularls = {
    cmd = {
      "ngserver",
      "--stdio",
      "--tsProbeLocations",
      vim.fn.stdpath "data" .. "/mason/packages/angular-language-server/node_modules",
      "--ngProbeLocations",
      vim.fn.stdpath "data"
        .. "/mason/packages/angular-language-server/node_modules/@angular/language-server/node_modules",
    },
    root_dir = require("lspconfig").util.root_pattern("angular.json", "project.json", "nx.json"),
    on_new_config = function(new_config)
      new_config.cmd = { "ngserver", "--stdio" }
    end,
  },

  mdx_analyzer = {
    filetypes = { "markdown", "mdx" },
  },

  -- vtsls = {
  --   capabilities = configs.capabilities,
  --   on_attach = configs.on_attach,
  --   on_init = configs.on_init,
  --   flags = {
  --     allow_incremental_sync = false,
  --   },
  --   settings = {
  --     javascript = {
  --       format = {
  --         enable = false,
  --         insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
  --         insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
  --       },
  --       updateImportsOnFileMove = {
  --         enabled = "always",
  --       },
  --       preferences = {
  --         importModuleSpecifier = "project-relative",
  --       },
  --       inlayHints = {
  --         includeInlayParameterNameHints = "all",
  --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --         includeInlayFunctionParameterTypeHints = true,
  --         includeInlayVariableTypeHints = true,
  --         includeInlayPropertyDeclarationTypeHints = true,
  --         includeInlayFunctionLikeReturnTypeHints = true,
  --         includeInlayEnumMemberValueHints = true,
  --       },
  --     },
  --     typescript = {
  --       format = {
  --         enable = false,
  --         insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
  --         insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = false,
  --       },
  --       updateImportsOnFileMove = {
  --         enabled = "always",
  --       },
  --       workspace = {
  --         didChangeWatchedFiles = {
  --           dynamicRegistration = true,
  --         },
  --       },
  --       preferences = {
  --         importModuleSpecifier = "project-relative",
  --       },
  --       inlayHints = {
  --         includeInlayParameterNameHints = "literal",
  --         includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  --         includeInlayFunctionParameterTypeHints = true,
  --         includeInlayVariableTypeHints = false,
  --         includeInlayPropertyDeclarationTypeHints = true,
  --         includeInlayFunctionLikeReturnTypeHints = true,
  --         includeInlayEnumMemberValueHints = true,
  --       },
  --     },
  --   },
  --   keys = {
  --     {
  --       "<leader>cD",
  --       function()
  --         local params = vim.lsp.util.make_position_params()
  --         execute {
  --           command = "typescript.goToSourceDefinition",
  --           arguments = { params.textDocument.uri, params.position },
  --           open = true,
  --         }
  --       end,
  --       desc = "Go to source definition",
  --     },
  --     {
  --       "<leader>cr",
  --       function()
  --         execute {
  --           command = "typescript.findAllFileReferences",
  --           arguments = { vim.uri_from_bufnr(0) },
  --           open = true,
  --         }
  --       end,
  --       desc = "Fin all file references",
  --     },
  --     {
  --       "<leader>co",
  --       function()
  --         vim.lsp.buf.code_action {
  --           apply = true,
  --           context = {
  --             only = { "source.organizeImports" },
  --             diagnostics = {},
  --           },
  --         }
  --       end,
  --       desc = "Organize imports",
  --     },
  --     {
  --       "<leader>ci",
  --       function()
  --         vim.lsp.buf.code_action {
  --           apply = true,
  --           context = {
  --             only = { "source.addMissingImports.ts" },
  --             diagnostics = {},
  --           },
  --         }
  --       end,
  --       desc = "Add missing imports",
  --     },
  --     {
  --       "<leader>cu",
  --       function()
  --         vim.lsp.buf.code_action {
  --           apply = true,
  --           context = {
  --             only = { "source.removeUnused.ts" },
  --             diagnostics = {},
  --           },
  --         }
  --       end,
  --       desc = "Remove unused imports",
  --     },
  --     {
  --       "<leader>cf",
  --       function()
  --         vim.lsp.buf.code_action {
  --           apply = true,
  --           context = {
  --             only = { "source.fixAll.ts" },
  --             diagnostics = {},
  --           },
  --         }
  --       end,
  --       desc = "Fix all",
  --     },
  --     {
  --       "<leader>cV",
  --       function()
  --         execute { command = "typescript.selectTypeScriptVersion" }
  --       end,
  --       desc = "Select typescript version",
  --     },
  --   },
  -- },
}

-- Setup all servers with the shared options
for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end

require("typescript-tools").setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    -- spawn additional tsserver instance to calculate diagnostics on it
    separate_diagnostic_server = true,
    -- "change"|"insert_leave" determine when the client asks the server about diagnostic
    publish_diagnostic_on = "insert_leave",
    -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
    -- "remove_unused_imports"|"organize_imports") -- or string "all"
    -- to include all supported code actions
    -- specify commands exposed as code_actions
    expose_as_code_action = "all",
    -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
    -- not exists then standard path resolution strategy is applied
    tsserver_path = nil,
    -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
    -- (see 💅 `styled-components` support section)
    tsserver_plugins = {},
    -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
    -- memory limit in megabytes or "auto"(basically no limit)
    tsserver_max_memory = "auto",
    -- described below
    tsserver_format_options = {},
    tsserver_file_preferences = {},
    -- locale of all tsserver messages, supported locales you can find here:
    -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
    tsserver_locale = "en",
    -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
    complete_function_calls = false,
    include_completions_with_insert_text = true,
    -- CodeLens
    -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
    -- possible values: ("off"|"all"|"implementations_only"|"references_only")
    code_lens = "off",
    -- by default code lenses are displayed on all referencable values and for some of you it can
    -- be too much this option reduce count of them by removing member references from lenses
    disable_member_code_lens = true,
  },
}
