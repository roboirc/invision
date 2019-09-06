; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: ipcustom.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: 
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
Dialog MyKicks {
  title "Personalization"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 280 222
  option dbu

  button "Ok", 480, 80 207 40 13, ok
  button "Cancel", 490, 122 207 40 13, cancel
  button "Apply", 500, 164 207 40 13

  tab "Info", 1, 2 2 274 202
  tab "Kicks", 2
  tab "WordWatch 1-3", 3
  tab "WordWatch 4-6", 4
  tab "WordWatch 7-9", 5
  tab "Responders", 6
  tab "Help", 7

  ; ################ TAB 1 ##################
  text "Internet Connection:", 361, 40 35 58 12, tab 1 right
  edit "", 362, 99 33 125 12, tab 1 autohs
  text "CPU:", 359, 40 53 58 12, tab 1 right
  edit "", 360, 99 50 125 12, tab 1 autohs
  text "Monitor:", 355, 40 70 58 12, tab 1 right
  edit "", 356, 99 67 125 12, tab 1 autohs
  text "Harddrive Config:", 357, 40 87 58 12, tab 1 right
  edit "", 358, 99 84 125 12, tab 1 autohs
  text "Display Adapter:", 353, 40 104 58 12, tab 1 right
  edit "", 354, 99 101 125 12, tab 1 autohs
  text "Memory:", 351, 40 121 58 12, tab 1 right
  edit "", 352, 99 118 125 12, tab 1 autohs
  text "Email:", 50, 40 138 58 13, tab 1 right
  edit "", 51, 99 135 125 12, autohs, tab 1 
  text "IM:", 52, 40 155 58 12, tab 1 right
  edit "", 53, 99 152 125 12, autohs, tab 1 
  combo 999,225 152 30 12, drop, tab 1
  text "Homepage:", 54, 40 172 58 12, tab 1 right
  edit "", 55, 99 169 125 12, autohs, tab 1
  check " Display Current CPU Usage Percentage in System Info", 56, 84 183 140 12, tab 1

  ; ################ TAB 2 ##################
  box "", 100, 4 16 270 186, tab 2

  text "Enter a Description for the menu for each Kick message.", 90, 120 23 140 8, tab 2
  text "Kick 1 Description:", 101, 8 24 45 10, tab 2
  edit "", 102, 53 22 55 10, tab 2
  text "Kick 1 Message:", 103, 8 34 45 10, tab 2
  edit "", 104, 53 32 210 10, tab 2
  box "", 105, 4 42 270 1, tab 2

  text "Kick 2 Description:", 111, 8 50 45 10, tab 2
  edit "", 112, 53 48 55 10, tab 2
  text "Kick 2 Message:", 113, 8 60 45 10, tab 2
  edit "", 114, 53 58 210 10, tab 2
  box "", 115, 4 70 270 1, tab 2

  text "Kick 3 Description:", 121, 8 78 45 10, tab 2
  edit "", 122, 53 76 55 10, tab 2
  text "Kick 3 Message:", 123, 8 88 45 10, tab 2
  edit "", 124, 53 86 210 10, tab 2
  box "", 125, 4 98 270 1, tab 2

  text "Kick 4 Description:", 131, 8 108 45 10, tab 2
  edit "", 132, 53 106 55 10, tab 2
  text "Kick 4 Message:", 133, 8 118 45 10, tab 2
  edit "", 134, 53 116 210 10, tab 2
  box "", 135, 4 128 270 1, tab 2

  text "Kick 5 Description:", 141, 8 138 45 10, tab 2
  edit "", 142, 53 136 55 10, tab 2
  text "Kick 5 Message:", 143, 8 148 45 10, tab 2
  edit "", 144, 53 146 210 10, tab 2
  box "", 145, 4 158 270 1, tab 2

  text "Kick 6 Description:", 151, 8 168 45 10, tab 2
  edit "", 152, 53 166 55 10, tab 2
  text "Kick 6 Message:", 153, 8 178 45 10, tab 2
  edit "", 154, 53 176 210 10, tab 2
  box "", 155, 4 188 270 1, tab 2

  text "* The Description is what appears in the menu. Leaving a Description Field blank will remove it from the menu.", 160, 5 193 268 10, tab 2 center

  ; ################ TAB 3 ##################

  box "", 600, 4 16 270 186, tab 3 
  text "Here you can enter auto responses for word(s) said in a channel you are in", 601, 8 21 260 10, tab 3 center
  box "", 602, 4 29 270 1, tab 3  

  text "Words/Phrase #1:", 401, 8 36 48 10, tab 3
  edit "", 402, 57 34 75 10, tab 3
  text "Channels:", 406, 134 36 25 10, tab 3
  edit "", 407, 159 34 108 10, tab 3
  text "Response:", 403, 8 44 45 10, tab 3
  edit "", 404, 57 44 210 30, tab 3 multi
  check "Use /msg $chan", 751, 7 51 48 9, tab 3
  check "Use /notice", 761, 7 60 45 9, tab 3
  check "Ops are Immune", 510, 7 69 50 8, tab 3
  check "Voices are Immune", 511, 7 78 55 8, tab 3
  check "Kick on trigger", 512, 65 77 45 8, tab 3
  check "Ban on trigger", 513, 115 77 45 8, tab 3
  check "Ignore Requests", 514, 165 77 55 8, tab 3
  box "", 603, 4 84 270 60, tab 3
  check "Enable Traytip", 515, 225 77 45 8, tab 3

  text "Words/Phrase #2:", 411, 8 92 48 10, tab 3
  edit "", 412,  57 90 75 10, tab 3
  text "Channels:", 416, 134 92 25 10, tab 3
  edit "", 417, 159 90 108 10, tab 3
  text "Response:", 413, 8 100 45 10, tab 3
  edit "", 414, 57 100 210 30, tab 3 multi
  check "Use /msg $chan", 752, 7 107 48 9, tab 3
  check "Use /notice", 762, 7 116 45 9, tab 3
  check "Ops are Immune", 520, 7 125 50 8, tab 3
  check "Voices are Immune", 521, 7 134 55 8, tab 3
  check "Kick on trigger", 522, 65 133 45 8, tab 3
  check "Ban on trigger", 523, 115 133 45 8, tab 3
  check "Ignore Requests", 524, 165 133 55 8, tab 3
  box "", 604, 4 140 270 59, tab 3
  check "Enable Traytip", 525, 225 133 45 8, tab 3

  text "Words/Phrase #3:", 421, 8 148 48 10, tab 3
  edit "", 422, 57 146 75 10, tab 3
  text "Channels:", 426, 134 148 25 10, tab 3
  edit "", 427, 159 146 108 10, tab 3
  text "Response:", 423, 8 156 45 10, tab 3
  edit "", 424, 57 156 210 30, tab 3 multi
  check "Use /msg $chan", 753, 7 163 48 9, tab 3
  check "Use /notice", 763, 7 172 45 9, tab 3
  check "Ops are Immune", 530, 7 181 50 8, tab 3
  check "Voices are Immune", 531, 7 190 55 8, tab 3
  check "Kick on trigger", 532, 65 189 45 8, tab 3
  check "Ban on trigger", 533, 115 189 45 8, tab 3
  check "Ignore Requests", 534, 165 189 55 8, tab 3
  check "Enable Traytip", 535, 225 189 45 8, tab 3


  ; ################ TAB 4 ##################

  box "", 610, 4 16 270 186, tab 4 
  text "Here you can enter auto responses for word(s) said in a channel you are in", 611, 8 21 260 10, tab 4 center
  box "", 612, 4 29 270 1, tab 4  

  text "Words/Phrase #4:", 431, 8 36 48 10, tab 4
  edit "", 432, 57 34 75 10, tab 4
  text "Channels:", 436, 134 36 25 10, tab 4
  edit "", 437, 159 34 108 10, tab 4
  text "Response:", 433, 8 44 45 10, tab 4
  edit "", 434, 57 44 210 30, tab 4 multi
  check "Use /msg $chan", 754, 7 51 48 9, tab 4
  check "Use /notice", 764, 7 60 45 9, tab 4
  check "Ops are Immune", 540, 7 69 50 8, tab 4
  check "Voices are Immune", 541, 7 78 55 8, tab 4
  check "Kick on trigger", 542, 65 77 45 8, tab 4
  check "Ban on trigger", 543, 115 77 45 8, tab 4
  check "Ignore Requests", 544, 165 77 55 8, tab 4
  box "", 613, 4 84 270 60, tab 4
  check "Enable Traytip", 545, 225 77 45 8, tab 4

  text "Words/Phrase #5:", 441, 8 92 48 10, tab 4
  edit "", 442,  57 90 75 10, tab 4
  text "Channels:", 446, 134 92 25 10, tab 4
  edit "", 447, 159 90 108 10, tab 4
  text "Response:", 443, 8 100 45 10, tab 4
  edit "", 444, 57 100 210 30, tab 4 multi
  check "Use /msg $chan", 755, 7 107 48 9, tab 4
  check "Use /notice", 765, 7 116 45 9, tab 4
  check "Ops are Immune", 550, 7 125 50 8, tab 4
  check "Voices are Immune", 551, 7 134 55 8, tab 4
  check "Kick on trigger", 552, 65 133 45 8, tab 4
  check "Ban on trigger", 553, 115 133 45 8, tab 4
  check "Ignore Requests", 554, 165 133 55 8, tab 4
  box "", 614, 4 140 270 59, tab 4
  check "Enable Traytip", 555, 225 133 45 8, tab 4

  text "Words/Phrase #6:", 451, 8 148 48 10, tab 4
  edit "", 452, 57 146 75 10, tab 4
  text "Channels:", 456, 134 148 25 10, tab 4
  edit "", 457, 159 146 108 10, tab 4
  text "Response:", 453, 8 156 45 10, tab 4
  edit "", 454, 57 156 210 30, tab 4 multi
  check "Use /msg $chan", 756, 7 163 48 9, tab 4
  check "Use /notice", 766, 7 172 45 9, tab 4
  check "Ops are Immune", 560, 7 181 50 8, tab 4
  check "Voices are Immune", 561, 7 190 55 8, tab 4
  check "Kick on trigger", 562, 65 189 45 8, tab 4
  check "Ban on trigger", 563, 115 189 45 8, tab 4
  check "Ignore Requests", 564, 165 189 55 8, tab 4
  check "Enable Traytip", 565, 225 189 45 8, tab 4

  ; ################ TAB 5 ##################

  box "", 620, 4 16 270 186, tab 5 
  text "Here you can enter auto responses for word(s) said in a channel you are in", 621, 8 21 260 10, tab 5 center
  box "", 622, 4 29 270 1, tab 5  

  text "Words/Phrase #7:", 461, 8 36 48 10, tab 5
  edit "", 462, 57 34 75 10, tab 5
  text "Channels:", 466, 134 36 25 10, tab 5
  edit "", 467, 159 34 108 10, tab 5
  text "Response:", 463, 8 44 45 10, tab 5
  edit "", 464, 57 44 210 30, tab 5 multi
  check "Use /msg $chan", 757, 7 51 48 9, tab 5
  check "Use /notice", 767, 7 60 45 9, tab 5
  check "Ops are Immune", 570, 7 69 50 8, tab 5
  check "Voices are Immune", 571, 7 78 55 8, tab 5
  check "Kick on trigger", 572, 65 77 45 8, tab 5
  check "Ban on trigger", 573, 115 77 45 8, tab 5
  check "Ignore Requests", 574, 165 77 55 8, tab 5
  box "", 623, 4 84 270 60, tab 5
  check "Enable Traytip", 575, 225 77 45 8, tab 5

  text "Words/Phrase #8:", 471, 8 92 48 10, tab 5
  edit "", 472,  57 90 75 10, tab 5
  text "Channels:", 476, 134 92 25 10, tab 5
  edit "", 477, 159 90 108 10, tab 5
  text "Response:", 473, 8 100 45 10, tab 5
  edit "", 474, 57 100 210 30, tab 5 multi
  check "Use /msg $chan", 758, 7 107 48 9, tab 5
  check "Use /notice", 768, 7 116 45 9, tab 5
  check "Ops are Immune", 580, 7 125 50 8, tab 5
  check "Voices are Immune", 581, 7 134 55 8, tab 5
  check "Kick on trigger", 582, 65 133 45 8, tab 5
  check "Ban on trigger", 583, 115 133 45 8, tab 5
  check "Ignore Requests", 584, 165 133 55 8, tab 5
  box "", 624, 4 140 270 59, tab 5
  check "Enable Traytip", 585, 225 133 45 8, tab 5

  text "Words/Phrase #9:", 481, 8 148 48 10, tab 5
  edit "", 482, 57 146 75 10, tab 5
  text "Channels:", 486, 134 148 25 10, tab 5
  edit "", 487, 159 146 108 10, tab 5
  text "Response:", 483, 8 156 45 10, tab 5
  edit "", 484, 57 156 210 30, tab 5 multi
  check "Use /msg $chan", 759, 7 163 48 9, tab 5
  check "Use /notice", 769, 7 172 45 9, tab 5
  check "Ops are Immune", 590, 7 181 50 8, tab 5
  check "Voices are Immune", 591, 7 190 55 8, tab 5
  check "Kick on trigger", 592, 65 189 45 8, tab 5
  check "Ban on trigger", 593, 115 189 45 8, tab 5
  check "Ignore Requests", 594, 165 189 55 8, tab 5
  check "Enable Traytip", 595, 225 189 45 8, tab 5

  box " Auto Respond to Opped/Voiced", 301, 8 20 262 30, tab 6
  check "When you are Voiced:", 302, 12 28 63 10, tab 6
  edit "", 303, 76 28 190 10, tab 6 autohs
  check "When you are Opped:", 304, 12 38 63 10, tab 6
  edit "", 305, 76 38 190 10, tab 6 autohs

  box " Auto Respond to Deopped/Devoiced", 311, 8 52 262 30, tab 6
  check "When you are Devoiced:", 312, 12 60 68 10, tab 6
  edit "", 313, 81 60 185 10, tab 6 autohs
  check "When you are Deopped:", 314, 12 70 68 10, tab 6
  edit "", 315, 81 70 185 10, tab 6 autohs

  box " Auto Informer ", 321, 8 84 262 55, tab 6
  text "Message:", 322, 12 90 25 8, tab 6
  edit "", 323, 12 97 160 30, tab 6 multi
  check "Enable Informer", 317, 12 128 55 9, tab 6  
  radio "Send via /msg", 324, 72 128 45 9, tab 6 group
  radio "Send via /notice", 325, 122 128 50 9, tab 6
  check "Exclude Friends/Ops", 318, 112 88 60 9, tab 6
  button "-", 328, 181 89 8 8, tab 6
  text "Channels", 316, 190 90 60 8, tab 6 center
  button "+", 329, 251 89 8 8, tab 6
  list 330, 180 97 80 36, tab 6 autovs
  check "On Join", 326, 180 128 35 9, tab 6
  check "On Part", 327, 220 128 35 9, tab 6

  box " Common Channel Enforcer ", 331, 8 140 262 55, tab 6
  text "Message:", 332, 12 147 25 8, tab 6
  edit "", 333, 12 154 160 30, tab 6 multi
  check "Enable Enforcer", 334, 12 185 55 9, tab 6  
  button "Help!", 909, 152 145 20 9, tab 6

  radio "If Common", 335, 72 185 45 9, tab 6 group
  radio "If not Common", 336, 122 185 50 9, tab 6
  button "-", 337, 181 146 8 8, tab 6
  text "Channels", 338, 190 147 60 8, tab 6 center
  button "+", 339, 251 146 8 8, tab 6
  list 340, 180 154 80 36, tab 6 autovs
  check "Kick", 341, 180 185 35 9, tab 6
  text "React Delay (sec):", 342, 205 186 45 8, tab 6
  edit "", 343, 250 184 10 10, tab 6

  box " Custom Kicks: ", 633, 8 20 260 25, tab 7 
  text "Here you can create your own custom kick messages.The description is what will appear in your Kicks and Kick/Ban Menus. The Message is what will show in the chan when you kick someone with it.", 631, 12 28 252 16, tab 7 
  box " Custom Aways: ", 634, 8 48 260 25, tab 7 
  text "Here you can create your own custom away messages.The description is what will appear in your Set Away Menus. The Message is what will be the actual away message set.", 632, 12 56 252 16, tab 7  
  box " WordWatchers: ", 635, 8 75 260 60, tab 7
  text "Here you can create WordWatchers that will watch for and react on string matches said in the channel(s) you have declared. In the Words/Phrase boxes you can use * characters for wildcards. So for example, you could have a Word/Phrase of say *hate*ops* and a line said in the channel of say ''I hate those stinkin ops'' would trigger it. Channels is where you put in the channel names affected by that wordwatch. You can set one channel, multiple channels, or all channels you are on. Enter ''ALL'' for all channels or separate multiple channels with a space. The Response is the what you will say in the channel after the word/phrase is spotted and right before any option kick and/or ban action is taken.", 636, 12 83 252 48, tab 7  
  box " All Messages and Responses ", 637, 8 137 260 65, tab 7
  text "All message and response fields can make use of native and custom identifiers. However do not use color codes or other control codes like bold directly. Use the ''$+'' between the identifier and section to be affected. For example you could do a response of ''$nick $red $+ , please do not use that word in here!'' The nick would be plain text color but the remainder of the line would be in red type.", 630, 12 145 252 36, tab 7 
  text "Here are some native identifiers you can use: $nick, $asctime, $chan, $me, $ip (your IP)", 638, 12 171 252 8, tab 7
  text "Here are some Invision identifiers you can use: $bold, $uline, $plain, $white, $black, $dblue, $dgreen, $red, $brown, $purple, $orange, $yellow, $lgreen, $cyan, $lcyan, $blue, $pink, $grey, and $lgrey. You can see alternates for these as well by doing a /colorhelp command in a window.", 639, 12 178 252 20, tab 7
}

