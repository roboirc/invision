; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: ialias4.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: The File Server Explorer Alias routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
StartFSTimers {
  if $r.set(Fserve.Sch,T1Status) == On { .timerFSsch1 $+ $iNetwork $r.set(Fserve.Sch,T1Time) 1 1 if $!istok($r.set(Fserve.sch,T1days),$time(ddd),44) $chr(123) advertise $!r.set(Fserve.Sch,T1action) Fserve $chr(125) } | else { .timerFSsch1 $+ $iNetwork off }
  if $r.set(Fserve.Sch,T2Status) == On { .timerFSsch2 $+ $iNetwork $r.set(Fserve.Sch,T2Time) 1 1 if $!istok($r.set(Fserve.sch,T2days),$time(ddd),44) $chr(123) advertise $!r.set(Fserve.Sch,T2action) Fserve $chr(125) } | else { .timerFSsch2 $+ $iNetwork off }
  if $r.set(Fserve.Sch,T3Status) == On { .timerFSsch3 $+ $iNetwork $r.set(Fserve.Sch,T3Time) 1 1 if $!istok($r.set(Fserve.sch,T3days),$time(ddd),44) $chr(123) advertise $!r.set(Fserve.Sch,T3action) Fserve $chr(125) } | else { .timerFSsch3 $+ $iNetwork off }
  if $r.set(Fserve.Sch,T4Status) == On { .timerFSsch4 $+ $iNetwork $r.set(Fserve.Sch,T4Time) 1 1 if $!istok($r.set(Fserve.sch,T4days),$time(ddd),44) $chr(123) advertise $!r.set(Fserve.Sch,T4action) Fserve $chr(125) } | else { .timerFSsch4 $+ $iNetwork off }
  if $r.set(Fserve.Sch,T5Status) == On { .timerFSsch5 $+ $iNetwork $r.set(Fserve.Sch,T5Time) 1 1 if $!istok($r.set(Fserve.sch,T5days),$time(ddd),44) $chr(123) advertise $!r.set(Fserve.Sch,T5action) Fserve $chr(125) } | else { .timerFSsch5 $+ $iNetwork off }
  if $r.set(Fserve.Sch,T6Status) == On { .timerFSsch6 $+ $iNetwork $r.set(Fserve.Sch,T6Time) 1 1 if $!istok($r.set(Fserve.sch,T6days),$time(ddd),44) $chr(123) advertise $!r.set(Fserve.Sch,T6action) Fserve $chr(125) } | else { .timerFSsch6 $+ $iNetwork off }
  if $r.set(Fserve.Sch,TAStatus) == On { .timerFSschA $+ $iNetwork $r.set(Fserve.Sch,TATime) 1 1 w.glob Fserve Max.Serv.Bandwidth $!r.set(Fserve.Sch,TAbw) } | else { .timerFSschA $+ $iNetwork off }
  if $r.set(Fserve.Sch,TBStatus) == On { .timerFSschB $+ $iNetwork $r.set(Fserve.Sch,TBTime) 1 1 w.glob Fserve Max.Serv.Bandwidth $!r.set(Fserve.Sch,TBbw) } | else { .timerFSschB $+ $iNetwork off }
  if $r.set(Fserve.Sch,TCStatus) == On { .timerFSschC $+ $iNetwork $r.set(Fserve.Sch,TCTime) 1 1 w.glob Fserve Max.Serv.Bandwidth $!r.set(Fserve.Sch,TCbw) } | else { .timerFSschC $+ $iNetwork off }
  if $r.set(Fserve.Sch,TDStatus) == On { .timerFSschD $+ $iNetwork $r.set(Fserve.Sch,TDTime) 1 1 w.glob Fserve Max.Serv.Bandwidth $!r.set(Fserve.Sch,TDbw) } | else { .timerFSschD $+ $iNetwork off }
  if $r.set(Fserve.Sch,TEStatus) == On { .timerFSschE $+ $iNetwork $r.set(Fserve.Sch,TETime) 1 1 w.glob Fserve Max.Serv.Bandwidth $!r.set(Fserve.Sch,TEbw) } | else { .timerFSschE $+ $iNetwork off }
  if $r.set(Fserve.Sch,TFStatus) == On { .timerFSschF $+ $iNetwork $r.set(Fserve.Sch,TFTime) 1 1 w.glob Fserve Max.Serv.Bandwidth $!r.set(Fserve.Sch,TFbw) } | else { .timerFSschF $+ $iNetwork off }
}
DirRecord { 
  ; ***********   DirRecord <nick> <file with path> 
  if $2 != $null {
    var %NickHold = $1
    var %dirrecCT = 1
    if ($r.glob(DCCmgr,MostRequested) == File || $r.glob(DCCmgr,MostRequested) == $null) { set %FixedDir $nopath($2-) | goto jumpin } | else { set %FixedDir $nofile($2-) }
    set %FixedDir $replace(%FixedDir,\\,\)
    if ($mid(%FixedDir,$calc($len(%FixedDir) - 3),2) == cd) && ($mid(%FixedDir,$calc($len(%FixedDir) - 1),1) isnum) {
      set %FixedDir $left(%FixedDir,-4)
    } 
    var %dirrecLEN = $len($2-)
    while (%dirrecCT < $len(%FixedDir)) { 
      set %testCHR $mid(%FixedDir,%dirrecCT,1)
      if %testCHR == $chr(92) && (%dirrecCT != $len(%FixedDir)) { 
        set %FixedDir $right(%FixedDir,$calc($len(%FixedDir) - %dirrecCT))
        var %dirrecCT = 0
      }
      inc %dirrecCT 1
    }
  }
  set %FixedDir $left(%FixedDir,-1)
  :jumpin
  set %stripFD $replace(%FixedDir,$chr(32),$chr(95),$chr(61),$chr(63))
  if (%DRN [ $+ [ $1 ] ] [ $+ [ %stripFD ] ] == $null) {
    set %tmpDirCT $r.rec(Directories,%stripFD)
    inc %tmpDirCT 1
    w.rec Directories %stripFD %tmpDirCT
    if $len($r.rec(Users,$1)) >= 230 { d.rec Users $1 }
    set %tmpNickDirs $r.rec(Users,$1)
    if $istok(%tmpNickDirs,%stripFD,32) == $false {
      set %tmpNickDirs %tmpNickDirs %stripFD
      w.rec Users $1 %tmpNickDirs
    }
    inc %DRN $+ $1 $+ %stripFD 1
  }
  var %tot = $iif($r.glob(Fserve,RecordsKeep) >= 1,$r.glob(Fserve,RecordsKeep),1)
  var %ct = 1
  while (%ct <= %tot) {
    if (($r.rec(Directories,%stripFD) >= $r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] )) || $r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) == $null) { 
      var %oct = $calc(%ct - 1)      
      while (%oct >= 1) {
        if (%fixeddir == $r.glob(Fserve,DirRecord.Name [ $+ [ %oct ] ] )) { return }
        dec %oct 1
      }
      var %addct = 1
      var %inct = %ct
      var %intot = %tot
      while (%inct <= %intot) {
        if %fixedDir == $r.glob(Fserve,DirRecord.Name [ $+ [ %inct ] ] ) { inc %inct 1 | continue }
        set %HoldName [ $+ [ %addct ] ] $r.glob(Fserve,DirRecord.Name [ $+ [ %inct ] ] ) 
        set %HoldCount [ $+ [ %addct ] ] $r.glob(Fserve,DirRecord.Count [ $+ [ %inct ] ] )
        inc %addct 1
        inc %inct 1
      }
      var %lct = 1
      while (%lct <= %addct) {
        w.glob Fserve [ DirRecord.Name [ $+ [ $calc(%lct + %ct) ] ] ] [ %HoldName [ $+ [ %lct ] ] ]
        w.glob Fserve [ DirRecord.Count [ $+ [ $calc(%lct + %ct) ] ] ] [ %HoldCount [ $+ [ %lct ] ] ]
        inc %lct 1
      }
      w.glob Fserve [ DirRecord.Name [ $+ [ %ct ] ] ] %FixedDir
      w.glob Fserve [ DirRecord.Count [ $+ [ %ct ] ] ] $r.rec(Directories,%stripFD)
      var %ct = 100
      return
    }
    inc %ct 1
  }
  unset %stripFD %FixedDir %tmpNickDirs %Holdname %holdcount %tmpDirCt
}
deflog { if $1 != $null { .write Invision\logs\Defense.log $time(dddd m/d/yyyy h:nntt) $chr(91) $+ $iNetwork $+ $chr(93) $1- } }
FSlog { if $1 != $null { .write Invision\logs\FServe.log $time(dddd m/d/yyyy h:nntt) $chr(91) $+ $iNetwork $+ $chr(93) $1- } }
xonotice { if $2 != $null { if $me isop $1 { onotice $1 $c(1) $+ ( $+ $c(2) $+ ØP§ $+ $c(1) $+  $1  $+ $c(2) $+ ØP§ $+ $c(1) $+ ) $+ : $2- } } } 
errlog { if $1 != $null { .write Invision\logs\Debug.log $time(dddd m/d/yyyy h:nntt) $chr(91) $+ $iNetwork $+ $chr(93) $1- } }
checksplit { 
  var %chk.ct = 1
  unset %chk.chtouse [ $+ [ $iNetwork ] ]
  while (%chk.ct <= $chan(0)) {
    if $nick($chan(%chk.ct),0) >= 3 && %chk.chtouse [ $+ [ $iNetwork ] ] == $null { set %chk.chtouse [ $+ [ $iNetwork ] ] $chan(%chk.ct) }
    if $nick($chan(%chk.ct),0) > $nick(%chk.chtouse [ $+ [ $iNetwork ] ] ,0) { set %chk.chtouse [ $+ [ $iNetwork ] ] $chan(%chk.ct) }
    inc %chk.ct 1
  }
  if %chk.chtouse [ $+ [ $iNetwork ] ] != $null { 
    if $nick(%chk.chtouse [ $+ [ $iNetwork ] ] ,0) <= $calc(%lastct. [ $+ [ %chk.chtouse [ $+ [ $iNetwork ] ] ] ] * .45) && $r.set(Invision,JmpOnSplit) == On { 
      aecho Weak side of split detected, jumping servers!
      server $server($server).group
    }
  }
  ; else {   }
} 
CCW { 
  if ($r.glob(Invision,UTRecord) == $null) || ($r.glob(Invision,UTRecord) <= $uptime(system,3)) { w.glob Invision UTRecord $uptime(system,3) }
  if %chkSplit [ $+ [ $iNetwork ] ] != 1 {
    var %ccw.chct = 1
    while (%ccw.chct <= $chan(0)) {
      set %lastct. [ $+ [ $chan(%ccw.chct) ] ] [ $+ [ $iNetwork ] ] $nick($chan(%ccw.chct),0)
      inc %ccw.chct 1
    }
  }
  var %dct = 1
  while (%dct <= $numtok(%fservenicks [ $+ [ $iNetwork ] ] ,44)) {
    if $chat($gettok(%fservenicks [ $+ [ $iNetwork ] ] ,%dct,44)) == $null { set %fservenicks [ $+ [ $iNetwork ] ] $remtok(%fservenicks [ $+ [ $iNetwork ] ] ,$gettok(%fservenicks [ $+ [ $iNetwork ] ] ,%dct,44),1,44) }
    inc %dct 1
  }
  if ($calc($ctime - %i.inputtime) > 1800) { set %i.inputtime $ctime | scid -a SaveAllSettings }
  if ($calc($ctime - %i.inputtime) > 600) { SaveAllGlobals }
  StartFSTimers
}
start.ip.srch {
  if $1 != $null {
    if %dnssearch [ $+ [ $iNetwork ] ] == $null {
      set %dnsstr [ $+ [ $iNetwork ] ] $1
      if $server == $null { aecho Cannot do an IP search when you are not connected to a server | goto leave }
      var %ipps.chantot = $chan(0)
      if %ipps.chantot == 0 { aecho Cannot do an IP search when you are not joined to any channels! | goto leave }
      aecho Searching for $c(2) $+ %dnsstr [ $+ [ $iNetwork ] ] $+ $c(1) $+ , this could take several minutes.
      if $r.set(Invision,SndOpt29) == On { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound39) }
      .timerSrchMsg $+ $iNetwork 20 60 stillscanning
      unset %ipfoundit [ $+ [ $iNetwork ] ]
      set %dnssearch [ $+ [ $iNetwork ] ] 1
      var %ipps.tmpct = 1
      while (%ipps.tmpct <= %ipps.chantot) {
        var %ipps.nicktot = $nick($chan(%ipps.tmpct),0)
        var %ipps.nickCt = 1
        while (%ipps.nickCT <= %ipps.nicktot) {
          .dns $nick($chan(%ipps.tmpct),%ipps.nickCT)
          inc %ipps.nickCT 1
        } 
        inc %ipps.tmpct 1 
      }
      :leave
    }
    else { aecho There is already a search in progress. Please wait until that search is finished before starting a new search. }
  }
  unset %ipps*
}
ipsrch {
  if $1 != $null {
    if $1 == NO { goto leave }
    if $1 == YES { set %ipfoundit [ $+ [ $iNetwork ] ] 1 | UserInfo Matched $c(2) $+ $3 $c(1) $+ to $c(2) $+ $2 | Userinfo Matched $c(2) $+ $3 $c(1) $+ to $c(2) $2 }
    :leave
  }
}
ipnotfound {
  .timerSrchMsg $+ $iNetwork off
  if %ipfoundit [ $+ [ $iNetwork ] ] == $null { Userinfo Unable to match that IP to anyone you are in a channel with. }
  else { aecho IP search completed. }
  unset %dnstr [ $+ [ $iNetwork ] ] %ipfoundit [ $+ [ $iNetwork ] ] %dnssearch [ $+ [ $iNetwork ] ]
}
stillscanning {
  aecho Searching IP's....
  if $r.set(Invision,SndOpt29) == On { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound31) }
}
AntiCamp {
  if $1 != $null {
    var %FSopenchk = 1
    while (%FSopenchk <= $fserv(0)) {
      if $fserv(%FSopenchk) == $1 { var %doit = 1 } 
      inc %FSopenchk 1
    }
    if %doit == 1 {
      .timer -o 1 32 .close -f $1
      if $2 != TIMEOUT {
        msg = $+ $1 Sorry but due to abuse, this file server uses an Anti-Camp Policy. Since you reached the maximum number of personal queues this session will automatically close in 30 seconds.
        if $r.set(Fserve,Logging) == On { FSlog AntiCamp Closed the Session to $address($1,5) as they had reached there personal max queues. }
      }
      else { 
        if $1 ison $comchan($1,1) && $server != $null { 
          notice $1 Sorry but due to abuse, this file server uses an Anti-Camp Policy. You have exceeded the time limit and this session will automatically close in 30 seconds. 
          if $r.set(Fserve,Logging) == On { FSlog AntiCamp Closed the Session to $address($1,5) as they had reached the maxium time allowed on the server. }
        }
      }
    }
    var %FSopenchk = 1
    while (%FSopenchk <= $chat(0)) {
      if $chat(%FSopenchk) == $1 { var %doit = 1 } 
      inc %FSopenchk 1
    }
    if %doit == 1 {
      .timer -o 1 32 .close -c $1
      if $2 != TIMEOUT {
        msg = $+ $1 Sorry but due to abuse, this file server uses an Anti-Camp Policy. Since you reached the maximum number of personal queues this session will automatically close in 30 seconds.
        if $r.set(Fserve,Logging) == On { FSlog AntiCamp Closed the Session to $address($1,5) as they had reached there personal max queues. }
      }
      else { 
        if $1 ison $comchan($1,1) && $server != $null { 
          notice $1 Sorry but due to abuse, this file server uses an Anti-Camp Policy. You have exceeded the time limit and this session will automatically close in 30 seconds. 
          if $r.set(Fserve,Logging) == On { FSlog AntiCamp Closed the Session to $address($1,5) as they had reached the maxium time allowed on the server. }
        }
      }
    }

  }
}
FSclose {
  if $1 != $null {
    var %FSkillchk = 1
    while (%FSkillchk <= $fserv(0)) {
      if $fserv(%FSkillchk) == $1 { var %doit = 1 } 
      inc %FSkillchk 1
    }
    if %doit == 1 {
      .close -f $1
    }
  }
}
pscan {
  if ($dialog(scanner)) { dialog -v scanner | return }
  dialog -md scanner scanner
}
scanner.reset {
  did -i scanner 16 $calc($did(scanner,16).lines + 1) 0 $str($chr(160),2) $+ :RESET - Closed all sockets
  sockclose scan_*
  did -o scanner 11 1 0
}
scanner.write {
  if ($did(scanner,21).text == $null) halt
  if ($did(Scanner,22).state == 1) .remove $did(scanner,21)
  var %i = 1
  var %fin = $did(16).lines
  while (%i > %fin) {
    write $did(scanner,21) $did(scanner,16,%i)
    inc %i 1
  }
}
scanner.scan {
  if ($dialog(scanner) == $null) goto abort
  if ($did(scanner,2).enabled == $false) goto end
  if ($did(scanner,25).state == 0) {
    set %stop.port $did(scanner,90).text
    did -o scanner 70 1 %port
    sockopen scan_ $+ $did(scanner,70).text $did(scanner,6).text $did(scanner,70).text
    did -o scanner 11 1 $calc($did(scanner,11).text + 1)
    inc %port 1
    if (%port > %stop.port) goto end
    if ($did(scanner,9).text == $null) { did -o scanner 9 1 20 }
    scanner.loop
    halt
  }
  else {
    set %stop.port $calc($lines($shortfn($mircdir\system\portscan\common-ports.txt)) - 1)
    did -o scanner 70 1 %port
    sockclose scan_ $+ %port
    sockopen scan_ $+ %port $did(scanner,6).text %port
    did -o scanner 11 1 $calc($did(scanner,11).text + 1)
    ; set %i $calc(%i + 1)
    inc %i 1
    set %port $gettok($read($shortfn($mircdir) $+ system\portscan\common-ports.txt,%i),1,32)
    if (%i == %stop.port) goto end
    if ($did(scanner,9).text == $null) { did -o scanner 9 1 20 }
    scanner.loop
    halt
  }
  :end
  if ($did(scanner,13).state == 1) scanner.reset
  did -e scanner 1
  did -b scanner 2
  did -a scanner 16 $str($chr(160),30) $+ -= Scan Completed =-
  did -o scanner 21 1 [ $shortfn($mircdir) $+ system\portscan\ $+ $did(Scanner,6).text $+ $chr(40) $+ $asctime(m-dd-yyyy) $+ @ $+ $asctime(h.ntt) $+ $chr(41) $+ .txt ]
  :abort
}
scanner.badip {
  did -i scanner 16 $calc($did(scanner,16).lines + 1) 0 $str($chr(160),2) $+ :IP:Invalid IP - SCAN HALTED
  did -f scanner 6
  did -b scanner 2
  did -e scanner 1
  halt
}
scanner.loop .timer -m 1 $did(scanner,9).text scanner.scan
trackurls {
  if %urlct [ $+ [ $iNetwork ] ] < $url(0) {
    set %urlct [ $+ [ $iNetwork ] ] $url(0)
    if $r.set(Invision,SndOpt31) == On { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound34) }
  }
}
Qwatch {
  queue.send
  if $timer(NOSSEND [ $+ [ $iNetwork ] ] ) == $null && %NoSSend [ $+ [ $iNetwork ] ] != $null { unset %NoSSend [ $+ [ $iNetwork ] ] }
}
icomchan {
  var %tmpCCHCT = 1
  while (%tmpCCHCT <= $comchan($1,0)) {
    var %comlist = %comlist $comchan($1,%tmpCCHCT)
    inc %tmpCCHCT 1
  }
  if %comlist == $null { var %comlist = None | return }
  if $2 == window || $r.set(Invision,isoWhois) == On {
    UserInfo Channels in common with $c(2) $+ $1 $+ $c(1) $+ : $c(2) $+ %comlist
  }
  else {
    aecho Channels in common with $c(2) $+ $1 $+ $c(1) $+ : $c(2) $+ %comlist
  }
  unset %tmpCCHCT %comlist
}
tdcc_grp {
  unset %grp
  if ($istok($1-,1,32) == $true) { set %grp %grp $+ ,40,41,45,46,50,51,52,53,54,60,65,66,67,68,69,70 }
  if ($istok($1-,2,32) == $true) { set %grp %grp $+ ,80,81,85,86,90,91,92,93,94,100,105,106,107,108,109,110 }
  if ($istok($1-,3,32) == $true) { set %grp %grp $+ ,120,121,125,126,130,131,132,133,134,140,145,146,147,148,149,150 }
  if ($istok($1-,4,32) == $true) { set %grp %grp $+ ,160,161,165,166,170,171,172,173,174,180,185,186,187,188,189,190 }
  if ($istok($1-,5,32) == $true) { set %grp %grp $+ ,200,201,205,206,210,211,212,213,214,220,225,226,227,228,229,230 }
  set -u0 %grp %grp
  return $gettok(%grp,1-,44)
}
clradj {
  if ($colour(back) == 0) { return $replace($1-,00,15) }
  if ($colour(back) == 1) { return $replace($1-,01,14) }
  if ($colour(back) == 2) { return $replace($1-,02,12) }
  if ($colour(back) == 3) { return $replace($1-,03,09) }
  if ($colour(back) == 4) { return $replace($1-,04,05) }
  if ($colour(back) == 5) { return $replace($1-,05,04) }
  if ($colour(back) == 6) { return $replace($1-,06,13) }
  if ($colour(back) == 7) { return $replace($1-,07,08) }
  if ($colour(back) == 8) { return $replace($1-,08,07) }
  if ($colour(back) == 9) { return $replace($1-,09,03) }
  if ($colour(back) == 10) { return $replace($1-,10,09) }
  if ($colour(back) == 11) { return $replace($1-,11,12) }
  if ($colour(back) == 12) { return $replace($1-,12,11) }
  if ($colour(back) == 13) { return $replace($1-,13,06) }
  if ($colour(back) == 14) { return $replace($1-,14,00) }
  if ($colour(back) == 15) { return $replace($1-,15,01) }
}
Visufix { 
  if ($r.set(Invision,Visufix) != On) { return $1- }
  ; ****** Handle if Black Background is being used ******
  if ($colour(back) == 1) {
    var %bc = $colour(back) + 32 , %nc = %bc + 14
    return $replace($replace($replace($replace($replace($1-,10,50,11,51,12,52,13,53,14,54,15,55,02,62,03,63,04,64,05,65,06,66,07,67,08,68,09,69),1,14),01,14),50,10,51,11,52,12,53,13,54,14,55,15),62,02,63,03,64,04,65,05,66,06,67,07,68,08,69,09)
  }
  ; ****** Handle if White Background is being used ******
  elseif ($colour(back) == 0) {
    var %bc = $colour(back) + 32 , %nc = %bc + 14 
    return $replace($replace($replace($replace($replace($1-,10,50,11,51,12,52,13,53,14,54,15,55,02,62,03,63,04,64,05,65,06,66,07,67,08,68,09,69),0,14),00,14),50,10,51,11,52,12,53,13,54,14,55,15),62,02,63,03,64,04,65,05,66,06,67,07,68,08,69,09)
  }
  else { 
    var %x = $colour(back)
    var %y = $calc(%x - 1) 
    return $replace($1-, [ $+ [ %x ] ] ,  [ $+ [ %y ] ] , 0 [ $+ [ %x ] ] , 0 [ $+ [ %y ] ] )
  }
}
SoundQ {
  if $1 != $null {
    if (($1 != %LastSound) && ($away != $true) && ($mp3isplaying != $true) && (%SoundKill [ $+ [ $iNetwork ] ] != 1)) || ($1- == $shortfn($mircdir) $+ $r.glob(Themes,Sound28)) || ($1- == $shortfn($mircdir) $+ $r.glob(Themes,Sound41)) && ($isfile($1-)) {
      .splay -q $1-
      set -u15 %LastSound $1
    }
  }
}
mp3Q {
  if $1 != $null {
    if (($1 != %LastSound) && ($away != $true) && (%SoundKill [ $+ [ $iNetwork ] ] != 1) && ($isfile($1-))) {
      .splay -pq $1-
      set -u15 %LastSound $1
    }
  }
}
mp3play {
  if $1 != $null {
    mp3stop
    if $r.glob(Invision,Winamp) == On {
      %dummy = $dll(invision\winamp\amp_in.dll,Play,$replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))
      set %mp3nplay $left($nopath($1-),-4)
      if (OK !isin %dummy) { aecho Failed to play through Winamp, check to make sure you have the Winamp Plugin Directory properly set in Main Settings > Adv Tab section and restart Invision. | Halt }
    }
    elseif $r.glob(Invision,amip) == On {
      if $appactive { .timer -o 1 1 .showmirc -s }
      if $exists($shortfn($r.glob(Invision,WinampDir) $+ Studio.exe)) {
        run -n $shortfn($r.glob(Invision,WinampDir) $+ Studio.exe) " $+ $replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)) $+ "
      }
      else { .timer -io 1 1 run -n $shortfn($r.glob(Invision,WinampDir) $+ winamp.exe) " $+ $replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)) $+ " }
      set %mp3nplay $left($nopath($1-),-4)
    }
    else {
      if $left($1-,2) != \\ {
        splay -p $shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))
      }
      else {
        .copy -o $shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44))) $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \mp3nplay.mp3
        set %mp3nplay $left($nopath($1-),-4)
        .timer -o 1 1 splay $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \mp3nplay.mp3 
      }
    }
    if ($r.set(mp3serv,AdPlay) == On) && ($r.set(mp3serv,Status) == On) && ($r.set(mp3serv,Listen) == On) && ($r.set(mp3serv,Pause) != On) { .timermp3playad 1 2 mp3AdvertisePlay }
    if ($server != $null) && ($r.glob(Invision,Amip) != On) { .timer -o 1 1 scid -a mp3brag }
  }
}
mp3Brag {
  var %ct = 1
  while (%ct <= $chan(0)) {
    if $ismp3brag($chan(%ct)) {
      var %artist = $getid3(artist), %album = $getid3(album), %year = $getid3(year), %genre = $getid3(genre)
      var %imp3.l = $calc($sound($insong.fname).length / 1000)
      var %imp3.l.h = $int($calc(%imp3.l / 60 / 60))
      var %imp3.l.m = $int($calc(%imp3.l / 60 - (%imp3.l.h * 60)))
      var %imp3.l.s = $int($calc(%imp3.l - (%imp3.l.h * 60 * 60) - (%imp3.l.m * 60)))
      if ($r.set(mp3serv,VerboseAdDisplay) != On) { if ($mp3isplaying == $true) { describe $chan(%ct) $c(1) $+ $r.glob(Invision,mp3announcement) $c(2) $+ $mp3play.title $+ $c(1) $+ , Length: $c(2) $+ $iif($base(%imp3.l.h,10,10,2) $+ : != 00:,$v1) $+ $base(%imp3.l.m,10,10,2) $+ : $+ $base(%imp3.l.s,10,10,2)  $ilogo } }
      else { if ($mp3isplaying == $true) {
      describe $chan(%ct) $c(1) $+ $r.glob(Invision,mp3announcement) $c(2) $+ $iif($getid3(title),$v1,$mp3play.title) $iif(%artist,$c(1) $+ by $+ $c(2) %artist) $iif(%album,$c(1) $+ Album: $+ $c(2) %album) $iif(%year,$c(1) $+ ( $+ $c(2) $+ %year $+ $c(1) $+ )) $iif(%genre,$c(1) $+ Genre: $+ $c(2) %genre) $c(1) $+ Length: $c(2) $+ $iif($base(%imp3.l.h,10,10,2) $+ : != 00:,$v1) $+ $base(%imp3.l.m,10,10,2) $+ : $+ $base(%imp3.l.s,10,10,2)  $ilogo } }
    } 
    inc %ct 1
  }
}
mp3BragAdd {
  if $isChannel($1) {
    w.glob mp3brag $1 $addtok($r.glob(mp3brag,$1),$iNetwork,32)
  }
}
mp3BragDel {
  if $isChannel($1) {
    if $remtok($r.glob(mp3brag,$1),$iNetwork,1,32) != $null {
      w.glob mp3brag $1 $remtok($r.glob(mp3brag,$1),$iNetwork,1,32)
    }
    else { d.glob mp3Brag $1 }
  }
}
ismp3Brag {
  if $isChannel($1) {
    if $istok($r.glob(mp3brag,$1),$iNetwork,32) { return $true }
  }
  return $false
}
mp3AdvertisePlay {
  if $mp3isplaying == $true { 
    admsg $allchk($r.set(mp3serv,Channels)) 1 [ $mp3play.ad ]
    admsg $allchk($r.set(mp3serv,Channels)) 1 [ $mp3get.ad ]
  }
}
mp3play.title {
  if $r.glob(Invision,Winamp) == On {
    return $replace($iif($mp3filename != mp3nplay.mp3,$replace($left($mp3filename,-4),_,$chr(32)),%mp3nplay),$chr(63),$chr(32),$chr(34),$chr(44))
  }
  if $r.glob(Invision,amip) == On {
    return $replace($iif($mp3filename != mp3nplay.mp3,$replace($left($mp3filename,-4),_,$chr(32)),%mp3nplay),$chr(63),$chr(32),$chr(34),$chr(44))
  }
  else {
    if $mp3($mp3PathFilename).title != $null { return $iif($mp3($mp3PathFilename).artist != $null,$mp3($mp3PathFilename).artist -) $mp3($mp3PathFilename).title }
    else { return $replace($iif($mp3filename != mp3nplay.mp3,$replace($left($mp3filename,-4),_,$chr(32)),%mp3nplay),$chr(63),$chr(32),$chr(34),$chr(44)) }
  }
}
mp3play.ad { return $c(1) $+ I'm listening to $c(2) $+ $mp3play.title }
mp3get.ad { return $c(1) $+ To get it type $c(2) $+ $mp3serv.ad.trigger $iif($mp3filename != mp3nplay.mp3,$left($mp3filename,-4),%mp3nplay) $+ .mp3 $c(1) $+ in the channel.  $ilogo }
mp3dirplay {
  if %mp3dpdir != $null {
    var %safe = 1
    :start
    set %RandCT 1
    set %mp3Rand $rand(1,$findfile(%mp3dpdir,*.mp3,0))
    if (%mp3Rand == %mp3LastRand) && (%randCt <= 4) { inc %safe 1 | if %safe <= 10 { goto start } }
    set %mp3lastrand %mp3rand
    set %mp3toplay $replace($findfile(%mp3dpdir,*.mp3,%mp3rand),$chr(32),$chr(63),$chr(44),$chr(34))
    if $exists($shortfn($replace(%mp3toplay,$chr(63),$chr(32),$chr(34),$chr(44)))) == $true { mp3play %mp3toplay }
    set %mp3resume Pause mp3 playback 
    if ($r.glob(Invision,AMIP) != On) { .timer -o 1 2  mp3info %mp3toplay }
    mp3historyADD %mp3toplay
    unset %RandCT %mp3Rand
  }
}
mp3info { 
  if $1 != $null {
    if ($r.glob(Invision,AMIP) == On) {
      var %tmpAlbum = $iif($mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).Album != $null,$mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).Album,n/a)
      var %tmpBitrate = $dde(mPlug,var_br,"") $+ kbs
      var %tmpLength = $int($dde(mPlug,var_min,"")) minutes and $int($dde(mPlug,var_sec,"")) seconds
      var %tmpComment = $iif($mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).comment != $null,$mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).comment,n/a)
    }
    else {
      if $mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).artist == $null { return }
      var %tmpAlbum = $iif($mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).Album != $null,$mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).Album,n/a)
      var %tmpBitrate = $iif($mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).bitrate != $null,$mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).bitrate,n/a) $+ kbs
      var %tmpLength = $iif($mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).length != $null,$mp3len($file($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).size,$mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).bitrate),n/a)
      var %tmpComment = $iif($mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).comment != $null,$mp3($shortfn($replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)))).comment,n/a)
    }
    if $r.glob(Invision,mp3ExtInfo) == Active {
      echo -a $c(1) $+ > Now Playing $c(2) $+ $iif($getid3(title),$v1,$mp3play.title) $iif($getid3(artist),$c(1) $+ by $+ $c(2) $getid3(artist))
      echo -a $c(1) $+ > Album: $c(2) $+ $iif($getid3(album),$v1,%tmpAlbum) $iif($getid3(year),$+($c(1),$chr(40),$c(2),$getid3(year),$c(1),$chr(41))) $c(1) Bitrate: $c(2) $+ %tmpBitrate $c(1)  Length: $c(2) $+ %tmpLength
      if ( %tmpComment != n/a ) { echo -a $c(1) $+ > Comment: $c(2) $+ %tmpComment }
    }
    else {
      echo -s $c(1) $+ > Now Playing $c(2) $+ $iif($getid3(title),$v1,$mp3play.title) $iif($getid3(artist),$c(1) $+ by $+ $c(2) $getid3(artist))
      echo -s $c(1) $+ > Album: $c(2) $+ $iif($getid3(album),$v1,%tmpAlbum) $iif($getid3(year),$+($c(1),$chr(40),$c(2),$getid3(year),$c(1),$chr(41))) $c(1) Bitrate: $c(2) $+ %tmpBitrate $c(1)  Length: $c(2) $+ %tmpLength
      if ( %tmpComment != n/a ) {  echo -s $c(1) $+ > Comment: $c(2) $+ %tmpComment }
    }
    .tbar
  }
}
mp3len {
  if $1 != $null {
    var %mp3tmpnum = $round($calc((($1 * 8)  / ($2 * 1000)) / 60),2)
    var %mp3lenMIN = $gettok(%mp3tmpnum,1,46)
    var %mp3lenSEC = $gettok(%mp3tmpnum,2,46)
    if $len(%mp3lenSEC) == 1 { var %mp3lenSEC = $calc(%mp3lenSEC * 10) }
    var %mp3lenSEC = $int($calc(%mp3lenSEC * 0.6))
    return $iif(%mp3lenMIN != $null,%mp3lenMIN minutes) $iif(%mp3lenSEC != $null,%mp3lenSEC seconds.) 
  }
}
mp3historyADD {
  if $1 != $null && ($1- != %mp3history.1) {
    var %mp3HistCT = 20
    while (%mp3histct >= 2) {
      set %mp3history. [ $+ [ %mp3histct ] ] %mp3history. [ $+ [ $calc(%mp3histct - 1) ] ] 
      dec %mp3histct 1
    }
    set %mp3History.1 $1-
  }
}
mp3HistoryGET {
  if ($mp3isplaying != $true) { var %mp3TempHold = %mp3History.1 } | else { var %mp3TempHold = %mp3History.2 }
  var %mp3HistCT = 1
  while (%mp3HistCT <= 19) {
    set %mp3history. [ $+ [ %mp3histct ] ] %mp3history. [ $+ [ $calc(%mp3histct + 1) ] ] 
    inc %mp3histct 1
  }
  return %mp3TempHold
}
mp3Maintain {
  if %mp3dirplay == 1 {
    if $mp3isplaying == $false { mp3dirplay }
  }
  else { .timermp3Player off }
}
mp3isplaying {
  if ($r.glob(Invision,amip) == On) {
    if ($dde(mPlug,var_playing,"") == 1) { return $true }
  }
  elseif ($r.glob(Invision,Winamp) == On) {
    if $gettok($dll(invision\winamp\amp_in.dll,CurrentMusic,status),2,32) == playing || $gettok($dll(invision\winamp\amp_in.dll,CurrentMusic,status),2,32) == paused { Return $true }
  }
  else { if $inmp3 { return $true } }
  return $false
}
mp3pause {
  if $r.set(mp3serv,Pause) == On {
    w.set mp3serv Pause Off 
    Set %mp3pause [ $+ [ $iNetwork ] ] Pause
    if %mp3pOldTmr [ $+ [ $iNetwork ] ] != $null { .timermp3serv $+ $iNetwork -o 0 $calc( [ $r.set(mp3serv,AdDelay) ] * 60) mp3serv.ad }
    queue.send
    aecho The mp3 Server has been resumed
    background -h $r.glob(Themes,Switchbar1)
  }
  else {
    w.set mp3serv Pause On
    Set %mp3pause [ $+ [ $iNetwork ] ] Resume
    set %mp3pOldTmr [ $+ [ $iNetwork ] ] $timer(mp3serv [ $+ [ $iNetwork ] ] )
    .timermp3serv $+ $iNetwork off
    aecho The mp3 Server has been paused
    background -h $r.glob(Themes,Switchbar2)
  }
}
mp3Stop {
  if $r.glob(Invision,Winamp) == On {
    %dummy = $dll(invision\winamp\amp_in.dll,Stop,.)
    return
  }
  elseif $r.glob(Invision,amip) == On {
    dde mPlug control stop
    return
  }
  else {
    splay STOP
    return
  }
}
mp3PausePlay {
  if $r.glob(Invision,Winamp) == On {
    %dummy = $dll(invision\winamp\amp_in.dll,CurrentMusic,pause)
  } 
  elseif ($r.glob(Invision,amip) == On) {
    dde mPlug control pause
  }
  else {
    if ($inwave || $insong || $inmp3) { splay PAUSE }
  }
}
mp3UNPausePlay {
  if $r.glob(Invision,Winamp) == On {
    %dummy = $dll(invision\winamp\amp_in.dll,CurrentMusic,unpause)
  } 
  elseif $r.glob(Invision,amip) == On {
    dde mPlug control pause
  } 
  else {
    if ($inwave || $insong || $inmp3) { splay RESUME }
  }
}
m {
  if $mp3isplaying == $true {
    echo -a 12mp3 METER $mp3meter
  }
}
mp3meter {
  if $mp3isplaying == $true {
    if ($r.glob(Invision,WinAmp) == On) {
      var %mp3meterFactor = $calc(20 / $walenraw)
      var %mp3meterpos = $int($calc($waposraw * %mp3meterFactor))
      var %mp3meterlen = $calc(20 - %mp3meterPos)
    }
    elseif ($r.glob(Invision,amip) == On) {
      var %iamipsec = $calc($dde(mPlug,var_min,"") * 60 + $dde(mPlug,var_sec,""))
      var %mp3meterFactor = $calc(20 / %iamipsec)
      var %mp3meterpos = $int($calc($dde(mPlug,var_psec,"") * %mp3meterFactor))
      var %mp3meterlen = $calc(20 - %mp3meterPos)
    }
    else {
      var %mp3meterFactor = $calc(20 / $sound($insong.fname).length)
      var %mp3meterpos = $int($calc($insong.pos * %mp3meterFactor))
      var %mp3meterlen = $calc(20 - %mp3meterPos)
    }
    if ($r.set(mp3serv,GraphicalProgress) == Off) {
      var %imp3.p = $calc($insong.pos / 1000)
      var %imp3.l = $calc($sound($insong.fname).length / 1000)
      var %imp3.p.h = $int($calc(%imp3.p / 60 / 60))
      var %imp3.p.m = $int($calc(%imp3.p / 60 - (%imp3.p.h * 60)))
      var %imp3.p.s = $int($calc(%imp3.p - (%imp3.p.h * 60 * 60) - (%imp3.p.m * 60)))
      var %imp3.l.h = $int($calc(%imp3.l / 60 / 60))
      var %imp3.l.m = $int($calc(%imp3.l / 60 - (%imp3.l.h * 60)))
      var %imp3.l.s = $int($calc(%imp3.l - (%imp3.l.h * 60 * 60) - (%imp3.l.m * 60)))
      return $c(2) $+ $iif($base(%imp3.p.h,10,10,2) $+ : != 00:,%$v1) $+ $base(%imp3.p.m,10,10,2) $+ : $+ $base(%imp3.p.s,10,10,2) $+ $c(1) $+ / $+ $c(2) $+ $iif($base(%imp3.l.h,10,10,2) $+ : != 00:,$v1) $+ $base(%imp3.l.m,10,10,2) $+ : $+ $base(%imp3.l.s,10,10,2)
    }
    else { return  $+ $r.set(Colors,Color.2) $+ $chr(44) $+ $r.set(Colors,Color.2) $+ $str(.,%mp3meterpos) $+  $+ $r.set(Colors,Color.1) $+ $chr(44) $+ $r.set(Colors,Color.1) $+ $str(.,%mp3meterlen) $+  }
  }
}
mp3wapos {
  var %totsec = $round($int($calc($gettok($dll(invision\winamp\amp_in.dll,CurrentMusic,position),2,32) / 1000)),2)
  var %length = $round($int($calc($gettok($dll(invision\winamp\amp_in.dll,CurrentMusic,length),2,32) / 1000)),2)
  if $r.glob(Invision,ReverseTime) == On { var %totsec = $calc(%length - %totsec) }
  var %totmin = $int($calc(%totsec / 60))
  var %leftsec = $calc(%totsec - $calc(%totmin * 60))

  if $len(%leftsec) == 0 { var %leftsec = 00 }
  if $len(%leftsec) == 1 { var %leftsec = 0 $+ %leftsec }
  if %totsec = 0 {
    return 
  }
  else {
    return %totmin $+ : $+ %leftsec
  }
}
mp3digpos {
  if $mp3isplaying {
    if ($r.glob(Invision,Winamp) == On) { return $mp3wapos }
    elseif ($r.glob(Invision,amip) == On) { 
      if $r.glob(Invision,ReverseTime) == On {
        var %totsecleft = $calc($dde(mPlug,var_psec,"") - $calc($dde(mPlug,var_min,"") * 60 + $dde(mPlug,var_sec,"")))
        var %totmin = $int($calc(%totsecleft / 60))
        var %leftsec = $calc(%totsecleft - $calc(%totmin * 60))
        var %leftsec = $remove(%leftsec,-) 
        if $len(%leftsec) == 0 { var %leftsec = 00 }
        if $len(%leftsec) == 1 { var %leftsec = 0 $+ %leftsec }
        if %totsecleft = 0 {
          return 
        }
        else {
          return $remove(%totmin,-) $+ : $+ %leftsec
        }
      }
      else {
        return $dde(mPlug,var_pm,"") $+ : $+ $dde(mPlug,var_ps,"") 
      }
    }
    else {
      var %totsec = $int($calc($inmp3.pos / 1000))
      var %length = $int($calc($sound($insong.fname).length / 1000))
      if $r.glob(Invision,ReverseTime) == On { var %totsec = $calc(%length - %totsec) }
      var %totmin = $int($calc(%totsec / 60))
      var %leftsec = $calc(%totsec - $calc(%totmin * 60))

      if $len(%leftsec) == 0 { var %leftsec = 00 }
      if $len(%leftsec) == 1 { var %leftsec = 0 $+ %leftsec }
      if %totsec = 0 {
        return 
      }
      else {
        return %totmin $+ : $+ %leftsec
      }
    }
  }
}
mp3reversetime {
  if $r.glob(Invision,ReverseTime) == On { w.glob Invision ReverseTime Off } 
  else { w.glob Invision ReverseTime On }
}
mp3walen {
  var %totsec = $round($int($calc($gettok($dll(invision\winamp\amp_in.dll,CurrentMusic,length),2,32) / 1000)),2)
  var %totmin = $int($calc(%totsec / 60))
  var %leftsec = $calc(%totsec - $calc(%totmin * 60))

  if $len(%leftsec) == 0 { var %leftsec = 00 }
  if $len(%leftsec) == 1 { var %leftsec = 0 $+ %leftsec }
  return %totmin $+ : $+ %leftsec
}
walenraw { return $gettok($dll(invision\winamp\amp_in.dll,CurrentMusic,length),2,32) }
waposraw { return $gettok($dll(invision\winamp\amp_in.dll,CurrentMusic,position),2,32) } 
waprogress { return $int($calc(($waposraw / $walenraw) * 100)) }
mp3Filename {
  if ($r.glob(Invision,WinAmp) == On) {
    return $iif(($left($nopath($gettok($dll(invision\winamp\amp_in.dll,CurrentMusic,filename),2-,32)),3) != WAE),$nopath($gettok($dll(invision\winamp\amp_in.dll,CurrentMusic,filename),2-,32)))
  }
  elseif ($r.glob(Invision,amip) == On) {
    return $nopath($dde(mPlug,var_fn,""))
  }
  else {
    return $nopath($longfn($inmp3.fname))
  }
}
mp3pathFilename {
  if $r.glob(Invision,WinAmp) == On {
    return $gettok($dll(invision\winamp\amp_in.dll,CurrentMusic,filename),2-,32)
  }
  elseif $r.glob(Invision,amip) == On {
    return $dde(mPlug,var_fn,"")
  }
  else {
    return $longfn($inmp3.fname)
  }
}
mp3annouceset {
  w.glob Invision mp3announcement $remove($input(Enter what you would like the mp3 announcement to appear as. The default is ''is listening to'' so the output would look something like ''cRYOa is listening to someartist - somesong'' when an mp3 is played,eq,Set mp3 Announcement,$iif($r.glob(Invision,mp3announcement) != $null,$r.glob(Invision,mp3announcement),is listening to)),$chr(44))
}
CustKB {
  if $2 != $null {
    unset %KBuseTime %KBtime %KBmsg
    set %KBtime $$?="Enter the amount of time for the ban. ie: 30s for 30 seconds, 15m for 15 minutes, etc.. (default is minutes)"
    :start
    if $right(%KBtime,1) == s && %KBtime != s { 
      set %KBuseTime $left(%KBtime,-1)
    }
    else {
      if $right(%KBtime,1) == m && %KBtime != m { 
        set %KBuseTime $calc($left(%KBtime,-1) * 60)
      }
      if $right(%KBtime,1) isnum {
        set %KBuseTime $calc(%KBtime * 60)
      }
    }
    if %KBuseTime == $null { set %KBtime $$?="The time you specified is invalid. Please enter a valid time for the ban. ie: 30s for 30 seconds, 15m for 15 minutes, etc.. (default is minutes)" | goto start } 
    set %KBmsg $?="Please enter a msg for the kick."
    if ($2 != $null) && ($1 != $null) { mode $1 +b $address($2,$r.glob(Invision,DefaultBan)) }
    .timer -o 1 %KBuseTime mode $1 -b $address($2,$r.glob(Invision,DefaultBan))
    if $2 ison $1 { kick $1 $2 %KBmsg }
  } 
  :leave
}
OpenFxP {
  if $r.set(Invision,Fxp) == On { 
    if ($dialog(InvisFxp).title == $null) { 
      set %Fxp.list [ $+ [ $iNetwork ] ] 0 
      set %Fxp.nick [ $+ [ $iNetwork ] ] $1 
      set %Fxp.ititle [ $+ [ $iNetwork ] ] Connected to $1 on $iNetwork
      .timerFXP $+ $iNetwork 1 0 sockclose InvisFxP $chr(124) sockopen InvisFxp $longip($2) $3 
      InvisFxp 
      unset %altFxPflag [ $+ [ $iNetwork ] ] %FxPopenFlag [ $+ [ $iNetwork ] ]
      .timerFSEA $+ $iNetwork off | .timerFSEB $+ $iNetwork off
      if ($r.set(Invision,SndOpt21) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound22) }
    } 
  }
}
OpenBOT {
  secho OPening sock for dcc bot conn on $longip($2) $3
  .timer 1 0 socklisten[ BOT- [ $+ [ $1 ] ] ] 2424
  set %BOTdccs $addtok(%BOTdccs,$1,44)
  set %BOTtry $1
}
someid {
  var %ch = 67
  while (%ch <= 90) {
    if $disk($chr(%ch)) == $true {
      if $disk($chr(%ch)).label != $null {
        return $disk($chr(%ch)).label
      }
    }
    inc %ch 1
  }
  return NOTHING
}
z3d { if $1 != $null { .say $crykeyz($1-) } }
crykeyz { var %tmpstr = 15-<[0,9 | var %tmpcnt = 1 | %incoming = $1-
  :start
  if ($mid(%incoming,%tmpcnt,1) != $chr(32)) { %tmpstr = %tmpstr $+ 0(1 $+ $mid(%incoming,%tmpcnt,1) $+ 3) } | else { %tmpstr = %tmpstr $+ 9,9.. }
  inc %tmpcnt 1
  if %tmpcnt < $calc($len(%incoming) +1) { goto start }
  return %tmpstr $+ 15]>-
} 
o3d { if $1 != $null { .say $crykeyo($1-) } }
crykeyo { var %tmpstr = 15-<[15,4 | var %tmpcnt = 1 | %incoming = $1-
  :start
  if ($mid(%incoming,%tmpcnt,1) != $chr(32)) { %tmpstr = %tmpstr $+ 15(1 $+ $mid(%incoming,%tmpcnt,1) $+ 5) } | else { %tmpstr = %tmpstr $+ 4,4.. }
  inc %tmpcnt 1
  if %tmpcnt < $calc($len(%incoming) +1) { goto start }
  return %tmpstr $+ 15]>-
}
n3d { if $1 != $null { .say $crykeyn($1-) } }
crykeyn { var %tmpstr = 15-<[15,12 | var %tmpcnt = 1 | %incoming = $1-
  :start
  if ($mid(%incoming,%tmpcnt,1) != $chr(32)) { %tmpstr = %tmpstr $+ 15(0 $+ $mid(%incoming,%tmpcnt,1) $+ 2) } | else { %tmpstr = %tmpstr $+ 12,12.. }
  inc %tmpcnt 1
  if %tmpcnt < $calc($len(%incoming) +1) { goto start }
  return %tmpstr $+ 15]>-
}
p3d { if $1 != $null { .say $crykeyp($1-) } }
crykeyp { var %tmpstr = 15-<[15,13 | var %tmpcnt = 1 | %incoming = $1-
  :start
  if ($mid(%incoming,%tmpcnt,1) != $chr(32)) { %tmpstr = %tmpstr $+ 15(0 $+ $mid(%incoming,%tmpcnt,1) $+ 6) } | else { %tmpstr = %tmpstr $+ 13,13.. }
  inc %tmpcnt 1
  if %tmpcnt < $calc($len(%incoming) +1) { goto start }
  return %tmpstr $+ 15]>-
}
t3d { if $1 != $null { .say $crykeyt($1-) } }
crykeyt { var %tmpstr = 15-<[0,8 | var %tmpcnt = 1 | %incoming = $1-
  :start
  if ($mid(%incoming,%tmpcnt,1) != $chr(32)) { %tmpstr = %tmpstr $+ 0(1 $+ $mid(%incoming,%tmpcnt,1) $+ 14) } | else { %tmpstr = %tmpstr $+ 8,8.. }
  inc %tmpcnt 1
  if %tmpcnt < $calc($len(%incoming) +1) { goto start }
  return %tmpstr $+ 15]>-
}
b3d { if $1 != $null { .say $crykeyb($1-) } }
crykeyb { var %tmpstr = 15-<[15,10 | var %tmpcnt = 1 | %incoming = $1-
  :start
  if ($mid(%incoming,%tmpcnt,1) != $chr(32)) { %tmpstr = %tmpstr $+ 15(8 $+ $mid(%incoming,%tmpcnt,1) $+ 2) } | else { %tmpstr = %tmpstr $+ 10,10.. }
  inc %tmpcnt 1
  if %tmpcnt < $calc($len(%incoming) +1) { goto start }
  return %tmpstr $+ 15]>-
}
glitter { return -15-14-15--15-14-15--15-14-15--15-14-15--15-14-15--15-14-15-  $+ $1- -15-14-15--15-14-15--15-14-15--15-14-15--15-14-15--15-14-15- }
gltr { say $glitter($1-) }
ChanCheck {
  if $1 != $null {
    var %tmpCCHCT = 1
    while (%tmpCCHCT <= $comchan($1,0)) {
      var %comlist = %comlist $comchan($1,%tmpCCHCT)
      inc %tmpCCHCT 1
    }
    if %comlist != $null { 
      if $r.set(Fserve,Channels) == All { return $true }
      var %tmpCLct = 1
      while (%tmpCLct <= $numtok(%comlist,32)) {
        if $istok($r.set(Fserve,Channels),$gettok(%comlist,%tmpCLct,32),44) { var %CLflag = 1 }
        inc %tmpCLct 1
      }
      if %CLflag == 1 { return $true }
      else { return $false }
    }
    else { return $false }
  }
}
XDCCChanCheck {
  if $1 != $null {
    var %tmpCCHCT = 1
    while (%tmpCCHCT <= $comchan($1,0)) {
      var %comlist = %comlist $comchan($1,%tmpCCHCT)
      inc %tmpCCHCT 1
    }
    if %comlist != $null { 
      if $r.set(XDCC,Channels) == All { return $true }
      var %tmpCLct = 1
      while (%tmpCLct <= $numtok(%comlist,32)) {
        if $istok($r.set(XDCC,Channels),$gettok(%comlist,%tmpCLct,32),44) { var %CLflag = 1 }
        inc %tmpCLct 1
      }
      if %CLflag == 1 { return $true }
      else { return $false }
    }
    else { return $false }
  }
}
FTPChanCheck {
  ; ****************  FTPChanCheck( <nick>  , <FTP Ad Number 1-5> )
  if ($2 isnum 1-5) {
    var %tmpCCHCT = 1
    while (%tmpCCHCT <= $comchan($1,0)) {
      var %comlist = %comlist $comchan($1,%tmpCCHCT)
      inc %tmpCCHCT 1
    }
    if %comlist != $null { 
      if $r.set(FTP. [ $+ [ $2 ] ] ,Channels) == All { return $true }
      var %tmpCLct = 1
      while (%tmpCLct <= $numtok(%comlist,32)) {
        if $istok($r.set(FTP. [ $+ [ $2 ] ] ,Channels),$gettok(%comlist,%tmpCLct,32),44) { var %CLflag = 1 }
        inc %tmpCLct 1
      }
      if %CLflag == 1 { return $true }
      else { return $false }
    }
    else { return $false }
  }
  return $false
}
advise.default {
  return $nick $+ $c(1) $+ , have you tried the $c(2) $+ @find <text> $c(1) $+ in the channel to search the file servers?
}
OPchk {
  if $2 != $null {
    if $1 == All { var %tmpChans = $getmychans } | else { var %tmpChans = $1 }
    var %OpchkCT = 1
    while (%OPchkCT <= $numtok($1,44)) {
      if ($2 isop $gettok(%tmpChans,%OPchkCT,44)) { return $true }
      inc %OPchkCT 1
    }
    return $false
  }
}
Vchk {
  if $2 != $null {
    if $1 == All { var %tmpChans = $getmychans } | else { var %tmpChans = $1 }
    var %VchkCT = 1
    while (%VchkCT <= $numtok($1,44)) {
      if ($2 isvo $gettok(%tmpChans,%VchkCT,44)) { return $true }
      inc %VchkCT 1
    }
    return $false
  }
}
getmychans {
  var %glistCT = 1
  if $chan(0) > 0 {
    while (%glistCT <= $chan(0)) {
      var %getlist = %getlist $+ $chan(%glistCT) $+ $chr(44)
      inc %glistCT 1
    }
    var %getlist = $left(%getlist,-1)
    return %getlist
    else { return NOCHANS }
  }
}
nick {
  if $1 != $null {
    !nick $1
    w.set Personal.Info Nick $1
  }
}
USDdays { return $int($calc(((($ctime - $r.glob(Invision,USD)) / 60) / 60) / 24)) }
resetUSD { w.glob Invision USD $ctime }
setHome { if $1 != $null { w.set Personal.Info HomeChannel $1 } }
AcroAction {
  if $1 != $null { 
    if $r.glob(Invision,Acroman) == On { 
      var %ct = 1
      var %Astr = $1-
      var %tot = $hget(acros,0).item
      while (%ct <= %tot) {
        var %inp = $hget(acros,%ct).item 
        var %out = $hget(acros,%inp)
        var %Astr = $reptok(%Astr,%inp,%out $+ ,1,32) 
        var %Astr = $reptok(%Astr,%inp,%out $+ ,2,32) 
        var %Astr = $reptok(%Astr,%inp,%out $+ ,3,32) 
        inc %ct 1
      }
      return $iif(%Astr != $null,%Astr,$1-)
    }
    else { return $1- }
  }
}
acrotable {
  var %ct = 1
  var %tot = $iif($r.acro(General,Count) != $null,$r.acro(General,Count),0)
  hfree -w acros
  hmake acros 50
  while (%ct <= %tot) {
    var %inp = $r.acro(Inputs,N [ $+ [ %ct ] ] ) 
    var %out = $r.acro(Outputs,N [ $+ [ %ct ] ] ) 
    var %type = $r.acro(Types,N [ $+ [ %ct ] ] )
    hadd acros %inp %out
    inc %ct 1
  }
}
acro { aecho $acroaction($1-) }
Enforcer {
  if $1 != $null {
    var %chans = $r.set(Enforcer,Channels)
    var %ct = 1
    while (%ct <= $numtok(%chans,44)) {
      if $me !ison $gettok(%chans,%ct,44) { return }
      inc %ct 1 
    }
    var %ct = 1
    var %chtot = 0
    while (%ct <= $numtok(%chans,44)) {
      if $1 ison $gettok(%chans,%ct,44) { inc %chtot 1 }
      inc %ct 1 
    }
    if ($r.set(Enforcer,Mode) == INCOM && %chtot == $numtok(%chans,44)) || ($r.set(Enforcer,Mode) != INCOM && %chtot != $numtok(%chans,44)) { 
      .notice $1 [ [ $r.set(Enforcer,Msg) ] ]
      if $r.set(enforcer,kick) == On {
        var %ct = 1
        while (%ct <= $numtok(%chans,44)) {
          if $1 ison $gettok(%chans,%ct,44) && $me isop $gettok(%chans,%ct,44) { .timer 1 0 kick $gettok(%chans,%ct,44) $1 $ilogo(X) }
          inc %ct 1 
        }
      }
    }
  }
}
bubbles {
  var %ct = 1 
  var %str = $c(1)
  while (%ct <= $len($1-)) {
    var %chr = $upper($mid($1-,%ct,1))
    if %chr != $chr(32) { var %str = %str $+ ( $+ $c(2) $+  $+ %chr $+  $+ $c(1) $+ ) } | else { var %str = %str $+ _ $+ ( $+ $c(2) $+  $+ $upper($mid($1-,$calc(%ct + 1),1)) $+  $+ $c(1) $+ ) | inc %ct 1 } 
    inc %ct 1 
  }
  return %str
}
bub { say $bubbles($1-) }
blocks {
  var %ct = 1 
  while (%ct <= $len($1-)) {
    var %chr = $upper($mid($1-,%ct,1))
    if %chr != $chr(32) { var %str = %str $+ $chr(91) $+  $+ %chr $+  $+ $chr(93) } | else { var %str = %str $+ _ $+ $chr(91) $+  $+ $upper($mid($1-,$calc(%ct + 1),1)) $+  $+ $chr(93) | inc %ct 1 } 
    inc %ct 1 
  }
  return %str
}
blks { say $blocks($1-) }
FSautoindex {
  if $r.set(Fserve,Status) == On && $r.set(Fserve,AutoCache) == On {
    if $chkFStriggers == $true {
      if $r.set(Fserve,DMC) != On { 
        var %FSDlgCT = 1
        while (%FSDlgCT <= 5) { 
          w.set Fserve SDirCount 5
          if $r.set(Fserve. [ $+ [ %FSDlgCT ] ] ,Status) != On { inc %FSDlgCT 1 | continue }
          write -c $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \FSdir [ $+ [ %FSDlgCT ] ] $chr(32)
          var %FSDlgFCT = 1
          var %FSDlgFTOT = $findfile($r.set(Fserve. [ $+ [ %FSdlgCT ] ] ,Root.Dir),*.*,0)
          while (%FSDlgFCT <= %FSDlgFTOT) {
            write $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \FSdir [ $+ [ %FSDlgCT ] ] $replace($findfile($r.set(Fserve. [ $+ [ %FSdlgCT ] ] ,Root.Dir),*.*,%FSDlgFCT),$chr(44),$chr(184),$chr(40),$chr(158),$chr(41),$chr(159))
            inc %FSDlgFCT 1
            continue
          }
          inc %FSDlgCT 1
        }
      }
      else {
        if ($os == NT) || ($os == 2k) || ($os == XP) {
          if $r.set(Fserve.1,Status) == On { .timer -om 1 1 .run -n cmd /c " [ $left($r.set(Fserve.1,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.1,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir1 ] " }
          if $r.set(Fserve.2,Status) == On { .timer -om 1 200 .run -n cmd /c " [ $left($r.set(Fserve.2,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.2,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir2 ] " }
          if $r.set(Fserve.3,Status) == On { .timer -om 1 400 .run -n cmd /c " [ $left($r.set(Fserve.3,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.3,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir3 ] " }
          if $r.set(Fserve.4,Status) == On { .timer -om 1 600 .run -n cmd /c " [ $left($r.set(Fserve.4,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.4,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir4 ] " }
          if $r.set(Fserve.5,Status) == On { .timer -om 1 800 .run -n cmd /c " [ $left($r.set(Fserve.5,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.5,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir5 ] " }
        }
        else {
          if $r.set(Fserve.1,Status) == On { .run -n command /c [ $left($r.set(Fserve.1,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.1,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir1 ] }
          if $r.set(Fserve.2,Status) == On { .run -n command /c [ $left($r.set(Fserve.2,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.2,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir2 ] }
          if $r.set(Fserve.3,Status) == On { .run -n command /c [ $left($r.set(Fserve.3,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.3,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir3 ] }
          if $r.set(Fserve.4,Status) == On { .run -n command /c [ $left($r.set(Fserve.4,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.4,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir4 ] }
          if $r.set(Fserve.5,Status) == On { .run -n command /c [ $left($r.set(Fserve.5,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.5,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir5 ] }
        }
      }
    }
  }
}
systemview { 
  var %cpuusage = $iif( $r.set(Personal.Info,CPUUsage) == On, $c(1) $+ ( $+ $c(2) $+ $isystem(processor,loadpercentage,1) $+ % Load $+ $c(1) $+ ),)
  if (($r.set(Personal.Info,CPU) == n/a) || ($r.set(Personal.Info,CPU) == $null)) && (%procinfo == $null) {
    var %cpuview = $dll(invision.dll,invisionCPU,_)
    var %cpucount = $gettok(%cpuview,1,32)
    var %cputype = $strip($gettok($gettok(%cpuview,1,44),2,32))
    var %cpuspeed = $strip($remove($gettok(%cpuview,2,44),Mhz))
    if (%cpuspeed isnum) {
      if (%cputype == Intel) {
        if (%cpuspeed > 1450) {
          var %cpunewspd = $round($calc(%cpuspeed / 1000),1)
          var %cpuview = Intel P4 %cpunewspd $+ GHz $iif(%cpucount = 2,with Hyperthreading)
        } 
      }
      if (%cputype == AMD) {
        var %cspd = 1333,1400,1467,1533,1600,1667,1733,1800,1833,2000,2083,2100,2133,2167,2200
        var %cxp = 1500,1600,1700,1800,1900,2000,2100,2200,2500,2400,2800,3000,2600,3000,3200
        var %pop = 1
        while (%pop < 15) { 
          if (%cpuspeed >= $calc($gettok(%cspd,%pop,44) - 15) && (%cpuspeed <= $calc($gettok(%cspd,%pop,44) + 15))) { var %cpuview = %cputype XP $+ $gettok(%cxp,%pop,44) $+ + }
          inc %pop 1
        }
      }
    }
  }
  elseif (($r.set(Personal.Info,CPU) == n/a) || ($r.set(Personal.Info,CPU) == $null)) && (%procinfo != $null) { var %cpuview = %procinfo }
  else { var %cpuview = $r.set(Personal.Info,CPU) }
  var %os = $iif(((Windows 2000 isin $dll(invision.dll,invisionOS,_)) && (Build 2600 isin $dll(invision.dll,invisionOS,_))),$replace($dll(invision.dll,invisionOS,_),2000,XP),$dll(invision.dll,invisionOS,_))
  var %os = $iif(Windows 2000 isin %os || Windows XP isin %os,$xpos $+ $right(%os,- $+ $calc($pos(%os,build) + 9)),%os)
  var %xpos = $xpos
  var %os = $iif(Unknown Windows NT isin %os,%xpos,%os)
  var %mem = $c(2) $+ $iif($r.set(Personal.Info,Memory) == n/a || $r.set(Personal.Info,Memory) == $null,$imemdisplay,$v1)
  say  $+ $c(2) $+ Current System Configuration $ilogo
  .timer 1 1 say $c(1) $+ Operating System: $c(2) $+ %os $c(1) $+ up for $c(2) $+ $gduration($uptime(system,3))
  .timer 1 2 say $c(1) $+ CPU: $c(2) $+ $replace(%cpuview,(TM),™,(R),®,(C),©) %cpuusage $c(1) RAM: $c(2) $+ %mem
  .timer 1 3 say $c(1) $+ Display System: $c(2) $+ $iif($r.set(Personal.Info,Video) == n/a || $r.set(Personal.Info,Video) == $null,$iif($bytes($displaysystem(AdapterRAM)).suf $displaysystem(Caption) != $null,$replace($v1,(TM),™,(R),®,(C),©),n/a),$replace($v1,(TM),™,(R),®,(C),©)) $C(1) $+ using a $c(2) $+ $iif($r.set(personal.info,Monitor) == n/a || $r.set(personal.info,Monitor) == $null,$iif($remove($monitor,monitor) != $null,$v1,n/a),$v1) $c(1) $+ monitor at $c(2) $+ $replace($dll(invision.dll,invisionRES,_),$chr(32) $+ by $+ $chr(32),x)
  .timer 1 4 say $c(1) $+ Storage System: $c(2) $+ $iif($r.set(Personal.Info,HD) == n/a || $r.set(Personal.Info,HD) == $null,$iTotalDriveSpace,$v1) $c(1) Internet Connection: $c(2) $+ $r.set(Personal.Info,Connection)
}
imemdisplay {
  if (%imemtotal < 2149580800) { return $dll(invision.dll,invisionMEM,_) }
  var %Totalmem = $round($calc(%imemtotal / 1024 / 1024),0)
  var %Currentmem = $calc(%Totalmem - $round($calc($isystem(OperatingSystem,FreePhysicalMemory,1) / 1024),0))
  var %Percentmem = $round($calc(%Currentmem / %Totalmem * 100),0)
  if (%Currentmem == %Totalmem) { var %Currentmem = ?? | var %Percentmem = -- }
  return %Currentmem $+ $c(1) $+ / $+ $c(2) $+ %Totalmem $+ MB $c(1) $+ ( $+ $c(2) $+ %Percentmem $+ $chr(37) $+ $c(1) $+ )
}
membar {
  if (%imemtotal < 2149580800) {
    var %Currentmem = $gettok($dll(invision.dll,invisionMEM,_),2,32)
    var %Totalmem = $remove($gettok($dll(invision.dll,invisionMEM,_),4,32),MB,GB)
  }
  else {
    var %Totalmem = $round($calc(%imemtotal / 1024 / 1024),0)
    var %Currentmem = $calc(%Totalmem - $round($calc($isystem(OperatingSystem,FreePhysicalMemory,1) / 1024),0))
  }
  var %Percentmem = $round($calc(%Currentmem / %Totalmem * 100),0)
  if (%Currentmem == %Totalmem) { var %Currentmem = ?? | var %Percentmem = -- }
  msg $1 $c(1) $+ RAM Used: $gettok($c(2),1,44) $+ , $+ $gettok($remove($c(2),),1,44) $+  $+ $str(¯,$round($calc($iif(%Percentmem isnum,$v1,0) / 5),0)) $+ $gettok($c(1),1,44) $+ , $+ $gettok($remove($c(1),),1,44) $+ $str(_,$round($calc((100 - $iif(%Percentmem isnum,$v1,0)) / 5),0)) $+  $c(1) $+ -- $c(2) $+ %Currentmem $+ $iif(%Currentmem != ??,MB) $c(1) $+ of $c(2) $+ %Totalmem $+ MB $c(1) $+ $chr(40) $+ $c(2) $+ %Percentmem $+ $chr(37) $+ $c(1) $+ $chr(41) $ilogo
}
cpubar {
  var %cpu = $isystem(processor,loadpercentage,1)
  msg $1 $c(1) $+ CPU Load: $gettok($c(2),1,44) $+ , $+ $gettok($remove($c(2),),1,44) $+  $+ $str(¯,$round($calc($iif(%cpu isnum, $v1,0) / 5),0)) $+ $gettok($c(1),1,44) $+ , $+ $gettok($remove($c(1),),1,44) $+ $str(_,$round($calc((100 - $iif(%cpu isnum,$v1,0)) / 5),0)) $+  $c(1) $+ -- ( $+ $c(2) $+ %cpu $+ %  $+ $c(1) $+ ) $ilogo
}
bwstatus {
  if ( $isfile(bwstatus.tmp) ) { .remove bwstatus.tmp } 
  write bwstatus.tmp  $+ $c(2) $+ Current Bandwidth Status $ilogo
  write bwstatus.tmp $c(1) $+ Total Bandwidth: $c(2) $+ $ratefix($calc($gbandwidth + $bandwidth)) $c(1) Sends: $c(2) $+ $send(0) $c(1) $+ at $c(2) $+ $ratefix($bandwidth) $c(1) Gets: $c(2) $+ $get(0) $c(1) $+ at $c(2) $+ $ratefix($gbandwidth)
  var %ct = 1
  while (%ct <= $send(0)) { 
    write bwstatus.tmp $c(1) $+ Send $c(2) $+ $chr(35) $+ %ct $c(1) $+ of $c(2) $+ $nopath($send(%ct).file)) $c(1) $+ $bracket($size($send(%ct).size)) $c(1) $+ to $c(2) $+ $send(%ct) $c(1) $+ on $c(2) $+ $scid($send(%ct).cid).network $c(1) $+ at $c(2) $+ $ratefix($send(%ct).cps) $c(1) $+ has $c(2) $+ $bytes($send(%ct).rcvd).suf $c(1) $+ ( $+ $c(2) $+ $send(%ct).pc $+ $chr(37) $+ $c(1) $+ ) completed with approximately $c(2) $+ $duration($round($calc(($send(%ct).size - $send(%ct).sent) / $send(%ct).cps),0),2) $c(1) $+ left.
    inc %ct 1
  }
  ; say $c(1) $+ I have $c(2) $+ $get(0) $c(1) $+ incoming get $+ $iif($get(0) != 1,s) totaling $c(2) $+ $ratefix($gbandwidth)
  var %ct = 1
  while (%ct <= $get(0)) { 
    write bwstatus.tmp $c(1) $+ Get $c(2) $+ $chr(35) $+ %ct $c(1) $+ of $c(2) $+ $nopath($get(%ct).file)) $c(1) $+ $bracket($size($get(%ct).size)) $c(1) $+ from $c(2) $+ $get(%ct) $c(1) $+ on $c(2) $+ $scid($get(%ct).cid).network $c(1) $+ at $c(2) $+ $ratefix($get(%ct).cps) $c(1) $+ has $c(2) $+ $bytes($get(%ct).rcvd).suf $c(1) $+ ( $+ $c(2) $+ $get(%ct).pc $+ $chr(37) $+ $c(1) $+ ) completed with approximately $c(2) $+ $duration($round($calc(($get(%ct).size - $get(%ct).rcvd) / $get(%ct).cps),0),2) $c(1) $+ left.
    inc %ct 1
  }
  .play $chan " $+ bwstatus.tmp $+ " 1200
  .remove bwstatus.tmp
}
tc {
  ;  *************   $tc(<nick>,<servertype>)
  if $2 != $null {
    var %server = $replace($2,_,.)
    if ($r.set(%server,Status) != On) && (%server != manual) && (%server != Requeue) { return $false }
    if $r.set(DCC.Watch,Status) != On || $server == $null {
      return $true
    }
    else {
      if $DCCwatchchk($1) { return $true }
    }
  }
  else { return $false }
}
DCCwatchchk {
  ;         *******************   $DCCwatchchk(nick)
  if $1 != $null {
    if $r.set(DCC.Watch,Status) != On || $server == $null { return $true }
    var %chans = $r.set(DCC.Watch,Channels)
    if %chans == All || %chans == $null {
      if $chan(0) >= 1 {
        var %ct = 1
        while (%ct <= $chan(0)) {
          if $1 ison $chan(%ct) { return $true }
          inc %ct 1
        }
        return $false
      }
      else { return $false }
    }
    else {
      var %ct = 1
      while (%ct <= $numtok(%chans,44)) {
        var %curchan = $gettok(%chans,%ct,44)
        if $me ison %curchan {
          if $1 ison %curchan { return $true }
        }
        inc %ct 1
      }
      return $false
    }
  }
}
iclonescn {
  ;                                ********************* $1 = Channel    $2 = private/public
  if $2 != $null && $me ison $1 {
    var %ct = 1
    var %tot = $ialchan(*,$1,0)
    hfree -w clnscan $+ $1
    hfree -w nicks $+ $1 
    .hmake clnscan $+ $1 200
    while (%ct <= %tot) {
      hadd clnscan $+ $1 n [ $+ [ %ct ] ] $ialchan(*,$1,%ct)
      inc %ct 1 
    }
    set %clnCT $+ $1 1
    set %clnTot $+ $1 %tot
    .timer -om %tot 30 doClnScan $1
  }
}
doClnScan {
  if $1 != $null {
    var %host = $hget(clnscan [ $+ [ $1 ] ] , n [ $+ [ %clnCT [ $+ [ $1 ] ] ] ] )
    var %addr = *@ $+ $gettok(%host,2,64)
    var %nick = $gettok(%host,1,33)
    if $hfind(nicks [ $+ [ $1 ] ] ,%nick,0) != 0 { set %clnCT [ $+ [ $1 ] ] $calc(%clnCT [ $+ [ $1 ] ] + 1) | halt }
    var %matches = $hmatch(clnscan [ $+ [ $1 ] ] ,%addr,0).data
    if %matches >= 2 { 
      var %ct = 1
      var %gclr = 
      while (%ct <= %matches) {
        var %nick = $gettok($hget(clnscan [ $+ [ $1 ] ] ,$hmatch(clnscan [ $+ [ $1 ] ] ,%addr,%ct).data),1,33)
        if %nick isvo $1 { %gclr = 10 }
        if %nick isop $1 { %gclr = 13 }
        var %grp = %grp $iif(%grp != $null,$chr(164)) %nick
        hadd -m nicks $+ $1 %nick 1
        inc %ct 1
      }
      icswin $1 %gclr $+ %grp
      if $me isop $1 && %gclr ==  {
        var %nickct = 1
        while (%nickct <= $numtok(%grp,164)) { 
          .ctcp $gettok(%grp,%nickct,164) PING
          inc %nickct 1
        }
      }
    }
    set %clnCT [ $+ [ $1 ] ] $calc(%clnCT [ $+ [ $1 ] ] + 1)
    if %clnCT [ $+ [ $1 ] ] > %clnTot [ $+ [ $1 ] ] { 
      hfree -w clnscan $+ $1
      hfree -w nicks $+ $1 
      unset %clnCT [ $+ [ $1 ] ] 
      unset %clnTot [ $+ [ $1 ] ] 
      icswin $1 
      icswin $1 $c(1) $+ ================= Scan Finished ===================     
    }
  }
}
icswin {
  if $1 != $null {
    if ($window(@Clone_Report_ [ $+ [ $1 ] ] ) == $null) { window -k0a @Clone_Report_ [ $+ [ $1 ] ] -1 -1 500 300 @Clone_Report_ [ $+ [ $1 ] ] | aline @Clone_Report_ [ $+ [ $1 ] ] $c(1) $+ Clone Report for $c(2) $+ $1 $c(1) $+ at $c(2) $+ $cts $ilogo | aline @Clone_Report_ [ $+ [ $1 ] ] 12Groups colored in 13Pink 12belong to ops. | aline @Clone_Report_ [ $+ [ $1 ] ] 12Those colored in 10Cyan 12belong to voices. | aline @Clone_Report_ [ $+ [ $1 ] ]  }
    aline -p @Clone_Report_ [ $+ [ $1 ] ] $2-
  }
}
ColorDefine {
  if $1 >= 0 && $1 <= 16 {
    var %Colors = White,Black,Dark Blue,Green,Red,Brown,Purple,Orange,Yellow,Light Green,Cyan,Light Cyan,Blue,Pink,Grey,Light Grey,Plain Text
    if $1 != 16 {
      return  $+ $1 $+ $gettok(%Colors,$calc($1 + 1),44)
    }
    else { return Plain Text }
  } 
}
toprecords {
  say $ilogo $c(1) $+ *** $c(2) $+ $iif($r.glob(Fserve,RecordsKeep) >= 2,Top $r.glob(Fserve,RecordsKeep)) Most Requested $c(1) $+ *** 
  var %tot = $iif($r.glob(Fserve,RecordsKeep) >= 1,$r.glob(Fserve,RecordsKeep),1)
  var %ct = 1
  while (%ct <= %tot) {
    .timer -m 1 $calc(%ct * 200) $iif($1 != $null,msg $1,say) $c(1) $chr(91) $+ $chr(35) $+ %ct $+ $chr(93) $c(2) $r.glob(Fserve,DirRecord.Name [ $+ [ %ct ] ] ) $iif($r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) != $null, $c(1) $chr(40) $+ $r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) $+ $chr(41))
    inc %ct 1
  }
}
iSeen {
  ; ************************ Seen <type public/local> <chan> <requester> <nick to search for>
  if ( $4 != $null ) {
    if ( %SeenFlag [ $+ [ $iNetwork ] ] != 1 ) {
      if ( $1 != 2 && $1 != local ) {
        .timer -o 1 5 unset %SeenFlag [ $+ [ $iNetwork ] ]
        set %SeenFlag [ $+ [ $iNetwork ] ] 1
      }
      var %SeenMsg = $r.set(Invision,SeenMsg)
      if ( $strip($3,burc) == $strip($4,burc) ) { $iif(($1 == 2 || $1 == local),echo -a $c(2) $+ >, $iif((%SeenMsg == Msg) && ($3 ison $2), .timer 1 0 msg $2, notice $3)) $c(1) $+ Need some help finding yourself there pal? | goto skipseen }
      if ( $strip($4,burc) == $me || $strip($4,burc) ison $2 ) { $iif(($1 == 2 || $1 == local),echo -a $c(2) $+ >, $iif((%SeenMsg == Msg) && ($3 ison $2), .timer 1 0 msg $2, notice $3)) $c(1) $+ When's the last time you had an eye exam? | goto skipseen }
      var %seenresult = $rseen($strip($4,burc))
      ; No exact results
      if ( %seenresult == $null ) {
        ; Find the number of results
        var %sct = $searchseenct($4)
        if ( %sct >= 1 ) { var %seenresult = %sct }
      }
      if ( %seenresult != $null ) {
        ; Exact results
        if (%seenresult !isnum) {
          var %tmpSeenStr = %seenresult
          if ( $gettok(%tmpSeenStr,1,32) == PART ) { $iif((($1 == 2) || ($1 == local)),echo -a $c(2), $iif((%SeenMsg == Msg) && ($3 ison $2), .timer 1 0 msg $2 $c(2) $+ >>, notice $3 $c(2) $+ >>)) $+ > $c(1) $+ I last saw $c(2) $+ $4 $c(1) $+ $timecalc($ctime,$gettok(%tmpSeenStr,3,32)) ago parting $c(2) $+ $gettok(%tmpSeenStr,4,32) $ilogo }
          if ( $gettok(%tmpSeenStr,1,32) == QUIT ) { $iif((($1 == 2) || ($1 == local)),echo -a $c(2), $iif((%SeenMsg == Msg) && ($3 ison $2), .timer 1 0 msg $2 $c(2) $+ >>, notice $3 $c(2) $+ >>)) $+ > $c(1) $+ I last saw $c(2) $+ $4 $c(1) $+ $timecalc($ctime,$gettok(%tmpSeenStr,3,32)) ago quitting iRC with the message: $chr(91) $c(2) $+ $gettok(%tmpSeenStr,4-,32) $c(1) $+ $chr(93) $ilogo }
          if ( $gettok(%tmpSeenStr,1,32) == JOIN ) { $iif((($1 == 2) || ($1 == local)),echo -a $c(2), $iif((%SeenMsg == Msg) && ($3 ison $2), .timer 1 0 msg $2 $c(2) $+ >>, notice $3 $c(2) $+ >>)) $+ > $c(1) $+ I last saw $c(2) $+ $4 $c(1) $+ $timecalc($ctime,$gettok(%tmpSeenStr,3,32)) ago joining $c(2) $+ $gettok(%tmpSeenStr,4,32) $ilogo }
          if ( $gettok(%tmpSeenStr,1,32) == NICK ) { $iif((($1 == 2) || ($1 == local)),echo -a $c(2), $iif((%SeenMsg == Msg) && ($3 ison $2), .timer 1 0 msg $2 $c(2) $+ >>, notice $3 $c(2) $+ >>)) $+ > $c(1) $+ I last saw $c(2) $+ $4 $c(1) $+ $timecalc($ctime,$gettok(%tmpSeenStr,3,32)) ago changing their nick from $c(2) $+ $gettok(%tmpSeenStr,4,32) $+ $c(1) to $c(2) $+ $gettok(%tmpSeenStr,5,32) $+ $c(1) $+ . $ilogo }
        }
        ; No exact results, display matches
        else {
          var %ct = 1
          while (%ct <= %seenresult) {
            var %seennick = $searchseen($4,%ct)
            var %tmpSeenStr = $rseen(%seennick)
            if $gettok(%tmpSeenStr,1,32) == PART { $iif((($1 == 2) || ($1 == local)),echo -a $c(2),notice $3 $c(2) $+ >>) $+ > $c(1) $+ I last saw $c(2) $+ %seennick $c(1) $+ $timecalc($ctime,$gettok(%tmpSeenStr,3,32)) ago parting $c(2) $+ $gettok(%tmpSeenStr,4,32) $ilogo }
            if $gettok(%tmpSeenStr,1,32) == QUIT { $iif((($1 == 2) || ($1 == local)),echo -a $c(2),notice $3 $c(2) $+ >>) $+ > $c(1) $+ I last saw $c(2) $+ %seennick $c(1) $+ $timecalc($ctime,$gettok(%tmpSeenStr,3,32)) ago quitting iRC with the message: $chr(91) $c(2) $+ $gettok(%tmpSeenStr,4-,32) $c(1) $+ $chr(93) $ilogo }
            if $gettok(%tmpSeenStr,1,32) == JOIN { $iif((($1 == 2) || ($1 == local)),echo -a $c(2),notice $3 $c(2) $+ >>) $+ > $c(1) $+ I last saw $c(2) $+ %seennick $c(1) $+ $timecalc($ctime,$gettok(%tmpSeenStr,3,32)) ago joining $c(2) $+ $gettok(%tmpSeenStr,4,32) $ilogo }
            if $gettok(%tmpSeenStr,1,32) == NICK { $iif((($1 == 2) || ($1 == local)),echo -a $c(2),notice $3 $c(2) $+ >>) $+ > $c(1) $+ I last saw $c(2) $+ %seennick $c(1) $+ $timecalc($ctime,$gettok(%tmpSeenStr,3,32)) ago changing their nick from $c(2) $+ $gettok(%tmpSeenStr,4,32) $+ $c(1) to $c(2) $+ $gettok(%tmpSeenStr,5,32) $+ $c(1) $+ . $ilogo }
            inc %ct 1
            if ( ( %ct >= 6 ) && ( $1 != 2 ) && ( $1 != local ) ) { notice $3 $c(1) $+ Too many results found. Try and be more specific please. | halt }
          }
        }
      }
      else {
        $iif((($1 == 2) || ($1 == local)),echo -a $c(2) $+ >, $iif((%SeenMsg == Msg) && ($3 ison $2), .timer 1 1 msg $2, notice $3)) $c(1) $+ Sorry $c(2) $+ $3 $+ $c(1) $+ , I haven't seen $c(2) $+ $4 $c(1) $+ around.
      }
      :skipseen
    }
  }
}

massmsg {
  ;                                                           ************ massinfo <chan> <text msg>
  if $2 != $null {
    var %ct = 1
    while (%ct <= $snick($1,0)) {
      .timer 1 $calc(%ct * 2) .msg $snick($1,%ct) $2-
      inc %ct 1 
    }
    .timer 1 $calc(%ct * 2) aecho All /msg sent!
  }
}
Seen { iSeen 2 $chan(1) $me $1 }
QueuesRemote { return $calc($queue(0) + $Pqueue(0)) }
QueuesGlobal {
  var %ct = 1
  var %tot = 0
  while (%ct <= $scon(0)) {
    inc %tot $scon(%ct).QueuesRemote
    inc %ct 1
  }
  return %tot
}
ReverseDCCwarn {
  if ($1 != $null) && ($chr(46) !isin $1) && ($r.dccwarn($1) == $null) {
    w.dccwarn $1
    .notice $1 $c(1) $+ In order to receive files from me make sure you have your dccserver on. You can manually turn it on with the '' $c(2) $+ /dccserver +sc-f on $iif($r.glob(DCCmgr,ReversePort) != $null,$r.glob(DCCmgr,ReversePort),6060) $c(1) $+ '' command. Also make sure you have port $c(2) $+ $iif($r.glob(DCCmgr,ReversePort) != $null,$r.glob(DCCmgr,ReversePort),6060) $c(1) $+ cleared in any firewall you might be running as well. $c(2) $+ Your transfer will begin in approximately 20 seconds.
    if $fserve($1) != $null || $chat($1) != $null {
      msg = $+ $1 $c(1) $+ In order to receive files from me make sure you have your dccserver on. You can manually turn it on with the '' $c(2) $+ /dccserver +sc-f on $iif($r.glob(DCCmgr,ReversePort) != $null,$r.glob(DCCmgr,ReversePort),6060) $c(1) $+ '' command. Also make sure you have port $c(2) $+ $iif($r.glob(DCCmgr,ReversePort) != $null,$r.glob(DCCmgr,ReversePort),6060) $c(1) $+ cleared in any firewall you might be running as well. $c(2) $+ Your transfer will begin in approximately 20 seconds.
    }
  }
}
FreeTables {
  var %tottables = $hget( [ SettingsTables $+ [ $iNetwork ] ] ,0).item
  var %ct = 1
  while (%ct <= %tottables) { 
    if $istable($hget(SettingsTables [ $+ [ $iNetwork ] ] ,%ct).item) { hfree -w $hget(SettingsTables [ $+ [ $iNetwork ] ] ,%ct).item }
    inc %ct 1
  }
  if $istable( [ SeenData $+ [ $iNetwork ] ] ) == $true { hfree -w [ SeenData $+ [ $iNetwork ] ] }
  if $istable( [ SettingsTables $+ [ $iNetwork ] ] ) == $true { hfree -w [ SettingsTables $+ [ $iNetwork ] ] }
}
msghistory {
  if $1 != $null {
    set %log-f $shortfn($logdir) $+ $iif($gettok($readini($mircini,options,n7),21,44) == 1,$network $+ \) $+ $replace($1,|,_,\,_,^,_) $+ $iif($server($server).group != $null,. $+ $server($server).group) $+ . $+ $time(yyyy) $+  $time(mm) $+ $time(dd) $+ .log 
    if ($isfile(%log-f) == $false) { return }
    else {
      if ($lines(%log-f) > 5) { clear $1 }
      var %linect = $lines(%log-f)
      if %linect > 5 {
        .log off $1
        var %ct = 4
        var %linefct = $calc(%linect - 2)
        if %linect > 44 {
          ;  echo -s ct: %ct linefct: %linefct 
          var %ct = $calc(%linect - 41)
          while (%ct <= %linefct) {
            ; echo -s ct: %ct linefct: %linefct 
            if ($read(%log-f,n,%ct) != $null) {
              if ($gettok($read(%log-f,n,%ct),1,32) != Session) {
                echo $1 $read(%log-f,n,%ct)
              }
            }
            inc %ct 1
          }
        } 
        else {
          while (%ct <= %linefct) {
            if ($read(%log-f,n,%ct) != $null) {
              if ($gettok($read(%log-f,n,%ct),1,32) != Session) {
                echo $1 $read(%log-f,n,%ct)
              }
            }
            inc %ct 1
          }
        }
        echo $1 $ts < $+  $+ $r.glob(Nick.Colors,Color.0) $+ $1 $+ > $2-
        .log on $1
      }
    }

  }
}
hostchanscan {
  ; ************ Usage /hostchanscan <#chan> <hostmask>
  if ($2 != $null) && ($me ison $1) {
    var %ct = 1
    var %tct = $ialchan($2,$1,0)
    ; echo -s 8STUFF %ct %tct
    echo $1 $c(2) $+ %tct matches found for $2
    while (%ct <= %tct) {
      echo $1 $c(1) $+ $chr(91) $+ %ct $+ $chr(93) $sv($gettok($ialchan($2,$1,%ct),1,33) $+ $chr(32),$gettok($ialchan($2,$1,%ct),2-,33)) 
      inc %ct 1
    }
  }
  else { echo -a 4Invalid Parameters. }
}
fnencode { return $replace($1-,$chr(32),$chr(63),$chr(44),$chr(34)) }
fndecode { return $replace($1-,$chr(63),$chr(32),$chr(34),$chr(44)) }
mevents {
  if $1 != $null {
    ; joins returns 0 = In Channel         1 = In Status      2 = Hide
    if $1 == joins { return $gettok($readini($shortfn($mircini),Events,default),1,44) }
    ; parts returns 0 = In Channel         1 = In Status      2 = Hide
    if $1 == parts { return $gettok($readini($shortfn($mircini),Events,default),2,44) }
    ; quits returns 0 = In Channel         1 = In Status      2 = Both      3 = Hide
    if $1 == quits { return $gettok($readini($shortfn($mircini),Events,default),3,44) }
    ; modes returns 0 = In Channel         1 = In Status      2 = Hide
    if $1 == modes { return $gettok($readini($shortfn($mircini),Events,default),4,44) }
    ; topic returns 0 = In Channel         1 = In Status      2 = Hide
    if $1 == topic { return $gettok($readini($shortfn($mircini),Events,default),5,44) }
    ; ctcps returns 0 = In Channel         1 = In Status   
    if $1 == ctcps { return $gettok($readini($shortfn($mircini),Events,default),6,44) }
    ; nicks returns 0 = In Channel         1 = Hide
    if $1 == nicks { return $gettok($readini($shortfn($mircini),Events,default),7,44) }
    ; kicks returns 0 = In Channel         1 = In Status      2 = Hide
    if $1 == kicks { return $gettok($readini($shortfn($mircini),Events,default),8,44) }
  }
}
