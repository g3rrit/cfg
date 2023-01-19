local http = require "socket.http"
local ltn12 = require "ltn12"
local json = require "json"
local rep = require "rep"

local api_key = os.getenv("OPENAI_API_KEY")

local M = {}

function M.get_completions(prompt, max_tokens, temperature)

    if max_tokens == nil then
        max_tokens = 100
    end

    if temperature == nil then
        temperature = 0
    end

    if max_tokens > 4000 then
        print("ERROR: too many tokens " .. max_tokens)
        return
    end

    local response_body = {}
    local request_body = json.encode({
        model = "text-davinci-003",
        prompt = prompt,
        max_tokens = max_tokens,
        temperature = temperature 
    })

    local completion_api = "https://api.openai.com/v1/completions"

    local res, code, headers, _ = http.request {
        method = "POST",
        url = completion_api,
        headers = {
            ["Content-Type"] = "application/json",
            ["Content-Length"] = string.len(request_body),
            ["Authorization"] = "Bearer " .. api_key
        },
        source = ltn12.source.string(request_body),
        sink = ltn12.sink.table(response_body)
    }

    local response = json.decode(response_body[1]).choices[1].text

    return response

end

return M


