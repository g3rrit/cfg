
local M = {}

function M.reload_config()
    for name,_ in pairs(package.loaded) do
        if name:match('^cnull') then
            package.loaded[name] = nil
        end
    end

    vim.api.nvim_command("source $MYVIMRC")
end

return M

