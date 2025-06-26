return {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        cmake_build_directory = "build",
        cmake_executor = {
            name = "quickfix",
            default_opts = {
                quickfix = {
                    auto_close_when_success = false,
                },
            },
        },
    },
}
