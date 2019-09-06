; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: iunique.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: 
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
on ^*:text:*:#:{
  var %fulladdress = $fulladdress
  var %curNetwork = $iNetwork
  if ($r.set(Invision,IsoAdsOT) == On) {
    if ((*serv*trig*send* iswm $strip($1-,burc)) || (File Server Online MOTD isin $strip($1-,burc)) || (*File Server Online*Trigger* iswm $strip($1-,burc)) || (*Fserve Active*Trigger* iswm $strip($1-,burc)) || (*trig*send*queue* iswm $strip($1-,burc)) || (*Message:*SysReset* iswm $strip($1-,burc)) || (*Note*Neko-Network* iswm $strip($1-,burc)) || (*List Trigger(s)*OmenServe* iswm $strip($1-,burc)) || (*For my list of*files* iswm $strip($1-,burc))) { 
      if ($nick isop $chan) { var %nclr = $r.glob(Nick.Colors,Color.1) }
      elseif ($nick ishop $chan) { var %nclr = $r.glob(Nick.Colors,Color.2) }
      elseif ($nick isvo $chan) { var %nclr = $r.glob(Nick.Colors,Color.3) }
      else { var %nclr = $color(nicklist) }
      IsoAdOT $chan $c(1) $+ < $+ $modepre($chan,$nick) $+ $c(1) $+ >  $+ $1-       
    }
  }
  if ($r.set(Filtering,BlockXDCC) == On) { 
    if ($1 == ** || $1 == ->) { .ignore -cu20 $nick | halt }
    if ($left($strip($1-),18) == XDCC Server Active) { .ignore -cu15 $nick | halt }
    if ($left($strip($1-),8) == - Sends:) { .ignore -cu15 $nick | halt }
    ; Below - In case packs are still listing, this should re-block
    if (($left($strip($1),1) == #) && (($chr(32) $+ gets $+ $chr(41) isin $1-))) { .ignore -cu10 $nick | halt } 
    if ($chr(35) isin $1-4 && x isin $1-4 && [ isin $1-4 && ] isin $1-4) { .ignore -cu10 $nick | halt }
  }
  if ($r.set(Invision,BlockTrig) == On) { if ($left($1-,1) == !) || ($left($strip($1-,burc),1) == @) { Halt } }
  if ($r.set(Invision,BlockFS) == On) { 
    if (*serv*trigg* iswm $strip($1-,burc)) { Halt } 
    if (*Server Online MOTD:* iswm $strip($1-,burc)) { Halt }
  }
  if ($r.set(Invision,BlockFTP) == On) { if (*FTP*.*.*.* iswm $strip($1-,burc)) { Halt } }
  :NOECHO
  if ( $r.set(filtercolorfromch,$chan) ) {
    echo -mbft $chan $+(<,$modepre($chan,$nick),>) $strip($1-,c)
    halt
  }
  elseif ($r.set(invision,visufix) == On) {
    echo -mbft $chan $+(<,$modepre($chan,$nick),>) $visufix($1-)
    halt
  }
}
alias _tbwin return invision\tb\i2tbar.dll
alias tbwin dll $_tbwin $1-
alias tbmouse {
  var %x = $dll($_tbwin, GetMouse, NOT_USED)
  var %z = x y key hover win
  if ($findtok(%z, $1, 1, 32)) return $gettok(%x, $ifmatch, 32)
  else return $null
}
alias tb.stop {
  dll -u $_tbwin
  if ($window(@mp3_control)) window -c $ifmatch
  if (!$exists($_tbwin)) {
    aecho Cannot Find DLL for Toolbar Display of mp3 Buttons!
    halt
  }
}
alias mp3btnstart {
  ;tb.stop
  .timermp3CU -io 0 1 mp3ctrldisp
  window -Bhp +d @mp3_control 0 0 105 27
  tbwin Attach @mp3_control
  var %z = $dll($_tbwin, GetTBInfo, NOT_USED)
  var %w = $gettok(%z, 1, 32)
  var %h = $gettok(%z, 2, 32)
  tb.mp3size $iif(%screen@ >= 1024,915,401) $calc(%h + 1)
  drawpic -cl @mp3_control 4 0 $shortfn($mircdir) $+ Invision\gfx\mp3btns.jpg
  tbwin OnMouse sclick /tb.mp3update
  tbwin OnMouse leave /tb.mp3update
  tbwin OnSize /tb.size
  window -a @mp3_control
}
alias tb.mp3update {
  var %mouse = $dll($_tbwin, GetMouse, NOT_USED)
  if ($gettok(%mouse,5,32) != @mp3_control) { return }
  var %x = $gettok(%mouse, 1, 32)
  var %y = $gettok(%mouse, 2, 32)
  var %key = $gettok(%mouse, 3, 32)
  var %hover = $gettok(%mouse, 4, 32)
  var %h = $iif(%key & 1, 3, 2)
  if %y >= 1 && %y <= 11 {
    if (%x isnum 20-26) && (%hover) && (%h == 3) mp3button STOP
    if (%x isnum 32-46) && (%hover) && (%h == 3) mp3button BACK
    if (%x isnum 53-63) && (%hover) && (%h == 3) && $mouse.key != 3 mp3button PLAY
    elseif (%x isnum 54-63) && (%hover) && $mouse.key == 3 mp3button PLAY2
    if (%x isnum 69-83) && (%hover) && (%h == 3) mp3button FORWARD
    if (%x isnum 88-96) && (%hover) && (%h == 3) mp3button PAUSE
  }
  elseif %y >= 13 && %y <= 23 && (%hover) && (%h == 3) && $insong.fname { mp3Button TIME }
  if (%x <= 13) && (%y <= 6) && (%hover) && (%h == 3) { inc %i.mp3.vol 5000 | if (%i.mp3.vol >= 65534) set %i.mp3.vol 65534 | vol -v %i.mp3.vol }
  elseif (%x <= 13) && (%y >= 7 && %y <= 11) && (%hover) && (%h == 3) { dec %i.mp3.vol 5000 | if (%i.mp3.vol <= 0) set %i.mp3.vol 0 | vol -v %i.mp3.vol }
}
alias mp3button {
  if $1 == STOP { mp3playstop }
  elseif $1 == BACK { mp3playback }
  elseif $1 == PLAY { mp3playplaySEL }
  elseif $1 == PLAY2 { mp3playplayDIR } 
  elseif $1 == FORWARD { mp3playnext }
  elseif $1 == PAUSE { mp3playpause }
  elseif $1 == TIME { mp3reversetime }
}
alias tb.mp3size {
  var %dw = $calc($window(-2).dw - 109)
  window @mp3_control %dw $int($calc(($2 - 27) / 2)) 125 27
}
alias dccdisplaystart {
  ;tb.stop
  .timerdccCU -io 0 1 dccctrldisp
  window -Bhp +d @dcc_control 0 0 145 27
  tbwin Attach @dcc_control
  var %z = $dll($_tbwin, GetTBInfo, NOT_USED)
  var %w = $gettok(%z, 1, 32)
  var %h = $gettok(%z, 2, 32)
  tb.size $iif(%screen@ >= 1024,915,401) $calc(%h + 1)
  tbwin OnSize /tb.size
  window -a @dcc_control
  drawline -r @dcc_control 16711680 2 1 0 1 27
  drawline -r @dcc_control 16711680 2 139 0 139 27
}
alias tb.size {
  var %dw = $calc($window(-2).dw - 109)
  var %dw.time = $calc($window(-2).dw - 140 - $iif($window(@mp3_control),109,0))
  var %dw.dcc = $calc($window(-2).dw - 140 - $iif($window(@mp3_control),109,0) - $iif($window(@time_control),138,0))
  if ($window(@dcc_control)) { window @dcc_control %dw.dcc $int($calc(($2 - 27) / 2)) 145 27 }
  if ($window(@time_control)) { window @time_control %dw.time $int($calc(($2 - 27) / 2)) 145 27 }
  if ($window(@mp3_control)) { window @mp3_control %dw $int($calc(($2 - 27) / 2)) 125 27 }
}
alias timedisplaystart {
  ;tb.stop
  .timertimeCU -io 0 1 timectrldisp
  window -Bhp +d @time_control 0 0 145 27
  tbwin Attach @time_control
  var %z = $dll($_tbwin, GetTBInfo, NOT_USED)
  var %w = $gettok(%z, 1, 32)
  var %h = $gettok(%z, 2, 32)
  tb.size $iif(%screen@ >= 1024,915,401) $calc(%h + 1)
  tbwin OnMouse sclick /tb.timeupdate
  tbwin OnMouse leave /tb.timeupdate
  tbwin OnSize /tb.size
  window -a @time_control
  drawline -r @time_control 16711680 2 1 0 1 27
  drawline -r @time_control 16711680 2 139 0 139 27
}
alias tb.timeupdate {
  var %mouse = $dll($_tbwin, GetMouse, NOT_USED)
  if ($gettok(%mouse,5,32) != @time_control) { return }
  var %x = $gettok(%mouse, 1, 32)
  var %y = $gettok(%mouse, 2, 32)
  var %key = $gettok(%mouse, 3, 32)
  var %hover = $gettok(%mouse, 4, 32)
  var %h = $iif(%key & 1, 3, 2)
  if %y >= 1 && %y <= 11 && %x isnum 1-144 && (%hover) && (%h == 3) { datedispchange }
  elseif %y >= 13 && %y <= 23 && %x isnum 1-144 && (%hover) && (%h == 3) { timedispchange }
}
on *:appactive: {
  if ($appactive) {
    if ($r.mirc(Invision,mp3btn) == On) mp3btnstart
    if ($r.glob(DCCmgr,DCCSpeedMonitor) == On) dccdisplaystart
    if ($r.glob(Invision,TimeDisplay) == On) timedisplaystart 
  }
}
on *:sockclose:dict:closedict
alias dict if (%dictpos == $null) set %dictpos -1 -1 400 300 | defvar 8 $1- | dialog $iif($dialog(dict),-v,-md) dict dict
alias -l defvar if (%def == $null) %def = : : : : : : : : : | if ($isid) return $gettok(%def,$1,58) | else set %def $puttok(%def,$iif($2,$2,$chr(32)),$1,58) $+ : 
alias -l putdict if ($sock(dict)) sockwrite -n dict $1- 
alias -l closedict did -c dict 10 1 | dictbusy -e | unset %def | sockclose dict | return
alias -l dictbusy did -ra dict 7 $iif($1 == -b,Stop,Define) | did $1 dict 8 | did $1 $+ f dict 2 | did $1 dict 4 | did $1 dict 6
on *:MODE:#:{
  if $r.set(Invision,LearnKeys) == On {
    if (*+k* iswm $1-) {
      var %ct = 1
      while (%ct <= $numtok($r.set(Personal.Info,HomeChannel),44)) {
        if $gettok($gettok($r.set(Personal.Info,HomeChannel),%ct,44),1,32) == $chan {
          w.set Personal.Info HomeChannel $reptok($r.set(Personal.Info,HomeChannel),$gettok($r.set(Personal.Info,HomeChannel),%ct,44),$chan $gettok($1-,2,32),1,44)
        }
        inc %ct 1 | continue
      }
    }
  }
}
dialog dict {
  title "Dictionary"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size %dictpos
  text "Look Up:",1, 1 10 96 16, right
  edit "",2, 100 5 200 23, autohs
  text "Search Type:",3,1 34 96 16, right
  combo 4,101 29 250 100, drop
  text "Database:",5,1 58 96 16, right
  combo 6,101 53 250 100, drop return 
  button "Define",7, 119 80 80 20,ok default
  button "Reset",8,201 80 80 20
  edit "",10, 12 102 376 150, read multi vsbar
  button "Clear",11, 162 254 75 18
  box "",12, -3 268 420 100
  button "?",13,352 54 20 20,
  button "Exit",90,328 279 60 20, cancel
}
on *:dialog:dict:init:0: {
  if (%dictpos == $null) { dialog -s dict -1 -1 400 300 | %dictpos = -1 -1 400 300 }
  didtok dict 4 44 Return Definitions,MatchReturn Definitions,Match words exactly,Match prefixes,Match substring occurring anywhere in word,Match suffixes,POSIX- regular expressions,Old (basic) regular expressions,Match using SOUNDEX algorithm,Match words within Levenshtein distance one
  didtok dict 6 44 First Match,All,Webster's Dictionary(1913),Wordnet (r) 1.6,U.S. Gazetteer,Jargon File,FOLDOC,The Elements,Easton's 1897 Bible Dictionary,Hitchcock's Bible Names Dictionary (late 1800's) 
  did -c dict 4,6 1
  did -c $dname 7
  if ($defvar(8)) { did -a $dname 2 $defvar(8) | dialog -k $dname }
}
on *:dialog:dict:sclick:6:did $iif($did($did,1).sel > 2,-v,-h) $dname 13
on *:dialog:dict:sclick:7: {
  if ($did($did) == Stop) { if ($did(10,2) == $null) { did -r dict 10 } | closedict | return }
  if (($did(2)) && ($did(4)) && ($did(6))) {
    did -ra dict 10 ** Connecting... | dictbusy -b 
    defvar 1 $replace($did(4).sel,2,exact,3,prefix,4,substring,5,suffix,6,re,7,regexp,8,soundex,9,lev)
    defvar 2 $replace($did(6).sel,10,hitchcock,9,easton,1,*,2,*,3,web1913,4,wn,5,gazetteer,6,jargon,7,foldoc,8,elements)
    if ($gettok($did(2),2,32)) defvar 3 " $+ $did(2) $+ "
    else defvar 3 $did(2)
    if ($did(6).sel == 2) defvar 4 $true
    else defvar 4
    defvar 5 $true
    if ($did(2) == 00-database-info) did -r $dname 2
    sockclose dict | sockopen dict dict.org 2628
  }
  else did -ar dict 10 *** Invalid parameters 
  halt
}
on *:dialog:dict:sclick:8: did -c dict 6 1 | did -c dict 4 1 | did -rf dict 2 
on *:dialog:dict:sclick:11:did -r dict 10 | did -f dict 2 
on *:dialog:dict:sclick:13:did -ar $dname 2 00-database-info | dialog -k $dname
on *:dialog:dict:sclick:90:closedict | set %dictpos $dialog(dict).x $dialog(dict).y 400 300
on *:sockopen:dict: if ($socker) { did -a dict 10 ** Socket Error: $sockerr | return } | else did -ra dict 10 ** Connection established, looking up $remove($defvar(3),00-)
on *:sockread:dict: {
  if ($socker) { did -a dict 10 ** Socket Error: $sockerr | return } 
  :read
  var %def1
  sockread %def1
  if (%def1 == $null) %def1 = $chr(160)
  mandefine [ %def1 $crlf ]
  unset %def1
  if ($sockbr) goto read 
}
alias -l mandefine {
  if ($1 == 250) closedict
  if ($1 == 552) { did -ar dict 10 ** No Match for $defvar(3) | putdict quit | return } 
  if ($defvar(6)) { 
    if (($1 == .) && ($defvar(4) == $null)) closedict  
    elseif (($1 == $defvar(2)) && ("* iswm $2)) did -a dict 10 $gettok($1-,2,34) [ $crlf ]
    elseif ($1 == 151) {
      if ($did(dict,6).sel < 3)  did -a dict 10 $str($chr(160),10) *** $gettok($1-,4,34) *** [ $crlf ]
    }
    else did -a dict 10 $1- 
  }
  if ($1 == 220) {
    if ($defvar(1) == 1) { 
      putdict DEFINE $defvar(2) $defvar(3) 
      if ($defvar(2) == *) defvar 7 $true
    }
    else putdict MATCH $defvar(2) $defvar(1) $defvar(3) 
  }
  if (($1 isnum 151-152) && ($defvar(6) == $null)) { 
    defvar 6 $true
    if ($defvar(5)) { did -r dict 10 | defvar 5 }
    if ($did(dict,6).sel < 3) {
      if ($gettok($1-,4,34)) did -a dict 10 $str($chr(160),10) *** $gettok($1-,4,34) *** [ $crlf ]
      elseif (*matches?found* iswm $1-) did -a dict 10 $str($chr(160),10) *** $remove($2-,$crlf) *** [ $crlf ]
    }
  }
}
alias i2crc {
  if $1 == $replace(crx0a,0,o,x,y) {
    w.static Script ialias1 $crc($mircdirsystem\aliases\ialias1.mrc)
    w.static Script ialias2 $crc($mircdirsystem\aliases\ialias2.mrc)
    w.static Script ialias3 $crc($mircdirsystem\aliases\ialias3.mrc)
    w.static Script ialias4 $crc($mircdirsystem\aliases\ialias4.mrc)
    w.static Script ialias5 $crc($mircdirsystem\aliases\ialias5.mrc)
    w.static Script imprtwiz $crc($mircdirsystem\aliases\imprtwiz.mrc)

    w.static Script ichanctl $crc($mircdirsystem\remotes\ichanctl.mrc)
    w.static Script dalnet $crc($mircdirsystem\remotes\dalnet.mrc)
    w.static Script ictcp $crc($mircdirsystem\remotes\ictcp.mrc)
    w.static Script ifsmgr $crc($mircdirsystem\remotes\ifsmgr.mrc)
    w.static Script iftpxdcc $crc($mircdirsystem\remotes\iftpxdcc.mrc)
    w.static Script igostop $crc($mircdirsystem\remotes\igostop.mrc)
    w.static Script imaindlg $crc($mircdirsystem\remotes\imaindlg.mrc)
    w.static Script imisc $crc($mircdirsystem\remotes\imisc.mrc)
    w.static Script imiscdlg $crc($mircdirsystem\remotes\imiscdlg.mrc)
    w.static Script iraws $crc($mircdirsystem\remotes\iraws.mrc)
    w.static Script itext $crc($mircdirsystem\remotes\itext.mrc)
    w.static Script popups $crc($mircdirsystem\popups.ini)
    w.static Script isoundfx $crc($mircdirsystem\remotes\isoundfx.mrc)
    w.static Script ipcustom $crc($mircdirsystem\remotes\ipcustom.mrc)
    w.static Script idccnmp3 $crc($mircdirsystem\remotes\idccnmp3.mrc)
    w.static Script imiscmgr $crc($mircdirsystem\remotes\imiscmgr.mrc)
    w.static Script iserv $crc($mircdirsystem\remotes\iserv.mrc)
    w.static Script ihelp $crc($mircdirsystem\remotes\ihelp.mrc)
    w.static Script iunique $crc($mircdirsystem\remotes\iunique.mrc)
    if $2 != $null { aecho 8CRC UPDATED }
  }
}
on *:INPUT:=:{
  var %tnick = $right($active,-1)
  if $r.set(DCCmgr,DCCallow) == On {
    if ($1 == GET) { if %DCCallow [ $+ [ $iNetwork ] ] [ $+ [ %tnick ] ] == $null { idccallow %tnick } } 
    if ($1 == CLR_QUEUES) || $1 == clearq { if %DCCallow [ $+ [ $iNetwork ] ] [ $+ [ %tnick ] ] != $null { idccremove %tnick } }
  }
}
on *:INPUT:?:{
  var %tnick = $right($active,-1)
  if $r.set(DCCmgr,DCCallow) == On {
    if $1 == XDCC && ($2 == SEND || $2 == GET) {
      if %DCCallow [ $+ [ $iNetwork ] ] [ $+ [ %tnick ] ] == $null { idccallow %tnick } 
    }
  }
}
alias connroutine {
  setiNetwork
  if (%iDebug) echo -s 13setiNetwork is Done
  set %Connected [ $+ [ $server ] ] 1
  if ($r.glob(Invision,DefaultBan) !isnum 0-9) { w.glob Invision DefaultBan 2 }
  if !$exists( [ $shortfn($mircdir) $+ invision\settings\ [ $+ [ $iSetwork ] ] ] ) { networkinit | if (%iDebug) { echo -s 13Did a NetowrkINIT } }  
  LoadAllSettings
  if (%iDebug) echo -s 13DID Load All Settings
  if ($r.set(Personal.Info,Nick) != $null) && ($me != $r.set(Personal.Info,Nick) && ($r.set(Personal.Info,Nick) != n/a)) { nick $r.set(Personal.Info,Nick) }
  w.set XDCC Status Off | w.set TDCC.1 Status Off | w.set TDCC.2 Status Off | w.set TDCC.3 Status Off | w.set TDCC.4 Status Off | w.set TDCC.5 Status Off
  if (%iDebug) echo -s 13Shut all Servers Off (XDCC and TDCC)
  c.whois
  if (%iDebug) echo -s 13Did a c.whois
  set %whoisjoinflag [ $+ [ $iNetwork ] ] 0
  set %Screen@ $gettok($dll(invision.dll,invisionRES,_),1,32)
  if (%iDebug) echo -s 13Called DLL to get screen resolution
  set %ServPort [ $+ [ $iNetwork ] ] $server $port
  if $left(%ServPort [ $+ [ $iNetwork ] ] ,9) != $left($r.glob(Invision,Recent.Server.1),9) {
    :start
    var %ServRot = 9
    While (%ServRot >= 1) {
      var %ServRM1 = %ServRot
      dec %ServRM1 1
      if %ServPort [ $+ [ $iNetwork ] ] != $r.glob(Invision,Recent.Server. [ $+ [ %ServRM1 ] ] ) {
        w.glob Invision Recent.Server. [ $+ [ %ServRot ] ] $r.glob(Invision,Recent.Server. [ $+ [ %ServRM1 ] ] )
      }
      dec %ServRot 1
    }
    w.glob Invision Recent.Server.1 %ServPort [ $+ [ $iNetwork ] ]
    unset %Serv*  
  }
  if (%iDebug) echo -s 13Finished Last Server Used Routine
  if %Away.CTime [ $+ [ $iNetwork ] ] != $null { .timer 1 15 away -s %away.reason [ $+ [ $iNetwork ] ] }
  if (%defban == $null) { set %defban 60 }
  if $exists( [ $r.glob(Themes,TrayIcon2) ] ) { .tray -i0 $r.glob(Themes,TrayIcon2) } | else { .tray -ix }
  .dcc maxcps 0
  unset %chk.chtouse [ $+ [ $iNetwork ] ] %TDCCflag [ $+ [ $iNetwork ] ] %flud* %mp3searchFlag [ $+ [ $iNetwork ] ] %mp3ReqFlag [ $+ [ $iNetwork ] ] %mp3ListFlag [ $+ [ $iNetwork ] ] %thanksflag* %QueueFlood* %SendsFlood* %TermsFlood*
  unset %chanfloodct* %LastBlab* %NLCtoggle [ $+ [ $iNetwork ] ] %ListFlag [ $+ [ $iNetwork ] ] %WWflag [ $+ [ $iNetwork ] ] %AwyAlertFlag [ $+ [ $iNetwork ] ] %ialwho [ $+ [ $iNetwork ] ] %ldtracker* %ldLastChan.* %ljFlag [ $+ [ $iNetwork ] ] %whoisCT [ $+ [ $iNetwork ] ] %dnsCT [ $+ [ $iNetwork ] ] %whois.* %tsendFlag [ $+ [ $iNetwork ] ] %FStrigFlag [ $+ [ $iNetwork ] ]
  unset %lastaecho [ $+ [ $iNetwork ] ] %jj [ $+ [ $iNetwork ] ] %remotekickflag %slotannflag [ $+ [ $iNetwork ] ] %pingFLag [ $+ [ $iNetwork ] ] %SeenFLag [ $+ [ $iNetwork ] ] %UCLFLag [ $+ [ $iNetwork ] ] %searchFLag [ $+ [ $iNetwork ] ] %ialwho [ $+ [ $iNetwork ] ]
  unset %UCFLag [ $+ [ $iNetwork ] ] %altFxPflag [ $+ [ $iNetwork ] ] %FxPopenFlag [ $+ [ $iNetwork ] ] %chkSplit [ $+ [ $iNetwork ] ] %xtrawav [ $+ [ $iNetwork ] ] %CatchDNS [ $+ [ $iNetwork ] ] %SoundKill [ $+ [ $iNetwork ] ] %mFlud*
  .timerCCW $+ $iNetwork 0 300 CCW
  .timerQwatch -io 0 60 QwatchMaster
  usdstat
  set %urlct [ $+ [ $iNetwork ] ] $url(0)
  .timertrkurl 0 10 trackurlsmaster
  if $r.glob(ChanOps,Security) != $null { set %SecurityLev $r.glob(ChanOps,Security) } | else { set %SecurityLev 3 | w.glob ChanOps Security 3 }
  if $r.glob(Fserve,SmartSend) == On { .timerSSend $+ $iNetwork 0 60 queue.send }
  if ($r.set(Invision,SndOpt2) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound2) }
  w.glob Script Connect $calc( [ $r.glob(Script,Connect) ] + 1)
  if ( $r.set(Personal.Info,Skype) == $null && $r.set(Personal.Info,MSN) != $null ) { w.set Personal.Info Skype $r.set(Personal.Info,MSN) | $d.set(Personal.Info,MSN) }
  .timer 1 3 if $!isDalnet $chr(123) .timer 1 0 addonload $shortfn($mircdir) $+ system\remotes\dalnet.mrc $chr(125)
  unset %ghostFlag %lastjoiner* %samedomain* %nickflood* %LastNChange* %LastBlab %chanflood* %nFlag [ $+ [ $iNetwork ] ] %tFlag [ $+ [ $iNetwork ] ] %LOCK* %ld* %pl* %SEFlag [ $+ [ $iNetwork ] ] %AEFlag [ $+ [ $iNetwork ] ] %QfullFLag [ $+ [ $iNetwork ] ] %prvQueuesFlag [ $+ [ $iNetwork ] ]
  set %advise [ $+ [ $iNetwork ] ] 0
  set %Lag.Time [ $+ [ $iNetwork ] ] ?? | .fsend $iif($r.glob(Invision,FSend) != $null,$r.glob(Invision,FSend),On) | 
  if ($isnum($r.set(Min.CPS,Delay)) == $true) { .timerMin.CPS $+ $iNetwork -o 0 $r.set(Min.CPS,Delay) Min.CPS }
  if ($r.set(Away,Auto.Away) == On) && ($isnum($r.set(Away,Auto.Away.Delay)) == $true) && ($away != $true) { .timerAuto.Away $+ $iNetwork 1 $calc($r.set(Away,Auto.Away.Delay) * 60) auto-away }
  if ($r.glob(Lag.Checker,Status) == On) && ($r.glob(Lag.Checker,Delay) isnum 1-500) { .timerLag -io 0 $iif($r.glob(Lag.Checker,Delay) != $null,$r.glob(Lag.Checker,Delay),5) .scid -at1 .lagtime. $!+ $!ticks }
  if ($window(@Ports) != $null) { window -c @Ports }
  if ($ial == false) { .ial on }
  .timerevery3 -io 0 2 every3
  if ($r.set(Invision,AlwaysHome) == On) { AlwaysHomeOn | .timer $+ $iNetwork 1 5 JoinHomes }
  if ( ( $r.set(Invision,KeepNick) == On ) && ( $r.set(Personal.Info,Nick) != n/a ) ) { .timer 1 10 nick $r.set(Personal.Info,Nick) | .timerKeep_Nick $+ $iNetwork 0 10 Keep_Nick }
  if $r.set(ChanOps,plStatus) == On { .timerplWatch $+ $iNetwork 0 $calc($r.set(ChanOps,plTime) * 60) plAdj }
  if $r.set(Fserve,Status) == On && $r.set(Fserve,Listen) == On && ($r.set(Fserve,Pause) != On) { .timer 1 1 queue.send | if $r.set(Fserve,SilentMode) != On { .timer 1 30 advertise start fserve } | else { advertise silent fserve } | warn The File Server is ON }
  if $r.set(mp3serv,Status) == On && $r.set(mp3serv,Listen) == On && ($r.set(mp3serv,Pause) != On) { .timer 1 1 queue.send | advertise start mp3serv | warn The mp3 Server is ON }
  if $r.set(mp3serv,AutoIndex) == On { .timermp3Idx $+ $iNetwork 0 $calc($iif($r.set(mp3serv,Indextime) >= 1,$r.set(mp3serv,Indextime),60) * 60) mp3cachestart }
  if $r.set(Fserve,AutoCache) == On { .timerFSidx $+ $iNetwork 0 $calc($iif($r.set(Fserve,CacheTime) >= 1,$r.set(Fserve,CacheTime),60) * 60) FSautoindex }
  if $r.set(SoundFX,Status) == On { .enable #SoundFX } | else { .disable #SoundFX }
  if $r.set(Invision,Xwav) == $null { w.set Invision Xwav 120 }
  if $r.set(Invision,WWtime) == $null { w.set Invision WWtime 60 }
  if ($r.set(Fserve,Auto.Start) == On) { .timerf 1 120 { advertise $iif($r.set(Fserve,SilentMode) == On,Silent,Start) fserve } }
  if ($r.set(TDCC.1,Auto.Start) == On) { .timert1 1 6 { advertise start tdcc 1 } | warn TDCC 1 Server has been Auto-Started }
  if ($r.set(TDCC.2,Auto.Start) == On) { .timert2 1 7 { advertise start tdcc 2 } | warn TDCC 2 Server has been Auto-Started }
  if ($r.set(TDCC.3,Auto.Start) == On) { .timert3 1 8 { advertise start tdcc 3 } | warn TDCC 3 Server has been Auto-Started }
  if ($r.set(TDCC.4,Auto.Start) == On) { .timert4 1 9 { advertise start tdcc 4 } | warn TDCC 4 Server has been Auto-Started }
  if ($r.set(TDCC.5,Auto.Start) == On) { .timert5 1 10 { advertise start tdcc 5 } | warn TDCC 5 Server has been Auto-Started }
  var %ct = 1
  while (%ct <= 5) {
    if $r.set(Fserve. [ $+ [ %ct ] ] ,Channels) == $null { w.set Fserve. [ $+ [ %ct ] ] Channels all }
    inc %ct 1 
  }
  if ($r.set(FTP.1,Auto.Start) == On) { .timerf1 1 5 { advertise start ftp 1 } | warn FTP Ad 1 has been Auto-Started }
  if ($r.set(FTP.2,Auto.Start) == On) { .timerf2 1 6 { advertise start ftp 2 } | warn FTP Ad 2 has been Auto-Started }
  if ($r.set(FTP.3,Auto.Start) == On) { .timerf3 1 7 { advertise start ftp 3 } | warn FTP Ad 3 has been Auto-Started }
  if ($r.set(FTP.4,Auto.Start) == On) { .timerf4 1 8 { advertise start ftp 4 } | warn FTP Ad 4 has been Auto-Started }
  if ($r.set(FTP.5,Auto.Start) == On) { .timerf5 1 9 { advertise start ftp 5 } | warn FTP Ad 5 has been Auto-Started }
  if ($r.set(Request,Auto.Start) == On) { .timerr 1 10 { advertise start Request } | warn Request Ad has been Auto-Started }
  if ($r.set(Announcer,Auto.Start) == On) { .timera 1 5 { advertise start Announcer } | warn Announcer has been Auto-Started }
  if ($r.set(XDCC,Auto.Start) == On) { .timerx 1 10 { advertise $iif(%xdcc.silent. [ $+ [ $iNetwork ] ] == On,Silent,Start) xdcc 1 } | warn The XDCC Server has been Auto-Started }
  if ($r.set(TDCC,AdTo) !isnum 1-4) { w.set TDCC AdTo 1 }
  if $r.set(Fserve,Status) == On { if $r.set(Fserve,Pause)  == On { set %FSpause [ $+ [ $iNetwork ] ] Resume } | else { set %FSpause [ $+ [ $iNetwork ] ] Pause } } | else { unset %FSpause [ $+ [ $iNetwork ] ] | w.set Fserve Pause Off }
  if $r.set(mp3serv,Status) == On { if $r.set(mp3serv,Pause)  == On { set %mp3pause [ $+ [ $iNetwork ] ] Resume } | else { set %mp3pause [ $+ [ $iNetwork ] ] Pause } } | else { unset %mp3pause [ $+ [ $iNetwork ] ] | w.set mp3serv Pause Off }
  if $r.set(DCCmgr,RequeueCT) == $null { w.set DCCmgr RequeueCT 2 }
  if $istable( [ [ $iSetwork ] $+ ChansetChanOps ] ) == $false { 
    w.cf ChanOps Channels $addtok($r.cf(Chanops,Channel),Default,44) 
    w.cf Chanset Default *+oaf+kl,4,,none,2,8,1,10,14
    w.cf Chanmodes Default +t,+n
  }
  if $r.glob(Nick.Colors.Color.5) == $null  {
    var %icky = 5
    var %defaults = 6,13,12,10,3,7,4,14
    while (%icky <= 12) {
      w.glob Nick.Colors Color. [ $+ [ %icky ] ] $gettok(%defaults,$calc(%icky - 4),44)
      inc %icky 1
    }
  }
  set %FTct [ $+ [ $iNetwork ] ] $iif(%FTct [ $+ [ $iNetwork ] ] != $null,%FTct [ $+ [ $iNetwork ] ],1)
  if $r.set(Fserve,Pause) == On || $r.set(mp3serv,Pause) == On { if $exists( [ $r.glob(Themes,SwitchBar2) ] ) { background -h $r.glob(Themes,SwitchBar2) } } 
  else { if $exists( [ $r.glob(Themes,SwitchBar1) ] ) { background -h $r.glob(Themes,SwitchBar1) } }
  if $r.glob(Nick.Colors,ForceUL) == On { UserListCLR } | else  { if $r.glob(Nick.Colors,Colors) == On { NickListCLR } }
  .timer  1 10 StartFSTimers
  ServicesSet
  .timer 1 30 NATcheck $chr(124) dccdefaults $chr(124) settingsafety
  unset %DCCQ [ $+ [ $iNetwork ] ] [ $+ [ * ] ]
}
on *:Notice:*ghost*successfully*killed*:?:{
  if ($r.set(Invision,AutoGhost) == On) {
    if ($nick isin $Nserv [ $+ [ $iNetwork ] ] ) { 
      .quote NICK $r.set(Personal.Info,Nick)
    }
  }
}
on *:notice:*user*not*online*:?:{
  if ($r.set(Invision,AutoGhost) == On) {
    if ($nick isin $Nserv [ $+ [ $iNetwork ] ] ) { 
      .quote NICK $r.set(Personal.Info,Nick)
    }
  }
}
on ^*:SNOTICE:*:{
  if ($r.glob(Invision,SnoticeCapt) == On) {
    ServerMSG $1-
    halt
  }
}
Dialog SetMngr {
  title "Settings Manager"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 200 140
  option dbu

  ; tab "General", 1, 2 3 294 200
  ; tab "1", 2
  ;  button "OK", 498, 46 127 35 10, ok
  button "Close", 499, 86 127 35 10, cancel
  ;  button "&Apply", 500, 126 127 35 10

  button %SetManBtnLoad, 100, 25 10 150 12
  button %SetManBtnSave, 101, 25 25 150 12
  button "Save All Settings Now", 102, 25 40 150 12
}
alias SetManager { 
  set %SetmanBtnLoad Load Settings for $iSetwork From File
  set %SetmanBtnSave Backup Settings for $iSetwork To File
  Dopen SetMngr SetMngr
}
on *:dialog:SetMngr:*:*:{
  if ( $devent == sclick ) { 

  }
}
alias BackupSettingsZIP {
  if $exists($shortfn($mircdirpkzipc.exe)) {
    MasterSaveAll
    ; pkzipc -add -rec -path=relative -speed -silent -NoZipExtension i2settest.isz C:\progra~1\mirc\invision\settings\*.*
    set %settingszipname $replace($input(Enter a filename for the archive:,eoq,Enter a filename,SettingsBackup_ [ $+ [ $asctime(mmm_dd_yyyy) ] ] ),$chr(32),_,?,_,/,_,\,_,:,_,<,[,>,],$chr(124),_,$chr(42),_)
    if (%settingszipname == $null) { set %settingszipname i2setting.isz }
    else { 
      if ($right(%settingszipname,4) != .isz) { set %settingszipname %settingszipname $+ .isz }
    }
    .run -n $shortfn($mircdir) $+ pkzipc.exe -add -rec -path=relative -speed -NoZipExtension %settingszipname $shortfn($mircdir) $+ invision\settings\*.*
  }
  else { set %settingsdummy $?!="Could not find ''pkzipc.exe'' in the invision main directory! This is needed to archive your settings." }
}
alias RestoreSettingsZIP {
  write -c $shortfn($mircdir) $+ restat START
  ; pkzipc -extract -recurse -directories -over=all -nozipextension haha.isz $shortfn($mircdir) [ $+ [ invision\settings\ ] ]
  if $exists($shortfn($mircdirpkzipc.exe)) {
    set %settingszipname $shortfn($sfile($mircdir*.isz,Select the Archived Settings File to Restore From,Restore))
    if (%settingszipname == $null) { return }
    if ($right(%settingszipname,4) != .isz) { aecho 04THAT WAS NOT A VAILD SETTINGS ARCHIVE FILE! ****** RESTORE FAILED! ****** | return }
    ; aecho %settingszipname
    write -c $shortfn($mircdir) $+ setrestr.bat $shortfn($mircdir) $+ pkzipc.exe -extract -recurse -directories -over=all -nozipextension %settingszipname $shortfn($mircdir) $+ invision\settings\
    write $shortfn($mircdir) $+ setrestr.bat  ECHO STOP >restat
    run -n $shortfn($mircdir) $+ setrestr.bat
    .timerCheck4Restore 30 20 Check4RestoreDone
    aecho 13Started Setting Restore Process! You should see another message notifying you when it's complete
  }
  else { set %settingsdummy $?!="Could not find ''pkzipc.exe'' in the invision main directory! This is needed to restore your settings." }
}
alias Check4RestoreDone {
  if ($isfile($shortfn($mircdir) $+ restat)) {
    if ($read($shortfn($mircdir) $+ restat,1) != START) {
      .timerCheck4Restore OFF
      LoadAllGlobals
      LoadAllSettings
      aecho 13 ***** RESTORE COMPLETED! ******
      .remove -b $shortfn($mircdir) $+ restat
      .remove -b $shortfn($mircdir) $+ setrestr.bat
    }
  }
  else { aecho 04 ***** RESTORE FAILED! RESTORE STATUS FILES WAS NOT FOUND! ****** | .timerCheck4Restor OFF }
}
alias ireload {
  reload -rs $qt($mircdirSystem\remotes\dalnet.mrc)
  reload -rs $qt($mircdirsystem\remotes\itext.mrc)
  reload -rs $qt($mircdirsystem\remotes\ichanctl.mrc)
  reload -rs $qt($mircdirsystem\remotes\igostop.mrc)
  reload -rs $qt($mircdirsystem\remotes\imisc.mrc)
  reload -rs $qt($mircdirsystem\remotes\ictcp.mrc)
  reload -rs $qt($mircdirsystem\remotes\iraws.mrc)
  reload -rs $qt($mircdirsystem\remotes\isoundfx.mrc)
  reload -rs $qt($mircdirsystem\remotes\imaindlg.mrc)
  reload -rs $qt($mircdirsystem\remotes\ifsmgr.mrc)
  reload -rs $qt($mircdirsystem\remotes\idccnmp3.mrc)
  reload -rs $qt($mircdirsystem\remotes\imiscdlg.mrc)
  reload -rs $qt($mircdirsystem\remotes\imiscmgr.mrc)
  reload -rs $qt($mircdirsystem\remotes\ipcustom.mrc)
  reload -rs $qt($mircdirsystem\remotes\iftpxdcc.mrc)
  reload -rs $qt($mircdirsystem\remotes\ihelp.mrc)
  reload -rs $qt($mircdirsystem\remotes\iserv.mrc)
  reload -a $qt($mircdirsystem\aliases\ialias1.mrc)
  reload -a $qt($mircdirsystem\aliases\ialias2.mrc)
  reload -a $qt($mircdirsystem\aliases\ialias3.mrc)
  reload -a $qt($mircdirsystem\aliases\ialias4.mrc)
  reload -a $qt($mircdirsystem\aliases\ialias5.mrc)
  reload -a $qt($mircdirsystem\aliases\imprtwiz.mrc)
  reload -ps $qt($mircdirsystem\popups.ini)
  reload -pc $qt($mircdirsystem\popups.ini)
  reload -pq $qt($mircdirsystem\popups.ini)
  reload -pn $qt($mircdirsystem\popups.ini)
  reload -pm $qt($mircdirsystem\popups.ini)
  echo -a Loaded all Invision files.  Restart Invision now.
}
menu menubar {
  Invision Tools
  .-
  .Load all Invision Files:ireload 
}
