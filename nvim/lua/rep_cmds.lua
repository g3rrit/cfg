local rep = require "rep"

local M = {}

function M.trans_rep(args)
    rep.rep_proc(function(text_input, src, dst)

        if src == nil then
            src = "en"
        end

        if dst == nil then
            dst = "de"
        end

        return "trans", { "-b", "-s", src, "-t", dst, text_input }
    end, args)
end

return M
