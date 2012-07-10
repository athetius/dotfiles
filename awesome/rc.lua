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
beautiful.init("$HOME/.config/awesome/themes/hacker/theme.lua")
--Special stuff
--awful.placement.no_overlap(c)
--awful.placement.no_offscreen(c)


-- This is used later as the default terminal and editor to run.
terminal = "urxvt -bc"
editor = os.getenv("EDITOR") or "emacs"
editor_cmd = terminal .. " -e " .. editor
-- }}}
-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"
-- layouts and tags and rules and signals
require("layouts")
-- Menu
require("menu")
-- widgets
require("widgets")
--Key Bindings
require("keybindings")
