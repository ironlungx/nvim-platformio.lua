local M = {}

function M.check()
  -- Use vim.health in Neovim 0.8+ or health in older versions if available
  local health
  if vim.fn.has('nvim-0.8') == 1 then
    health = vim.health
  else
    health = require('health')
  end

  health.start('platformio')

  if vim.fn.executable('pio') == 1 then
    health.ok('platformio executable found')
  else
    health.error('platformio executable not found', 'Install PlatformIO Core from https://platformio.org/install')
  end
end

return M
