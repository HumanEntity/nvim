return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()

			require("gopher.dap").setup()

			local M = {}

			local dap, dapui, dapvt = require("dap"), require("dapui"), require("nvim-dap-virtual-text")

			dapvt.setup({
				commented = false,
				highlight_new_as_changed = true,
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			M.keymaps = {
				{ "n", "<leader>dt", ":DapToggleBreakpoint<CR>", { desc = "Toggle breakpoint" } },
				{ "n", "<leader>dx", ":DapTerminate<CR>", { desc = "Terminate" } },
				{ "n", "<leader>dn", ":DapStepOver<CR>", { desc = "Step over" } },
				{ "n", "<leader>di", ":DapStepInto<CR>", { desc = "Step into" } },
				{ "n", "<leader>do", ":DapStepOut<CR>", { desc = "Step out" } },
				{ "n", "<leader>dc", ":DapContinue<CR>", { desc = "Start/Continue" } },
				{
					"n",
					"<leader>dr",
					function()
						require("dapui").open({ reset = true })
					end,
					{ desc = "Reopen windows" },
				},
			}

			for _, v in pairs(M.keymaps) do
				local opts = v[4] or {}
				opts.silent = true
				vim.keymap.set(v[1], v[2], v[3], opts)
			end

			vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>")
			vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>")
			vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>")

			local mason_registry = require("mason-registry")

			local codelldb = mason_registry.get_package("codelldb")
			local codelldb_exe = codelldb:get_install_path() .. "/codelldb"
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb_exe,
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.cpp = {
				{
					name = "Launch",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},

					-- 💀
					-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
					--
					--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
					--
					-- Otherwise you might get the following error:
					--
					--    Error on launch: Failed to attach to the target process
					--
					-- But you should be aware of the implications:
					-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
					-- runInTerminal = false,
				},
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp
			dap.configurations.odin = dap.configurations.cpp

			return M
		end,
		ft = { "rust", "go", "odin" },
		enabled = false,
	},
}
