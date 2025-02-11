return {
  "akinsho/bufferline.nvim",                        -- Plugin path for bufferline.nvim
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons dependency
  version = "*",                                    -- Automatically get the latest version
  event = "BufReadPre",                             -- Load the plugin on buffer read
  opts = {
    options = {
      mode = "tabs",             -- Use tabs mode instead of buffers
      separator_style = "thick", -- Thick separators for visual clarity
      themeable = true,
      numbers = "buffer_id",     -- Display buffer IDs
      color_icons = true,        -- Enable colored icons
      always_show_bufferline = true, -- Show only when there are more than 1 tab
      hover = {                  -- Hover configuration
        enabled = true,          -- Enable hover
        delay = 200,             -- Delay hover by 200ms
        reveal = { 'close' }     -- Reveal close button on hover
      },
      indicator = {
        icon = '',               -- No specific icon for the indicator
        style = 'icon',          -- Style the indicator as an icon
      },
    }
  },
  config = function(_, opts)
    require('bufferline').setup(opts) -- Pass options during setup
  end
}

