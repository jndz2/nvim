local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_status then
    return
end

autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = { "string" }, -- it will not add a pair on that treesitter node
        javascript = { "template_string" },
        java = false, -- don't check treesitter on java
    },
})

local autopairs_cmp_status, autopairs_cmp = pcall(require, "nvim-autopairs.completion.cmp")
if not autopairs_cmp_status then
    return
end

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done())
