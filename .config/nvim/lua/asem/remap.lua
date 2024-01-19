vim.g.mapleader = " "
vim.keymap.set({ 'i' }, 'jj' , '<Esc>')
vim.keymap.set({ 'i' }, 'JJ' , '<Esc>')

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
--  A shortcut for switching between windows.
vim.keymap.set('n', '<leader>h', '<C-w>h', { silent = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { silent = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { silent = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { silent = true })

-- keymap for ex
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Moves highlighted block up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
-- overwriting text without copying it.
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- third greatest remap ever: asem
-- cuts the current line if it is more than 80 characters without cutting in the
-- middle of a word and puts its remaining on the next line if the line is less
-- than 80 characters it just goes to the next line
function my_keybind()
    local count = vim.v.count1
    while (count > 0)
        do
        local line_length = vim.fn.strdisplaywidth(vim.fn.getline('.'))
        -- local line_length = #vim.fn.getline('.')
        -- Check if the current line is the last line in the file
        -- future feature: make this 80 a variable that can be set by the user
        -- either through a global variable or a vim command variable
        if line_length > 80 then
            -- The x in the last string is mandatory so that the commands in the
            -- first string is executed immediately rather than be saved in a
            -- typeahead buffer. If they were saved in a typeahead buffer then
            -- when getting the line size it would be the same size before any
            -- modification which is not the desired behavior because the size
            -- of the current line should change after these commands are
            -- executed, and the next iteration of the loop must operate on the
            -- new size for this function to execute as desired.
            vim.cmd([[call feedkeys("83|Bi".nr2char(8).nr2char(10).nr2char(27)."0","nx")]])
        else
            vim.cmd([[call feedkeys("j0","nx")]])
        end
        count = count - 1
    end
end

-- <C-U> clears the command line before executing the command
-- To understand why <C-U> is needed, try writing a number then pressing :
-- you will find that the command line is filled with the number you wrote
-- and the cursor is at the end of the number. If you then press <C-U> the
-- number will be cleared and the cursor will be at the beginning of the
-- command line while keeping the number in the v.count variable.
-- this was in a note in :help count1
-- always read the manual
vim.api.nvim_set_keymap('n', '<leader>n', ':<C-U>lua my_keybind()<CR>', {silent=true})



vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>',{silent = true})

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/asem/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");


-- Compile the current buffer with lualatex
vim.keymap.set("n", "<leader>clt", "<cmd>w<CR><cmd>!lualatex % > output.txt<CR><CR>",{silent=true})

-- vim.keymap.set("n", "<leader><leader>", function()
--
--     vim.cmd("so")
-- end)

-- The x in the last string is mandatory so that the commands in the first 
-- string is executed immediately rather than be saved in a typeahead buffer. If 
-- they were saved in a typeahead buffer then when getting the line size it 
-- would be the same size before any modification which is not the desired 
-- behavior because the size of the current line should change after these 
-- commands are executed, and the next iteration of the loop must operate on the 
-- new size for this function to execute as desired.
