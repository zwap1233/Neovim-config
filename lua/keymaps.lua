-- NOTE: general neovim keybindings

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- diagnostics quickfix list
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode

-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- set group description for debug and makefile commands (debug keymaps are found in the files for their respective plugins)
require("which-key").add({
	{ "<leader>d", group = "+[D]ebuging" },
	{ "<leader>m", group = "+[M]akefiles" },
	{ "<leader>g", group = "+[G]it" },
	{ "<leader>a", group = "+[A]i" },
})

-- set makefile keymaps
vim.keymap.set("n", "<leader>mm", ":make<CR>", { desc = "[M]ake" })
vim.keymap.set("n", "<leader>mc", ":make clean<CR>", { desc = "Make [C]lean" })
vim.keymap.set("n", "<leader>mi", ":make install<CR>", { desc = "Make [I]nstall" })
vim.keymap.set("n", "<leader>mt", ":make<space>", { desc = "Make [T]arget" })

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "[F]ormat buffer" })

-- NOTE: inspect the config of a lsp client
local function inspect_lsp_client()
	vim.ui.input({ prompt = "Enter LSP Client name: " }, function(client_name)
		if client_name then
			local client = vim.lsp.get_clients({ name = client_name })

			if #client == 0 then
				vim.notify("No active LSP clients found with this name: " .. client_name, vim.log.levels.WARN)
				return
			end

			-- Create a temporary buffer to show the configuration
			local buf = vim.api.nvim_create_buf(false, true)
			local win = vim.api.nvim_open_win(buf, true, {
				relative = "editor",
				width = math.floor(vim.o.columns * 0.75),
				height = math.floor(vim.o.lines * 0.90),
				col = math.floor(vim.o.columns * 0.125),
				row = math.floor(vim.o.lines * 0.05),
				style = "minimal",
				border = "rounded",
				title = " " .. (client_name:gsub("^%l", string.upper)) .. ": LSP Configuration ",
				title_pos = "center",
			})

			local lines = {}
			for i, this_client in ipairs(client) do
				if i > 1 then
					table.insert(lines, string.rep("-", 80))
				end
				table.insert(lines, "Client: " .. this_client.name)
				table.insert(lines, "ID: " .. this_client.id)
				table.insert(lines, "")
				table.insert(lines, "Configuration:")

				local config_lines = vim.split(vim.inspect(this_client.config), "\n")
				vim.list_extend(lines, config_lines)
			end

			-- Set the lines in the buffer
			vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

			-- Set buffer options
			vim.bo[buf].modifiable = false
			vim.bo[buf].filetype = "lua"
			vim.bo[buf].bh = "delete"

			vim.api.nvim_buf_set_keymap(buf, "n", "q", ":q<CR>", { noremap = true, silent = true })
		end
	end)
end

vim.keymap.set("n", "<leader>il", inspect_lsp_client, { desc = "[I]nspect a [L]SP" })