on *:dialog:Mykicks:*:*:{
  if ($devent == init) {
    dialog -t $dname Personalization for $iif($iSetwork != $null,$iSetwork,Global)
    var %ct = 1
    while (%ct <= 9) {
      if $r.set(Customs,WWusemsg [ $+ [ %ct ] ] ) == On { did -c $dname $calc(750 + %ct) }
      if $r.set(Customs,WWusenot [ $+ [ %ct ] ] ) == On { did -c $dname $calc(760 + %ct) }
      inc %ct 1
      continue
    }
    did -ra $dname 352 $r.set(Personal.Info,Memory)
    did -ra $dname 354 $r.set(Personal.Info,Video)
    did -ra $dname 356 $r.set(Personal.Info,Monitor)
    did -ra $dname 358 $r.set(Personal.Info,HD)
    did -ra $dname 360 $r.set(Personal.Info,CPU)
    did -ra $dname 362 $r.set(Personal.Info,Connection)
    did -ra $dname 51 $r.set(Personal.Info,Email)
    if ( $r.set(Personal.Info,CPUUsage) == On ) { did -c $dname 56 }
    did -a $dname 999 AIM
    did -a $dname 999 ICQ
    did -a $dname 999 Skype
    did -a $dname 999 Yahoo
    did -c $dname 999 1
    did -ra $dname 53 $iif($r.set(Personal.Info,$did($dname,999).seltext),$v1,n/a)
    did -ra $dname 55 $r.set(Personal.Info,Webpage)
    if $r.set(Enforcer,Status) == On { did -c $dname 334 }
    if $r.set(Enforcer,Kick) == On { did -c $dname 341 }
    if $r.set(Enforcer,Mode) == INCOM { did -c $dname 335 } | else { did -c $dname 336 }
    did -ra $dname 333 $r.set(Enforcer,Msg)
    dla $dname 340 $r.set(Enforcer,Channels)
    did -ra $dname 343 $isset($r.set(Enforcer,Delay),10) 
    did -ra $dname 323 $r.set(AutoInform,Msg)
    if $r.set(AutoInform,Via) == Msg { did -c $dname 324 } | else { did -c $dname 325 }
    if $r.set(AutoInform,Join) == On { did -c $dname 326 }
    if $r.set(AutoInform,Part) == On { did -c $dname 327 }
    if $r.set(AutoInform,Status) == On { did -c $dname 317 }
    if $r.set(AutoInform,Excludes) == On { did -c $dname 318 }
    dla $dname 330 $r.set(AutoInform,Channels)
    did -ra $dname 303 $r.set(Customs,VoMsg)
    did -ra $dname 305 $r.set(Customs,OpMsg)
    did -ra $dname 313 $r.set(Customs,DeVoMsg)
    did -ra $dname 315 $r.set(Customs,DeOpMsg)
    if $r.set(Customs,Vo) == On { did -c $dname 302 }
    if $r.set(Customs,Op) == On { did -c $dname 304 }
    if $r.set(Customs,DeVo) == On { did -c $dname 312 }
    if $r.set(Customs,DeOp) == On { did -c $dname 314 }
    did -ra $dname 102 $r.set(Customs,PK1.desc)
    did -ra $dname 104 $r.set(Customs,PK1.msg)
    did -ra $dname 112 $r.set(Customs,PK2.desc)
    did -ra $dname 114 $r.set(Customs,PK2.msg)
    did -ra $dname 122 $r.set(Customs,PK3.desc)
    did -ra $dname 124 $r.set(Customs,PK3.msg)
    did -ra $dname 132 $r.set(Customs,PK4.desc)
    did -ra $dname 134 $r.set(Customs,PK4.msg)
    did -ra $dname 142 $r.set(Customs,PK5.desc)
    did -ra $dname 144 $r.set(Customs,PK5.msg)
    did -ra $dname 152 $r.set(Customs,PK6.desc)
    did -ra $dname 154 $r.set(Customs,PK6.msg)

    did -ra $dname 404 $r.set(Customs,WWATCH1.msg)
    did -ra $dname 414 $r.set(Customs,WWATCH2.msg)
    did -ra $dname 424 $r.set(Customs,WWATCH3.msg)
    did -ra $dname 434 $r.set(Customs,WWATCH4.msg)
    did -ra $dname 444 $r.set(Customs,WWATCH5.msg)
    did -ra $dname 454 $r.set(Customs,WWATCH6.msg)
    did -ra $dname 464 $r.set(Customs,WWATCH7.msg)
    did -ra $dname 474 $r.set(Customs,WWATCH8.msg)
    did -ra $dname 484 $r.set(Customs,WWATCH9.msg)
    did -ra $dname 402 $r.set(Customs,WWATCH1.desc)
    did -ra $dname 412 $r.set(Customs,WWATCH2.desc)
    did -ra $dname 422 $r.set(Customs,WWATCH3.desc)
    did -ra $dname 432 $r.set(Customs,WWATCH4.desc)
    did -ra $dname 442 $r.set(Customs,WWATCH5.desc)
    did -ra $dname 452 $r.set(Customs,WWATCH6.desc)
    did -ra $dname 462 $r.set(Customs,WWATCH7.desc)
    did -ra $dname 472 $r.set(Customs,WWATCH8.desc)
    did -ra $dname 482 $r.set(Customs,WWATCH9.desc)
    did -ra $dname 407 $r.set(Customs,WWATCH1.chan)
    did -ra $dname 417 $r.set(Customs,WWATCH2.chan)
    did -ra $dname 427 $r.set(Customs,WWATCH3.chan)
    did -ra $dname 437 $r.set(Customs,WWATCH4.chan)
    did -ra $dname 447 $r.set(Customs,WWATCH5.chan)
    did -ra $dname 457 $r.set(Customs,WWATCH6.chan)
    did -ra $dname 467 $r.set(Customs,WWATCH7.chan)
    did -ra $dname 477 $r.set(Customs,WWATCH8.chan)
    did -ra $dname 487 $r.set(Customs,WWATCH9.chan)
    if $r.set(Customs,WWops.1) == On { did -c $dname 510 }
    if $r.set(Customs,WWvos.1) == On { did -c $dname 511 }
    if $r.set(Customs,WWkick.1) == On { did -c $dname 512 }
    if $r.set(Customs,WWban.1) == On { did -c $dname 513 }
    if $r.set(Customs,WWreq.1) == On { did -c $dname 514 }
    if $r.set(Customs,WWtt.1) == On { did -c $dname 515 }
    if $r.set(Customs,WWops.2) == On { did -c $dname 520 }
    if $r.set(Customs,WWvos.2) == On { did -c $dname 521 }
    if $r.set(Customs,WWkick.2) == On { did -c $dname 522 }
    if $r.set(Customs,WWban.2) == On { did -c $dname 523 }
    if $r.set(Customs,WWreq.2) == On { did -c $dname 524 }
    if $r.set(Customs,WWtt.2) == On { did -c $dname 525 }
    if $r.set(Customs,WWops.3) == On { did -c $dname 530 }
    if $r.set(Customs,WWvos.3) == On { did -c $dname 531 }
    if $r.set(Customs,WWkick.3) == On { did -c $dname 532 }
    if $r.set(Customs,WWban.3) == On { did -c $dname 533 }
    if $r.set(Customs,WWreq.3) == On { did -c $dname 534 }
    if $r.set(Customs,WWtt.4) == On { did -c $dname 535 }
    if $r.set(Customs,WWops.4) == On { did -c $dname 540 }
    if $r.set(Customs,WWvos.4) == On { did -c $dname 541 }
    if $r.set(Customs,WWkick.4) == On { did -c $dname 542 }
    if $r.set(Customs,WWban.4) == On { did -c $dname 543 }
    if $r.set(Customs,WWreq.4) == On { did -c $dname 544 }
    if $r.set(Customs,WWtt.4) == On { did -c $dname 545 }
    if $r.set(Customs,WWops.5) == On { did -c $dname 550 }
    if $r.set(Customs,WWvos.5) == On { did -c $dname 551 }
    if $r.set(Customs,WWkick.5) == On { did -c $dname 552 }
    if $r.set(Customs,WWban.5) == On { did -c $dname 553 }
    if $r.set(Customs,WWreq.5) == On { did -c $dname 554 }
    if $r.set(Customs,WWtt.5) == On { did -c $dname 555 }
    if $r.set(Customs,WWops.6) == On { did -c $dname 560 }
    if $r.set(Customs,WWvos.6) == On { did -c $dname 561 }
    if $r.set(Customs,WWkick.6) == On { did -c $dname 562 }
    if $r.set(Customs,WWban.6) == On { did -c $dname 563 }
    if $r.set(Customs,WWreq.6) == On { did -c $dname 564 }
    if $r.set(Customs,WWtt.6) == On { did -c $dname 565 }
    if $r.set(Customs,WWops.7) == On { did -c $dname 570 }
    if $r.set(Customs,WWvos.7) == On { did -c $dname 571 }
    if $r.set(Customs,WWkick.7) == On { did -c $dname 572 }
    if $r.set(Customs,WWban.7) == On { did -c $dname 573 }
    if $r.set(Customs,WWreq.7) == On { did -c $dname 574 }
    if $r.set(Customs,WWtt.7) == On { did -c $dname 575 }
    if $r.set(Customs,WWops.8) == On { did -c $dname 580 }
    if $r.set(Customs,WWvos.8) == On { did -c $dname 581 }
    if $r.set(Customs,WWkick.8) == On { did -c $dname 582 }
    if $r.set(Customs,WWban.8) == On { did -c $dname 583 }
    if $r.set(Customs,WWreq.8) == On { did -c $dname 584 }
    if $r.set(Customs,WWtt.8) == On { did -c $dname 585 }
    if $r.set(Customs,WWops.9) == On { did -c $dname 590 }
    if $r.set(Customs,WWvos.9) == On { did -c $dname 591 }
    if $r.set(Customs,WWkick.9) == On { did -c $dname 592 }
    if $r.set(Customs,WWban.9) == On { did -c $dname 593 }
    if $r.set(Customs,WWreq.9) == On { did -c $dname 594 }
    if $r.set(Customs,WWtt.9) == On { did -c $dname 595 }

  }
  if ($devent == edit && $did == 53) {
    if ($did($dname,53) == $null) { set %IM. $+ $did($dname,999).seltext n/a }
    else { set %IM. $+ $did($dname,999).seltext $did($dname,53) }
  }
  if ($devent == sclick) {
    if $did == 909 {
      phelp Channel Enforcer is a tool intended for those chanops running channels. Often there will be a secondary channel where you want those that run the channel to also be present in and this will help you enforce that. When set to "If in common" then enforcer will react after the set delay time by sending the message to the user via /notice. If you have kick enabled it will also kick them from all involved channels. You can set the mode to "If not in common" and have the opposite effect. This means if you are in your channel and you dont want people in your channel   
    }
    if $did == 328 {
      if $did($dname,330).sel >= 1 {
        did -d $dname 330 $did($dname,330).sel
      }
    }
    if $did == 329 {
      var %nch = $input(Add what channel?,133,What Channel?)
      if %nch != $null { did -a $dname 330 %nch }
    }
    if $did == 337 {
      if $did($dname,340).sel >= 1 {
        did -d $dname 340 $did($dname,340).sel
      }
    }
    if $did == 339 {
      var %nch = $input(Add what channel?,133,What Channel?)
      if %nch != $null { did -a $dname 340 %nch }
    }
    if $did == 999 { did -ra $dname 53 $iif(%IM. [ $+ [ $did($dname,999).seltext ] ],$v1,$iif($r.set(Personal.Info,$did($dname,999).seltext),$v1,n/a)) }
    if $did != 480 && $did != 500 { click }
    if ($did == 480) || ($did == 500) {
      setsaved
      if $did($dname,323).text != $null {
        var %ln = $did($dname,323,1).text $+ $chr(32) $+ $did($dname,323,2).text $+ $chr(32) $+ $did($dname,323,3).text $+ $chr(32) $+ $did($dname,323,4).text 
        iw.set AutoInform Msg %ln
      }
      else { d.set Enforcer Msg }
      if $did($dname,333).text != $null {
        var %ln = $did($dname,333,1).text $+ $chr(32) $+ $did($dname,333,2).text $+ $chr(32) $+ $did($dname,333,3).text $+ $chr(32) $+ $did($dname,333,4).text 
        iw.set Enforcer Msg %ln
      }
      var %ct = 1
      while (%ct <= 9) {
        if $did($dname, $calc(750 + %ct)).state == 1 { w.set Customs [ WWusemsg [ $+ [ %ct ] ] ] On } | else { w.set Customs [ WWusemsg [ $+ [ %ct ] ] ] Off } 
        if $did($dname, $calc(760 + %ct)).state == 1 { w.set Customs [ WWusenot [ $+ [ %ct ] ] ] On } | else { w.set Customs [ WWusenot [ $+ [ %ct ] ] ] Off } 
        inc %ct 1
        continue
      }
      else { d.set Enforcer Msg }
      w.set Personal.Info AIM %IM.AIM
      w.set Personal.Info ICQ %IM.ICQ
      w.set Personal.Info Skype %IM.Skype
      w.set Personal.Info Yahoo %IM.Yahoo
      unset %IM.AIM
      unset %IM.ICQ
      unset %IM.Skype
      unset %IM.Yahoo
      w.set Personal.Info Memory $isset($did($dname,352).text,n/a)
      w.set Personal.Info Video $isset($did($dname,354).text,n/a)
      w.set Personal.Info Monitor $isset($did($dname,356).text,n/a)
      w.set Personal.Info HD $isset($did($dname,358).text,n/a)
      w.set Personal.Info CPU $isset($did($dname,360).text,n/a)
      w.set Personal.Info Connection $isset($did($dname,362).text,n/a)
      w.set Personal.Info Email $isset($did($dname,51).text,n/a)
      w.set Personal.Info Webpage $isset($did($dname,55).text,n/a)
      if ( $did($dname,56).state == 1 ) { w.set Personal.Info CPUUsage On } | else { w.set Personal.Info CPUUsage Off }
      if ( $did($dname,334).state == 1 ) { w.set Enforcer Status On } | else { w.set Enforcer Status Off }
      if ( $did($dname,335).state == 1 ) { w.set Enforcer Mode INCOM } | else { w.set Enforcer Mode UNCOM }
      if ( $did($dname,341).state == 1 ) { w.set Enforcer Kick On } | else { w.set Enforcer Kick Off }
      if ( $did($dname,340).lines >= 1 ) { dls $dname 340 w.set Enforcer Channels } | else { d.set Enforcer Channels }
      if ( $did($dname,343).text <= 9 ) { w.set enforcer delay 10 } | else { w.set Enforcer Delay $isset($did($dname,343).text,10) }

      if $did($dname,330).lines >= 1 { dls $dname 330 w.set AutoInform Channels } | else { d.set AutoInform Channels }
      if $did($dname,326).state == 1 { w.set AutoInform Join On } | else { w.set AutoInform Join Off }
      if $did($dname,327).state == 1 { w.set AutoInform Part On } | else { w.set AutoInform Part Off }     
      if $did($dname,324).state == 1 { w.set AutoInform Via Msg } | else { w.set AutoInform Via Notice }
      if $did($dname,317).state == 1 { w.set AutoInform Status On } | else { w.set AutoInform Status Off }
      if $did($dname,318).state == 1 { w.set AutoInform Excludes On } | else { w.set AutoInform Excludes Off }

      if $did($dname,303).text != $null { iw.set Customs VoMsg $did($dname,303).text } | else { d.set Customs VoMsg }
      if $did($dname,305).text != $null { iw.set Customs OpMsg $did($dname,305).text } | else { d.set Customs OpMsg }
      if $did($dname,313).text != $null { iw.set Customs DeVoMsg $did($dname,313).text } | else { d.set Customs DeVoMsg }
      if $did($dname,315).text != $null { iw.set Customs DeOpMsg $did($dname,315).text } | else { d.set Customs DeOpMsg }

      if $did($dname,302).state == 1 { w.set Customs Vo On } | else { w.set Customs Vo Off }
      if $did($dname,304).state == 1 { w.set Customs Op On } | else { w.set Customs Op Off }
      if $did($dname,312).state == 1 { w.set Customs DeVo On } | else { w.set Customs DeVo Off }
      if $did($dname,314).state == 1 { w.set Customs DeOp On } | else { w.set Customs DeOp Off }

      if $did($dname,102).text != $null { w.set Customs PK1.desc $did($dname,102).text } | else { d.set Customs PK1.desc }
      if $did($dname,104).text != $null { iw.set Customs PK1.msg $did($dname,104).text } | else { d.set Customs PK1.msg }
      if $did($dname,112).text != $null { w.set Customs PK2.desc $did($dname,112).text } | else { d.set Customs PK2.desc }
      if $did($dname,114).text != $null { iw.set Customs PK2.msg $did($dname,114).text } | else { d.set Customs PK2.msg }
      if $did($dname,122).text != $null { w.set Customs PK3.desc $did($dname,122).text } | else { d.set Customs PK3.desc }
      if $did($dname,124).text != $null { iw.set Customs PK3.msg $did($dname,124).text } | else { d.set Customs PK3.msg }
      if $did($dname,132).text != $null { w.set Customs PK4.desc $did($dname,132).text } | else { d.set Customs PK4.desc }
      if $did($dname,134).text != $null { iw.set Customs PK4.msg $did($dname,134).text } | else { d.set Customs PK4.msg }
      if $did($dname,142).text != $null { w.set Customs PK5.desc $did($dname,142).text } | else { d.set Customs PK5.desc }
      if $did($dname,144).text != $null { iw.set Customs PK5.msg $did($dname,144).text } | else { d.set Customs PK5.msg }
      if $did($dname,152).text != $null { w.set Customs PK6.desc $did($dname,152).text } | else { d.set Customs PK6.desc }
      if $did($dname,154).text != $null { iw.set Customs PK6.msg $did($dname,154).text } | else { d.set Customs PK6.msg }

      if $did($dname,404).text != $null { set %tmpWWATCH $did($dname,404,1).text $did($dname,404,2).text $did($dname,404,3).text $did($dname,404,4).text | iw.set Customs WWATCH1.msg %tmpWWATCH } | else { d.set Customs WWATCH1.msg }
      if $did($dname,414).text != $null { set %tmpWWATCH $did($dname,414,1).text $did($dname,414,2).text $did($dname,414,3).text $did($dname,414,4).text | iw.set Customs WWATCH2.msg %tmpWWATCH } | else { d.set Customs WWATCH2.msg }
      if $did($dname,424).text != $null { set %tmpWWATCH $did($dname,424,1).text $did($dname,424,2).text $did($dname,424,3).text $did($dname,424,4).text | iw.set Customs WWATCH3.msg %tmpWWATCH } | else { d.set Customs WWATCH3.msg }
      if $did($dname,434).text != $null { set %tmpWWATCH $did($dname,434,1).text $did($dname,434,2).text $did($dname,434,3).text $did($dname,434,4).text | iw.set Customs WWATCH4.msg %tmpWWATCH } | else { d.set Customs WWATCH4.msg }
      if $did($dname,444).text != $null { set %tmpWWATCH $did($dname,444,1).text $did($dname,444,2).text $did($dname,444,3).text $did($dname,444,4).text | iw.set Customs WWATCH5.msg %tmpWWATCH } | else { d.set Customs WWATCH5.msg }
      if $did($dname,454).text != $null { set %tmpWWATCH $did($dname,454,1).text $did($dname,454,2).text $did($dname,454,3).text $did($dname,454,4).text | iw.set Customs WWATCH6.msg %tmpWWATCH } | else { d.set Customs WWATCH6.msg }
      if $did($dname,464).text != $null { set %tmpWWATCH $did($dname,464,1).text $did($dname,464,2).text $did($dname,464,3).text $did($dname,464,4).text | iw.set Customs WWATCH7.msg %tmpWWATCH } | else { d.set Customs WWATCH7.msg }
      if $did($dname,474).text != $null { set %tmpWWATCH $did($dname,474,1).text $did($dname,474,2).text $did($dname,474,3).text $did($dname,474,4).text | iw.set Customs WWATCH8.msg %tmpWWATCH } | else { d.set Customs WWATCH8.msg }
      if $did($dname,484).text != $null { set %tmpWWATCH $did($dname,484,1).text $did($dname,484,2).text $did($dname,484,3).text $did($dname,484,4).text | iw.set Customs WWATCH9.msg %tmpWWATCH } | else { d.set Customs WWATCH9.msg }

      if $did($dname,402).text != $null { w.set Customs WWATCH1.desc $did($dname,402).text } | else { d.set Customs WWATCH1.desc }
      if $did($dname,412).text != $null { w.set Customs WWATCH2.desc $did($dname,412).text } | else { d.set Customs WWATCH2.desc }
      if $did($dname,422).text != $null { w.set Customs WWATCH3.desc $did($dname,422).text } | else { d.set Customs WWATCH3.desc }
      if $did($dname,432).text != $null { w.set Customs WWATCH4.desc $did($dname,432).text } | else { d.set Customs WWATCH4.desc }
      if $did($dname,442).text != $null { w.set Customs WWATCH5.desc $did($dname,442).text } | else { d.set Customs WWATCH5.desc }
      if $did($dname,452).text != $null { w.set Customs WWATCH6.desc $did($dname,452).text } | else { d.set Customs WWATCH6.desc }
      if $did($dname,462).text != $null { w.set Customs WWATCH7.desc $did($dname,462).text } | else { d.set Customs WWATCH7.desc }
      if $did($dname,472).text != $null { w.set Customs WWATCH8.desc $did($dname,472).text } | else { d.set Customs WWATCH8.desc }
      if $did($dname,482).text != $null { w.set Customs WWATCH9.desc $did($dname,482).text } | else { d.set Customs WWATCH9.desc }

      if $did($dname,407).text != $null { w.set Customs WWATCH1.chan $did($dname,407).text } | else { d.set Customs WWATCH1.chan }
      if $did($dname,417).text != $null { w.set Customs WWATCH2.chan $did($dname,417).text } | else { d.set Customs WWATCH2.chan }
      if $did($dname,427).text != $null { w.set Customs WWATCH3.chan $did($dname,427).text } | else { d.set Customs WWATCH3.chan }
      if $did($dname,437).text != $null { w.set Customs WWATCH4.chan $did($dname,437).text } | else { d.set Customs WWATCH4.chan }
      if $did($dname,447).text != $null { w.set Customs WWATCH5.chan $did($dname,447).text } | else { d.set Customs WWATCH5.chan }
      if $did($dname,457).text != $null { w.set Customs WWATCH6.chan $did($dname,457).text } | else { d.set Customs WWATCH6.chan }
      if $did($dname,467).text != $null { w.set Customs WWATCH7.chan $did($dname,467).text } | else { d.set Customs WWATCH7.chan }
      if $did($dname,477).text != $null { w.set Customs WWATCH8.chan $did($dname,477).text } | else { d.set Customs WWATCH8.chan }
      if $did($dname,487).text != $null { w.set Customs WWATCH9.chan $did($dname,487).text } | else { d.set Customs WWATCH9.chan }

      if $did($dname,510).state == 1 { w.set Customs WWops.1 On } | else { w.set Customs WWops.1 off }
      if $did($dname,511).state == 1 { w.set Customs WWvos.1 On } | else { w.set Customs WWvos.1 off }
      if $did($dname,512).state == 1 { w.set Customs WWkick.1 On } | else { w.set Customs WWkick.1 off }
      if $did($dname,513).state == 1 { w.set Customs WWban.1 On } | else { w.set Customs WWban.1 off }
      if $did($dname,514).state == 1 { w.set Customs WWreq.1 On } | else { w.set Customs WWreq.1 off }
      if $did($dname,515).state == 1 { w.set Customs WWtt.1 On } | else { w.set Customs WWtt.1 off }
      if $did($dname,520).state == 1 { w.set Customs WWops.2 On } | else { w.set Customs WWops.2 off }
      if $did($dname,521).state == 1 { w.set Customs WWvos.2 On } | else { w.set Customs WWvos.2 off }
      if $did($dname,522).state == 1 { w.set Customs WWkick.2 On } | else { w.set Customs WWkick.2 off }
      if $did($dname,523).state == 1 { w.set Customs WWban.2 On } | else { w.set Customs WWban.2 off }
      if $did($dname,524).state == 1 { w.set Customs WWreq.2 On } | else { w.set Customs WWreq.2 off }
      if $did($dname,525).state == 1 { w.set Customs WWtt.2 On } | else { w.set Customs WWtt.2 off }
      if $did($dname,530).state == 1 { w.set Customs WWops.3 On } | else { w.set Customs WWops.3 off }
      if $did($dname,531).state == 1 { w.set Customs WWvos.3 On } | else { w.set Customs WWvos.3 off }
      if $did($dname,532).state == 1 { w.set Customs WWkick.3 On } | else { w.set Customs WWkick.3 off }
      if $did($dname,533).state == 1 { w.set Customs WWban.3 On } | else { w.set Customs WWban.3 off }
      if $did($dname,534).state == 1 { w.set Customs WWreq.3 On } | else { w.set Customs WWreq.3 off }
      if $did($dname,535).state == 1 { w.set Customs WWtt.3 On } | else { w.set Customs WWtt.3 off }
      if $did($dname,540).state == 1 { w.set Customs WWops.4 On } | else { w.set Customs WWops.4 off }
      if $did($dname,541).state == 1 { w.set Customs WWvos.4 On } | else { w.set Customs WWvos.4 off }
      if $did($dname,542).state == 1 { w.set Customs WWkick.4 On } | else { w.set Customs WWkick.4 off }
      if $did($dname,543).state == 1 { w.set Customs WWban.4 On } | else { w.set Customs WWban.4 off }
      if $did($dname,544).state == 1 { w.set Customs WWreq.4 On } | else { w.set Customs WWreq.4 off }
      if $did($dname,545).state == 1 { w.set Customs WWtt.4 On } | else { w.set Customs WWtt.4 off }
      if $did($dname,550).state == 1 { w.set Customs WWops.5 On } | else { w.set Customs WWops.5 off }
      if $did($dname,551).state == 1 { w.set Customs WWvos.5 On } | else { w.set Customs WWvos.5 off }
      if $did($dname,552).state == 1 { w.set Customs WWkick.5 On } | else { w.set Customs WWkick.5 off }
      if $did($dname,553).state == 1 { w.set Customs WWban.5 On } | else { w.set Customs WWban.5 off }
      if $did($dname,554).state == 1 { w.set Customs WWreq.5 On } | else { w.set Customs WWreq.5 off }
      if $did($dname,555).state == 1 { w.set Customs WWtt.5 On } | else { w.set Customs WWtt.5 off }
      if $did($dname,560).state == 1 { w.set Customs WWops.6 On } | else { w.set Customs WWops.6 off }
      if $did($dname,561).state == 1 { w.set Customs WWvos.6 On } | else { w.set Customs WWvos.6 off }
      if $did($dname,562).state == 1 { w.set Customs WWkick.6 On } | else { w.set Customs WWkick.6 off }
      if $did($dname,563).state == 1 { w.set Customs WWban.6 On } | else { w.set Customs WWban.6 off }
      if $did($dname,564).state == 1 { w.set Customs WWreq.6 On } | else { w.set Customs WWreq.6 off }
      if $did($dname,565).state == 1 { w.set Customs WWtt.6 On } | else { w.set Customs WWtt.6 off }
      if $did($dname,570).state == 1 { w.set Customs WWops.7 On } | else { w.set Customs WWops.7 off }
      if $did($dname,571).state == 1 { w.set Customs WWvos.7 On } | else { w.set Customs WWvos.7 off }
      if $did($dname,572).state == 1 { w.set Customs WWkick.7 On } | else { w.set Customs WWkick.7 off }
      if $did($dname,573).state == 1 { w.set Customs WWban.7 On } | else { w.set Customs WWban.7 off }
      if $did($dname,574).state == 1 { w.set Customs WWreq.7 On } | else { w.set Customs WWreq.7 off }
      if $did($dname,575).state == 1 { w.set Customs WWtt.7 On } | else { w.set Customs WWtt.7 off }
      if $did($dname,580).state == 1 { w.set Customs WWops.8 On } | else { w.set Customs WWops.8 off }
      if $did($dname,581).state == 1 { w.set Customs WWvos.8 On } | else { w.set Customs WWvos.8 off }
      if $did($dname,582).state == 1 { w.set Customs WWkick.8 On } | else { w.set Customs WWkick.8 off }
      if $did($dname,583).state == 1 { w.set Customs WWban.8 On } | else { w.set Customs WWban.8 off }
      if $did($dname,584).state == 1 { w.set Customs WWreq.8 On } | else { w.set Customs WWreq.8 off }
      if $did($dname,585).state == 1 { w.set Customs WWtt.8 On } | else { w.set Customs WWtt.8 off }
      if $did($dname,590).state == 1 { w.set Customs WWops.9 On } | else { w.set Customs WWops.9 off }
      if $did($dname,591).state == 1 { w.set Customs WWvos.9 On } | else { w.set Customs WWvos.9 off }
      if $did($dname,592).state == 1 { w.set Customs WWkick.9 On } | else { w.set Customs WWkick.9 off }
      if $did($dname,593).state == 1 { w.set Customs WWban.9 On } | else { w.set Customs WWban.9 off }
      if $did($dname,594).state == 1 { w.set Customs WWreq.9 On } | else { w.set Customs WWreq.9 off }
      if $did($dname,595).state == 1 { w.set Customs WWtt.9 On } | else { w.set Customs WWtt.9 off }

    }
  }
}
dialog SelFiles {
  Title "Please Select File(s)"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 200 200
  option dbu

  text "Please Select File(s)", 102, 4 2 80 8
  button "Ok", 500, 85 190 30 9, ok
  list 100, 4 10 192 180, sort extsel autovs
  ; list 101, 166 10 30 180, extsel autovs
}
on *:Dialog:SelFiles:*:*:{
  if $devent == init {
    if %SFDwdir [ $+ [ $iNetwork ] ] == $null { set %SFDwdir [ $+ [ $iNetwork ] ] C:\ }
    SFDrefresh %SFDwdir [ $+ [ $iNetwork ] ]
  }
  if $devent == sclick {
    if $did == 500 {
      if $did($dname,100).sel >= 1 {
        unset %SFDfiles [ $+ [ $iNetwork ] ]
        var %ct = 1
        var %tct = $did($dname,100,0).sel
        unset %SFDfiles [ $+ [ $iNetwork ] ]
        while (%ct <= %tct) {
          if $left($did($dname,100,$did($dname,100,%ct).sel).text,1) != $chr(60) && $left($did($dname,100,$did($dname,100,%ct).sel).text,1) != $chr(62) {
            if $len(%SFDfiles [ $+ [ $iNetwork ] ] ) <= 700 { set %SFDfiles [ $+ [ $iNetwork ] ] $addtok(%SFDfiles [ $+ [ $iNetwork ] ] ,$did($dname,100,$did($dname,100,%ct).sel).text,58) }
            else { SFDdone | unset %SFDfiles [ $+ [ $iNetwork ] ] | set %SFDfiles [ $+ [ $iNetwork ] ] $addtok(%SFDfiles [ $+ [ $iNetwork ] ] ,$did($dname,100,$did($dname,100,%ct).sel).text,58) }
          }
          inc %ct 1 | continue
        }
        SFDdone
      }
    }
  }
  if $devent == dclick {
    if $did == 100 {
      if $left($did($dname,100).seltext,1) == $chr(60) { 
        var %ddir = $right($left($did($dname,100).seltext,-1),-1)
        if %ddir == .. {
          set %SFDwdir [ $+ [ $iNetwork ] ] $uponedir(%SFDwdir [ $+ [ $iNetwork ] ] )
          SFDrefresh %SFDwdir [ $+ [ $iNetwork ] ]
        }
        else { 
          set %SFDwdir [ $+ [ $iNetwork ] ] %SFDwdir [ $+ [ $iNetwork ] ] $+ $iif($right(%SFDwdir [ $+ [ $iNetwork ] ] ,1) != \,\) $+ %ddir
          SFDrefresh %SFDwdir [ $+ [ $iNetwork ] ]        
        }
      }
      elseif $left($did($dname,100).seltext,1) == $chr(62) {
        var %ddrv = $left($right($did($dname,100).seltext,-2),2) $+ \
        set %SFDwdir [ $+ [ $iNetwork ] ] %ddrv
        SFDrefresh %SFDwdir [ $+ [ $iNetwork ] ]   
      }
      else {
        if $did($dname,100,0).sel == 1 {
          set %SFDfiles [ $+ [ $iNetwork ] ] $did($dname,100).seltext
          dialog -x SelFiles
          SFDdone
        }
      }
    }
  }
}
alias -l SFDrefresh {
  if $1 != $null {
    did -r SelFiles 100
    dialog -t SelFiles $1-
    if $len($1-) <= 3 {
      var %ct = 65
      while (%ct <= 90) {
        if $disk($chr(%ct)) { did -a SelFiles 100 > $chr(%ct) $+ : $disk($chr(%ct)).label }
        inc %ct 1 | continue
      }
    }
    var %ct = 1
    var %dirct = $finddir($1-,*,0,1)
    did -a SelFiles 100 < $+ .. $+ >
    while (%ct <= %dirct) {
      did -a SelFiles 100 < $+ $nopath($finddir($1-,*,%ct,1)) $+ >
      inc %ct 1 | continue
    }
    var %ct = 1
    var %filect = $findfile($1-,*,0,1)
    while (%ct <= %filect) {
      did -a SelFiles 100 $nopath($findfile($1-,*,%ct,1)) 
      ;   did -a SelFiles 101 $file($findfile($1-,*,%ct,1)).size
      inc %ct 1 | continue
    }
  }
}
alias -l phelp {
  if $1 != $null {
    var %dummy = $input($1-,64,Help Wizard)
    dialog -ve MyKicks
  }
}
on *:TEXT:*:#:{
  if ($me isop $chan) || ($me ishop $chan) {
    if ($cfchk($chan,+rf)) {
      var %curNetwork = $iNetwork
      if (%lastflood [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] = $left($1-,200)) { 
        inc %repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 1
        .timerrepeatsafety  $+ $chan $+ %curNetwork -o 1 10 $chr(123) unset $chr(37) $+ repeat $+ %curNetwork $+ $chan $chr(125)
        if (%repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] >= $cgetset($chan,rfct)) { 
          if (m !isin $chan($chan).mode) { /.timerclearplusM $+ iNetwork $+ $chan 1 60 mode $chan -m  | /.mode $chan +m } 
          var %ct = 1
          while (%ct <= $cgetset($chan,rfct)) {
            if (%LFL [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ]  == $left($1-,200)) {
              if (%LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] !isop $chan) && (%LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] !isvo $chan) {
                if (!$istok(%repeatnicks [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] , %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] ,32)) {
                  ban -u3600 $chan %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] $r.glob(Invision,DefaultBan)
                  kick $chan %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] RePeaT FLuD!
                  if ($r.set(ChanOps,LogDefense) == On) { deflog %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] was kicked and banned at $time(h:nn:tt) for: RePeAT FLuD! }
                  ;var %repeatnicks [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] = $addtok( %repeatnicks [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] , %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] ,32)
                }
              }
            }
            inc %ct 1
            continue
          }
          unset %repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
        }  
      }
      else { unset %repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] }

      set %lastflood [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] $left($1-,200)
      set %LFL9 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %lastflood [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN9 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] $nick
    }
  }
}
on *:ACTION:*:#:{
  if ($me isop $chan) || ($me ishop $chan) {
    if ($cfchk($chan,+rf)) {
      var %curNetwork = $iNetwork
      if (%lastflood [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] = $left($1-,200)) { 
        inc %repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 1
        .timerrepeatsafety  $+ $chan $+ %curNetwork -o 1 10 $chr(123) unset $chr(37) $+ repeat $+ %curNetwork $+ $chan $chr(125)
        if (%repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] >= $cgetset($chan,rfct)) { 
          if (m !isin $chan($chan).mode) { /.timerclearplusM $+ iNetwork $+ $chan 1 60 mode $chan -m  | /.mode $chan +m } 
          var %ct = 1
          while (%ct <= $cgetset($chan,rfct)) {
            if (%LFL [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ]  == $left($1-,200)) {
              if (%LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] !isop $chan) && (%LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] !isvo $chan) {
                if (!$istok(%repeatnicks [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] , %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] ,32)) {
                  ban -u3600 $chan %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] $r.glob(Invision,DefaultBan)
                  kick $chan %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] RePeaT FLuD!
                  if ($r.set(ChanOps,LogDefense) == On) { deflog %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] was kicked and banned at $time(h:nn:tt) for: RePeAT FLuD! }
                  ;var %repeatnicks [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] = $addtok( %repeatnicks [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] , %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] ,32)
                }
              }
            }
            inc %ct 1
            continue
          }
          unset %repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
        }  
      }
      else { unset %repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] }

      set %lastflood [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] $left($1-,200)
      set %LFL9 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %lastflood [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN9 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] $nick
    }
  }
}
on *:NOTICE:*:#:{
  if ($me isop $chan) || ($me ishop $chan) {
    if ($cfchk($chan,+rf)) {
      var %curNetwork = $iNetwork
      if (%lastflood [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] = $left($1-,200)) { 
        inc %repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 1
        .timerrepeatsafety  $+ $chan $+ %curNetwork -o 1 10 $chr(123) unset $chr(37) $+ repeat $+ %curNetwork $+ $chan $chr(125)
        if (%repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] >= $cgetset($chan,rfct)) { 
          if (m !isin $chan($chan).mode) { /.timerclearplusM $+ iNetwork $+ $chan 1 60 mode $chan -m  | /.mode $chan +m } 
          var %ct = 1
          while (%ct <= $cgetset($chan,rfct)) {
            if (%LFL [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ]  == $left($1-,200)) {
              if (%LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] !isop $chan) && (%LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] !isvo $chan) {
                if (!$istok(%repeatnicks [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] , %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] ,32)) {
                  ban -u3600 $chan %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] $r.glob(Invision,DefaultBan)
                  kick $chan %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] RePeaT FLuD!
                  if ($r.set(ChanOps,LogDefense) == On) { deflog %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] was kicked and banned at $time(h:nn:tt) for: RePeAT FLuD! }
                  ;var %repeatnicks [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] = $addtok( %repeatnicks [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] , %LFN [ $+ [ %ct ] ] [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] ,32)
                }
              }
            }
            inc %ct 1
            continue
          }
          unset %repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
        }  
      }
      else { unset %repeat [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] }

      set %lastflood [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] $left($1-,200)
      set %LFL9 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFL1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFL1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %lastflood [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN9 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN8 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN7 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN6 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN5 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN4 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN3 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN2 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] %LFN1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] 
      set %LFN1 [ $+ [ %curNetwork ] ] [ $+ [ $chan ] ] $nick
    }
  }
}


