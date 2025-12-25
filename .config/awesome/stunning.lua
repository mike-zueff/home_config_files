local awful = require("awful")
local gears = require("gears")

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

local function update_wibar_for_screen(s)
  if not s or not s.mywibox then return end

  for _, c in ipairs(s.clients) do
    if c.fullscreen and c:isvisible() then
      s.mywibox.visible = false
      return
    end
  end

  s.mywibox.visible = true
end

client.connect_signal("property::fullscreen", function(c)
  update_wibar_for_screen(c.screen)
end)

client.connect_signal("property::screen", function(c)
  update_wibar_for_screen(c.screen)
end)

tag.connect_signal("property::selected", function(t)
  update_wibar_for_screen(t.screen)
end)

client.connect_signal("unmanage", function(c)
  update_wibar_for_screen(c.screen)
end)

client.connect_signal("manage", function(c)
  local class = c.class or ""

  if class == "TelegramDesktop" then
    gears.timer.delayed_call(function()
      update_wibar_for_screen(c.screen)
    end)
  end
end)

execute_once("dex", "--autostart")
execute_once("goldendict")
awful.spawn.with_shell(awful.util.getdir("config") .. "colormgr")
awful.spawn.with_shell(awful.util.getdir("config") .. "mediawiki.sh")
