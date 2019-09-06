; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: itext.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: on TEXT Routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
on ^*:text:*:?:{ 
  var %curlevel = $level($fulladdress)
  if (%curlevel == 5) { .msg $nick You are in my shitlist and are now being ignored! $ilogo | close -m $nick | .ignore -pntiu60 $wildsite | aecho $nick $bracket($address) has been put on ignore. $bracket(Shitlisted) }
  else {
    flud Text $fulladdress
    if ($gnick($nick) == $true) { mflud text }
    if (($r.set(Auto.ID,Status) == On) && ($nick == NickServ) && (*/msg NickServ IDENTIFY* iswm $1-)) {
      if (($me == $r.set(Auto.ID,Nick.1)) && ($r.set(Auto.ID,Pass.1) != $null)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.1) }
      elseif (($me == $r.set(Auto.ID,Nick.2)) && ($r.set(Auto.ID,Pass.2) != $null)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.2) }
      elseif (($me == $r.set(Auto.ID,Nick.3)) && ($r.set(Auto.ID,Pass.3) != $null)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.3) }
      elseif (($me == $r.set(Auto.ID,Nick.4)) && ($r.set(Auto.ID,Pass.4) != $null)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.4) }
      elseif (($me == $r.set(Auto.ID,Nick.5)) && ($r.set(Auto.ID,Pass.5) != $null)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.5) }
      ;elseif (($me ison $active) || ($query($active) != $null)) { editbox -ap / $+ %Nserv [ $+ [ $iNetwork ] ] IDENTIFY }
      ;else { editbox -sp / $+ %Nserv [ $+ [ $iNetwork ] ] IDENTIFY }
      echo -stlbf < $+ $nick $+ > $1-
      halt
    }
    if (($1- == !getmsg) && ($checkpending($fulladdress))) { SendMessages $fulladdress $nick | close -m $nick | halt }
    if ($r.set(XDCC,Status) == On) {
      if ($1 == XDCC) {
        if (%curlevel == 7) { .notice $nick $c(1) $+ Your access has been denied. $ilogo | aecho $nick $bracket($address) is trying to use the XDCC. $bracket(Banned) }
        elseif ($r.set(XDCC,Status) != On) { .msg $nick $c(1) $+ The XDCC is currently offline. $ilogo }
        else {
          if ($2 == $null) { .msg $nick Syntax: XDCC command | .msg $nick /msg $me XDCC HELP for more information. | halt }
          elseif ($2 == Help) {
            aecho $nick $bracket($address) is requesting XDCC help.
            if ($3 == Send) { .msg $nick Syntax: Send #<Pack Number> | .msg $nick This command will start file transfer. }
            elseif ($3 == List) { .msg $nick Syntax: List | .msg $nick The list command just lists the offered packs. }
            elseif ($3 != $null) { .msg $nick Syntax: Help command | .msg $nick Send   Sends Specified Pack | .msg $nick List   Lists the offered Packs }
            else { .msg $nick An XDCC is a Server where the only files that you can get are the ones that are offered.  For more info, type /msg $me XDCC Help command | .msg $nick Send   Sends Specified Pack | .msg $nick List   Lists the offered Packs }
          }
          elseif ($2 == List) {
            aecho $nick $bracket($address) is requesting the XDCC packet list. $iif($isnum($r.set(XDCC,Pack.List)) != $true,$bracket(Packet Listing Disabled)) $+ $iif($tc($nick,XDCC) != $true,$bracket(Rejected Request))
            if ($isnum($r.set(XDCC,Pack.List)) != $true) { .msg $nick $c(1) $+ Pack listing has been disabled. $ilogo }
            elseif ($tc($nick,XDCC) != $true) { .msg $nick $c(1) $+ Access has been denied because your not in one of the required channels. $bracket($iif($r.set(XDCC,Channels) == $null || $r.set(XDCC,Channels) == All,Every Channel I am On,$r.set(XDCC,Channels))) $ilogo }
            elseif (($calc($ctime - [ %xdcc-ctime [ $+ [ $iNetwork ] ] ] ) <= $r.set(XDCC,Pack.List)) && (%xdcc-ctime [ $+ [ $iNetwork ] ] != $null)) { .msg $nick $c(1) $+ Please wait another $lduration($calc($r.set(XDCC,Pack.List) - ($ctime - [ %xdcc-ctime [ $+ [ $iNetwork ] ] ] ))) before requesting the XDCC packets again. $ilogo }
            elseif ($findfile(Invision\Settings\ $+ $iSetwork $+ \,XDCCList*.txt,1)) { .msg $nick $c(1) $+ DCC Sending XDCC List.  To download a file from the list, type /ctcp $me XDCC Send #<pack number> | dcc send $nick $findfile(Invision\Settings\ $+ $iSetwork $+ \,XDCCList*.txt,1) }
            else { set -u [ $+ [ $calc($r.set(XDCC,Pack.List) * 2) ] ] %xdcc-ctime [ $+ [ $iNetwork ] ] $ctime | xdcc.ad.temp 1 .msg $nick }
          }
          elseif ($2 == Remove) && $3 == $null {
            if $r.set(DCCmgr,SecondQ) == On {
              if %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel) {
                if ($Pqueue.nick($nick) == 0) { msg $nick $c(1) $+ You have no queues waiting. }
                else {
                  var %fserve-cq = 0
                  :clr_queue-start-1
                  inc %fserve-cq 1
                  :clr_queue-start-2
                  if ($Pqueue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
                  elseif ($gettok($Pqueue(%fserve-cq),2,32) == $nick) { msg $nick $c(1) $+ Removing $c(2) $+ $nopath($gettok($Pqueue(%fserve-cq),5-,32)) $bracket($size($lof($gettok($Pqueue(%fserve-cq),5-,32)))) from your queue. | Pqueue.del %fserve-cq | goto clr_queue-start-2 }
                  else { goto clr_queue-start-1 }
                  if $r.set(Fserve,Logging) == On { FSlog $address($nick,5) deleted there queues. }
                }
              }
              else {
                if ($queue.nick($nick) == 0) { msg $nick $c(1) $+ You have no queues waiting. }
                else {
                  var %fserve-cq = 0
                  :clr_queue-start-1
                  inc %fserve-cq 1
                  :clr_queue-start-2
                  if ($queue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
                  elseif ($gettok($queue(%fserve-cq),2,32) == $nick) { msg $nick $c(1) $+ Removing $c(2) $+ $nopath($gettok($queue(%fserve-cq),5-,32)) $bracket($size($lof($gettok($queue(%fserve-cq),5-,32)))) from your queue. | queue.del %fserve-cq | goto clr_queue-start-2 }
                  else { goto clr_queue-start-1 }
                  if $r.set(Fserve,Logging) == On { FSlog $address($nick,5) deleted there queues. }
                }
              }
            }
            else {
              if ($queue.nick($nick) == 0) { msg $nick $c(1) $+ You have no queues waiting. }
              else {
                var %fserve-cq = 0
                :clr_queue-start-1
                inc %fserve-cq 1
                :clr_queue-start-2
                if ($queue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
                elseif ($gettok($queue(%fserve-cq),2,32) == $nick) { msg $nick $c(1) $+ Removing $c(2) $+ $nopath($gettok($queue(%fserve-cq),5-,32)) $bracket($size($lof($gettok($queue(%fserve-cq),5-,32)))) from your queue. | queue.del %fserve-cq | goto clr_queue-start-2 }
                else { goto clr_queue-start-1 }
                if $r.set(Fserve,Logging) == On { FSlog $address($nick,5) deleted there queues. }
              }
            }
            close -m $nick
            halt
          }
          elseif (($2 == Send) || ($2 == Get)) {
            aecho $nick $bracket($address) is requesting an XDCC packet. $iif($tc($nick,XDCC) != $true,$bracket(Rejected Request),$iif($3 == $null,$bracket(n/a),$bracket($3)))
            if ($tc($nick,XDCC) != $true) { .notice $nick $c(1) $+ Access has been denied because your not in one of the required channels. $ilogo }
            else {
              if ($3 == $null) { .notice $nick Syntax: Send #<Pack Number> }
              elseif ($r.xdcc.pack($remove($3,$chr(35)),DL) == $null) { .notice $nick $c(1) $+ Invalid Pack }
              elseif ($isend(0) >= $r.set(XDCC,Max.Sends.Total)) {
                if $r.set(DCCmgr,SecondQ) == On && %curlevel >= $r.set(DCCmgr,SQlevel) { 
                  if ($Pqueue(0) >= $r.set(XDCC,Max.Queues.Total)) { .notice $nick $c(1) $+ There are too many send in progress right now and all Priority Queue slots are used. }
                  elseif ($Pqueue.nick($nick) >= $r.set(XDCC,Max.Queues.Each)) { .notice $nick $c(1) $+ There are too many sends in progress right now and have used all your queue slots. | halt }
                  else {
                    Pqueue.add XDCC $nick $iif($address($nick,5) != $null,$address($nick,5),$fulladdress) $ctime $r.xdcc.pack($remove($3,$chr(35)),Filename)
                    if ($result isnum) { .notice $nick $c(1) $+ That queue already exists in queue slot $chr(35) $+ $result $+ , try another file. }
                    else { .notice $nick $c(1) $+ Priority Queuing $+ $c(2) $iif($r.xdcc.pack($remove($3,$chr(35)),Desc) != None,$v1,$nopath($r.xdcc.pack($remove($3,$chr(35)),Filename))) $+ $c(1) ( $+ $size($file($r.xdcc.pack($remove($3,$chr(35)),Filename)).size) $+ ).  It has been placed in queue slot $chr(35) $+ $Pqueue(0) $+ , it will send when sends are available. }
                  }
                }
                else {
                  if ($queue(0) >= $r.set(XDCC,Max.Queues.Total)) { .notice $nick $c(1) $+ There are too many send in progress right now and all queue slots are used. }
                  elseif ($queue.nick($nick) >= $r.set(XDCC,Max.Queues.Each)) { .notice $nick $c(1) $+ There are too many sends in progress right now and have used all your queue slots. | halt }
                  else {
                    queue.add XDCC $nick $iif($address($nick,5) != $null,$address($nick,5),$fulladdress) $ctime $r.xdcc.pack($remove($3,$chr(35)),Filename)
                    if ($result isnum) { .notice $nick $c(1) $+ That queue already exists in queue slot $chr(35) $+ $result $+ , try another file. }
                    else { .notice $nick $c(1) $+ Queuing $+ $c(2) $iif($r.xdcc.pack($remove($3,$chr(35)),Desc) != None,$v1,$nopath($r.xdcc.pack($remove($3,$chr(35)),Filename))) $+ $c(1) ( $+ $size($file($r.xdcc.pack($remove($3,$chr(35)),Filename)).size) $+ ).  It has been placed in queue slot $chr(35) $+ $queue(0) $+ , it will send when sends are available. }
                  }
                }
              }
              elseif ($send.nick($nick) >= $r.set(XDCC,Max.Sends.Each)) {
                if $r.set(DCCmgr,SecondQ) == On && %curlevel >= $r.set(DCCmgr,SQlevel) {
                  if ($Pqueue(0) >= $r.set(XDCC,Max.Queues.Total)) { .notice $nick $c(1) $+ You have too many transfers right now and all Priority Queue slots are in use. }
                  elseif ($Pqueue.nick($nick) >= $r.set(XDCC,Max.Queues.Each)) { .notice $nick $c(1) $+ Sorry, you have too many transfers right now and you have used all your queue slots.  If you still want to get a file please wait for one to finish and try again. }
                  else {
                    Pqueue.add XDCC $nick $iif($address($nick,5) != $null,$address($nick,5),$fulladdress) $ctime $r.xdcc.pack($remove($3,$chr(35)),Filename)
                    if ($result isnum) { .notice $nick $c(1) $+ That queue already exists in queue slot $chr(35) $+ $result $+ , try and get another file next time. }
                    else { .notice $nick $c(1) $+ Priority Queuing $+ $c(2) $iif($r.xdcc.pack($remove($3,$chr(35)),Desc) != None,$v1,$nopath($r.xdcc.pack($remove($3,$chr(35)),Filename))) $+ $c(1) ( $+ $size($file($r.xdcc.pack($remove($3,$chr(35)),Filename)).size) $+ ).  It has been placed in queue slot $chr(35) $+ $Pqueue(0) $+ , it will send when sends are available. }
                  }
                }
                else {
                  if ($queue(0) >= $r.set(XDCC,Max.Queues.Total)) { .notice $nick $c(1) $+ You have too many transfers right now and all queue slots are in use. }
                  elseif ($queue.nick($nick) >= $r.set(XDCC,Max.Queues.Each)) { .notice $nick $c(1) $+ Sorry, you have too many transfers right now and you have used all your queue slots.  If you still want to get a file please wait for one to finish and try again. }
                  else {
                    queue.add XDCC $nick $iif($address($nick,5) != $null,$address($nick,5),$fulladdress) $ctime $r.xdcc.pack($remove($3,$chr(35)),Filename)
                    if ($result isnum) { .notice $nick $c(1) $+ That queue already exists in queue slot $chr(35) $+ $result $+ , try and get another file next time. }
                    else { .notice $nick $c(1) $+ Queuing $+ $c(2) $iif($r.xdcc.pack($remove($3,$chr(35)),Desc) != None,$v1,$nopath($r.xdcc.pack($remove($3,$chr(35)),Filename))) $+ $c(1) ( $+ $size($file($r.xdcc.pack($remove($3,$chr(35)),Filename)).size) $+ ).  It has been placed in queue slot $chr(35) $+ $queue(0) $+ , it will send when sends are available. }
                  }
                }
              }
              else { .dcc send -l $nick " $+ [ $r.xdcc.pack($remove($3,$chr(35)),Filename) ] $+ " | .notice $nick $c(1) $+ Sending $c(2) $+ $iif($r.xdcc.pack($remove($3,$chr(35)),Desc) != None,$v1,$nopath($r.xdcc.pack($remove($3,$chr(35)),Filename))) $+ $c(1) ( $+ $size($file($r.xdcc.pack($remove($3,$chr(35)),Filename)).size) $+ ).  This file has been downloaded $c(2) $+ $r.xdcc.pack($remove($3,$chr(35)),DL) $+ $c(1) time(s). }
            }
          }
          else { .msg $nick Unrecognized command $2 $+ .  Type "/msg $me XDCC Help" for help. }
        }
        .timer 1 0 close -m $nick
        halt
      }
    }
    if ($r.set(mp3serv,Status) == On) && ($r.set(mp3serv,Listen) == On) && ($r.set(mp3serv,Pause) != On) {
      if ($strip($1-,burc) ==  @ [ $+ [ $me ] ] ) && ($r.set(mp3serv,SendList) == On) && (%mp3ReqFlag [ $+ [ %curNetwork ] ] != 1) { .timer -o 1 8 unset %mp3ReqFlag [ $+ [ %curNetwork ] ] | set %mp3ReqFlag [ $+ [ %curNetwork ] ] 1 | mp3servLIST $nick | close -m $nick | halt }
      if ((($strip($1,burc) == ! [ $+ [ $me ] ] ) && ($r.set(mp3serv,UseNickTrigger) == On)) || (($strip($1,burc) == $strip($r.set(mp3serv,Trigger),burc)) && ($r.set(mp3serv,UseNickTrigger) != On))) && (%mp3ReqFlag [ $+ [ %curNetwork ] ] != 1) && ($2 != $null) {
        .timer -o 1 3 unset %mp3ReqFlag [ $+ [ %curNetwork ] ]
        set %mp3ReqFlag [ $+ [ %curNetwork ] ] 1
        close -m $nick        
        if ($strip($2-,burc) == List) && ($r.set(mp3serv,SendList) == On) { mp3servLIST $nick | halt }
        if ($strip($2-,burc) == Queues) { mp3servQueues $nick | halt }
        if ($strip($2-,burc) == Clear All) { mp3servClearAll $nick | halt } 
        if ($strip($2,burc) == Clear) && ($strip($3,burc) isnum 1- 999) && ($strip($4,burc) == $null) { mp3servClearOne $nick $strip($3,burc) | halt }
        if ($strip($2-,burc) == mp3Help) { mp3servHELP $nick | halt }
        set %newtwo $replace($2-,$chr(44),$chr(42),$chr(40),*,$chr(41),*)
        if $istok($r.set(mp3serv,FileTypes),$right($strip(%newtwo,burc),4),44) {
          ;  set %mp3tosend $hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)
          if $hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data) == $null { .notice $nick $c(1) $+ Sorry $c(2) $+ $nick $+ $c(1) $+ , but $c(2) $+ $2- $c(1) $+ was not found. Be sure you have spelled it correctly. | halt }
          if $exists($hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)) {
            if ($isend(0) >= $r.set(mp3serv,Max.Sends.Total)) {
              if ($queue(0) >= $r.set(mp3serv,Max.Queues.Total)) { .notice $nick $c(1) $+ Sorry, you have too many transfers right now and all the queue slots are in use. | Halt }
              elseif ($queue.nick($nick) >= $r.set(Fserve,Max.Queues.Each)) { .notice $nick $c(1) $+ You have too many transfers right now and you have used all your queue slots. | Halt }
              elseif ($r.set(mp3serv,CloneGuard) == On) && ($cloneQchk($nick) == $true) { .notice $nick $c(2) $+ CloneGuard $c(1) $+ has detected you have queues already under another nick. Queuing files with clones is prohibited. | Secho CloneGuard in action towards $nick | Halt }
              else {
                queue.add mp3serv $nick $iif($address($nick,5) != $null,$address($nick,5),$nick) $ctime $hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)
                if ($result isnum) { .notice $nick $c(1) $+ That queue already exists in the queue for you. }
                else { .notice $nick $c(1) $+ Queuing $+ $c(2) $nopath($hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)) $bracket($size($file($hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)).size)) $+ .  It has been placed in queue slot $chr(35) $+ $queue(0) $+ , it will send asap. }
              }
            }
            elseif ($send.nick($nick) >= $r.set(mp3serv,Max.Sends.Each)) {
              if ($queue(0) >= $r.set(mp3serv,Max.Queues.Total)) { .notice $nick $c(1) $+ Sorry, you have too many transfers right now and all the queue slots are in use. | Halt }
              elseif ($queue.nick($nick) >= $r.set(Fserve,Max.Queues.Each)) { .notice $nick $c(1) $+ You have too many transfers right now and you have used all your queue slots. | Halt }
              elseif ($r.set(mp3serv,CloneGuard) == On) && ($cloneQchk($nick) == $true) { .notice $nick $c(2) $+ CloneGuard $c(1) $+ has detected you have queues already under another nick. Queuing files with clones is prohibited. | Secho CloneGuard in action towards $nick | Halt }
              else {
                queue.add mp3serv $nick $iif($address($nick,5) != $null,$address($nick,5),$nick) $ctime $hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] , [ *:*\ [ $+ [ $strip($2-,burc) ] ] ] ,1).data)
                if ($result isnum) { .notice $nick $c(1) $+ That queue already exists in the queue for you. }
                else { .notice $nick $c(1) $+ Queuing $+ $c(2) $nopath($hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)) $bracket($size($file($hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)).size)) $+ .  It has been placed in queue slot $chr(35) $+ $queue(0) $+ , it will send asap. }
              }
            }
            else {
              .idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $nick " $+ $hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] , [ *:* [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data) $+ " | if ($r.set(Invision,SndOpt17) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound18) } 
            }
          }
          else {
            .notice $nick $c(1) $+ Sorry $c(2) $+ $nick $+ $c(1) $+ , but $c(2) $+ $2- $c(1) $+ is currently unavailable. 
            halt 
          }
        }
      }
    }
    if (($away == $true) && ($r.set(Away,Auto.Reply) == On) && ($nick != $me) && ($gnick($nick) == $true) && ($1 != XDCC) && (%idle. [ $+ [ $nick ] ] [ $+ [ $iNetwork ] ] == $null) && ($idle >= 60)) { .msg $nick $C(1) $+ AFK, $away.reason $c(2) $+ Gone for $away.time now. $away.pager $ilogo | set %idle. [ $+ [ $nick ] ] [ $+ [ $iNetwork ] ] 1 | .timer 1 300 unset %idle. [ $+ [ $nick ] ] [ $+ [ $iNetwork ] ] }    
    if (($away == $true) && ($r.set(Away,Tooltip.Away) == On)) { noop $tip(AwayMsg,Message from $nick,$iif($1 == $null,<none>,$1-),$null,$readini($mircini,files,trayicon),1,window -a $nick,$null) } 
  }
  if ($r.set(Invision,Decrypt) == On) {
    if ($left($1,3) == §€¥) { 
      echo -t $chan $c(2) $+ You cannot decrypt text from $nick because it was encrypted on mIRC 6.35 or older or Invision 3.2 or older. $bracket(Decryption Failed)
      halt 
      ;set -u0 %rtndc $decrypt($1-) 
      ;if (%rtndc == §§§) { 
      ;  echo -t $chan $c(2) $+ Your key did not match that used to encrypt. $bracket(Decryption Failed) 
      ;} 
      ;else { echo $chan $c(1) $+ DECRYPTED: $c(1) $+ < $+ $c(2) $+ $nick $+ $c(1) $+ >  $+ $decrypt($1-) | Halt } 
    }
    elseif ($left($1,3) == §Å¥ || $left($1,2) == §ť) { 
      echo -t $chan $c(2) $+ You cannot decrypt text from $nick because it was encrypted on mIRC 6.35 or older or Invision 3.2 or older. $bracket(Decryption Failed) 
      ;echo -t $chan $c(1) $+ DECRYPTED: $c(1) $+ < $+ $c(2) $+ $nick $+ $c(1) $+ >  $+ $decrypt2($1-) 
      halt 
    }
    elseif ($left($1,3) == ]) {
      echo -t $chan $c(2) $+ You cannot decrypt text from $nick because it was encrypted on mIRC 6.35 or older or Invision 3.2 or older. $bracket(Decryption Failed)
      halt
      ;if ($2 != $null) {
      ;  crypt 1 $r.set(Invision,CryptKey) $2-
      ;  echo -t $chan $c(1) $+ < $+  $+ $nick - $c(2) $+ ircN Decrypt $+ $c(1) $+ >  $+ $result
      ;  halt 
      ;}
    }
    elseif ($left($1,2) == $chr(8751) $+ $chr(8751)) {
      var %decrypt = $decrypt3($1-)
      if (%decrypt != $null) {
        echo -t $chan $c(1) $+ DECRYPTED: $c(1) $+ < $+ $c(2) $+ $nick $+ $c(1) $+ >  $+ $decrypt3($1-) 
        halt
      }
    }
  }
  if ($1- == !Queues) && %prvQueuesFlag [ $+ [ $iNetwork ] ] != 1 {
    .timer -o 1 10 unset %prvQueuesFlag [ $+ [ $iNetwork ] ]
    set %prvQueuesFlag [ $+ [ $iNetwork ] ] 1
    if $r.set(DCCmgr,SecondQ) == On && %curlevel >= $r.set(DCCmgr,SQlevel) { 
      if ($Pqueue(0) == 0) { .msg $nick $ilogo $c(1) $+ All Priority queues are available. $iif($queue(0) >= 1,There are however $queue(0) regular queues waiting.) }
      else {
        if ($Pqueue(0) == 1) { .msg $nick $ilogo $c(1) $+ Only one queue is in use. }
        elseif ($Pqueue(0) > 1) { .msg $nick $ilogo $c(1) $+ There are $Pqueue(0) queues waiting. The Average Queue Time is $queuetime }
        var %fserve-q = 0
        :queuestart
        inc %fserve-q 1
        if ($Pqueue(%fserve-q) == $null) { unset %fserve-q }
        else { .timer 1 $calc(%fserve-q * 1) .msg $nick $c(2) $+ Queue $chr(35) $+ %fserve-q $C(1) $+ for $c(2) $+ $iif(($r.set(DCCmgr,CloakNicks) != On || $nick == $gettok($Pqueue(%fserve-q),2,32)),$gettok($Pqueue(%fserve-q),2,32),Cloaked User) $+ $c(1) is queued for file $c(2) $+ $nopath($gettok($Pqueue(%fserve-q),5-,32)) $bracket($size($lof($gettok($Pqueue(%fserve-q),5-,32)))) using the $c(2) $+ $gettok($Pqueue(%fserve-q),1,32) $+ $c(1) $+ . | goto queuestart }
      }
    }
    else {
      if ($queue(0) == 0) { .msg $nick $ilogo $c(1) $+ All queues are available. }
      else {
        if ($queue(0) == 1) { .msg $nick $ilogo $c(1) $+ Only one queue is in use. }
        elseif ($queue(0) > 1) { .msg $nick $ilogo $c(1) $+ There are $queue(0) queues waiting. The Average Queue Time is $queuetime }
        var %fserve-q = 0
        :queuestart
        inc %fserve-q 1
        if ($queue(%fserve-q) == $null) { unset %fserve-q }
        else { .timer 1 $calc(%fserve-q * 1) .msg $nick $c(2) $+ Queue $chr(35) $+ %fserve-q $c(1) $+ for $c(2) $+ $iif(($r.set(DCCmgr,CloakNicks) != On || $nick == $gettok($queue(%fserve-q),2,32)),$gettok($queue(%fserve-q),2,32),Cloaked User) $+ $c(1) is queued for file $c(2) $+ $nopath($gettok($queue(%fserve-q),5-,32)) $bracket($size($lof($gettok($queue(%fserve-q),5-,32)))) using the $c(2) $+ $gettok($queue(%fserve-q),1,32) $+ $c(1) $+ . | goto queuestart }
      }
    }
    close -m $nick
    halt
  }
  if ($1- == !sends) && %prvQueuesFlag [ $+ [ $iNetwork ] ] != 1 {
    .timer -o 1 10 unset %prvQueuesFlag [ $+ [ $iNetwork ] ]
    set %prvQueuesFlag [ $+ [ $iNetwork ] ] 1
    if ($isend(0) == 0) { 
      .msg $nick $c(1) $+ Currently no sends in progress.  $+ $ilogo 
      return 
    } 
    elseif ($isend(0) == 1) { 
      .msg $nick $c(1) $+ 1 send currently in progress.  $+ $ilogo 
    } 
    elseif ($isend(0) > 1) { 
      .msg $nick $c(1) $+ $isend(0) sends currently in progress.  $+ $ilogo 
    } 
    var %sends = 0 
    :sendstart 
    inc %sends 1 
    if ($isend(%sends) == $null) { 
      unset %sends 
      close -m $nick
      halt 
    } 
    .msg $nick $c(1) $+ Send $chr(35) $+ %sends $+ :  $c(2) $+ $iif(($r.set(DCCmgr,CloakNicks) != On || $nick == $isend(%sends)),$isend(%sends),Cloaked User) $c(1) $+ has $c(2) $+ $isend(%sends).pc $+ % $c(1) $+ of $+ $c(2) $isend(%sends).file $c(1) $+ $bracket($size($isend(%sends).size)) at $+ $c(2) $ratefix($isend(%sends).cps) $c(1) $+ $bracket( [ Approximately $lduration($round($calc(($isend(%sends).size - $isend(%sends).sent) / $isend(%sends).cps),0)) left ] ) 
    goto sendstart 
    close -m $nick
    halt
  }
  if ($hget(SpamSafe,$nick) != 1) && ($gnick($nick)) {
    if $r.set(Invision,SpamFilter) == On && %curlevel <= 14 { 
      var %list = $r.set(Invision,SpamList)
      var %num = $numtok(%list,44)
      var %ct = 1
      while (%ct <= %num) {
        if ($gettok(%list,%ct,44) isin $strip($1-,burc)) && (queue !isin $strip($1-,burc)) { close -m $nick | .ignore -pntidu15 $nick | .msg $nick Your message was blocked due to 04spam detection. $ilogo | .msg $nick $c(2) $+ Further more... $c(1) $+ $read($shortfn($mircdir) $+ Text\mama.txt) | aecho Blocked Spam /msg from $c(2) $+ $nick | Halt }
        inc %ct 1
      }
    }
  }
  if $r.set(Invision,SndOpt35) == On { if $active != $nick { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound45) } } 
  if $dqwin || ($away == $true && $r.set(Away,Msglogger) == On) {
    if  ($away == $true && $r.set(Away,Msglogger) == On) {
      if ($window(Message Window) != $null) && ($1- != $null) { echo -dt $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) | close -m $nick | Halt }
      else { dqwindow show | echo -dmbfht $c(1) $+ < $+ $modepre(q,$nick) $+ $c(1) $+ > $clrdj($1-) | close -m $nick | Halt }
    } 
    else { return }
  }
  if ($r.set(Invision,Visufix) == On) { echo -mbfht $nick < $+ $modepre(q,$nick) $+ > $visufix($1-) | Halt }
}
on ^*:text:*:#:{
  var %fulladdress = $fulladdress
  var %curNetwork = $iNetwork
  flud text %fulladdress
  mflud text $chan
  if ($r.set(Auto.ID,Status) == On) && ($nick == NickServ) {
    if (*/msg NickServ IDENTIFY* iswm $1-) {
      if (($me == $r.set(Auto.ID,Nick.1)) && ($r.set(Auto.ID,Pass.1) != $null)) { %Nserv [ $+ [ %curNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.1) }
      elseif (($me == $r.set(Auto.ID,Nick.2)) && ($r.set(Auto.ID,Pass.2) != $null)) { %Nserv [ $+ [ %curNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.2) }
      elseif (($me == $r.set(Auto.ID,Nick.3)) && ($r.set(Auto.ID,Pass.3) != $null)) { %Nserv [ $+ [ %curNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.3) }
      elseif (($me == $r.set(Auto.ID,Nick.4)) && ($r.set(Auto.ID,Pass.4) != $null)) { %Nserv [ $+ [ %curNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.4) }
      elseif (($me == $r.set(Auto.ID,Nick.5)) && ($r.set(Auto.ID,Pass.5) != $null)) { %Nserv [ $+ [ %curNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.5) }
      ;elseif (($me ison $active) || ($query($active) != $null)) { editbox -ap / $+ %Nserv [ $+ [ %curNetwork ] ] IDENTIFY }
      ;else { editbox -sp / $+ %Nserv [ $+ [ %curNetwork ] ] IDENTIFY }
      echo -stlbf < $+ $nick $+ > $1-
      halt
    }
  }
  if ($r.set(Auto.Pinger,Status) == On) {
    if ((Ping me == $1-) || ($1 == !ping)) && (%pingFLag [ $+ [ %curNetwork ] ] != 1) { 
      .timer -o 1 10 unset %pingFLag [ $+ [ %curNetwork ] ]
      set %pingFLag [ $+ [ %curNetwork ] ] 1
      .ctcp $nick ping 
    }
  }
  if ($r.glob(Messenger,Status) == On) {
    if ($r.glob(Messenger,Mode) == Text) {
      if ($CheckPending($fulladdress)) {
        if (%Messenger [ $+ [ $nick ] ] != 1) {
          .msg $nick $c(1) $+ I have $c(2) $+ $messagect($fulladdress) $c(1) $+ message(s) waiting for you. Please message me back $c(2) $+ !getmsg $c(1) $+ command to receive. $ilogo 
          .timer -o 1 7200 unset %Messenger $+ $nick
          set %Messenger [ $+ [ $nick ] ] 1
        }
      }
    }
  }
  if ($r.set(Invision,Seen) == On) {
    if ($nick ishop $chan) || ($nick isvo $chan) || ($nick isop $chan) || ($level($fulladdress) >= 15) || ($r.set(Invision,SeenTrack) != Friends) {
      if $strip($1,burc) == !Seen && ($len($2) >= 3) {
        iseen 1 $chan $nick $2
      }
    }
  }
  if ($r.set(Invision,Decrypt) == On) {
    if ($left($1,3) == §€¥) { 
      echo -t $chan $c(2) $+ You cannot decrypt text from $nick because it was encrypted on mIRC 6.35 or older or Invision 3.2 or older. $bracket(Decryption Failed)
      halt 
      ;set -u0 %rtndc $decrypt($1-) 
      ;if (%rtndc == §§§) { 
      ;  echo -t $chan $c(2) $+ Your key did not match that used to encrypt. $bracket(Decryption Failed) 
      ;} 
      ;else { echo $chan $c(1) $+ DECRYPTED: $c(1) $+ < $+ $c(2) $+ $nick $+ $c(1) $+ >  $+ $decrypt($1-) | Halt } 
    }
    elseif ($left($1,3) == §Å¥ || $left($1,2) == §ť) { 
      echo -t $chan $c(2) $+ You cannot decrypt text from $nick because it was encrypted on mIRC 6.35 or older or Invision 3.2 or older. $bracket(Decryption Failed) 
      ;echo -t $chan $c(1) $+ DECRYPTED: $c(1) $+ < $+ $c(2) $+ $nick $+ $c(1) $+ >  $+ $decrypt2($1-) 
      halt 
    }
    elseif ($left($1,3) == ]) {
      echo -t $chan $c(2) $+ You cannot decrypt text from $nick because it was encrypted on mIRC 6.35 or older or Invision 3.2 or older. $bracket(Decryption Failed)
      halt
      ;if ($2 != $null) {
      ;  crypt 1 $r.set(Invision,CryptKey) $2-
      ;  echo -t $chan $c(1) $+ < $+  $+ $nick - $c(2) $+ ircN Decrypt $+ $c(1) $+ >  $+ $result
      ;  halt 
      ;}
    }
    elseif ($left($1,2) == $chr(8751) $+ $chr(8751)) {
      var %decrypt = $decrypt3($1-)
      if (%decrypt != $null) {
        echo -t $chan $c(1) $+ DECRYPTED: $c(1) $+ < $+ $c(2) $+ $nick $+ $c(1) $+ >  $+ $decrypt3($1-) 
        halt
      }
    }
  }
}
on *:action:*:#:{ 
  var %fulladdress = $fulladdress
  var %curNetwork = $iNetwork
  flud Text %fulladdress
  var %ct = 1
  while (%ct <= 9) {
    if $r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .desc ] ] ) iswm $strip($1-,burc) {
      if ($istok($r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .chan ] ] ),$chan,32) == $true) || ($r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .chan ] ] ) == All) {
        if (Request isin $strip($1-,burc)) && ($r.set(Customs,WWreq. [ $+ [ %ct ] ] ) == On) { goto leave }
        if ($nick isop $chan) && ($r.set(Customs,WWops. [ $+ [ %ct ] ] ) == On) { goto leave }
        if ($nick isvo $chan) && ($r.set(Customs,WWvos. [ $+ [ %ct ] ] ) == On) { goto leave }
        if %WWflag [ $+ [ %curNetwork ] ] != 1 && $r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .msg ] ] ) != $null { 
          if $r.set(Customs,WWusemsg [ $+ [ %ct ] ] ) == On { msg $chan $c(2) $+ [ [ $r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .msg ] ] ) ] ] }
          if $r.set(Customs,WWusenot [ $+ [ %ct ] ] ) == On { notice $nick $c(2) $+ [ [ $r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .msg ] ] ) ] ] }
        }
      set %WWflag [ $+ [ %curNetwork ] ] 1 | .timerStopWW $+ %curNetwork -o 1 $r.set(Invision,WWtime) set %WWflag [ $+ [ %curNetwork ] ] 0 | if (($r.set(Customs,WWkick. [ $+ [ %ct ] ] ) == On) || ($r.set(customs,WWban. [ $+ [ %ct ] ] ) == On)) && (($me isop $chan) || ($me ishop $chan)) { if $r.set(Customs,WWban. [ $+ [ %ct ] ] ) == On { .timer -o 1 $calc(%defban * 60) mode $chan -b $address($nick,$r.glob(Invision,DefaultBan)) | mode $chan +b $address($nick,$r.glob(Invision,DefaultBan)) } | kick $chan $nick  $+ $rkick $+  ) ( $+ $ilogo(X) } }
    }
    :leave
    inc %ct 1 
  }
  ;if (pimp slaps $me isin $1-) { SoundQ $shortfn($mircdir) $+ SoundFX\SndFiles\pimpslap.wav | set %xtrawav [ $+ [ %curNetwork ] ] 1 | .timer -o 1 10 unset %xtrawav [ $+ [ %curNetwork ] ] }
}
on *:notice:*:#:{ 
  var %fulladdress = $fulladdress
  var %curNetwork = $iNetwork
  flud Notice %fulladdress
  mflud notice $chan
  var %ct = 1
  while (%ct <= 9) {
    if $r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .desc ] ] ) iswm $strip($1-,burc) {
      if ($istok($r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .chan ] ] ),$chan,32) == $true) || ($r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .chan ] ] ) == All) {
        if (Request isin $strip($1-,burc)) && ($r.set(Customs,WWreq. [ $+ [ %ct ] ] ) == On) { goto leave }
        if ($nick isop $chan) && ($r.set(Customs,WWops. [ $+ [ %ct ] ] ) == On) { goto leave }
        if ($nick isvo $chan) && ($r.set(Customs,WWvos. [ $+ [ %ct ] ] ) == On) { goto leave }
        if %WWflag [ $+ [ %curNetwork ] ] != 1 && $r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .msg ] ] ) != $null { 
          if $r.set(Customs,WWusemsg [ $+ [ %ct ] ] ) == On { msg $chan $c(2) $+ [ [ $r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .msg ] ] ) ] ] }
          if $r.set(Customs,WWusenot [ $+ [ %ct ] ] ) == On { notice $nick $c(2) $+ [ [ $r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .msg ] ] ) ] ] }
        }
      set %WWflag [ $+ [ %curNetwork ] ] 1 | .timerStopWW $+ %curNetwork -o 1 $r.set(Invision,WWtime) set %WWflag [ $+ [ %curNetwork ] ] 0 | if (($r.set(Customs,WWkick. [ $+ [ %ct ] ] ) == On || $r.set(customs,WWban. [ $+ [ %ct ] ] ) == On)) && (($me isop $chan) || ($me ishop $chan)) { if $r.set(Customs,WWban. [ $+ [ %ct ] ] ) == On { .timer -o 1 $calc(%defban * 60) mode $chan -b $address($nick,$r.glob(Invision,DefaultBan)) | mode $chan +b $address($nick,$r.glob(Invision,DefaultBan)) } | kick $chan $nick  $+ $rkick $+  ) ( $+ $ilogo(X) } }
    }
    :leave
    inc %ct 1 
  }
}