; ############### Social Outbursts ###############

Dialog Outbursts {
  title "Social Outbursts"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 380 270
  option dbu

  button "Ok", 480, 130 255 40 13, ok
  button "Cancel", 490, 172 255 40 13, cancel
  button "Apply", 500, 214 255 40 13

  box "Outburst #1",1,5 10 367 78
  text "Menu Name",11,10 20 30 10
  edit "",21,40 19 50 10
  check "Prefix with nick",31,40 35 50 10
  radio "Send via /msg",41,40 45 50 10, group
  radio "Send via /me",51,40 55 50 10
  text "Outbursts",61,100 20 30 10
  combo 71,130 19 200 70, vsbar hsbar autohs
  button "Add",81,335 20 32 10
  button "Remove",91,335 32 32 10
  button "Load File",101,335 60 32 10
  button "Remove All",111,335 72 32 10

  box "Outburst #2",2,5 90 367 78
  text "Menu Name",12,10 100 30 10
  edit "",22,40 99 50 10
  check "Prefix with nick",32,40 115 50 10
  radio "Send via /msg",42,40 125 50 10, group
  radio "Send via /me",52,40 135 50 10
  text "Outbursts",62,100 100 30 10
  combo 72,130 99 200 70, vsbar hsbar autohs
  button "Add",82,335 100 32 10
  button "Remove",92,335 112 32 10
  button "Load File",102,335 140 32 10
  button "Remove All",112,335 152 32 10

  box "Outburst #3",3,5 170 367 78
  text "Menu Name",13,10 180 30 10
  edit "",23,40 179 50 10
  check "Prefix with nick",33,40 195 50 10
  radio "Send via /msg",43,40 205 50 10, group
  radio "Send via /me",53,40 215 50 10
  text "Outbursts",63,100 180 30 10
  combo 73,130 179 200 70, vsbar hsbar autohs
  button "Add",83,335 180 32 10
  button "Remove",93,335 192 32 10
  button "Load File",103,335 220 32 10
  button "Remove All",113,335 232 32 10
}

