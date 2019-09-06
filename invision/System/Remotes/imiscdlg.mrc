; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: imiscdlg.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: Miscellaneous Dialog Routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
Dialog Addon {
  title "Addon Manager"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 270 283

  text "Addons:", 1, 5 5 50 13
  list 2, 5 18 260 102

  text "Script:", 10, 5 123 35 13
  edit "", 11, 50 120 215 22
  text "Author:", 15, 5 145 35 13
  edit "", 16, 50 142 215 22
  text "Desc:", 20, 5 167 35 13
  edit "", 21, 50 164 215 60, multi
  text "Date:", 25, 5 227 35 13
  edit "", 26, 50 224 215 22
  text "Size:", 30, 5 249 35 13
  edit "0b", 6, 50 246 50 22
  button "Load", 5, 112 256 100 22
  button "Done", 200, 215 256 50 22, ok
}
Dialog TDCC {
  title "TDCC Server Settings"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 463 353

  radio "TDCC 1", 1, 10 10 123 20, push
  radio "TDCC 2", 2, 10 30 123 20, push
  radio "TDCC 3", 3, 10 50 123 20, push
  radio "TDCC 4", 4, 10 70 123 20, push
  radio "TDCC 5", 5, 10 90 123 20, push
  box "", 6, 143 5 310 312

  box " Advertise to: ", 30, 10 115 123 110
  radio "OPs Only", 31, 17 135 90 15
  radio "Voiced Only", 32, 17 155 100 15
  radio "OPs and Voiced", 33, 17 175 100 15
  radio "Everyone", 34, 17 195 100 15

  box " Max Settings ", 10, 10 235 123 115
  text "Sends Each:", 11, 17 259 65 13
  edit "", 12, 85 254 28 22
  text "Sends Total:", 13, 17 280 65 13
  edit "", 14, 85 276 28 22
  ;box "Max Queues:", 20, 10 276 123 74
  text "Queues Each:", 21, 17 302 68 13
  edit "", 22, 85 298 28 22
  text "Queues Total:", 23, 17 324 68 13
  edit "", 24, 85 320 28 22

  text "Trigger:", 40, 158 28 35 13
  edit "", 41, 200 25 100 22
  text "Ad Delay (min):", 45, 335 28 75 13
  edit "", 46, 410 25 28 22
  box "Advertising Channels:", 50, 158 57 180 140
  combo 51, 168 77 115 100
  check "All Channel", 52, 168 174 75 15
  button "Add", 53, 288 104 40 22
  button "Rem", 54, 288 126 40 22
  check "Enable on Start", 60, 348 72 95 15
  box "", 65, 158 202 280 100
  text "Filename:", 66, 169 217 100 13
  edit "", 67, 168 230 240 22, autohs
  button "...", 68, 408 231 20 20
  text "Description:", 69, 169 257 60 13
  edit "", 70, 168 270 260 22, autohs

  text "Trigger:", 80, 158 28 35 13, hide
  edit "", 81, 200 25 100 22, hide
  text "Ad Delay (min):", 85, 335 28 75 13, hide
  edit "", 86, 410 25 28 22, hide
  box "Advertising Channels:", 90, 158 57 180 140, hide
  combo 91, 168 77 115 100, hide
  check "All Channel", 92, 168 174 75 15, hide
  button "Add", 93, 288 104 40 22, hide
  button "Rem", 94, 288 126 40 22, hide
  check "Enable on Start", 100, 348 72 95 15, hide
  box "", 105, 158 202 280 100, hide
  text "Filename:", 106, 169 217 100 13, hide
  edit "", 107, 168 230 240 22, autohs, hide
  button "...", 108, 408 231 20 20, hide
  text "Description:", 109, 169 257 60 13, hide
  edit "", 110, 168 270 260 22, hide autohs

  text "Trigger:", 120, 158 28 35 13, hide
  edit "", 121, 200 25 100 22, hide
  text "Ad Delay (min):", 125, 335 28 75 13, hide
  edit "", 126, 410 25 28 22, hide
  box "Advertising Channels:", 130, 158 57 180 140, hide
  combo 131, 168 77 115 100, hide
  check "All Channel", 132, 168 174 75 15, hide
  button "Add", 133, 288 104 40 22, hide
  button "Rem", 134, 288 126 40 22, hide
  check "Enable on Start", 140, 348 72 95 15, hide
  box "", 145, 158 202 280 100, hide
  text "Filename:", 146, 169 217 100 13, hide
  edit "", 147, 168 230 240 22, autohs, hide
  button "...", 148, 408 231 20 20, hide
  text "Description:", 149, 169 257 60 13, hide
  edit "", 150, 168 270 260 22, hide autohs

  text "Trigger:", 160, 158 28 35 13, hide
  edit "", 161, 200 25 100 22, hide
  text "Ad Delay (min):", 165, 335 28 75 13, hide
  edit "", 166, 410 25 28 22, hide
  box "Advertising Channels:", 170, 158 57 180 140, hide
  combo 171, 168 77 115 100, hide
  check "All Channel", 172, 168 174 75 15, hide
  button "Add", 173, 288 104 40 22, hide
  button "Rem", 174, 288 126 40 22, hide
  check "Enable on Start", 180, 348 72 95 15, hide
  box "", 185, 158 202 280 100, hide
  text "Filename:", 186, 169 217 100 13, hide
  edit "", 187, 168 230 240 22, autohs, hide
  button "...", 188, 408 231 20 20, hide
  text "Description:", 189, 169 257 60 13, hide
  edit "", 190, 168 270 260 22, hide autohs

  text "Trigger:", 200, 158 28 35 13, hide
  edit "", 201, 200 25 100 22, hide
  text "Ad Delay (min):", 205, 335 28 75 13, hide
  edit "", 206, 410 25 28 22, hide
  box "Advertising Channels:", 210, 158 57 180 140, hide
  combo 211, 168 77 115 100, hide
  check "All Channel", 212, 168 174 75 15, hide
  button "Add", 213, 288 104 40 22, hide
  button "Rem", 214, 288 126 40 22, hide
  check "Enable on Start", 220, 348 72 95 15, hide
  box "", 225, 158 202 280 100, hide
  text "Filename:", 226, 169 217 100 13, hide
  edit "", 227, 168 230 240 22, autohs, hide
  button "...", 228, 408 231 20 20, hide
  text "Description:", 229, 169 257 60 13, hide
  edit "", 230, 168 270 260 22, hide autohs

  button "OK", 498, 203 323 80 25, ok
  button "Cancel", 499, 288 323 80 25, cancel
  button "Apply", 500, 373 323 80 25
}
Dialog Request {
  title "Request Ad Settings"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 260 94
  option dbu 

  text "Request:", 5, 2 2 20 8
  edit "", 6, 2 10 255 10, autohs
  box "Advertising Channels:", 10, 2 23 110 70
  combo 11, 8 32 80 50
  check "All Channels", 12, 8 80 40 10
  button "Add", 13, 90 32 15 12
  button "Rem", 14, 90 47 15 12
  check "Auto Start", 20, 120 45 35 10
  text "Ad Delay (min):", 30, 120 60 37 10
  edit "", 31, 157 58 15 10, center
  button "OK", 200, 228 81 30 12, ok
  button "Cancel", 201, 195 81 30 12, cancel
}

Dialog OKbox {
  title %OKBtitle
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 %OKBx %OKBy
  option dbu

  text %OKBmsg, 1, 3 2 154 68, center
  button "Ok", 500,  65 69 30 10, ok

}
Dialog PickChan1 {
  title "Select Channel"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 80 30
  option dbu

  combo 400, 5 2 70 80, drop vsbar edit
  button "Ok", 500, 25 18 30 10, ok
}
Dialog PickChan2 {
  title "Select Channel"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 80 30
  option dbu

  combo 400, 5 2 70 80, drop vsbar edit
  button "Ok", 500, 25 18 30 10, ok
}

