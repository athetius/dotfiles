-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
-- Widget Factory
require("vicious")

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/athetius/.config/awesome/themes/hacker/theme.lua")
--beautiful.init("/usr/share/awesome/themes/matrix/theme.lus")
--Special stuff
--awful.placement.no_overlap(c)
--awful.placement.no_offscreen(c)


-- This is used later as the default terminal and editor to run.
terminal = "urxvt -bc"
editor = os.getenv("EDITOR") or "emacs"
editor_cmd = terminal .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
--    awful.layout.suit.spiral,
--    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen
--    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
    -- Each screen has its own tag table.
    tags[s] = awful.tag({ "haupt","dev","www","irc","post","sonst" }, s, layouts[1])
end
-- }}}

-- {{{ Menu
-- Create a laucher widget and a main menu
--require("./menu.lua")


-- {{{ Wibox
-- Icons
spacerwidget = widget({ type = "imagebox" })
spacerwidget.image = image("/home/athetius/.config/awesome/spacer.png")
spacer2widget = widget({ type = "textbox"})
spacer2widget.text = " "
spacer2widget.width = 0
baticon = widget({ type = "imagebox" })
baticon.image = image("/home/athetius/.config/awesome/icons/bat.png")
volicon = widget({ type = "imagebox" })
volicon.image = image("/home/athetius/.config/awesome/icons/vol.png")
memicon = widget({ type = "imagebox" })
memicon.image = image("/home/athetius/.config/awesome/icons/mem.png")
phonesicon = widget({ type = "imagebox" })
phonesicon.image = image("/home/athetius/.config/awesome/icons/phones.png")
tempicon = widget({ type = "imagebox" })
tempicon.image = image("/home/athetius/.config/awesome/icons/temp.png")
calicon = widget({ type = "imagebox" })
calicon.image = image("/home/athetius/.config/awesome/icons/cal.png")
downicon = widget({ type = "imagebox" })
downicon.image = image("/home/athetius/.config/awesome/icons/down.png")
upicon = widget({ type = "imagebox" })
upicon.image = image("/home/athetius/.config/awesome/icons/up.png")
musicicon = widget({ type = "imagebox"})
musicicon.image = image("/home/athetius/.config/awesome/icons/music.png")
wifiicon = widget({ type = "imagebox"})
wifiicon.image = image("/home/athetius/.config/awesome/icons/wifi.png")
pkgicon = widget({ type = "imagebox"})
pkgicon.image = image("/home/athetius/.config/awesome/icons/pacman.png")
diskicon = widget({ type = "imagebox"})
diskicon.image = image("/home/athetius/.config/awesome/icons/disk.png")
mailicon = widget({ type = "imagebox"})
mailicon.image = image("/home/athetius/.config/awesome/icons/mail.png")
clockicon = widget({ type = "imagebox"})
clockicon.image = image("/home/athetius/.config/awesome/icons/time.png")

-- widgets
uptimewidget = widget({ type = "textbox" })
mpdwidget = widget({ type = "textbox" })
netwidget = widget({ type = "textbox" })
memwidget = widget({ type = "textbox" })
cpuwidget = awful.widget.graph()
volwidget = widget({ type = "textbox" }) 
batwidget = widget({ type = "textbox" })
wifiwidget = widget({ type = "textbox" })
pkgwidget = widget({ type = "textbox"})
diskwidget = widget({ type = "textbox"})
-- Register Widgets
vicious.register(uptimewidget, vicious.widgets.uptime, "$1" .. "d " .. "$2" .. "h " .. "$3" .. "m ")
vicious.register(mpdwidget, vicious.widgets.mpd,
    function (widget, args)
        if args["{state}"] == "Stop" then 
            return " - "
        else 
            return "" .. args["{Artist}"]..' - '.. args["{Title}"] .. " "
        end
    end, 1)
vicious.register(netwidget, vicious.widgets.net, "${wlan0 down_kb}KB/s" .. " " .. "${wlan0 up_kb}KB/s", 1)
vicious.register(memwidget, vicious.widgets.mem, "$1% ($2MB/$3MB) ", 5)
vicious.register(cpuwidget, vicious.widgets.cpu, "$1%")
cpuwidget:set_width(50)
--cpuwidget:set_background_color("#494B4F")
--cpuwidget:set_color("#FF5656")
--cpuwidget:set_gradient_colors({ "#FF5656", "#88A175", "#AECF96" })
vicious.register(cpuwidget, vicious.widgets.cpu, "$1")
vicious.register(volwidget, vicious.widgets.volume,
function (widget, args)
if args[1] == 0 or args[2] == "â©" then
return ""  .. "mute" .. ""
else
return ""  .. args[1] .. "% " .. ""
end
end, 2, "Master" )
--volwidget:buttons(
--awful.util.table.join(
--awful.button({ }, 1, function () awful.util.spawn("amixer -q sset Master toggle") end),
--awful.button({ }, 3, function () awful.util.spawn( terminal .. " -e alsamixer") end),
--awful.button({ }, 4, function () awful.util.spawn("amixer -q sset Master 2dB+") end),
--awful.button({ }, 5, function () awful.util.spawn("amixer -q sset Master 2dB-") end)
--)
--)
weatherwidget = widget({ type = "textbox" })
--    vicious.register(weatherwidget, vicious.widgets.weather,
--    function (widget, args)
--        if args["{tempc}"] == "N/A" then
--            return " No Info "
--        else
--            weatherwidget:add_signal('mouse::enter', function () weather_n = { naughty.notify({ title = "" ..  "âââââââââââââ Weather âââââââââââââ" .. coldef .. "", text = "" .. colbblu .. "Wind    : " .. args["{windmph}"] .. " mph " .. args["{wind}"] .. "\nHumidity: " .. args["{humid}"] .. " %\nPressure: " .. args["{press}"] .. " hPa" .. coldef .. "", border_color = "#1a1a1a", timeout = 0, hover_timeout = 0.5 }) } end)
--           weatherwidget:add_signal('mouse::leave', function () naughty.destroy(weather_n[1]) end)
--	   return args["{sky}"] .. ", " .. args["{tempc}"] .. "Â°C " .. args["{windkph}"] .. args["{wind}"] .. " "
--        end
--    end, 60, "KMQY" )

vicious.register(weatherwidget, vicious.widgets.weather, '${sky}' ..  ", " .. '${tempc}' .. "°C " .. '${windkmh}' .. 'km/h' .. " ", 3600, "KMQY")
vicious.register(batwidget, vicious.widgets.bat, '$1' .. '$2' .. "% ", 3, 'BAT1')
vicious.register(wifiwidget, vicious.widgets.wifi, '${ssid}' .. " " .. '${linp}%' .. " ", 1, 'wlan0')
vicious.register(pkgwidget, vicious.widgets.pkg, '$1 ', 3600 ,"Arch")
vicious.register(diskwidget, vicious.widgets.fs, '/ ${/ avail_gb}GB' .. " home " .. '${/home avail_gb}GB ', 15)
-- Create a textclock widget
--require ("bottomwidgets")
mytextclock = awful.widget.textclock({ align = "right" }, " %a %d %b %I:%M%p ")

-- Create a systray
mysystray = widget({ type = "systray" })

-- Create a wibox for each screen and add it
mywibox = {}
mywibox2 = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, awful.tag.viewnext),
                    awful.button({ }, 5, awful.tag.viewprev)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({ width=250 })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
   -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(function(c)
                                              return awful.widget.tasklist.label.currenttags(c, s)
                                          end, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    mywibox2[s] = awful.wibox({ position = "bottom", screen = s })
    -- Add widgets to the wibox - order matters
    mywibox[s].widgets = {
        {
            mytaglist[s],
            spacerwidget,
	    spacer2widget,
            mypromptbox[s],
            layout = awful.widget.layout.horizontal.leftright
        }, 
        spacerwidget,
        mytextclock,
        spacerwidget,
        s == 1 and mysystray or nil,
        spacerwidget,
        volwidget,
        volicon,
        spacerwidget,
        batwidget,
        baticon,
        spacerwidget,
        wifiwidget,
        wifiicon,
        spacerwidget,
        mytasklist[s],
        layout = awful.widget.layout.horizontal.rightleft
    }
    mywibox2[s].widgets = {
        {
            mylauncher,
            spacerwidget,
            phonesicon,
            mpdwidget,
            spacerwidget,
            tempicon,
            weatherwidget,
--            spacerwidget,
--            clockicon,
--            uptimewidget,
--            spacerwidget,
--            pkgicon,
--            pkgwidget,
            spacerwidget,
            layout = awful.widget.layout.horizontal.leftright
        },
        mylayoutbox[s],
--        spacerwidget,
--        batwidget,
--        baticon,
--        spacerwidget,
--        volwidget,
--        volicon,
        spacerwidget,
        memwidget,
        memicon,
        spacerwidget,
        diskwidget,
        diskicon,
        spacerwidget,
        upicon,
        netwidget,
        downicon,
        spacerwidget,
--        wifiwidget,
--        wifiicon,
--        spacerwidget,
        pkgwidget,
        pkgicon,
        spacerwidget,
--        uptimewidget,
--        clockicon,
--        spacerwidget,
--        weatherwidget,
--        tempicon,
--        spacerwidget,
--        mpdwidget,
--        phonesicon,
--        spacerwidget,
--        mylauncher,
        layout = awful.widget.layout.horizontal.rightleft
    }
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show({keygrabber=true}) end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
	awful.key({ modkey,           }, "e",      function () awful.util.spawn(emacs)    end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey, "Shift"   }, "r",      function (c) c:redraw()                       end),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
   keynumber = math.min(9, math.max(#tags[s], keynumber));
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        if tags[screen][i] then
                            awful.tag.viewonly(tags[screen][i])
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      if tags[screen][i] then
                          awful.tag.viewtoggle(tags[screen][i])
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.movetotag(tags[client.focus.screen][i])
                      end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus and tags[client.focus.screen][i] then
                          awful.client.toggletag(tags[client.focus.screen][i])
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = true,
		     size_hints_honor = false,
                     keys = clientkeys,
                     buttons = clientbuttons} },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 3 of screen 1.
    { rule = { class = "Firefox" },
      properties = { tag = tags[1][3] } },
    { rule = { class = "chromium"},
      properties = { tag = tags[1][3] } },
    { rule = { class = "Thunderbird" },
      properties = { tag = tags[1][4] } },
    { rule = { class = "luakit" },
      properties = { tag = tags[1][3] } }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.add_signal("manage", function (c, startup)
    -- Add a titlebar
    -- awful.titlebar.add(c, { modkey = modkey })

    -- Enable sloppy focus
    c:add_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end
end)

client.add_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.add_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

--awful.util.spawn_with_shell("ogg123 -q .config/awesome/login.ogg")
