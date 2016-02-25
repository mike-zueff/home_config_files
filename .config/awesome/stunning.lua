local awful = require("awful")

function execute_once(process_name, argv, launcher)
  if not launcher then
    launcher = process_name
  end

  if argv then
    awful.util.spawn_with_shell("pgrep --euid ${USER} --exact '" .. launcher .. " " .. argv .. "' --full || (" .. process_name .. " " .. argv .. " &)")
  else
    awful.util.spawn_with_shell("pgrep --euid ${USER} --exact '" .. launcher .. "' --full || (" .. process_name .. " &)")
  end
end

awful.util.spawn_with_shell("nitrogen --restore")
execute_once("goldendict")