on *:dialog:Outbursts:init:0: {
  if ($r.glob(Invision,Outbursts.1.Name) == $null) {
    did -ra $dname 21 Jack Handy
    var %c = 1, %t = $lines(Text\Jackhand.txt)
    while (%c <= %t) {
      did -a $dname 71 $read(Text\Jackhand.txt,%c)
      inc %c
    }
    did -c $dname 41
  }
  else {
    did -ra $dname 21 $r.glob(Invision,Outbursts.1.Name)
    var %c = 1, %t = $lines(Text\Outbursts1.txt)
    while (%c <= %t) {
      did -a $dname 71 $read(Text\Outbursts1.txt,%c)
      inc %c
    }
    var %setting = $r.glob(Invision,Outbursts.1.Settings)
    if ($gettok(%setting,1,32) == 1) did -c $dname 31
    if ($gettok(%setting,2,32) == 1) did -c $dname 41
    if ($gettok(%setting,3,32) == 1) did -c $dname 51
  }
  if ($r.glob(Invision,Outbursts.2.Name) == $null) {
    did -ra $dname 22 Yo Mamma
    var %c = 1, %t = $lines(Text\Mama.txt)
    while (%c <= %t) {
      did -a $dname 72 $read(Text\Mama.txt,%c)
      inc %c
    }
    did -c $dname 32,42
  }
  else {
    did -ra $dname 22 $r.glob(Invision,Outbursts.2.Name)
    var %c = 1, %t = $lines(Text\Outbursts2.txt)
    while (%c <= %t) {
      did -a $dname 72 $read(Text\Outbursts2.txt,%c)
      inc %c
    }
    var %setting = $r.glob(Invision,Outbursts.2.Settings)
    if ($gettok(%setting,1,32) == 1) did -c $dname 32
    if ($gettok(%setting,2,32) == 1) did -c $dname 42
    if ($gettok(%setting,3,32) == 1) did -c $dname 52
  }
  if ($r.glob(Invision,Outbursts.3.Name) == $null) {
    did -ra $dname 23 RedNeck
    var %c = 1, %t = $lines(Text\RedNeck.txt)
    while (%c <= %t) {
      did -a $dname 73 You might be a RedNeck if, $read(Text\RedNeck.txt,%c)
      inc %c
    }
    did -c $dname 33,43
  }
  else {
    did -ra $dname 23 $r.glob(Invision,Outbursts.3.Name)
    var %c = 1, %t = $lines(Text\Outbursts3.txt)
    while (%c <= %t) {
      did -a $dname 73 $read(Text\Outbursts3.txt,%c)
      inc %c
    }
    var %setting = $r.glob(Invision,Outbursts.3.Settings)
    if ($gettok(%setting,1,32) == 1) did -c $dname 33
    if ($gettok(%setting,2,32) == 1) did -c $dname 43
    if ($gettok(%setting,3,32) == 1) did -c $dname 53
  }

  did -z $dname 71
  did -z $dname 72
  did -z $dname 73
}

