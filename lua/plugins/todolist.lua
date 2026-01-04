return {
    {
        dir = "~/nvim-plugins/todolist.nvim",
        config = function()
            require "todolist".setup()
        end
    }
}
