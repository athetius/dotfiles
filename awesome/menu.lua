omemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mygames= {
   { "OpenTTD", "openttd"},
   { "Dosbox", "dosbox"},
   { "ScummVM", "scummvm"}
}

mybbcradio = {
   { "1", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/r1_aaclca.pls" },
   { "1xtra", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/r1x_aaclca.pls" },
   { "2", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/r2_aaclca.pls" },
   { "3", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/r3_aaclca.pls" },
   { "4", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/r4_aaclca.pls" },
   { "4 LW", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/r4lw_aaclca.pls" },
   { "4xtra", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/r4x_aaclca.pls" },
   { "5", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/r5l_aaclca.pls" },
   { "5xtra", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/r5lsp_aaclca.pls" },
   { "6", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/r6_aaclca.pls" },
   { "Asian", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/radio/listen/live/ran_aaclca.pls" },
   { "World", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/worldservice/meta/tx/nb/live/ennws.asx" },
   { "World News", "vlc --no-qt-notification --qt-start-minimized http://www.bbc.co.uk/worldservice/meta/tx/nb/live/eneuk.pls" },
   { "London", "vlc --no-qt-notification --qt-start-minimized  http://bbc.co.uk/radio/listen/live/bbclondon.asx" }
}

mydidotfm = {
   { "Ambient", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/ambient.pls" },
   { "Chiptune", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/chiptunes.pls" },
   { "Classic Trance", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/classictrance.pls" },
   { "Electro", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/electro.pls" },
   { "Electronica", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/classictechno.pls" },
   { "Future Synthpop", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/futuresynthpop.pls" },
   { "Minimal", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/minimal.pls" },
   { "Space Music", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/spacemusic.pls" },
   { "Techno", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/techno.pls"},
   { "Trance", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/trance.pls"},
   { "UK Garage", "vlc --no-qt-notification --qt-start-minimized http://listen.di.fm/public3/ukgarage.pls" }
}

mydeutscheradio = {
   { "DW DE", "vlc --no-qt-notification --qt-start-minimized http://www.listenlive.eu/dw-de.m3u" },
   { "DW EN", "vlc --no-qt-notification --qt-start-minimized http://www.listenlive.eu/dw.m3u" },
   { "DLRK", "vlc --no-qt-notification --qt-start-minimized http://www.dradio.de/streaming/dkultur.m3u" },
   { "B5 Aktuell", "vlc --no-qt-notification --qt-start-minimized http://streams.br-online.de/b5plus_2.m3u" },
   { "B5 Plus", "vlc --no-qt-notification --qt-start-minimized http://streams.br-online.de/b5plus_2.m3u" },
   { "RBB InfoRadio", "vlc --no-qt-notification --qt-start-minimized http://www.inforadio.de/live.m3u" }
}

mywplnradio = {
   { "WPLN-FM", "vlc --no-qt-notification --qt-start-minimized http://wpln.streamguys.org/wplnfm.pls" },
   { "WPLN-AM", "vlc --no-qt-notification --qt-start-minimized http://wpln.streamguys.org/wplnam.pls" },
   { "WPLN-HD2", "vlc --no-qt-notification --qt-start-minimized http://wpln.streamguys.org/wplnhd2.pls" },
   { "91 ONE", "vlc --no-qt-notification --qt-start-minimized http://wpln.streamguys.org/wplnhd3.pls" }
}

myinternetradio = {
   { "BBC Radio", mybbcradio },
   { "DI.FM", mydidotfm },
   { "Deutsch", mydeutscheradio },
   { "WPLN", mywplnradio },
   { "WMTS", "vlc --no-qt-notification --qt-start-minimized http://wmts.streamon.fm:8000/WMTS-44k.ogg" },
   { "WMOT", "vlc --no-qt-notification --qt-start-minimized http://www.publicbroadcasting.net/wmot/ppr/wmot.pls" },
   { "Vatican Ch1", "vlc --no-qt-notification --qt-start-minimized http://mfile.akamai.com/52334/live/reflector:36992.asx" },
   { "RF Asia", "vlc --no-qt-notification --qt-start-minimized mms://a1545.l2130853544.c21308.g.lm.akamaistream.net/D/1545/21308/v0001/reflector:53544" },
   { "FF", "vlc --no-qt-notification --qt-start-minimized http://finalfantasyradio.net/radio/playlist.pls" },
   { "TWiT", "vlc --no-qt-notification --qt-start-minimized http://twit.am" }
}

myinternettv = {
   { "Russia Today", "vlc --qt-minimal-view rtmp://fms5.visionip.tv/live/RT_2.flv" },
   { "OK54 Trier", "vlc --qt-minimal-view mms://streaming.ok54.de/ok54" },
   { "NOA4Noderstedt", "vlc --qt-minimal-view mms://wt-wm1.wtnet.de/noa4-stream-mid?.wma" },
   { "VRF Vogtland", "vlc --qt-minimal-view mms://stream.vrf.de/VRF" },
   { "H1-TV", "vlc --qt-minimal-view mms://video.kabelnetz.ch:8082" },
   { "CTVDÃ¼sseldorf", "vlc --qt-minimal-view mms://80.246.121.90/ctv" },
   { "CampusTV", "vlc --qt-minimal-view mms://webtv-bb.de/CampusTV" },
   { "KW-TV", "vlc --qt-minimal-view mms://webtv-bb.de/KW-TV" }
}

mygoogleapps = {
   { "Google+", "chromium --app=https://plus.google.com/" },
   { "Calendar", "chromium --app=https://www.google.com/calendar/b/0/render?pli=1" },
   { "Docs", "chromium --app=https://docs.google.com/#home" },
   { "Mail", "chromium --app=https://mail.google.com/mail/u/1" },
   { "Maps", "chromium --app=http://maps.google.com/" },
   { "Music", "chromium --app=http://music.google.com" },
   { "News", "chromium --app=http://news.google.com/" }
}

myinternet = {
   { "Luakit", "luakit" },
   { "Thunderbird", "thunderbird" },
   { "Firefox", "firefox" },
   { "Firefox DE", "firefox-de" },
   { "Chromium", "chromium" },
   { "Google Apps", mygoogleapps },
   { "Radio", myinternetradio },
   { "TV", myinternettv },
   { "Shemp", "rdesktop -g 95% -d CSD -u jth5c -p XieTieLaAi0& shemp.cs.mtsu.edu"},
   { "Ranger", "/home/athetius/bin/ranger"},
   { "RangerX", "/home/athetius/bin/rangerX"},
   { "rTorrent", "lxterminal -e rtorrent" }
}

myothermenu = {
   { "Xephem", "xephem" }
}

mylibreofficemenu = {
   { "Base", "libreoffice -base" },
   { "Calc", "libreoffice -calc" },
   { "Draw", "libreoffice -draw" },
   { "Impress", "libreoffice -impress" },
   { "Math", "libreoffice -math" },
   { "Writer", "libreoffice -wrter" },
}

myofficemenu = {
   { "Abiword", "abiword" },
   { "Calibre", "calibre" },
   { "Zim", "zim" },
   { "LibreOffice", mylibreofficemenu }
}

mymultimediamenu = {
   { "Sonata", "sonata" },
   { "Alsamixer", "lxterminal  -e alsamixer" },
   { "VLC", "vlc" },
   { "xfburn", "xfburn" }
}

mygraphicsmenu = {
   { "Blender", "blender" },
   { "Gimp", "gimp" },
   { "Synfig", "synfig" },
   { "Gwenview", "gwenview" },
   { "Dia", "dia" },
   { "Inkscape", "inkscape" }
}

myeditormenu = {
   { "Emacs", "emacs" },
   { "gVim", "gvim" },
   { "Aptana Studio", "aptana" }
}

mymainmenu = awful.menu({ items = { { "run", "gmrun" },
                                    { "---------------" },
                                    { "thunar", "thunar" },
                                    { "accessories", myothermenu },
                                    { "internet", myinternet },
                                    { "office", myofficemenu },
                                    { "multimedia", mymultimediamenu },
                                    { "graphics", mygraphicsmenu },
                                    { "games", mygames },
                                    { "---------------" },
                                    { "awesome", myawesomemenu },
                                    { "open terminal", terminal }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = image(beautiful.awesome_icon),
                                     menu = mymainmenu })
-- }}}