on *:dialog:Outbursts:sclick:*: {
  if ($did == 81 && $did($dname,71).text) { did -a $dname 71 $did($dname,71).text | did -u $dname 71 }
  elseif ($did == 91 && $did($dname,71).sel) { did -d $dname 71 $did($dname,71).sel | did -u $dname 71 }
  elseif ($did == 82 && $did($dname,72).text) { did -a $dname 72 $did($dname,72).text | did -u $dname 72 }
  elseif ($did == 92 && $did($dname,72).sel) { did -d $dname 72 $did($dname,72).sel | did -u $dname 72 }
  elseif ($did == 83 && $did($dname,73).text) { did -a $dname 73 $did($dname,73).text | did -u $dname 73 }
  elseif ($did == 93 && $did($dname,73).sel) { did -d $dname 73 $did($dname,73).sel | did -u $dname 73 }
  elseif ($did isnum 101-103) {
    var %file = $sfile($mircdir\*.txt,Select a text file to import into Social Outbursts)
    if ($right(%file,3) != txt) { error Only TXT files can be imported into Social Outbursts. | return }
    var %c = 1, %t = $lines(%file)
    while (%c <= %t) {
      var %d = $read(%file,%c)
      if (%d) { did -a $dname $calc($did - 30) %d }
      inc %c
    }
  }
  elseif ($did isnum 111-113) { did -r $dname $calc($did - 40) }
  elseif ($did == 480 || $did == 500) {
    var %c = 1, %t = $did($dname,71).lines
    .fopen -o Outbursts1 Text\Outbursts1.txt
    while (%c <= %t) {
      .fwrite -n Outbursts1 $did($dname,71,%c)
      inc %c
    }
    .fclose Outbursts1
    var %c = 1, %t = $did($dname,72).lines
    .fopen -o Outbursts2 Text\Outbursts2.txt
    while (%c <= %t) {
      .fwrite -n Outbursts2 $did($dname,72,%c)
      inc %c
    }
    .fclose Outbursts2
    var %c = 1, %t = $did($dname,73).lines
    .fopen -o Outbursts3 Text\Outbursts3.txt
    while (%c <= %t) {
      .fwrite -n Outbursts3 $did($dname,73,%c)
      inc %c
    }
    .fclose Outbursts3
    w.glob Invision Outbursts.1.Name $did($dname,21)
    w.glob Invision Outbursts.1.Settings $did($dname,31).state $did($dname,41).state $did($dname,51).state
    w.glob Invision Outbursts.2.Name $did($dname,22)
    w.glob Invision Outbursts.2.Settings $did($dname,32).state $did($dname,42).state $did($dname,52).state
    w.glob Invision Outbursts.3.Name $did($dname,23)
    w.glob Invision Outbursts.3.Settings $did($dname,33).state $did($dname,43).state $did($dname,53).state
    saveallglobals
  }
}

alias iOutburst {
  var %settings = $r.glob(Invision,Outbursts. $+ $1 $+ .Settings)
  if ($gettok(%settings,1,32) == 1) { var %nick = $2 $+ $chr(44) }
  if ($gettok(%settings,2,32) == 1) { var %send = /msg }
  if ($gettok(%settings,3,32) == 1) { var %send = /describe }
  %send $active %nick $read(Text\Outbursts $+ $1 $+ .txt)
}
