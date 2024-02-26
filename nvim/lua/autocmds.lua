-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_augroup =
    vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_augroup,
    pattern = "*",
})
