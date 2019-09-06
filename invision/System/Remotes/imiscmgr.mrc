; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: imiscmgr.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION:  
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
dialog InvisFxp {
  title "Invision File Server Explorer"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 300 200
  option dbu

  ;  button "OK", 900, 256 184 1 1
  button "Close Session", 905, 256 184 40 15, cancel
  button "Send", 910, 4 184 1 1, default hide

  text "Local Path:", 49, 4 12 28 10
  edit "", 48, 32 10 112 10, read
  list 50, 4 22 140 115, sort extsel
  text "Remote File Server", 59, 146 12 160 10, center
  text "Directories are in Brackets, Files are not. Double Click on Directory/File to Change Directory or Get File", 109, 4 1 290 8, center
  list 60, 156 22 140 115, extsel
  edit "", 100, 4 142 292 40, multi read vsbar autovs
  text "Send >", 101, 4 188 17 10
  edit "", 102, 22 186 110 10, autohs
  button "clr_queues", 103, 225 186 29 10
  button "queues", 104, 204 186 20 10
  button "stats", 105, 184 186 19 10
  button "sends", 106, 165 186 18 10
  button "read", 107, 149 186 15 10
  button "who", 108, 133 186 15 10

}
dialog InvisFxp2 {
  title "Invision File Server Explorer"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 450 300
  option dbu

  button "OK", 900, 406 284 1 1, ok hide
  button "Close Session", 905, 406 284 40 15, cancel
  button "Send", 910, 4 184 1 1, default hide

  text "Local Path:", 49, 4 12 28 10
  edit "", 48, 32 10 190 10, read
  list 50, 4 22 218 180, sort hsbar extsel
  text "Remote File Server", 59, 204 12 266 10, center
  text "Directories are in Brackets, Files are not. Double Click on Directory/File to Change Directory or Get File", 109, 4 1 440 8, center
  list 60, 228 22 218 180, hsbar extsel
  edit "", 100, 4 200 442 83, multi read vsbar autovs
  text "Send >", 101, 4 288 17 10
  edit "", 102, 22 286 110 10, autohs
  button "Clr_queues", 103, 236 286 30 10
  button "Queues", 104, 213 286 22 10
  button "Stats", 105, 192 286 20 10
  button "Sends", 106, 171 286 20 10
  button "Read", 107, 152 286 18 10
  button "Who", 108, 133 286 18 10
  button "Refresh", 130, 267 286 29 10
  button "Grant Temp DCC Permission", 131, 297 286 80 10
}
on *:sockread:InvisFxp: { 
  var %Fxp.temp [ $+ [ $iNetwork ] ]
  sockread %Fxp.temp [ $+ [ $iNetwork ] ]
  var %Fxp.temp [ $+ [ $iNetwork ] ] $remove(%Fxp.temp [ $+ [ $iNetwork ] ],$chr(15))
  FSxplog %Fxp.temp [ $+ [ $iNetwork ] ]
  set -n %Fxp.temp [ $+ [ $iNetwork ] ] $strip(%Fxp.temp [ $+ [ $iNetwork ] ] ,burc)
  if $dialog(InvisFXP) == $null { .timer -o 1 0 sockclose $sockname | halt }
  if (*.*] isin $gettok(%Fxp.temp [ $+ [ $iNetwork ] ] ,1-,32)) && (%Fxp.list [ $+ [ $iNetwork ] ] == 1) { return }
  ; if ([\*.*] isin $gettok(%Fxp.temp [ $+ [ $iNetwork ] ] ,1-,32)) && (%Fxp.list != 1) { set %Fxp.list [ $+ [ $iNetwork ] ] 1 | did -r InvisFxp 60 | return }
  if (File Server K isin %Fxp.temp [ $+ [ $iNetwork ] ] ) { .timerChatKill $+ $iNetwork off }
  if (Closing Idle connection in == $gettok(%Fxp.temp [ $+ [ $iNetwork ] ] ,1-4,32)) && $r.set(Invision,FServeAI) == On { sockwrite -n InvisFxp Sends | Fxp.main Invision Anti-Idle! $CRLF | return }
  if ('C' for more isin %Fxp.temp [ $+ [ $iNetwork ] ] ) { sockwrite -n InvisFxp C | return }
  ;  if ([\] isin %Fxp.temp [ $+ [ $iNetwork ] ] ) && (%Fxp.list [ $+ [ $iNetwork ] ] != 1) { set %Fxp.list [ $+ [ $iNetwork ] ] 1 | did -r InvisFxp 60 | sockwrite -n InvisFxp dir | return }
  ; ****************** UPP/TCL/GARNAXBOT CODE START *******************
  if (*•·end of list·•* iswm %Fxp.temp [ $+ [ $iNetwork ] ] || $chr(40) end of list $chr(41) iswm %Fxp.temp [ $+ [ $iNetwork ] ] || End of list. == %Fxp.temp [ $+ [ $iNetwork ] ] || End of list == %Fxp.temp [ $+ [ $iNetwork ] ]) { set %Fxp.list [ $+ [ $iNetwork ] ] 2 | .timer 1 2 set %Fxp.list [ $+ [ $iNetwork ] ] 0 }
  if ([\] isin %Fxp.temp [ $+ [ $iNetwork ] ] || [/] isin %Fxp.temp [ $+ [ $iNetwork ] ] || $chr(91) / $chr(93) isin %Fxp.temp [ $+ [ $iNetwork ] ] ) && (%Fxp.list [ $+ [ $iNetwork ] ] != 1) { set %Fxp.list [ $+ [ $iNetwork ] ] 1 | did -r InvisFxp 60 | sockwrite -n InvisFxp dir | return }
  if ([\* iswm %Fxp.temp [ $+ [ $iNetwork ] ] || [/* iswm %Fxp.temp [ $+ [ $iNetwork ] ] || (*<dir> iswm %Fxp.temp [ $+ [ $iNetwork ] ] && *change directory to <dir> !iswm %Fxp.temp [ $+ [ $iNetwork ] ]) || * $+ $chr(32) $+ B iswm %Fxp.temp [ $+ [ $iNetwork ] ] || *kB iswm %Fxp.temp [ $+ [ $iNetwork ] ]  || *MB iswm %Fxp.temp [ $+ [ $iNetwork ] ] ) && Insta*Send* !iswm %Fxp.temp [ $+ [ $iNetwork ] ] { set %Fxp.list [ $+ [ $iNetwork ] ] 1 }
  ; ****************** UPP/TCL/GARNAXBOT CODE END *******************
  if (%Fxp.list [ $+ [ $iNetwork ] ] == 1) {
    ;TCL code
    if (%Fxp.temp [ $+ [ $iNetwork ] ] == $null) { did -i InvisFxp 60 $calc($did(InvisFxp,60).lines + 1) <..> | return }
    if (($left($gettok(%Fxp.temp [ $+ [ $iNetwork ] ] ,$numtok(%Fxp.temp [ $+ [ $iNetwork ] ] ,32),32),1) isnum) && ($right($gettok(%Fxp.temp [ $+ [ $iNetwork ] ] ,$numtok(%Fxp.temp [ $+ [ $iNetwork ] ] ,32),32),1) !isnum) && (($right($gettok(%Fxp.temp [ $+ [ $iNetwork ] ] ,$numtok(%Fxp.temp [ $+ [ $iNetwork ] ] ,32),32),1) == b) || ($right($gettok(%Fxp.temp [ $+ [ $iNetwork ] ] ,$numtok(%Fxp.temp [ $+ [ $iNetwork ] ] ,32),32),1) === k)) || ($right($gettok(%Fxp.temp [ $+ [ $iNetwork ] ] ,$numtok(%Fxp.temp [ $+ [ $iNetwork ] ] ,32),32),2) == mb)  || ($right($gettok(%Fxp.temp [ $+ [ $iNetwork ] ] ,$numtok(%Fxp.temp [ $+ [ $iNetwork ] ] ,32),32),2) == kb)  || ($right($gettok(%Fxp.temp [ $+ [ $iNetwork ] ] ,$numtok(%Fxp.temp [ $+ [ $iNetwork ] ] ,32),32),2) == gb)) { did -i InvisFxp 60 $calc($did(InvisFxp,60).lines + 1) %Fxp.temp [ $+ [ $iNetwork ] ] | did -z InvisFXP 60 | return } 
    ; Garnaxbot f1.2.0 Code 
    if (*bytes] iswm %Fxp.temp [ $+ [ $iNetwork ] ] ) { did -i InvisFxp 60 $calc($did(InvisFxp,60).lines + 1) %Fxp.temp [ $+ [ $iNetwork ] ] | did -z InvisFXP 60  | return } 
    ; TCL edited code 
    if ($gettok(%Fxp.temp [ $+ [ $iNetwork ] ],1,32) isnum && ($gettok(%Fxp.temp [ $+ [ $iNetwork ] ],2,32) == MB || $gettok(%Fxp.temp [ $+ [ $iNetwork ] ],2,32) == GB || $gettok(%Fxp.temp [ $+ [ $iNetwork ] ],2,32) == KB)) { did -i InvisFxp 60 $calc($did(InvisFxp,60).lines + 1) $gettok(%Fxp.temp [ $+ [ $iNetwork ] ],3-,32) $gettok(%Fxp.temp [ $+ [ $iNetwork ] ],1-2,32) | did -z InvisFXP 60  | return }
    did -i InvisFxp 60 $calc($did(InvisFxp,60).lines + 1) $replace($remove(< $+ $replace(%Fxp.temp [ $+ [ $iNetwork ] ],$chr(44),\/) $+ >,$chr(32) $+ <dir>,<dir> $+ $chr(32)),\/,$chr(44))
    did -z InvisFXP 60 
    return
  }
  elseif (%Fxp.list [ $+ [ $iNetwork ] ] == 0) { Fxp.main > %Fxp.temp [ $+ [ $iNetwork ] ] $CRLF }
}
on *:sockopen:InvisFxP: {
  if $dialog(InvisFXP) != $null {
    dialog -t InvisFxP %Fxp.ititle [ $+ [ $iNetwork ] ]
    .timer -o 1 0 FSxplog File Server Explorer Opened for %fxp.nick [ $+ [ $iNetwork ] ] 
  }
}
on *:dialog:InvisFxp:*:*:{
  if ($devent == init) {
    .timerChatKill $+ $iNetwork -o 1 300 if $!dialog(InvisFXP) != $!null $chr(123) dialog -x InvisFxp $chr(125)
  }
  if ($devent == sclick) {
    if $did == 131 {
      if %fxp.nick [ $+ [ $iNetwork ] ] != $null { adduser TempDCC %fxp.nick [ $+ [ $iNetwork ] ] Default, | fxp.main Added %fxp.nick [ $+ [ $iNetwork ] ] to the Temp DCC List. }
    }
    if ($did == 910) { 
      if ($sock(InvisFxp) == $null) { return }
      set %Fxp.sendtext [ $+ [ $iNetwork ] ] $did(InvisFxp,102).text
      if (%Fxp.sendtext [ $+ [ $iNetwork ] ] == ls) { set %Fxp.sendtext [ $+ [ $iNetwork ] ] dir }
      if ($did(InvisFxp,102).text == dir) { set %Fxp.list [ $+ [ $iNetwork ] ] 1 | did -r InvisFxp 60 }
      Fxp.main $me $+ > %Fxp.sendtext [ $+ [ $iNetwork ] ] $CRLF
      if $sock(InvisFxp,0) >= 1 sockwrite -n InvisFxp %Fxp.sendtext [ $+ [ $iNetwork ] ]
      .timer -o 1 0 FSxplog %Fxp.sendtext [ $+ [ $iNetwork ] ]
      did -r InvisFxp 102
      return
    }
    if ($did == 905) { 
      ; sockwrite -n InvisFxp bye
      .timer 1 2 if $!sock(InvisFxp,0) >= 1 sockclose InvisFxp
      .timer 1 2 if $!dialog(InvisFxp) != $!null dialog -x InvisFxp
      .timer -o 1 0 FSxplog Closed Session to %Fxp.nick [ $+ [ $iNetwork ] ]
    }
    if ($did == 103) { if ($?!="Clear all the queues you have on this File Server?" == $true) { if $sock(InvisFxp,0) >= 1 sockwrite -n InvisFxp clr_queues | .timer -o 1 0 FSxplog clr_queues } | idccremove $gettok($dialog($dname).title,3,32) | dialog -v invisfxp }
    if ($did == 104) { if $sock(InvisFxp,0) >= 1 sockwrite -n InvisFxp queues | .timer -o 1 0 FSxplog queues }
    if ($did == 105) { if $sock(InvisFxp,0) >= 1 sockwrite -n InvisFxp stats | .timer -o 1 0 FSxplog stats }
    if ($did == 106) { if $sock(InvisFxp,0) >= 1 sockwrite -n InvisFxp sends | .timer -o 1 0 FSxplog sends }
    if ($did == 107) { 
      if $did(InvisFxp,60,$did(InvisFxp,60).sel).text == $null { Fxp.main No file selected to read! $+ $crlf } 
      else { 
        if $sock(InvisFxp,0) >= 1 { 
          sockwrite -n InvisFxp read $Fxp.Ftrim($did(InvisFxp,60,$did(InvisFxp,60).sel).text) 
          .timer -o 1 0 FSxplog read $Fxp.Ftrim($did(InvisFxp,60,$did(InvisFxp,60).sel).text) 
        } 
      } 
    }
    if ($did == 108) { if $sock(InvisFxp,0) >= 1 sockwrite -n InvisFxp who | .timer -o 1 0 FSxplog who }
    if ($did == 130) { did -r InvisFxp 60 | set %Fxp.list [ $+ [ $iNetwork ] ] 1 | if $sock(InvisFxp,0) >= 1 sockwrite -n InvisFxp dir | .timer -o 1 0 FSxplog dir }
    click
  }
  if ($devent == dclick) {
    if ($did == 50) {
      if (< isin $gettok($did(InvisFxp,50,$did(InvisFxp,50).sel).text,1,32)) && (:\ isin $gettok($did(InvisFxp,50,$did(InvisFxp,50).sel).text,1,32)) { Fxp.llist $remove($gettok($did(InvisFxp,50,$did(InvisFxp,50).sel).text,1,32),$chr(60),$chr(62)) | return }
      if ($did(InvisFxp,50,$did(InvisFxp,50).sel).text == ..) && ($gettok(%Fxp.local [ $+ [ $iNetwork ] ] ,2,92) != $null) { set %Fxp.temp [ $+ [ $iNetwork ] ] 1- $+ $calc($len(%Fxp.local [ $+ [ $iNetwork ] ] ) - $len($remove(%Fxp.local [ $+ [ $iNetwork ] ] ,\)) - 1) | Fxp.llist $gettok(%Fxp.local [ $+ [ $iNetwork ] ] ,%Fxp.temp [ $+ [ $iNetwork ] ] ,92) $+ \ | return }
      if (< isin $gettok($did(InvisFxp,50,$did(InvisFxp,50).sel).text,1,32)) { Fxp.llist %Fxp.local [ $+ [ $iNetwork ] ] $+ $remove($did(InvisFxp,50,$did(InvisFxp,50).sel).text,$chr(60),$chr(62)) $+ \ | return }
      if (($right($did(InvisFxp,50,$did(InvisFxp,50).sel).text,1) == b) || ($right($did(InvisFxp,50,$did(InvisFxp,50).sel).text,1) == k)) && ($chr(32) isin $did(InvisFxp,50,$did(InvisFxp,50).sel).text) && ($sock(InvisFxp) != $null) { set %Fxp.temp2 [ $+ [ $iNetwork ] ] 1- $+ $calc($len($did(InvisFxp,50,$did(InvisFxp,50).sel).text) - $len($remove($did(InvisFxp,50,$did(InvisFxp,50).sel).text,$chr(32)))) | Fxp.main $me $+ : SEND $gettok($did(InvisFxp,50,$did(InvisFxp,50).sel).text,%Fxp.temp2 [ $+ [ $iNetwork ] ] ,32) $CRLF | idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) %Fxp.nick [ $+ [ $iNetwork ] ] " $+ %Fxp.local [ $+ [ $iNetwork ] ] $+ $gettok($did(InvisFxp,50,$did(InvisFxp,50).sel).text,%Fxp.temp2 [ $+ [ $iNetwork ] ] ,32) $+ " | return }
    }
    if $sock(InvisFxp,0) >= 1 {
      if ($did == 60) {
        if ($mouse.key & 4) && ($right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1) == b) && ($chr(32) isin $did(InvisFxp,60,$did(InvisFxp,60).sel).text) { Fxp.main INFO (remote): $did(InvisFxp,60,$did(InvisFxp,60).sel).text $CRLF | return }
        if (\ isin $gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,32)) && ($did(InvisFxp,60).sel == 1) { return }
        if ($did(InvisFxp,60,$did(InvisFxp,60).sel).text == ..) { 
          sockwrite -n InvisFxp cd .. 
          did -r InvisFxp 60 
          set %Fxp.list [ $+ [ $iNetwork ] ] 1 
          sockwrite -n InvisFxp dir 
          .timer -o 1 0 FSxplog cd..
          .timer -o 1 0 FSxplog dir
          return 
        }
        ;       if ($chr(60) !isin $did(InvisFxp,60,$did(InvisFxp,60).sel).text) { 
        ; ************* UPP/TCL/GARNAXBOT CODE START ******************
        if ($chr(60) !isin $did(InvisFxp,60,$did(InvisFxp,60).sel).text && ($right($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,32),2) != F: || $left($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1) !isnum)) { 
          ; ************* UPP/TCL/GARNAXBOT CODE END*****************
          var %linetxt = $did(InvisFxp,60,$did(InvisFxp,60).sel).text 
          ; Edited for Garnaxbot
          if ($gettok(%linetxt,$numtok(%linetxt,32),32) == kb) || ($gettok(%linetxt,$numtok(%linetxt,32),32) == mb) || ($gettok(%linetxt,$numtok(%linetxt,32),32) == gb || $gettok(%linetxt,$numtok(%linetxt,32),32) == bytes]) { 
            var %linetxt = $deltok(%lineTxt,$numtok(%linetxt,32),32) 
            var %linetxt = $deltok(%lineTxt,$numtok(%linetxt,32),32) 
          } 
          else { var %linetxt = $deltok(%lineTxt,$numtok(%linetxt,32),32) } 
          Fxp.main $me $+ : GET %linetxt $CRLF 
          if $r.set(DCCmgr,DCCallow) == On {
            if %DCCallow [ $+ [ $iNetwork ] ] [ $+ [ $gettok($dialog($dname).title,3,32) ] ] == $null { idccallow $gettok($dialog($dname).title,3,32) }
          }
          sockwrite -n InvisFxp GET %linetxt 
          .timer -o 1 0 FSxplog GET %linetxt
          return 
        }
        ; ******** UPP/TCL CODE START **********
        if ($chr(60) !isin $did(InvisFxp,60,$did(InvisFxp,60).sel).text && $right($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,32),2) == F: && $left($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1) isnum) {
          var %linetxt = $gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,58)
          Fxp.main $me $+ : %linetxt $CRLF 
          if $r.set(DCCmgr,DCCallow) == On {
            if %DCCallow [ $+ [ $iNetwork ] ] [ $+ [ $gettok($dialog($dname).title,3,32) ] ] == $null { idccallow $gettok($dialog($dname).title,3,32) }
          }
          sockwrite -n InvisFxp %linetxt 
          .timer -o 1 0 FSxplog %linetxt
          return 
        }
        ; Newer UPP/Obsidian2 code
        if ($chr(60) isin $did(InvisFxp,60,$did(InvisFxp,60).sel).text && < isin $gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,32) && < isin $gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,32) && $left($remove($did(InvisFxp,60,$did(InvisFxp,60).sel).text,<,>),1) isnum) {
          var %linetxt = $remove($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,32),<,>)
          Fxp.main $me $+ : %linetxt $CRLF 
          if $r.set(DCCmgr,DCCallow) == On {
            if %DCCallow [ $+ [ $iNetwork ] ] [ $+ [ $gettok($dialog($dname).title,3,32) ] ] == $null { idccallow $gettok($dialog($dname).title,3,32) }
          }
          sockwrite -n InvisFxp %linetxt 
          .timer -o 1 0 FSxplog %linetxt
          did -r InvisFxp 60 
          set %Fxp.list [ $+ [ $iNetwork ] ] 1 
          ;sockwrite -n InvisFxp dir 
          return 
        }
        ; End Newer UPP/Obsidian2 Code
        if ($chr(60) isin $did(InvisFxp,60,$did(InvisFxp,60).sel).text && ($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,2,32) == kb || $gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,2,32) == mb || $gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,2,32) == gb || $gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,2,32) == b)) { 
          var %linetxt = $did(InvisFxp,60,$did(InvisFxp,60).sel).text
          var %linetxt = $gettok(%lineTxt,1,62)
          var %linetxt = $deltok(%lineTxt,1,32) 
          var %linetxt = $deltok(%lineTxt,1,32) 
          Fxp.main $me $+ : GET %linetxt $CRLF 
          if $r.set(DCCmgr,DCCallow) == On {
            if %DCCallow [ $+ [ $iNetwork ] ] [ $+ [ $gettok($dialog($dname).title,3,32) ] ] == $null { idccallow $gettok($dialog($dname).title,3,32) }
          }
          sockwrite -n InvisFxp GET %linetxt 
          .timer -o 1 0 FSxplog GET %linetxt
          return 
        }
        ; ******** UPP/TCL CODE END **********
        ;        if $sock(InvisFxp,0) >= 1 { sockwrite -n InvisFxp cd $left($right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,-1),-1) | .timer -o 1 0 FSxplog cd $left($right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,-1),-1) }
        ; ******** UPP/TCL CODE START**********
        ; TCL section
        if ($sock(InvisFxp,0) >= 1 && <> isin $did(InvisFxp,60,$did(InvisFxp,60).sel).text) { sockwrite -n InvisFxp cd .. | .timer -o 1 0 FSxplog cd .. }
        ; UPP section
        if ($sock(InvisFxp,0) >= 1 && $right($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,32),2) == D: && $right($left($did(InvisFxp,60,$did(InvisFxp,60).sel).text,2),1) isnum) { sockwrite -n InvisFxp $gettok($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,58),1,60) | .timer -o 1 0 FSxplog $gettok($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,58),1,60) | set -u50 %i.upp 1 }
        elseif ($sock(InvisFxp,0) >= 1 && $right($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,32),2) == F: && $right($left($did(InvisFxp,60,$did(InvisFxp,60).sel).text,2),1) isnum) { sockwrite -n InvisFxp $gettok($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,58),1,60) | .timer -o 1 0 FSxplog $gettok($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,58),1,60) | set -u50 %i.upp 1 }
        ; TCL section
        elseif ($sock(InvisFxp,0) >= 1 && $right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,6) == <dir>>) { sockwrite -n InvisFxp cd $left($right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,-1),-6) | .timer -o 1 0 FSxplog cd $left($right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,-1),-6) }
        elseif ($sock(InvisFxp,0) >= 1 && $right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,6) != <dir>> && $left($did(InvisFxp,60,$did(InvisFxp,60).sel).text,6) != <<dir> && ($right($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,32),2) != D: && $right($gettok($did(InvisFxp,60,$did(InvisFxp,60).sel).text,1,32),2) != F:)) { sockwrite -n InvisFxp cd $left($right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,-1),-1) | .timer -o 1 0 FSxplog cd $left($right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,-1),-1) }
        ;        if ($sock(InvisFxp,0) >= 1 && $left($did(InvisFxp,60,$did(InvisFxp,60).sel).text,6) == <<dir>) { sockwrite -n InvisFxp cd $left($right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,-6),-1) | .timer -o 1 0 FSxplog cd $left($right($did(InvisFxp,60,$did(InvisFxp,60).sel).text,-6),-1) }
        ; ******** UPP/TCL CODE END **********
        did -r InvisFxp 60
        set %Fxp.list [ $+ [ $iNetwork ] ] 1
        ; UPP edited (the if and the unset are for UPP... the parts inside the if are original)
        if (%i.upp != 1) {
          sockwrite -n InvisFxp dir
          .timer -o 1 0 FSxplog dir
        }
        else unset %i.upp
      }
    }
  }
  :leave
}
on *:sockclose:InvisFxp: { dialog -x InvisFxp | .timer -o 1 0 FSxplog %fxp.nick [ $+ [ $iNetwork ] ] closed connection. | return }

dialog Acromancer {
  title "Invision Acromancer"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 300 250
  option dbu

  button "OK", 680, 85 237 40 12, Ok
  button "Cancel", 681, 130 237 40 12, Cancel
  button "Apply", 682, 175 237 40 12

  box "", 100, 4 8 292 226

  check "Enable Acromancer", 99, 115 1 70 8
  text "Input", 103, 10 13 80 8, center
  list 101, 10 20 80 160
  ; box "Selected responds in the form of:", 120, 93 174 90 20
  ; radio "Text", 121, 100 183 30 8
  ; radio "Action", 122, 140 183 30 8
  text "Translated Output", 104, 93 13 197 8, center
  list 102, 93 20 197 160

  Button "Add New", 105, 10 173 80 10
  button "Delete Selected", 106, 10 184 80 10
  edit "", 131, 10 197 80 10
  edit "", 132, 93 197 197 10, autohs

}
on *:dialog:Acromancer:*:*:{
  if ($devent == init) {
    if $r.glob(Invision,Acroman) == On { did -c $dname 99 }
    if $exists($shortfn($mircdirinvision\acroman.ini)) {
      var %count = $r.acro(General,Count)
      var %ct = 1
      while (%ct <= %count) {
        did -a $dname 101 $r.acro(Inputs,N [ $+ [ %ct ] ] )
        did -a $dname 102 $r.acro(Outputs,N [ $+ [ %ct ] ] )
        inc %ct 1
        continue
      }
    }
  }
  if ($devent == sclick) {
    if $did == 101 { did -c $dname 102 $did($dname,101).sel | did -ra $dname 131 $r.acro(Inputs,N [ $+ [ $did($dname,101).sel ] ] ) | did -ra $dname 132 $r.acro(Outputs,N [ $+ [ $did($dname,101).sel ] ] ) }
    if $did == 102 { did -c $dname 101 $did($dname,102).sel | did -ra $dname 131 $r.acro(Inputs,N [ $+ [ $did($dname,101).sel ] ] ) | did -ra $dname 132 $r.acro(Outputs,N [ $+ [ $did($dname,101).sel ] ] ) }
    ;   if $did == 121 { if $did($dname,101).sel >= 1 { w.acro Types N [ $+ [ $did($dname,101).sel ] ] T } }
    ;   if $did == 122 { if $did($dname,101).sel >= 1 { w.acro Types N [ $+ [ $did($dname,101).sel ] ] A } }
    if $did == 106 {
      if $did($dname,101).sel >= 1 {
        var %count = $r.acro(General,Count)
        var %newcount = $calc(%count - 1)
        var %ct = $did($dname,101).sel
        while (%ct <= %newcount) {
          w.acro Inputs N [ $+ [ %ct ] ] $r.acro(Inputs,N [ $+ [ $calc(%ct + 1) ] ] )
          w.acro Outputs N [ $+ [ %ct ] ] $r.acro(Outputs,N [ $+ [ $calc(%ct + 1) ] ] )
          ;    w.acro Type N [ $+ [ %ct ] ] $r.acro(Type,N [ $+ [ $calc(%ct + 1) ] ] )
          inc %ct 1 | continue
        }
        w.acro General Count %newcount
        d.acro Inputs N [ $+ [ %count ] ] 
        d.acro Outputs N [ $+ [ %count ] ] 
        ;   d.acro Type N [ $+ [ %count ] ] 
        did -d $dname 102 $did($dname,101).sel
        did -d $dname 101 $did($dname,101).sel
        did -r $dname 131,132
      }
    }
    if $did == 105 {
      var %tmpIn = $gettok($$?="Input text to convert? ie: LOL" , 1 ,32)
      var %tmpOut = $$?="Output to Generate from [ %tmpIn ] ?"
      dopen acromancer acromancer
      if %tmpIn != $null && %tmpOut != $null {
        did -a $dname 101 %tmpIn
        did -a $dname 102 %tmpOut
        ;    w.acro Types N [ $+ [ %count ] ] T
        var %count = $r.acro(General,Count)
        inc %count 1
        w.acro General Count %count
        ;   w.acro Types N [ $+ [ %count ] ] T
        w.acro Inputs N [ $+ [ %count ] ] %tmpIn
        w.acro Outputs N [ $+ [ %count ] ] %tmpOut
        did -c $dname 101 %count
        did -c $dname 102 %count
      }
    }
    if $did != 680 && $did != 682 { click }
    if $did == 680 || $did == 682 {
      setsaved
      var %tmpSel = $did($dname,101).sel 
      if $did($dname,99).state == 1 { w.glob invision Acroman On } | else { w.glob invision Acroman Off }
      if $did($dname,101).sel >= 1 { w.acro Inputs N [ $+ [ $did($dname,101).sel ] ] $did($dname,131).text | w.acro Outputs N [ $+ [ $did($dname,101).sel ] ] $did($dname,132).text }
      if $did($dname,101).sel >= 1 { if ($did == 682) { did -o $dname 101 %tmpSel $did($dname,131).text | did -o $dname 102 %tmpSel $did($dname,132).text } }
      did -r $dname 131,132
      did -u $dname 101,102
      .timer -o 1 0 acrotable
    }
  }
}
dialog scanner {
  size -1 -1 340 315
  title "Invision Port Scanner"
  icon Invision\Themes\gfx\default\i2tray1.ico
  check "&5 Resolve Hostnames",24,120 107 130 20,left
  check "&6 Common Ports Only",25,120 125 130 20,left
  button "&SCAN",1,260 1 70 25,default
  button "&HALT",2,260 29 70 25,ok
  button "SA&VE",3,260 58 70 25,ok
  button "&RESET",4,260 87 70 25,ok
  button "&PORTS...",55,260 116 70 25,ok
  button "",26,1 1 1 1,cancel
  text "Scan: ",5,10 5 30 25,left
  edit "localhost",6,40 1 210 25,left
  text "Send Port:",71,12 33 52 23,right
  edit "0",70,70 30 55 23,left
  text "Stop Port:",81,12 60 52 23,right
  edit "0",7,195 30 55 23,left
  text "Recv Port:",8,142 33 52 23,right
  edit "50",9,195 57 55 23,left
  edit "65535",90,70 57 55 23,left
  text "Delay (MS):",10,140 62 55 23,left
  edit "0",11,195 85 55 23,left
  text "Open Sockets:",12,123 91 72 18,left
  check "1 Quick Scan",13,8 81 105 23,left
  check "&2 Reset on halt",14,8 99 105 23,left
  check "&3 Save on halt",15,8 118 105 23,left
  check "&4 Close IRC Ports",27,8 137 105 23,left
  list 16,10 165 325 145,vsbar
  button "&Clear Results",18,230 145 103 20,left
  button "Filename:",20,7 291 50 20,left
  edit "",21,57 288 210 25,autohs
  check "&Overwrite",22,268 294 65 15,right
}
dialog ERR {
  title "Error"
  size -1 -1 150 85
  text "The Log File Does Not Exist",2,6 20 140 50
  button "OK",1,45 50 55 25,ok
}
dialog Alertbad {
  title "W A R N I N G!"
  size -1 -1 120 105
  option dbu 
  text "This alert has been activated for your own protection. It appears as though this system might be a remote controlled client since there hasn't been any recorded user input locally. If you are aware that Invision iRC Client is running on your system then click the OK button. If this is not something you want then please close this window, terminate the mIRC process using Task Manager, and scan your system for viruses and trojans immediately and install a firewall. The location this application is running from should be shown below.",2,2 2 116 90, center
  text %mircdir , 5, 20 82 80 8, center
  button "Ok", 3, 50 94 20 10, ok
}
on 1:dialog:alertbad:sclick:3: { w.mirc Wizard Advise 0 | w.glob invision someid $someid | d.glob Invision Halted | saveallglobals | dialog -x alertbad }
on 1:dialog:scanner:init:0: {
  did -m scanner 7,11
  did -o scanner 21 1 $shortfn($mircdir) $+ system\portscan\portscan.txt
  did -f scanner 6
  did -i scanner 16 1 0 $STR($CHR(160),2) $+ :PortScan Ready
  did -c scanner 24
  did -b scanner 2
  .enable #scan.verbose
}
on 1:dialog:scanner:sclick:1: {
  click
  unset %i
  unset %port
  unset %stop.port
  did -b scanner 1
  did -e scanner 2
  sockclose scan_*
  did -o scanner 11 1 0
  if ($did(70).text > 65535) { did -o scanner 70 1 65535 }
  if ($did(70).text !isnum) { did -o scanner 70 1 1 }
  if ($did(90).text !isnum) { did -o scanner 90 1 65535 }
  if ($did(25).state == 1) { did -om scanner 90 1 Not Used }
  if ($did(90).text < $did(70).text) did -o scanner 90 1 $did(70).text
  if ($longip($did(6).text) == $null) {
    .enable #dnscatcher
    .dns -h $did(6).text
  }
  did -i scanner 16 $calc($did(16).lines + 1) 0 $str($chr(160),2) $+ :SCANNING HOST: $+ $did(6).text
  did -i scanner 16 $calc($did(16).lines + 1) 0 $str($chr(160),2) $+ :SCANNING ON: $asctime(dddd m/dd/yyyy h:nntt)
  did -i scanner 16 $calc($did(16).lines + 1) 0 $str($chr(160),2) $+ :SCAN STARTED ON PORT: $+ $did(70).text
  if ($did(24).state == 0) did -i scanner 16 $calc($did(scanner,16).lines + 1) 0 $str($chr(160),2) $+ :IP: $+ $did(6).text
  if ($did(70) == 0) did -o scanner 70 1 1
  if ($did(scanner,25).state == 0) { set %port $did(scanner,70).text }
  if ($did(scanner,25).state == 1) { set %port $gettok($read($shortfn($mircdir) $+ system\portscan\common-ports.txt,1),1,32) }
  set %i 1
  if (($left($did(6).text,1) isnum) && ($numtok($did(6).text,46) == 4)) scanner.scan
}
on 1:dialog:scanner:sclick:2: {
  click
  did -b scanner 2
  did -e scanner 1
  did -f scanner 1
  did -i scanner 16 $calc($did(16).lines + 1) 0 $str($chr(160),2) $+ :SCAN HALTED ON PORT: $+ $did(scanner,70).text
  if ($did(14).state == 1) { scanner.reset }
  if ($did(15).state == 1) { scanner.write }
}

on 1:dialog:scanner:sclick:3: {
  click
  scanner.write
}

on 1:dialog:scanner:sclick:4: {
  click
  scanner.reset
  halt
}

on 1:dialog:scanner:edit:6: {
  if ($left($did(6).text,1) isletter) did -c scanner 24
  if ($left($did(6).text,1) isnum) did -u scanner 24
}
on 1:dialog:scanner:sclick:13: {
  click
  if ($did(scanner,13).state == 1) .disable #scan.verbose
  if ($did(scanner,13).state == 0) .enable #scan.verbose
}
on 1:dialog:scanner:sclick:18: did -r scanner 16
on 1:dialog:scanner:sclick:20: { 
  click
  did -f scanner 1
  if ($exists($did(21).text) == $false) { dialog -mo wups ERR | halt }
  run $did(21).text
}
on 1:dialog:scanner:sclick:25: {
  click
  if ($did(25).state == 1) {
    did -om scanner 70 1 $gettok( [ $read -l1 $shortfn($mircdir) $+ system\portscan\common-ports.txt ] ,1,32)
    did -om scanner 90 1 Not Used
  }
  if ($did(25).state == 0) {
    did -on scanner 70 1 1
    did -on scanner 90 1 65535
  }
}
on 1:dialog:scanner:sclick:26: { click | did -e scanner 2 | sockclose scan_* }
on 1:dialog:scanner:sclick:55: click | run $shortfn($mircdir) $+ system\portscan\common-ports.txt | halt
#dnscatcher off
on 1:dns:{
  if $dialog(scanner) != $null {
    if ($iaddress == $null) {
      did -o scanner 6 1 Invalid Address
      did -i scanner 16 $calc($did(scanner,16).lines + 1) 0 $str($chr(160),2) $+ :IP:Invalid IP - SCAN HALTED
      did -b scanner 2
      did -e scanner 1
      halt 
    }
    if ($iaddress != $null) {
      did -o scanner 6 1 $iaddress
      did -i scanner 16 $calc($did(scanner,16).lines + 1) 0 $str($chr(160),2) $+ :IP: $+ $iaddress
      .disable #dnscatcher
      scanner.scan
      halt
    }
  }
}
#dnscatcher end
;  -------------
;  Socket Events
;  -------------
on 1:sockopen:scan_*: {
  if ($sock($sockname).status == active) {
    if ($read -w $+ $gettok($sockname,2,95) $+ * $shortfn($mircdir) $+ system\portscan\common-ports.txt == $null) {
      did -i scanner 16 $calc($did(scanner,16).lines + 1) $gettok($sockname,2,95) $str($chr(160),2) $+ :CONNECT
    }
    if ($read -w $+ $gettok($sockname,2,95) $+ * $shortfn($mircdir) $+ system\portscan\common-ports.txt != $null) {
      set %portDescript $gettok( [ $read -w $gettok($sockname,2,95) $+ * $shortfn($mircdir) $+ system\portscan\common-ports.txt ] ,2-,32)
      if $len(%portDescript) > 40 {
        set %psStartChr 1
        set %psStopChr 35
        while ($len(%portDescript) >= 40) {
          if $mid(%portDescript,%psStopChr,1) == $chr(32) { 
            set %psStartChr %psStopChr
            did -a scanner 16 $gettok($sockname,2,95) $str($chr(160),2) $+ :CONNECT $str($chr(160),2) $+ $left(%portdescript,%psStartChr) 
            set %portDescript $right(%portDescript,$calc(0 - %psStartChr))
            set %psStopChr 50
            break
          } 
          else { dec %psStopChr 1 | Continue }
        }

        while ($len(%portDescript) >= 50) {
          if $mid(%portDescript,%psStopChr,1) == $chr(32) { 
            set %psStartChr %psStopChr
            did -a scanner 16 $str($chr(160),13) $+ $left(%portdescript,%psStartChr) 
            set %portDescript $right(%portDescript,$calc(0 - %psStartChr))
            set %psStopChr 50
            continue
          } 
          else { dec %psStopChr 1 | Continue }
        }
        did -a scanner 16 $str($chr(160),13) $+ %portDescript $+ . 
      }
      else {
        did -a scanner 16 $gettok($sockname,2,95) $str($chr(160),2) $+ :CONNECT $str($chr(160),2) $+ %portDescript
      }
    }
    did -o scanner 7 1 $gettok($sockname,2,95)
    if ($did(scanner,13).state == 1) { 
      sockclose $sockname
      did -o scanner 11 1 $calc($did(scanner,11).text - 1)
    }
  }
  if ($sock($sockname).status == Connecting) {
    did -o scanner 11 1 $calc($did(scanner,11).text - 1)
  }
  if ($did(scanner,14).state == 1) && ($gettok($sockname,2,95) == $did(scanner,90)) {
    scanner.reset
  }
}

on 1:sockclose:scan_*: {
  did -i scanner 16 $calc($did(scanner,16).lines + 1) $gettok($sockname,2,95) $str($chr(160),2) $+ :CLOSED
  did -o scanner 11 1 $calc($did(scanner,11).text - 1)
}

#scan.verbose on
on 1:sockread:scan_*: {
  if ($sockerr > 0) return
  :nextread
  sockread %temp
  if ($sockbr == 0) return
  if (%temp == $null) %temp = -
  if ($did(scanner,27).state == 1) {
    if (AUTH isincs %temp) {
      sockclose $sockname
      did -o scanner 11 1 $calc($did(scanner,11).text - 1)
      return
    }
  }
  set %portread %temp
  if $len(%portread) > 50 {
    set %psStartChr 1
    set %psStopChr 50
    while ($len(%portread) >= 50) {
      if $mid(%portread,%psStopChr,1) == $chr(32) { 
        set %psStartChr %psStopChr
        did -a scanner 16 $gettok($sockname,2,95) $str($chr(160),2) $+ : $str($chr(160),2) $+ $left(%portread,%psStartChr) 
        set %portread $right(%portread,$calc(0 - %psStartChr))
        set %psStopChr 60
        break
      } 
      else { dec %psStopChr 1 | Continue }
    }

    while ($len(%portread) >= 60) {
      if $mid(%portread,%psStopChr,1) == $chr(32) { 
        set %psStartChr %psStopChr
        did -a scanner 16 $str($chr(160),6) $+ $left(%portread,%psStartChr) 
        set %portread $right(%portread,$calc(0 - %psStartChr))
        set %psStopChr 60
        continue
      } 
      else { dec %psStopChr 1 | Continue }
    }
    did -a scanner 16 $str($chr(160),6) $+ %portread $+ . 
  }
  else {
    did -i scanner 16 $calc($did(scanner,16).lines + 1) $gettok($sockname,2,95) $str($chr(160),2) $+ : $+ %portread
  }
  goto nextread
}
#scan.verbose end
; ###############################################################
; ##                                                 THEME MANAGER
; ###############################################################
dialog thememgr {
  title "Theme Manager"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 300 220
  option dbu

  button "OK", 500, 130 207 40 12, Cancel

  box "Current Scheme:", 1, 1 1 298 34
  edit "",100, 5 10 90 10, center
  text "Author:", 101, 5 22 18 8
  edit "", 102, 25 22 70 10, center
  text "Filename:", 103, 102 10 24 8
  edit "", 104, 127 8 170 10 
  ; button "...", 105, 287 8 10 10

  button "Load Scheme", 106, 127 20 50 9
  button "Save Scheme As..", 107, 178 20 50 9
  button "Unload Scheme", 108, 229 20 50 9

  text "* WARNING: Changing or unloading schemes will cause Invision to automatically shutdown and restart!", 109, 5 196 285 8, center
  box "Settings", 201, 1 37 298 168
  list 202, 5 45 120 147, autovs
  text "File:", 203, 130 44 15 8
  edit "", 204, 130 52 153 10
  button "...", 250, 285 52 12 10
  box "Channels Font", 205, 130 65 160 20
  edit "", 206, 135 73 90 10, center read
  text "Size:", 305, 235 74 20 9, right
  edit "", 306, 257 73 25 10, center read
  box "Status Font", 207, 130 85 160 20
  edit "", 208, 135 93 90 10, center read
  text "Size:", 307, 235 94 20 9, right
  edit "", 308, 257 93 25 10, center read
  box "Query Font", 209, 130 105 160 20
  edit "", 210, 135 113 90 10, center read 
  text "Size:", 309, 235 114 20 9, right
  edit "", 310, 257 113 25 10, center read
  box "DCC Send Font", 211, 130 125 160 20
  edit "", 212, 135 133 90 10, center read
  text "Size:", 311, 235 134 20 9, right
  edit "", 312, 257 133 25 10, center read
  box "DCC Get Font", 213, 130 145 160 20
  edit "", 214, 135 153 90 10, center read
  text "Size:", 313, 235 154 20 9, right
  edit "", 314, 257 153 25 10, center read
  box "Notify Font", 215, 130 165 160 20
  edit "", 216, 135 173 90 10, center read
  text "Size:", 315, 235 174 20 9, right
  edit "", 316, 257 173 25 10, center read
}

on *:dialog:thememgr:*:*:{
  if ( $devent == init ) {
    var %items = Switchbar Background Pause Off,Switchbar Background Pause On,Button Bar Background Sound On,Button Bar Background Sound Off,mIRC Window Background,Status Window Background,Pager Window Background,Button Bar Icons,Tray Icon *Offline*,Tray Icon *Online*
    var %ct = 1
    while (%ct <= $numtok(%items,44)) {
      did -a $dname 202 $gettok(%items,%ct,44)
      inc %ct 1 | continue
    }
    var %sitems = Startup,Connect,Disconnect,Kicked,Opped,Deopped,Voiced,Devoiced,Flood,Gained Ops,Ban Set,Ban Lifted,Msg/Query,Invited,Addon Loaded,Addon Unloaded,DCC Incoming,DCC Outgoing,DCC Receive Failed,DCC Send Failed,DCC File Type Ignored,Fserve Chat Request,Fserve Search,Queue Full,File Server Start,File Server Stop,Netsplit,Pager,Topic Change,Server Change,IP Search,Channel Locked,Channel Unlocked,URL Caught,Join,Nick Alert,mp3 Server Start,mp3 Server Stop,IP Scanning,Away,Back,Dialog Click,Dialog Changes Applied,Dialog Opening,Inactive Message Window,DCC Chat request
    var %ct = 1
    while (%ct <= $numtok(%sitems,44)) {
      did -a $dname 202 $gettok(%sitems,%ct,44) Sound
      inc %ct 1 | continue
    }
    if $r.glob(Invision,Theme) != $null {
      did -ra $dname 104 $r.glob(Invision,Theme)
      did -ra $dname 100 $readini($r.glob(Invision,Theme),n,Info,Name)
      did -ra $dname 102 $readini($r.glob(Invision,Theme),n,Info,Author)

    }
    did -ra $dname 206 $gettok($readini(mirc.ini,n,Fonts,fchannel),1,44)
    did -ra $dname 306 $int($calc($right($gettok($readini(mirc.ini,n,Fonts,fchannel),2,44),-1)  * .77))
    did -ra $dname 208 $gettok($readini(mirc.ini,n,Fonts,fstatus),1,44)
    did -ra $dname 308 $int($calc($right($gettok($readini(mirc.ini,n,Fonts,fstatus),2,44),-1)  * .77))
    did -ra $dname 210 $gettok($readini(mirc.ini,n,Fonts,fquery),1,44)
    did -ra $dname 310 $int($calc($right($gettok($readini(mirc.ini,n,Fonts,fquery),2,44),-1)  * .77))
    did -ra $dname 212 $gettok($readini(mirc.ini,n,Fonts,fdccs),1,44)
    did -ra $dname 312 $int($calc($right($gettok($readini(mirc.ini,n,Fonts,fdccs),2,44),-1)  * .77))
    did -ra $dname 214 $gettok($readini(mirc.ini,n,Fonts,fdccg),1,44)
    did -ra $dname 314 $int($calc($right($gettok($readini(mirc.ini,n,Fonts,fdccg),2,44),-1)  * .77))
    did -ra $dname 216 $gettok($readini(mirc.ini,n,Fonts,fnotify),1,44)
    did -ra $dname 316 $int($calc($right($gettok($readini(mirc.ini,n,Fonts,fnotify),2,44),-1) * .77))

  }
  if ( $devent == sclick ) {
    click
    if $did == 106 {
      var %themefile = $remove($shortfn($sfile($mircdirinvision\themes\*.i2t,Scheme File to load?)),$shortfn($mircdir))
      if $exists( [ %themefile ] ) {
        did -ra $dname 104 %themefile
        w.glob Invision Theme %themefile
        LoadTheme %themefile
      }
    }
    if $did == 107 {
      if $r.mirc(Invision,Shutdown) == 1 { var %dummy = $input(You cannot save a theme at this time. You must shutdown Invision and restart it before a theme can be saved. This is usually caused if you have loaded a new theme but haven't shut down and restarted Invision manually since that load.,516,Cannot Save Theme) | Halt }
      :start
      var %themefile = $remove($shortfn($sfile($mircdirinvision\themes\*.i2t,Save Scheme File As?)),$shortfn($mircdir))
      if $exists( [ %themefile ] ) == $true {
        if $input(Overwrite existing file?,136,Warning) != $true { goto start }
        write -c %themefile
      }
      SaveTheme %themefile
    }
    if $did == 108 {
      RemoveTheme
      did -r $dname 100,104,102,206,306,208,308,210,310,212,312,214,314,216,316
    }
    if $did == 202 {
      var %sel = $did($dname,202).sel
      if %sel <= 10 {
        if %sel == 1 { if $r.glob(Themes,Switchbar1) != $null { did -ra $dname 204 $r.glob(Themes,Switchbar1) } | else { did -ra $dname 204 None } }
        if %sel == 2 { if $r.glob(Themes,Switchbar2) != $null { did -ra $dname 204 $r.glob(Themes,Switchbar2) } | else { did -ra $dname 204 None } }
        if %sel == 3 { if $r.glob(Themes,ToolBarBG1) != $null { did -ra $dname 204 $r.glob(Themes,ToolBarBG1) } | else { did -ra $dname 204 None } }
        if %sel == 4 { if $r.glob(Themes,ToolBarBG2) != $null { did -ra $dname 204 $r.glob(Themes,ToolBarBG2) } | else { did -ra $dname 204 None } }
        if %sel == 5 { if $readini(mirc.ini,n,background,@mdi) != $null { did -ra $dname 204 $readini(mirc.ini,n,background,@mdi) } | else { did -ra $dname 204 None } }
        if %sel == 6 { if $readini(mirc.ini,n,background,Status) != $null { did -ra $dname 204 $readini(mirc.ini,n,background,Status) } | else { did -ra $dname 204 None } }
        if %sel == 7 { if $readini(mirc.ini,n,background,@Invision_Pager) != $null { did -ra $dname 204 $readini(mirc.ini,n,background,@Invision_Pager) } | else { did -ra $dname 204 None } }
        if %sel == 8 { if $readini(mirc.ini,n,background,toolbuttons) != $null { did -ra $dname 204 $readini(mirc.ini,n,background,toolbuttons) } | else { did -ra $dname 204 None } }
        if %sel == 9 { if $r.glob(Themes,TrayIcon1) != $null { did -ra $dname 204 $r.glob(Themes,TrayIcon1) } | else { did -ra $dname 204 None } }
        if %sel == 10 { if $r.glob(Themes,TrayIcon2) != $null { did -ra $dname 204 $r.glob(Themes,TrayIcon2) } | else { did -ra $dname 204 None } }
      }
      else {
        if $r.glob(Themes,Sound [ $+ [ $calc(%sel - 10) ] ] ) != $null { did -ra $dname 204 $r.glob(Themes,Sound [ $+ [ $calc(%sel - 10) ] ] ) } | else { did -ra $dname 204 None } 
      }
    }
    ; *******************************  ON FILE SELECT CLICK  *********************************
    if $did = 250 {
      if $did($dname,202).sel >= 1 {
        var %sel = $did($dname,202).sel
        var %seltext = $did($dname,202).seltext
        if %sel <= 10 {
          var %fn = $remove($shortfn($sfile($mircdirinvision\themes\gfx\*.*,Choose %seltext)),$shortfn($mircdir))
        }
        else {
          var %fn = $remove($shortfn($sfile($mircdirinvision\themes\sounds\*.*,Choose %seltext)),$shortfn($mircdir))
        }
        if %fn == $null || !$exists( [ %fn ] ) { var %fn = None }
        if %sel <= 10 {
          if %sel == 1 { w.glob Themes SwitchBar1 %fn | if $r.glob(Fserve,Pause) != On { background -h $+ $iif(%fn == None,x,$chr(32) %fn) } }
          if %sel == 2 { w.glob Themes SwitchBar2 %fn | if $r.glob(Fserve,Pause) == On { background -h $+ $iif(%fn == None,x,$chr(32) %fn) } }
          if %sel == 3 { w.glob Themes ToolBarBG1 %fn | if %SoundKill [ $+ [ $iNetwork ] ] != 1 { background -l $+ $iif(%fn == None,x,$chr(32) %fn) } }
          if %sel == 4 { w.glob Themes ToolBarBG2 %fn | if %SoundKill [ $+ [ $iNetwork ] ] == 1 { background -l $+ $iif(%fn == None,x,$chr(32) %fn) } }
          if %sel == 5 { background -mn $+ $iif(%fn == None,x,$chr(32) %fn) }
          if %sel == 6 { background -sc $+ $iif(%fn == None,x,$chr(32) %fn) }
          if %sel == 7 { background -c $+ $iif(%fn == None,x) @Invision_Pager $iif(%fn != None,%fn) }
          if %sel == 8 { background -u $+ $iif(%fn == None,x,$chr(32) %fn) }
          if %sel == 9 { w.glob Themes TrayIcon1 %fn | if $server == $null { tray -i $+ $iif(%fn == None,x,0 %fn) } }
          if %sel == 10 { w.glob Themes TrayIcon2 %fn | if $server != $null { tray -i $+ $iif(%fn == None,x,0 %fn) } }
        }
        else {
          w.glob Themes Sound [ $+ [ $calc(%sel - 10) ] ] %fn
        }     
      }
      did -ra $dname 204 $gettok(%fn,1,44)
    }
  }
  if $devent == dclick {
    if $did == 202 {
      var %sel = $did($dname,202).sel
      if %sel >= 11 {
        if $r.glob(Themes,Sound [ $+ [ $calc(%sel - 10) ] ] ) != $null { if $exists( [ $shortfn($mircdir) $+ [ $r.glob(Themes,Sound [ $+ [ $calc(%sel - 10) ] ] ) ] ] ) { splay [ $shortfn($mircdir) $+ [ $r.glob(Themes,Sound [ $+ [ $calc(%sel - 10) ] ] ) ] ] } } 
      }
    }
  }
}
alias -l SaveTheme {
  if $1 != $null {
    var %fn = $1-
    var %mi = mirc.ini
    var %name = $input(What is the name for this theme?,129,Theme Name?)
    var %author = $input(What is Authors Name?,129,Authors Name?)

    var %ct = 1
    while (%ct <= $ini(%mi,fonts,0)) {
      var %item = $ini(%mi,fonts,%ct)
      writeini -n %fn fonts %item $readini(%mi,fonts,%item)
      inc %ct 1 | continue
    }
    var %ct = 1
    while (%ct <= $ini(%mi,colours,0)) {
      var %item = $ini(%mi,colours,%ct)
      writeini -n %fn colours %item $readini(%mi,colours,%item)
      inc %ct 1 | continue
    }
    var %ct = 1
    while (%ct <= 60) {
      ;  var %item = $ini(%mi,colours,%ct)
      if $r.glob(Themes,Sound [ $+ [ %ct ] ] ) != $null { writeini -n %fn Sounds Sound [ $+ [ %ct ] ] $r.glob(Themes,Sound [ $+ [ %ct ] ] ) }
      else { writeini -n %fn Sounds Sound [ $+ [ %ct ] ] none }
      inc %ct 1 | continue
    }
    writeini -n %fn files TrayIcon $iif($readini(%mi,n,files,TrayIcon) != $null,$readini(%mi,n,files,TrayIcon),none)
    writeini -n %fn background @mdi $iif($readini(%mi,n,background,@mdi) != $null,$gettok($readini(%mi,n,background,@mdi),1,44),none)
    writeini -n %fn background Status $iif($readini(%mi,n,background,status) != $null,$gettok($readini(%mi,n,background,status),1,44),none)
    writeini -n %fn background toolbar $iif($readini(%mi,n,background,toolbar) != $null,$readini(%mi,n,background,toolbar),none)
    writeini -n %fn background switchbar $iif($readini(%mi,n,background,switchbar) != $null,$readini(%mi,n,background,switchbar),none)
    writeini -n %fn background @Invision_Pager $iif($readini(%mi,n,background,@Invision_Pager) != $null,$gettok($readini(%mi,n,background,@Invision_Pager),1,44),none)
    writeini -n %fn background toolbuttons $iif($readini(%mi,n,background,toolbuttons) != $null,$readini(%mi,n,background,toolbuttons),none)
    writeini -n %fn Nick.Colors Color.1 $iif($r.glob(Nick.Colors,Color.1) != $null,$r.glob(Nick.Colors,Color.1),14)
    writeini -n %fn Nick.Colors Color.2 $iif($r.glob(Nick.Colors,Color.2) != $null,$r.glob(Nick.Colors,Color.2),14)
    writeini -n %fn Nick.Colors Color.3 $iif($r.glob(Nick.Colors,Color.3) != $null,$r.glob(Nick.Colors,Color.3),14)
    writeini -n %fn Nick.Colors Color.4 $iif($r.glob(Nick.Colors,Color.4) != $null,$r.glob(Nick.Colors,Color.4),14)
    writeini -n %fn Nick.Colors Color.13 $iif($r.glob(Nick.Colors,Color.13) != $null,$r.glob(Nick.Colors,Color.13),14)
    writeini -n %fn Nick.Colors Color.14 $iif($r.glob(Nick.Colors,Color.14) != $null,$r.glob(Nick.Colors,Color.14),14)
    writeini -n %fn Nick.Colors Color.15 $iif($r.glob(Nick.Colors,Color.15) != $null,$r.glob(Nick.Colors,Color.15),14)
    if $exists( [ $r.glob(Themes,Switchbar1) ] ) { writeini -n %fn background Switchbar1 $r.glob(Themes,Switchbar1) } | else { writeini -n %fn background Switchbar1 $iif($readini(%fn,n,background,switchbar) != $null,$readini(%fn,n,background,switchbar),none) }
    if $exists( [ $r.glob(Themes,Switchbar2) ] ) { writeini -n %fn background Switchbar2 $r.glob(Themes,Switchbar2) } | else { writeini -n %fn background Switchbar2 $iif($readini(%fn,n,background,switchbar) != $null,$readini(%fn,n,background,switchbar),none) }
    if $exists( [ $r.glob(Themes,ToolBarBG1) ] ) { writeini -n %fn background ToolBarBG1 $r.glob(Themes,ToolBarBG1) } | else { writeini -n %fn background ToolBarBG1 $iif($readini(%fn,n,background,toolbar) != $null,$readini(%fn,n,background,toolbar),none) }
    if $exists( [ $r.glob(Themes,ToolBarBG2) ] ) { writeini -n %fn background ToolBarBG2 $r.glob(Themes,ToolBarBG2) } | else { writeini -n %fn background ToolBarBG2 $iif($readini(%fn,n,background,toolbar) != $null,$readini(%fn,n,background,toolbar),none) }
    if $exists( [ $r.glob(Themes,TrayIcon1) ] ) { writeini -n %fn files TrayIcon1 $r.glob(Themes,TrayIcon1) } | else { writeini -n %fn files TrayIcon1 $iif($readini(%mi,n,files,TrayIcon) != $null,$readini(%mi,n,files,TrayIcon),none) }
    if $exists( [ $r.glob(Themes,TrayIcon2) ] ) { writeini -n %fn files TrayIcon2 $r.glob(Themes,TrayIcon2) } | else { writeini -n %fn files TrayIcon2 $iif($readini(%mi,n,files,TrayIcon) != $null,$readini(%mi,n,files,TrayIcon),none) }
    writeini -n %fn info Name $iif(%name != $null,%name,Generic)
    writeini -n %fn info Author $iif(%author != $null,%author,Unknown)
    w.glob Invision Theme %fn
    did -ra thememgr 104 %fn
    did -ra thememgr 102 $readini(%fn,n,info,Author)
    did -ra thememgr 100 $readini(%fn,n,info,Name)
  }
}
alias -l LoadTheme {
  var %fn = $1-
  var %mi = mirc.ini
  var %ct = 1
  while (%ct <= $ini(%fn,fonts,0)) {
    var %item = $ini(%fn,fonts,%ct)
    writeini -n %mi fonts %item $readini(%fn,n,fonts,%item)
    inc %ct 1 | continue
  }
  var %ct = 1
  while (%ct <= $ini(%fn,colours,0)) {
    var %item = $ini(%fn,colours,%ct)
    writeini -n %mi colours %item $readini(%fn,n,colours,%item)
    inc %ct 1 | continue
  }
  var %ct = 1
  while (%ct <= 60) {
    if $readini(%fn,Sounds,Sound [ $+ [ %ct ] ] ) != $null { w.glob Themes Sound [ $+ [ %ct ] ] $readini(%fn,Sounds,Sound [ $+ [ %ct ] ] ) }
    inc %ct 1 | continue
  }
  if $exists( [ $gettok($readini(%fn,n,files,TrayIcon),1,44) ] ) { tray -i0 $readini(%fn,n,files,TrayIcon) } | else { tray -ix }
  if $exists( [ $shortfn($gettok($readini(%fn,n,background,@mdi),1,44)) ] ) { background -mn $shortfn($gettok($readini(%fn,n,background,@mdi),1,44)) } | else { background -mx }
  if $exists( [ $gettok($readini(%fn,n,background,status),1,44) ] ) { background -sc $gettok($readini(%fn,n,background,status),1,44) } | else { background -sx }
  if $exists( [ $readini(%fn,n,background,toolbar) ] ) { background -l $readini(%fn,n,background,toolbar) } | else { background -lx }
  if $exists( [ $readini(%fn,n,background,switchbar) ] ) { background -h $readini(%fn,n,background,switchbar) } | else { background -hx }
  if $exists( [ $gettok($readini(%fn,n,background,@Invision_Pager),1,44) ] ) { background -c @Invision_Pager $gettok($readini(%fn,n,background,@Invision_Pager),1,44) } | else { background -x @Invision_Pager }
  if $exists( [ $readini(%fn,n,background,toolbuttons) ] ) { background -u $readini(%fn,n,background,toolbuttons) } | else { background -ux }
  w.glob Nick.Colors Color.1 $readini(%fn,n,Nick.Colors,Color.1) 
  w.glob Nick.Colors Color.2 $readini(%fn,n,Nick.Colors,Color.2) 
  w.glob Nick.Colors Color.3 $readini(%fn,n,Nick.Colors,Color.3) 
  w.glob Nick.Colors Color.4 $readini(%fn,n,Nick.Colors,Color.4) 
  w.glob Nick.Colors Color.13 $readini(%fn,n,Nick.Colors,Color.13) 
  w.glob Nick.Colors Color.14 $readini(%fn,n,Nick.Colors,Color.14) 
  w.glob Nick.Colors Color.15 $readini(%fn,n,Nick.Colors,Color.15) 

  if $exists( [ $readini(%fn,n,background,switchbar1) ] ) { w.glob Themes Switchbar1 $readini(%fn,n,background,Switchbar1) | background -h $readini(%fn,n,background,Switchbar1) } | else { w.glob Themes Switchbar1 $iif($readini(%mi,n,background,Switchbar) != $null,$readini(%mi,n,background,Switchbar),none) } 
  if $exists( [ $readini(%fn,n,background,switchbar2) ] ) { w.glob Themes Switchbar2 $readini(%fn,n,background,Switchbar2) } | else { w.glob Themes Switchbar2 $iif($readini(%mi,n,background,Switchbar) != $null,$readini(%mi,n,background,Switchbar),none) }
  if $exists( [ $readini(%fn,n,background,ToolBarBG1) ] ) { w.glob Themes ToolBarBG1 $readini(%fn,n,background,ToolBarBG1) | background -l $readini(%fn,n,background,ToolBarBG1) } | else { w.glob Themes ToolBarBG1 $iif($readini(%mi,n,background,Toolbar) != $null,$readini(%mi,n,background,Toolbar),none) }
  if $exists( [ $readini(%fn,n,background,ToolBarBG2) ] ) { w.glob Themes ToolBarBG2 $readini(%fn,n,background,ToolBarBG2) } | else { w.glob Themes ToolBarBG2 $iif($readini(%mi,n,background,Toolbar) != $null,$readini(%mi,n,background,Toolbar),none) }
  if $exists( [ $readini(%fn,n,files,TrayIcon1) ] ) { w.glob Themes TrayIcon1 $readini(%fn,n,files,TrayIcon1) | tray -i0 $readini(%fn,n,files,TrayIcon1) } | else { w.glob Themes TrayIcon1 none | tray -ix }
  if $exists( [ $readini(%fn,n,files,TrayIcon2) ] ) { w.glob Themes TrayIcon2 $readini(%fn,n,files,TrayIcon2) | tray -i0 $readini(%fn,n,files,TrayIcon2) } | else { w.glob Themes TrayIcon2 none | tray -ix }

  did -ra thememgr 100 $iif($readini(%fn,n,info,Name) != $null,$readini(%fn,n,info,Name),Generic)
  did -ra thememgr 102 $iif($readini(%fn,n,info,Name) != $null,$readini(%fn,n,info,Name),Unknown)
  SaveAllGlobals
  w.mirc Invision Rebooting 1
  .timer -o 1 2 run $mircexe
  .timer -o 0 1 reboot
}
alias -l RemoveTheme {
  var %mi = mirc.ini
  remini %mi fonts
  remini %mi colours
  d.glob Invision Theme
  w.glob Themes SwitchBar1 none
  w.glob Themes SwitchBar2 none
  w.glob Themes ToolBarBG1 none
  w.glob Themes ToolBarBG2 none
  w.glob Themes TrayIcon1 none
  w.glob Themes TrayIcon2 none
  w.glob Nick.Colors Colors Off
  var %ct = 1
  while (%ct <= 60) {
    w.glob Themes Sound [ $+ [ %ct ] ] none
    inc %ct 1 | continue
  }
  w.mirc Invision mp3btn Off
  SaveAllGlobals
  background -mx
  background -sx
  background -lx
  background -hx
  background -ux
  background -x @Invision_Pager
  tray -ix      
  w.mirc Invision Rebooting 1
  .timer -o 1 2 run $mircexe
  .timer -o 0 1 reboot

}
; #############################################################################
; ##                                                    USER LISTS TABLE
; #############################################################################
dialog UserLists {
  title "Invision User Lists Manager"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 240 170
  option dbu

  button "OK", 680, 58 157 40 12, Ok
  button "Cancel", 681, 100 157 40 12, Cancel
  button "Apply", 682, 142 157 40 12

  box "", 100, 4 1 231 154 

  text "", 85, 35 7 58 8, right
  button "Rem. Sel >>", 60, 53 16 40 8 
  button "Add New >>", 70, 53 25 40 8
  button "Deliver Msg >>", 75, 53 34 40 8
  button "Del. Deliveries", 77, 53 43 40 8
  button "Search  >>", 80, 53 52 40 8

  radio "Elite", 51, 10 7 40 8, group
  radio "Fellow Op", 52, 10 17 40 8
  radio "Bot", 53, 10 27 40 8
  radio "Friend", 54, 10 37 40 8
  radio "DCC Banned", 55, 10 57 40 8
  radio "Shitlisted", 56, 10 47 40 8
  radio "Temp DCC Permited", 57, 10 67 60 8


  radio "Elite", 101, 180 7 50 8, push group
  radio "Fellow Ops", 102, 180 16 50 8, push
  radio "Bots", 103, 180 25 50 8, push
  radio "Friends", 104, 180 34 50 8, push
  radio "DCC Banned", 105, 180 43 50 8, push
  radio "Shitlist", 106, 180 52 50 8, push
  radio "Temp DCC", 160, 180 61 50 8, push 
  radio "All Users", 107, 180 71 50 8, push

  box "", 109, 4 1 92 80
  list 110, 100 5 75 75
  box "", 108, 4 80 231 1
  text "Nick:", 127, 10 87 13 8
  edit "", 58, 25 85 60 10, read center
  text "Created:", 128, 90 87 22 8
  edit "", 129, 112 85 118 10, read center 
  text "Mask:", 121, 10 97 20 8
  combo 122, 25 95 205 85, edit drop

  text "Channels", 123, 20 106 50 8, center
  combo 124, 10 113 70 42
  button "-", 125, 10 106 8 7 
  button "+", 126, 72 106 8 7

  check "Auto Voice", 131, 84 110 50 8
  check "Auto Devoice", 132, 84 120 50 8
  check "Auto Op", 133, 84 130 50 8
  check "Auto Deop", 134, 84 140 50 8

  check "DCC Permited", 141, 145 110 50 8
  check "Remote Op", 142, 145 120 55 8
  check "Remote ChanCtrl", 143, 145 130 55 8
  box "Telnet Port", 153, 145 110 85 40, hide
  edit "", 154, 148 118 79 10, hide
  box "Password:", 151, 145 130 85 20, hide
  edit "", 152, 148 138 79 10, hide
  check "Remote Fserve Ctrl", 144, 145 140 55 8
}
; #############################################################################
; ##                                                    USER LISTS DIALOG
; #############################################################################
on *:dialog:UserLists:*:*:{
  if ( $devent == init ) {
    ULshow 0
    did -c $dname 107
  }
  if ( $devent == sclick ) {
    if $did == 110 {
      ULShowUser
    }
    if $did == 60 {
      if $did($dname,110).sel != 0 && $did($dname,110).sel != $null {
        .ruser %ULacct
        ULshow $ULcurlevel
      }
    }
    if $did == 70 {
      var %nick = $input(Nick for new account?,5)
      if (%nick == $null) { dialog -v UserLists | echo -a No nick entered. | return }
      var %host = $input(Enter ident and host in form of ident@subdomain.domain.com,5)
      if (%host == $null) { dialog -v UserLists | echo -a No host entered. | return }
      .auser $iif($ULCurLEvel != *,$ULCurLevel,15) $mask( [ %nick $+ ! $+ [ %host ] ] ,%SecurityLev) [ %nick $+ ! $+ [ %host ] ] $ctime Default,+v 
      ULshow $ULcurlevel
      dialog -v UserLists
    }
    if $did == 75 {
      if $did($dname,110).sel != 0 && $did($dname,110).sel != $null {
        DeliverMsg %ULhost
        dopen UserLists UserLists
        ULshow $ULcurlevel
      }
    }
    if $did == 77 {
      if $did($dname,110).sel != 0 && $did($dname,110).sel != $null {
        DeleteMsg %ULhost
        dopen UserLists UserLists
        ULshow $ULcurlevel
      }
    }
    if $did == 124 {
      ULchanset $did($dname,124).seltext
    }
    if $did == 125 {
      if $did(UserLists,124).seltext != Default {
        if $input(Remove the channel [ $did(UserLists,124).seltext ] from [ %ULView ] $+ 's profile?,520) == $true {
          ULremoveChan %ULacct $did($dname,124).seltext
        }
      }
      dialog -v UserLists
    }
    if $did == 126 {
      var %chan = $input(Add what channel?,5)
      ULAddchan %ULacct %chan
      dialog -v UserLists
    }
    if $did == 80 {
      var %srch = $input(Find what nick?,517,Find Who?)
      dopen UserLists UserLists
      var %ct = 1
      while (%ct <= $did($dname,110).lines) {
        if %srch isin $did($dname,110,%ct).text {
          did -c $dname 110 %ct 
          ULShowUser
          break
        }
        inc %ct 1 | continue
      }
    }
    if $did == 101 { ULshow 30 }
    if $did == 102 { ULshow 20 }
    if $did == 103 { ULshow 17 }
    if $did == 104 { ULshow 15 }
    if $did == 160 { ULshow 13 }
    if $did == 105 { ULshow 7 }
    if $did == 106 { ULshow 5 }
    if $did == 107 { ULshow 0 }

    if $did == 131 { if $did($dname,131).state == 1 { did -u $dname 132 } } 
    if $did == 132 { if $did($dname,132).state == 1 { did -u $dname 131 } } 
    if $did == 133 { if $did($dname,133).state == 1 { did -u $dname 134 } } 
    if $did == 134 { if $did($dname,134).state == 1 { did -u $dname 133 } } 
    if $did != 680 && $did != 682 { click }

    if $did == 680 || $did == 682 {
      setsaved
      if $did($dname,110).seltext != $null {
        var %hostinfo = $gettok($ulist(%ULacct,$level(%ULacct),1).info,1,32)
        var %ctimeinfo = $gettok($ulist(%ULacct,$level(%ULacct),1).info,2,32)
        var %echanset = $gettok($ulist(%ULacct,$level(%ULacct),1).info,3-,32)
        var %nchanset = $ULbldchanset(%echanset) 
        .ruser %ULacct
        var %msk = $did($dname,122,0).text
        if ((! !isin %msk || $left(%msk,1) == !) && (@ !isin %msk || $right(%msk,1) == @)) {
          var %fix.msk = %msk
          if (! isin %fix.msk) { var %fix.msk = $did($dname,110).seltext $+ %fix.msk }
          if (@ isin %fix.msk) { var %fix.msk = %fix.msk $+ * }
          if (! !isin %fix.msk && @ !isin %fix.msk) { var %fix.msk = $did($dname,110).seltext $+ !*@ $+ %fix.msk }
          elseif (! !isin %fix.msk) { var %fix.msk = $did($dname,110).seltext $+ ! $+ %fix.msk }
          elseif (@ !isin %fix.msk) { var %fix.msk = %fix.msk $+ @* }
          .auser $ULgetlevel %fix.msk %hostinfo %ctimeinfo %nchanset
          error User List mask for $did($dname,110).seltext is invalid.  If not corrected, it may cause errors.
        }
        elseif (! !isin %msk || $left(%msk,1) == !) {
          .auser $ULgetlevel $did($dname,110).seltext $+ $iif(! !isin %msk,!) $+ %msk %hostinfo %ctimeinfo %nchanset
          error User List mask for $did($dname,110).seltext is invalid.  If not corrected, it may cause errors.
        }
        elseif (@ !isin %msk || $right(%msk,1) == @) {
          .auser $ULgetlevel %msk $+ $iif(@ !isin %msk,@) $+ * %hostinfo %ctimeinfo %nchanset
          error User List mask for $did($dname,110).seltext is invalid.  If not corrected, it may cause errors.
        }
        else { .auser $ULgetlevel %msk %hostinfo %ctimeinfo %nchanset }
        if $did == 682 { 
          var %holdnick = $did($dname,110).seltext
          var %dummy = $ULshow($ULcurlevel) 
          did -c UserLists 110 $did(UserLists,110).lines
          ULShowUser
        }
      }
    }
  }
}
alias ULshow {
  if $1 != $null {
    var %lev = $1
    if $1 == 0 { var %lev = * }
    ULcleardata
    did -r UserLists 110
    var %ct1 = 1
    while (%ct1 <= $ulist(*,%lev,0)) {
      var %nick = $gettok($gettok($ulist(*,%lev,%ct1).info,1,32),1,33)
      var %host = $gettok($ulist(*,%lev,%ct1).info,1,32)
      did -a UserLists 110 %nick $iif($CheckPending(%host) == $true, ***)
      inc %ct1 1
      continue
    }
    did -ra UserLists 85 Users Listed: $did(Userlists,110).lines
  }
}
alias ULcurlevel {
  if $did($dname,101).state == 1 { return 30 }
  if $did($dname,102).state == 1 { return 20 }
  if $did($dname,103).state == 1 { return 17 }
  if $did($dname,104).state == 1 { return 15 }
  if $did($dname,105).state == 1 { return 7 }
  if $did($dname,106).state == 1 { return 5 }
  if $did($dname,160).state == 1 { return 13 }
  return *
}
alias ULfillhostbox {
  if $1 != $null {
    var %ct = 1
    while (%ct <= 9) {
      if %ct != 4 { did -a UserLists 122 $mask($1,%ct) }
      inc %ct 1
      continue
    }
  }
}
alias ULgetlevel {
  if $did(UserLists,51).state == 1 { Return 30 }
  if $did(UserLists,52).state == 1 { Return 20 }
  if $did(UserLists,53).state == 1 { Return 17 }
  if $did(UserLists,54).state == 1 { Return 15 }
  if $did(UserLists,55).state == 1 { Return 7 }
  if $did(UserLists,56).state == 1 { Return 5 }
  if $did(UserLists,57).state == 1 { Return 13 }
  return 10
}
alias ULsetlevel {
  if $1 != $null {
    var %lev = $level($1)
    did -u UserLists 51,52,53,54,55,56,57
    if %lev == 30 { did -c UserLists 51 }
    if %lev == 20 { did -c UserLists 52 }
    if %lev == 17 { did -c UserLists 53 }
    if %lev == 15 { did -c UserLists 54 }
    if %lev == 7 { did -c UserLists 55 }
    if %lev == 5 { did -c UserLists 56 }
    if %lev == 13 { did -c UserLists 57 }
    if %lev == 17 {
      did -h UserLists 143,144,142,141
      did -v UserLists 151,152,153,154
    }
    else {
      did -v UserLists 143,144,142,141
      did -h UserLists 151,152,153,154
    }
  }
}
alias ULFillChanBox {
  if $1 != $null {
    var %chans = $gettok($ulist(*,$ULcurlevel,%ULnum).info,3-,32)
    var %ct = 1
    while (%ct <= $numtok(%chans,32)) {
      did -a UserLists 124 $gettok($gettok(%chans,%ct,32),1,44)
      inc %ct 1
      continue
    }
  }
}
alias ULchanset {
  if $1 != $null {
    var %chans = $gettok($ulist(*,$ULcurlevel,%ULnum).info,3-,32)
    var %chanset = $gettok($gettok(%chans,$did(UserLists,124).sel,32),2,44)
    did -u UserLists 131,132,133,134,141,142,143,144
    did -r UserLists 152,154

    if (+v isin %chanset) { did -c UserLists 131 }
    if (-v isin %chanset) { did -c UserLists 132 }
    if (+o isin %chanset) { did -c UserLists 133 }
    if (-o isin %chanset) { did -c UserLists 134 }

    if (+dp isin %chanset) { did -c UserLists 141 }
    if (+ro isin %chanset) { did -c UserLists 142 }
    if (+rc isin %chanset) { did -c UserLists 143 }
    if (+rf isin %chanset) { did -c UserLists 144 }
    if (+pw isin %chans) { 
      var %v1 = $gettok(%chans,1,32)
      ;var %v2 = $gettok(%v1,$numtok(%v1,43),43)
      var %v2 = $gettok($wildtok(%v1,pw*,1,43),1,32)
      did -ra UserLists 152 $right(%v2,-2) 
    }
    if (+tp isin %chans) { 
      var %v1 = $gettok(%chans,1,32)
      var %v2 = $gettok(%v1,$numtok(%v1,43),43)
      did -ra UserLists 154 $right(%v2,-2) 
    }
  }
}
alias ULbldchanset {
  if $1 != $null {
    var %updchan = $ULbldcset
    if $did(UserLists,124).seltext $+ $chr(44) isin $1- {
      var %str = $gettok(%updchan,1,44) $+ $chr(44) $+ *
      var %rep = $wildtok($1-,%str,1,32)
      return $replace($1-,%rep,%updchan)  
    }
    else {
      return $1- %updchan
    }
  }
}
alias ULbldcset {
  var %curchan = $did(UserLists,124).seltext $+ $chr(44) 
  if $did(UserLists,131).state == 1 { var %curchan = %curchan $+ +v }
  if $did(UserLists,132).state == 1 { var %curchan = %curchan $+ -v }
  if $did(UserLists,133).state == 1 { var %curchan = %curchan $+ +o }
  if $did(UserLists,134).state == 1 { var %curchan = %curchan $+ -o }
  if $did(UserLists,141).state == 1 { var %curchan = %curchan $+ +dp }
  if $did(UserLists,142).state == 1 { var %curchan = %curchan $+ +ro }
  if $did(UserLists,143).state == 1 { var %curchan = %curchan $+ +rc }
  if $did(UserLists,144).state == 1 { var %curchan = %curchan $+ +rf }
  if $did(UserLists,152).text != $null { var %curchan = %curchan $+ +pw $+ $did(UserLists,152).text }
  if $isnum($did(UserLists,154).text) { var %curchan = %curchan $+ +tp $+ $did(UserLists,154).text }
  return %curchan
}
alias ULgetacct { 
  if $2 != $null {
    var %lev = $1
    var %nick = $2
    var %ct = 1
    while (%ct <= $ulist(*,%lev,0)) {
      if %nick == $gettok($gettok($ulist(*,%lev,%ct).info,1,32),1,33) { return %ct }
      inc %ct 1
      continue
    }
    return 0
  }
}
alias ULcleardata {
  did -u UserLists 51,52,53,54,55,56,57,131,132,133,134,141,142,143,144
  did -r $dname 58,129,122,124,152,154
  did -v UserLists 143,144,142,141
  did -h UserLists 151,152,153,154

}
alias ULremovechan {
  if $2 != $null {
    var %info = $ulist($1).info
    var %lev = $level($1)
    var %chanstr = $wildtok($ulist($1).info,$2 [ $+ [ * ] ] ,1,32)
    var %ninfo = $remtok(%info,%chanstr,32)
    .ruser $1
    .auser %lev $1 %ninfo
    ; did -d UserLists 124 $did(UserLists,124).sel
    ULprofileUpd
  } 
}
alias ULaddchan {
  if $2 != $null {
    var %info = $ulist($1).info
    var %lev = $level($1)
    var %nchan = $replace($wildtok($ulist($1).info,Default*,1,32),Default,$2)
    var %wild = $iif($wildtok(%nchan,pw*,1,43) != $null,$chr(43) $+ $wildtok(%nchan,pw*,1,43))
    var %nchan2 = $iif(%wild != $null,$remove(%nchan,%wild),%nchan)
    var %ninfo = %info %nchan2
    .ruser $1
    .auser %lev $1 %ninfo
    ; did -d UserLists 124 $did(UserLists,124).sel
    ULprofileUpd
  } 
}
alias ULprofileUpd {
  did -ra UserLists 58 %ULview
  if $isnum(%ULcreated) == $true { did -ra UserLists 129 $asctime(%ULcreated, dddd m/d/yyyy h:nntt) }
  did -r UserLists 122,124
  did -i UserLists 122 0 %ULacct 
  ULsetlevel %ULacct
  ULfillhostbox %ULhost
  ULfillChanbox %ULacct
  did -c UserLists 124 1
  ULchanset $did(UserLists,124).seltext
}
alias -l ULshowuser {
  set %ULnum $did(UserLists,110).sel
  set %ULview $gettok($did(UserLists,110).seltext,1,32)
  ; set %ULacct $ulist(*,$ULcurlevel,$ULgetacct($ULcurlevel,%ULview))
  set %ULacct $ulist(*,$ULcurlevel,%ULnum)
  ; set %ULhost $gettok($ulist(%ULacct,$ULcurlevel,1).info,1,32)
  set %ULhost $gettok($ulist(*,$ULcurlevel,%ULnum).info,1,32)
  ; set %ULcreated $gettok($ulist(%ULacct,$ULcurlevel,1).info,2,32)
  set %ULcreated $gettok($ulist(*,$ULcurlevel,%ULnum).info,2,32)
  did -ra UserLists 58 %ULview
  if $isnum(%ULcreated) == $true { did -ra UserLists 129 $asctime(%ULcreated, dddd m/d/yyyy h:nntt) }
  did -r UserLists 122,124
  did -i UserLists 122 0 %ULacct 
  ULsetlevel %ULacct
  ULfillhostbox %ULhost
  ULfillChanbox %ULacct
  did -c UserLists 124 1
  ULchanset $did(UserLists,124).seltext
}
alias ShowinUL {
  if $1 != $null && $dialog(UserLists) != $null {
    var %srch = $1
    var %ct = 1
    while (%ct <= $did(UserLists,110).lines) {
      if %srch isin $did(UserLists,110,%ct).text {
        did -c UserLists 110 %ct 
        ULShowUser
        break
      }
      inc %ct 1 | continue
    }
  }
}
Dialog Announcer {
  title "Announcer Settings"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 260 94
  option dbu 

  text "Message:", 5, 2 2 23 8
  edit "", 6, 2 10 255 18, multi
  box "Advertising Channels:", 10, 2 29 110 63
  combo 11, 8 37 80 50
  check "All Channels", 12, 8 82 40 10
  button "Add", 13, 90 37 15 12
  button "Rem", 14, 90 52 15 12
  check "Auto Start", 20, 60 82 35 10
  text "Ad Delay (min):", 30, 117 83 37 10
  edit "", 31, 154 81 15 10, center
  button "OK", 200, 228 81 30 12, ok
  button "Cancel", 201, 195 81 30 12, cancel
  box " Message Prefix ", 300, 116 29 140 44
  radio "Notice", 301, 120 42 25 9
  radio "Warning", 302, 165 42 30 9
  radio "Attention", 303, 210 42 30 9
  radio "Other", 304, 120 52 25 9
  edit "", 305, 150 51 100 10, autohs
}
on *:dialog:Announcer:*:*:{
  if ($devent == init) {
    dialog -t $dname Announcer Settings for $iif($iSetwork != $null,$iSetwork,Global)
    did -ra $dname 6 $r.set(Announcer,Msg)
    did -ra $dname 31 $vnum($r.set(Announcer,Ad.Delay),5)
    if (($r.set(Announcer,Channels) == All) || ($r.set(Announcer,Channels) == $null)) { did -c $dname 12 | did -b $dname 11,13,14 } | else { dla $dname 11 $r.set(Announcer,Channels) }
    if ($r.set(Announcer,Auto.Start) == On) { did -c $dname 20 }
    if $r.set(Announcer,Prefix) == $null || $r.set(Announcer,Prefix) == Notice { did -c $dname 301 }
    elseif $r.set(Announcer,Prefix) == Warning { did -c $dname 302 }
    elseif $r.set(Announcer,Prefix) == Attention { did -c $dname 303 }
    else { did -c $dname 304 }
    did -a $dname 305 $r.set(Announcer,Other)
  }
  if ($devent == sclick) {
    if ($did == 12) { if ($did($dname,$did).state == 1) { did -b $dname 11,13,14 } | else { did -e $dname 11,13,14 } }
    if ($did == 13) && ($did($dname,11).sel == $null || $did($dname,11).sel == 0) && ($did($dname,11).text != $null) { did -a $dname 11 $vc($did($dname,11).text) | did -c $dname 11 $did($dname,11).lines }
    if ($did == 14) && ($did($dname,11).sel isnum) { did -d $dname 11 $did($dname,11).sel }
    if $did != 200 { click }  
    if ($did == 200) {
      setsaved Announcer
      iw.set Announcer Msg $isset($did($dname,6,1).text $did($dname,6,2).text,Nothing..)
      w.set Announcer Ad.Delay $vnum($did($dname,31).text,5)
      if ($did($dname,12).state == 1) || ($did($dname,11).lines == 0) { w.set Announcer Channels All } | else { dls $dname 11 w.set Announcer Channels }
      if ($did($dname,20).state == 1) { w.set Announcer Auto.Start On } | else { w.set Announcer Auto.Start Off }
      if $did($dname,305).text != $null { w.set Announcer Other $did($dname,305).text } | else { d.set Announcer Other }
      if $did($dname,302).state == 1 { w.set Announcer Prefix Warning }
      elseif $did($dname,303).state == 1 { w.set Announcer Prefix Attention }
      elseif $did($dname,304).state == 1 && $did($dname,305).text != $null { w.set Announcer Prefix $did($dname,305).text }
      else { w.set Announcer Prefix Notice }
    }
  }
}
