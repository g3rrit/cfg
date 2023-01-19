local rep = require "rep"

local M = {}

function M.chat_rep(args)

    rep(function(text_input, cb, max_tokens)

        local chat = require "chat"
        local uv = vim.loop

        if max_tokens ~= nil then
            max_tokens = tonumber(max_tokens)
        end

        print("Calling ChatGPT :: ", max_tokens)
        local response = chat.get_completions(text_input, max_tokens)

        if response == nil then
            uv.async_send(cb, { "ERROR" })
            return
        end

        response = string.gsub(response, "\n", "")

        local lines                = {}
        local from                 = 1
        local delim_from, delim_to = string.find(response, "[.]", from)
        while delim_from do
            local result_line = string.sub(response, from, delim_from)
            result_line = string.gsub(result_line, "^%s+", "")
            table.insert(lines, result_line)
            from                 = delim_to + 1
            delim_from, delim_to = string.find(response, "[.]", from)
        end
        table.insert(lines, string.sub(response, from))

        local res = table.concat(lines, "\n")

        uv.async_send(cb, res)
    end, args)
end

return M
