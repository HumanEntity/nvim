return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-neotest/nvim-nio",

            "williamboman/mason.nvim",
        },
        config = function()
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

            dapui.setup({
                expand_lines = true,
                controls = { enabled = false },
                floating = { border = "rounded" },
                render = {
                    max_type_length = 60,
                    max_value_lines = 200,
                },
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 1.0 },
                        },
                        size = 15,
                        position = "bottom",
                    },
                },
            })

            vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>")
            vim.keymap.set("n", "<leader>dx", ":DapTerminate<CR>")
            vim.keymap.set("n", "<leader>ds", ":DapStepOver<CR>")

            local mason_registry = require("mason-registry")

            -- local codelldb = mason_registry.get_package("codelldb")
            -- local codelldb_exe = codelldb:get_install_path() .. "/codelldb"
            dap.adapters.codelldb = {
                type = "server",
                port = "${port}",
                executable = {
                    command = "codelldb",
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
        ft = { "rust", "odin", "c" },
    },
}
