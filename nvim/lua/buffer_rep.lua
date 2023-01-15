local loop = vim.loop
local api = vim.api

require "utils"

local M = {}

function M.rep(fn)

    local startl = api.nvim_buf_get_mark(0,"<")[1] - 1
    local endl = api.nvim_buf_get_mark(0,">")[1] - 1

    local selection = api.nvim_buf_get_text(0, startl, 0, endl, 0, {})

    local output_line = -1
    local read = false

    local text_input = ""

    for k, v in pairs(selection) do

        if v == "===" then
            read = false
            output_line = startl + k
        end

        if read then
            text_input = text_input .. "\n" .. v
        end

        if v == ">>>" then
            read = true
        end

    end

    if text_input == "" or output_line == -1 then
        print("ERROR: No start (>>>) or end (===) token found in selection")
        return
    end

    local response = fn(text_input)

    table.insert(response, "<<<")

    api.nvim_buf_set_lines(0, output_line, output_line, true, response)
end

return M

