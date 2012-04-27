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
if args[1] == 0 or args[2] == "♩" then
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
mytextclock = awful.widget.textclock({ align = "right" }, " %a %d %b %H.%M ")

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
		   mylauncher,
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