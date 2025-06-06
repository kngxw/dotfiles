vim.g.fzf_layout = { down = "41%" }
vim.g.fzf_vim = { preview_window = { "right,41%,<70(up,41%)" } }
vim.api.nvim_create_autocmd("filetype", {
    pattern = "fzf",
    group = vim.api.nvim_create_augroup("fzfcfg", { clear = true }),
    callback = function()
        vim.opt_local.laststatus = 0
        vim.opt_local.showmode = false
        vim.opt_local.ruler = false

        vim.api.nvim_create_autocmd('bufleave', {
            buffer = 0,
            callback = function()
                vim.opt_local.laststatus = 2
                vim.opt_local.showmode = true
                vim.opt_local.ruler = true
            end,
        })
    end,
})
vim.keymap.set("n", "<leader>f", vim.cmd.Files)
vim.keymap.set("n", "<leader>F", vim.cmd.GFiles)
-- fzf runtime path
vim.opt.rtp:append(vim.fn.system("which fzf"):gsub("\n", ""))
