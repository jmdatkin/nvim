return {
    "nvim-tree/nvim-tree.lua",
    config = function()
        vim.g.loaded_netrw       = 1
        vim.g.loaded_netrwPlugin = 1

        vim.keymap.set("n", "<Leader>ft", "<cmd>NvimTreeToggle<CR>", {silent = true})

        -- OR setup with some options
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })
    end,
    on_attach = function()
        local api = require "nvim-tree.api"

        local function opts(desc)
            return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- custom mappings
        vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
        vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
    end
}
