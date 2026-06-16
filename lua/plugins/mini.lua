return {
    -- Adds the ability to use gcc/<C-/> to comment or uncomment lines
    {
        'nvim-mini/mini.comment',
        version = false,
        config = function()
            require("mini.comment").setup()
        end
    },
    -- Adds a minimap to large files
    {
        'nvim-mini/mini.map',
        version = false,
        config = function()
            require("mini.map").setup()
            MiniMap.open() -- Automatically open the minimap on start
        end
    },
    -- Allows for argument splitting
    {
        'nvim-mini/mini.splitjoin',
        version = false,
        config = function()
            require("mini.splitjoin").setup()
        end
    },
    -- Animates stuff
    {
        'nvim-mini/mini.animate',
        version = false,
        config = function()
            require("mini.animate").setup()
        end
    },
}
