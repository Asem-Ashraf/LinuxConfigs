local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local types = require("luasnip.util.types")


ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		-- [types.choiceNode] = {
		-- 	active = {
		-- 		virt_text = {{ "choiceNode", "Comment" }},
		-- 	},
		-- },
	},
})
-- keymap
vim.keymap.set({"i", "s"}, "<C-j>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, {silent = true})


vim.keymap.set({"i", "s"}, "<C-k>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, {silent = true})

vim.keymap.set("n", "<leader><leader>s","<cmd>so ~/.config/nvim/after/plugin/luasnip.lua<CR>", {silent = true})
vim.keymap.set({"i", "s"}, "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

ls.add_snippets("c", {
	s("main",c(1,{
		{t({"int main("}),i(nil,"int argc, char* argv[]"),t({"){","	"}),i(1), t({"","	return 0;","}"})},
		{t({"int main(void){", "	"}),i(1), t({"" ,"	return 0;","}"})},
		{t({"int main(void){",
			"	while(1){",
			"	"}),i(1), t({"",
			"	}",
			"	return 0;",
			"}"})},
	})),
	ls.parser.parse_snippet("fn","$1 $2($3){\n\t$4\n\treturn $5;\n}"),
})

ls.add_snippets("lua",{
})
