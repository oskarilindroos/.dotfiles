--Hybrid line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Font for GUI clients
vim.o.guifont = "GeistMono Nerd Font"

vim.o.completeopt = "menuone,noselect,preview"

-- Neovide specific options
if vim.g.neovide then
  vim.g.neovide_transparency = 0.9
  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  vim.g.neovide_hide_mouse_when_typing = true
end
