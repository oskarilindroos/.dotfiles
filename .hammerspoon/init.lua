-- Enables the `hs` command line tool
require("hs.ipc")

-- Move every window (including minimized and hidden ones) to the given screen.
-- Triggered via URL: open -g hammerspoon://move-all-windows-to-main
--                    open -g hammerspoon://move-all-windows-to-second
local function moveAllWindowsTo(target, label)
  if not target then
    hs.alert.show("No " .. label .. " monitor connected")
    return
  end

  local moved = 0

  for _, win in ipairs(hs.window.allWindows()) do
    if win:isStandard() and not win:isFullScreen() and win:screen() ~= target then
      local app = win:application()
      local wasHidden = app and app:isHidden()
      local wasMinimized = win:isMinimized()

      if wasHidden then app:unhide() end
      if wasMinimized then win:unminimize() end

      win:moveToScreen(target, false, true, 0)
      moved = moved + 1

      if wasMinimized then win:minimize() end
      if wasHidden then app:hide() end
    end
  end

  hs.alert.show(string.format("Moved %d window%s to %s monitor", moved, moved == 1 and "" or "s", label))
end

-- First connected screen that isn't the main one
local function secondaryScreen()
  local main = hs.screen.primaryScreen()
  for _, screen in ipairs(hs.screen.allScreens()) do
    if screen ~= main then return screen end
  end
end

hs.urlevent.bind("move-all-windows-to-main", function()
  moveAllWindowsTo(hs.screen.primaryScreen(), "main")
end)

hs.urlevent.bind("move-all-windows-to-second", function()
  moveAllWindowsTo(secondaryScreen(), "second")
end)
