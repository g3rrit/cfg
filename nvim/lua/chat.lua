local http = require "socket.http"
local ltn12 = require "ltn12"
local json = require "json"
local buffer_rep = require "buffer_rep"

local api_key = os.getenv("OPENAI_API_KEY")

local M = {}

function M.get_completions(prompt)

    local response_body = {}
    local request_body = json.encode({
        model = "text-davinci-003",
        prompt = prompt,
        max_tokens = 4000,
        temperature = 0
    })

    local completion_api = "https://api.openai.com/v1/completions"

    local res, code, headers, status = http.request {
        method = "POST",
        url = completion_api,
        headers = {
            ["Content-Type"] = "application/json",
            ["Content-Length"] = string.len(request_body),
            ["Authorization"] = "Bearer "..api_key
        },
        source = ltn12.source.string(request_body),
        sink = ltn12.sink.table(response_body)
    }

    local response = json.decode(response_body[1]).choices[1].text
    response = string.gsub(response, "\n", "")

    return response

end

function M.rep()
    buffer_rep.rep(function(text_input)
        print("Calling ChatGPT")
        local response = M.get_completions(text_input)

        local result               = {}
        local from                 = 1
        local delim_from, delim_to = string.find(response, "[.]", from)
        while delim_from do
            local result_line = string.sub(response, from, delim_from)
            result_line = string.gsub(result_line, "^%s+", "")
            table.insert(result, result_line)
            from                 = delim_to + 1
            delim_from, delim_to = string.find(response, "[.]", from)
        end
        table.insert(result, string.sub(response, from))

        return result
    end)
end

return M
