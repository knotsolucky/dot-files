return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        -- Key mappings for Telescope file browser
        vim.keymap.set("n", "<space>fb", ":Telescope file_browser<CR>")

        -- Open file_browser with the path of the current buffer
        vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

        -- Alternatively, using the Lua API
        vim.keymap.set("n", "<space>fb", function()
            require("telescope").extensions.file_browser.file_browser()
        end)
    end
}

