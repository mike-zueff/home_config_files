local awful = require("awful")

local awesome_dex_lock_file = "dex_had_been_executed"
local awesome_run_time_directory = "/tmp/run_time/awesome-related"

function execute_once(process_name, argv, launcher)
  if process_name == "dex" and awful.util.file_readable(awesome_run_time_directory .. "/" .. awesome_dex_lock_file) then
    return
  end

  if not launcher then
    launcher = process_name
  end

  if argv then
    awful.util.spawn_with_shell("pgrep --euid ${USER} --exact '" .. process_name .. " " .. argv .. "' --full || (" .. launcher .. " " .. argv .. " &)")
  else
    awful.util.spawn_with_shell("pgrep --euid ${USER} --exact '" .. process_name .. "' --full || (" .. launcher .. " &)")
  end

  if process_name == "dex" then
    awful.util.spawn_with_shell("mkdir --parents " .. awesome_run_time_directory)
    awful.util.spawn_with_shell("touch " .. awesome_run_time_directory .. "/" .. awesome_dex_lock_file)
  end
end

awful.util.spawn_with_shell("nitrogen --restore")
execute_once("dex", "--autostart")
execute_once("goldendict")
