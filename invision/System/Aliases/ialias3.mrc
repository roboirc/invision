; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: ialias3.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: The File Server Explorer and Queue Alias routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
fservechk {
  if (($r.set(Fserve.1,Status) != On) && ($r.set(Fserve.2,Status) != On) && ($r.set(Fserve.3,Status) != On) && ($r.set(Fserve.4,Status) != On) && ($r.set(Fserve.5,Status) != On)) {
    return No Triggers Enabled 5150
  }
  else { return }
}
chkFStriggers {
  if (($r.set(Fserve.1,Status) == On) || ($r.set(Fserve.2,Status) == On) || ($r.set(Fserve.3,Status) == On) || ($r.set(Fserve.4,Status) == On) || ($r.set(Fserve.5,Status) == On)) {
    return $true
  }
  else { return }
}
chkFSctcp {
  if ($r.set(Fserve,CTCPonly) == On) { return $true }
  if (($r.set(Fserve.1,CTCP) == On) && ($r.set(Fserve.1,Status) == On)) { return $true }
  if (($r.set(Fserve.2,CTCP) == On) && ($r.set(Fserve.2,Status) == On)) { return $true }
  if (($r.set(Fserve.3,CTCP) == On) && ($r.set(Fserve.3,Status) == On)) { return $true }
  if (($r.set(Fserve.4,CTCP) == On) && ($r.set(Fserve.4,Status) == On)) { return $true }
  if (($r.set(Fserve.5,CTCP) == On) && ($r.set(Fserve.5,Status) == On)) { return $true }
  return $false
}
fxp.main { 
  if ($dialog(InvisFxp).title != $null) {
    did -a InvisFxp 100 $chr(32) $+ $1-
    if ($did(InvisFxp,100).lines > 300)  { did -d InvisFxp 100 1 }
  }
}
Fxp.llist {
  set %Fxp.local [ $+ [ $iNetwork ] ] $getdir
  if ($1 != $null) { set %Fxp.local [ $+ [ $iNetwork ] ] $1- }
  dialog -t InvisFxp Invision File Server Explorer is loading directory...
  did -r InvisFxp 50
  var %Fxp.aloop = 0
  :aloop
  if ($r.glob(Invision,FXPnoscan) == On) { goto next }
  var %Fxp.dloop = 0
  inc %Fxp.aloop
  var %Fxp.aloop2 = $calc(66 + %Fxp.aloop)
  :driveloop
  if (%Fxp.aloop == 26) { unset %Fxp.aloop | did -a InvisFxp 50 .. | goto next | halt }
  if ($chr(%Fxp.aloop2) == a) { goto aloop }
  if ($chr(%Fxp.aloop2) == b) { goto aloop }
  if (($disk($chr(%Fxp.aloop2) $+ :) == $true) && (%Fxp.dtype == 1)) { did -a InvisFxp 50 [ < $+ [ $chr(%Fxp.aloop2) ] $+ ] :\ $disk($chr(%Fxp.aloop2) $+ :).label ( [ $+ [ $replace($disk($chr(%Fxp.aloop2) $+ :).type,fixed,hd) ] $+ > )] }
  if (($disk($chr(%Fxp.aloop2) $+ :) == $true) && (%Fxp.dtype != 1)) { did -a InvisFxp 50 [ < $+ [ $chr(%Fxp.aloop2) ] $+ ] :\ $disk($chr(%Fxp.aloop2) $+ :).label $+ > }
  goto aloop
  halt
  :next
  inc %Fxp.aloop
  if (%Fxp.aloop > $finddir(%Fxp.local [ $+ [ $iNetwork ] ] ,*,0,1)) { unset %Fxp.aloop | goto final | halt }
  did -a InvisFxp 50 [ < $+ [ $nopath($finddir(%Fxp.local [ $+ [ $iNetwork ] ]  ,*,%Fxp.aloop,1)) ] $+ > ]
  goto next
  halt
  :final
  inc %Fxp.aloop
  if (%Fxp.aloop > $findfile(%Fxp.local [ $+ [ $iNetwork ] ]  ,*.*,0,1)) {
    if (%Fxp.first == $null) { var %Fxp.first = 1 }
    unset %Fxp.aloop
    unset %Fxp.dhistory
    did -o InvisFxp 48 1 %Fxp.local [ $+ [ $iNetwork ] ] 
    did -z InvisFxp 50
    dialog -t InvisFxp Invision File Server Explorer connected to %Fxp.nick [ $+ [ $iNetwork ] ]  on $iNetwork
    halt
  }
  dialog -t InvisFxp Invision File Server Explorer is scanning directory... ( [ $+ [ $round($calc(%Fxp.aloop / $findfile(%Fxp.local [ $+ [ $iNetwork ] ] ,*.*,0,1) * 100),1) ] $+ ] %)
  did -a InvisFxp 50 $nopath($findfile(%Fxp.local [ $+ [ $iNetwork ] ] ,*.*,%Fxp.aloop,1)) $bytes($lof($findfile(%Fxp.local [ $+ [ $iNetwork ] ] ,*.*,%Fxp.aloop,1))).suf
  goto final
}
InvisFxp { 
  dialog -md InvisFxp $FxPDiagTbl
  ; dopen InvisFxp $FxPDiagTbl
  write -c InvisFxp.tmp
  Fxp.llist
}
fxp.dir {
  if ($sock(InvisFxp).status == $null) { return }
  did -r InvisFxp 60
  set %Fxp.list 1
  sockwrite -n InvisFxp dir
}
fxp.Ftrim {
  if ($1- == $null) { return }
  if ($chr(60) !isin $1-) { 
    if (($gettok($1-,$numtok($1-,32),32) == kb) || ($gettok($1-,$numtok($1-,32),32) == mb) || ($gettok($1-,$numtok($1-,32),32) == gb)) { 
      var %ntok = $calc($numtok($1-,32) - 1) $+ - $+ $numtok($1-,32)
      return $deltok($1-,%ntok,32)
    } 
    else { return $deltok($1-,$numtok($1-,32),32) } 
  }
}
checkq { 
  if (($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1) == $null) && ($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue.1) == $null)) { 
    .timerFserveClose $+ $iNetwork Off 
    .timermp3servclose $+ $iNetwork Off
    w.set Fserve Status Off 
    w.set mp3serv Status Off 
    if ($r.set(Fserve,Logging) == On) { FSlog The Server has sent out the queues and is now shutdown. } 
    aecho $c(1) $+ Queues are empty, Server has Shutdown. 
  } 
}
respond { if ($1 != $null) { editbox -apf /> | set %lastresp [ $+ [ $iNetwork ] ]  $eval($replace($r.set(Invision,NickTagFormat),nick,$1),2) } } 
resp2 { if ($1 != $null) { return $eval($replace($r.set(Invision,NickTagFormat),nick,$1),2) } }
recall { editbox -ap %lastresp [ $+ [ $iNetwork ] ]  }
> { 
  if ($ctrlenter != $true) { var %IStr = $AcroAction($replace($1-,$chr(36),§¨©,$chr(37),§¨ª)) } | else { var %IStr = $replace($1-,$chr(36),§¨©,$chr(37),§¨ª) }
  if ($r.set(Colors,Speech) == On) { 
    var %saystr = [ [ $replace(%IStr,$chr(15),$spclr) ] ] 
    say %lastresp [ $+ [ $iNetwork ] ]  $spclr $+ $replace(%saystr,§¨©,$chr(36),§¨ª,$chr(37)) 
  } 
  else { 
    var %saystr = [ [ %IStr ] ] 
    say %lastresp [ $+ [ $iNetwork ] ]  $replace(%saystr,§¨©,$chr(36),§¨ª,$chr(37)) 
  } 
}
SSend.chk { 
  if (($r.glob(Fserve,MaxBandEach) >= 1) || (%NoSSend [ $+ [ $iNetwork ] ]  == 1)) { return $false }
  if ($send(0) != 0) { 
    var %SSchkCT = 1
    while (%SSchkCT <= $send(0)) { 
      if (($send(%SSchkCT).status == waiting) || ($send(%SSchkCT).status == inactive)) { return $false }
      if (($send(%SSchkCT).cps == 0) || ($send(%SSchkCT).cps == n/a)) { return $false }
      inc %SSchkCT 1
    } 
  }
  if ($send(0) >= $calc($r.set(Fserve,Max.Sends.Total) + 2)) { return $false }
  if ($r.glob(Fserve,Max.Serv.Bandwidth) > 99000) {
    if (($bandwidth < $calc($r.glob(Fserve,Max.Serv.Bandwidth) * 0.85)) && ($calc($r.glob(Fserve,Max.Serv.Bandwidth) - $bandwidth) > $r.set(Min.CPS,Rate))) { .timerNOSSEND $+ $iNetwork -io 1 15 unset %NOSSend [ $+ [ $iNetwork ] ] | set %NoSSend [ $+ [ $iNetwork ] ]  1 | return $true }
    else { return $false } 
  }
  if ($r.glob(Fserve,Max.Serv.Bandwidth) > 69000) {
    if (($bandwidth < $calc($r.glob(Fserve,Max.Serv.Bandwidth) * 0.75)) && ($calc($r.glob(Fserve,Max.Serv.Bandwidth) - $bandwidth) > $r.set(Min.CPS,Rate))) { .timerNOSSEND $+ $iNetwork -io 1 15 unset %NOSSend [ $+ [ $iNetwork ] ] | set %NoSSend [ $+ [ $iNetwork ] ]  1 | return $true }
    else { return $false } 
  }
  if ($r.glob(Fserve,Max.Serv.Bandwidth) > 39000) {
    if (($bandwidth < $calc($r.glob(Fserve,Max.Serv.Bandwidth) * 0.72)) && ($calc($r.glob(Fserve,Max.Serv.Bandwidth) - $bandwidth) > $r.set(Min.CPS,Rate))) { .timerNOSSEND $+ $iNetwork -io 1 15 unset %NOSSend [ $+ [ $iNetwork ] ] | set %NoSSend [ $+ [ $iNetwork ] ]  1 | return $true }
    else { return $false } 
  }
  if ($r.glob(Fserve,Max.Serv.Bandwidth) > 19000) {
    if (($bandwidth < $calc($r.glob(Fserve,Max.Serv.Bandwidth) * 0.60)) && ($calc($r.glob(Fserve,Max.Serv.Bandwidth) - $bandwidth) > $r.set(Min.CPS,Rate))) { .timerNOSSEND $+ $iNetwork -io 1 15 unset %NOSSend [ $+ [ $iNetwork ] ] | set %NoSSend [ $+ [ $iNetwork ] ]  1 | return $true }
    else { return $false } 
  }
  if ($r.glob(Fserve,Max.Serv.Bandwidth) > 10000) { 
    if (($bandwidth < $calc($r.glob(Fserve,Max.Serv.Bandwidth) * 0.45)) && ($calc($r.glob(Fserve,Max.Serv.Bandwidth) - $bandwidth) > $r.set(Min.CPS,Rate))) { .timerNOSSEND $+ $iNetwork -io 1 15 unset %NOSSend [ $+ [ $iNetwork ] ] | set %NoSSend [ $+ [ $iNetwork ] ]  1 | return $true }
    else { return $false } 
  } 
  if ($send(0) == 0) { return $true } | else { return $false }
}
queue.exists { 
  var %queue-ec = 0 
  :start 
  inc %queue-ec 1 
  if ($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ %queue-ec ] ] ) != $null) { 
    if ($deltok($deltok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ %queue-ec ] ] ),4,32),1,32) == $deltok($deltok($1-,4,32),1,32)) { return %queue-ec } 
    goto start 
  } 
}
queue { 
  if ($1 isnum 0) { 
    var %queue-c = 0 
    :start 
    inc %queue-c 1 
    if ($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ %queue-c ] ] ) == $null) { return $calc(%queue-c - 1) } 
    if %queue-c <= 200 { goto start }
    :end 
  } 
  elseif ($isnum($1) == $true) { return $hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $1 ] ] ) }
}
queue.insert {
  var %fn = $remove($1-,$chr(34)) 
  queue.exists %fn 
  if ($result isnum) { return $result } 
  var %ct = 200 
  while (%ct >= 1) {
    if ($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ %ct ] ] ) != $null) { 
      hadd -m Queues. [ $+ [ $iNetwork ] ] [ Queue. [ $+ [ $calc(%ct + 1) ] ] ] $hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ %ct ] ] )
    } 
    dec %ct 1 
  }
  hadd -m Queues. [ $+ [ $iNetwork ] ]  Queue.1 %fn 
  qmu
}
queue.add { 
  var %fn = $remove($1-,$chr(34))
  queue.exists %fn 
  if ($result isnum) { return $result } 
  var %queue-ac = 0 
  :start 
  inc %queue-ac 1 
  if ($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ %queue-ac ] ] ) == $null) { 
    hadd -m Queues. [ $+ [ $iNetwork ] ]  [ Queue. [ $+ [ %queue-ac ] ] ] %fn 
    unset %queue-ac 
    iSaveQueues
    qmu 
  } 
  else { goto start } 
}
queue.del { 
  if ($isnum($1) == $true) { 
    var %queue-dc = $calc($1 - 1) 
    :start 
    inc %queue-dc 1 
    if $istable(Queues. [ $+ [ $iNetwork ] ] ) { hdel Queues. [ $+ [ $iNetwork ] ]  [ Queue. [ $+ [ %queue-dc ] ] ] }
    if ($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $calc(%queue-dc + 1) ] ] ) == $null) { 
      unset %queue-dc 
      qmu 
    } 
    else { 
      hadd -m Queues. [ $+ [ $iNetwork ] ]  [ Queue. [ $+ [ %queue-dc ] ] ] $hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $calc(%queue-dc + 1) ] ] ) 
      goto start 
    } 
    iSaveQueues
  } 
}
queue.rep { 
  if ($isnum($1) == $true) && ($queue(0) >= $1) && ($2 != $null) { 
    hadd -m Queues. [ $+ [ $iNetwork ] ]  [ Queue. [ $+ [ $1 ] ] ] $2- 
  } 
}
queue.swap.up { 
  var %queue.temp = $hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $calc($1 - 1) ] ] )
  hadd -m Queues. [ $+ [ $iNetwork ] ]  [ Queue. [ $+ [ $calc($1 - 1) ] ] ] $hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $1 ] ] ) 
  hadd -m Queues. [ $+ [ $iNetwork ] ]  [ Queue. [ $+ [ $1 ] ] ] %queue.temp
  qmu
  did -fc DCCManager 201 $calc($1 - 1)
  did -ra DCCManager 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),1,32))
  did -ra DCCManager 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),2,32)  $chr(32) $chr(32) 
  did -ra DCCManager 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),5-,32)
  did -ra DCCManager 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),3,32)
  did -ra DCCManager 218 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32) $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ) != $null, $duration($calc($ctime - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32)),2) ago) $chr(93)
}
queue.swap.down { 
  var %queue.temp = $hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $calc($1 + 1) ] ] ) 
  hadd -m Queues. [ $+ [ $iNetwork ] ]  [ Queue. [ $+ [ $calc($1 + 1) ] ] ] $hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $1 ] ] ) 
  hadd -m Queues. [ $+ [ $iNetwork ] ]  [ Queue. [ $+ [ $1 ] ] ] %queue.temp
  unset %queue.temp
  qmu
  did -fc DCCManager 201 $calc($1 + 1)
  did -ra DCCManager 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),1,32))
  did -ra DCCManager 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),2,32)  $chr(32) $chr(32) 
  did -ra DCCManager 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),5-,32)
  did -ra DCCManager 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),3,32)
  did -ra DCCManager 218 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32) $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ) != $null, $duration($calc($ctime - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32)),2) ago) $chr(93)
}
qrfresh {
  if ($dialog(DCCmanager) != $null) { 
    did -ra DCCManager 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),1,32))
    did -ra DCCManager 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),2,32)  $chr(32) $chr(32) 
    did -ra DCCManager 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),5-,32)
    did -ra DCCManager 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),3,32)
    did -ra DCCManager 218 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32) $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ) != $null, $duration($calc($ctime - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32)),2) ago) $chr(93)
  }
}
qmu { 
  if ($dialog(DCCManager) != $null) { 
    did -r DCCManager 201,204,206,209,216,218 
    var %qmu = 0 
    :start 
    inc %qmu 1 
    if ($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ %qmu ] ] ) == $null) { unset %qmu }
    else { 
      did -a DCCManager 201 $chr(35) $+ %qmu - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ %qmu ] ] ),2,32)
      goto start 
    } 
  }
}
qnu { 
  if ($2 != $null) { 
    var %qnu = 0 
    :start 
    inc %qnu 1 
    if ($queue(%qnu) == $null) { 
      unset %qnu 
      qmu 
    } 
    else {
      if ($gettok($queue(%qnu),2,32) == $1) { 
        queue.rep %qnu $gettok($queue(%qnu),1,32) $2 $address($2,5) $gettok($queue(%qnu),4,32) $gettok($queue(%qnu),5-,32) 
      } 
      goto start 
    } 
  }
}
queue.nick { 
  if ($1 != $null) {
    if ($queue(0) == 0) { return 0 } 
    var %queue-nc = 0 
    var %queue-nt = 0 
    :start
    inc %queue-nc 1 
    if (%queue-nc > $queue(0)) { return %queue-nt } 
    if ($gettok($queue(%queue-nc),2,32) == $1) {
      inc %queue-nt 1 
    } 
    goto start 
  } 
}
queue.send { 
  if %NOSSEND [ $+ [ $iNetwork ] ] == 1 { halt }
  if $r.set(DCCmgr,SecondQ) == On { Pqueue.send }
  if $r.glob(Fserve,Max.Serv.Bandwidth) <= 1 { w.glob Fserve SmartSend off }
  if $server != $null && $r.set(Fserve,Pause) != On && $r.set(mp3serv,Pause) != On && ($queue(0) > 0) {
    :queue
    var %queue-sc = 0
    :start
    inc %queue-sc 1
    if (%queue-sc > $queue(0)) { unset %queue-sc }
    else {
      if ($gettok($queue(%queue-sc),1,32) == Manual) {
        if ($tc($gettok($queue(%queue-sc),2,32),Manual) == $false) { queue.del %queue-sc | unset %queue-sc | goto queue }
        if (($r.set(Fserve,Max.Sends.Total) > $isend(0)) && ($r.set(Fserve,Max.Sends.Each) > $send.nick($gettok($queue(%queue-sc),2,32)))) { goto send }
      }
      if ($gettok($queue(%queue-sc),1,32) == Requeue) {
        if $r.glob(Fserve,SmartSend) != On {
          if (($r.set(Fserve,Max.Sends.Total) > $isend(0)) && ($r.set(Fserve,Max.Sends.Each) > $send.nick($gettok($queue(%queue-sc),2,32)))) { goto send }
          else { goto start }
        }
        else {
          if ($SSend.chk(1) == $true) {
            unset %nossend [ $+ [ $iNetwork ] ] 
            if ($r.set(Fserve,Max.Sends.Each) > $send.nick($gettok($queue(%queue-sc),2,32))) { goto send }
          }
          else { goto start }
        }
      }
      var %serv = Fserve,XDCC,mp3serv,TDCC_1,TDCC_2,TDCC_3,TDCC_4,TDCC_5
      var %sct = 1
      var %outcome = 0
      while (%sct <= $numtok(%serv,44)) {
        var %curserv = $gettok(%serv,%sct,44)
        if ($gettok($queue(%queue-sc),1,32) == %curserv) {
          if $r.glob(Fserve,SmartSend) != On {
            if ($tc($gettok($queue(%queue-sc),2,32),%curserv) == $false) { queue.del %queue-sc | unset %queue-sc | var %outcome = 2 }
            if (($r.set($gettok(%curserv,1,95),Max.Sends.Total) > $isend(0)) && ($r.set($gettok(%curserv,1,95),Max.Sends.Each) > $send.nick($gettok($queue(%queue-sc),2,32)))) { var %outcome = 1 }
          }
          else {
            if ($tc($gettok($queue(%queue-sc),2,32),%curserv) == $false) { queue.del %queue-sc | unset %queue-sc | var %outcome = 2 }
            if ($SSend.chk(1) == $true) {
              unset %nossend [ $+ [ $iNetwork ] ]
              if (($r.set($gettok(%curserv,1,95),Max.Sends.Each) > $send.nick($gettok($queue(%queue-sc),2,32)))) { var %outcome = 1 }
            }
          }
        }
        inc %sct 1
      }
      if %outcome == 1 { goto send }
      if %outcome == 2 { goto queue }
      goto start
      :send
      .timer -o 1 0 QueueTime $gettok($queue(%queue-sc),4,32)
      ; if $r.set(Fserve,Logging) == On { .timer -o 1 0 FSlog Sending $gettok($queue(%queue-sc),5-,32) to $gettok($queue(%queue-sc),2,32) }
      DCCstatwin Sending $gettok($queue(%queue-sc),5-,32) to $gettok($queue(%queue-sc),2,32)
      .timer 1 0 .idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $gettok($queue(%queue-sc),2,32) " $+ $gettok($queue(%queue-sc),5-,32) $+ " 
      if ($r.set(Invision,SndOpt17) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound18) } 
      queue.del %queue-sc 
      unset %queue-sc 
    }
  }
}
AnyServerOn {
  if $r.set(mp3serv,Status) == On { return $true }
  if $r.set(Fserve,Status) == On { return $true }
  if $r.set(TDCC.1,Status) == On { return $true }
  if $r.set(TDCC.2,Status) == On { return $true }
  if $r.set(TDCC.3,Status) == On { return $true }
  if $r.set(TDCC.4,Status) == On { return $true }
  if $r.set(TDCC.5,Status) == On { return $true }
  if $r.set(XDCC,Status) == On { return $true }
  return $false
}
cloneQchk {
  if $1 != $null {
    if $queue(0) > 0 {
      var %cqc-ct = 1
      var %cqc-flg = 0
      while (%cqc-ct <= $queue(0)) { 
        if ($address($1,2) == $mask($gettok($queue(%cqc-ct),3,32),2)) && ($1 != $gettok($queue(%cqc-ct),2,32)) { var %cqc-flg = 1 }
        inc %cqc-ct 1
      }
      if %cqc-flg == 1 { return $true } | else { return $false }
    }
  }
}
FSstatOpen {
  if $window(@Invision_File_Server_Stats) == $null { /window -dok0 @Invision_File_Server_Stats -1 -1 600 400 } | else { /window -a @Invision_File_Server_Stats }
}
FSstatGetDirs {
  aline @Invision_File_Server_Stats $c(1) $+ Here are the current Requested Directory Counts since your last Reset.
  aline @Invision_File_Server_Stats 
  aline @Invision_File_Server_Stats 
  var %FSstatCT = 1
  if $istable(RecordsDirectories) {
    while (%FSstatCT <= $hget(RecordsDirectories,0).item) {
      var %tmpFSTdir = $hget(RecordsDirectories,%FSstatCT).item  
      var %tmpFSTget = $r.rec(Directories,%tmpFSTdir)
      aline @Invision_File_Server_Stats $replace(%tmpFSTdir,$chr(95),$chr(32),$chr(63),$chr(61))
      aline -p @Invision_File_Server_Stats $FSstatBar(%tmpFSTdir,%tmpFSTget) 
      aline @Invision_File_Server_Stats 
      inc %FSstatCT 1
    }
  } 
  else {   aline @Invision_File_Server_Stats No Records Yet! }
}
FSstatBar { 
  if $window(@Invision_File_Server_Stats) != $null {
    if $2 != $null && $2 isnum { 
      var %tmpFSstatBar = 4,4
      var %tmpFSbarCT = 1
      while (%tmpFSbarCT <= $2) {
        var %tmpFSstatBar = %tmpFSstatBar -
        inc %tmpFSbarCT 1
      }
      var %tmpFSstatBar = %tmpFSstatBar  $c(2) $2 Requests
      return %tmpFSstatBar
    }
    else { return 4,4 }
  }
}
ShowFSRdir { FSstatOpen | .timer -o 1 1 FSstatGetDirs }
FSstatGetNicks {
  aline @Invision_File_Server_Stats $c(1) $+ Here is the Leech Count since your last Reset.
  aline @Invision_File_Server_Stats 
  aline @Invision_File_Server_Stats 
  var %FSstatCT = 1
  while (%FSstatCT <= $hget(NickRecordsNicks,0).item) {
    var %tmpFSTdir = $hget(NickRecordsNicks,%FSstatCT).item  
    var %tmpFSTget = $r.nickrec(Nicks,%tmpFSTdir)
    aline @Invision_File_Server_Stats %tmpFSTdir
    aline -p @Invision_File_Server_Stats $FSstatBar(%tmpFSTdir,%tmpFSTget) 
    aline @Invision_File_Server_Stats 
    inc %FSstatCT 1
  }
}
ShowFSRNick { FSstatOpen | .timer -o 1 1 FSstatGetNicks }
pclipbrd {
  if (($cb(0) == 1 || $cb(0) == 0 || $cb(0) == $null) && $cb(0).len == 0) { error Nothing to paste. | halt }
  var %cb.max.len = $calc(493 - $len($1) - $len($ial($me)))
  var %pCBdly = 1700
  var %tmpCBct = 1
  while (%tmpCBct <= $cb(0)) {
    if $cb(%tmpCBct).len >= %cb.max.len {
      var %tmpCBcyc = $int($calc(($cb(%tmpCBct).len / %cb.max.len) + .99))
      var %tmpCBcct = 1
      while (%tmpCBcct <= %tmpCBcyc) {
        write paste.tmp $mid($cb( %tmpCBct ),$calc((( %tmpCBcct - 1) * %cb.max.len ) + 1), %cb.max.len )
        inc %tmpCBcct 1
      }
    }
    else {
      if $cb(%tmpCBct) != $null { write paste.tmp $cb(%tmpCBct) }
    }
    inc %tmpCBct 1
    continue
  }
  .play $1 paste.tmp %pCBdly
  .remove paste.tmp
}
ascart {
  if (($cb(0) == 1 || $cb(0) == 0 || $cb(0) == $null) && $cb(0).len == 0) { error Nothing to paste. | halt }
  var %pCBdly = 1700
  .play -b $1 %pCBdly
}
scriptcheck {
  set %ScriptChk 0
  unset %ScriptFailList

  if $crc($shortfn($mircdirSystem\Aliases\ialias1.mrc)) != $r.static(Script,ialias1) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList ialias1 }
  if $crc($shortfn($mircdirSystem\Aliases\ialias2.mrc)) != $r.static(Script,ialias2) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList ialias2 }
  if $crc($shortfn($mircdirSystem\Aliases\ialias3.mrc)) != $r.static(Script,ialias3) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList ialias3 }
  if $crc($shortfn($mircdirSystem\Aliases\ialias4.mrc)) != $r.static(Script,ialias4) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList ialias4 }
  if $crc($shortfn($mircdirSystem\Aliases\ialias5.mrc)) != $r.static(Script,ialias5) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList ialias5 }
  if $crc($shortfn($mircdirSystem\Aliases\imprtwiz.mrc)) != $r.static(Script,imprtwiz) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList imprtwiz }

  if $crc($shortfn($mircdirSystem\Remotes\ichanctl.mrc)) != $r.static(Script,ichanctl) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList ichanctl }
  if $crc($shortfn($mircdirSystem\Remotes\dalnet.mrc)) != $r.static(Script,dalnet) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList dalnet }
  if $crc($shortfn($mircdirSystem\Remotes\ictcp.mrc)) != $r.static(Script,ictcp) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList ictcp }
  if $crc($shortfn($mircdirSystem\Remotes\ifsmgr.mrc)) != $r.static(Script,ifsmgr) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList ifsmgr }
  if $crc($shortfn($mircdirSystem\Remotes\idccnmp3.mrc)) != $r.static(Script,idccnmp3) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList idccnmp3 }
  if $crc($shortfn($mircdirSystem\Remotes\iftpxdcc.mrc)) != $r.static(Script,iftpxdcc) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList iftpxdcc }
  if $crc($shortfn($mircdirSystem\Remotes\igostop.mrc)) != $r.static(Script,igostop) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList igostop }
  if $crc($shortfn($mircdirSystem\Remotes\imaindlg.mrc)) != $r.static(Script,imaindlg) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList imaindlg }
  if $crc($shortfn($mircdirSystem\Remotes\imisc.mrc)) != $r.static(Script,imisc) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList imisc }
  if $crc($shortfn($mircdirSystem\Remotes\imiscdlg.mrc)) != $r.static(Script,imiscdlg) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList imiscdlg }
  if $crc($shortfn($mircdirSystem\Remotes\iraws.mrc)) != $r.static(Script,iraws) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList iraws }
  if $crc($shortfn($mircdirSystem\Remotes\itext.mrc)) != $r.static(Script,itext) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList itext }
  if $crc($shortfn($mircdirSystem\Remotes\ipcustom.mrc)) != $r.static(Script,ipcustom) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList ipcustom }
  if $crc($shortfn($mircdirSystem\Remotes\imiscmgr.mrc)) != $r.static(Script,imiscmgr) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList imiscmgr }
  if $crc($shortfn($mircdirSystem\Remotes\iserv.mrc)) != $r.static(Script,iserv) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList iserv }
  if $crc($shortfn($mircdirSystem\Remotes\ihelp.mrc)) != $r.static(Script,ihelp) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList ihelp }
  if $crc($shortfn($mircdirSystem\Remotes\iunique.mrc)) != $r.static(Script,iunique) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList iunique }
  if $crc($shortfn($mircdirSystem\popups.ini)) != $r.static(Script,popups) { inc %ScriptChk 1 | set %ScriptFailList %ScriptFailList popups }

  if %ScriptChk == 0 {
    aecho Script Corruption Check
    aecho All Files Checked ok! 
  }
  else {
    aecho Script Corruption Check
    aecho $c(1) $+ Found $c(2) $+ %ScriptChk $c(1) $+ of the $c(2) $+ 24 $c(1) $+ native script files to be corrupted or changed:  $+ %ScriptFailList
  }
  unset %ScriptFailList %ScriptChk
}
crypt {
  if ($3- == $null) return
  bunset &crypt.y &crypt.z
  var %a, %z
  var %z = $2
  var %a = $len($3-)
  while (%a > 0) {
    var %z = $hash(%z,32)
    bset -t &crypt.z $calc($bvar(&crypt.z,0) + 1) %z
    dec %a $len(%z)
  }
  bset -t &crypt.z $calc($bvar(&crypt.z,0) + 1) %z
  bset -t &crypt.y 1 $3-
  var %a = 1
  while ($bvar(&crypt.y,%a) != $null) {
    bset &crypt.y %a $calc($ifmatch - ($1 * 2 - 1) * ($bvar(&crypt.z,%a) - 48))
    inc %a
  }
  return $bvar(&crypt.y,1-).text
}
tdcc.ad { 
  if (($1 isnum 1-5) && (($isend(0) < $r.set(TDCC,Max.Sends.Total)) || ($queue(0) < $r.set(TDCC,Max.Queues.Total))) && ($server != $null) && ($r.set(TDCC. [ $+ [ $1 ] ] ,Status) == On)) { 
    admsg $allchk($r.set(TDCC. [ $+ [ $1 ] ] ,Channels)) $r.set(TDCC,AdTo) $tdcc.ad.temp($1) 
  } 
}
fserveAnnounce {
  admsg $r.set(Fserve,Channels) 1 $1-
}
xdccAnnounce {
  admsg $r.set(XDCC,Channels) 1 $1-
}
mp3servAnnounce {
  admsg $r.set(mp3serv,Channels) 1 $1-
}
admsg { 
  ; 1-channels 2-ad mode 3-the ad itself
  if ($2 == 1) { 
    if ($1 == All) { amsg $left($3-,428) } 
    else { 
      var %admsg = 0 
      :start 
      inc %admsg 1 
      if ($gettok($1,%admsg,44) != $null) { 
        if ($me ison $gettok($1,%admsg,44)) { 
          msg $gettok($1,%admsg,44) $left($3-,428) 
        } 
      goto start
      } 
      else { unset %admsg } 
    } 
  } 
  else {  
    if $2 == 4 {
      if ($1 == All) { amsg $C(2) $+  $+ TDCC Server Online  $+ $C(1) $+ Available to Ops only. Use trigger $C(2) $+ !TDCC $C(1) $+ to see ads. } 
      else { 
        var %admsg = 0 
        :start 
        inc %admsg 1 
        if ($gettok($1,%admsg,44) != $null) { 
          if ($me ison $gettok($1,%admsg,44)) { 
            msg $gettok($1,%admsg,44) $C(2) $+  $+ TDCC Server Online  $+ $C(1) $+ Available to Ops only. Use trigger $C(2) $+ !TDCC $C(1) $+ to see ads. 
          } 
        goto start } 
        else { unset %admsg } 
      } 
    }
    if $2 == 3 {
      if ($1 == All) { amsg $C(2) $+  $+ TDCC Server Online  $+ $C(1) $+ Available to Voiced only. Use trigger $C(2) $+ !TDCC $C(1) $+ to see ads. } 
      else { 
        var %admsg = 0 
        :start 
        inc %admsg 1 
        if ($gettok($1,%admsg,44) != $null) { 
          if ($me ison $gettok($1,%admsg,44)) { 
            msg $gettok($1,%admsg,44) $C(2) $+  $+ TDCC Server Online  $+ $C(1) $+ Available to Voiced only. Use trigger $C(2) $+ !TDCC $C(1) $+ to see ads. 
          } 
        goto start } 
        else { unset %admsg } 
      } 
    }
    if $2 == 2 {
      if ($1 == All) { amsg $C(2) $+  $+ TDCC Server Online  $+ $C(1) $+ Available to Ops and Voiced only. Use trigger $C(2) $+ !TDCC $C(1) $+ to see ads. } 
      else { 
        var %admsg = 0 
        :start 
        inc %admsg 1 
        if ($gettok($1,%admsg,44) != $null) { 
          if ($me ison $gettok($1,%admsg,44)) { 
            msg $gettok($1,%admsg,44) $C(2) $+  $+ TDCC Server Online  $+ $C(1) $+ Available to Ops and Voiced only. Use trigger $C(2) $+ !TDCC $C(1) $+ to see ads. 
          } 
        goto start } 
        else { unset %admsg } 
      } 
    }
  }
}
fadmsg {
  if ($1 == All) { 
    amsg $left($fserve.ad.temp(all),428)
    if ( $r.set(Fserve,TwoLineAd) == On && $r.set(Fserve,Note) ) { amsg $left($fserve.ad.temp.note,428) }
    return
  } 
  else { var %advchans = $1 }
  var %ct = 1
  while (%ct <= $numtok(%advchans,44)) {
    var %curchan = $gettok(%advchans,%ct,44)
    if $remove($strip($fserve.ad.triggers.h(%curchan),burc),•,$chr(32)) != $null && $me ison $gettok(%advchans,%ct,44) { .timer 1 $calc((%ct - 1) * 6) msg %curchan $left($fserve.ad.temp(%curchan),428) $chr(124) fadnote %curchan }
    inc %ct 1 
  }
}
fadnote {
  if ( $1 != $null ) {
    if ( $r.set(Fserve,TwoLineAd) == On && $r.set(Fserve,Note) ) { msg $1 $left($fserve.ad.temp.note,428) }
  }
}
fslotAd {
  if ($r.set(Fserve,Channels) == All) { 
    amsg $left($fserve.ad.freeslot(all),428)
  } 
  else { var %advchans = $r.set(Fserve,Channels) }
  var %ct = 1
  while (%ct <= $numtok(%advchans,44)) {
    var %curchan = $gettok(%advchans,%ct,44)
    if $remove($strip($fserve.ad.triggers.h(%curchan),burc),•,$chr(32)) != $null && $me ison $gettok(%advchans,%ct,44) { .timer 1 $calc((%ct - 1) * 6) msg %curchan $left($fserve.ad.freeslot(%curchan),428) }
    inc %ct 1 
  }
}
; ################################ P Queue Routines #############################
Pqueue.exists { 
  var %queue-ec = 0 
  :start 
  inc %queue-ec 1 
  if ($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ %queue-ec ] ] ) != $null) { 
    if ($deltok($deltok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ %queue-ec ] ] ),4,32),1,32) == $deltok($deltok($1-,4,32),1,32)) { return %queue-ec } 
    goto start 
  } 
}
Pqueue { 
  if ($1 isnum 0) { 
    var %queue-c = 0 
    :start 
    inc %queue-c 1 
    if ($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ %queue-c ] ] ) == $null) { return $calc(%queue-c - 1) } 
    if %queue-c <= 200 { goto start }
    :end 
    unset %queue-c 
  } 
  elseif ($isnum($1) == $true) { return $hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $1 ] ] ) }
}
Pqueue.insert {
  var %fn = $remove($1-,$chr(34)) 
  Pqueue.exists %fn 
  if ($result isnum) { return $result } 
  var %ct = 200 
  while (%ct >= 1) {
    if ($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ %ct ] ] ) != $null) { 
      hadd -m Queues. [ $+ [ $iNetwork ] ] [ PQueue. [ $+ [ $calc(%ct + 1) ] ] ] $hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ %ct ] ] )
    } 
    dec %ct 1
  }
  hadd -m Queues. [ $+ [ $iNetwork ] ] PQueue.1 %fn 
  Pqmu
}
Pqueue.add { 
  var %fn = $remove($1-,$chr(34))
  Pqueue.exists %fn 
  if ($result isnum) { return $result } 
  var %queue-ac = 0 
  :start 
  inc %queue-ac 1 
  if ($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ %queue-ac ] ] ) == $null) { 
    hadd -m Queues. [ $+ [ $iNetwork ] ] [ PQueue. [ $+ [ %queue-ac ] ] ] %fn 
    unset %queue-ac 
    Pqmu 
  } 
  else { goto start } 
}
Pqueue.del { 
  if ($isnum($1) == $true) { 
    var %queue-dc = $calc($1 - 1) 
    :start 
    inc %queue-dc 1 
    if $istable(Queues. [ $+ [ $iNetwork ] ] ) { hdel Queues. [ $+ [ $iNetwork ] ] [ PQueue. [ $+ [ %queue-dc ] ] ] } 
    if ($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $calc(%queue-dc + 1) ] ] ) == $null) { 
      unset %queue-dc 
      Pqmu 
    } 
    else { 
      hadd -m Queues. [ $+ [ $iNetwork ] ] [ PQueue. [ $+ [ %queue-dc ] ] ] $hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $calc(%queue-dc + 1) ] ] ) 
      goto start 
    } 
  } 
}
Pqueue.rep { 
  if ($isnum($1) == $true) && ($Pqueue(0) >= $1) && ($2 != $null) { 
    hadd -m Queues. [ $+ [ $iNetwork ] ] [ PQueue. [ $+ [ $1 ] ] ] $2- 
  } 
}
Pqmu { 
  if ($dialog(DCCManager) != $null) { 
    did -r DCCManager 201,204,206,209,216,218 
    var %qmu = 0 
    :start 
    inc %qmu 1 
    if ($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ %qmu ] ] ) != $null) { 
      did -a DCCManager 201 $chr(35) $+ %qmu - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ %qmu ] ] ),2,32)
      goto start 
    } 
  }
}
Pqnu { 
  if ($2 != $null) { 
    set %qnu 0 
    :start 
    inc %qnu 1 
    if ($Pqueue(%qnu) == $null) { 
      unset %qnu 
      Pqmu 
    } 
    else {
      if ($gettok($queue(%qnu),2,32) == $1) { 
        Pqueue.rep %qnu $gettok($Pqueue(%qnu),1,32) $2 $address($2,5) $gettok($Pqueue(%qnu),4,32) $gettok($Pqueue(%qnu),5-,32) 
      } 
      goto start 
    } 
  }
}
Pqueue.nick { 
  if ($1 != $null) {
    if ($Pqueue(0) == 0) { return 0 } 
    var %queue-nc = 0 
    var %queue-nt = 0 
    :start
    inc %queue-nc 1 
    if (%queue-nc > $Pqueue(0)) { return %queue-nt } 
    if ($gettok($Pqueue(%queue-nc),2,32) == $1) {
      inc %queue-nt 1 
    } 
    goto start 
  } 
}
Pqueue.swap.up { 
  var %queue.temp = $hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $calc($1 - 1) ] ] )
  hadd -m Queues. [ $+ [ $iNetwork ] ] [ PQueue. [ $+ [ $calc($1 - 1) ] ] ] $hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $1 ] ] )
  hadd -m Queues. [ $+ [ $iNetwork ] ] [ PQueue. [ $+ [ $1 ] ] ] %queue.temp
  Pqmu
  did -fc DCCManager 201 $calc($1 - 1)
  did -ra DCCManager 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue.1),1,32))
  did -ra DCCManager 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue.1),2,32)  $chr(32) $chr(32) 
  did -ra DCCManager 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue.1),5-,32)
  did -ra DCCManager 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),3,32)
  did -ra DCCManager 218 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32) $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ) != $null, $duration($calc($ctime - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32)),2) ago) $chr(93)
}
Pqueue.swap.down { 
  var %queue.temp = $hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $calc($1 + 1) ] ] ) 
  hadd -m Queues. [ $+ [ $iNetwork ] ] [ PQueue. [ $+ [ $calc($1 + 1) ] ] ] $hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $1 ] ] ) 
  hadd -m Queues. [ $+ [ $iNetwork ] ] [ PQueue. [ $+ [ $1 ] ] ] %queue.temp
  unset %queue.temp
  Pqmu
  did -fc DCCManager 201 $calc($1 + 1)
  did -ra DCCManager 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue.1),1,32))
  did -ra DCCManager 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue.1),2,32)  $chr(32) $chr(32) 
  did -ra DCCManager 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue.1),5-,32)
  did -ra DCCManager 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),3,32)
  did -ra DCCManager 218 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32) $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ) != $null, $duration($calc($ctime - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32)),2) ago) $chr(93)
}
Pqrfresh {
  if ($dialog(DCCmanager) != $null) { 
    did -ra DCCManager 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue.1),1,32))
    did -ra DCCManager 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue.1),2,32)  $chr(32) $chr(32) 
    did -ra DCCManager 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue.1),5-,32)
    did -ra DCCManager 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),3,32)
    did -ra DCCManager 218 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ),4,32) $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] != $null, $duration($calc($ctime - $gettok(%PQueue. [ $+ [ $remove($gettok($did(DCCManager,201,$did(DCCManager,201).sel),1,32),$chr(35)) ] ] ,4,32)),2) ago) $chr(93)
  }
}
Pqueue.send { 
  if $r.glob(Fserve,Max.Serv.Bandwidth) <= 1 { w.glob Fserve SmartSend off }
  if $server != $null && $r.set(Fserve,Pause) != On && $r.set(mp3serv,Pause) != On && ($Pqueue(0) > 0) {
    :queue
    var %queue-sc = 0
    :start
    inc %queue-sc 1
    if (%queue-sc > $Pqueue(0)) { unset %queue-sc }
    else {
      if ($gettok($Pqueue(%queue-sc),1,32) == Manual) {
        if ($tc($gettok($Pqueue(%queue-sc),2,32),Manual) == $false) { Pqueue.del %queue-sc | unset %queue-sc | goto queue }
        if (($r.set(Fserve,Max.Sends.Total) > $isend(0)) && ($r.set(Fserve,Max.Sends.Each) > $send.nick($gettok($Pqueue(%queue-sc),2,32))))  { goto send }
      }
      if ($gettok($Pqueue(%queue-sc),1,32) == Requeue) {
        if $r.glob(Fserve,SmartSend) != On {
          if (($r.set(Fserve,Max.Sends.Total) > $isend(0)) && ($r.set(Fserve,Max.Sends.Each) > $send.nick($gettok($Pqueue(%queue-sc),2,32)))) { goto send }
          else { goto start }
        }
        else {
          if ($SSend.chk(1) == $true) {
            unset %nossend [ $+ [ $iNetwork ] ] 
            if ($r.set(Fserve,Max.Sends.Each) > $send.nick($gettok($Pqueue(%queue-sc),2,32))) { goto send }
          }
          else { goto start }
        }
      }
      var %serv = Fserve,XDCC,mp3serv,TDCC_1,TDCC_2,TDCC_3,TDCC_4,TDCC_5
      var %sct = 1
      var %outcome = 0
      while (%sct <= $numtok(%serv,44)) {
        var %curserv = $gettok(%serv,%sct,44)
        if ($gettok($Pqueue(%queue-sc),1,32) == %curserv) {
          if $r.glob(Fserve,SmartSend) != On {
            if ($tc($gettok($Pqueue(%queue-sc),2,32),%curserv) == $false) { Pqueue.del %queue-sc | unset %queue-sc | var %outcome = 2 }
            if (($r.set($gettok(%curserv,1,95),Max.Sends.Total) > $isend(0)) && ($r.set($gettok(%curserv,1,95),Max.Sends.Each) > $send.nick($gettok($Pqueue(%queue-sc),2,32)))) { var %outcome = 1 }
          }
          else {
            if ($tc($gettok($Pqueue(%queue-sc),2,32),%curserv) == $false) { Pqueue.del %queue-sc | unset %queue-sc | var %outcome = 2 }
            if ($SSend.chk(1) == $true) {
              if ($r.set($gettok(%curserv,1,95),Max.Sends.Each) > $send.nick($gettok($Pqueue(%queue-sc),2,32))) { var %outcome = 1 }
              unset %nossend [ $+ [ $iNetwork ] ] 
            }
          }
        }
        inc %sct 1
      }
      if %outcome == 1 { goto send }
      if %outcome == 2 { goto queue }
      goto start
      :send
      .timer -o 1 0 QueueTime $gettok($Pqueue(%queue-sc),4,32)
      ;   if $r.set(Fserve,Logging) == On { .timer -o 1 0 FSlog Sending $gettok($Pqueue(%queue-sc),5-,32) to $gettok($Pqueue(%queue-sc),2,32) }
      DCCstatwin Sending $gettok($Pqueue(%queue-sc),5-,32) to $gettok($Pqueue(%queue-sc),2,32)
      .timer 1 0 .idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $gettok($Pqueue(%queue-sc),2,32) " $+ $gettok($Pqueue(%queue-sc),5-,32) $+ " 
      if ($r.set(Invision,SndOpt17) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound18) } 
      Pqueue.del %queue-sc 
      unset %queue-sc 
      halt
    }
  }
}
AdjustBW {
  if $r.glob(Fserve,MaxBandEach) == 0 && $r.glob(Fserve,Max.Serv.Bandwidth) == 0 { w.glob DCCmgr SendBW 0 | .dcc maxcps 0 }
  else {
    if $r.glob(Fserve,MaxBandEach) >= 1 { w.glob DCCmgr SendBW $r.glob(Fserve,MaxBandEach) | .dcc maxcps $calc($r.glob(DCCmgr,SendBW) * $send(0)) }
    if $r.glob(Fserve,Max.Serv.Bandwidth) > 0 { w.glob DCCmgr SendBW $r.glob(Fserve,Max.Serv.Bandwidth) | .dcc maxcps $r.glob(Fserve,Max.Serv.Bandwidth) } 
  }
  ; ************** Dead Fserve Session Killer
  deadfservewindowkiller
  deadsendswindowkiller
}
RequeueSends { 
  if $isend(0) >= 1 { 
    var %tot = $isend(0)
    var %ct = $isend(0)
    while (%ct >= 1) { 
      var %nick = $isend(%ct)
      var %fn = $isend(%ct).path $+ $isend(%ct).file
      var %host = $address(%nick,5)
      if %host != $null && $level(%host) >= $iif($r.set(DCCmgr,SQlevel) != $null,$r.set(DCCmgr,SQlevel),14) && $r.set(DCCmgr,SecondQ) == On { 
        .timer -o 1 0 Pqueue.insert Requeue %nick $iif(%host != $null,%host,%nick) $ctime %fn
        if $1 == PAUSE { .timer 1 0 notice %nick The Server has been temporarily paused. Your file transfer will be resumed shortly. Sorry for the inconvienence. $ilogo }
        close -s %nick
      }
      else {
        .timer -o 1 0 queue.insert Requeue %nick $iif(%host != $null,%host,%nick) $ctime %fn
        if $1 == PAUSE { .timer 1 0 notice %nick The Server has been temporarily paused. Your file transfer will be resumed shortly. Sorry for the inconvienence. $ilogo }
        close -s %nick
      }
      dec %ct 1 
    }
  }
}
QueueTime {
  if $1 != $null {
    var %ct = 5
    while (%ct >= 2) { 
      w.set DCCmgr QueueTime $+ %ct $iif($r.set(DCCmgr,QueueTime [ $+ [ $calc(%ct - 1) ] ] ) != $null,$r.set(DCCmgr,QueueTime [ $+ [ $calc(%ct - 1) ] ] ),0)
      dec %ct 1
    }
    w.set DCCmgr QueueTime1 $calc($ctime - $1)
  }
  else {
    if $calc($queue(0) + $Pqueue(0)) <= 0 { Return No Wait }
    if $r.set(DCCmgr,QueueTime1) != $null {
      var %ct = 1
      var %tot = 0
      while (%ct <= 5) {
        if $r.set(DCCmgr,QueueTime [ $+ [ %ct ] ] ) != $null && $r.set(DCCmgr,QueueTime [ $+ [ %ct ] ] ) != 0 { var %sum = $calc(%sum + $r.set(DCCmgr, [ QueueTime [ $+ [ %ct ] ] ] )) | inc %tot 1 }
        inc %ct 1
      }
      var %avg  = $int($calc(%sum / %tot))
      return $duration(%avg,2)
    }
    else { return n/a }
  }
}
TrigExtract {
  if ($1 != $null) {
    var %str = $right($strip($1-,burc),-10)
    var %len = $len(%str)
    var %pos = $pos(%str,trigg,1)
    if (/ctcp isin $left(%str,200)) { 
      var %ctcpad = 1 
      var %nickpos = $calc($pos(%str,/ctcp,1) + 6)
      var %adnick = $gettok($right(%str,$calc(%len - %nickpos)),1,32)
      var %nicklen = $len(%adnick)
      var %str = $replace(%str,%adnick,$str($chr(160),%nicklen))
    }
    if (*List trigger(s):*OmenServe* iswm $1-) { ; OmenServe Ad
      return $gettok(%str,4,32)
    }
    if (%pos != $null) {
      var %tot = $calc(%pos + 10)
      while (%pos <= %tot) {
        var %chr = $mid(%str,%pos,1)
        if (%chr == $chr(171)) || (%chr == $chr(139)) || (%chr == $chr(91)) || (%chr == $chr(123)) || (%chr == $chr(40)) || (%chr == $chr(60)) || ((. Snagged: isin %str) && (%chr == $chr(32))) || ((::.. Waiting isin %str) && (%chr == $chr(58))) || ((riggers..:: isin %str) && (%chr == $chr(58)))  || ((rigger..:: isin %str) && (%chr == $chr(58))) || (* $+ $chr(40) Trigger*:* iswm %str) || ((rigger]: isin %str) && (%chr == $chr(58))) || (([Trigger: isin %str) && (%chr == $chr(58))) {
          if (%chr == $chr(171)) { var %cchr = $chr(187) }
          elseif (%chr == $chr(139)) { var %cchr = $chr(155) }
          elseif (%chr == $chr(91)) { var %cchr = $chr(93) }
          elseif (%chr == $chr(123)) { var %cchr = $chr(125) }
          elseif (%chr == $chr(40)) { var %cchr = $chr(41) }
          elseif (%chr == $chr(60)) { var %cchr = $chr(62) }
          elseif (. Snagged: isin %str) { var %chr = $chr(32) | var %cchr = $chr(46) }
          elseif (::.. Waiting isin %str) { var %chr = $chr(58) | var %cchr = $chr(46) }
          elseif (riggers..:: isin %str) { var %chr = $chr(58) | var %cchr = $chr(46) }
          elseif (rigger..:: isin %str) { var %chr = $chr(58) | var %cchr = $chr(46) }
          elseif (rigger]: isin %str) { var %chr = $chr(58) | var %cchr = $chr(91) }
          elseif (* $+ $chr(40) Trigger*:* iswm %str) { var %chr = $chr(58) | var %cchr = $chr(41) }
          elseif ([Trigger: isin %str) { var %chr = $chr(58) | var %cchr = $chr(93) }
          var %start = $calc(%pos + 1)
          var %runout = $calc(%len - %start)
          var %ct = $calc(%pos + 1)
          while (%ct < %len) {
            var %chk = $mid(%str,%ct,1)
            if %chk == %cchr { 
              var %tlen = $calc(%ct - %start)
              var %trigs = $mid(%str,%start,%tlen)
              if ($left(%trigs,7) == rigger:) { var %trigs = $right(%trigs,-7) }
              elseif ($left(%trigs,8) == riggers:) { var %trigs = $right(%trigs,-8) }
              if ((%chr == $chr(139)) && ($left(%trigs,1) == $chr(166))) { var %trigs = $left($right(%trigs,-1),-1) }
              if ((%chr == $chr(58)) && ($left(%trigs,1) == $chr(58))) { var %trigs = $left($right(%trigs,-1),-2) }
              break       
            }
            inc %ct 1
          }
          break
        }
        inc %pos 1
      }
      if (%ctcpad == 1) { var %trigs = $replace(%trigs,$str($chr(160),%nicklen),%adnick) }
      ; find divisor
      var %trigs = $replace(%trigs,$chr(44),$chr(160))
      if ($istok(%trigs,$chr(38),32)) && ($istok(%trigs,$chr(149),32) == $false) { var %div = 38 }
      elseif ($istok(%trigs,$chr(38),32) == $false) && ($istok(%trigs,$chr(149),32)) { var %div = 149 }
      elseif (·¦· isin %trigs) { var %trigs = $replace(%trigs,·¦·,$chr(38)) | var %div = 38 }
      elseif ($istok(%trigs,$chr(166),32)) && ($istok(%trigs,$chr(149),32) == $false) && ($istok(%trigs,$chr(38),32) == $false) { var %div = 166 }
      else { return %trigs }
      var %toks = $numtok(%trigs,%div)
      var %ct = 1
      while (%ct <= %toks) {
        var %ret = $addtok(%ret,$gettok(%trigs,%ct,%div),44)
        inc %ct 1
      }
      return %ret
    }
    elseif (*For my list of*files* iswm %str) { ; OmenServe Ad
      var %str2 = $strip($1-,burc)
      var %left = $calc($pos(%str2,Type:,1) + 6)
      var %right = $calc($pos(%str2,For My List Of:,1))
      var %diff = %right - %left
      var %trigs = $mid(%str2,%left,%diff)
      return %trigs
    }
  }
}
IsoAd {
  if $1 != $null {
    if ($window(@Serve_Ads_ $+ %isoadchan [ $+ [ $iNetwork ] ] ) == $null) { 
      window -k0al20 @Serve_Ads_ $+ %isoadchan [ $+ [ $iNetwork ] ] -1 -1 750 500 @Serve_Ads_ $+ %isoadchan [ $+ [ $iNetwork ] ] 
      aline -p @Serve_Ads_ $+ %isoadchan [ $+ [ $iNetwork ] ] $c(2) $+ Started Capturing Ads Initiated via !list on $time(dddd) at $time(h:nntt) $+ .  
      aline -p @Serve_Ads_ $+ %isoadchan [ $+ [ $iNetwork ] ] $chr(160) $chr(160) $chr(160) $chr(160) $chr(160) $chr(160) $chr(160) $chr(160) $chr(160)
    }
    aline -p @Serve_Ads_ $+ %isoadchan [ $+ [ $iNetwork ] ] $1-
    if (File Server Online MOTD !isin $strip($1-,burc)) { var %trigs = $trigextract($1-) }
    hadd -m [ $iNetwork ] $+ ] [ $+ [ Nicks ] ] [ $+ [ %isoadchan [ $+ [ $iNetwork ] ] ] ] $remove($strip($2,burc),+,@) $iif(%trigs != $null,%trigs,1)
    var %ct = 1
    while (%ct <= $numtok(%trigs,44)) {
      aline -l @Serve_Ads_ $+ %isoadchan [ $+ [ $iNetwork ] ] $replace($gettok(%trigs,%ct,44),$chr(160),$chr(44))
      inc %ct 1
    } 
  }
}
IsoAdOT {
  if $2 != $null {
    if ($window(@Serve_Ads_ $+ $1) == $null) { 
      hfree -w [ $iNetwork ] $+ ] [ $+ [ Nicks ] ] [ $+ [ $1 ] ] 
      window -k0al20 @Serve_Ads_ $+ $1 -1 -1 750 500 @Serve_Ads_ $+ $1
      aline -p @Serve_Ads_ $+ $1 $c(2) $+ Started Capturing Ads on $time(dddd) at $time(h:nntt) $+ .  
      aline -p @Serve_Ads_ $+ $1 $chr(160) $chr(160) $chr(160) $chr(160) $chr(160) $chr(160) $chr(160) $chr(160) $chr(160)
    }
    if $hget( [ $iNetwork ] $+ ] [ $+ [ Nicks ] ] [ $+ [ $1 ] ] , $remove($strip($2,burc),+,@)) == $null {
      if (File Server Online MOTD isin $strip($2-,burc)) { if $r.set(Invision,IsoAdsOThalt) == On { halt } | else { return } }
      aline -p @Serve_Ads_ $+ $1 $2-
      var %trigs = $trigextract($2-) 
      hadd -m  [ $iNetwork ] $+ ] [ $+ [ Nicks ] ] [ $+ [ $1 ] ] $remove($strip($2,burc),+,@) $iif(%trigs != $null,%trigs,1)

      var %ct = 1
      while (%ct <= $numtok(%trigs,44)) {
        aline -l @Serve_Ads_ $+ $1 $replace($gettok(%trigs,%ct,44),$chr(160),$chr(44))
        inc %ct 1
      } 
    }
    else {
      if (File Server Online MOTD !isin $strip($2-,burc)) { 
        var %safety = 0
        :start
        inc %safety 1
        var %curlymofo = $fline(@Serve_Ads_  [ $+ [ $1 ] ] , $chr(42) $+ $iif($modeprefix,$strip($gettok($left($2-,30),1,62),burc),$strip($remove($gettok($left($2-,30),1,62),+,@),burc)) $+ $chr(42))
        if %curlymofo != $null { dline @Serve_Ads_ [ $+ [ $1 ] ] %curlymofo | if %safety <= 4 { goto start } } 
        else { 
          if $modeprefix {
            var %curlymofo = $fline(@Serve_Ads_  [ $+ [ $1 ] ] , $chr(42) $+ $strip($gettok($left($2-,30),1,62),burc) $+ $chr(42))
            if %curlymofo != $null { dline @Serve_Ads_ [ $+ [ $1 ] ] %curlymofo }  
          }
        } 
      }
      aline -p @Serve_Ads_ $+ $1 $2-
      if (File Server Online MOTD isin $strip($1-,burc)) { if $r.set(Invision,IsoAdsOThalt) == On { halt } | else { return } }
      var %trigs = $trigextract($2-) 
      var %oldtrigs = $hget( [ $iNetwork ] $+ ] [ $+ [ Nicks ] ] [ $+ [ $1 ] ] , $remove($strip($2,burc),+,@))
      hadd -m [ $iNetwork ] $+ ] [ $+ [ Nicks ] ] [ $+ [ $1 ] ] $remove($strip($2,burc),+,@) $iif(%trigs != $null,%trigs,1)

      var %ct = $numtok(%oldtrigs,44)
      while (%ct >= 1) {
        var %curlymofo = $fline(@Serve_Ads_ [ $+ [ $1 ] ] ,$replace($strip($gettok(%oldtrigs,%ct,44),burc),$chr(160),$chr(44)),1,1)
        if %curlymofo >= 1 {
          if %curlymofo != $null { dline -l @Serve_Ads_ $+ $1 %curlymofo }
        }
        dec %ct 1
      }
      var %ct = 1
      while (%ct <= $numtok(%trigs,44)) {
        aline -l @Serve_Ads_ $+ $1 $replace($gettok(%trigs,%ct,44),$chr(160),$chr(44))
        inc %ct 1
      } 
    }
    if $r.set(Invision,IsoAdsOThalt) == On { halt } | else { return }
  }
}
ClrQueues {
  ;           ************* ClrQueues(<nick>)
  if $1 != $null {
    if $r.set(DCCmgr,SecondQ) == On && $level($address($1,5)) >= $r.set(DCCmgr,SQlevel) {
      if ($Pqueue.nick($nick) == 0) { return $false }
      else {
        var %fserve-cq = 0
        :clr_queue-start-1
        inc %fserve-cq 1
        :clr_queue-start-2
        if ($Pqueue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
        elseif ($gettok($Pqueue(%fserve-cq),2,32) == $1) { Pqueue.del %fserve-cq | goto clr_queue-start-2 }
        else { goto clr_queue-start-1 }
        if $r.set(Fserve,Logging) == On { FSlog Deleted $1 queues. }
      }
      return $true 
    }
    else {
      if ($queue.nick($1) == 0) { return $false }
      else {
        var %fserve-cq = 0
        :clr_queue-start-1
        inc %fserve-cq 1
        :clr_queue-start-2
        if ($queue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
        elseif ($gettok($queue(%fserve-cq),2,32) == $1) { queue.del %fserve-cq | goto clr_queue-start-2 }
        else { goto clr_queue-start-1 }
        if $r.set(Fserve,Logging) == On { FSlog Deleted $1 queues. }
      }
      return $true
    }
  }
}
DCCstatwin {
  if $1 != $null {
    if $dialog(DCCManager) != $null {
      did -a DCCManager 43 $strip($1-,burc)
      if $did(DCCmanager,43).lines > 250 { did -d DCCmanager 43 1 }
      did -c DCCmanager 43 $did(DCCmanager,43).lines
    }
  }
}
FirewallChk {
  if $readini($shortfn($mircdir) $+ mirc.ini,socks,enabled) != no { return $true }
  return $false
}
BlockAllCTCP {
  if $r.set(Invision,BlockCTCPall) == On {
    w.set INvision BlockCTCPall Off
    aecho No longer blocking all CTCP's. To Block all ctcp's type /blockallctcp again.
  }
  else {
    w.set Invision BlockCTCPall On
    aecho Now blocking all CTCP's. To disable blocking of all ctcp's type /blockallctcp again.
  }
}
FxpToggle {
  if $r.set(Invision,Fxp) == On {
    w.set Invision Fxp Off 
    aecho File Server Explorer is now $c(2) $+ off $+ $c(1) $+ .
  }
  else {
    w.set Invision Fxp On
    aecho File Server Explorer is now $c(2) $+ on $+ $c(1) $+ .
  }
}
HalfOPsOK {
  if $r.set(Invision,ForceHalfOps) == On { return $true }
  if $network != $null {
    if $istok($r.set(Invision,HalfOpsList), $network, 44) { return $true }
  }
  if (*%* iswm $prefix) { return $true }
  return $false
}
CleanTriggers {
  var %ct = 1
  while (%ct <= 5) {
    if $r.set(Fserve,Channels) == all || $r.set(Fserve,Channels) == $null { w.set Fserve. [ $+ [ %ct ] ] Channels all }
    else {
      if $r.set(Fserve. [ $+ [ %ct ] ] ,Channels) == all || $r.set(Fserve. [ $+ [ %ct ] ] ,Channels) == $null { w.set Fserve. [ $+ [ %ct ] ] Channels all | inc %ct 1 | continue }
      else {
        var %inct = 1
        var %chans = $r.set(Fserve. [ $+ [ %ct ] ] ,Channels)
        unset %confusion
        while (%inct <= $numtok(%chans,44)) {
          if $istok($r.set(Fserve,Channels),$gettok(%chans,%inct,44),44) { var %confusion = $addtok(%confusion,$gettok(%chans,%inct,44),44) }
          inc %inct 1
        }
        if %confusion != $null { w.set Fserve. [ $+ [ %ct ] ] Channels %confusion }
        else { w.set Fserve. [ $+ [ %ct ] ] Channels all }
      }
    }
    inc %ct 1
  }
}
ulcleanout {
  if $isfile( [ $shortfn($mircdir) $+ system\users.ini ] ) { .copy -o $shortfn($mircdir) $+ system\users.ini $shortfn($mircdir) $+ system\userslist [ $+ [ .bak ] ] }
  var %tot = $iif($ulist(*,*,0) >= 1,$ulist(*,*,0),0)
  ; ***** Build a Table of the User Lists *****
  hfree -w users
  hmake users 100
  var %ct = 1
  while (%ct <= %tot) {
    hadd users user [ $+ [ %ct ] ] $ulist(*,*,%ct)
    hadd users nick [ $+ [ %ct ] ] $gettok($ulist(*,*,%ct).info,1,33)
    inc %ct 1
  }
  ; ******* Now Scan it *******
  var %ct = 1
  while (%ct <= %tot) {
    var %curnick = $hget(Users,nick [ $+ [ %ct ] ] )
    var %nicktot = $hfind(users,%curnick,0).data 
    if %nicktot >= 2 {
      ;  var %curNumber = $right($hfind(users,%curnick,1).data,-4)
      var %curacct = $hget(users,user [ $+ [ %ct ] ] )
      hdel users user [ $+ [ %ct ] ]
      hdel users nick [ $+ [ %ct ] ]
      if %curacct != $null { .ruser %curacct }
    }
    inc %ct 1
  }
  hfree -w users
}
HashAllSettings {
  if $exists( [ $shortfn($mircdir) $+ invision\settings.ini ] ) {
    secho Converting All Settings
    var %totsections = $ini($shortfn($mircdirinvision\settings.ini),0)
    var %sectCT = 1
    while (%sectCT <= %totsections) {
      var %tablename = Settings $+ $ini($shortfn($mircdirinvision\settings.ini),%sectCT)
      hadd -m SettingsTables $right(%tablename,-8) 1
      hfree -w %tablename  
      hmake %tablename 100
      var %totitems = $ini($shortfn($mircdirinvision\settings.ini),%sectCT,0)
      var %itemCT = 1
      while (%itemCT <= %totitems) {
        var %curitem = $ini($shortfn($mircdirinvision\settings.ini),%sectCT,%itemCT)
        hadd %tablename %curitem $ireadini($shortfn($mircdirinvision\settings.ini),$right(%tablename,-8),%CurItem)
        inc %itemCT 1
      }
      inc %sectCT 1
    }
    secho Done with Main Settings
  }
  if $exists( [ $shortfn($mircdir) $+ invision\chanset.ini ] ) {
    var %totsections = $ini($shortfn($mircdirinvision\chanset.ini,0)
    var %sectCT = 1
    while (%sectCT <= %totsections) {
      var %tablename = Chanset $+ $ini($mircdirinvision\chanset.ini),%sectCT)
      hadd -m SettingsTables $right(%tablename,-8) 1
      hfree -w %tablename  
      hmake %tablename 100
      var %totitems = $ini($shortfn($mircdirinvision\chanset.ini),%sectCT,0)
      var %itemCT = 1
      while (%itemCT <= %totitems) {
        var %curitem = $ini($shortfn($mircdirinvision\chanset.ini),%sectCT,%itemCT)
        hadd %tablename %curitem $ireadini($shortfn($mircdirinvision\chanset.ini),$right(%tablename,-8),%CurItem)
        inc %itemCT 1
      }
      inc %sectCT 1
    }
    secho Done with Channel Ops
  }
  if $exists( [ $shortfn($mircdir) $+ invision\NickRec.ini ] ) {
    var %totsections = $ini($shortfn($mircdirinvision\NickRec.ini),0)
    var %sectCT = 1
    while (%sectCT <= %totsections) {
      var %tablename = NickRecords $+ $ini($shortfn($mircdirinvision\NickRec.ini),%sectCT)
      hadd -m NickRecords $right(%tablename,-8) 1
      hfree -w %tablename  
      hmake %tablename 100
      var %totitems = $ini($shortfn($mircdirinvision\NickRec.ini),%sectCT,0)
      var %itemCT = 1
      while (%itemCT <= %totitems) {
        var %curitem = $ini($shortfn($mircdirinvision\NickRec.ini),%sectCT,%itemCT)
        hadd %tablename %curitem $ireadini($shortfn($mircdirinvision\NickRec.ini),$right(%tablename,-8),%CurItem)
        inc %itemCT 1
      }
      inc %sectCT 1
    }
    secho Done with Nick Records
  }
  if $exists( [ $shortfn($mircdir) $+ invision\Records.ini ] ) {
    var %totsections = $ini($shortfn($mircdirinvision\Records.ini),0)
    var %sectCT = 1
    while (%sectCT <= %totsections) {
      var %tablename = Records $+ $ini($shortfn($mircdirinvision\Records.ini),%sectCT)
      hadd -m Records $right(%tablename,-8) 1
      hfree -w %tablename  
      hmake %tablename 100
      var %totitems = $ini($shortfn($mircdirinvision\Records.ini),%sectCT,0)
      var %itemCT = 1
      while (%itemCT <= %totitems) {
        var %curitem = $ini($shortfn($mircdirinvision\Records.ini),%sectCT,%itemCT)
        hadd %tablename %curitem $ireadini($shortfn($mircdirinvision\Records.ini),$right(%tablename,-8),%CurItem)
        inc %itemCT 1
      }
      inc %sectCT 1
    }
    secho Done with File Records
  }
}
SaveAllSettingsToINI {
  var %totsections = $ini($shortfn($mircdirinvision\settings.ini),0)
  var %sectCT = 1
  while (%sectCT <= %totsections) {
    var %tablename = Settings $+ $ini($shortfn($mircdirinvision\settings.ini),%sectCT)
    var %totitems = $hget(%tablename,0).item
    var %itemCT = 1
    while (%itemCT <= %totitems) {
      var %curitem = $hget(%tablename,%itemCT).item
      iw.set $right(%tablename,-8) %curitem $hget(%tablename,%curitem)
      inc %itemCT 1
    }
    inc %sectCT 1
  }
}
MasterSaveAll { SaveAllGlobals | scid -a SaveAllSettings }
SaveAllSettings {
  var %tottables = $hget( [ SettingsTables $+ [ $iSetwork ] ] ,0).item
  var %ct = 1, %ct2 = 1
  while (%ct <= %tottables) { 
    if ($1 && $1 isin $hget(SettingsTables [ $+ [ $iSetwork ] ] ,%ct).item) {
      inc %ct2
      if $istable($hget(SettingsTables [ $+ [ $iSetwork ] ] ,%ct).item) { .timer 1 1 hsave -o $hget(SettingsTables [ $+ [ $iSetwork ] ] ,%ct).item [ $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \ $+  [ $remove($hget( [ SettingsTables $+ [ $iSetwork ] ] ,%ct).item,$iSetwork) ] $+ [ .i2s ] ] }
    }
    elseif (!$1) {
      if $istable($hget(SettingsTables [ $+ [ $iSetwork ] ] ,%ct).item) { .timer $+ $hget(SettingsTables [ $+ [ $iSetwork ] ] ,%ct).item 1 %ct hsave -o $hget(SettingsTables [ $+ [ $iSetwork ] ] ,%ct).item [ $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \ $+  [ $remove($hget( [ SettingsTables $+ [ $iSetwork ] ] ,%ct).item,$iSetwork) ] $+ [ .i2s ] ] }
    }
    inc %ct 1
  }
  iSaveQueues
  if $istable(SeenData [ $+ [ $iNetwork ] ] ) == $true { hsave -o SeenData [ $+ [ $iNetwork ] ] $shortfn($mircdir) $+ Invision\Settings\ $+ $iNetwork $+ \SeenData.i2d }
  if $istable(AutoGreetMessages) == $true { hsave -o AutoGreetMessages $shortfn($mircdir) $+ Invision\AutoGreetMessages.i2d }
  if $istable(mp3list [ $+ [ $iSetwork ] ] ) == $true { hsave -o mp3list [ $+ [ $iSetwork ] ] [ $shortfn($mircdir) $+ Invision\settings\ $+ [ $iSetwork ] $+ \mp3list.i2d ] }
}
LoadAllSettings {
  if ($iSetwork != $null) { hfree -w [ SettingsTables $+ [ $iSetwork ] ] 
  }
  var %tottables = $findfile($shortfn($mircdirInvision\Settings\ $+ [ $iSetwork ] $+ \),*.i2s,0,1)
  var %ct = 1
  while (%ct <= %tottables) {
    var %ftable = $left($nopath($findfile($shortfn($mircdirInvision\Settings\ $+ [ $iSetwork ] $+ \),*.i2s,%ct,1)),-4)
    var %curtable = $iSetwork $+ %ftable
    hadd -m [ SettingsTables $+ [ $iSetwork ] ] %curtable 1
    hfree -w %curtable
    hmake %curtable 50
    hload %curtable [ $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \ $+ [ %ftable ] $+ .i2s ] 
    inc %ct 1
  }
  hfree -w [ SeenData $+ [ $iNetwork ] ] 
  hmake [ SeenData $+ [ $iNetwork ] ] 100
  iLoadQueues
  if $exists( [ $shortfn($mircdir) $+ Invision\settings\ $+ [ $iNetwork ] $+ \SeenData.i2d ] ) { hfree -w [ SeenData $+ [ $iNetwork ] ] | hmake [ SeenData $+ [ $iNetwork ] ] 100 | hload [ SeenData $+ [ $iNetwork ] ] [ $shortfn($mircdir) $+ Invision\settings\ $+ [ $iNetwork ] $+ \SeenData.i2d ] }
  if $exists( [ $shortfn($mircdir) $+ Invision\settings\ $+ [ $iSetwork ] $+ \mp3list.i2d ] ) { hfree -w [ mp3list $+ [ $iSetwork ] ] | hmake [ mp3list $+ [ $iSetwork ] ] 200 | hload [ mp3list $+ [ $iSetwork ] ] [ $shortfn($mircdir) $+ invision\settings\ $+ [ $iSetwork ] $+ \mp3list.i2d ] }
}
SaveAllGlobals {
  if $tableempty(SettingsGlobal) == $false { hsave -o SettingsGlobal $shortfn($mircdir) $+ Invision\settings\SettingsGlobal.i2s }
  if $istable(AutoGreetMessages) == $true { hsave -o AutoGreetMessages $shortfn($mircdir) $+ Invision\AutoGreetMessages.i2d }
}
LoadAllGlobals {
  if $istable(SettingsGlobal) { hfree SettingsGlobal }
  if $istable(SettingsGlobalGlobals) { hfree SettingsGlobalGlobals }
  if $istable(AutoGreetMessages) { hfree AutoGreetMessages }
  if $exists( [ $shortfn($mircdir) $+ Invision\settings\SettingsGlobal.i2s ] ) { hfree -w SettingsGlobal | hmake SettingsGlobal 50 | hload SettingsGlobal $shortfn($mircdir) $+ Invision\settings\SettingsGlobal.i2s }
  if $exists( [ $shortfn($mircdir) $+ Invision\settings\SettingsGlobal.i2s ] ) { hfree -w SettingsGlobalGlobals | hmake SettingsGlobalGlobals 50 | hload SettingsGlobalGlobals $shortfn($mircdir) $+ Invision\settings\SettingsGlobal.i2s }
  if $exists( [ $shortfn($mircdir) $+ Invision\AutoGreetMessages.i2d ] ) { hfree -w AutoGreetMessages | hmake AutoGreetMessages 50 | hload AutoGreetMessages $shortfn($mircdir) $+ Invision\AutoGreetMessages.i2d }
}
iSaveQueues { 
  if $istable(Queues. [ $+ [ $iNetwork ] ] ) == $true { hsave -o Queues. [ $+ [ $iNetwork ] ] $shortfn($mircdir) $+ Invision\settings\ $+ [ $iNetwork ] $+ \Queues.i2d } 
  else { if $isfile( [ $shortfn($mircdir) $+ invision\settings\ $+ [ $iNetwork ] $+ \Queues.i2d ] ) { .remove [ $shortfn($mircdir) $+ invision\settings\ $+ [ $iNetwork ] $+ \Queues.i2d ] } }
}
iLoadQueues { 
  if $exists( [ $shortfn($mircdir) $+ Invision\settings\ $+ [ $iNetwork ] $+ \Queues.i2d ] ) { 
    hfree -w Queues. [ $+ [ $iNetwork ] ] 
    hmake Queues. [ $+ [ $iNetwork ] ] 50
    hload Queues. [ $+ [ $iNetwork ] ] [ $shortfn($mircdir) $+ invision\settings\ $+ [ $iNetwork ] $+ \Queues.i2d ] 
  }
}
