local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet

local function get_fname(mod)
    return vim.fn.fnamemodify(vim.fn.expand("%"), mod)
end

local function get_fname_upper()
    return get_fname(":t:r"):upper()
end

------------------------------------------------------------------------------------------------------------------------
-- C/CPP
------------------------------------------------------------------------------------------------------------------------

ls.add_snippets("cpp", {
    s("#head", {
        t("#ifndef "), p(get_fname_upper), t({"_H", ""}),
        t("#define "), p(get_fname_upper), t({"_H", ""}),
        i(0),
        t({"", "#endif /* "}), p(get_fname_upper), t("_H"), t(" */")
    })
})

ls.add_snippets("cpp", {
    s("#comment", {
        t("/*"), t(string.rep("*", 78)),
        t({"", " * "}), i(1, "COMMENT"),
        t({"", " *"}), t(string.rep("*", 77)), t("/"),
    })
})

ls.add_snippets("cpp", {
    s("#comment1", {
        t("/*"), t(string.rep("-", 117)), t({"+", ""}), t("|"), t(string.rep(" ", 2)),
        i(1, "COMMENT"), d(2, function(args)
                local slen = args[1][1]:len()
                return sn(nil, {
                    t(string.rep(" ", 116 - slen) .. "|")
                })
            end,
        {1}),
        t({"", "+"}), t(string.rep("-", 117)), t("*/"),
    })
})

ls.add_snippets("cpp", {
    s("#ccomment1", {
        t("// - "), i(1, "COMMENT"), d(2, function(args)
                print(vim.inspect(args))
                return sn(nil, {
                    t(" " .. string.rep("-", 114 - args[1][1]:len()))
                })
            end,
        {1})
    })
})

ls.add_snippets("cpp", {
    s("#doc", {
        t("/"), t(string.rep("*", 78)),
        t({"", " *"}),
        t({"", " * Function     : "}), i(1, "name"),
        t({"", " *"}),
        t({"", " * In-Params    : "}), i(2, "None"),
        t({"", " *"}),
        t({"", " * Out-Params   : "}), i(3, "None"),
        t({"", " *"}),
        t({"", " * Return       : "}), i(4, "None"),
        t({"", " *"}),
        t({"", " * Description  : "}), i(5, "None"),
        t({"", " *"}),
        t({"", " *"}), t(string.rep("*", 77)), t("/"),
    })
})

ls.filetype_extend("c", {"cpp"})

------------------------------------------------------------------------------------------------------------------------
-- LUA
------------------------------------------------------------------------------------------------------------------------

ls.add_snippets("lua", {
    s("#comment", {
        t(string.rep("-", 120)),
        t({"", "-- "}), i(1, "COMMENT"),
        t({"", string.rep("-", 120)}),
    })
})

ls.add_snippets("lua", {
    s("#ccomment", {
        t("-- - "), i(1, "COMMENT"), d(2, function(args)
                return sn(nil, {
                    t(" " .. string.rep("-", 114 - args[1][1]:len()))
                })
            end,
        {1})
    })
})

------------------------------------------------------------------------------------------------------------------------
-- BASH
------------------------------------------------------------------------------------------------------------------------

ls.add_snippets("sh", {
    s("#comment", {
        t(string.rep("#", 80)),
        t({"", "# "}), i(1, "COMMENT"),
        t({"", string.rep("#", 80)}),
    })
})


