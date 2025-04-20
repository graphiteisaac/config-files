return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
        options = {
            highlight = {
                disable = { 'help', 'doc' },
            }
        }
    },
    config = function()
        -- LFE Tree-Sitter Configuration for Neovim

        local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

        -- Add LFE as a parser
        parser_config.lfe = {
            install_info = {
                url = "~/tree-sitters/tree-sitter-lfe", -- Replace with actual path to your grammar repo
                files = { "src/parser.c" },
                branch = "main",
                generate_requires_npm = false,
                requires_generate_from_grammar = true,
            },
            filetype = "lfe",
        }

        -- Custom highlight groups for LFE
        vim.api.nvim_set_hl(0, "LfeDefun", { fg = "#56B6C2", bold = true })
        vim.api.nvim_set_hl(0, "LfeModule", { fg = "#C678DD", bold = true })
        vim.api.nvim_set_hl(0, "LfeSpecial", { fg = "#E5C07B" })

-- Highlight query for LFE
local query = vim.treesitter.query.parse('lfe', [[
  ;; Highlight function definitions
  (defun 
    [(symbol) @lfe.defun])
  
  ;; Highlight module definitions
  (defmodule 
    [(symbol) @lfe.module])
  
  ;; Highlight special forms
  ["defun" "defn" "defmodule" "defrecord" "deftype"] @lfe.special_form
  
  ;; Highlight literals
  (number) @number
  (string) @string
  (boolean) @boolean
  
  ;; Highlight comments
  (comment) @comment
]])

        -- Function to apply LFE-specific highlights
        local function apply_lfe_highlights(bufnr)
            local language_tree = vim.treesitter.get_parser(bufnr, 'lfe')
            if not language_tree then return end

            local syntax_tree = language_tree:parse()

            local root = syntax_tree[1]:root()

            for id, node, metadata in query:iter_captures(root, bufnr, 0, -1) do
                local capture_name = query.captures[id]
                local start_row, start_col, end_row, end_col = node:range()

                if capture_name == 'lfe.defun' then
                    vim.api.nvim_buf_add_highlight(bufnr, -1, 'LfeDefun', start_row, start_col, end_col)
                elseif capture_name == 'lfe.module' then
                    vim.api.nvim_buf_add_highlight(bufnr, -1, 'LfeModule', start_row, start_col, end_col)
                elseif capture_name == 'lfe.special_form' then
                    vim.api.nvim_buf_add_highlight(bufnr, -1, 'LfeSpecial', start_row, start_col, end_col)
                end
            end
        end

        -- Create autocommand to apply highlights
        vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
            pattern = "*.lfe",
            callback = function()
                apply_lfe_highlights(0)
            end
        })

        -- Ensure tree-sitter highlight is enabled
        require('nvim-treesitter.configs').setup {
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        }

        -- Optional: Add filetype detection
        vim.filetype.add({
            extension = {
                lfe = "lfe"
            }
        })

        require 'nvim-treesitter.configs'.setup {
            highlight = {
                enable = true,
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
            },
            autotag = {
                enabled = true
            }
        }
    end
}
