local awful = require("awful")

local awesome_dex_lock_file = "dex_had_been_executed"
local awesome_goldendict_lock_file = "goldendict_had_been_executed"
local awesome_run_time_directory = "/tmp/run_time/awesome-related"

function execute_once(process_name, argv, launcher)
  if process_name == "dex" and awful.util.file_readable(awesome_run_time_directory .. "/" .. awesome_dex_lock_file) then
    return
  end

  if process_name == "goldendict" and awful.util.file_readable(awesome_run_time_directory .. "/" .. awesome_goldendict_lock_file) then
    return
  end

  if not launcher then
    launcher = process_name
  end

  if argv then
    awful.spawn.with_shell("pgrep --euid ${USER} --exact '" .. process_name .. " " .. argv .. "' --full || (" .. launcher .. " " .. argv .. " &)")
  else
    awful.spawn.with_shell("pgrep --euid ${USER} --exact '" .. process_name .. "' --full || (" .. launcher .. " &)")
  end

  if process_name == "dex" then
    awful.spawn.with_shell("mkdir --parents " .. awesome_run_time_directory)
    awful.spawn.with_shell("touch " .. awesome_run_time_directory .. "/" .. awesome_dex_lock_file)
  end

  if process_name == "goldendict" then
    awful.spawn.with_shell("mkdir --parents " .. awesome_run_time_directory)
    awful.spawn.with_shell("touch " .. awesome_run_time_directory .. "/" .. awesome_goldendict_lock_file)
  end
end

awful.spawn.with_shell("nitrogen --restore")

mytextclock:buttons(awful.util.table.join(awful.button({ }, 1, function ()
  awful.spawn.with_shell(terminal .. " -e bash --rcfile " .. awful.util.getdir("config") .. "calendar.sh")
end)))

tag.connect_signal("property::selected", function(t)
  for _, c in ipairs(t:clients()) do
    if c.fullscreen then
      c:raise()
    end
  end
end)

execute_once("dex", "--autostart")
execute_once("goldendict")
awful.spawn.with_shell(awful.util.getdir("config") .. "colormgr")
awful.spawn.with_shell(awful.util.getdir("config") .. "mediawiki.sh")
