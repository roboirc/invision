; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: ialias5.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: The File Server Explorer Alias routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
mp3serv.ad { if (($server != $null) && ($r.set(mp3serv,Status) == On) && ($r.set(mp3serv,AdTimer) == On)) { admsg $allchk($r.set(mp3serv,Channels)) 1 [ $mp3serv.ad.temp ] } }
mp3serv.ad.temp { if ($mp3serv.ad.trigger != $null) { return $c(2) $+ mp3 Server Online $c(1) $+ $iif($r.set(mp3serv,VerboseAd) == On,$mp3serv.ad.cmds $mp3serv.ad.min.cps $mp3serv.ad.sends $mp3serv.ad.queues $mp3serv.ad.access $fserve.ad.record.cps $mp3serv.ad.snagged $mp3serv.ad.files $mp3serv.ad.motd $ilogo, $iif($r.set(mp3serv,SendList) == On,Use $c(2) $+ $iif($r.set(mp3serv,CTCP) == On,/ctcp $me) @ $+ $me $c(1) $+ to get my full list.) $mp3serv.ad.min.cps $mp3serv.ad.sends $mp3serv.ad.queues $mp3serv.ad.files $mp3serv.ad.motd $ilogo) } }
mp3serv.ad.motd { if $r.set(mp3serv,motd) != $null { return $c(1) $+ -= $+ $c(2) [ [ $r.set(mp3serv,motd) ] ] $c(1) $+ =- } }
mp3serv.ad.queues { return $nosv(Queues, [ [ $queue(0) ] $+ ] / [ $+ [ $vnum($r.set(mp3serv,Max.Queues.Total),0) ] ] ) }
mp3serv.ad.sends { if $r.glob(Fserve,SmartSend) != On { return $nosv(Sends, [ [ $isend(0) ] $+ ] / [ $+ [ $vnum($r.set(mp3serv,Max.Sends.Total),0) ] ] ) } | else { return $nosv(Sends, [ $isend(0) ] ) } }
mp3serv.ad.trigger { if $r.set(mp3serv,CTCP) != On { if $r.set(mp3serv,UseNickTrigger) == On { return [ ! $+ [ $me ] ] } | if $r.set(mp3serv,Trigger) != $null { return [ [ $r.set(mp3serv,Trigger) ] ] } | else { return } } | else { return /ctcp $me } }
mp3serv.ad.cmds { return $nosv(Commands,$mp3serv.ad.cmds.bld) }
mp3serv.ad.files { return $nosv(Serving,$mp3filect mp3's) }
mp3serv.ad.min.cps { if ($r.set(Min.CPS,Rate) isnum) && ($isnum($r.set(Min.CPS,Delay)) == $true) && ($r.set(Min.CPS,Status) == On) { return $nosv(Min, [ [ $ratefix($vnum($r.set(Min.CPS,Rate),0)) ] ] ) } }
mp3serv.ad.list { if $r.set(mp3serv,SendList) == On { return [ $c(1) $+ • ] [ $+ [ $c(2) ] ] [ $mp3serv.ad.trigger ] List } }
mp3serv.ad.cmds.bld { return $mp3serv.ad.trigger mp3Help [ $c(1) $+ • ] [ $+ [ $c(2) ] ] $mp3serv.ad.trigger Queues [ $c(1) $+ • ] [ $+ [ $c(2) ] ] $mp3serv.ad.trigger Clear All $iif($r.set(mp3serv,mp3search) == On, [ $c(1) $+ • ] [ $+ [ $c(2) ] ] !mp3Search <text> ) $mp3serv.ad.list }
mp3servListName { if $r.set(mp3serv,UseNickTrigger) == On { return [ ! $+ [ $replace($me,$chr(124),_,$chr(92),_) ] ] } | if $r.set(mp3serv,Trigger) != $null { return $replace($strip($r.set(mp3serv,Trigger),burc),$chr(34),_,$chr(42),_,$chr(47),_,$chr(58),_,$chr(60),_,$chr(62),_,$chr(63),_,$chr(92),_,$chr(124),_) } | else { return } } 
diagfs {
  say $ilogo  $+ $c(2) $+ Fserve Diagnostic Info
  say $c(1) $+ Max Sends Each: $c(2) $+ $r.set(Fserve,max.sends.each) $c(1) Max Sends Total: $c(2) $+ $r.set(Fserve,max.sends.total) $c(1) Max Qs Total: $c(2) $+ $r.set(Fserve,max.queues.total) $c(1) Max Qs Each: $c(2) $+ $r.set(Fserve,max.queues.each) $c(1) FS Status: $c(2) $+ $r.set(Fserve,Status) $c(1) FS Listen: $c(2) $+ $r.set(Fserve,Listen) $c(1) FS !list: $c(2) $+ $r.set(Fserve,List)  
  say $c(1) $+ SmartSends: $c(2) $+ $r.glob(Fserve,SmartSend) $c(1) Insta-Send: $c(2) $+ $r.set(Fserve,InstaSend.Status) $c(1) $+ and set at $c(2) $+ $size($r.set(Fserve,Insta.Send.Size)) $c(1) CloneGuard: $c(2) $+ $r.set(Fserve,CloneGuard) $c(1) Sizeguard: $c(2) $+ $r.set(Fserve,SizeGuard) $c(1) $+ and set at $c(2) $+ $size($r.set(Fserve,sg.size))
  say $c(1) $+ Max Server Bandwidth: $c(2) $+ $ratefix($r.glob(Fserve,Max.Serv.Bandwidth)) $c(1) Min CPS: $c(2) $+ $r.set(Min.CPS,Status) $c(1) $+ set at $c(2) $+ $ratefix($r.set(Min.CPS,Rate)) $c(1) $+ checking every $c(2) $+ $r.set(Min.CPS,delay) $c(1) $+ seconds. $c(1) SSendTimer: $c(2) $+ $timer(SSend) $c(1) QwatchTimer: $c(2) $+ $timer(qwatch) 
  say $c(1) $+ Next Limit: $c(2) $+ $ratefix($r.glob(DCCmgr,SendBW)) $c(1) MaxServ: $c(2) $+ $ratefix($r.glob(Fserve,Max.Serv.Bandwidth)) $c(1) PDCC: $c(2) $+ $r.glob(Invision,PDCC) $c(1) FSEND: $c(2) $+ $r.glob(Invision,Fsend) $c(1) PacketSize: $c(2) $+ $r.glob(Invision,packetsize)
  say $c(1) $+ Second Queue: $c(2) $+ $r.set(DCCmgr,SecondQ)
  say $c(1) $+ Search: $c(2) $+ $r.set(Fserve,Search) $c(1) FS Chat: $c(2) $+ $r.set(Fserve,Fserve.Chat) $c(1) Auto Start: $c(2) $+ $r.set(Fserve,Auto.Start) $c(1) Slot Announcer: $c(2) $+ $r.set(Fserve,Slot.Announce) $c(1) Remote Ctrl: $c(2) $+ $r.set(Fserve,remote.control) $c(1) AntiCamp: $c(2) $+ $r.set(Fserve,AntiCamp)
  if $ulist(*,7,0) != 0 { 
    var %tmpFSbanCT = 1
    while (%tmpFSbanCT <= $ulist(*,7,0)) {
      var %FSbans = %Fsbans $ulist(*,7,%tmpFSbanCT)
      inc %tmpFSbanCT 1
    }
  }
  else { var %FSbans = None }
  say $c(1) $+ FS Ad delay: $c(2) $+ $r.set(Fserve,ad.delay) $c(1) $+ seconds. $c(1)  Queues: $c(2) $+ $queue(0) $c(1)  Sends: $c(2) $+ $isend(0) $c(1) Terms: $c(2) $+ $r.set(Fserve,Terms.File) $c(1)  FS Channels: $c(2) $+ $r.set(Fserve,Channels)
  say $c(1) $+ Triggers: $c(2) $+ $r.set(Fserve.1,Status) $+ $c(1) $+ / $+ $c(2) $+ $r.set(Fserve.2,Status) $+ $c(1) $+ / $+ $c(2) $+ $r.set(Fserve.3,Status) $+ $c(1) $+ / $+ $c(2) $+ $r.set(Fserve.4,Status) $+ $c(1) $+ / $+ $c(2) $+ $r.set(Fserve.5,Status) $c(1) Banlist: $c(2) $+ %FSbans
}
FxPDiagTbl {
  if $gettok($dll(invision.dll,invisionRES,_),1,32) > 801 {
    return InvisFxP2
  }
  else {
    return InvisFxP
  }
}
FserveCTCPchk {
  if  ($r.set(Fserve,AllowCTCP) == On) && (($r.set(Fserve.1,CTCP) == On && $r.set(Fserve.1,Status) == On) || ($r.set(Fserve.2,CTCP) == On && $r.set(Fserve.2,Status) == On) || ($r.set(Fserve.3,CTCP) == On && $r.set(Fserve.3,Status) == On) || ($r.set(Fserve.4,CTCP) == On && $r.set(Fserve.4,Status) == On) || ($r.set(Fserve.5,CTCP) == On && $r.set(Fserve.5,Status) == On)) {
    return $true
  }
  else { return $false }
}
mp3servHELP { 
  if $1 != $null {
    if $comchan($1,0) != 0 { 
      .timer 1 0 .msg $1 $c(2) $+ mp3 Server Help $ilogo
      .timer 1 2 .msg $1 $c(1) $+ I accept the following commands:
      .timer 1 4 .msg $1 $c(2) $+ $mp3serv.ad.trigger Queues $c(1) $+ to receive information on your queue status.
      .timer 1 6 .msg $1 $c(2) $+ $mp3serv.ad.trigger Clear All $c(1) $+ to clear all your queues.
      .timer 1 8 .msg $1 $c(2) $+ $mp3serv.ad.trigger Clear $chr(35) $c(1) $+ where $chr(35) is the number of a queue belonging to you to clear.
      .timer 1 10 .msg $1 $c(2) $+ $mp3serv.ad.trigger <mp3 filename> $c(1) $+ to receive a mp3's I have to offer.
      if $r.set(mp3serv,mp3search) == On { .timer 1 12 .msg $1 $c(2) $+ !mp3search $+ $c(1) $+ / $+ $c(2) $+ @find $+ $c(1) $+ / $+ $c(2) $+ @locator <text> $c(1) $+ to receive search results on the text you entered. You can use the * as a wildcard. }
      if $r.set(mp3serv,SendList) == On { .timer 1 14 .msg $1 $c(2) $+ $mp3serv.ad.trigger List $c(1) $+ or $c(2) $+ @ [ $+ [ $me ] ] $c(1) $+  to receive a full list of all the mp3's I have to offer. }
    }
  }
}
mp3servClearAll { 
  if ($queue.nick($1) == 0) { .notice $1 $c(1) $+ You have no queues waiting. }
  else {
    var %mp3serv-cq = 0
    :clr_queue-start-1
    inc %mp3serv-cq 1
    :clr_queue-start-2
    if ($queue(%mp3serv-cq) == $null) { unset %mp3serv-cq | Halt }
    elseif ($gettok($queue(%mp3serv-cq),2,32) == $1) && ($gettok($queue(%mp3serv-cq),1,32) == mp3serv) { .notice $1 $c(1) $+ Removing $c(2) $+ $nopath($gettok($queue(%mp3serv-cq),5-,32)) from the queue. | queue.del %mp3serv-cq | goto clr_queue-start-2 }
    else { goto clr_queue-start-1 }
  }
}
mp3servClearOne {
  if ($2 != $null) && ($2 isnum 1-999) { 
    if ($queue.nick($1) == 0) { .notice $1 $c(1) $+ You have no queues waiting. }
    else {
      if $gettok($queue($2),2,32) == $1 { .notice $1 $c(1) $+ Removing $c(2) $+ $nopath($gettok($queue($2),5-,32)) from the queue. | queue.del $2 }
      else { .notice $1 $c(1) $+ Queue $c(2) $+ # $+ $2 $c(1) $+ is not yours. You can only remove your own queues. }
    }
  }
}
mp3servQueues { 
  if ($queue.nick($1) == 0) { .notice $1 $c(1) $+ You have no queues waiting. }
  else {
    .msg $1 $c(2) $+ You have the following queues waiting. $ilogo
    var %mp3serv-cq = 0
    :clr_queue-start-1
    inc %mp3serv-cq 1
    :clr_queue-start-2
    if ($queue(%mp3serv-cq) == $null) { unset %mp3serv-cq | Halt }
    elseif ($gettok($queue(%mp3serv-cq),2,32) == $1) { .timer 1 $calc(%mp3serv-cq * 2) .msg $1 $c(2) $+ $nopath($gettok($queue(%mp3serv-cq),5-,32)) $c(1) $+ is in the queue for you at slot $c(2) $+ %mp3serv-cq $c(1) $+ . | inc %mp3serv-cq 1 | goto clr_queue-start-2 }
    else { goto clr_queue-start-1 }
  }
}
mp3servList {
  if $1 != $null { 
    if $r.set(mp3serv,ZipList) == On {
      if $exists( [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \ [ $+ [ $mp3servListName ] ] [ $+ [ 's_mp3list.zip ] ] ] ) {
        .idcc send $1 " $+ [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \ [ $+ [ $mp3servListName ] ] [ $+ [ 's_mp3list.zip ] ] ] $+ "
      } 
      else { aecho Attempted to send the mp3 file list to $1 but couldn't find it. }
    }
    else {
      if $exists( [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \ [ $+ [ $mp3servListName ] ] [ $+ [ 's_mp3list.htm ] ] ] ) {
        .idcc send $1 " $+ [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \ [ $+ [ $mp3servListName ] ] [ $+ [ 's_mp3list.htm ] ] ] $+ "
      }
      else { aecho Attempted to send the mp3 file list to $1 but couldn't find it. }
    }
  }
}
mp3filect { return $lines($shortfn($mircdirinvision\Settings\ $+ [ $iSetwork ] $+ \mp3list.i2x)) }
htmlhdr {
  return <html> <head> <title> $1- </title></head><body bgcolor="#FFFFFF"><div align="center"><center><table border="0" width="90%"><tr><td align="center" colspan="3" width="70%"><font size="5"> $1 </font><br><font size="2"> $2 <br> $iif($r.set(mp3serv,ListImage) != $null, [ <img src=" $+ [ $r.set(mp3serv,ListImage) ] $+ "> ] ) </font><hr></td></tr>
}
htmlrow { 
  return <tr><td width="80%"> $replace($1,$chr(44),$chr(44))  </td><td width="10%"> $3 </td><td align="right" width="10%"> $2 </td></tr>
}
htmlend {
  return </table><p>&nbsp;</p>List Generated by Invision $r.static(Script,Version) for mIRC<br><a href="http://www.i-n-v-i-s-i-o-n.com">http://www.i-n-v-i-s-i-o-n.com</a></center></div></body></html>
}
AlwaysHomeOn {
  if $server != $null && ($r.set(Personal.Info,HomeChannel) != $null) { 
    var %HomeChanCT = 1
    While (%homechanct <= $numtok($r.set(personal.Info,HomeChannel),44)) {
      .timerAlways_Home $+ %HomeChanCT $+ $iNetwork 0 20 if $!me !ison $gettok($gettok($r.set(Personal.Info,HomeChannel),%HomeChanCT,44),1,32) { /j $!gettok($r.set(Personal.Info,HomeChannel), [ %HomeChanCT ] ,44) }   
      inc %HomeChanCT 1
    }
  }
}
AlwaysHomeOff {
  if $server != $null && ($r.set(Personal.Info,HomeChannel) != $null) { 
    var %HomeChanCT = 1
    While (%homechanct <= $numtok($r.set(personal.Info,HomeChannel),44)) {
      .timerAlways_Home $+ %HomeChanCT $+ $iNetwork OFF   
      inc %HomeChanCT 1
    }
  }
}
JoinHomes {
  if $server != $null && ($r.set(Personal.Info,HomeChannel) != $null) { 
    var %HomeChanCT = 1
    While (%homechanct <= $numtok($r.set(personal.Info,HomeChannel),44)) {
      .timer 1 2 if $me !ison $gettok($gettok($r.set(Personal.Info,HomeChannel),%HomeChanCT,44),1,32) join $gettok($r.set(Personal.Info,HomeChannel),%HomeChanCT,44)   
      inc %HomeChanCT 1
    }
  }
}
FTPrankChk {
  if $3 != $null {
    var %tmpCCHCT = 1
    while (%tmpCCHCT <= $comchan($1,0)) {
      var %comlist = %comlist $comchan($1,%tmpCCHCT)
      inc %tmpCCHCT 1
    }
    if %comlist != $null { 
      if ($r.set(FTP. [ $+ [ $2 ] ] ,Channels) == All) {
        var %chanchkCT = 1
        while (%ChanChkCT <= $chan(0)) {
          if ($3 == OP) && ($1 isop $chan(%ChanChkCT)) { return $true }
          if ($3 == VOICE) && ($1 isvo $chan(%ChanChkCT)) { return $true }
          inc %chanchkct 1
        }
      }
      var %tmpCLct = 1
      while (%tmpCLct <= $numtok(%comlist,32)) {
        if ($3 == OP) && ($gettok(%comlist,%tmpCLct,32) isop $r.set(FTP. [ $+ [ $2 ] ] ,Channels)) { return $true }
        if ($3 == VOICE) && ($gettok(%comlist,%tmpCLct,32) isvo $r.set(FTP. [ $+ [ $2 ] ] ,Channels)) { return $true }
        inc %tmpCLct 1
      }
    }
    else { return $false }
  }
}
mp3ChanChk {
  if $1 != $null {
    var %tmpCCHCT = 1
    while (%tmpCCHCT <= $comchan($1,0)) {
      var %comlist = %comlist $comchan($1,%tmpCCHCT)
      inc %tmpCCHCT 1
    }
    if %comlist != $null { 
      if $r.set(mp3serv,Channels) == All { return $true }
      var %tmpCLct = 1
      while (%tmpCLct <= $numtok(%comlist,32)) {
        if $gettok(%comlist,%tmpCLct,32) isin $r.set(mp3serv,Channels) { var %CLflag = 1 }
        inc %tmpCLct 1
      }
      if %CLflag == 1 { return $true }
      else { return $false }
      aecho 9Channels in common with $c(2) $+ $1 $+ $c(1) $+ : $c(2) $+ %comlist
    }
    else { return $false }
  }
}
ScriptGuard {
  var %tmpCT = 1
  Aecho ScriptGuard Report $bracket( [ $calc($alias(0) + $script(0)) script pages loaded ] )
  while (%tmpCT <= $Script(0)) {
    if ($istok($r.glob(Invision,ScriptList),$nopath($script(%tmpCT)),44) != $true) {
      warn Script $nopath($script(%tmpCT)) is loaded and not a native Invision script page 
    }
    inc %tmpCT 1
  }
  var %tmpCT = 1
  while (%tmpCT <= $alias(0)) {
    if ($istok($r.glob(Invision,ScriptList),$nopath($alias(%tmpCT)),44) != $true) {
      warn Script $nopath($alias(%tmpCT)) is loaded and not a native Invision script page 
    }
    inc %tmpCT 1
  }
}
portcheck {  
  aecho $ts $c(2) $+ Checking Local Ports ....
  unset %portinuselist 
  set %PortR1ct 1 | set %portR2ct 1025 | set %PortR3ct 1 | set %PortR4ct 1 | set %PortR5ct 1 | set %PortR5tot $lines($shortfn($mircdirsystem\portscan\common-ports.txt))
  set %portCT 1
  .timerPortCheck -m 66000 40 DoPortChk
}
DoPortChk {
  if $len(%portinuselist) > 400 { set %portinuselist $deltok(%portinuselist,$numtok(%portinuselist,32),32) }
  if $r.glob(Invision,PortRng1) == On && %PortR1ct <= 1024 {
    if $portfree(%PortR1ct) != $true { if %PortR1ct == 80 { if $sock(*,0) == 0 { PChkReport %PortR1ct | Set %portinuselist %portinuselist %PortR1ct $+ , } } | else { PChkReport %PortR1ct | Set %portinuselist %portinuselist %PortR1ct $+ , } }
    inc %PortR1ct 1
    Halt
  }
  if $r.glob(Invision,PortRng2) == On && %PortR2ct <= 10000 {
    if $portfree(%PortR2ct) != $true { PChkReport %PortR2ct | Set %portinuselist %portinuselist %PortR2ct $+ , }
    inc %PortR2ct 1
    Halt
  }
  if $r.glob(Invision,PortRng3) == On && %PortR3ct <= 32000 {
    if $portfree(%PortR3ct) != $true { PChkReport %PortR3ct | Set %portinuselist %portinuselist %PortR3ct $+ , }
    inc %PortR3ct 1
    Halt
  }
  if $r.glob(Invision,PortRng4) == On && %PortR4ct <= 65535 {
    if $portfree(%PortR4ct) != $true { PChkReport %PortR4ct | Set %portinuselist %portinuselist %PortR4ct $+ , }
    inc %PortR4ct 1
    Halt
  }
  if $r.glob(Invision,PortRng5) == On && %PortR5ct <= %PortR5tot {
    var %port = $gettok($read($shortfn($mircdirsystem\portscan\common-ports.txt),%portR5ct),1,32)
    if $portfree(%Port) != $true { PChkReport %Port | Set %portinuselist %portinuselist %Port $+ , }
    inc %PortR5ct 1
    Halt
  }
  .timerPortCheck off
  if $r.glob(Invision,PortsIso) != on {
    Aecho $c(1) $+ Currently the following ports are in use: $c(2) $+ $iif(%portinuselist != $null,$left(%portinuselist,-1),None)
  }
  else { PchkReport Finished | Aecho $ts $c(2) $+ Local Port Check Finished }
}
PChkReport {
  if $r.glob(Invision,PortsIso) == On {
    if ($window(@LocalPorts) == $null) { window -nk0a @LocalPorts -1 -1 550 300 @LocalPorts | aline @LocalPorts $c(2) $+ Current Ports in Use }
    if $1 != Finished {
      if $read($shortfn($mircdirsystem\portscan\common-ports.txt),w,$1 [ $+ [ * ] ] , 1) != $null { 
        var %desc = $gettok($read($shortfn($mircdirsystem\portscan\common-ports.txt),w,$1 [ $+ [ * ] ] , 1),2-,32) 
      }
      aline -p @LocalPorts $c(2) $+ $1 $c(1) $+ :: $c(2) $+ $iif(%desc != $null,%desc,n/a)
    }
    else { 
      aline -p @LocalPorts $c(1) $+ ============== $c(2) $+ Finished $c(1) $+ ================ 
    }
  }
}
bold { return  } 
bld { return  }
pln { return  } 
plain { return  }
uline { return  } 
ul { return  }
white { return 0 } 
c0 { return 0 }
black { return 01 } 
c1 { return 01 }
dblue { return 02 } 
c2 { return 02 }
dgreen { return 03 } 
c3 { return 03 }
red { return 04 } 
c4 { return 04 }
brown { return 05 } 
c5 { return 05 }
purple { return 06 } 
c6 { return 06 }
orange { return 07 } 
c7 { return 07 }
yellow { return 08 } 
c8 { return 08 }
lgreen { return 09 } 
c9 { return 09 }
cyan { return 10 } 
c10 { return 10 }
lCyan { return 11 } 
c11 { return 11 }
blue { return 12 } 
c12 { return 12 }
pink { return 13 } 
c13 { return 13 }
grey { return 14 } 
c14 { return 14 }
lgrey { return 15 } 
c15 { return 15 }
colorhelp {
  aecho Custom Identifiers you can use in the Personal Customizations.
  aecho $c(2) $+ $chr(36) $+ bold  $c(1) $+ or $c(2) $+ $chr(36) $+ bld $c(1) $+ For Bold Type
  aecho $c(2) $+ $chr(36) $+ plain  $c(1) $+ or $c(2) $+ $chr(36) $+ pln $c(1) $+ For Plain Type (clears colors)
  aecho $c(2) $+ $chr(36) $+ uline  $c(1) $+ or $c(2) $+ $chr(36) $+ ul $c(1) $+ For Underline
  aecho $c(2) $+ $chr(36) $+ white  $c(1) $+ or $c(2) $+ $chr(36) $+ c0 $c(1) $+ For White
  aecho $c(2) $+ $chr(36) $+ black  $c(1) $+ or $c(2) $+ $chr(36) $+ c1 $c(1) $+ For Black
  aecho $c(2) $+ $chr(36) $+ dblue  $c(1) $+ or $c(2) $+ $chr(36) $+ c2 $c(1) $+ For Dark Blue
  aecho $c(2) $+ $chr(36) $+ dgreen  $c(1) $+ or $c(2) $+ $chr(36) $+ c3 $c(1) $+ For Dark Green
  aecho $c(2) $+ $chr(36) $+ red  $c(1) $+ or $c(2) $+ $chr(36) $+ c4 $c(1) $+ For Red
  aecho $c(2) $+ $chr(36) $+ brown  $c(1) $+ or $c(2) $+ $chr(36) $+ c5 $c(1) $+ For Brown
  aecho $c(2) $+ $chr(36) $+ purple  $c(1) $+ or $c(2) $+ $chr(36) $+ c6 $c(1) $+ For Purple
  aecho $c(2) $+ $chr(36) $+ orange  $c(1) $+ or $c(2) $+ $chr(36) $+ c7 $c(1) $+ For Orange
  aecho $c(2) $+ $chr(36) $+ yellow  $c(1) $+ or $c(2) $+ $chr(36) $+ c8 $c(1) $+ For Yellow
  aecho $c(2) $+ $chr(36) $+ lgreen  $c(1) $+ or $c(2) $+ $chr(36) $+ c9 $c(1) $+ For Light Green
  aecho $c(2) $+ $chr(36) $+ cyan  $c(1) $+ or $c(2) $+ $chr(36) $+ c10 $c(1) $+ For Cyan
  aecho $c(2) $+ $chr(36) $+ lcyan  $c(1) $+ or $c(2) $+ $chr(36) $+ c11 $c(1) $+ For Light Cyan
  aecho $c(2) $+ $chr(36) $+ blue  $c(1) $+ or $c(2) $+ $chr(36) $+ c12 $c(1) $+ For Blue
  aecho $c(2) $+ $chr(36) $+ pink  $c(1) $+ or $c(2) $+ $chr(36) $+ c13 $c(1) $+ For Pink
  aecho $c(2) $+ $chr(36) $+ grey  $c(1) $+ or $c(2) $+ $chr(36) $+ c14 $c(1) $+ For Grey
  aecho $c(2) $+ $chr(36) $+ lgrey  $c(1) $+ or $c(2) $+ $chr(36) $+ c15 $c(1) $+ For Light Grey
  aecho $c(2) $+ $chr(36) $+ c(1)  $c(1) $+ or $c(2) $+ $chr(36) $+ c(2) $c(1) $+ For Script Colors 1 and 2 respectively
}
testmp3 {
  mp3btnstart
  ; if $os != XP && $r.glob(Invision,ForceXP) != On { window -pdhok0 +Ld @mp3_control $iif(%screen@ >= 1024,930,516) 39 90 27 }
  ; else { window -pdhok0 +Ld @mp3_control $iif(%screen@ >= 1024,930,516) 48 90 27 }
  ; drawpic -cl @mp3_control 4 0 $shortfn($mircdir) $+ Invision\gfx\mp3btns.jpg
  var %z = $dll($_tbwin, GetTBInfo, NOT_USED)
  var %h = $gettok(%z, 2, 32)
  tb.size $iif(%screen@ >= 1024,915,401) $calc(%h + 1)
  .timermp3CU -io 0 1 mp3ctrldisp
  ; .timer -o 1 1 showmirc -s
}
testStop {
  ;tb.stop
  window -c @mp3_control 
  var %z = $dll($_tbwin, GetTBInfo, NOT_USED)
  var %h = $gettok(%z, 2, 32)
  tb.size $iif(%screen@ >= 1024,915,401) $calc(%h + 1)
  .timermp3CU off
}
mp3ctrldisp {
  if $window(@mp3_control) {
    drawrect -f @mp3_control 1 1 2 14 80 12
    mp3ctrltxt $mp3digpos
  }
  ; mp3ctrl
}
mp3ctrl {
  if $appactive == $true && (($appstate != maximized) || ($appstate != normal)) { window -a @mp3_control } | else { window -uh @mp3_Control }
}
mp3ctrltxt { drawtext @mp3_control 15 Arial 9 36 14 $iif($1 != $null,$1,$chr(160))  }
dccctrldisp {
  if ($r.glob(DCCmgr,DCCSpeedMonitor) != On) {
    stopdccbar
  }
  if $window(@dcc_control) {
    if (($send(0) > 0 || $get(0) > 0 ) || (%i.sendspeed > 0 || %i.getspeed > 0) || ($gettok(%ispeed.disp,1,32) != %i.sendspeed || $gettok(%ispeed.disp,2,32) != %i.getspeed)) {
      set %ispeed.disp %i.sendspeed %i.getspeed
      drawrect -f @dcc_control 1 1 2 0 130 27
      dccctrltxt $bytes(%i.sendspeed).suf $bytes(%i.getspeed).suf
    }
  }
}
dccctrl {
  if $appactive == $true && (($appstate != maximized) || ($appstate != normal)) { window -a @dcc_control } | else { window -uh @dcc_Control }
}
dccctrltxt {
  var %x = $calc(60 - $width($1,Arial,10))
  drawtext -p @dcc_control 15 Arial 10 59 1 DCC
  drawtext -p @dcc_control 15 Arial 10 %x 14  $+ $iif($1 != $null,$1,$chr(160))
  drawtext -p @dcc_control 15 Arial 10 70 14 /
  drawtext -p @dcc_control 15 Arial 10 80 14  $+ $iif($2 != $null,$2,$chr(160))
}
dispdccbar {
  dccdisplaystart
  .timerdccCU -io 0 1 dccctrldisp
}
stopdccbar {
  ;tb.stop
  window -c @dcc_control 
  .timerdccCU off
}
timectrldisp {
  if ($r.glob(Invision,TimeDisplay) != On) {
    stoptimebar
  }
  if $window(@time_control) {
    drawrect -f @time_control 1 1 2 1 130 27
    timectrltxt $datedisp ~ $timedisp
  }
}
datedispchange {
  if (%i.datedisp == $null) { set %i.datedisp 1 }
  else { inc %i.datedisp }
  if (%i.datedisp > 7) { set %i.datedisp 1 }
}
timedispchange {
  if (%i.timedisp == $null) { set %i.timedisp 1 }
  else { inc %i.timedisp }
  if (%i.timedisp > 4) { set %i.timedisp 1 }
}
datedisp {
  if (%i.datedisp == 1 || %i.datedisp == $null) { return $date(mmmm d $+ $chr(44) yyyy) }
  if (%i.datedisp == 2) { return $date(d mmmm yyyy) }
  if (%i.datedisp == 3) { return $date(m/d/yy) }
  if (%i.datedisp == 4) { return $date(d/m/yy) }
  if (%i.datedisp == 5) { return $date(m/d/yyyy) }
  if (%i.datedisp == 6) { return $date(d/m/yyyy) }
  if (%i.datedisp == 7) { return $date(yyyy/m/d) }
}
timedisp {
  if (%i.timedisp == 1 || %i.timedisp == $null) { return $time(h:nntt) }
  if (%i.timedisp == 2) { return $time(H:nn) }
  if (%i.timedisp == 3) { return $time(h:nn:sstt) }
  if (%i.timedisp == 4) { return $time(H:nn:ss) }
}
timectrl {
  if $appactive == $true && (($appstate != maximized) || ($appstate != normal)) { window -a @time_control } | else { window -uh @time_Control }
}
timectrltxt {
  tokenize 126 $1-
  var %x = $calc(72.5 - $calc($width($1,Arial,10) / 2))
  var %x2 = $calc(72.5 - $calc($width($2,Arial,10) / 2))
  drawtext -p @time_control 15 Arial 10 %x 1  $+ $iif($1 != $null,$1,$chr(160))
  drawtext -p @time_control 15 Arial 10 %x2 14  $+ $iif($2 != $null,$2,$chr(160))
}
disptimebar {
  timedisplaystart
  .timertimeCU -io 0 1 timectrldisp
}
stoptimebar {
  ;tb.stop
  window -c @time_control
  var %z = $dll($_tbwin, GetTBInfo, NOT_USED)
  var %h = $gettok(%z, 2, 32)
  tb.size $iif(%screen@ >= 1024,915,401) $calc(%h + 1)
  .timertimeCU off
}
mp3playplaySEL { 
  set %mp3toplay $$dir="Choose a mp3 To play" [ $iif($exists(%lastmp3dir) == $true,%lastmp3dir,C:\) $+ .mp3 ] 
  mp3Stop 
  mp3play %mp3toplay 
  set %lastmp3dir $nofile(%mp3toplay) 
  set %mp3resume Pause mp3 playback 
  if ($r.glob(Invision,Amip) != On) { .timer -o 1 2 mp3info %mp3toplay }
  mp3historyADD %mp3toplay 
}
mp3playplayRND { 
  set %dirtouse [ $iif($exists(%lastmp3dir) == $true,%lastmp3dir,C:\) ] 
  set %mp3toplay $findfile(%dirtouse,*.mp3,$rand(1,$findfile(%dirtouse,*.mp3,0))) 
  mp3play %mp3toplay 
  set %mp3resume Pause mp3 playback 
  if ($r.glob(Invision,Amip) != On) { .timer -o 1 2 mp3info %mp3toplay }
  mp3historyADD %mp3toplay 
}
mp3playplaydir { 
  set %mp3dpdir $sdir($iif($exists(%lastmp3dir) == $true,%lastmp3dir,C:\),"Select mp3 directory to randomly play from") 
  set %lastmp3dir %mp3dpdir 
  if %mp3dpdir != $null { 
    set %mp3dirplay 1 
    set %mp3resume Pause mp3 playback 
    mp3dirplay 
    .timermp3Player -o 0 7 mp3maintain 
  } 
}
mp3playstop { mp3stop | unset %mp3dirplay %mp3resume }
mp3playpause { if $left(%mp3resume,5) == Pause { set %mp3resume Resume mp3 playback | mp3pauseplay } | else { set %mp3resume  Pause mp3 playback | mp3unpauseplay } }
mp3playBack { set %mp3toplay $mp3historyGET | mp3stop | mp3play %mp3toplay | set %mp3resume Pause mp3 playback | if ($r.glob(Invision,Amip) != On) { .timer -o 1 2 mp3info %mp3toplay } }
mp3playNext { if %mp3dirplay == 1 { mp3stop | mp3dirplay } }
adduser {
  ;                                    ******************  adduser <type> <nick> <chan>
  if $2 != $null {
    whodat $2
    if $address($2,5) == $null { aecho User List Add Failed | return }
    if $1 == Elite {
      .auser 30 $address($2,%SecurityLev) $address($2,5) $ctime Default,+v+dp+ro+rc+rf $3 $+ ,+v+dp+ro+rc+rf
    }
    if $1 == Op {
      .auser 20 $address($2,%SecurityLev) $address($2,5) $ctime Default,+rf $3 $+ ,+rc+rf
    }
    if $1 == Bot {
      .auser 17 $address($2,%SecurityLev) $address($2,5) $ctime Default, $3 $+ ,
    }
    if $1 == Friend {
      .auser 15 $address($2,%SecurityLev) $address($2,5) $ctime Default, $3 $+ ,
    }
    if $1 == Ban {
      .auser 7 $address($2,%SecurityLev) $address($2,5) $ctime Default, $3-
    }
    if $1 == Shitlist {
      .auser 5 $address($2,%SecurityLev) $address($2,5) $ctime $3-
    }
    if $1 == TempDCC { 
      .timer -o 1 $calc($r.glob(Invision,TempDCCtime) * 60) .ruser =13 $address($2,%SecurityLev) 
      .auser 13 $address($2,%SecurityLev) $address($2,5) $ctime $3 $+ $chr(44)
      idccallow $2
    }
  }
}
CheckPending {
  ;                                                 ********* $CheckPending(<host,5>)
  if ($1 != $null) && ($chr(44) !isin $1-) { 
    var %fn = $replace($mask($1,8),$chr(124),_,$chr(92),_,$chr(47),_,$chr(60),_,$chr(62),_,$chr(42),_) $+ .dlv
    if ($isfile( [ $shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] ] )) { if ($lines( [ $shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] ] ) >= 1) { return $true } }
    return $false
  }
}
MessageCt {
  ;                                                 ********* $MessageCT(<host,5>)
  if ($1 != $null) { 
    var %fn = $replace($mask($1,8),$chr(124),_,$chr(92),_,$chr(47),_,$chr(60),_,$chr(62),_,$chr(42),_) $+ .dlv
    if ($isfile( [ $shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] ] ) == $true) { if $lines( [ $shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] ] ) >= 1 { return $lines( [ $shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] ] ) } }
    else { return 0 }
  }
}
DeliverMsg {
  ;                                         ********** delivermsg <host>
  if ($1 != $null) {
    var %fn = $replace($mask($1,8),$chr(124),_,$chr(92),_,$chr(47),_,$chr(60),_,$chr(62),_,$chr(42),_) $+ .dlv
    write -n [ $shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] ] $$?="Message to Deliver?"
  }
}
DeleteMsg {
  ;                                         ********** DeleteMsg <host>
  if ($1 != $null) {
    var %fn = $replace($mask($1,8),$chr(124),_,$chr(92),_,$chr(47),_,$chr(60),_,$chr(62),_,$chr(42),_) $+ .dlv
    .remove [ $shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] ]
  }
}
SendMessages {
  ;                                         *********** SendMessages <host> <current nick>
  if ($2 != $null) {
    var %fn = $replace($mask($1,8),$chr(124),_,$chr(92),_,$chr(47),_,$chr(60),_,$chr(62),_,$chr(42),_) $+ .dlv
    if ($isfile( [ $shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] ] ) == $true) { 
      var %lines = $lines( [ $shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] ] )
      var %ct = 1
      while (%ct <= %lines) {
        .msg $2  Message %ct $+ : $read($shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] , n, %ct) 
        inc %ct 1 
      }
      .remove [ $shortfn($mircdir) $+ invision\deliver\ [ $+ [ %fn ] ] ]
    }
  }
}
ufchk {
  ;                                         ***** ufchk(<user!id@host>,<flag>,<channel>)
  if ($2 != $null) {
    if ($2 != +dp) && ($2 != +pw) {
      if ($3 != $null) {
        var %info = $ulist($1).info
        var %str = $3 $+ $chr(44)
        var %strp = %str $+ *
        if (%str isin %info) {
          var %chanset = $wildtok(%info,%strp,1,32)
          var %chanset = $gettok(%chanset,2-,44)
          if ($2 isin %chanset) { return $true }
          else { return $false }
        }
        else { 
          return $false
        }
      }
    }
    else {
      var %info = $ulist($1).info
      if ($2 isin %info) { return $true }
      else { return $false }
    }
  }
  return $false
}
upwget {
  ;                                            ***** upwget(<user!id@host>)
  if ($1 != $null) {
    var %info = $ulist($1,*,1).info
    var %pw = $right($gettok($wildtok(%info,pw*,1,43),1,32),-2)
    return %pw
  }
}
utpget {
  ;                                            ***** utpget(<user!id@host>)
  if ($1 != $null) {
    var %info = $ulist($1,*,1).info
    var %tp = $right($gettok($wildtok(%info,tp*,1,43),1,32),-2)
    return %tp
  }
}
uchanchk {
  ;                                            ********** uchanchk(user!ident@host.com,channel)
  if ($2 != $null) {
    if ($2 isin $ulist($1).info) { return $true }
    else { return $false }
  }
}
uchanadd {
  ;                                       ***************  uchanadd <host> <chan> 
  if ($2 != $null) {
    if ($level($1) >= 15) {
      if ($uchanchk($1,$2) == $false) {
        var %hold = $ulist($1,*,1).info
        var %host = $ulist($1,*,1)
        var %lev = $level($1)
        if (Default isin %hold) {
          var %temp = $gettok(%hold,3,32)
          var %new = $replace(%temp,Default,$2)
          var %newinfo = %hold %new
          .auser %lev %host %newinfo 
          aecho $2 was added to users profile
        }
        else { aecho Failed to add channel since there is no Default Template for this profile }
      }
    }
    else { aecho Failed to add channel since user is not a friend or higher in the User Lists }
  }
}
cfchk {
  ;                                                       **** cfchk(<channel>,<+flag>)
  if ($2 != $null) {
    if ($2 isin $r.cf(Chanset,$1)) { return $true }
    else { return $false }
  }
}
cgetset {
  ;            ************************     $cgetset(#channel,setting)
  ;                            Settings Are 
  ;                        rfct = Repeat Flood Count 
  ;                        bdct = Ban Same Domain Count 
  ;                        rcpw = Remote Control PW
  ;                        plint  = Channel Limit Interval
  ;                        plhr  = Channel Limit Headroom
  ;                        lktime = LockDown Channel Time Amount in Min.
  ;                        lkct = Lockdown Channel Event Count
  ;                        lkspan = Lockdown Channel Time Span for event accumulation
  ;
  if ($2 != $null) {
    var %data = $gettok($r.cf(Chanset,$1),2-,44)

    if ($2 == rfct) {
      return $gettok(%data,1,44)
    }
    elseif ($2 == rcpw) {
      return $gettok(%data,2,44)
    }
    elseif ($2 == plint)  {
      return $gettok(%data,3,44)
    }
    elseif ($2 == plhr) {
      return $gettok(%data,4,44)
    }
    elseif ($2 == lktime) {
      return $gettok(%data,5,44)
    }
    elseif ($2 == lkct)  {
      return $gettok(%data,6,44)
    }
    elseif ($2 == lkspan) {
      return $gettok(%data,7,44)
    }
  }
}
csetset {
  ;                ******************    $csetset(#channel,setting,on/off)
  ;
  if ($3 != $null) {
    var %full = $r.cf(ChanSet,$1)
    if (%full != $null) {
      var %flags = $gettok(%full,1,44)
      var %counts = $gettok(%full,2-,44)
      if ($2 == pf) {
        if ($3 == On) {
          if (+pf !isin %flags) { var %flags = %flags $+ +pf }
          else { return Protect friends is already }
        }
        else {
          var %flags = $remove(%flags,+pf)
        }
      }
      elseif ($2 == so) {
        if ($3 == On) {
          if (+so !isin %flags) { var %flags = %flags $+ +so }
          else { return Deop on Server Ops is already }
        }
        else {
          var %flags = $remove(%flags,+so)
        }
      }
      elseif ($2 == bm) {
        if ($3 == On) {
          if (+bm !isin %flags) { var %flags = %flags $+ +bm }
          else { return Bitchmode is already }
        }
        else {
          var %flags = $remove(%flags,+bm)
        }
      }
      elseif ($2 == do) {
        if ($3 == On) {
          if (+do !isin %flags) { var %flags = %flags $+ +do }
          else { return DeOp on Mass Deops is already }
        }
        else {
          var %flags = $remove(%flags,+do)
        }
      }
      elseif ($2 == kf) {
        if ($3 == On) {
          if (+kf !isin %flags) { var %flags = %flags $+ +kf }
          else { return Kick on Floods is already }
        }
        else {
          var %flags = $remove(%flags,+kf)
        }
      }
      elseif ($2 == kt) {
        if ($3 == On) {
          if (+kt !isin %flags) { var %flags = %flags $+ +kt }
          else { return Kick on Trades is already }
        }
        else {
          var %flags = $remove(%flags,+kt)
        }
      }
      elseif ($2 == bf) {
        if ($3 == On) {
          if (+bf !isin %flags) { var %flags = %flags $+ +bf }
          else { return Ban on Floods is already }
        }
        else {
          var %flags = $remove(%flags,+bf)
        }
      }
      elseif ($2 == rf) {
        if ($3 == On) {
          if (+rf !isin %flags) { var %flags = %flags $+ +rf }
          else { return Repeat Flood Protection is already }
        }
        else {
          var %flags = $remove(%flags,+rf)
        }
      }
      elseif ($2 == nf) {
        if ($3 == On) {
          if (+nf !isin %flags) { var %flags = %flags $+ +nf }
          else { return Kick/Ban on Nick Floods is already }
        }
        else {
          var %flags = $remove(%flags,+nf)
        }
      }
      elseif ($2 == wo) {
        if ($3 == On) {
          if (+wo !isin %flags) { var %flags = %flags $+ +wo }
          else { return WallOP Actions is already }
        }
        else {
          var %flags = $remove(%flags,+wo)
        }
      }
      elseif ($2 == kl) {
        if ($3 == On) {
          if (+kl !isin %flags) { var %flags = %flags $+ +kl }
          else { return Learn Channel Keys is already }
        }
        else {
          var %flags = $remove(%flags,+kl)
        }
      }
      elseif ($2 == lk) {
        if ($3 == On) {
          if (+lk !isin %flags) { var %flags = %flags $+ +lk }
          else { return Channel Lockdowns is already }
        }
        else {
          var %flags = $remove(%flags,+lk)
        }
      }
      elseif ($2 == pl) {
        if ($3 == On) {
          if (+pl !isin %flags) { var %flags = %flags $+ +pl }
          else { return Channel Occupancy Limit is already }
        }
        else {
          var %flags = $remove(%flags,+pl)
        }
      }
      elseif ($2 == ftp) {
        if ($3 == On) {
          if (+ftp !isin %flags) { var %flags = %flags $+ +ftp }
          else { return Auto-Voice FTPs is already }
        }
        else {
          var %flags = $remove(%flags,+ftp)
        }
      }
      elseif ($2 == fs) {
        if ($3 == On) {
          if (+fs !isin %flags) { var %flags = %flags $+ +fs }
          else { return Auto-Voice Fserves is already  }
        }
        else {
          var %flags = $remove(%flags,+fs)
        }
      }
      elseif ($2 == xdcc) {
        if ($3 == On) {
          if (+ftp !isin %flags) { var %flags = %flags $+ +ftp }
          else { return Auto-Voice XDCC's is already }
        }
        else {
          var %flags = $remove(%flags,+ftp)
        }
      }
      elseif ($2 == mp3) {
        if ($3 == On) {
          if (+fs !isin %flags) { var %flags = %flags $+ +fs }
          else { return Auto-Voice mp3's is already  }
        }
        else {
          var %flags = $remove(%flags,+fs)
        }
      }

      else { return Failed to set }
      var %final = %flags $+ $chr(44) $+ %counts
      w.cf Chanset $1 %final
      return succesfully set
    }
  }
}
csaveset {
  if ($1 != $null) {
    var %flags = *
    if ($did(InvisMain,301).state == 1) { var %flags = %flags $+ +pf }
    if ($did(InvisMain,302).state == 1) { var %flags = %flags $+ +of } 
    if ($did(InvisMain,303).state == 1) { var %flags = %flags $+ +so } 
    if ($did(InvisMain,304).state == 1) { var %flags = %flags $+ +bm }
    if ($did(InvisMain,305).state == 1) { var %flags = %flags $+ +do }
    if ($did(InvisMain,306).state == 1) { var %flags = %flags $+ +oaf } 
    if ($did(InvisMain,311).state == 1) { var %flags = %flags $+ +kf  } 
    if ($did(InvisMain,312).state == 1) { var %flags = %flags $+ +kt } 
    if ($did(InvisMain,313).state == 1) { var %flags = %flags $+ +bf } 
    if ($did(InvisMain,314).state == 1) { var %flags = %flags $+ +rf }
    if ($did(InvisMain,317).state == 1) { var %flags = %flags $+ +nf } 
    if ($did(InvisMain,326).state == 1) { var %flags = %flags $+ +wo  } 
    if ($did(InvisMain,348).state == 1) { var %flags = %flags $+ +kl } 
    if ($did(InvisMain,328).state == 1) { var %flags = %flags $+ +rc } 
    if ($did(InvisMain,331).state == 1) { var %flags = %flags $+ +pl }
    if ($did(InvisMain,336).state == 1) { var %flags = %flags $+ +lk }
    if ($did(InvisMain,866).state == 1) { var %flags = %flags $+ +ftp }
    if ($did(InvisMain,817).state == 1) { var %flags = %flags $+ +fs } 
    if ($did(InvisMain,736).state == 1) { var %flags = %flags $+ +xdcc }
    if ($did(InvisMain,737).state == 1) { var %flags = %flags $+ +mp3 } 
    var %flags = %flags $+ $chr(44)
    var %flags = %flags $+ $isset($did(Invismain,315).text,4) $+ $chr(44) 
    var %flags = %flags $+ $isset($did(Invismain,330).text,n/a) $+ $chr(44)
    var %flags = %flags $+ $isset($did(Invismain,333).text,2) $+ $chr(44)
    var %flags = %flags $+ $isset($did(Invismain,335).text,8) $+ $chr(44)
    var %flags = %flags $+ $isset($did(Invismain,338).text,1) $+ $chr(44)
    var %flags = %flags $+ $isset($did(Invismain,340).text,10) $+ $chr(44)
    var %flags = %flags $+ $isset($did(Invismain,342).text,14) 
    w.cf Chanset $1 %flags
    if $did(InvisMain,403).seltext == Keyed {

    }
  }
}
choFdef { 
  if ($1 != $null) {
    if ($1 == +pf) { return Protect Fellow Ops }
    if ($1 == +of) { return Allow /ctcp OPME's }
    if ($1 == +so) { return Deop Server Ops }
    if ($1 == +bm) { return Bitch Mode }
    if ($1 == +do) { return Deop on Mass Deop }
    if ($1 == +oaf) { return Op all friends }
    if ($1 == +kf) { return Kick on Text Floods }
    if ($1 == +kt) { return Kick on trades }
    if ($1 == +bf) { return Ban on Text Floods }
    if ($1 == +bd) { return Ban on Mass Joins from same Domain }
    if ($1 == +nf) { return Kick and Ban on Nick Flood }
    if ($1 == +wo) { return Wallop Actions }
    if ($1 == +kl) { return Learn New Keys }
    if ($1 == +rc) { return ChanOps Remote Control }
    if ($1 == +lk) { return Channel Lockdowns }
    if ($1 == +pl) { return Maintain Occupancy Limit }
    if ($1 == +ftp) { return Auto Voice Fserves }
    if ($1 == +fs) { return Auto Voice FTP's }
    if ($1 == +xdcc) { return Auto Voice Xdcc's }
    if ($1 == +mp3) { return Auto Voice mp3's }
    if ($1 == +rf) { return Repeat Floods }
  }
}
choLOAD {
  if $1 != $null {
    if (+pf isin $r.cf(Chanset,$1)) { did -c InvisMain 301 }
    if (+of isin $r.cf(Chanset,$1)) { did -c InvisMain 302 }
    if (+so isin $r.cf(Chanset,$1)) { did -c InvisMain 303 }
    if (+bm isin $r.cf(Chanset,$1)) { did -c InvisMain 304 }
    if (+do isin $r.cf(Chanset,$1)) { did -c InvisMain 305 }
    if (+oaf isin $r.cf(Chanset,$1)) { did -c InvisMain 306 }
    if (+kf isin $r.cf(Chanset,$1)) { did -c InvisMain 311 }
    if (+kt isin $r.cf(Chanset,$1)) { did -c InvisMain 312 }
    if (+bf isin $r.cf(Chanset,$1)) { did -c InvisMain 313 }
    if (+rf isin $r.cf(Chanset,$1)) { did -c InvisMain 314 }
    if (+nf isin $r.cf(Chanset,$1)) { did -c InvisMain 317 }
    if (+wo isin $r.cf(Chanset,$1)) { did -c InvisMain 326 }
    if (+kl isin $r.cf(Chanset,$1)) { did -c InvisMain 348 }
    if (+rc isin $r.cf(Chanset,$1)) { did -c InvisMain 328 }
    if (+pl isin $r.cf(Chanset,$1)) { did -c InvisMain 331 }
    if (+lk isin $r.cf(Chanset,$1)) { did -c InvisMain 336 }
    if (+ftp isin $r.cf(Chanset,$1)) { did -c InvisMain 866 }
    if (+fs isin $r.cf(Chanset,$1)) { did -c InvisMain 817 }
    if (+xdcc isin $r.cf(Chanset,$1)) { did -c InvisMain 736 }
    if (+mp3 isin $r.cf(Chanset,$1)) { did -c InvisMain 737 }
    did -ra InvisMain 315 $gettok($r.cf(Chanset,$1),2,44)
    did -ra InvisMain 330 $gettok($r.cf(Chanset,$1),3,44)
    did -ra InvisMain 333 $gettok($r.cf(Chanset,$1),4,44)
    did -ra InvisMain 335 $gettok($r.cf(Chanset,$1),5,44)
    did -ra InvisMain 338 $gettok($r.cf(Chanset,$1),6,44)
    did -ra InvisMain 340 $gettok($r.cf(Chanset,$1),7,44)
    did -ra InvisMain 342 $gettok($r.cf(Chanset,$1),8,44)
  }
}
choCLEAR {
  did -u InvisMain 301,302,303,304,305,306,311,312,313,314,317,326,328,331,336,348,866,817,736,737,403
  did -r InvisMain 315,330,333,335,338,340,342
  did -rh InvisMain 407
}
chmodeCLR {
  did -u InvisMain 404,405
}
chmodeLOAD {
  if ($2 != $null) {
    if (+ [ $+ [ $2 ] ] isin $r.cf(Chanmodes,$1)) { if $2 == k { did -ra InvisMain 407 $right($wildtok($r.cf(Chanmodes,$1), + [ $+ [ $2 ] ] [ $+ [ * ] ] ,1,44),-2) } | return P }
    if (- [ $+ [ $2 ] ] isin $r.cf(Chanmodes,$1)) { return M }
  }
}
chmodeSAVE { 
  if ($2 != $null) { 
    var %mode = $mid($2,2,1) $+ *
    var %ex = $wildtok($r.cf(Chanmodes,$1), [ + [ $+ [ %mode ] ] ] ,1,44)
    if (%ex == $null) { var %ex = $wildtok($r.cf(Chanmodes,$1), [ - [ $+ [ %mode ] ] ] ,1,44) } 
    if (%ex != $null) { 
      w.cf Chanmodes $1 $reptok($r.cf(Chanmodes,$1),%ex,$2,1,44)
    }
    else {
      w.cf Chanmodes $1 $addtok($r.cf(Chanmodes,$1),$2,44)
    }
  }
}
chmodeDEL { 
  if ($2 != $null) {
    var %mode = $2 $+ *
    var %ex = $wildtok($r.cf(Chanmodes,$1),+ [ $+ [ %mode ] ] ,1,44)
    if (%ex == $null) { var %ex = $wildtok($r.cf(Chanmodes,$1),- [ $+ [ %mode ] ] ,1,44) } 
    if (%ex != $null) { 
      w.cf Chanmodes $1 $remtok($r.cf(Chanmodes,$1),%ex,1,44)
    }
  }
}
chmodeLTR {
  if ($gettok($did(InvisMain,403).seltext,1,32) == Only) { return t }
  if ($gettok($did(InvisMain,403).seltext,1,32) == No) { return n }
  if ($gettok($did(InvisMain,403).seltext,1,32) == Moderated) { return m }
  if ($gettok($did(InvisMain,403).seltext,1,32) == Invite) { return i }
  if ($gettok($did(InvisMain,403).seltext,1,32) == Secret) { return s }
  if ($gettok($did(InvisMain,403).seltext,1,32) == Private) { return p }
  if ($gettok($did(InvisMain,403).seltext,1,32) == Keyed) { return k }
  if ($gettok($did(InvisMain,403).seltext,1,32) == Registered) { return R }
}
choDEL {
  if ($1 != $null) {
    w.cf ChanOps Channels $remtok($r.cf(Chanops,Channels),$1,1,44)
    d.cf Chanset $1
    d.cf Chanmodes $1
  }
}
chmodeEnforce {
  ;                                        ***** chmodeEnforce [ #channel ]
  if ($1 != $null) { 
    if ($me isop $1) {
      var %cset = $r.cf(Chanmodes,$1)
      var %curmodes = $gettok($chan($1).mode,1,32)
      var %ct = 1
      var %plus = +
      var %minus = -
      while (%ct <= $numtok(%cset,44)) { 
        var %tok = $gettok(%cset,%ct,44)
        if (%tok == -k) { if ($right(%tok,1) isin %curmodes) { .mode $1 -k $chan($1).key } }
        elseif $left(%tok,2) == +k { if ($right(%tok,-2) != $chan($1).key) { .mode $1 -k $chan($1).key | .mode $1 +k $right(%tok,-2)  } }
        elseif $left(%tok,1) == + { if ($right(%tok,1) !isin %curmodes) { var %plus = %plus $+ $right(%tok,1) } }
        else { if ($right(%tok,1) isin %curmodes) { var %minus = %minus $+ $right(%tok,1) } }
        inc %ct 1
      }
      if ($calc($len(%plus) + $len(%minus)) >= 3) { .mode $1 $iif($len(%minus) > 1,%minus) $+ $iif($len(%plus) > 1,%plus) }
    }
  }
  else {
    var %ot = 1
    while (%ot <= $chan(0)) {
      if ($istok($r.cf(ChanOps,Channels),$chan(%ot),44)) {
        If ($me isop $chan(%ot)) {
          var %cset = $r.cf(Chanmodes,$chan(%ot))
          var %curmodes = $gettok($chan(%ot).mode,1,32)
          var %st = 1
          var %plus = +
          var %minus = -
          while (%st <= $numtok(%cset,44)) {
            var %tok = $gettok(%cset,%st,44)
            if (%tok == -k) { if ($right(%tok,1) isin %curmodes) { .mode $chan(%ot) -k $chan($chan(%ot)).key } }
            elseif ($left(%tok,2) == +k) { if ($right(%tok,-2) != $chan($chan(%ot)).key) { .mode $chan(%ot) -k $chan($chan(%ot)).key | .mode $chan(%ot) +k $right(%tok,-2)  } }
            elseif ($left(%tok,1) == +) { if ($right(%tok,1) !isin %curmodes) { var %plus = %plus $+ $right(%tok,1) } }
            else { if ($right(%tok,1) isin %curmodes) { var %minus = %minus $+ $right(%tok,1) } }
            inc %st 1
          }
          if ($calc($len(%plus) + $len(%minus)) >= 3) { .mode $chan(%ot) $iif($len(%minus) > 1,%minus) $+ $iif($len(%plus) > 1,%plus) }
        }
      } 
      inc %ot 1
    }
  }
}
uStat {
  if ($1 != $null) {
    if (%whoisCT [ $+ [ $iNetwork ] ] >= 1) || ($r.set(Invision,isoWhois) == On) {
      UserInfo User List Category: $c(2) $+ $urank($level($1))
    }
    else {
      aecho User List Category: $c(2) $+ $urank($level($1))
    }
  }
}
urank {
  if ($1 != $null) {
    if ($1 == 30) { return Elite }
    if ($1 == 20) { return Fellow Op }
    if ($1 == 17) { return Bot }
    if ($1 == 15) { return Friend }
    if ($1 == 13) { return Temporary DCC Permited }
    if ($1 == 7) { return DCC Banned }
    if ($1 == 5) { return Shitlisted }
    return Not in User Lists
  }
}
udccchk {
  ;                              ********* $udccchk(<host,5>)
  if ($1 != $null) {
    if ($level($1) == 13) { return $true }
    if ($ufchk($1,+dp)) { return $true }
    return $false
  }
}
udccset {
  ;                                     ***************          udccset <host> <nick> 
  if ($1 != $null) {
    if ($level($1) == 10) {
      adduser TempDCC $2 $3
      if %masstmp [ $+ [ $iNetwork ] ] != 1 { aecho $c(1) $+ $2 has been given Temporary DCC Permissions }
    }
    else {
      if $level($1) < 10 { aecho $c(1) $+ $2 is already in the user list as shitlisted or dcc banned. Clear that out first | Halt }
      if $level($1) == 13 { aecho $c(1) $+ $2 already has Temp DCC Permisions | Halt }
      if $ufchk($1,+dp,Default) { aecho $c(1) $+ $2 already has DCC permisions | halt }
      var %tlev = $level($1)
      var %thst = $ulist($1,%tlev,1)
      var %tstr = $ulist($1,%tlev,1).info
      var %tdft = $gettok(%tstr,3,32)
      var %rtn = $replace(%tstr,%tdft,%tdft $+ +dp)
      .ruser %tlev %thst
      .auser %tlev %thst %rtn
      .timer -o 1 $calc($r.glob(Invision,TempDCCtime) * 60) uclrtmpdcc %thst
      set %TempDCCList $addtok(%TempDCCList,%thst,44)
      if %masstmp [ $+ [ $iNetwork ] ] != 1 { aecho $c(1) $+ $2 has been given Temporary DCC Permissions. }
    }
  }
}
uclrtmpdcc {
  if $1 != $null {
    var %tlev = $level($1)
    var %thst = $iif($ulist($1,%tlev,1) != $null,$ulist($1,%tlev,1),$1)
    var %tstr = $ulist($1,%tlev,1).info
    var %tdft = $gettok(%tstr,3,32)
    var %rtn = $replace(%tstr,%tdft,$remove(%tdft,+dp))
    .ruser %tlev %thst
    .auser %tlev %thst %rtn
  }
}
clralltmpdcc {
  var %tnum = $numtok(%TempDCCList,44)
  if %tnum != $null && %tnum > 0 {
    var %ct = 1
    while (%ct <= %tnum) {
      uclrtmpdcc $gettok(%tempDCCList,%ct,44)
      inc %ct 1 
    }
  }
  .rlevel 13
  unset %TempDCCLIst
  aecho $c(1) $+ Temp DCC permissions list has been cleared
}
dccok {
  if $1 != $null {
    if (($level($1) >= 13) && ($ufchk($1,+dp,Default))) || $level($1) == 13 { return $true }
    else { return $false }
  }
  return $false
}
manclrdcc {
  if $1 != $null {
    if $level($1) == 13 { 
      .ruser $ulist($1,13,1)
      aecho $c(1) $+ DCC permissions removed for $iif($2 != $null,$2,user)
    }
    if $ufchk($1,+dp,Default) {
      uclrtmpdcc $1
      aecho $c(1) $+ DCC permissions removed for $iif($2 != $null,$2,user)
    }
  }
}
OKbox {
  if $1 != $null {
    set %OKBtitle $1
    set %OKBfunc $2
    set %OKBx $3
    set %OKBy $4
    set %OKBmsg $5-
    set %OKBflag 0
    set %txtX $calc((%OKBx / 2) - 15)
    set %txtY $calc(%OKBy - 16)
    set %OKBtxt 3 2 %txtX %txtY
    dialog -mdo OKbox OKbox
  }
}
firstStartImp {
  if $$?!="This is the first time you have run Invision [ $r.static(Script,Version) ] $+ . Invision features an importer that will import a lot of your settings from previous Invision 1.0, Invision 2.0, Invision 3.x, Polaris Client (and most Polaris Clones), and even plain mIRC. This can save you a lot of setup time. Do you wish to import settings?" == $true {
    startimport
  }
}
uponedir {
  if $1 != $null {
    if $count($1-,$chr(92)) <= 1 { return $left($1-,3) }
    var %tmpDCct = $calc($len($1-) - 1)
    while (%tmpDCct >= 2) { 
      if $mid($1-,%tmpDCct,1) == $chr(92) { return $left($1-,%tmpDCct) }
      dec %tmpDCct 1
    }
  }
}
StartImport {   
  OKbox Import_Settings ImportWiz 160 80 This will allow you to import settings from a previous Invision 1.0, Invision 2.0, Invision 3.x, Polaris Client (and most Polaris Clones), and even plain mIRC. You will be prompted to select an old mIRC directory to import from. This is where you would find the mirc.exe and mirc.ini files. Once finished a new Invision client will start and this client will be closed (DO NOT MANUALLY CLOSE THIS CLIENT). Please switch to the new mIRC client when it starts. Check the import.log file for details on the results of the import if you wish.
}
popinfo {
  if $1 != $null {
    return $input($2,64,$1,?)

  }
}
awaychok {
  ;                                        *************  awaychok($chan)
  if $1 != $null {
    if $r.set(Away,chanInclude) == On {
      if $r.set(Away,Channels) == All || $r.set(Away,Channels) == $null { return $true }
      else { if $istok($r.set(Away,Channels),$1,44) { return $true } | else { return $false } }
    }
    else {
      if $r.set(Away,Channels) == All || $r.set(Away,Channels) == $null { return $false }
      else { if $istok($r.set(Away,Channels),$1,44) { return $false } | else { return $true } }
    }
  }
  return $false
}
botdcc {
  ;                                            *************     botdcc $botnick
  if $1 != $null { 
    if ($isbotlinked($1) == $false) { 
      .timer -o 1 $iif($r.glob(Invision,BotConnTO) != $null,$r.glob(Invision,BotConnTO),40) sockclose BOT- [ $+ [ $1 ] ] ]
      set %BOTport [ $+ [ $1 ] ] $rand(2500,12000)
      socklisten [ BOT- [ $+ [ $1 ] ] ] %BOTport [ $+ [ $1 ] ]
      .raw PRIVMSG $1 : $+ DCC CHAT chat $longip($ip) [ %BOTport [ $+ [ $1 ] ] ] $+ 
    }
  }
}
BotDelink {
  if $1 != $null {
    .timer -o 1 0 sockclose [ BOT+ [ $+ [ $1 ] ] ]
    if $isbotlinked($1) {
      set %BOTdccs $remtok(%BOTdccs,$1,1,44)
      aecho $1 has been Delinked
    }
  }
}
isbotlinked {
  ;                                            ****************  isbotlinked(botnick)
  if $1 != $null {
    if $istok(%BOTdccs,$1,44) == $true { return $true }
    else { return $false }
  }
}
botcmdque {
  ;                                           ***************** botcmdque <botnick> <bot dcc command>
  if $2 != $null {
    set %botq- [ $+ [ $1 ] ] $addtok(%botq- [ $+ [ $1 ] ] ,$2-,44)
  }
}
botsendcmd {
  ;                                           ****************** botsendcmd <botnick>
  if $1 != $null {
    var %ct = 1
    while (%ct <= $numtok(%botq- [ $+ [ $1 ] ] ,44)) {
      if $sock(BOT+ [ $+ [ $1 ] ] ,0) >= 1 { sockwrite -tn BOT+ [ $+ [ $1 ] ] $gettok(%botq- [ $+ [ $1 ] ] ,%ct,44) }
      inc %ct 1 
    }
    unset %botq- [ $+ [ $1 ] ]
  }
}
SendToBot {
  ;                                         ****************** SendToBot <botnick> <command>
  if $2 != $null { 
    if $isbotlinked($1) { 
      if $sock(BOT+ [ $+ [ $1 ] ] ,0) >= 1 { sockwrite -tn BOT+ [ $+ [ $1 ] ] $2- }
    }
    else { 
      botcmdque $1 $2-
      botdcc $1 
    }
  }
}
ShowBotLinks {
  if $numtok(%Botdccs,44) < 1 { Aecho There are no bots linked. }
  else {
    var %ct = 1
    while (%ct <= $numtok(%botdccs,44)) {
      var %botlist = %botlist $c(2) $+ $gettok(%botdccs,%ct,44) $c(1) $+ •
      inc %ct 1 
    }
    aecho Current Bot Links: $left(%botlist,-1)
  }
}
DelayAutoMode {
  ;               ***************************  DelayAutoMode <op/voice> 
  if $3 != $null {

  }
}
click { 
  if $r.set(Invision,SndOpt15) == On {
    if $isfile($shortfn($mircdir) $+ $r.glob(Themes,Sound42)) { splay $shortfn($mircdir) $+ $r.glob(Themes,Sound42) }
  }
}
setsaved {
  if $r.set(Invision,SndOpt15) == On {
    if $isfile($shortfn($mircdir) $+ $r.glob(Themes,Sound43)) { splay $shortfn($mircdir) $+ $r.glob(Themes,Sound43) }
  }
  SaveAllGlobals
  ;  if $scon(1).Server == $null { SaveAllSettings }
  SaveAllSettings $1
}
openingD {
  if $r.set(Invision,SndOpt15) == On {
    if $isfile($shortfn($mircdir) $+ $r.glob(Themes,Sound44)) { splay $shortfn($mircdir) $+ $r.glob(Themes,Sound44) }
  }
}
SFDdone {
  if %SFDfunc [ $+ [ $iNetwork ] ] == DCCqueue {
    var %ct = 1
    while (%ct <= $numtok(%SFDfiles [ $+ [ $iNetwork ] ] ,58)) {
      var %tmpfn = %SFDwdir [ $+ [ $iNetwork ] ] $+ \ $+ $gettok(%SFDfiles [ $+ [ $iNetwork ] ] ,%ct,58)
      if (%DCCqnick [ $+ [ $iNetwork ] ] != $null) && ($isfile(%tmpfn)) { 
        if $address(%DCCqnick [ $+ [ $iNetwork ] ] ,5) != $null && $level($address(%DCCqnick [ $+ [ $iNetwork ] ] ,5)) >= $iif($r.set(DCCmgr,SQlevel) != $null,$r.set(DCCmgr,SQlevel),14) && $r.set(DCCmgr,SecondQ) == On { 
          Pqueue.add manual %DCCqnick [ $+ [ $iNetwork ] ] $iif($address(%DCCqnick [ $+ [ $iNetwork ] ] ,5) != $null,$address(%DCCqnick [ $+ [ $iNetwork ] ] ,5),unknown) $ctime %tmpfn 
        } 
        else {
          queue.add manual %DCCqnick [ $+ [ $iNetwork ] ] $iif($address(%DCCqnick [ $+ [ $iNetwork ] ] ,5) != $null,$address(%DCCqnick [ $+ [ $iNetwork ] ] ,5),unknown) $ctime %tmpfn 
        }
      }
      inc %ct 1 
    }
    .timer 1 20 unset %SFDfiles [ $+ [ $iNetwork ] ] %DCCqnick [ $+ [ $iNetwork ] ] %SFDfunc [ $+ [ $iNetwork ] ]
    .timerQS $+ $iNetwork 1 2 queue.send 
  }
  unset %DCCqnick [ $+ [ $iNetwork ] ] %SFDfunc [ $+ [ $iNetwork ] ]
}
mp3listprog1 {
  if $os != XP { window -pdhok0 +Ld @mp3_lprog 266 18 200 20 }
  else { window -pdhok0 +Ld @mp3_lprog 266 26 200 20 }
  ; drawpic -cl @mp3_lprog 4 0 $shortfn($mircdir) $+ Invision\gfx\mp3btns.jpg
  ;.timermp3CU -o 0 1 mp3ctrldisp
  ;.timer -o 1 1 showmirc -s
}
every3 {
  tbar 
  if $activecid != %activecid {
    if %SoundKill [ $+ [ $scid($activecid).iNetwork ] ] == 1 || $scid($activecid).away == $true { if $exists( [ $r.glob(Themes,ToolBarBG2) ] ) { background -l $r.glob(Themes,ToolBarBG2) } } | else { if $exists( [ $r.glob(Themes,ToolBarBG1) ] ) { background -l $r.glob(Themes,ToolBarBG1) } } 
    if %FSPause [ $+ [ $scid($activecid).$iNetwork ] ] == Resume { if $exists( [ $r.glob(Themes,SwitchBar2) ] ) { background -h $r.glob(Themes,SwitchBar2) } } | else { if $exists( [ $r.glob(Themes,SwitchBar1) ] ) { background -h $r.glob(Themes,SwitchBar1) } } 
  }
  set %activecid $activecid 
}
mp3listprog0 { window -c @mp3_lprog }
USA { say 04,04_00,00_12,12_04,04_00,00_12,12_04,04_00,00_12,12_ $1- 04,04_00,00_12,12_04,04_00,00_12,12_04,04_00,00_12,12_ }
USflag1 { return 00,12 • • • • • • • • • • • • • 04,04************************ }
USflag2 { return 00,12 • • • • • • • • • • • • • 00,00************************ }
USflag3 { return 04,04 • • • • • • • • • • • • • ************************ }
USflag4 { return 00,00 • • • • • • • • • • • • • ************************ }
USflag { 
  if $1 != $null {
    msg $1 $USflag1
    msg $1 $USflag2
    msg $1 $USflag1
    msg $1 $USflag2
    msg $1 $USflag1
    msg $1 $USflag2
    msg $1 $USflag3
    msg $1 $USflag4
    msg $1 $USflag3
    msg $1 $USflag4
    msg $1 $USflag3
    msg $1 $USflag4
  }
  else {
    say $USflag1
    say $USflag2
    say $USflag1
    say $USflag2
    say $USflag1
    say $USflag2
    say $USflag3
    say $USflag4
    say $USflag3
    say $USflag4
    say $USflag3
    say $USflag4
  }
}
deadfservewindowkiller {
  if $fserv(0) >= 1 {
    var %ct = 1
    while (%ct <= $fserv(0)) {
      if ($fserv(%ct).status == waiting) {
        set %DFWK [ $+ [ $fserv(%ct) ] ] $calc(%DFWK [ $+ [ $fserv(%ct) ] ] + 1)
        if (%DFWK [ $+ [ $fserv(%ct) ] ] >= 5) {
          /close -f $fserv(%ct)
          unset %DFWK [ $+ [ $fserv(%ct) ] ]
        }
      }
      inc %ct 1
    }
  }
}
deadsendswindowkiller {
  if $send(0) >= 1 {
    var %ct = 1
    while (%ct <= $send(0)) {
      if ($send(%ct).status == waiting) {
        set %DSWK [ $+ [ $send(%ct) ] ] $calc(%DSWK [ $+ [ $send(%ct) ] ] + 1)
        if (%DSWK [ $+ [ $send(%ct) ] ] >= 5) {
          /close -f $send(%ct)
          unset %DSWK [ $+ [ $send(%ct) ] ]
        }
      }
      inc %ct 1
    }
  }
}
nickregain {
  if ($chan(0) > 0) {
    var %ct = 1
    while (%ct <= $chan(0)) {
      var %chan = $chan(%ct)
      if (m isin $gettok($chan(%ct).mode,1,32)) || ($me isban %chan) { .timer 1 $calc(%ct * 2) join %chan $chan(%ct).key | .part %chan }
      inc %ct 1
    }
    .quote NICK $r.set(Personal.Info,Nick)
  }
}
nickghost {
  if ($1 != $null) {
    var %ct = 1
    while (%ct <= 5) {
      if ($r.set(Personal.Info,Nick) == $r.set(Auto.ID,Nick. [ $+ [ %ct ] ] )) { var %pw = $r.set(Auto.ID,PASS. [ $+ [ %ct ] ] ) }
      inc %ct 1
    }
    if (%pw == $null) { var %pw = $input(Please enter the password for $r.set(Personal.Info,Nick),134,What's the password?) }
    if (%pw != $null) && (%ghostFlag != 1) {
      %Nserv [ $+ [ $iNetwork ] ] $r.set(Invision,GhostCmd) $r.set(Personal.Info,Nick) %pw
      set -u30 %ghostFlag 1
    }
  }
}
ServerMSG {
  if ($window(@ServerNotices) == $null) { /window -nk0z +l @ServerNotices -1 -1 500 350 }
  aline -p @ServerNotices $ts $chr(91) $+ $iNetwork $+ $chr(93) $c(1) $+ $1-
  var %logfn = $shortfn($logdir) $+ @ServerNotices $+ . $+ $time(yyyy) $+  $time(mm) $+ $time(dd)) $+ .log
  .write %logfn $chr(91) $+ $iNetwork $+ $chr(93) $1- 
}
FSidletime { return $gettok($readini(mirc.ini,options,n2),20,44) }
FSidlechk {
  if ($1 != $null) {
    if ($chat($1) != $null) {
      msg = $+ $1 Closing Idle connection in 30 Seconds $+ $chr(46) $+ $chr(46) $+ $chr(46)
      .timeridlekill $+ $replace($nick,$chr(124),$chr(160)) $+ $iNetwork -o 1 30 close -c $1
    }
    else { .timerFSidle $+ $replace($nick,$chr(124),$chr(160)) $+ $iNetwork off }
  }
} 
rainsay { say $rain($1-) }
rain {
  if ($1 != $null) {
    var %LL = 04,07,08,09,12,11,13
    var %ctl = 1
    var %ct = 1
    while (%ct <= $len($1-)) {
      var %new = %new $+  $+ $gettok(%LL,%ctl,44) $+ $iif($mid($1-,%ct,1) != $chr(32), $+ $mid($1-,%ct,1), $chr(32) $+ $mid($1-,%ct,1)) 
      inc %ctl 1
      if (%ctl > 7) { var %ctl = 1 }
      inc %ct 1
    }
    return %new $+ 
  }
}
Keep_Nick { 
  if ( ( ( !$away ) || ( !$r.set(Away,Away.Nick) ) || ( $r.set(Away,Away.Nick) == n/a ) ) && $me !=== $r.set(Personal.Info,Nick) ) { 
    nick $r.set(Personal.Info,Nick)
  } 
}
QwatchMaster { scid -a qwatch }
displayspeedrecords { say $c(2) $+ DCC Records $c(1) $+ $sv(Download,$ratefix($r.glob(DCCMgr,i.recordgetspeed))) $sv(Upload,$ratefix($r.glob(DCCMgr,i.recordsendspeed))) $ilogo }
