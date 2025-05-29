-- lua/custom/mappings.lua
local M = {}

function M.setup()
  vim.keymap.set('n', '<leader>h', function()
    -- Define the path for our flag file
    local flag_file_path = vim.fn.expand '~/.nvim_should_launch_hummingbird'

    -- Create the flag file. writefile creates it if it doesn't exist.
    -- The content doesn't matter, just its existence.
    vim.fn.writefile({}, flag_file_path)
    print('Flag file created at: ' .. flag_file_path) -- For debugging, view with :messages

    -- Quit Neovim with a non-zero exit code.
    -- This is important if the wrapper script also checks the exit code,
    -- but the flag file is the primary mechanism here.
    vim.cmd 'cq'
  end, { noremap = true, silent = false, desc = 'Flag quit and launch Hummingbird via wrapper' })
  -- Set silent = false temporarily for debugging if needed to see the print message easily
end

return M
