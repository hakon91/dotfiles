return {
    "Civitasv/cmake-tools.nvim",
    opts = {
        cmake_build_directory = "build",
        cmake_executor = {
            default_opts = {
                quickfix = {
                    auto_close_when_success = false,
                },
            },
        },
    },


    dependenices = {
        "nvim-lua/plenary.nvim",
        'stevearc/overseer.nvim',
        "akinsho/toggleterm.nvim",
    }
}
