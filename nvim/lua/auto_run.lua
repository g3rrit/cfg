
local function search_project_config()

    local project_dir = vim.fn.finddir(".git/..", vim.fn.expand("%:p:h") .. ";") .. "/"
    local config_paths = { ".nvim.lua" }
    local project_config = ""

    for _, p in ipairs(config_paths) do
        p = project_dir .. p
        local f = io.open(p)
        if f ~= nil then
            f:close()
            project_config = p
            break
        end
    end

    if project_config == "" then
        return
    end

    vim.notify("[nvim-utils] Found nvim project configuration at." .. project_config, vim.log.levels.INFO, nil)

    vim.cmd(":luafile " .. project_config)
end

search_project_config()
