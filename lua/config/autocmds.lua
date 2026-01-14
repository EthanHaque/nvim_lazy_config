local autocmd = vim.api.nvim_create_autocmd


-- Highlight on yank
autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 1000,
        })
    end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})

-- Don"t auto comment new lines
autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})


-- Set colorcolumn
autocmd("Filetype", {
    pattern = "*",
    command = "set colorcolumn=120",
})

