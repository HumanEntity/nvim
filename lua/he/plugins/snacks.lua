return {
    "folke/snacks.nvim",
    lazy = false,
    opts = {
        words = {
            -- your words configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        dashboard = {
            preset = {
                header = ""
                    .. "██╗  ██╗██╗   ██╗███╗   ███╗ █████╗ ███╗   ██╗  \n"
                    .. "██║  ██║██║   ██║████╗ ████║██╔══██╗████╗  ██║  \n"
                    .. "███████║██║   ██║██╔████╔██║███████║██╔██╗ ██║  \n"
                    .. "██╔══██║██║   ██║██║╚██╔╝██║██╔══██║██║╚██╗██║  \n"
                    .. "██║  ██║╚██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║  \n"
                    .. "╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝  \n"
                    .. "\n"
                    .. "███████╗███╗   ██╗████████╗██╗████████╗██╗   ██╗\n"
                    .. "██╔════╝████╗  ██║╚══██╔══╝██║╚══██╔══╝╚██╗ ██╔╝\n"
                    .. "█████╗  ██╔██╗ ██║   ██║   ██║   ██║    ╚████╔╝ \n"
                    .. "██╔══╝  ██║╚██╗██║   ██║   ██║   ██║     ╚██╔╝  \n"
                    .. "███████╗██║ ╚████║   ██║   ██║   ██║      ██║   \n"
                    .. "╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝   ╚═╝      ╚═╝   \n",
            },
            sections = {
                { section = "header" },
                {
                    section = "terminal",
                    pane = 2,
                    cmd = "chafa ~/Documents/Wallpapers/fish.jpeg --format symbols --symbols vhalf --size 60x17 --stretch",
                    height = 17,
                    padding = 1,
                },
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                { section = "startup" },
            },
        },
    },
}
