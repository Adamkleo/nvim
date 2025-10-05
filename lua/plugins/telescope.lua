return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.8',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
        local builtin = require('telescope.builtin')
        
        -- Setup telescope
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {
                    "%.git/",
                    "node_modules/",
                    "%.DS_Store",
                },
            }
        })
        
        -- Regular keymaps (no hidden files)
        vim.keymap.set('n', '<leader>tf', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = 'Live grep' })
        vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = 'Find buffers' })
	vim.keymap.set('n', '<leader>tl', builtin.lsp_workspace_symbols, { desc = 'Sys-wide search' })        
        -- Hidden file keymaps
        vim.keymap.set('n', '<leader>tF', function()
            builtin.find_files({ hidden = true })
        end, { desc = 'Find files (including hidden)' })
        
        vim.keymap.set('n', '<leader>tG', function()
            builtin.live_grep({ 
                additional_args = function() return {"--hidden"} end 
            })
        end, { desc = 'Live grep (including hidden)' })
    end
}