Dialog ImpWiz {
  title "Import Wizard"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 300 200
  option dbu 

  box "", 10, 2 4 295 180
  icon 300, 20 12 18 32, $shortfn($mircdir) $+ invision\gfx\wiz.bmp, 1, noborder top
  text "Import Wizard is now importing you settings", 40, 98 12 285 30
  list 50, 8 42 285 140, autovs extsel

  button "Close", 200, 127 187 30 12, ok 
}
Dialog TrigChans {
  title %TCHtitle
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 140 80
  option dbu

  button "Ok", 200, 55 70 30 9, ok
  button "ON", 120, 5 2 15 8
  button  "OFF", 130, 120 2 15 8
  check "All Channels", 101, 50 1 40 9
  list 110, 5 10 130 60, autovs
}
on *:dialog:TrigChans:*:*:{
  if $devent == init { 
    var %adchans = $r.set(Fserve,Channels)
    if (%adchans != All) { 
      var %ct = 1
      while (%ct <= $numtok(%adchans,44)) {
        var %chan = $gettok(%adchans,%ct,44)
        if $istok(%TCHChans,%chan,44) == $true || %TCHchans == All { did -a $dname 110 %chan - ON } | else { did -a $dname 110 %chan - OFF }
        inc %ct 1 | continue
      }
    } 
    else { did -c $dname 101 }
    if (%TCHchans == all) { did -c $dname 101 }
    did -b $dname 120,130
  }
  if $devent == sclick {
    if $did == 120 {
      if $did($dname,110).sel >= 1 {
        if %TCHchans == all { unset %TCHchans }
        set %TCHchans $addtok(%TCHchans,$gettok($did($dname,110).seltext,1,32),44)
        did -o $dname 110 $did($dname,110).sel $gettok($did($dname,110).seltext,1,32) - ON
        did -b $dname 120,130
      }
    }
    if $did == 130 {
      if $did($dname,110).sel >= 1 {
        if %TCHchans == all { unset %TCHchans }
        set %TCHchans $remtok(%TCHchans,$gettok($did($dname,110).seltext,1,32),1,44)
        did -o $dname 110 $did($dname,110).sel $gettok($did($dname,110).seltext,1,32) - OFF
        did -b $dname 130,120
        did -u $dname 101
      }
    }
    if $did == 110 {
      did -b $dname 120,130
      if $gettok($did($dname,110).seltext,3,32) == ON { did -e $dname 130 } | else { did -e $dname 120 }
    }
    if $did == 200 {
      setsaved
      if $did($dname,101).state == 1 { w.set [ FServe. [ $+ [ %TCHnum ] ] ] Channels all }
      else { 
        var %ct = 1
        while (%ct <= $did($dname,110).lines) {
          var %chan = $gettok($did($dname,110,%ct).text,1,32)
          var %stat = $gettok($did($dname,110,%ct).text,3,32)
          if %stat == On { set %TCHchans $addtok(%TCHchans,%chan,44) }
          inc %ct 1 | continue
        }
        if %TCHchans == $null { w.set [ FServe. [ $+ [ %TCHnum ] ] ] Channels all }
        else { w.set [ FServe. [ $+ [ %TCHnum ] ] ] Channels %TCHchans }
      }
      dialog -ve InvisFserve
    }
    if $did != 200 { click }
  }
}
Dialog BotDlg {
  title "Custom Bot Commands"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 300 100
  option dbu 

  button "Close", 500, 265 90 30 9, ok

  text "Menu Text for Public Commands", 100, 10 3 100 8
  list 200, 10 10 100 65, autovs
  button "Switch to NickList Msg Commands", 201, 10 66 100 13
  button "Add a New Command", 203, 10 80 100 9
  button "Delete the Selected Command", 204, 10 90 100 9
  text "Command:", 101, 120 3 25 8
  edit "", 202, 120 10 175 10, autohs 

  text "Here you can add you own bot menu commands. The commands you add will appear in the corresponding menus. You can use ''~#~'' where you want your stored bot password to be inserted. You can also use input prompts like to have user prompt for info i.e.: $$?=''Op who?''.  Public Commands are those that will be used in the channel where everyone can see. Be careful not use any passwords or other sensitive info in these commands. MSG commands are those that are sent via private message to the bot. DCC are those sent via DCC chat to the bot. You have to close any open DCC Chat windows with the bot.", 102, 120 22 175 67 
}
alias ebot.set { if ($2 != $null) { return $readini($shortfn($mircdirInvision\botcmds.ini),$1,$2) } }
alias rbot.set { if ($2 != $null) { return $readini($shortfn($mircdirInvision\botcmds.ini),n,$1,$2) } }
alias wbot.set { if ($3 != $null) { writeini -n $shortfn($mircdir) $+ Invision\botcmds.ini $1 $2 $strip($3-,burc) } }
alias dbot.set { if ($2 != $null) { remini $shortfn($mircdir) $+ Invision\botcmds.ini $1 $2 } }
on *:dialog:BotDlg:*:*:{
  if $devent == init {
    set %BOTcmdview Pub
    BotCmdUpdate
  }
  if $devent == sclick {
    if $did == 200 {
      if $did($dname,200).sel >= 1 {
        BotCmdSelect $did($dname,200).sel
      }
    }
    if $did == 201 {
      if %BotCmdView == Pub {
        did -ra $dname 201 Switch to NickList DCC Commands
        did -ra $dname 100 Menu Text for Nicklist Msg Commands
        set %BotCmdView msg
        BotCmdUpdate
        halt
      }
      if %BotCmdView == msg {
        did -ra $dname 201 Switch to Public Commands
        did -ra $dname 100 Menu Text for Nicklist DCC Commands
        set %BotCmdView dcc
        BotCmdUpdate
        halt
      }
      if %BotCmdView == dcc {
        did -ra $dname 201 Switch to NickList Msg Commands
        did -ra $dname 100 Menu Text for Public Commands
        set %BotCmdView pub
        BotCmdUpdate
        halt
      }
    }
    if $did == 203 {
      BotCmdAdd
    }
    if $did == 204 {
      if $did($dname,200).sel >= 1 {
        BotCmdDel $did($dname,200).sel
      }
    }
  }
}
alias -l BotCmdUpdate {
  did -r BotDlg 200,202
  if %BotCmdView == msg { var %section = MSG } | elseif %BotCmdView == dcc { var %section = DCC } | else { var %section = Public }
  var %ct = 1
  while (%ct <= $rbot.set(Counts,%section)) {
    did -a BotDlg 200 $rbot.set(%section $+ Menu,Menu [ $+ [ %ct ] ] )
    inc %ct 1 | continue
  }
  did -ra BotDlg 202 $rbot.set(%section $+ Cmd,Cmd1)
}
alias -l BotCmdSelect {
  if $1 != $null {
    if %BotCmdView == msg { var %section = MSG } | elseif %BotCmdView == dcc { var %section = DCC } | else { var %section = Public }
    did -ra BotDlg 202 $rbot.set(%section $+ Cmd,Cmd [ $+ [ $1 ] ] )
  }
}
alias -l BotCmdAdd {
  if %BotCmdView == msg { var %section = MSG } | elseif %BotCmdView == dcc { var %section = DCC } | else { var %section = Public }
  var %caption = $$?="What would you like the menu caption to be for the [ %section ] command"
  var %command = $$?="What would you like the Command to be for '' [ %caption ] '' [ $iif(%BotCmdView != Public,<use ''~#~'' where you want your password to be inserted ie: opme ~*~>) ] "
  if %caption != $null && %command != $null { 
    var %newcount = $calc($rbot.set(Counts,%section) + 1)
    wbot.set %section $+ Menu Menu [ $+ [ %newcount ] ] %caption
    wbot.set %section $+ Cmd Cmd [ $+ [ %newcount ] ] %command
    wbot.set Counts %section %newcount
    .timer -o 1 0 BotCmdUpdate
  }
}
alias -l BotCmdDel {
  if $1 != $null {
    if %BotCmdView == msg { var %section = MSG } | elseif %BotCmdView == dcc { var %section = DCC } | else { var %section = Public }
    var %curCount = $rbot.set(Counts,%section)
    var %newcount = $calc(%curCount - 1)
    dbot.set %section $+ Menu [ Menu [ $+ [ $1 ] ] ] 
    dbot.set %section $+ Cmd [ Cmd [ $+ [ $1 ] ] ] 
    var %ct = $calc($1 + 1)
    while (%ct <= %curCount) {
      wbot.set %section $+ Menu [ Menu [ $+ [ $calc(%ct - 1) ] ] ] $rbot.set(%section $+ Menu, [ Menu [ $+ [ %ct ] ] ] )
      wbot.set %section $+ Cmd [ Cmd [ $+ [ $calc(%ct - 1) ] ] ] $rbot.set(%section $+ Cmd, [ Cmd [ $+ [ %ct ] ] ] )
      inc %ct 1 | continue
    }
    dbot.set %section $+ Menu [ Menu [ $+ [ %curCount ] ] ] 
    dbot.set %section $+ Cmd [ Cmd [ $+ [ %curCount ] ] ] 
    wbot.set Counts %section %newcount
    BotCmdUpdate
  }
}
dialog INews {
  title "Invision News Update"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 300 200
  option dbu 

  box "", 10, 2 1 296 187
  ; text "Import Wizard is now importing you settings", 40, 8 12 285 30
  edit "" 101, 6 7 288 178, autovs vsbar multi

  button "Close", 200, 135 189 30 10, ok 
}
on *:dialog:OKbox:*:*:{
  if ($devent == sclick) {
    if ($did == 500) { click | dialog -x OKbox | %OKBfunc }
  }
}
on *:dialog:pickchan1:*:*:{
  if ($devent == init) {
    set %pickchanCT 1
    while (%pickchanCT <= $chan(0)) { 
      did -i $dname 400 %pickchanCT $chan(%pickchanCT)
      inc %pickchanCT 1
      continue
    }
    did -i $dname 400 0 $chan(1)
  }
  if ($devent == sclick) {
    if ($did == 500) { 
      click
      set %tempText $did($dname,400).text
      dialog -x pickchan1
      iclonescn %tempText public
    }
  }
}
on *:dialog:pickchan2:*:*:{
  if ($devent == init) {
    set %pickchanCT 1
    while (%pickchanCT <= $chan(0)) { 
      did -i $dname 400 %pickchanCT $chan(%pickchanCT)
      inc %pickchanCT 1
      continue
    }
    did -i $dname 400 0 $chan(1)
  }
  if ($devent == sclick) {
    if ($did == 500) {
      click 
      iclonescn $did($dname,400).text private 
      dialog -x pickchan2 
    }
  }
}
on *:dialog:TDCC:*:*:{ 
  if ($devent == init) {
    dialog -t $dname TDCC Server Settings for $iif($iSetwork != $null,$iSetwork,Global)
    did -c $dname 1
    did -m $dname 67,107,147,187,227
    if $r.set(TDCC,AdTo) == 1 { did -c $dname 34 }
    elseif $r.set(TDCC,AdTo) == 2 { did -c $dname 33 }
    elseif $r.set(TDCC,AdTo) == 3 { did -c $dname 32 }
    else { did -c $dname 31 }
    did -ra $dname 12 $vnum($r.set(TDCC,Max.Sends.Each),1)
    did -ra $dname 14 $vnum($r.set(TDCC,Max.Sends.Total),2)
    did -ra $dname 22 $vnum($r.set(TDCC,Max.Queues.Each),4)
    did -ra $dname 24 $vnum($r.set(TDCC,Max.Queues.Total),10)
    did -ra $dname 41 $r.set(TDCC.1,Trigger)
    did -ra $dname 46 $vnum($r.set(TDCC.1,Ad.Delay),5)
    if (($r.set(TDCC.1,Channels) == All) || ($r.set(TDCC.1,Channels) == $null)) { did -c $dname 52 | did -b $dname 51,53,54 } | else { dla $dname 51 $r.set(TDCC.1,Channels) }
    if ($r.set(TDCC.1,Auto.Start) == On) { did -c $dname 60 }
    did -ra $dname 67 $r.set(TDCC.1,Filename)
    did -ra $dname 70 $r.set(TDCC.1,Desc)
    did -ra $dname 81 $r.set(TDCC.2,Trigger)
    did -ra $dname 86 $vnum($r.set(TDCC.2,Ad.Delay),5)
    if (($r.set(TDCC.2,Channels) == All) || ($r.set(TDCC.2,Channels) == $null)) { did -c $dname 92 | did -b $dname 91,93,94 } | else { dla $dname 91 $r.set(TDCC.2,Channels) }
    if ($r.set(TDCC.2,Auto.Start) == On) { did -c $dname 100 }
    did -ra $dname 107 $r.set(TDCC.2,Filename)
    did -ra $dname 110 $r.set(TDCC.2,Desc)
    did -ra $dname 121 $r.set(TDCC.3,Trigger)
    did -ra $dname 126 $vnum($r.set(TDCC.3,Ad.Delay),5)
    if (($r.set(TDCC.3,Channels) == All) || ($r.set(TDCC.3,Channels) == $null)) { did -c $dname 132 | did -b $dname 131,133,134 } | else { dla $dname 131 $r.set(TDCC.3,Channels) }
    if ($r.set(TDCC.3,Auto.Start) == On) { did -c $dname 140 }
    did -ra $dname 147 $r.set(TDCC.3,Filename)
    did -ra $dname 150 $r.set(TDCC.3,Desc)
    did -ra $dname 161 $r.set(TDCC.4,Trigger)
    did -ra $dname 166 $vnum($r.set(TDCC.4,Ad.Delay),5)
    if (($r.set(TDCC.4,Channels) == All) || ($r.set(TDCC.4,Channels) == $null)) { did -c $dname 172 | did -b $dname 171,173,174 } | else { dla $dname 171 $r.set(TDCC.4,Channels) }
    if ($r.set(TDCC.4,Auto.Start) == On) { did -c $dname 180 }
    did -ra $dname 187 $r.set(TDCC.4,Filename)
    did -ra $dname 190 $r.set(TDCC.4,Desc)

    did -ra $dname 201 $r.set(TDCC.5,Trigger)
    did -ra $dname 206 $vnum($r.set(TDCC.5,Ad.Delay),5)
    if (($r.set(TDCC.5,Channels) == All) || ($r.set(TDCC.5,Channels) == $null)) { did -c $dname 212 | did -b $dname 211,213,214 } | else { dla $dname 211 $r.set(TDCC.5,Channels) }
    if ($r.set(TDCC.5,Auto.Start) == On) { did -c $dname 220 }
    did -ra $dname 227 $r.set(TDCC.5,Filename)
    did -ra $dname 230 $r.set(TDCC.5,Desc)
  }
  if ($devent == sclick) {
    if ($did isnum 1-5) { 
      did -h $dname $tdcc_grp( [ $replace($remtok(1 2 3 4 5,$did,1,32),$chr(32),$chr(44)) ] ) 
      did -v $dname $tdcc_grp($did) 
      if $r.set(TDCC,AdTo) == 1 { did -c $dname 34 }
      elseif $r.set(TDCC,AdTo) == 2 { did -c $dname 33 }
      elseif $r.set(TDCC,AdTo) == 3 { did -c $dname 32 }
      else { did -c $dname 31 }
    }
    if ($did == 52) { if ($did($dname,$did).state == 1) { did -b $dname 51,53,54 } | else { did -e $dname 51,53,54 } }
    if ($did == 53) && ($did($dname,51).sel == $null || $did($dname,51).sel == 0) && ($did($dname,51).text != $null) { did -a $dname 51 $vc($did($dname,51).text) | did -c $dname 51 $did($dname,51).lines }
    if ($did == 54) && ($did($dname,51).sel isnum) { did -d $dname 51 $did($dname,51).sel }
    if ($did == 68) { .timer 1 0 did -ra $dname 67 $!lower( $chr(91) $!$dir="Choose TDCC Filename" *.* $chr(93) ) }
    if ($did == 92) { if ($did($dname,$did).state == 1) { did -b $dname 91,93,94 } | else { did -e $dname 91,93,94 } }
    if ($did == 93) && ($did($dname,91).sel == $null || $did($dname,91).sel == 0) && ($did($dname,91).text != $null) { did -a $dname 91 $vc($did($dname,91).text) | did -c $dname 91 $did($dname,91).lines }
    if ($did == 94) && ($did($dname,91).sel isnum) { did -d $dname 91 $did($dname,91).sel }
    if ($did == 108) { .timer 1 0 did -ra $dname 107 $!lower( $chr(91) $!$dir="Choose TDCC Filename" *.* $chr(93) ) }
    if ($did == 132) { if ($did($dname,$did).state == 1) { did -b $dname 131,133,134 } | else { did -e $dname 131,133,134 } }
    if ($did == 133) && ($did($dname,131).sel == $null || $did($dname,131).sel == 0) && ($did($dname,131).text != $null) { did -a $dname 131 $vc($did($dname,131).text) | did -c $dname 131 $did($dname,131).lines }
    if ($did == 134) && ($did($dname,131).sel isnum) { did -d $dname 131 $did($dname,131).sel }
    if ($did == 148) { .timer 1 0 did -ra $dname 147 $!lower( $chr(91) $!$dir="Choose TDCC Filename" *.* $chr(93) ) }
    if ($did == 172) { if ($did($dname,$did).state == 1) { did -b $dname 171,173,174 } | else { did -e $dname 171,173,174 } }
    if ($did == 173) && ($did($dname,171).sel == $null || $did($dname,171).sel == 0) && ($did($dname,171).text != $null) { did -a $dname 171 $vc($did($dname,171).text) | did -c $dname 171 $did($dname,171).lines }
    if ($did == 174) && ($did($dname,171).sel isnum) { did -d $dname 171 $did($dname,171).sel }
    if ($did == 188) { .timer 1 0 did -ra $dname 187 $!lower( $chr(91) $!$dir="Choose TDCC Filename" *.* $chr(93) ) }
    if ($did == 212) { if ($did($dname,$did).state == 1) { did -b $dname 211,213,214 } | else { did -e $dname 211,213,214 } }
    if ($did == 213) && ($did($dname,211).sel == $null || $did($dname,211).sel == 0) && ($did($dname,211).text != $null) { did -a $dname 211 $vc($did($dname,211).text) | did -c $dname 211 $did($dname,211).lines }
    if ($did == 214) && ($did($dname,211).sel isnum) { did -d $dname 211 $did($dname,211).sel }
    if ($did == 228) { .timer 1 0 did -ra $dname 227 $!lower( $chr(91) $!$dir="Choose TDCC Filename" *.* $chr(93) ) }
    if $did != 498 && $did != 500 { click }

    if (($did == 498) || ($did == 500)) {
      setsaved DCC
      w.set TDCC Max.Sends.Each $vnum($did($dname,12).text,1)
      w.set TDCC Max.Sends.Total $vnum($did($dname,14).text,2)
      w.set TDCC Max.Queues.Each $vnum($did($dname,22).text,4)
      w.set TDCC Max.Queues.Total $vnum($did($dname,24).text,10)
      if ($did($dname,34).state == 1) { w.set TDCC AdTo 1 }
      elseif ($did($dname,33).state == 1) { w.set TDCC AdTo 2 }
      elseif ($did($dname,32).state == 1) { w.set TDCC AdTo 3 }
      else { w.set TDCC AdTo 4 }
      iw.set TDCC.1 Trigger $remove($isset($did($dname,41).text,!tdcc-1),$chr(44),$chr(40),$chr(41),$chr(123),$chr(125),$chr(91),$chr(93))
      w.set TDCC.1 Ad.Delay $vnum($did($dname,46).text,5)
      if ($did($dname,52).state == 1) || ($did($dname,51).lines == 0) { w.set TDCC.1 Channels All } | else { dls $dname 51 w.set TDCC.1 Channels }
      if ($did($dname,60).state == 1) { w.set TDCC.1 Auto.Start On } | else { w.set TDCC.1 Auto.Start Off }
      if ($did($dname,67).text != $r.set(TDCC.1,Filename)) { w.set TDCC.1 Downloads 0 | w.set TDCC.1 Record.CPS 0 n/a }
      w.set TDCC.1 Filename $did($dname,67).text
      iw.set TDCC.1 Desc $isset($did($dname,70).text,No Description!)
      iw.set TDCC.2 Trigger $remove($isset($did($dname,81).text,!tdcc-2),$chr(44),$chr(40),$chr(41),$chr(123),$chr(125),$chr(91),$chr(93))
      w.set TDCC.2 Ad.Delay $vnum($did($dname,86).text,5)
      if ($did($dname,92).state == 1) || ($did($dname,91).lines == 0) { w.set TDCC.2 Channels All } | else { dls $dname 91 w.set TDCC.2 Channels }
      if ($did($dname,100).state == 1) { w.set TDCC.2 Auto.Start On } | else { w.set TDCC.2 Auto.Start Off }
      if ($did($dname,107).text != $r.set(TDCC.2,Filename)) { w.set TDCC.2 Downloads 0 | w.set TDCC.2 Record.CPS 0 n/a }
      w.set TDCC.2 Filename $did($dname,107).text
      iw.set TDCC.2 Desc $isset($did($dname,110).text,No Description!)
      iw.set TDCC.3 Trigger $remove($isset($did($dname,121).text,!tdcc-3),$chr(44),$chr(40),$chr(41),$chr(123),$chr(125),$chr(91),$chr(93))
      w.set TDCC.3 Ad.Delay $vnum($did($dname,126).text,5)
      if ($did($dname,132).state == 1) || ($did($dname,131).lines == 0) { w.set TDCC.3 Channels All } | else { dls $dname 131 w.set TDCC.3 Channels }
      if ($did($dname,140).state == 1) { w.set TDCC.3 Auto.Start On } | else { w.set TDCC.3 Auto.Start Off }
      if ($did($dname,67).text != $r.set(TDCC.1,Filename)) { w.set TDCC.3 Downloads 0 | w.set TDCC.3 Record.CPS 0 n/a }
      w.set TDCC.3 Filename $did($dname,147).text
      iw.set TDCC.3 Desc $isset($did($dname,150).text,No Description!)
      iw.set TDCC.4 Trigger $remove($isset($did($dname,161).text,!tdcc-4),$chr(44),$chr(40),$chr(41),$chr(123),$chr(125),$chr(91),$chr(93))
      w.set TDCC.4 Ad.Delay $vnum($did($dname,166).text,5)
      if ($did($dname,172).state == 1) || ($did($dname,171).lines == 0) { w.set TDCC.4 Channels All } | else { dls $dname 171 w.set TDCC.4 Channels }
      if ($did($dname,180).state == 1) { w.set TDCC.4 Auto.Start On } | else { w.set TDCC.4 Auto.Start Off }
      if ($did($dname,187).text != $r.set(TDCC.1,Filename)) { w.set TDCC.4 Downloads 0 | w.set TDCC.4 Record.CPS 0 n/a }
      w.set TDCC.4 Filename $did($dname,187).text
      iw.set TDCC.4 Desc $isset($did($dname,190).text,No Description!)
      iw.set TDCC.5 Trigger $remove($isset($did($dname,201).text,!tdcc-5),$chr(44),$chr(40),$chr(41),$chr(123),$chr(125),$chr(91),$chr(93))
      w.set TDCC.5 Ad.Delay $vnum($did($dname,206).text,5)
      if ($did($dname,212).state == 1) || ($did($dname,211).lines == 0) { w.set TDCC.5 Channels All } | else { dls $dname 211 w.set TDCC.5 Channels }
      if ($did($dname,220).state == 1) { w.set TDCC.5 Auto.Start On } | else { w.set TDCC.5 Auto.Start Off }
      if ($did($dname,227).text != $r.set(TDCC.1,Filename)) { w.set TDCC.5 Downloads 0 | w.set TDCC.5 Record.CPS 0 n/a }
      w.set TDCC.5 Filename $did($dname,227).text
      iw.set TDCC.5 Desc $isset($did($dname,230).text,No Description!)
    }
  }
}
on *:dialog:Addon:*:*:{ 
  if ($devent == init) {
    did -m $dname 6,11,16,21,26
    var %addon = 0
    :start
    inc %addon 1
    set %addon-file $findfile($shortfn($mircdirAddons),*.ini,%addon)
    if (%addon-file == $null) { unset %addon }
    elseif ($r.addon(%addon-file,Script) != $null) && ($r.addon(%addon-file,Version) != $null) && ($r.addon(%addon-file,Author) != $null)  && ($r.addon(%addon-file,Desc) != $null) && ($r.addon(%addon-file,Date) != $null) { did -a $dname 2 %addon-file | goto start }
    else { goto start }
  }
  if ($devent == dclick) {
    if $did == 2 {
      did -ra $dname 6 $size($lof($did($dname,2,$did($dname,2).sel)))
      did -ra $dname 11 $r.addon($did($dname,2,$did($dname,2).sel),Script) v $+ $r.addon($did($dname,2,$did($dname,2).sel),Version)
      did -ra $dname 16 $r.addon($did($dname,2,$did($dname,2).sel),Author)
      did -r $dname 21 | did -a $dname 21 $r.addon($did($dname,2,$did($dname,2).sel),Desc)
      did -ra $dname 26 $r.addon($did($dname,2,$did($dname,2).sel),Date)
      if ($script($did($dname,2).seltext) != $null) { did -ra $dname 5 Unload } | else { did -ra $dname 5 Load }
      if $script($did($dname,2).seltext) == $null { 
        .timer -o 1 0 addonLOAD $did($dname,2).seltext
        did -ra $dname 5 Unload 
        if ($r.set(Invision,SndOpt15) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound15) } 
      } 
      else { 
        .timer -o 1 0 addonUNLOAD $did($dname,2).seltext 
        did -ra $dname 5 Load 
        if ($r.set(Invision,SndOpt15) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound16) } 
      } 
    }
  }
  if ($devent == sclick) {
    click
    if ($did == 2) {
      did -ra $dname 6 $size($lof($did($dname,2,$did($dname,2).sel)))
      did -ra $dname 11 $r.addon($did($dname,2,$did($dname,2).sel),Script) v $+ $r.addon($did($dname,2,$did($dname,2).sel),Version)
      did -ra $dname 16 $r.addon($did($dname,2,$did($dname,2).sel),Author)
      did -r $dname 21 | did -a $dname 21 $r.addon($did($dname,2,$did($dname,2).sel),Desc)
      did -ra $dname 26 $r.addon($did($dname,2,$did($dname,2).sel),Date)
      if ($script($did($dname,2).seltext) != $null) { did -ra $dname 5 Unload } | else { did -ra $dname 5 Load }
    }
    if ($did == 5) {
      if $script($did($dname,2).seltext) == $null { 
        .timer -o 1 0 addonLOAD $did($dname,2).seltext
        did -ra $dname 5 Unload 
        if ($r.set(Invision,SndOpt15) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound15) } 
      } 
      else { 
        .timer -o 1 0 addonUNLOAD $did($dname,2).seltext 
        did -ra $dname 5 Load 
        if ($r.set(Invision,SndOpt15) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound16) } 
      } 
    }
  }
}
on *:dialog:XDCC_General:*:*:{
  if ($devent == init) {
    dialog -t $dname XDCC Settings for $iif($iSetwork != $null,$iSetwork,Global)
    did -ra $dname 11 $vnum($r.set(XDCC,Max.Sends.Each),1)
    did -ra $dname 6 $vnum($r.set(XDCC,Max.Sends.Total),2)
    did -ra $dname 21 $vnum($r.set(XDCC,Max.Queues.Each),2)
    did -ra $dname 16 $vnum($r.set(XDCC,Max.Queues.Total),5)
    if ($isnum($r.set(XDCC,Pack.List)) == $true) { did -c $dname 30 | did -ra $dname 32 $vnum($r.set(XDCC,Pack.List),30) }
    else { did -b $dname 31,32 | did -r $dname 32 }
    did -ra $dname 41 $vnum($r.set(XDCC,Ad.Delay),5)
    if (($r.set(XDCC,Channels) == All) || ($r.set(XDCC,Channels) == $null)) { did -c $dname 50 | did -b $dname 46,47,48 } | else { dla $dname 46 $r.set(XDCC,Channels) }
    if ($r.set(XDCC,Auto.Start) == On) { did -c $dname 51 }
  }
  if ($devent == sclick) {
    if ($did == 30) { if ($did($dname,$did).state == 1) { did -e $dname 31,32 | did -ra $dname 32 30 } | else { did -b $dname 31,32 | did -r $dname 32 } }
    if ($did == 47) && ($did($dname,46).sel == $null || $did($dname,46).sel == 0) && ($did($dname,46).text != $null) { did -a $dname 46 $vc($did($dname,46).text) | did -c $dname 46 $did($dname,46).lines } 
    if ($did == 48) && ($did($dname,46).sel isnum) { did -d $dname 46 $did($dname,46).sel }
    if ($did == 50) { if ($did($dname,$did).state == 1) { did -b $dname 46,47,48 } | else { did -e $dname 46,47,48 } }
    if $did != 200 { click }
    if ($did == 200) {
      setsaved DCC
      w.set XDCC Max.Sends.Each $vnum($did($dname,11).text,1)
      w.set XDCC Max.Sends.Total $vnum($did($dname,6).text,2)
      w.set XDCC Max.Queues.Each $vnum($did($dname,21).text,2)
      w.set XDCC Max.Queues.Total $vnum($did($dname,16).text,5)
      if ($did($dname,30).state == 1) && ($isnum($vnum($did($dname,32).text),30) == $true) { w.set XDCC Pack.List $vnum($did($dname,32).text,30) }
      else { w.set XDCC Pack.List Off }
      w.set XDCC Ad.Delay $vnum($did($dname,41).text,5)
      if ($did($dname,50).state == 1) || ($did($dname,46).lines == 0) { w.set XDCC Channels All } | else { dls $dname 46 w.set XDCC Channels }
      if ($did($dname,51).state == 1) { w.set XDCC Auto.Start On } | else { w.set XDCC Auto.Start Off }
    }
  }
}
on *:dialog:Request:*:*:{
  if ($devent == init) {
    dialog -t $dname Request Settings for $iif($iSetwork != $null,$iSetwork,Global)
    did -ra $dname 6 $r.set(Request,Request)
    did -ra $dname 31 $vnum($r.set(Request,Ad.Delay),5)
    if (($r.set(Request,Channels) == All) || ($r.set(Request,Channels) == $null)) { did -c $dname 12 | did -b $dname 11,13,14 } | else { dla $dname 11 $r.set(Request,Channels) }
    if ($r.set(Request,Auto.Start) == On) { did -c $dname 20 }
  }
  if ($devent == sclick) {
    if ($did == 12) { if ($did($dname,$did).state == 1) { did -b $dname 11,13,14 } | else { did -e $dname 11,13,14 } }
    if ($did == 13) && ($did($dname,11).sel == $null || $did($dname,11).sel == 0) && ($did($dname,11).text != $null) { did -a $dname 11 $vc($did($dname,11).text) | did -c $dname 11 $did($dname,11).lines } 
    if ($did == 14) && ($did($dname,11).sel isnum) { did -d $dname 11 $did($dname,11).sel }
    if $did != 200 { click }  
    if ($did == 200) {
      setsaved Request
      iw.set Request Request $isset($did($dname,6).text,Nothing..)
      w.set Request Ad.Delay $vnum($did($dname,31).text,5)
      if ($did($dname,12).state == 1) || ($did($dname,11).lines == 0) { w.set Request Channels All } | else { dls $dname 11 w.set Request Channels }
      if ($did($dname,20).state == 1) { w.set Request Auto.Start On } | else { w.set Request Auto.Start Off }
    }
  }
}
menu @Invision_Pager {
  dclick {
    if ($sline(@Invision_Pager,1) != $null) {
      clear @Invision_Pager
      aline @Invision_Pager Time: $r.pager($sline(@Invision_Pager,1).ln,Time)
      aline -p @Invision_Pager Message: $r.pager($sline(@Invision_Pager,1).ln,Message)
    }
  }
  lbclick {
    if ($sline(@Invision_Pager,1) != $null) {
      clear @Invision_Pager
      aline @Invision_Pager Time: $r.pager($sline(@Invision_Pager,1).ln,Time)
      aline -p @Invision_Pager Message: $r.pager($sline(@Invision_Pager,1).ln,Message)
    }
  }
  Read Page:{
    if ($sline(@Invision_Pager,1) != $null) {
      clear @Invision_Pager
      aline @Invision_Pager Time: $r.pager($sline(@Invision_Pager,1).ln,Time)
      aline -p @Invision_Pager Message: $r.pager($sline(@Invision_Pager,1).ln,Message)
    }
  }
  Del Page:{
    if ($sline(@Invision_Pager,1) != $null) && ($r.pager($sline(@Invision_Pager,1).ln,Message) != $null) {
      var %page-c = $sline(@Invision_Pager,1).ln
      :start-del
      inc %page-c 1
      if ($r.pager(%page-c,Message) == $null) {
        d.pager $calc(%page-c - 1)
        clear @Invision_Pager
        clear -l @Invision_Pager
        var %page-c = 0
        :start-list
        inc %page-c 1
        if ($r.pager(%page-c,Message) == $null) { unset %page-c }
        else { aline -l @Invision_Pager $r.pager(%page-c,Nick) | goto start-list }
      } 
      else {
        w.pager $calc(%page-c - 1) Nick $r.pager(%page-c,Nick)
        w.pager $calc(%page-c - 1) Time $r.pager(%page-c,Time)
        w.pager $calc(%page-c - 1) Message $r.pager(%page-c,Message)
        goto start-del
      }
    }
  }
  -
  Clear All:{
    if ($$?!="Do you really want to Clear every Page?" == $true) {
      write -c $shortfn($mircdir) $+ Invision\Pager.ini
      clear -l @Invision_Pager
      clear @Invision_Pager
    }
  }
}
menu @Ports {
  dclick:{
    if ($strip($gettok($sline(@Ports,1),1,32),burc) == Fastest) {
      if ($strip($gettok($sline(@Ports,1),3,32),burc) != $port) { server $server $strip($gettok($sline(@Ports,1),3,32),burc) | window -c @Ports } | goto leave
    }
    if ($strip($gettok($sline(@Ports,1),2,32),burc) !isnum) || ($strip($gettok($sline(@Ports,1),2,32),burc) == $port) { goto leave }
    server $server $strip($gettok($sline(@Ports,1),2,32),burc) | window -c @Ports
  }
  Refresh Ports:port
  -
  Connect to Selected port:{
    if ($strip($gettok($sline(@Ports,1),1,32),burc) == Fastest) {
      if ($strip($gettok($sline(@Ports,1),3,32),burc) != $port) { server $server $strip($gettok($sline(@Ports,1),3,32),burc) | window -c @Ports } | goto leave
    }
    if ($strip($gettok($sline(@Ports,1),2,32),burc) !isnum) || ($strip($gettok($sline(@Ports,1),2,32),burc) == $port) { goto leave }
    server $server $strip($gettok($sline(@Ports,1),2,32),burc) | window -c @Ports
  }
  Connect to Fastest port:if ($strip($gettok($line(@ports,$line(@ports,0)),2,32),burc) != $port) { server $server $strip($gettok($line(@ports,$line(@ports,0)),2,32),burc) | window -c @Ports }
  -
  Close window:window -c @Ports
  :leave
}
Menu @Invision {
  dclick:run $r.static(Script,WebPage)
  Help:help
  Goto WebPage:run $r.static(Script,WebPage)
  Email $r.static(Script,Author):run mailto: $+ $r.static(Script,Email)
  -
  Close:window -c @Invision
}
Menu @About {
  dclick:Abouti2 | run $r.static(Script,WebPage)
  sclick {
    if $mouse.x >= 335 && $mouse.y >= 365 { Abouti2 }
    ;if $mouse.x > 190 && $mouse.x < 254 && $mouse.y > 360 { Abouti2 | .run https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=support@i-n-v-i-s-i-o-n.com&item_name=support@i-n-v-i-s-i-o-n.com+Donation&no_shipping=1&return=http://www.i-n-v-i-s-i-o-n.com/donation.htm&submit.x=22&submit.y=17 }
  }
}
Menu @Serve_Ads_* {
  $chr(32) $chr(32) $chr(32) $chr(32) $chr(32) $chr(32) $chr(32) $calc($fline($active,*,0,0) - 2) Total Ad Lines Shown:.
  $chr(32) $chr(32) $chr(32) $chr(32) $chr(32) $chr(32) $chr(32) $fline($active,*,0,1) Total Triggers Shown:.
  -
  $iif($r.set(Invision,IsoAdsOThalt) == On,$style(1)) Ads appear only in this window $chr(32) $chr(40) $+ $iNetwork $+ $chr(41):{ if $r.set(Invision,IsoAdsOThalt) == On { w.set Invision IsoAdsOThalt off } | else { w.set Invision IsoAdsOThalt on } }
}
Menu @logviewer {
  dclick:if ($isfile($gettok($window(@logviewer).title,2,32)) == $true) { run Notepad $gettok($window(@logviewer).title,2,32) }
  $iif($r.glob(Invision,ViewLogLoadAll) != On, Run Notepad):if ($isfile($gettok($window(@logviewer).title,2,32)) == $true) { run Notepad $gettok($window(@logviewer).title,2,32) }
  -
  $iif($r.glob(Invision,ViewLogLoadAll) != On, Delete Log):if (($isfile($gettok($window(@logviewer).title,2,32)) == $true) && ($$?!="Do you want to delete this log?" == $true)) { .remove $gettok($window(@logviewer).title,2,32) | clear @logviewer | aline @logviewer $c(1) $+ $nopath($gettok($window(@logviewer).title,2,32)) has been removed. | titlebar @logviewer - $logdir*.log | unset $gettok($window(@logviewer).title,2,32) }
  -
  $iif($r.glob(Invision,ViewLogLoadAll) != On, Load a different day):logviewer $$sfile( [ $nofile($gettok($window(@logviewer).title,2,32)) ] [ $+ [ $gettok($nopath($gettok($window(@logviewer).title,2,32)),1,46) ] ] [ $+ [ *.log ] ] ,Choose Log to View)
  $iif($r.glob(Invision,ViewLogLoadAll) != On, Refresh Log):{
    if ($isfile($gettok($window(@logviewer).title,2,32)) == $true) { 
      titlebar @logviewer - $gettok($window(@logviewer).title,2,32) | clear @logviewer
      aline @logviewer $c(1) $+ Name: $nopath($gettok($window(@logviewer).title,2,32))
      aline @logviewer $c(1) $+ Size: $size($file($gettok($window(@logviewer).title,2,32)).size)
      aline @logviewer $c(1) $+ Lines: $lines($gettok($window(@logviewer).title,2,32))
      aline @logviewer $c(1) $+  
      loadbuf -p @logviewer $gettok($window(@logviewer).title,2,32)
      aline @logviewer  
      aline @logviewer $c(1) $+ *** End of File.
      sline @logviewer $line(@logviewer,0)
    }
  }
  View List:{
    titlebar @logviewer - $$sfile($shortfn($logdir) $+ *.log,Choose Log to View) | clear @logviewer
    aline @logviewer $c(1) $+ Name: $nopath($gettok($window(@logviewer).title,2,32))
    aline @logviewer $c(1) $+ Size: $size($file($gettok($window(@logviewer).title,2,32)).size)
    aline @logviewer $c(1) $+ Lines: $lines($gettok($window(@logviewer).title,2,32))
    aline @logviewer $c(1) $+  
    loadbuf -p @logviewer $gettok($window(@logviewer).title,2,32)
    aline @logviewer  
    aline @logviewer $c(1) $+ *** End of File.
    sline @logviewer $line(@logviewer,0)
  }
  -
  Close Viewer:window -c @logviewer
  :leave
}
Menu @syslogview {
  dclick:if ($isfile($gettok($window(@syslogview).title,2,32)) == $true) { run Notepad $gettok($window(@syslogview).title,2,32) }
  Run Notepad:if ($isfile($gettok($window(@syslogview).title,2,32)) == $true) { run Notepad $gettok($window(@syslogview).title,2,32) }
  -
  Delete Log:if (($isfile($gettok($window(@syslogview).title,2,32)) == $true) && ($$?!="Do you want to delete this log?" == $true)) { .remove $gettok($window(@syslogview).title,2,32) | clear @syslogview | aline @syslogview $c(1) $+ $nopath($gettok($window(@syslogview).title,2,32)) has been removed. | titlebar @syslogview - $logdir*.log | unset $gettok($window(@syslogview).title,2,32) }
  -
  Refresh Log:{
    if ($isfile($gettok($window(@syslogview).title,2,32)) == $true) { 
      titlebar @syslogview - $gettok($window(@syslogview).title,2,32) | clear @syslogview
      aline @syslogview $c(1) $+ Name: $nopath($gettok($window(@syslogview).title,2,32))
      aline @syslogview $c(1) $+ Size: $size($file($gettok($window(@syslogview).title,2,32)).size)
      aline @syslogview $c(1) $+ Lines: $lines($gettok($window(@syslogview).title,2,32))
      aline @syslogview $c(1) $+  
      loadbuf -p @syslogview $gettok($window(@syslogview).title,2,32)
      aline @syslogview  
      aline @syslogview $c(1) $+ *** End of File.
      sline @syslogview 4 | goto leave
    }
  }
  View List:{
    set $gettok($window(@syslogview).title,2,32) $$file="Choose Log to View" $shortfn($logdir) $+ *.log
    titlebar @syslogview - $gettok($window(@syslogview).title,2,32) | clear @syslogview
    aline @syslogview $c(1) $+ Name: $nopath($gettok($window(@syslogview).title,2,32))
    aline @syslogview $c(1) $+ Size: $size($file($gettok($window(@syslogview).title,2,32)).size)
    aline @syslogview $c(1) $+ Lines: $lines($gettok($window(@syslogview).title,2,32))
    aline @syslogview $c(1) $+  
    loadbuf -p @syslogview $gettok($window(@syslogview).title,2,32)
    aline @syslogview  
    aline @syslogview $c(1) $+ *** End of File.
    sline @syslogview 4 | goto leave
  }
  -
  Close Viewer:window -c @syslogview
  :leave
}
alias telcmd {
  if ($1 == $null) return
  if ($2 == $null) return
  bset &telcmd 1 255
  set %telcmd.len $gettok($2-,0,32)
  set %telcmd.num 0
  :telcmd
  inc %telcmd.num
  if (%telcmd.num > %telcmd.len) {
    sockwrite $1 &telcmd
    return
  }
  bset &telcmd $calc(%telcmd.num + 1) $gettok($2-,%telcmd.num,32)
  goto telcmd
}
alias telhp {
  if ($1 == $null) return
  if ($sock($rtrim(1,$1),0) == 0) return
  set $evac(telnet.psn,$rtrim(1,$1)) $calc($telen($editbox($1)) * 2)
  if ($evacl(telnet.psl,$rtrim(1,$1)) == $null) {
    set $evac(telnet.psl,$rtrim(1,$1)) $evacl(telnet.psn,$rtrim(1,$1))
  }
  if (($evacl(telnet.psn,$rtrim(1,$1)) == 2) && ($evacl(telnet.psn,$rtrim(1,$1)) == $evacl(telnet.psl,$rtrim(1,$1))) && ($right($editbox($1),1) != $chr(42))) {
    set $evac(telnet.ps,$rtrim(1,$1)) $asc($right($editbox($1),1)) $+ $chr(44)
  }
  if ($evacl(telnet.psn,$rtrim(1,$1)) > $evacl(telnet.psl,$rtrim(1,$1))) set $evac(telnet.ps,$rtrim(1,$1)) $evacl(telnet.ps,$rtrim(1,$1)) $+ $chr(44) $+ $asc($right($editbox($1),1))
  if ($evacl(telnet.psn,$rtrim(1,$1)) < $evacl(telnet.psl,$rtrim(1,$1))) set $evac(telnet.ps,$rtrim(1,$1)) $ltrim($calc($evacl(telnet.psl,$rtrim(1,$1)) - $evacl(telnet.psn,$rtrim(1,$1))),$evacl(telnet.ps,$rtrim(1,$1)))
  if ($editbox($1) != $null) set $evac(telnet.psl,$rtrim(1,$1)) $evacl(telnet.psn,$rtrim(1,$1))
  editbox $1 $str($chr(42),$calc($evacl(telnet.psn,$rtrim(1,$1)) / 2))
}
alias telhpout {
  if ($1 == $null) return
  unset %telhpout.*
  if (($2 == $null) || ($2 !isnum)) set %telhpout.tok 44
  if (($2 != $null) && ($2 isnum)) set %telhpout.tok $2
  set %telhpout.len $gettok($1,0,%telhpout.tok)
  set %telhpout.num 0
  :telhpout.loop | inc %telhpout.num
  if (%telhpout.num > %telhpout.len) { return %telhpout.val }
  set %telhpout.val %telhpout.val $+ $chr($gettok($1,%telhpout.num,%telhpout.tok))
  goto telhpout.loop
}
alias telen {
  if ($1 == $null) return
  if ($len($1) == $null) return 0
  else return $len($1)
}
alias evac {
  if ($1 == $null) return
  return $chr(37) $+ $1 $+ $2
}
alias evacl {
  if ($1 == $null) return
  return % [ $+ [ $remove($1-2,$chr(32)) ] ]
}
alias evacr return $1-
alias evar {
  if ($1 == $null) return
  return % [ $+ [ $1 ] ]
}
alias evau return $remove($1-,$chr(32))
alias rtrim return $right($2-,$calc($len($2-) - $1))
alias ltrim return $left($2-,$calc($len($2-) - $1))

on 1:INPUT:@telnet*: {
  if ($right($line($target,$line($target,0)),1) == $chr(255)) {
    if ($gettok($line($target,$line($target,0)),1,58) == Yourmomma) {
      if ($timer($rtrim(1,$target)) == 1) .timer $+ $rtrim(1,$target) $+ $iNetwork off
      sockwrite -n $gettok($target,1,64) $telhpout($evacl(telnet.ps,$rtrim(1,$target)))
      set $evac(telnet.tls,$gettok($target,1,64)) $1-
      unset $evac(telnet.ps,$rtrim(1,$target))
      unset $evac(telnet.psl,$rtrim(1,$target))
      unset $evac(telnet.psn,$rtrim(1,$target))
      halt
    }
    ;else rline $target $line($target,0) $line($target,$line($target,0)) $+ $1-
  }
  else {
    ;aline $target $1-
    unset $evac(telnet.tcr,$gettok($target,1,64))
  }
  :telnet.end
  sockwrite -n $gettok($target,1,64) $1-
  set $evac(telnet.tls,$gettok($target,1,64)) $1-
  halt
}
on 1:CLOSE:@telnet*: {
  if (tel isin $target) {
    if ($timer($rtrim(1,$target)) == 1) .timer $+ $rtrim(1,$target) $+ $iNetwork off
    echo -s $tptag Closed Connection to $c(2) $+ $sock($remove($target,@)).ip $+ .
    sockclose $remove($target,@)
    unset $evac(telnet.*,$remove($target,@))
    unset $evac(telnet.tls,$gettok($target,1,64))
    return
  }
}
on 1:SOCKOPEN:telnet*: {
  if ($sockerr > 0) {
    echo -a $tpse
    echo -a $tptag Could not Connect to $c(2) $+ $sock($sockname).ip $+ .
    return
  }
  window -ek0 $evau(@,$sockname) Terminal
  titlebar $evau(@,$sockname) - CONNECTED
}
on 1:SOCKCLOSE:telnet*: {
  if ($timer($target) == 1) .timer $+ $target $+ $iNetwork off
  window -c @ $+ $sockname
  echo -s $tptag Connection to $c(2) $+ $sock($sockname).ip was disconnected.
  unset $evac(telnet.*,$sockname)
  unset $evac(telnet.tcn,$sockname)
}
on 1:SOCKREAD:telnet*: {
  sockread -fn &tel
  set %telread.len $bvar(&tel,0)
  var %tel.tmp = $replace($ansi2mirc($bvar(&tel,1,4500).text),NN:,,, ,$lf,,?HTML?,,>>>>,)
  ;echo -a $evau(@,$sockname)
  var %tel.rline = $iif($line($evau(@,$sockname),0),$v1,%tel.rline)
  ;echo -s Window: $evau(@,$sockname)
  if (%tel.tmp) { .aline $evau(@,$sockname)  $+ %tel.tmp }
  set %telread.num 0
  set %telread.sp 0
  :telread
  inc %telread.num
  if (%telread.num > %telread.len) {
    if ($evacl(telnet.tls,$sockname) != $null) {
      if ($left($gettok($evacl(telnet.tls,$sockname),1,32),$len($gettok(%telread.str,1,32))) != $null) goto tpa
      if ($left($gettok($evacl(telnet.tls,$sockname),1,32),$len($gettok(%telread.str,1,32))) == $null) return
      :tpa
      if ($gettok(%telread.str,1,32) == $left($gettok($evacl(telnet.tls,$sockname),1,32),$len($gettok(%telread.str,1,32)))) {
        set $evac(telnet.tcn,$sockname) 1
        unset %telread.*
        return
      }
    }
    if (($mid(%telread.str,1,1) == $chr(253)) && ($mid(%telread.str,2,1) == $chr(24))) set %telread.go 1
    if (($mid(%telread.str,1,1) == $chr(255)) && ($mid(%telread.str,2,1) == $chr(251))) set %telread.go 1
    if (%telread.go) {
      unset %telread.go
      unset %telread.str
    }
    if ((%telread.str) && ($replace(%telread.str,$chr(255),$chr(32)) != $evacl(telnet.tls,$sockname))) {
      if ($gettok(%telread.str,1,58) == Yourmamma) .timer $+ $sockname $+ $iNetwork -m 0 1 telhp $evau(@,$sockname)
      var %tel.tmp = $replace(%telread.str,$chr(255),$chr(32),>>>>,$chr(32),$chr(249),$chr(32),,          ,þ,$chr(32),NN:,)
      var %tel.tmp = $remove(%tel.tmp,?HTML?,[!_,[0t_,[99B_,[0m_)
      if ($ansi2mirc(%tel.tmp) == $chr(32) || $ansi2mirc(%tel.tmp) == ÿù) { unset %tel.tmp }
      ; ANSI Colors
      ; var %tel.tmp = $replace(%tel.tmp,[30m,01,[31m,04,[32m,09,[33m,08,[34m,12,[35m,13,[36m,11,[37m,00)
      ; Other ANSI Codes
      ; var %tel.tmp = $replace(%tel.tmp,[0m,,[1m,,[2m,,[3m,,[4m,,[5m,,[6m,,[7m,,[8m,,[9m,,[10m,,[11m,,[12m,)
      ;if ($ansi2mirc(%tel.tmp)) { aline $evau(@,$sockname) $ansi2mirc(%tel.tmp) }
    }
    unset %telread.*
    return
  }
  if (%telread.fst == 1) {
    if ($bvar(&tel,%telread.num) == 109) unset %telread.fst
    goto telread
  }
  ;if (($bvar(&tel,%telread.num) == 27) && ($bvar(&tel,$calc(%telread.num + 1)) == 91)) {
  ;  set %telread.fst 1
  ;  goto telread
  ;}
  if (($bvar(&tel,%telread.num) = 255) && ($bvar(&tel,$calc(%telread.num + 1)) == 253)) {
    telcmd $sockname 252 $bvar(&tel,$calc(%telread.num + 2))
    goto telread
  }
  if ($bvar(&tel,%telread.num) == 13) {
    goto telread
  }
  if ($bvar(&tel,%telread.num) == 9) {
    set %telread.str %telread.str $+ $str($chr(255),5)
    goto telread
  }
  if ($bvar(&tel,%telread.num) == 10) {
    if ($evacl(telnet.tcn,$sockname)) {
      unset $evac(telnet.tls,$sockname)
      unset $evac(telnet.tcn,$sockname)
      unset %telread.str
      goto telread
    }
    if (%telread.str == $null) aline $evau(@,$sockname) 
    if (($mid(%telread.str,1,1) == $chr(253)) && ($mid(%telread.str,2,1) == $chr(24))) set %telread.go 1
    if (($mid(%telread.str,1,1) == $chr(255)) && ($mid(%telread.str,2,1) == $chr(251))) set %telread.go 1
    if (%telread.go) {
      unset %telread.go
      unset %telread.str
    }
    if ((%telread.str) && ($replace(%telread.str,$chr(255),$chr(32)) != $evacl(telnet.tls,$sockname))) {
      var %tel.tmp = $replace(%telread.str,$chr(255),$chr(32),>>>>,$chr(32),$chr(249),$chr(32),,          ,þ,$chr(32),NN:,)
      var %tel.tmp = $remove(%tel.tmp,?HTML?,[!_,[0t_,[99B_,[0m_)
      if ($ansi2mirc(%tel.tmp) == $chr(32) || $ansi2mirc(%tel.tmp) == ÿù) { unset %tel.tmp }
      ; ANSI Colors
      ; var %tel.tmp = $replace(%tel.tmp,[30m,01,[31m,04,[32m,09,[33m,08,[34m,12,[35m,13,[36m,11,[37m,00)
      ; Other ANSI Codes
      ; var %tel.tmp = $replace(%tel.tmp,[0m,,[1m,,[2m,,[3m,,[4m,,[5m,,[6m,,[7m,,[8m,,[9m,,[10m,,[11m,,[12m,)
      ;if ($ansi2mirc(%tel.tmp)) { aline $evau(@,$sockname) $ansi2mirc(%tel.tmp) }
    }
    unset %telread.al
    unset %telread.str
    goto telread
  }
  if ($bvar(&tel,%telread.num) == 32) {
    set %telread.str %telread.str $+ $chr(255)
    goto telread
  }
  set %telread.str %telread.str $+ $chr($bvar(&tel,%telread.num))
  goto telread
}
Menu @Telnet* {
  Close Connection:{ sockclose $right($mouse.win,-1) | window -c $mouse.win } 
}
alias tptag { return $c(2) $+ $chr(91) $+ $c(1) $+ TELNET $+ $c(2) $+ $chr(93) $+ $c(1) }
alias tpse return $tptag Socket Error
alias telnet {
  if ($1 == $null) {
    Halt
  }
  inc %telnet.num
  if ($2 != $null) { set %telnet.port $2 }
  else { set %telnet.port 23 }
  sockclose Telnet $+ -> $+ $1 $+ : $+ %telnet.port $1
  sockopen Telnet $+ -> $+ $1 $+ : $+ %telnet.port $1 %telnet.port
  set %iLastTelnet $1-
}
Menu @Serve_Ads* {
  dclick:{ 
    .timerFSEB $+ $iNetwork -o 1 60 unset %altFxPflag [ $+ [ $iNetwork ] ]  
    set %altFxPflag [ $+ [ $iNetwork ] ] 1 
    if ($gettok($strip($gettok($sline($active,1),1,32),burc),1,32) != /ctcp && $gettok($strip($gettok($sline($active,1),1,32),burc),1,32) != /msg) {
      if $me ison $right($active,-11) { msg $right($active,-11) $strip($sline($active,1),burc) } 
    }
    elseif ($gettok($strip($gettok($sline($active,1),1,32),burc),1,32) == /ctcp) {
      ctcp $strip($gettok($sline($active,1),2-,32),burc)
    }
    elseif ($gettok($strip($gettok($sline($active,1),1,32),burc),1,32) == /msg) {
      msg $strip($gettok($sline($active,1),2-,32),burc)
    }
  }
}
Menu @Clone_Report_* {
  Display in Channel:{ 
    var %lines = $line($active,0,0)
    var %ct = 1
    while (%ct <= %lines) { 
      .timer 1 $calc( [ %ct - 1 ] * 2) if $me ison $right($active,-14) msg $right($active,-14) $line($active,%ct,0)
      inc %ct 1
      continue
    }
  }
  Close:{ window -c $active }
}
dialog spamfilters {
  title "                       Spam Filter List"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 140 100
  option dbu 
  button "" 200 , 109 89 30 10, cancel hide
  button "Add Filter", 20, 4 0 50 10
  button "Remove Selected", 30, 86 0 50 10
  list 50, 4 10 132 80, autohs center
  button "Ok", 100, 55 89 30 10, ok
}
on *:dialog:spamfilters:*:*:{ 
  if ($devent == init) {
    dla $dname 50 $r.set(Invision,SpamList)
  }
  if $devent == sclick {
    if $did == 20 {
      var %joj = $input(New Filter to Add?,129,Add?)
      dialog -v spamfilters
      if %joj != $null {
        did -a $dname 50 %joj
      }
    }
    if $did == 30 {
      if $did($dname,50).sel != $null && $did($dname,50).seltext != $null {
        did -d $dname 50 $did($dname,50).sel
        dialog -v spamfilters
      }
    }
    if $did == 100 {
      if $did($dname,50).lines >= 1 { dls $dname 50 w.set Invision SpamList } | else { d.set Invision SpamList }
      dialog -v InvisMain
    }
    if $did == 200 {
      dialog -v InvisMain
    }
  }
}
alias bug+ { .write $shortfn($mircdir) $+ bugrep $replace($1-,$chr(37),$chr(32) $+ percent,\,-,=,-) }
on *:dialog:bugreport:sclick:500:{ 
  .write -c $shortfn($mircdir) $+ bugrep
  bug+ Invision $r.static(Script,Version) Bug Report Generated [ $time(dddd mm/dd/yyyy h:nntt) ]
  bug+ The added info below what you entered is to help diagnose the problem please feel free to review it before sending.
  bug+ _______________________________________________________________________________________________
  bug+ $chr(160)
  var %ct = 1
  while (%ct <= 100) {
    var %curline = $did($dname,200,%ct).text
    bug+ [ $did($dname,200,%ct).text ]
    inc %ct 1
    continue
  }
  bug+ $chr(160)
  bug+ _______________________________________________________________________________________________
  bug+ $chr(160)
  bug+ Using Invision $r.static(Script,Version) $r.static(Script,Build) from #Invision on irc.irchighway.net running on Windows $+ $os and mIRC $version 
  bug+ CPU/MEM: $dll(invision.dll,invisionCPU,_) with $dll(invision.dll,invisionMEM,_) 
  ; if %lalala == On {
  bug+ Storage System: $r.set(Personal.Info,HD) Internet Connection: $r.set(Personal.Info,Connection)
  ; }
  ; bug+ Display System: $r.set(Personal.Info,Video) using a $r.set(personal.info,Monitor) monitor at $dll(invision.dll,invisionRES,_)

  bug+ Total Bandwidth at $ratefix($calc($gbandwidth + $bandwidth)) with $send(0) outgoing send $+ $iif($send(0) != 1,s) totaling $ratefix($bandwidth) and $get(0)  incoming get $+ $iif($get(0) != 1,s) totaling $ratefix($gbandwidth)
  bug+ Total DCC's in Progress is $calc($send(0) + $get(0))
  if $send(0) >= 1 {
    var %ct = 1
    while (%ct <= $send(0)) {
      bug+ Send $chr(35) $+ %ct Status:  $send(%ct).status $char(160) CPS: $send(%ct).cps $chr(160) Sent:  $send(%ct).sent $chr(160) Percent Xfered: $send(%ct).pc  
      inc %ct 1
      continue
    }
  }
  if $get(0) >= 1 {
    var %ct = 1
    while (%ct <= $get(0)) {
      bug+ Get $chr(35) $+ %ct Status:  $get(%ct).status $char(160) CPS: $get(%ct).cps $chr(160) Received: $get(%ct).sent $chr(160) Percent Xfered: $get(%ct).pc  
      inc %ct 1
      continue
    }
  }
  if $server != $null {
    bug+ Connected to: $server $+ : $+ $port of $server($server).group as $me $usermode and is $iif($away,away,not away)
    bug+ Network ID: $network  $chr(160) Prefix's: $prefix  $chr(160) Modemax: $modespl
    bug+ In a Total of $chan(0) Channels 
    var %ct = 1
    while (%ct <= $chan(0)) {
      bug+ Channel $chr(35) $+ %ct $chr(160) modes: $gettok($chan(%ct).mode,1,32) $chr(160) status:  $chan(%ct).status $chr(160) IAL synced: $iif($chan(%ct).ial,Yes,No)
      inc %ct 1
      continue
    }
  }
  bug+ Fserve Status: $r.set(Fserve,Status) $chr(160) Listening: $r.set(Fserve,Listen) $chr(160) Pause: $r.set(Fserve,Pause)
  bug+ mp3Serv Status: $r.set(mp3Serv,Status) $chr(160) Listening: $r.set(mp3Serv,Listen) $chr(160) Pause: $r.set(mp3Serv,Pause)
  bug+ XDCC Status: $r.set(XDCC,Status) $chr(160) Anouncer Status: $r.set(Anouncer,Status) $chr(160) Requester Status: $r.set(Request,Status)
  bug+ TDCC1 Status: $r.set(Tdcc.1,status) $chr(160) TDCC2 Status: $r.set(tdcc.2,status) $chr(160) TDCC3 Status: $r.set(tdcc.3,status) $chr(160) TDCC3 Status: $r.set(TDCC.3,status) $chr(160) TDCC4 Status: $r.set(tdcc.4,status) $chr(160) TDCC5 Status: $r.set(tdcc.5,status)

  .timer -o 1 0 bugreport
}

dialog twoinvisions {
  title "WARNING!"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 140 70
  option dbu

  button "Ok",100, 55 58 30 10, ok
  text "Either you are running two instances of Invision from the same directory or you didn't close mIRC down properly last time. Running two instances from the same directory (other then script rebooting) can cause corrupted Settings and/or script. Please use seperate directories for additional Instances of Invision.", 200, 4 4 132 40, center
  check "Don't Show This Again",101,35 47 100 10
}
on *:dialog:twoinvisions:*:*:{
  if ($devent == init) {
    if ($r.mirc(Invision,HideTwoInvisionsWarning) == 1) { did -c $dname 101 }
  }
  elseif ($devent == sclick) {
    ; Clicked Ok
    if ($did == 100) {
      w.mirc Invision HideTwoInvisionsWarning $did($dname,101).state
    }
  }
}

dialog booterror {
  title "SEVERE ERROR!"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 140 65
  option dbu

  button "Ok",100,55 55 30 10, ok
  text "A serious error has occurred during script boot. Invision will not function correctly under this condition and therefore will be forced to shutdown in 60 seconds. Please scroll through the Status Window Text and try and locate the error. Errors by default will appear in green type and be preceded by *. If you need help solving the problem please contact Invision Support in #Invision on irc.irchighway.net.", 200, 4 0 132 53, center
}
dialog bugreport {
  title "Invision $r.static(Script,Version) Bug Report"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 240 150
  option dbu

  text "Please Describe the Problem you are having below.", 100, 4 1 232 8
  edit "", 200, 4 10 232 130, multi return vsbar
  button "Ok", 500, 105 140 30 10, Ok
}
Dialog AwayMgr {
  title "Away Manager"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 300 271
  option dbu

  tab "General Settings", 1, 2 0 294 212
  tab "Custom Away Messages", 2
  tab "AFK and Nick Alert Exceptions", 3

  box " Active Help ", 1501, 4 214 292 47
  edit "", 1502, 8 222 284 37, multi autovs

  button "OK", 498, 91 262 35 9, ok
  button "Cancel", 499, 131 262 35 9, cancel
  button "&Apply", 500, 171 262 35 9

  box "Away Nickname", 190, 10 20 140 30, tab 1
  text "Away:", 193, 15 37 16 10, tab 1
  edit "", 194, 47 35 80 10, autohs, tab 1
  box " Actions ", 344, 10 53 140 120, tab 1
  check "",188, 15 60 8 10, tab 1
  text "Messages to single window when away",189, 24 61 121 8, tab 1
  check "", 195, 15 70 8 10, tab 1
  text "Deop in channels when away", 1091, 24 71 121 8, tab 1
  check "", 196, 15 80 8 10, tab 1
  text "Auto Reply to people", 1092, 24 81 121 8, tab 1
  check "", 197, 15 90 8 10, tab 1
  text "Turn on Pager and Logger", 1093, 24 91 121 8, tab 1
  check "", 198, 15 100 8 10, tab 1
  text "Auto Refuse DCC Chats", 1094, 24 101 121 8, tab 1
  check "", 199, 15 110 8 10, tab 1
  text "Display Away Msg on Nick use", 1095, 24 111 121 8, tab 1
  check "Display tooltips for messages while away", 1998, 15 120 121 10, tab 1
  check "Display tooltips for messages in the Pager", 1999, 15 130 121 10, tab 1

  ;   *****************   Spare Text IDs 1096 - 1100    *******************

  box "Away Message", 204, 155 143 65 30, tab 1
  check "Enabled", 205, 160 150 30 10, tab 1
  text "Timer (min):", 160, 160 162 30 8, tab 1
  edit "", 207, 190 160 20 10, tab 1 center
  box "Auto Away", 200, 225 143 65 30, tab 1
  check "Enabled", 201, 230 150 30 10, tab 1
  text "Timer (min):", 214, 228 162 30 8, tab 1
  edit "", 203, 261 160 20 10, tab 1 center
  box " Active Channels ", 215, 155 20 135 122, tab 1
  radio "Include", 218, 200 30 30 10, tab 1 group
  radio "Exclude", 219, 240 30 30 10, tab 1 
  combo 217, 190 40 90 95, tab 1
  button "Add", 220, 160 40 25 9, tab 1
  button "Rem", 221, 160 50 25 9, tab 1 
  check "All Channels", 222, 210 131 50 10, tab 1
  text "Auto away sets you away automatically after the specified time set.  The message tells all the channels you're on that you're away and why at intervals according to the timer setting.", 208, 15 140 130 30, tab 1
  box " Personal Auto Away Msg ", 345, 10 175 280 23, tab 1
  check "Enable", 346, 15 185 27 10, tab 1
  edit "", 347, 44 185 240 10, tab 1

  ; ################ TAB 2 ##################

  box "", 1200, 4 16 290 186, tab 2
  text "Away 1 Description:", 1201, 8 25 48 10, tab 2
  edit "", 1202, 56 23 75 10, tab 2
  text "Away 1 Message:", 1203, 8 35 45 10, tab 2
  edit "", 1204, 56 33 230 10, tab 2
  box "", 1205, 4 44 290 1, tab 2

  text "Away 2 Description:", 1211, 8 53 48 10, tab 2
  edit "", 1212, 56 51 75 10, tab 2
  text "Away 2 Message:", 1213, 8 63 45 10, tab 2
  edit "", 1214, 56 61 230 10, tab 2
  box "", 1215, 4 72 290 1, tab 2

  text "Away 3 Description:", 1221, 8 81 48 10, tab 2
  edit "", 1222, 56 79 75 10, tab 2
  text "Away 3 Message:", 1223, 8 91 45 10, tab 2
  edit "", 1224, 56 89 230 10, tab 2
  box "", 1225, 4 100 290 1, tab 2

  text "Away 4 Description:", 1231, 8 109 48 10, tab 2
  edit "", 1232, 56 107 75 10, tab 2
  text "Away 4 Message:", 1233, 8 119 45 10, tab 2
  edit "", 1234, 56 117 230 10, tab 2
  box "", 1235, 4 128 290 1, tab 2

  text "Away 5 Description:", 1241, 8 137 48 10, tab 2
  edit "", 1242, 56 135 75 10, tab 2
  text "Away 5 Message:", 1243, 8 147 45 10, tab 2
  edit "", 1244, 56 145 230 10, tab 2
  box "", 1245, 4 156 290 1, tab 2

  text "Away 6 Description:", 1251, 8 165 48 10, tab 2
  edit "", 1252, 56 163 75 10, tab 2
  text "Away 6 Message:", 1253, 8 175 45 10, tab 2
  edit "", 1254, 56 173 230 10, tab 2
  box "", 1255, 4 184 290 1, tab 2

  text "* The Description is what appears in the menu. Leaving a Description Field blank will remove it from the menu.", 1260, 8 193 265 10, tab 2 center

  ; ################ TAB 3 ##################

  text "When 'Display Away Msg on Nick use' OR 'Nick Alert' is enabled, the nicks you add to this Exceptions list will not trigger your away message or alert you.  This is useful for dealing with bots.",400,20 30 100 40, tab 3
  box " Away Message Nick Exceptions ", 401, 155 20 135 122, tab 3
  combo 402, 190 40 90 95, tab 3
  button "Add", 403, 160 40 25 9, tab 3
  button "Rem", 404, 160 50 25 9, tab 3 

}
on *:dialog:awaymgr:*:*:{
  if $devent == mouse { 
    .timer -om 1 500 AwayHelp $mouse.x $mouse.y
  }
  if $devent == init {
    if $r.set(Away,Msglogger) == On { did -c $dname 188 }
    if ($r.set(Invision,AutoAwayMsg.Status) == On) { did -c $dname 346 }
    did -ra $dname 347 $r.set(Invision,AutoAwayMsg.Msg)
    did -ra $dname 194 $r.set(Away,Away.Nick)
    if ($r.set(Away,Auto.Deop) == On) { did -c $dname 195 }
    if ($r.set(Away,Auto.Reply) == On) { did -c $dname 196 }
    if ($r.set(Away,Pager) == On) { did -c $dname 197 }
    if ($r.set(Away,Reject.Chat) == On) { did -c $dname 198 }
    if ($r.set(Away,Tooltip.Away) == On) { did -c $dname 1998 }
    if ($r.set(Away,Tooltip.Pager) == On) { did -c $dname 1999 }
    if ($r.set(Away,Auto.Away) == On) { did -c $dname 201 }
    did -ra $dname 203 $vnum($r.set(Away,Auto.Away.Delay),30)
    if ($r.set(Away,Away.Msg) == On) { did -c $dname 205 }
    did -ra $dname 207 $vnum($r.set(Away,Away.Msg.Delay),60)
    if ($r.set(Away,Channels) == All) || ($r.set(Away,Channels) == $null) { did -c $dname 222 | did -b $dname 217,220,221 }
    else { dla $dname 217 $r.set(Away,Channels) }
    if ($r.set(Away,Exceptions) != !) { dla $dname 402 $r.set(Away,Exceptions) }
    if ($r.set(Away,chanInclude) == On) { did -c $dname 218 } | else { did -c $dname 219 }
    if ($r.set(Invision,AwayAlert) == On) { did -c $dname 199 }
    did -ra $dname 1202 $r.glob(Customs,AWY1.desc)
    did -ra $dname 1204 $r.glob(Customs,AWY1.msg)
    did -ra $dname 1212 $r.glob(Customs,AWY2.desc)
    did -ra $dname 1214 $r.glob(Customs,AWY2.msg)
    did -ra $dname 1222 $r.glob(Customs,AWY3.desc)
    did -ra $dname 1224 $r.glob(Customs,AWY3.msg)
    did -ra $dname 1232 $r.glob(Customs,AWY4.desc)
    did -ra $dname 1234 $r.glob(Customs,AWY4.msg)
    did -ra $dname 1242 $r.glob(Customs,AWY5.desc)
    did -ra $dname 1244 $r.glob(Customs,AWY5.msg)
    did -ra $dname 1252 $r.glob(Customs,AWY6.desc)
    did -ra $dname 1254 $r.glob(Customs,AWY6.msg)
  }
  if $devent == sclick {
    if ($did == 222) { if ($did($dname,$did).state == 1) { did -b $dname 217,220,221 } | else { did -e $dname 217,220,221 } }
    if ($did == 220) && ($did($dname,217).sel == $null || $did($dname,217).sel == 0) && ($did($dname,217).text != $null) { did -a $dname 217 $vc($did($dname,217).text) | did -c $dname 217 $did($dname,217).lines } 
    if ($did == 221) && ($did($dname,217).sel isnum) { did -d $dname 217 $did($dname,217).sel }
    if ($did == 403) && ($did($dname,402).sel == $null || $did($dname,402).sel == 0) && ($did($dname,402).text != $null) { did -a $dname 402 $did($dname,402).text | did -c $dname 402 $did($dname,402).lines } 
    if ($did == 404) && ($did($dname,402).sel isnum) { did -d $dname 402 $did($dname,402).sel }
    if $did >= 1 && $did <= 9 { did -r $dname 1502 }
    if $did == 498 || $did == 500 {
      if $did($dname,188).state == 1 { w.set Away Msglogger On } | else { w.set Away Msglogger Off }
      if ($did($dname,222).state == 1) || ($did($dname,217).lines == 0) { w.set Away Channels All }
      else { dls $dname 217 w.set Away Channels }
      if ($did($dname,402).lines == 0) { w.set Away Exceptions ! }
      else { dls $dname 402 w.set Away Exceptions }
      if ($did($dname,218).state == 1) { w.set Away chanInclude On } | else { w.set Away chanInclude Off }
      if ($did($dname,199).state == 1) { w.set Invision AwayAlert On } | else { w.set Invision AwayAlert Off }
      if ($did($dname,1998).state == 1) { w.set Away Tooltip.Away On } | else { w.set Away Tooltip.Away Off }
      if ($did($dname,1999).state == 1) { w.set Away Tooltip.Pager On } | else { w.set Away Tooltip.Pager Off }
      if ($did($dname,346).state == 1) { w.set Invision AutoAwayMsg.Status On } | else { w.set Invision AutoAwayMsg.Status Off }
      w.set Invision AutoAwayMsg.Msg $isset($did($dname,347).text,$null)
      if $did($dname,194).text == $null { did -ra $dname 194 n/a }
      w.set Away Away.Nick $did($dname,194).text
      if ($did($dname,195).state == 1) { w.set Away Auto.Deop On } | else { w.set Away Auto.Deop Off }
      if ($did($dname,196).state == 1) { w.set Away Auto.Reply On } | else { w.set Away Auto.Reply Off }
      if ($did($dname,197).state == 1) { w.set Away Pager On } | else { w.set Away Pager Off }
      if ($did($dname,198).state == 1) { w.set Away Reject.Chat On } | else { w.set Away Reject.Chat Off }
      if ($did($dname,201).state == 1) { w.set Away Auto.Away On } | else { w.set Away Auto.Away Off }
      w.set Away Auto.Away.Delay $vnum($did($dname,203).text,30)
      if ($r.set(Away,Auto.Away) == On) && ($isnum($r.set(Away,Auto.Away.Delay)) == $true) && ($away != $true) { .timerAuto.Away $+ $iNetwork 1 $calc($r.set(Away,Auto.Away.Delay) * 60) auto-away } | else { .timerAuto.Away $+ $iNetwork Off }
      if ($did($dname,205).state == 1) { w.set Away Away.Msg On } | else { w.set Away Away.Msg Off }
      w.set Away Away.Msg.Delay $vnum($did($dname,207).text,30)
      if ($isnum($r.set(Away,Away.Msg.Delay)) == $true) && ($r.set(Away,Away.Msg) == On) && ($away == $true) { .timerAway.Msg $+ $iNetwork 0 $calc($r.set(Away,Away.Msg.Delay) * 60) away.msg }
      if $did($dname,1202).text != $null { w.glob Customs AWY1.desc $did($dname,1202).text } | else { d.glob Customs AWY1.desc }
      if $did($dname,1204).text != $null { w.glob Customs AWY1.msg $did($dname,1204).text } | else { d.glob Customs AWY1.msg }
      if $did($dname,1212).text != $null { w.glob Customs AWY2.desc $did($dname,1212).text } | else { d.glob Customs AWY2.desc }
      if $did($dname,1214).text != $null { w.glob Customs AWY2.msg $did($dname,1214).text } | else { d.glob Customs AWY2.msg }
      if $did($dname,1222).text != $null { w.glob Customs AWY3.desc $did($dname,1222).text } | else { d.glob Customs AWY3.desc }
      if $did($dname,1224).text != $null { w.glob Customs AWY3.msg $did($dname,1224).text } | else { d.glob Customs AWY3.msg }
      if $did($dname,1232).text != $null { w.glob Customs AWY4.desc $did($dname,1232).text } | else { d.glob Customs AWY4.desc }
      if $did($dname,1234).text != $null { w.glob Customs AWY4.msg $did($dname,1234).text } | else { d.glob Customs AWY4.msg }
      if $did($dname,1242).text != $null { w.glob Customs AWY5.desc $did($dname,1242).text } | else { d.glob Customs AWY5.desc }
      if $did($dname,1244).text != $null { w.glob Customs AWY5.msg $did($dname,1244).text } | else { d.glob Customs AWY5.msg }
      if $did($dname,1252).text != $null { w.glob Customs AWY6.desc $did($dname,1252).text } | else { d.glob Customs AWY6.desc }
      if $did($dname,1254).text != $null { w.glob Customs AWY6.msg $did($dname,1254).text } | else { d.glob Customs AWY6.msg }
      setsaved
    }
  }
}
on *:Dialog:*:*:*:{
  if $devent == sclick {
    ; secho DID: $did > $dialog($dname).ok > $dialog($dname).cancel
    if $did == $dialog($dname).ok || $did == $dialog($dname).cancel {
      if $agent(mirc).visible { .ghide mirc }
    }
  }
}
alias atelnet {
  if ($1 == $null) {
    Halt
  }
  inc %telnet.num
  if ($2 != $null) { set %telnet.port $2 }
  else { set %telnet.port 23 }
  sockclose aTelnet $+ -> $+ $1 $+ : $+ %telnet.port $1
  sockopen aTelnet $+ -> $+ $1 $+ : $+ %telnet.port $1 %telnet.port
  set %iLastTelnet $1-
}
on 1:INPUT:@atelnet*: {
  if ($right($line($target,$line($target,0)),1) == $chr(255)) {
    if ($gettok($line($target,$line($target,0)),1,58) == Yourmomma) {
      if ($timer($rtrim(1,$target)) == 1) .timer $+ $rtrim(1,$target) $+ $iNetwork off
      sockwrite -n $gettok($target,1,64) $telhpout($evacl(telnet.ps,$rtrim(1,$target)))
      set $evac(telnet.tls,$gettok($target,1,64)) $1-
      unset $evac(telnet.ps,$rtrim(1,$target))
      unset $evac(telnet.psl,$rtrim(1,$target))
      unset $evac(telnet.psn,$rtrim(1,$target))
      halt
    }
    else rline $target $line($target,0) $line($target,$line($target,0)) $+ $1-
  }
  else {
    aline $target $1-
    unset $evac(telnet.tcr,$gettok($target,1,64))
  }
  :telnet.end
  sockwrite -n $gettok($target,1,64) $1-
  set $evac(telnet.tls,$gettok($target,1,64)) $1-
  halt
}
on 1:CLOSE:@atelnet*: {
  if (tel isin $target) {
    if ($timer($rtrim(1,$target)) == 1) .timer $+ $rtrim(1,$target) $+ $iNetwork off
    echo -s $tptag Closed Connection to $c(2) $+ $sock($remove($target,@)).ip $+ .
    sockclose $remove($target,@)
    unset $evac(telnet.*,$remove($target,@))
    return
  }
}
on 1:SOCKOPEN:atelnet*: {
  if ($sockerr > 0) {
    echo -a $tpse
    echo -a $tptag Could not Connect to $c(2) $+ $sock($sockname).ip $+ .
    return
  }
}
on 1:SOCKCLOSE:atelnet*: {
  if ($timer($target) == 1) .timer $+ $target $+ $iNetwork off
  window -c @ $+ $sockname
  echo -s $tptag Connection to $c(2) $+ $sock($sockname).ip was disconnected.
  unset $evac(telnet.*,$sockname)
}
on 1:SOCKREAD:atelnet*: {
  bunset &tel
  sockread &tel
  ansitelnet  $+ $sockname
  ansitelnet &tel
}
menu @aTelnet* {
  Size
  .Small: { set %tel.size = s | set %tel.x.size 6 | set %tel.y.size 8 | set %tel.font.size 10 }
  .Medium: { set %tel.size = m | set %tel.x.size 8 | set %tel.y.size 12 | set %tel.font.size 12 }
  .Large: { set %tel.size = l | set %tel.x.size 12 | set %tel.y.size 16 | set %tel.font.size 16 }
}
alias ansitelnet {
  if ($left($1,1) == ) { set %tel.window @ $+ $remove($1-,) | return }
  if (!$window(%tel.window)) {
    window -px %tel.window
    var %c = 1, %tel.break
    if (%tel.size == s) { set %tel.x.size 6 | set %tel.y.size 8 | set %tel.font.size 10 }
    elseif (%tel.size == m || %tel.size == $null) { set %tel.x.size 8 | set %tel.y.size 12 | set %tel.font.size 12 }
    elseif (%tel.size == l) { set %tel.x.size 12 | set %tel.y.size 16 | set %tel.font.size 16 }
    set %tel.y %tel.y.size
    set %tel.x %tel.x.size
    set %tel.clr 0
    set %tel.clr.bk 1
    set %tel.bold 0
    set %tel.y.save 0
    set %tel.x.save 0
  }
  var %c = 1
  while (%c >= 1) {
    if (%tel.y > $calc(25 * %tel.y.size - %tel.y.size)) {
      var %tel.h = $calc(25 * %tel.y.size - %tel.y.size + 20), %tel.w = $calc(80 * %tel.x.size + 20)
      drawcopy %tel.window 0 %tel.y.size %tel.w %tel.h %tel.window 0 0
      dec %tel.y %tel.y.size
      drawrect -f %tel.window 1 0 0 %tel.y %tel.w %tel.y.size
    }
    var %tel.chr = $bvar(&tel,%c,1).text

    ;echo -s ::: %tel.chr
    ;set %tel.tmp %tel.tmp $+ %tel.chr
    ;if (%tel.chr == $chr(13)) { echo -s %tel.tmp | unset %tel.tmp }

    if (%tel.chr == $null) { break }
    if (%tel.cmd && $len(%tel.cmdcode) == 1 && $asc(%tel.chr) !isnum 251-254) {
      ;echo -a 04-- %tel.chr
      inc %tel.x 6
      if (%tel.x > $calc(80 * %tel.x.size + %tel.x.size)) { set %tel.x %tel.x.size | inc %tel.y %tel.y.size }
      if (%tel.chr != $chr(32)) { drawtext -b %tel.window %tel.clr %tel.clr.bk FixedSys %tel.font.size %tel.x %tel.y %tel.cmdcode }
      else { drawtext -b %tel.window %tel.clr.bk %tel.clr.bk Terminal %tel.font.size %tel.x %tel.y . }
      unset %tel.cmd
      unset %tel.cmdcode
    }
    elseif (%tel.cmd && $len(%tel.cmdcode) == 2 && !$istok(1 24 240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255,$asc(%tel.chr),32)) {
      unset %tel.cmd
      unset %tel.cmdcode
    }
    if (%tel.esc) {
      ;echo -a -- %tel.chr
      set %tel.esccode %tel.esccode $+ %tel.chr
      if ($istokcs(m H f A B C D s u J K h l p n,%tel.chr,32)) { Tel.ESC %tel.esccode %tel.window | unset %tel.esc | unset %tel.esccode }
    }
    elseif (%tel.cmd) {
      ;echo -a 04!- %tel.chr
      set %tel.cmdcode %tel.cmdcode $+ %tel.chr
      ;echo -a 04COMMAND - $replace(%tel.cmdcode,$chr(255),IAC $+ $chr(32),$chr(251),WILL $+ $chr(32),$chr(252),WON'T $+ $chr(32),$chr(253),DO $+ $chr(32),$chr(254),DON'T $+ $chr(32),$chr(109),ASC_FLOWCONTROL_RESUME,$chr(1),ECHO,$chr(24),Terminal_TYPE)
      if (%tel.cmdcode == ÿû) {
        bset &tel.term 1 255 251 24
        sockwrite $gettok(%tel.window,1,64) &tel.term
        bset &tel.term 1 255 250 24 0 65 78 83 73 255 240
        .timer 1 2 sockwrite $gettok(%tel.window,1,64) &tel.term
      }
      if ($len(%tel.cmdcode) >= 3) { unset %tel.cmd | unset %tel.cmdcode }
    }
    elseif (%tel.chr == $chr(13)) { inc %tel.y %tel.y.size | set %tel.x %tel.x.size | var %tel.break 1 }
    elseif (%tel.chr == $chr(12)) { clear %tel.window | set %tel.y %tel.y.size }
    elseif (%tel.chr == $chr(8)) {
      drawrect -f %tel.window 1 0 %tel.x %tel.y %tel.x.size %tel.y.size
      if (%tel.x >= 6) { dec %tel.x %tel.x.size }
    }
    elseif (%tel.chr == $chr(10)) { if (%tel.break == $null) { inc %tel.y %tel.y.size | set %tel.x %tel.x.size } | unset %tel.break }
    elseif (%tel.chr == $chr(27)) {
      set %tel.esc 1
      ;echo -a ESCCODE
    }
    elseif (%tel.chr == $chr(255)) {
      set %tel.cmd 1
      set %tel.cmdcode %tel.chr
      ;echo -a 04CMDCODE
    }
    else {
      inc %tel.x %tel.x.size
      if (%tel.x > $calc(80 * %tel.x.size + %tel.x.size)) { set %tel.x %tel.x.size | inc %tel.y %tel.y.size }
      if (%tel.chr != $chr(32)) { drawtext -b %tel.window %tel.clr %tel.clr.bk Terminal %tel.font.size %tel.x %tel.y %tel.chr }
      else { drawtext -b %tel.window %tel.clr.bk %tel.clr.bk Terminal %tel.font.size %tel.x %tel.y . }
    }
    inc %c
  }
}

alias Tel.ESC {
  ;echo -a $1
  if ($right($1,1) == m) {
    var %codes = $remove($1,[,m), %c = 1, %t = $numtok($1,59)
    ;echo -a %codes - $1
    while (%c <= %t) {
      if ($gettok(%codes,%c,59) == 30) { set %tel.clr $iif(%tel.bold == 1,14,1) }
      elseif ($gettok(%codes,%c,59) == 31) { set %tel.clr $iif(%tel.bold == 1,4,5) }
      elseif ($gettok(%codes,%c,59) == 32) { set %tel.clr $iif(%tel.bold == 1,9,3) }
      elseif ($gettok(%codes,%c,59) == 33) { set %tel.clr $iif(%tel.bold == 1,8,7) }
      elseif ($gettok(%codes,%c,59) == 34) { set %tel.clr $iif(%tel.bold == 1,12,2) }
      elseif ($gettok(%codes,%c,59) == 35) { set %tel.clr $iif(%tel.bold == 1,13,6) }
      elseif ($gettok(%codes,%c,59) == 36) { set %tel.clr $iif(%tel.bold == 1,11,10) }
      elseif ($gettok(%codes,%c,59) == 37) { set %tel.clr $iif(%tel.bold == 1,0,15) }
      elseif ($gettok(%codes,%c,59) == 1) {
        if (%tel.bold.chk) {
          if (%tel.bold.bk == 1) {
            set %tel.bold.bk 0
            set %tel.clr.bk $replacex(%tel.clr.bk,4,5,9,3,8,7,12,2,13,6,11,10)
          }
          else {
            set %tel.bold.bk 1
            set %tel.clr.bk $replacex(%tel.clr.bk,5,4,3,9,7,8,2,12,6,13,10,11)          
          }
        }
        else {
          if (%tel.bold == 1) {
            set %tel.bold 0
            set %tel.clr $replacex(%tel.clr,4,5,9,3,8,7,12,2,13,6,11,10)
          }
          else {
            set %tel.bold 1
            set %tel.clr $replacex(%tel.clr,5,4,3,9,7,8,2,12,6,13,10,11)          
          }
          set %tel.bold.chk 1
        }
      }
      elseif ($gettok(%codes,%c,59) == 0) { set %tel.bold 0 | set %tel.clr 0 | set %tel.clr.bk 1 | set %tel.bold.bk 0 }
      elseif ($gettok(%codes,%c,59) == 40) { set %tel.clr.bk $iif(%tel.bold.bk == 1,14,1) }
      elseif ($gettok(%codes,%c,59) == 41) { set %tel.clr.bk $iif(%tel.bold.bk == 1,4,5) }
      elseif ($gettok(%codes,%c,59) == 42) { set %tel.clr.bk $iif(%tel.bold.bk == 1,9,3) }
      elseif ($gettok(%codes,%c,59) == 43) { set %tel.clr.bk $iif(%tel.bold.bk == 1,8,7) }
      elseif ($gettok(%codes,%c,59) == 44) { set %tel.clr.bk $iif(%tel.bold.bk == 1,12,2) }
      elseif ($gettok(%codes,%c,59) == 45) { set %tel.clr.bk $iif(%tel.bold.bk == 1,13,6) }
      elseif ($gettok(%codes,%c,59) == 46) { set %tel.clr.bk $iif(%tel.bold.bk == 1,11,10) }
      elseif ($gettok(%codes,%c,59) == 47) { set %tel.clr.bk $iif(%tel.bold.bk == 1,0,15) }
      inc %c
      ;echo -a  $+ %tel.clr $+ , $+ %tel.clr.bk Color
    }
    if (%t > 1) { set %tel.bold 0 | set %tel.bold.bk 0 }
    set %tel.bold.chk 0
  }
  elseif ($right($1,1) === H || $right($1,1) === f) {
    var %codes = $removecs($1,[)
    ;echo -a %codes
    if (%codes == H) { set %tel.y %tel.y.size | set %tel.x %tel.x.size }
    else { set %tel.y $calc($gettok($remove(%codes,H,f),1,59) * %tel.y.size) | set %tel.x $calc($gettok($remove(%codes,H,f),2,59) * %tel.x.size) }
    ;echo -a :! %tel.x %tel.y
  }
  elseif ($right($1,1) === s) { set %tel.x.save %tel.x | set %tel.y.save %tel.y }
  elseif ($right($1,1) === u) { set %tel.x %tel.x.save | set %tel.y %tel.y.save }
  elseif ($right($1,2) === 2J) { clear $2 | set %tel.x %tel.x.size | set %tel.y %tel.y.size }
  elseif ($right($1,1) === A) { dec %tel.y $calc(%tel.y.size * $iif($removecs($1,[,A),$v1,1)) }
  elseif ($right($1,1) === B) { inc %tel.y $calc(%tel.y.size * $iif($removecs($1,[,B),$v1,1)) } 
  elseif ($right($1,1) === C) { inc %tel.x $calc(%tel.x.size * $iif($removecs($1,[,C),$v1,1)) }
  elseif ($right($1,1) === D) { dec %tel.x $calc(%tel.x.size * $iif($removecs($1,[,D),$v1,1)) }
  elseif ($right($1,1) === K) {
    if ($removecs($1,[,K) == $null || $removecs($1,[,K) == 0) { var %tel.x.start = %tel.x + %tel.x.size, %tel.x.end = $window(%tel.window).bw }
    elseif ($removecs($1,[,K) == 1) { var %tel.x.start = 0, %tel.x.end = %tel.x }
    elseif ($removecs($1,[,K) == 2) { var %tel.x.start = 0, %tel.x.end = $window(%tel.window).bw }
    drawrect -f %tel.window 1 0 %tel.x.start %tel.y $calc(%tel.x.end - %tel.x.start) %tel.y.size
  }
  elseif ($right($1,2) === 6n) { sockwrite $gettok(%tel.window,1,64) $chr(27) $+ [ $+ $calc(%tel.y / %tel.y.size) $+ ; $+ $calc(%tel.x / %tel.x.size) $+ R }
  elseif ($right($1,2) === 7h) { return }
  ;else echo -s Unsupported code- $1-
}
on *:keyup:@atelnet*:*: {
  if ($keyval == 37) { sockwrite $gettok($target,1,64) $chr(27) $+ [D }
  elseif ($keyval == 38) { sockwrite $gettok($target,1,64) $chr(27) $+ [A }
  elseif ($keyval == 39) { sockwrite $gettok($target,1,64) $chr(27) $+ [C }
  elseif ($keyval == 40) { sockwrite $gettok($target,1,64) $chr(27) $+ [B }
  elseif ($keyval == 32) {
    bset &tel.space 1 32
    sockwrite $gettok($target,1,64) &tel.space
  }
  elseif ($istok(16 17 18,$keyval,32)) { return }
  else { sockwrite $gettok($target,1,64) $keychar }
}
