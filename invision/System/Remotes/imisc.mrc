; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: imisc.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: Miscellaneous Routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
on &*:input:*:{
  set %i.inputtime $ctime
  if ($left($active,1) !isin $chantypes) { hadd -m SpamSafe $active 1 }
  if ($gettok($1,1,32) == /who) {
    scanclear
    set -u15 %DOwho [ $+ [ $iNetwork ] ] 1 
    return
  }
  if ($gettok($1,1,32) == /whois) {
    scanclear
    set -u10 %DOwhois [ $+ [ $iNetwork ] ] 1 
    return
  }
  if ($gettok($1,1,32) == /names) {
    scanclear
    set -u10 %DOnames [ $+ [ $iNetwork ] ] 1 
    return
  }
  if ($gettok($1,1,32) == /join) || ($gettok($1,1,32) == /j) {
    unset %CNJC [ $+ [ $iNetwork ] ] [ $+ [ * ] ]
    return
  }
  if ($r.set(Away,Auto.Away) == On) && ($isnum($r.set(Away,Auto.Away.Delay)) == $true) && ($server != $null) { .timerAuto.Away $+ $iNetwork 1 $calc($r.set(Away,Auto.Away.Delay) * 60) auto-away } | w.mirc Wizard Advise 0
  if $ctrlenter == $true { return }
  if $left($1,1) == ! { .timerFSEB $+ $iNetwork -o 1 60 unset %altFxPflag [ $+ [ $iNetwork ] ] | set %altFxPflag [ $+ [ $iNetwork ] ] 1 }
  if $len($1-) < 940 && $active != Status Window { var %IStr = $replace($1-,$chr(36),$chr(36) $+ chr $+ $chr(40) $+ 36 $+ $chr(41),$chr(37), $chr(36) $+ chr $+ $chr(40) $+ 37 $+ $chr(41)) } | else { goto leave }
  var %IStr = $AcroAction($replace($1-,$chr(36),§¨©,$chr(37),§¨ª))
  if ($r.glob(Invision,Replace#) == False) { var %IStr = $replace(%IStr,$chr(35),~#~#~@~) }
  if (($me ison $active) && ($left($gettok(%IStr,1,32),1) != /) && ($right($gettok(%IStr,1,32),1) == :) && ($gettok(%IStr,1,32) != :) && $gettok(%IStr,1,32) != $chr(40) $+ : && $gettok(%IStr,1,32) != $chr(41) $+ : && $left($gettok(%IStr,1,32),-1) ison $active) {
    var %addr = $remove($left($strip($1),-1),$chr(40),$chr(41))
    if $chr(44) !isin %addr && $ialchan( [ %addr $+ *!*@* ] ,$active,1) != $null { 
      var %addr = $left($gettok(%IStr,1,32),-1)
      if $r.set(Colors,Speech) == On && $ctrlenter != $true { 
        var %saystr = [ [ $replace($gettok(%IStr,2-,32),$chr(15),$spclr) ] ] 
        var %saynk = $ialchan( [ $strip(%addr) $+ *!*@* ] ,$active,1).nick
        if (%saynk == $null && $left($1,-1) ison $active) { var %saynk = $gettok($address($left($1,-1),5),1,33) }
        say $resp2(%saynk) $spclr $+ $replace(%saystr,§¨©,$chr(36),§¨ª,$chr(37),~#~#~@~,$chr(35)) 
      } 
      else { 
        var %saystr = [ [ $gettok(%IStr,2-,32) ] ] 
        var %saynk = $ialchan( [ $remove($strip(%addr),$chr(40),$chr(41)) $+ *!*@* ] ,$active,1).nick
        if (%saynk == $null && $left($1,-1) ison $active) { var %saynk = $remove($gettok($address($left($1,-1),5),1,33),$chr(40),$chr(41)) }
        say $resp2(%saynk) $replace(%saystr,§¨©,$chr(36),§¨ª,$chr(37),~#~#~@~,$chr(35)) 
      } 
      if $r.set(SoundFX,hearOwn) == On { hearownsfx $1- }
      halt 
    }
  }
  if (($active == Status Window) && ($left($gettok(%IStr,1,32),1) != /)) { secho $c(1) $+ [ $+ $c(2) $+ $me $+ 's Note $+ $c(1) $+ ]4 $replace(%IStr,~#~#~@~,$chr(35)) | halt }
  if (($active == @Fserve.Chat) && ($left($gettok(%IStr,1,32),1) != /)) {
    if ($fserv(0) == 0) { aline -ph @Fserve.Chat $c(1) $+ [ $+ $c(2) $+ No User's Online $+ $c(1) $+ ] | halt }
    else {
      aline -ph @Fserve.Chat < $+ $me $+ > %IStr
      var %fserve-p = 0
      :start-fc
      inc %fserve-p 1
      if ($fserv(%fserve-p) == $null) { unset %fserve-p | halt }
      if (($fserv(%fserve-p).status == waiting) || ($fserv(%fserve-p).status == inactive)) { goto start-fc }
      else { msg = $+ $fserv(%fserve-p) [ $+ $me $+ ] $replace(%ISstr,§¨©,$chr(36),§¨ª,$chr(37),~#~#~@~,$chr(35)) | goto start-fc }
    }
  }
  if ($strip(%IStr,burc) == !list) && ($r.set(Invision,IsoAds) == On) { 
    set %isoadchan [ $+ [ $iNetwork ] ] $active 
    if ($window( [ @Serve_Ads_ [ $+ [ %isoadchan [ $+ [ $iNetwork ] ] ] ] ] ) != $null) { 
      window -c @Serve_Ads_ [ $+ [ %isoadchan [ $+ [ $iNetwork ] ] ] ] 
    } 
  }
  if ($gettok(%IStr,1,32) == /me) {
    var %saystr =  [ [ $right(%IStr,-3) ] ]
    me $replace(%saystr,§¨©,$chr(36),§¨ª,$chr(37),~#~#~@~,$chr(35))
    if ($r.set(SoundFX,hearOwn) == On) { hearownsfx $1- }
    halt
  }
  if $r.set(Colors,Speech) == On { 
    if ($left($active,1) != $chr(61)) && ($left($gettok(%IStr,1,32),1) != !) && ($left($gettok(%IStr,1,32),1) != @) && ($ctrlenter != $true) && ($left($gettok(%IStr,1,32),1) != /) {
      var %saystr =  [ [ $replace(%IStr,$chr(15),$spclr) ] ]
      say $spclr $+ $replace(%saystr,§¨©,$chr(36),§¨ª,$chr(37),~#~#~@~,$chr(35))
      if $r.set(SoundFX,hearOwn) == On { hearownsfx $1- }
      halt
    }
  }
  else { 
    if ($left($active,1) != $chr(61)) && ($left($gettok(%IStr,1,32),1) != !) && ($left($gettok(%IStr,1,32),1) != @) && ($ctrlenter != $true) && ($left($gettok(%IStr,1,32),1) != /) {
      var %saystr =  [ [ %IStr ] ]
      say $replace(%saystr,§¨©,$chr(36),§¨ª,$chr(37),~#~#~@~,$chr(35))
      if $r.set(SoundFX,hearOwn) == On { hearownsfx $1- }
      halt
    }
  }
  :leave
}
on ^*:action:*:#:{
  if ($level($fulladdress) == 5) { if ($me isop $chan || $me ishop $chan) { mode $chan -o+bb $nick $wildsite $mask($fulladdress,3) | kick $chan $nick $isset($gettok($ulist($fulladdress,5,1).info,3-,32),No Reason Specified) (Shitlisted) | aecho $nick $bracket($address) is going to be removed from $c(2) $+ $chan $+ $c(1) $+ . $bracket(Shitlisted) } }
  if ($istok($replace($rpunct($1-),$rpunct($me),$me),$me,32) == $true) && ($r.set(Nick.Alert,Status) == On) { if $away { NickAlert $c(1) $+ « $+ $c(2) $+ $nick $c(1) $+ in $+ $c(2) $chan $c(1) $+ at $+ $c(2) $time(h:nntt) $+ $c(1) $+ » $1- } }
  if ($istok($replace($rpunct($1-),$rpunct($me),$me),$me,32) == $true) && ($active != $chan) && ($r.set(Nick.Alert,Status) == On) { echo -a $c(1) $+ « $+ $c(2) $+ $nick $c(1) $+ in $+ $c(2) $chan $c(1) $+ at $+ $c(2) $cts $+ $c(1) $+ » $1- }
}
on ^*:action:*:?:{
  if ($level($address($nick,5)) == 5) { .msg $nick Congratulations! You just made my shitlist and will be ignored! $ilogo | close -m $nick | .ignore -pntiu60 $wildsite | aecho $nick $bracket($address) has been put on ignore. $bracket(Shitlisted) }
  else {
    flud Text $fulladdress
    if (($away == $true) && ($r.set(Away,Auto.Reply) == On) && ($nick != $me) && ($gnick($nick) == $true) && ($1 != XDCC) && (%idle. [ $+ [ $nick ] ] [ $+ [ $iNetwork ] ] == $null) && ($idle > 60)) { .msg $nick $c(2) $+ AFK, $away.reason Gone for $away.time now. $away.pager $ilogo | set %idle. [ $+ [ $nick ] ] [ $+ [ $iNetwork ] ] 1 | .timer 1 10 unset %idle. [ $+ [ $nick ] ] [ $+ [ $iNetwork ] ] }

  }
  if ($query($nick) != $null) { echo $colour(action) -t $nick * $nick $clradj($1-) }
  haltdef
}
on *:close:*:{
  if $r.set(Fserve,Status) == On && $r.set(Fserve,Logging) == On { FSlog Closed File Server Session to $address($nick,5) } 
  if ($fserv(0) == 0) && ($r.set(Fserve,Slot.Announce) == On) && ($r.set(Fserve,Pause) != On) && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve,Status) == On) && ($server != $null) && ($calc($queue(0) + pqueue(0)) < $r.set(Fserve,Max.Queues.Total)) && %slotannflag [ $+ [ $iNetwork ] ] != 1 { 
    .timer -o 1 300 unset %slotannflag [ $+ [ $iNetwork ] ]
    set %slotannflag [ $+ [ $iNetwork ] ] 1
    .timer 1 0 Fslotad 
  }
  if ($istok(@logviewer @XDCC @Fserve.Chat @Ports @Invision_Pager @IRCop,$target,32) == $true) { w.winpos $target }
}
on ^*:chat:*:{
  if (connection in isin $1-) { If ($r.set(Invision,FserveAI) == On) { msg =$nick queues } | else { aecho Your File Server Session with $nick is about to close. } }
  if (ACTION * iswm $1-) { echo $colour(action) -t = $+ $nick * $nick $clradj($gettok($gettok($1-,1-,1),2-,32)) }
  elseif ($1- != $null) { echo -t = $+ $nick $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) }
  haltdef
}
on ^*:notice:*:#:{
  if (text flood isin $1-) && ($r.set(Invision,blkfloodnotice) == On) { Halt }
  if ($level($address($nick,5)) == 5) { if ($me isop $chan) { mode $chan -o+bb $nick $wildsite $mask($fulladdress,3) | kick $chan $nick $isset($gettok($ulist($fulladdress,5,1).info,3-,32),No Reason Specified) (Shitlisted) | aecho $nick $bracket($address) is going to be removed from $c(2) $+ $chan $+ $c(1) $+ . $bracket(Shitlisted) } }
  if ($1 != $null) {
    set %reply [ $+ [ $iNetwork ] ] $nick
    if ($chan != $active) && (($active == Status Window) || ($me ison $active) || ($query($active) != $null)) { echo $colour(notice) -at * $+ $nick $+ ( $+ $target $+ )* $clradj($1-) }
    echo $colour(notice) -t $chan * $+ $nick $+ ( $+ $target $+ )* $clradj($1-) 

  }
  haltdef
}
on ^*:notice:*:?:{
  if (text flood isin $1-) && ($r.set(Invision,blkfloodnotice) == On) { Halt }
  if ($level($address($nick,5)) == 5) { .notice $nick Congratulations! You just made my shitlist and will be ignored! $ilogo | close -m $nick | .ignore -pntiu60 $wildsite | aecho $nick $bracket($address) has been put on ignore. $bracket(Shitlisted) }
  else {
    set %reply [ $+ [ $iNetwork ] ] $nick
    flud Notice $fulladdress
    if (($nick == NickServ) && (*/msg NickServ IDENTIFY* iswm $1-)) {
      if ($r.set(Auto.ID,Status) == On) {
        if (($me == $r.set(Auto.ID,Nick.1)) && ($r.set(Auto.ID,Pass.1) != $null)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.1) }
        elseif (($me == $r.set(Auto.ID,Nick.2)) && ($r.set(Auto.ID,Pass.2) != $null)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.2) }
        elseif (($me == $r.set(Auto.ID,Nick.3)) && ($r.set(Auto.ID,Pass.3) != $null)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.3) }
        elseif (($me == $r.set(Auto.ID,Nick.4)) && ($r.set(Auto.ID,Pass.4) != $null)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.4) }
        elseif (($me == $r.set(Auto.ID,Nick.5)) && ($r.set(Auto.ID,Pass.5) != $null)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.5) }
        ;elseif (($me ison $active) || ($query($active) != $null)) { editbox -ap / $+ %Nserv [ $+ [ $iNetwork ] ] IDENTIFY }
        ;else { editbox -sp / $+ %Nserv [ $+ [ $iNetwork ] ] IDENTIFY }
        echo -stlbfc notice * $+ $nick $+ * $1-
        halt
      }
    }
    if (($away == $true) && ($r.set(Away,Auto.Reply) == On) && ($nick != $me) && ($gnick($nick) == $true) && ($1 != XDCC) && (%idle. [ $+ [ $nick ] ] [ $+ [ $iNetwork ] ] == $null) && ($idle > 60)) { .notice $nick $c(2) $+ AFK,  $away.reason Gone for $away.time now. $away.pager $ilogo | set %idle. [ $+ [ $nick ] ] [ $+ [ $iNetwork ] ] 1 | .timer 1 10 unset %idle. [ $+ [ $nick ] ] [ $+ [ $iNetwork ] ] }
  }
  if ($chr(126) isin $nick) { return }
  if ($1 != $null) {
    if $level($fulladdress) <= 12 && $comchan($nick,0) < 1 { if $r.set(Invision,BlockNotice) == On && ($gnick($nick) == $true) { Halt } }
    if ($r.set(Invision,IsoAds) == On) && ((*serv*trig*send* iswm $strip($1-,burc)) || (File Server Online MOTD isin $strip($1-,burc)) || (*File Server Online*Trigger* iswm $strip($1-,burc)) || (*Fserve Active*Trigger* iswm $strip($1-,burc)) || (*trig*send*queue* iswm $strip($1-,burc)) || (*Message:*SysReset* iswm $strip($1-,burc)) || (*Note*Neko-Network* iswm $strip($1-,burc)) || (*List Trigger(s)*OmenServe* iswm $strip($1-,burc)) || (*For my list of*files* iswm $strip($1-,burc))) { 
      if $modeprefix { ;  ~!&@%+
        if $nick ison $iif(%isoadchan [ $+ [ $iNetwork ] ] != $null,%isoadchan [ $+ [ $iNetwork ] ] ,$chan(1)) { IsoAd $c(1) $+ < $+  $+ $modepre($chan,$nick) $+ $c(1) $+ > $1- }
        else { IsoAd $c(1) $+ < $+ $c(2) $+ $nick $+ $c(1) $+ >  $+ $1- }
      }
      else { IsoAd $c(1) $+ < $+ $c(2) $+ $nick $+ $c(1) $+ >  $+ $1- }      
      Halt 
    }
    if ($gnick($nick) == $true) { mflud notice }
    if ($hget(SpamSafe,$nick) != 1) && ($gnick($nick)) { 
      if $r.set(Invision,SpamFilter) == On { 
        var %list = $r.set(Invision,SpamList)
        var %num = $numtok(%list,44)
        var %ct = 1
        while (%ct <= %num) {
          if ($gettok(%list,%ct,44) isin $strip($1-,burc)) && (queue !isin $strip($1-,burc)) { .ignore -pntidu15 $nick | .notice $nick Your message was blocked due to 04spam detection. $ilogo | .notice $nick $c(2) $+ Further more... $c(1) $+ $read($shortfn($mircdir) $+ Text\mama.txt) | aecho Blocked Spam /notice from $c(2) $+ $nick | Halt }
          inc %ct 1
        }
      }
    }
    if ($r.set(Invision,Notice.Location) == 1) { echo $colour(notice) -st * $+ $nick $+ * $clradj($1-)  }
    if ($r.set(Invision,Notice.Location) == 2 || $active == $nick) { echo $colour(notice) -at * $+ $nick $+ * $clradj($1-)  }
    if (($r.set(Invision,Notice.Location) == 3 || $r.set(Invision,Notice.Location) == $null) && $comchan($nick,0) != 0) { incomwith $colour(notice) $nick * $+ $nick $+ * $clradj($1-)  }
    if (($r.set(Invision,Notice.Location) == 3 || $r.set(Invision,Notice.Location) == $null) && $comchan($nick,0) == 0 && $r.set(Invision,Notice.Server) == 0) { echo $colour(notice) -at * $+ $nick $+ * $clradj($1-) }
    if (($r.set(Invision,Notice.Location) == 3 || $r.set(Invision,Notice.Location) == $null) && $comchan($nick,0) == 0 && $r.set(Invision,Notice.Server) == 1 || $r.set(Invision,Notice.Server) == $null && $r.set(Invision,Notice.Location) != 1) { echo $colour(notice) -st * $+ $nick $+ * $clradj($1-) }
    if (Fserve isin $1-) { set %FxPopenFlag [ $+ [ $iNetwork ] ] 1 | .timerFSEA $+ $iNetwork -o 1 60 unset %FxPopenFlag [ $+ [ $iNetwork ] ] }
    ;    if ($nick !ison $active) && (($active == Status Window) || ($me ison $active) || ($query($active) != $null)) { echo $colour(notice) -at * $+ $nick $+ * $clradj($1-) }
    ;    if ($comchan($nick,1) == $null) && ($active != Status Window) { echo $colour(notice) -st * $+ $nick $+ * $clradj($1-) }
    if $r.set(Invision,NoticePrompt) == On && (DCC Chat !isin $1-) && (DCC Fserve !isin $1-) && (DCC Send !isin $1-) && (*serv*trig*send* !iswm $1-) { if $left($active,1) != @ { editbox -ap /notice $nick } }
  }
  haltdef
}
on *:close:!:{ unset %SessionLevel [ $+ [ $nick ] ] }
on *:open:!:{ 
  set %SessionLevel [ $+ [ $nick ] ] $level($address($nick,5))
  set %comchan.cnt 1
  if ($r.set(DCCmgr,SQlevel) >= 35) {
    while (%comchan.cnt <= 5) {
      set %comchan $r.set(Fserve. $+ %comchan.cnt,Channels)
      if (%comchan == all) {
        set %comchan2.cnt 1
        while (%comchan2.cnt <= $comchan($nick,0)) {
          set %comchan $comchan($nick,%comchan2.cnt)
          if (($nick ison %comchan) && ($nick isreg %comchan)) { goto nextchan2 }
          if (($nick ison %comchan) && ($nick isvo %comchan) && (%SessionLevel [ $+ [ $nick ] ] < 40)) { set %SessionLevel [ $+ [ $nick ] ] 40 }
          if (($nick ison %comchan) && ($nick ishop %comchan) && (%SessionLevel [ $+ [ $nick ] ] < 50)) { set %SessionLevel [ $+ [ $nick ] ] 50 }
          if (($nick ison %comchan) && ($nick isop %comchan) && (%SessionLevel [ $+ [ $nick ] ] < 60)) { set %SessionLevel [ $+ [ $nick ] ] 60 }
          if (($nick ison %comchan) && (%SessionLevel [ $+ [ $nick ] ] < 40)) { set %SessionLevel [ $+ [ $nick ] ] 60 }
          :nextchan2
          inc %comchan2.cnt
        }
        unset %comchan2.cnt
        goto skip
      }
      set %comchan3.cnt 1
      while (%comchan3.cnt <= $gettok($r.set(Fserve. $+ %comchan.cnt,Channels),0,44)) {
        set %comchan $gettok($r.set(Fserve. $+ %comchan.cnt,Channels),%comchan3.cnt,44)
        if (($nick ison %comchan) && ($nick isreg %comchan)) { goto nextchan }
        if (($nick ison %comchan) && ($nick isvo %comchan) && (%SessionLevel [ $+ [ $nick ] ] < 40)) { set %SessionLevel [ $+ [ $nick ] ] 40 }
        if (($nick ison %comchan) && ($nick ishop %comchan) && (%SessionLevel [ $+ [ $nick ] ] < 50)) { set %SessionLevel [ $+ [ $nick ] ] 50 }
        if (($nick ison %comchan) && ($nick isop %comchan) && (%SessionLevel [ $+ [ $nick ] ] < 60)) { set %SessionLevel [ $+ [ $nick ] ] 60 }
        if (($nick ison %comchan) && (%SessionLevel [ $+ [ $nick ] ] < 40)) { set %SessionLevel [ $+ [ $nick ] ] 60 }
        :nextchan
        inc %comchan3.cnt
      }
      unset %comchan3.cnt
      :skip
      inc %comchan.cnt
    }
  }
  if (%SessionLevel [ $+ [ $nick ] ] == 7) { close -f $nick | if $r.set(Fserve,Logging) == On { FSlog Refused File Server Session to $nick due to ban } | .notice $nick $c(1) $+You are banned from this File Server ( $+ $c(2) $+ $ulist($address($nick,3),*,1).info $+ $c(1) $+ ) }
  else {
    if ($r.set(Fserve,CloneGuard) == On) { if ($cloneQchk($nick) == $true) { notice $nick $c(2) $+ Invision CloneGuard $c(1) $+ has detected you have queues already under another nick. Queuing files with clones is prohibited. The Session was forced closed. $ilogo | .timer -o 1 0 FSclose $nick | .ignore -u120 $nick | Secho CloneGuard in action towards $nick | if $r.set(Fserve,Logging) == On { FSlog CloneGuard blocked the sending of $replace(%fn,$chr(63), $chr(32), $chr(34), $chr(44)) $bracket($size($file($replace(%fn,$chr(63), $chr(32), $chr(34), $chr(44))).size)) to $address($nick,5) } | Halt } }
    unset %queueflood [ $+ [ $nick ] ] %sendsflood [ $+ [ $nick ] ] %termsflood [ $+ [ $nick ] ] 
    if $r.set(Fserve,Logging) == On { FSlog Opened File Server Session to $address($nick,5) } 
    w.set Fserve Access $calc( [ $r.set(Fserve,Access) ] + 1)
    msg =$nick $c(1) $+ $ilogo $c(1) $+ $r.static(Script,Version) File Server with $r.static(Script,Features) $+ .
    msg =$nick -
    if ($r.set(Fserve,InstaSend.Status) == On) { msg =$nick $C(2) $+ Insta-Send $c(1) $+ is currently $c(2) $+ Enabled $+ $c(1) and set for files smaller then $c(2) $+ $size($r.set(Fserve,Insta.Send.Size)) $+ $c(1) $+ . } | else { msg =$nick $c(2) $+ Insta-Send $c(1) $+ is currently $c(2) $+ Disabled $+ $C(1) $+ . }
    if $r.glob(Fserve,SmartSend) == On { msg =$nick $c(2) $+ SmartSends $c(1) $+ is currently $+ $c(2) On }
    if $r.set(Fserve,SizeGuard) == On { msg =$nick $c(2) $+ SizeGuard $c(1) $+ is currently $+ $c(2) On }
    if $r.set(Fserve,AntiCamp) == On { msg =$nick $c(2) $+ Anti-Camp $c(1) $+ is currently $+ $c(2) On }
    if $r.set(Fserve,CloneGuard) == On { msg =$nick $c(2) $+ Cloneguard $c(1) $+ is currently $+ $c(2) On }
    if $r.set(DCC.Watch,Status) == On { msg =$nick $c(2) $+ DCC Watch $c(1) $+ is currently $+ $c(2) On }
    if $r.set(ReQueue,Status) == On { msg =$nick $c(2) $+ Auto Requeuing $c(1) $+ is currently $+ $c(2) On }
    if $r.set(DCCmgr,CloakNicks) == On { msg =$nick $c(2) $+ Nick Cloaking $c(1) $+ is currently $+ $c(2) On }
    if $chkFSctcp { msg =$nick $c(2) $+ CTCP Triggers $c(1) $+ are currently $+ $c(2) $iif($chkFSctcp == $true,Enabled,Disabled) }
    msg =$nick -
    msg =$nick $c(1) $+ You are visitor number: $c(2) $+ $r.set(Fserve,Access)
    msg =$nick -
    msg =$nick $c(1) $+ Accepted commands are: $c(2) $+ cd $+ $c(1) $+ , $c(2) $+ ls $+ $c(1) $+ , $c(2) $+ dir $+ $c(1) $+ , $c(2) $+ read $+ $c(1) $+ , $c(2) $+ get $+ $c(1) $+ , $c(2) $+ stats $+ $c(1) $+ , $c(2) $+ who $+ $c(1) $+ , $c(2) $+ sends $+ $c(1) $+ , $c(2) $+ queues $+ $c(1) $+ , $c(2) $+ clr_queues $+ $c(1) $+ , $c(2) $+ terms 
    msg =$nick $c(1) $+ For more info about these commands, type $c(2) $+ help $+ $c(1) $+ .
    msg =$nick $c(1) $+ ----------------------------------------------------------------------------------
    msg =$nick $c(2) $+ By Accepting this File Server Session you agree to any terms set by this servers administrator. 
    msg =$nick $c(1) $+ Type $c(2) $+ terms $c(1) $+ to see what if any exist.
    msg =$nick -
    msg =$nick $c(1) $+ ***********************  $c(2) $+ $iif($r.glob(Fserve,RecordsKeep) >= 2,Top $r.glob(Fserve,RecordsKeep)) Most Requested $c(1) $+ ***********************  
    var %tot = $iif($r.glob(Fserve,RecordsKeep) >= 1,$r.glob(Fserve,RecordsKeep),1)
    var %ct = 1
    while (%ct <= %tot) {
      msg =$nick $c(1) $chr(91) $+ $chr(35) $+ %ct $+ $chr(93) $c(2) $r.glob(Fserve,DirRecord.Name [ $+ [ %ct ] ] ) $iif($r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) != $null, $c(1) $chr(40) $+ $r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) $+ $chr(41))
      inc %ct 1
    }
    msg =$nick -
    if (dal.net isin $server) { 
      msg =$nick 04 #############################################
      msg =$nick 04           Make sure I am in your /dccallow list before you GET files! 
      msg =$nick 04 #############################################
      msg =$nick -
    }
    if $r.set(Flood,FserveStatus) == On {
      msg =$nick 04WARNING: Flood Protection is Activated. If you enter commands at an excessive rate, the session will be closed and you will be temporarily placed on ignore.
      msg =$nick -
    }
    msg =$nick $c(1) $+ $sv(Current Queue Status,$Queue(0) $+ / $+ $r.set(fserve,Max.Queues.Total)) $iif($r.set(DCCmgr,SecondQ) == On && %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel),$sv(Current Priority Queue Status,$Pqueue(0) $+ / $+ $r.set(Fserve,Max.Queues.Total))) $sv(Your Personal Queue Status,$iif($r.set(DCCmgr,SecondQ) == On && %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel),$Pqueue.nick($nick) $+ / $+ $r.set(Fserve,Max.Queues.Each),$Queue.nick($nick) $+ / $+ $r.set(Fserve,Max.Queues.Each)))
    msg =$nick -
    if $r.set(Fserve,AntiCamp) == On { .timerAC $+ $nick $+ $iNetwork -o 1 300 anticamp $nick TIMEOUT }
    var %addy = $replace($address($nick,3),$chr(61),$chr(58))
    if $r.leech(Leech,%addy) != $null {
      var %time = $gettok($r.leech(Leech,%addy),2,44)
      if $calc($ctime - %time) >= 86400 { d.leech Leech %addy }
    }
  }
}
on *:dns:{ 
  if %dnssearch [ $+ [ $iNetwork ] ] == 1 { 
    if $iaddress == %dnsstr [ $+ [ $iNetwork ] ] { .timerStopIPsrch $+ $iNetwork 1 30 unset %dnssearch [ $+ [ $iNetwork ] ] | .timerIPnf $+ $iNetwork 1 31 ipnotfound | ipsrch YES $nick $iaddress | return }
    else { .timerStopIPsrch $+ $iNetwork 1 30 unset %dnssearch [ $+ [ $iNetwork ] ] | .timerIPnf $+ $iNetwork 1 31 ipnotfound | ipsrch NO | return }
  }
  if %CatchDNS [ $+ [ $iNetwork ] ] != 1 {
    if (%usearch-ip [ $+ [ $iNetwork ] ] != $null) { 
      if ($naddress != $null) && ($chr(46) isin $naddress) { set -u20  %usearch-safety * [ $+ [ $iaddress ] ] | who * [ $+ [ $naddress ] ] } 
      elseif ($iaddress != $null) { who * [ $+ [ $iaddress ] ] } 
      else { aecho Sorry, $c(2) $+  $+ $nick $+  $c(1) $+ is an invalid address. | unset %usearch-* } 
    }
    elseif ($nick == $null) {
      if (($raddress == $null) && ($iaddress == $null)) { if %dnsCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { UserInfo Could not resolve for $c(2) $+ $naddress $+ $c(1) $+ . } | else { aecho Could not resolve for $c(2) $+ $naddress $+ $c(1) $+ . } }
      elseif (($raddress == $null) && ($naddress == $null)) { if %dnsCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { UserInfo Could not resolve for $c(2) $+ $iaddress $+ $c(1) $+ .  } | else { aecho Could not resolve for $c(2) $+ $iaddress $+ $c(1) $+ . } }
      elseif ($iaddress == $raddress) { if %dnsCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { UserInfo Resolved $+ $c(2) $naddress $c(1) $+ to $+ $c(2) $raddress $+ $c(1) $+ . } | else { aecho Resolved $+ $c(2) $naddress $c(1) $+ to $+ $c(2) $raddress $+ $c(1) $+ . } }
      elseif ($naddress == $raddress) { if %dnsCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { UserInfo Resolved $+ $c(2) $iaddress $c(1) $+ to $+ $c(2) $raddress $+ $c(1) $+ . } | else { aecho Resolved $+ $c(2) $iaddress $c(1) $+ to $+ $c(2) $raddress $+ $c(1) $+ . } }
      dec %dnsCT [ $+ [ $iNetwork ] ] 1 | if %dnsCT [ $+ [ $iNetwork ] ] < 1 { unset %dnsCT [ $+ [ $iNetwork ] ] }
    }
    else {
      if (($raddress == $null) && ($iaddress == $null) && ($naddress == $null)) { if %dnsCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { UserInfo Could not resolve for $c(2) $+ $nick $+ $c(1) $+ . } | else { aecho Could not resolve for $c(2) $+ $nick $+ $c(1) $+ . | goto leave } }
      elseif (($raddress == $null) && ($iaddress == $null)) { if %dnsCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { UserInfo Could not resolve for $c(2) $+ $nick $c(1) $+ ( $+ $c(2) $+ $naddress $+ $c(1) $+ ) $+ . } | else { aecho Could not resolve for $c(2) $+ $nick $c(1) $+ ( $+ $c(2) $+ $naddress $+ $c(1) $+ ) $+ . } }
      elseif (($raddress == $null) && ($naddress == $null)) { if %dnsCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { UserInfo Could not resolve for $c(2) $+ $nick $c(1) $+ ( $+ $c(2) $+ $iaddress $+ $c(1) $+ ) $+ . } | else { aecho Could not resolve for $c(2) $+ $nick $c(1) $+ ( $+ $c(2) $+ $iaddress $+ $c(1) $+ ) $+ . } }
      elseif ($iaddress == $raddress) { if %dnsCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { UserInfo Resolved $+ $c(2) $nick $c(1) $+ ( $+ $c(2) $+ $naddress $+ $c(1) $+ ) to $+ $c(2) $raddress $+ $c(1) $+ . } | else { aecho Resolved $+ $c(2) $nick $c(1) $+ ( $+ $c(2) $+ $naddress $+ $c(1) $+ ) to $+ $c(2) $raddress $+ $c(1) $+ . } }
      elseif ($naddress == $raddress) { if %dnsCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { UserInfo Resolved $+ $c(2) $nick $c(1) $+ ( $+ $c(2) $+ $iaddress $+ $c(1) $+ ) to $+ $c(2) $raddress $+ $c(1) $+ . } | else { aecho Resolved $+ $c(2) $nick $c(1) $+ ( $+ $c(2) $+ $iaddress $+ $c(1) $+ ) to $+ $c(2) $raddress $+ $c(1) $+ . } }
      dec %dnsCT [ $+ [ $iNetwork ] ] 1 | if %dnsCT [ $+ [ $iNetwork ] ] < 1 { unset %dnsCT [ $+ [ $iNetwork ] ] }
    }
  }
  else {
    Unset %CatchDNS [ $+ [ $iNetwork ] ]
    if $nick != $null && $iaddress != $null {
      if %telnetnick [ $+ [ $iNetwork ] ] == $nick { unset %telnetnick [ $+ [ $iNetwork ] ] | telnet $iaddress %CurTelnetPort }
      elseif %DCCdirectNick [ $+ [ $iNetwork ] ] == $nick { unset %DCCdirectNick [ $+ [ $iNetwork ] ] | .timer -o 1 1 .dcc send -l $iaddress $+ : $+ $r.glob(DCCmgr,ReversePort) %DCCdirectFile [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] | unset %DCCdirectFile [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] }
    }
  }
  :leave
}
;on ^*:usermode:{ aecho $me sets mode: $c(2) $+ $1- $bracket($usermode) | tbar | haltdef }
on ^*:rawmode:#:{ 
  if $mevents(modes) == 0 {
    echo $colour(mode) -t $chan $nick sets mode: $1- 
  }
  if $mevents(modes) == 1 {
    echo $colour(mode) -st $nick sets mode in $chan $+ : $1- 
  }
  haltdef 
}
on ^*:nick:{
  if %mfludnick [ $+ [ $chan ] ] == 1 { Halt }
  if %SessionLevel [ $+ [ $nick ] ] != $null { set %SessionLevel [ $+ [ $newnick ] ] %SessionLevel [ $+ [ $nick ] ] | unset %SessionLevel [ $+ [ $nick ] ] }
  mflud nick
  if ($chr(126) isin $nick) { return }
  if $r.set(Invision,Seen) == On && (($level($address($nick,5)) >= 15) || ($r.set(Invision,SeenTrack) == All)) { 
    wseen $remove($nick,$chr(123),$chr(125),$chr(94),$chr(91),$chr(93)) NICK $adate $ctime $nick $newnick
  }
  if ($isnum($queue.nick($nick)) == $true) { qnu $nick $newnick | Pqnu $nick $newnick }
  if $mevents(nicks) == 0 {
    incomwith $colour(nick) $newnick $nick ( $+ $address $+ ) is now known as $newnick
  }
  if ($nick == $me) { echo $colour(nick) -st Your nick is now $newnick | tbar }
  haltdef
}
on ^*:topic:#:{ 
  if ($me ison $chan) { 
    if $r.set(Invision,SndOpt27) == On { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound29) } 
    if $mevents(topic) == 0 {
      echo -t $chan $c(1) $+ $nick changes topic to ' $+ $clradj($1-) $+  $+ $c(1) $+ ' 
    }
    if $mevents(topic) == 1 {
      echo -st $c(1) $+ $nick changes topic for $chan to ' $+ $clradj($1-) $+  $+ $c(1) $+ ' 
    }
  } 
  haltdef 
}
on ^*:wallops:*:{ aecho  $+ $colour(wallops) ! $+ $nick ( $+ $address $+ ) $+ ! $1- | haltdef }
on *:ban:#:if ($chr(126) isin $chan) { return } |  if ($r.set(Invision,SndOpt11) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound11) }
on *:unban:#:if ($chr(126) isin $chan) { return } | if ($r.set(Invision,SndOpt12) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound12) }
on *:devoice:#:{
  if $r.set(Customs,DeVo) == On && $vnick == $me && $nick != $me && %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] != 1 { 
    .timer -o 1 20 unset %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ]
    set %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 1
    msg $chan [ [ $r.set(Customs,DeVoMsg) ] ]
  }
  If ($vnick == $me) { 
    if ($r.set(Invision,SndOpt8) == On) { 
      SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound8) 
    }
  }
}
on *:voice:#:{
  if $r.set(Customs,Vo) == On && $vnick == $me && $nick != $me && %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] != 1 { 
    .timer -o 1 20 unset %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ]
    set %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 1
    msg $chan [ [ $r.set(Customs,VoMsg) ] ] 
  }
  If ($vnick == $me) {
    if ($r.set(Invision,SndOpt7) == On) { 
      SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound7) 
    } 
  }
}
on *:Op:#:{
  if $r.set(Customs,Op) == On && $opnick == $me && $nick != $me && %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] != 1 { 
    .timer -o 1 20 unset %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ]
    set %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 1
    msg $chan [ [ $r.set(Customs,OpMsg) ] ] 
  }
  If ($opnick == $me) { 
    if ($r.set(Invision,SndOpt5) == On) { 
      SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound5) 
    } 
  }
}
on *:deOP:#:{
  if $r.set(Customs,DeOp) == On && $opnick == $me && $nick != $me && %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] != 1 { 
    .timer -o 1 20 unset %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ]
    set %thanksflag [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 1
    msg $chan [ [ $r.set(Customs,DeOpMsg) ] ] 
  }
  If ($opnick == $me) { 
    if ($r.set(Invision,SndOpt6) == On) {
      SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound6) 
    }
  }
}
on *:DCCSERVER:Fserve: if ($r.set(Invision,SndOpt24) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound22) }
on ^*:invite:#:{
  mflud invite
  if ($chr(126) isin $chan) { return }
  if ($r.set(Invision,SndOpt14) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound14) }
  if ($level($address($nick,3)) == 5) { .notice $nick Congratulations! You just made my shitlist and will be ignored! $ilogo | close -m $nick | .ignore -pntiu60 $wildsite | aecho $nick $bracket($address) has been put on ignore. $bracket(Shitlisted) }
  else {
    flud Invite $fulladdress
    if (($away == $true) && ($r.set(Away,Auto.Reply) == On) && ($nick != $me) && ($gnick($nick) == $true) && ($1 != XDCC) && (%idle. [ $+ [ $nick ] ] == $null) && ($idle > 60)) { .notice $nick $c(2) $+ AFK,  $away.reason Gone for $away.time now.  $away.pager $ilogo | set %idle. [ $+ [ $nick ] ] 1 | .timer 1 10 unset %idle. [ $+ [ $nick ] ] }
  }
  if ($active == Status Window) || ($me ison $active) || ($query($active) != $null) { echo $colour(invite) -at $nick ( $+ $address $+ ) invites you to join $chan }
  if ($active != Status Window) { echo $colour(invite) -st $nick ( $+ $address $+ ) invites you to join $chan }
  haltdef
}
on ^*:OPEN:?:*:{ 
  if ($gnick($nick)) {
    if ($comchan($nick,0) == 0) && ($r.set(Invision,BlockMSG) == On) &&  ($level($fulladdress) <= 14) { .msg $nick $c(1) $+ Messages from outside the channel are Auto-Rejected. $ilogo | close -m $nick | halt }
    if ($level($fulladdress) <= 14) && ($r.set(Invision,BlockMSG2) == On) { .msg $nick $c(1) $+ Messages from strangers are Auto-Rejected. $ilogo | close -m $nick | halt }
    if ($hget(SpamSafe,$nick) != 1) && ($gnick($nick)) { 
      if $r.set(Invision,SpamFilter) == On { 
        var %list = $r.set(Invision,SpamList)
        var %num = $numtok(%list,44)
        var %ct = 1
        while (%ct <= %num) {
          if ($gettok(%list,%ct,44) isin $strip($1-,burc)) && (queue !isin $strip($1-,burc)) { close -m $nick | .ignore -pntidu15 $nick | .msg $nick Your message was blocked due to 04spam detection. $ilogo | .msg $nick $c(2) $+ Further more... $c(1) $+ $read($shortfn($mircdir) $+ Text\mama.txt) | aecho Blocked Spam /msg from $c(2) $+ $nick | Halt }
          inc %ct 1
        }
      }
    }
  }
  if ($left($1,1) != ! && ($1 != XDCC && !$istok(Send Remove List Help,$2,32))) {
    if $r.set(Invision,SndOpt13) == On { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound13) }
  }
  if ($r.set(Invision,msgHistory) == On) { .timer 1 0 msghistory $nick $msghistorysafe($1-) }
}
alias msghistorysafe { bset -t &a 1 $1 | return $!regsubex(safe, $bvar(&a,1-) ,/(\d+)(?: |$)/g,$chr(\1)) }
on *:socklisten:BOT-*:{
  sockaccept BOT+ [ $+ [ $right($sockname,-4) ] ]
  if $r.glob(Invision,BotKeepTime) != $null { .timer -o 1 $calc($r.glob(Invision,BotKeepTime) * 60) sockclose BOT+ [ $+ [ $right($sockname,-4) ] ] }
  set %BOTdccs $addtok(%BOTdccs,$right($sockname,-4),44)
  .timer 1 0 sockclose $sockname
}
on *:SockRead:BOT+*:{
  if ($sockerr > 0) return
  :nextread
  sockread %temp
  if ($sockbr == 0) return
  if (%temp == $null) %temp = -
  if %temp == [ 100 [ $+ [ $right($sockname,-4) ] ] ]  { sockwrite -tn $sockname 101 $me }
  if (Enter your password. == %temp) { sockwrite -tn $sockname $upwget($address($right($sockname,-4),5)) | .timer -o 1 2 botsendcmd $right($sockname,-4) | .timer -o 1 3600 BotDelink $right($sockname,-4) }
  goto nextread
}
on *:Sockclose:BOT+*:{
  set %BOTdccs $remtok(%botdccs,$right($sockname,-4),1,44)
}
on ^*:serv:*:{
  flud Fserve $address($nick,5)
  if (($1 == Who) && ($2 == $null)) {
    echo -t = $+ $nick $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
    if ($fserv(2) == $null) { msg =$nick $c(1) $+ There is no one else currently on this File Server. }
    else {
      if ($fserv(0) == 2) { msg =$nick $c(1) $+ There is 1 other user online. }
      if ($fserv(0) >= 3) { msg =$nick $c(1) $+ There is $calc($fserv(0) - 1) other users currently online. }
      set %srvwho [ $+ [ $iNetwork ] ] 1        
      while (%srvwho [ $+ [ $iNetwork ] ] <= $fserv(0)) {
        set %srvdir [ $+ [ $iNetwork ] ] $remove($remove($remove($remove($remove($fserv(%srvwho [ $+ [ $iNetwork ] ] ).cd,$left($r.set(Fserve.1,Root.Dir),-1)),$left($r.set(Fserve.2,Root.Dir),-1)),$left($r.set(Fserve.3,Root.Dir),-1)),$left($r.set(Fserve.4,Root.Dir),-1)),$left($r.set(Fserve.5,Root.Dir),-1))
        if %srvdir [ $+ [ $iNetwork ] ] == $null { set %srvdir [ $+ [ $iNetwork ] ] \ }
        if $fserv(%srvwho [ $+ [ $iNetwork ] ] ) != $nick { msg =$nick $c(1) $+ User:  $c(2) $+ $fserv(%srvwho [ $+ [ $iNetwork ] ] ) $iif((($r.set(DCCmgr,SecondQ) == On) && (%SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel))),*) $c(1) $+ is $c(2) $+ $fserv(%srvwho [ $+ [ $iNetwork ] ] ).status $c(1) $+ in $c(2) $+ %srvdir [ $+ [ $iNetwork ] ] }
        inc %srvwho [ $+ [ $iNetwork ] ] 1
      }
    }
    halt
  }
  elseif (($1 == Stats) && ($2 == $null)) {
    echo -t = $+ $nick $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
    if $r.set(Fserve,Logging) == On { FSlog Displayed the Stats to $address($nick,5) }
    msg =$nick $bracket(File Server Stats)
    msg =$nick $c(1) $+ $sv(Logins,$vnum($r.set(Fserve,Access),0))
    msg =$nick $c(1) $+ $sv(Files Sent,$vnum($r.set(Fserve,Send.Total),0))
    msg =$nick $c(1) $+ $sv(Bytes Sent,$size($vnum($r.set(Fserve,Send.Bytes),0)))
    msg =$nick $c(1) $+ $sv(Send Fails,$vnum($r.set(Fserve,Send.Fails),0))
    msg =$nick $c(1) $+ $sv(Record CPS, [ [ $ratefix($vnum($gettok($r.set(Fserve,Record.CPS),1,32),0)) by $isset($gettok($r.set(Fserve,Record.CPS),2-,32)) ] ] )
    msg =$nick -
    msg =$nick $c(1) $+ ***********************  $c(2) $+ $iif($r.glob(Fserve,RecordsKeep) >= 2,Top $r.glob(Fserve,RecordsKeep)) Most Requested $c(1) $+ ***********************  
    var %tot = $iif($r.glob(Fserve,RecordsKeep) >= 1,$r.glob(Fserve,RecordsKeep),1)
    var %ct = 1
    while (%ct <= %tot) {
      msg =$nick $c(1) $chr(91) $+ $chr(35) $+ %ct $+ $chr(93) $c(2) $r.glob(Fserve,DirRecord.Name [ $+ [ %ct ] ] ) $iif($r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) != $null, $c(1) $chr(40) $+ $r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) $+ $chr(41))
      inc %ct 1
    }
    halt
  }
  elseif (($1 == Terms) && ($2 == $null)) {
    if %termsflood [ $+ [ $nick ] ] == 1 { halt }
    .timer -o 1 30 unset %termsflood [ $+ [ $nick ] ]
    set %termsflood [ $+ [ $nick ] ] 1
    echo -t = $+ $nick $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
    if $r.set(Fserve,Logging) == On { FSlog Displayed the Terms to $address($nick,5) } 
    if $r.set(Fserve,Terms.File) != $null && $r.set(Fserve,Terms.File) != None {
      .play =$nick $r.set(Fserve,Terms.File) 100
    }
    else {
      msg =$nick $c(1) $+ There are no terms currently set for this File Server.
    }
    halt
  }
  elseif (($1 == Sends) && ($2 == $null)) {
    if %sendsflood [ $+ [ $nick ] ] == 1 { halt }
    .timer -o 1 15 unset %sendsflood [ $+ [ $nick ] ]
    set %sendsflood [ $+ [ $nick ] ] 1
    echo -t = $+ $nick $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
    if ($isend(0) == 0) { msg =$nick $c(1) $+ $iif($antiget,$confusion(No sends currently in progress.),No sends currently in progress.) }
    else {
      if ($isend(0) == 1) { msg =$nick $c(1) $+ $iif($antiget,$confusion(Currently there is 1 send in progress.),Currently there is 1 send in progress.) }
      elseif ($isend(0) > 1) { msg =$nick $c(1) $+ $iif($antiget,$confusion(Currently there are $isend(0) sends in progress.),Currently there are $isend(0) sends in progress.) }
      var %fserve-s = 0
      var %agsend = $iif($antiget,$confusion(Send),Send)
      var %aghas = $iif($antiget,$confusion(has),has)
      var %agof = $iif($antiget,$confusion(of),of)
      :sendstart
      inc %fserve-s 1
      if ($isend(%fserve-s) == $null) { unset %fserve-s }
      else { msg =$nick $c(1) $+ %agSend $chr(35) $+ %fserve-s $+ : $c(2) $+ $iif(($r.set(DCCmgr,CLoakNicks) != On || $nick == $isend(%fserve-s)), $isend(%fserve-s), Cloaked User) $c(1) $+ %aghas $c(2) $+ $isend(%fserve-s).pc $+ % $c(1) $+ %agof $+ $c(2) $isend(%fserve-s).file $+ $c(1) $+ ( $+ $size($isend(%fserve-s).size) $+ ) at $+ $c(2) $size($isend(%fserve-s).cps) $+ /s $+ $c(1) $+ . $bracket( [ About $duration($round($calc(($isend(%fserve-s).size - $isend(%fserve-s).sent) / $isend(%fserve-s).cps),0),2) left ] ) | goto sendstart }
    }
    halt
  }
  elseif (($1 == Queues) && ($2 == $null)) {
    if %queueflood [ $+ [ $nick ] ] == 1 { halt }
    .timer -o 1 15 unset %queueflood [ $+ [ $nick ] ]
    set %queueflood [ $+ [ $nick ] ] 1
    echo -t = $+ $nick $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
    if $r.set(DCCmgr,SecondQ) == On {
      if %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel) { 
        if ($Pqueue(0) == 0) { msg =$nick $c(1) $+ All Priority queues are available. $iif($queue(0) >= 1,There are however $queue(0) regular queues waiting.) }
        else {
          if ($Pqueue(0) == 1) { msg =$nick $c(1) $+ Only one queue is in use. }
          elseif ($Pqueue(0) > 1) { msg =$nick $c(1) $+ There are $Pqueue(0) queues waiting. }
          var %fserve-q = 0
          :queuestart
          inc %fserve-q 1
          if ($Pqueue(%fserve-q) == $null) { unset %fserve-q }
          else { msg =$nick $c(2) $+ Queue $chr(35) $+ %fserve-q $c(1) $+ for $c(2) $+ $iif(($r.set(DCCmgr,CloakNicks) != On || $nick == $gettok($Pqueue(%fserve-q),2,32)), $gettok($Pqueue(%fserve-q),2,32), Cloaked User) $+ $c(1) is queued for file $c(2) $+ $nopath($gettok($Pqueue(%fserve-q),5-,32)) $bracket($size($lof($gettok($Pqueue(%fserve-q),5-,32)))) using the $c(2) $+ $gettok($Pqueue(%fserve-q),1,32) $+ $c(1) $+ . | goto queuestart }
        }
      }
      else {
        if ($queue(0) == 0) { msg =$nick $c(1) $+ $iif($antiget,$confusion(All queues are available.),All queues are available.) }
        else {
          if ($queue(0) == 1) { msg =$nick $c(1) $+ $iif($antiget,$confusion(Only one queue is in use.),Only one queue is in use.) }
          elseif ($queue(0) > 1) { msg =$nick $c(1) $+ $iif($antiget,$confusion(There are $queue(0) queues waiting.),There are $queue(0) queues waiting.) }
          var %fserve-q = 0
          var %agQueue = $iif($antiget,$confusion(Queue),Queue)
          var %agfor = $iif($antiget,$confusion(for),for)
          var %queuedfor = $iif($antiget,$confusion(is queued for file), is queued for file)
          var %queuespacer = $iif($antiget,$str(  $+ $chr(32),$rand(1,2)),$chr(32))
          :queuestart
          inc %fserve-q 1
          if ($queue(%fserve-q) == $null) { unset %fserve-q }
          else { msg =$nick $c(2) $+ %agQueue $chr(35) $+ %fserve-q $C(1) $+ %agfor $c(2) $+ %queuespacer $+ $iif(($r.set(DCCmgr,CloakNicks) != On || $nick == $gettok($queue(%fserve-q),2,32)), $gettok($queue(%fserve-q),2,32), Cloaked User) $+ $c(1) %queuedfor $c(2) $+ $nopath($gettok($queue(%fserve-q),5-,32)) $bracket($size($lof($gettok($queue(%fserve-q),5-,32)))) using the $c(2) $+ $gettok($queue(%fserve-q),1,32) $+ $c(1) $+ . | goto queuestart }
        }
      }
    }
    else {
      if ($queue(0) == 0) { msg =$nick $c(1) $+ $iif($antiget,$confusion(All queues are available.),All queues are available.) }
      else {
        if ($queue(0) == 1) { msg =$nick $c(1) $+ $iif($antiget,$confusion(Only one queue is in use.),Only one queue is in use.) }
        elseif ($queue(0) > 1) { msg =$nick $c(1) $+ $iif($antiget,$confusion(There are $queue(0) queues waiting.),There are $queue(0) queues waiting.) }
        var %fserve-q = 0
        var %agQueue = $iif($antiget,$confusion(Queue),Queue)
        var %agfor = $iif($antiget,$confusion(for),for)
        var %queuedfor = $iif($antiget,$confusion(is queued for file), is queued for file)
        var %queuespacer = $iif($antiget,$str(  $+ $chr(32),$rand(1,2)),$chr(32))
        :queuestart
        inc %fserve-q 1
        if ($queue(%fserve-q) == $null) { unset %fserve-q }
        else { msg =$nick $c(2) $+ %agQueue $chr(35) $+ %fserve-q $C(1) $+ %agfor $c(2) $+ %queuespacer $+ $iif(($r.set(DCCmgr,CloakNicks) != On || $nick == $gettok($queue(%fserve-q),2,32)), $gettok($queue(%fserve-q),2,32), Cloaked User) $+ $c(1) %queuedfor $c(2) $+ $nopath($gettok($queue(%fserve-q),5-,32)) $bracket($size($lof($gettok($queue(%fserve-q),5-,32)))) using the $c(2) $+ $gettok($queue(%fserve-q),1,32) $+ $c(1) $+ . | goto queuestart }
      }
    }
    halt
  }
  elseif (($1 == Clr_queues) && ($2 == $null)) {
    if %queueflood [ $+ [ $nick ] ] == 1 { halt }
    .timer -o 1 15 unset %queueflood [ $+ [ $nick ] ]
    set %queueflood [ $+ [ $nick ] ] 1
    echo -t = $+ $nick $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
    if $r.set(DCCmgr,SecondQ) == On {
      if %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel) {
        if ($Pqueue.nick($nick) == 0) { msg =$nick $c(1) $+ You have no queues waiting. }
        else {
          var %fserve-cq = 0
          :clr_queue-start-1
          inc %fserve-cq 1
          :clr_queue-start-2
          if ($Pqueue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
          elseif ($gettok($Pqueue(%fserve-cq),2,32) == $nick) { msg =$nick $c(1) $+ Removing $c(2) $+ $nopath($gettok($Pqueue(%fserve-cq),5-,32)) $bracket($size($lof($gettok($Pqueue(%fserve-cq),5-,32)))) from your queue. | Pqueue.del %fserve-cq | goto clr_queue-start-2 }
          else { goto clr_queue-start-1 }
          if $r.set(Fserve,Logging) == On { FSlog $address($nick,5) deleted there queues. }
        }
      }
      else {
        if ($queue.nick($nick) == 0) { msg =$nick $c(1) $+ You have no queues waiting. }
        else {
          var %fserve-cq = 0
          :clr_queue-start-1
          inc %fserve-cq 1
          :clr_queue-start-2
          if ($queue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
          elseif ($gettok($queue(%fserve-cq),2,32) == $nick) { msg =$nick $c(1) $+ Removing $c(2) $+ $nopath($gettok($queue(%fserve-cq),5-,32)) $bracket($size($lof($gettok($queue(%fserve-cq),5-,32)))) from your queue. | queue.del %fserve-cq | goto clr_queue-start-2 }
          else { goto clr_queue-start-1 }
          if $r.set(Fserve,Logging) == On { FSlog $address($nick,5) deleted there queues. }
        }
      }
    }
    else {
      if ($queue.nick($nick) == 0) { msg =$nick $c(1) $+ You have no queues waiting. }
      else {
        var %fserve-cq = 0
        :clr_queue-start-1
        inc %fserve-cq 1
        :clr_queue-start-2
        if ($queue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
        elseif ($gettok($queue(%fserve-cq),2,32) == $nick) { msg =$nick $c(1) $+ Removing $c(2) $+ $nopath($gettok($queue(%fserve-cq),5-,32)) $bracket($size($lof($gettok($queue(%fserve-cq),5-,32)))) from your queue. | queue.del %fserve-cq | goto clr_queue-start-2 }
        else { goto clr_queue-start-1 }
        if $r.set(Fserve,Logging) == On { FSlog $address($nick,5) deleted there queues. }
      }
    }
    halt
  }
  elseif (($1 == Help) && ($2 == $null)) {
    echo -t = $+ $nick $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
    msg =$nick $bracket(File Server Help Menu)
    msg =$nick $c(1) $+ (Change your current directory: $c(2) cd <directory> $+ $c(1) $+ )
    msg =$nick $c(1) $+ (Go "back" a directory: $c(2) cd .. $+ $c(1) $+ )
    msg =$nick $c(1) $+ (List all the files in current directory: $c(2) dir $+ $c(1) $+ )
    msg =$nick $c(1) $+ (List all the files in current directory [wide]: $c(2) ls $+ $c(1) $+ )
    msg =$nick $c(1) $+ (Get a file from the file server: $c(2) get <filename> $+ $c(1) $+ )
    msg =$nick $c(1) $+ (Read a file from file server: $c(2) read <filename> $+ $c(1) $+ )
    msg =$nick $c(1) $+ (Show file server statistics: $c(2) stats $+ $c(1) $+ )
    msg =$nick $c(1) $+ (Show a list of who is connected: $c(2) who $+ $c(1) $+ )
    msg =$nick $c(1) $+ (Show a list of current sends: $c(2) sends $+ $c(1) $+ )
    msg =$nick $c(1) $+ (Show a list of waiting queues: $c(2) queues $+ $c(1) $+ )
    msg =$nick $c(1) $+ (Remove all of your queues from server: $c(2) clr_queues $+ $c(1) $+ )
    msg =$nick $c(1) $+ (Show the terms you accept for using this file server: $c(2) terms $+ $c(1) $+ )
    if $r.set(Fserve,Logging) == On { FSlog Displayed the Help to $address($nick,5) }
    halt
  }
  elseif ($1 == GET) { 
    echo -t = $+ $nick $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
    if ($2 == $null) { msg =$nick $c(1) $+ Syntax: get <filename> | Halt }
    if (\ isin $2-) || (/ isin $2-) { msg =$nick $c(2) $+ ERROR: $c(1) $+ Illegal Directory. | Halt }
    var %fpath = $fserv($nick).cd $+ \ $+ $2- 
    var %fn = $replace(%fpath ,$chr(32),$chr(63),$chr(44),$chr(34))
    if $isfile($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))) == $false { msg =$nick $c(2) $+ ERROR: $c(1) $+ That is not a valid File. | Halt }
    if $r.set(Fserve,DCClimit) == On {
      if $r.set(Fserve,Limit) != $null && $r.set(Fserve,Limit) != 0 {
        var %addy = $replace($address($nick,3),$chr(61),$chr(58))
        var %bytes = $gettok($r.leech(Leech,%addy),1,44)
        if $r.leech(Leech,%addy) != $null {
          if %bytes >= $r.set(Fserve,Limit) {
            msg =$nick $c(2) $+ Invision has detected you have already reached the maxium download amount allowed per day. Please try back in a few hours. This Session will force close in 10 seconds. $ilogo 
            .timer -o 1 10 FSclose $nick 
            if $r.set(Fserve,Logging) == On { .timer -o 1 0 FSlog DCC Daily Limit  blocked the sending of $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) to $address($nick,5) } 
            .timer -o 1 0 DCCStatwin DCC Daily Limit  blocked the sending of $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) to $address($nick,5)
            if $r.set(Fserve,Alterwin) == On { DCCWinAdd $c(1) $+ DCC Daily Limit  blocked the sending of $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) to $address($nick,5) }
            Halt 
          }
        }
      }
    }
    if ($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size <= $r.set(Fserve,Insta.Send.Size) && ($r.set(Fserve,InstaSend.Status) == On) && ($send.nick($nick) < $r.set(Fserve,Max.Sends.Each)))  { secho 8Invision Insta-Send in action for files less then $size($r.set(Fserve,Insta.Send.Size)) | if $r.set(Fserve,Logging) == On { .timer 1 0 FSlog Insta-Send sent $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) to $address($nick,5) } | .timer 1 0 idcc send $nick " $+ $replace(%fn,$chr(63), $chr(32), $chr(34), $chr(44)) $+ " | .timer 1 0 msg =$nick $c(1) $+ InstaSending™ $+ $c(2) $nopath($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) $+ . | .timer 1 0 DirRecord $nick $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) | halt } 
    if $file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size > $r.set(Fserve,sg.size) && $r.set(Fserve,SizeGuard) == On  { secho 8Invision Size Guard in action for files larger then $size($r.set(Fserve,sg.size)) | if $r.set(Fserve,Logging) == On { FSlog SizeGuard blocked the sending of $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) to $address($nick,5) } | msg =$nick $c(2) $+ Files larger then $size($r.set(Fserve,sg.size)) may not be downloaded. $ilogo | halt } 
    if $calc($queue.nick($nick) + $Pqueue.nick($nick)) >= $r.set(Fserve,Max.Queues.Each) { .timer 1 0 msg =$nick $c(1) $+ Invision $iif($antiget,$confusion(has determined you have used all your queue slots.),has determined you have used all your queue slots.) | if ($r.set(Fserve,AntiCamp) == On) { .timer 1 0 anticamp $nick } | Halt }
    ; ******************* Smart Send On *****************
    if ($r.glob(Fserve,SmartSend) == On) {
      if ($SSend.chk(1)) && ($send.nick($nick) < $r.set(Fserve,Max.Sends.Each)) && (%NOSSend [ $+ [ $iNetwork ] ] != 1) { 
        unset %nossend [ $+ [ $iNetwork ] ]
        .timer -o 1 0 idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $nick " $+ $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $+ " 
        .timer 1 0 msg =$nick $c(1) $+ SmartSendSending $+ $c(2) $nopath($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) $+ . 
        .timer 1 0 DirRecord $nick $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))
        Halt
      }
      else { 
        if ($r.set(DCCmgr,SecondQ) == On) {
          if (%SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel)) { 
            if ($PQueue(0) < $r.set(Fserve,Max.Queues.Total)) {
              Pqueue.add Fserve $nick $iif($address($nick,5) != $null,$address($nick,5),$fserv($nick).ip) $ctime $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 

            }
            else {
              msg =$nick $c(1) $+ Sorry but the Maximum Allowed Queues of $r.set(Fserve,Max.Queues.Total) has been reached. Please try again later.
              halt
            }
          }
          else { 
            if ($Queue(0) < $r.set(Fserve,Max.Queues.Total)) {
              queue.add Fserve $nick $iif($address($nick,5) != $null,$address($nick,5),$fserv($nick).ip) $ctime $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 
            }
            else {
              msg =$nick $c(1) $+ $iif($antiget,$confusion(Sorry but the Maximum Allowed Queues of),Sorry but the Maximum Allowed Queues of) $r.set(Fserve,Max.Queues.Total) $iif($antiget,$confusion(has been reached. Please try again later.),has been reached. Please try again later.)
              halt
            }
          }
        }
        else { 
          if ($Queue(0) < $r.set(Fserve,Max.Queues.Total)) {
            queue.add Fserve $nick $iif($address($nick,5) != $null,$address($nick,5),$fserv($nick).ip) $ctime $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 
          }
          else {
            msg =$nick $c(1) $+ $iif($antiget,$confusion(Sorry but the Maximum Allowed Queues of),Sorry but the Maximum Allowed Queues of) $r.set(Fserve,Max.Queues.Total) $iif($antiget,$confusion(has been reached. Please try again later.),has been reached. Please try again later.)
            halt
          }
        }
        if ($result isnum) { .timer 1 0 msg =$nick $c(1) $+ $iif($antiget,$confusion(That queue already exists in queue slot),That queue already exists in queue slot) $chr(35) $+ $result $+ , $iif($antiget,$confusion(try another file.),try another file.) | Halt }
        .timer 1 0 msg =$nick $iif($antiget,$confusion(The file has been queued in slot),The file has been queued in slot) $iif((%SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel) && ($r.set(DCCmgr,SecondQ) == On)),$Pqueue(0),$queue(0))
        if ($r.set(Fserve,Logging) == On) { FSlog Queued $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) for $address($nick,5) in slot $chr(35) $+ $queue(0) } 
        .timer -o 1 0 DirRecord $nick $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 
        Halt 
      }
    }
    ; ******************* Smart Send Off *****************
    else {
      if ($isend(0) < $r.set(Fserve,Max.Sends.Total) && $send.nick($nick) < $r.set(Fserve,Max.Sends.Each)) && (%NOSSend [ $+ [ $iNetwork ] ] != 1) && $Queue(0) == 0 { 
        unset %nossend [ $+ [ $iNetwork ] ]
        .timer -o 1 0 idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $nick " $+ $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $+ " 
        .timer 1 0 msg =$nick $c(1) $+ Sending $+ $c(2) $nopath($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) $+ . 
        .timer 1 0 DirRecord $nick $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))
        Halt
      }
      else { 
        if ($r.set(DCCmgr,SecondQ) == On) {
          if (%SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel)) { 
            if ($PQueue(0) < $r.set(Fserve,Max.Queues.Total)) {
              Pqueue.add Fserve $nick $iif($address($nick,5) != $null,$address($nick,5),$fserv($nick).ip) $ctime $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 

            }
            else {
              msg =$nick $c(1) $+ Sorry but the Maximum Allowed Queues of $r.set(Fserve,Max.Queues.Total) has been reached. Please try again later.
              halt
            }
          }
          else { 
            if ($Queue(0) < $r.set(Fserve,Max.Queues.Total)) {
              queue.add Fserve $nick $iif($address($nick,5) != $null,$address($nick,5),$fserv($nick).ip) $ctime $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 
            }
            else {
              msg =$nick $c(1) $+ $iif($antiget,$confusion(Sorry but the Maximum Allowed Queues of),Sorry but the Maximum Allowed Queues of) $r.set(Fserve,Max.Queues.Total) $iif($antiget,$confusion(has been reached. Please try again later.),has been reached. Please try again later.)
              halt
            }
          }
        }
        else { 
          if ($Queue(0) < $r.set(Fserve,Max.Queues.Total)) {
            queue.add Fserve $nick $iif($address($nick,5) != $null,$address($nick,5),$fserv($nick).ip) $ctime $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 
          }
          else {
            msg =$nick $c(1) $+ $iif($antiget,$confusion(Sorry but the Maximum Allowed Queues of),Sorry but the Maximum Allowed Queues of) $r.set(Fserve,Max.Queues.Total) $iif($antiget,$confusion(has been reached. Please try again later.),has been reached. Please try again later.)
            halt
          }
        }
        if ($result isnum) { .timer 1 0 msg =$nick $c(1) $+ $iif($antiget,$confusion(That queue already exists in queue slot),That queue already exists in queue slot) $chr(35) $+ $result $+ , $iif($antiget,$confusion(try another file.),try another file.) | Halt }
        .timer 1 0 msg =$nick $iif($antiget,$confusion(The file has been queued in slot),The file has been queued in slot) $iif((%SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel) && ($r.set(DCCmgr,SecondQ) == On)),$Pqueue(0),$queue(0))
        if ($r.set(Fserve,Logging) == On) { FSlog Queued $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) for $address($nick,5) in slot $chr(35) $+ $queue(0) } 
        .timer -o 1 0 DirRecord $nick $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 
        Halt 
      }
    }
    halt
  }
  elseif ($r.set(Fserve,Fserve.Chat) == On) {
    if $1- != bye && $1- != ls && $1- != dir && $1 != cd && $1- != exit && $1 != read && $1 != quit && $1 != cd.. {
      if ($window(@Fserve.Chat) == $null) { window -enk @Fserve.Chat $r.winpos(@Fserve.Chat) @Fserve.Chat }
      titlebar @Fserve.Chat - Type messages in the box to talk with fserve users.
      if (ACTION * iswm $1-) { aline -ph $colour(action) @Fserve.Chat $ts * $nick $clradj($gettok($gettok($1-,1-,1),2-,32)) }
      else { aline -ph @Fserve.Chat $ts $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) }
      if ($fserv(0) > 1) {
        var %fserve-p = 0
        :start
        inc %fserve-p 1
        if ($fserv(%fserve-p) == $null) { unset %fserve-p }
        elseif (($fserv(%fserve-p) == $nick) || ($fserv(%fserve-p).status == waiting) || ($fserv(%fserve-p).status == inactive)) { goto start }
        elseif (ACTION * iswm $1-) { msg = $+ $fserv(%fserve-p) * $nick $gettok($gettok($1-,1-,1),2-,32) | goto start }
        else { msg = $+ $fserv(%fserve-p) < $+ $nick $+ > $1- | goto start }
      }
      halt
    }
  }
  ; haltdef
  if ($1 == GET) { HALT }
  :leave
}
on *:filesent:*.*:{
  if $r.glob(Fserve,SmartSend) == On {
    .timerNOSSEND $+ $iNetwork -o 1 15 unset %NOSSend [ $+ [ $iNetwork ] ]
    set %NoSSend [ $+ [ $iNetwork ] ] 1
    .timer 1 17 queue.send
  }
  .timer 1 0 queue.send
  if $isend(0) == 0 { unset %send.cps* }
  var %chkct1 = 1 
  While (%chkct1 < $isend(0)) {
    set %send.cps. [ $+ [ $iNetwork ] ] [ $+ %chkct1 ] $r.set(Min.CPS,RATE)
    inc %chkct1 1
  }
  if $r.set(Fserve,AlterWin) == On { DCCWinAdd Successfully Sent $c(2) $+ $nopath($filename) $bracket($size($file($filename).size)) to $c(2) $+ $nick $c(1) $+ at $c(2) $+ $ratefix($isend($nick).cps) $+ $c(1) at $+ $c(2) $time(h:nntt) $+ $c(1) $+ . }
  else { aecho Successfully Sent $c(2) $+ $nopath($filename) $bracket($size($file($filename).size)) to $c(2) $+ $nick $c(1) $+ at $c(2) $+ $ratefix($isend($nick).cps) $+ $c(1) at $+ $c(2) $time(h:nntt) $+ $c(1) $+ . }
  if $r.set(Fserve,Logging) == On { FSlog Successfully Sent $filename of $size($file($filename).size) to $address($nick,5) at $ratefix($isend($nick).cps) }
  DCCstatwin Successfully Sent $c(2) $+ $nopath($filename) $bracket($size($file($filename).size)) to $c(2) $+ $nick $c(1) $+ at $c(2) $+ $ratefix($isend($nick).cps) $+ $c(1) at $+ $c(2) $time(h:nntt) $+ $c(1) $+ .
  qmu
  qrfresh
  if ($nick != $me) {
    if ($r.set(TDCC.1,Filename) == $filename) { w.set TDCC.1 Downloads $calc( [ $r.set(TDCC.1,Downloads) ] + 1) | if ($vnum($isend($nick).cps) > $vnum($gettok($r.set(TDCC.1,Record.CPS),1,32))) { w.set TDCC.1 Record.CPS $isend($nick).cps $nick } }
    if ($r.set(TDCC.2,Filename) == $filename) { w.set TDCC.2 Downloads $calc( [ $r.set(TDCC.2,Downloads) ] + 1) | if ($vnum($isend($nick).cps) > $vnum($gettok($r.set(TDCC.2,Record.CPS),1,32))) { w.set TDCC.2 Record.CPS $isend($nick).cps $nick } }
    if ($r.set(TDCC.3,Filename) == $filename) { w.set TDCC.3 Downloads $calc( [ $r.set(TDCC.3,Downloads) ] + 1) | if ($vnum($isend($nick).cps) > $vnum($gettok($r.set(TDCC.3,Record.CPS),1,32))) { w.set TDCC.3 Record.CPS $isend($nick).cps $nick } }
    if ($r.set(TDCC.4,Filename) == $filename) { w.set TDCC.4 Downloads $calc( [ $r.set(TDCC.4,Downloads) ] + 1) | if ($vnum($isend($nick).cps) > $vnum($gettok($r.set(TDCC.4,Record.CPS),1,32))) { w.set TDCC.4 Record.CPS $isend($nick).cps $nick } }
    if ($r.set(TDCC.5,Filename) == $filename) { w.set TDCC.5 Downloads $calc( [ $r.set(TDCC.5,Downloads) ] + 1) | if ($vnum($isend($nick).cps) > $vnum($gettok($r.set(TDCC.5,Record.CPS),1,32))) { w.set TDCC.5 Record.CPS $isend($nick).cps $nick } }
    var %xdcc-c = 0
    :start
    inc %xdcc-c 1
    if ($r.xdcc.pack(%xdcc-c,DL) == $null) { unset %xdcc-c | goto next }
    if ($r.xdcc.pack(%xdcc-c,Filename) == $filename) {
      w.xdcc.pack %xdcc-c DL $calc( [ $r.xdcc.pack(%xdcc-c,DL) ] + 1) | w.set XDCC Snagged $calc( [ $r.set(XDCC,Snagged) ] + $file($filename).size)
      if ($vnum($isend($nick).cps) > $vnum($gettok($r.set(XDCC,Record.CPS),1,32))) { w.set XDCC Record.CPS $isend($nick).cps $nick }
    }
    goto start
    :next
    if ($r.set(Fserve,Status) == On) {
      if ($vnum($isend($nick).cps) > $vnum($gettok($r.set(Fserve,Record.CPS),1,32))) { w.set Fserve Record.CPS $isend($nick).cps $nick }
      w.set Fserve Send.Bytes $calc( [ $r.set(Fserve,Send.Bytes) ] + $file($filename).size)
      w.set Fserve Send.Total $calc( [ $r.set(Fserve,Send.Total) ] + 1)
      var %tmpNickGet = $r.nickrec(Nicks,$nick)
      inc %tmpNickGet 1
      w.nickrec Nicks $nick %tmpNickGet
      var %addy = $replace($address($nick,3),$chr(61),$chr(58))
      if %addy != $null {
        var %bytes = $gettok($r.leech(Leech,%addy),1,44)
        var %time = $gettok($r.leech(Leech,%addy),2,44)
        var %nbytes = $calc(%bytes + $file($filename).size)
        w.leech Leech %addy %nbytes $+ $chr(44) $+ $iif(%time != $null, %time,$ctime)
      }
    }
  }
  FservRefresh
  setsaved Fserv
  Halt
}
on *:filercvd:*.*:{ 
  set %received $filename
  if $r.set(Fserve,AlterWin) == On { 
    DCCWinAdd Successfully Received $c(2) $+ $nopath($filename) $+ $c(1) $bracket($size($file($filename).size)) from $+ $c(2) $nick $c(1) $+ at $c(2) $+ $ratefix($iget($nick).cps) $+ $c(1) at $+ $c(2) $time(h:nntt) $+ $c(1) $+ .
  } 
  else { aecho Successfully Received $c(2) $+ $nopath($filename) $+ $c(1) $bracket($size($file($filename).size)) from $+ $c(2) $nick $c(1) $+ at $c(2) $+ $ratefix($iget($nick).cps) $+ $c(1) at $+ $c(2) $time(h:nntt) $+ $c(1) $+ . }
  DCCstatwin Successfully Received $nopath($filename) $bracket($size($file($filename).size)) from $+ $c(2) $nick $c(1) $+ at $ratefix($iget($nick).cps) at $+ $c(2) $time(h:nntt) $+ $c(1) $+ . 
  FservRefresh
  halt
}
on *:getfail:*.*: { 
  if $r.set(Fserve,AlterWin) == On { 
    DCCWinAdd Failed to Receive $c(2) $+ $nopath($filename) $+ $c(1) from $c(2) $+ $nick $+ $c(1) at $+ $c(2) $time(h:nntt) $+ $c(1) $+ .  
  } 
  else { aecho Failed to Receive $c(2) $+ $nopath($filename) $+ $c(1) from $c(2) $+ $nick $+ $c(1) $+ . }
  DCCstatwin Failed to Receive $c(2) $+ $nopath($filename) $+ $c(1) from $c(2) $+ $nick $+ $c(1) $+ . 
  if ($r.set(Invision,SndOpt18) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound19) } 
  Halt
}
on *:sendfail:*.*:{ 
  if (%DST [ $+ [ $remove($nick,$chr(124),$chr(91),$chr(93)) ] ] != $null) {
    if (%DST [ $+ [ $remove($nick,$chr(124),$chr(91),$chr(93)) ] ] isnum) {
      /scid %DST [ $+ [ $remove($nick,$chr(124),$chr(91),$chr(93)) ] ]
    }
  }
  if $r.glob(Fserve,SmartSend) == On {
    .timerNOSSEND $+ $iNetwork -o 1 15 unset %NOSSend [ $+ [ $iNetwork ] ] $chr(124) queue.send
    set %NoSSend [ $+ [ $iNetwork ] ] 1
  }
  else { .timer 1 0 queue.send }
  if $r.set(DCCmgr,Requeue) == On && ($nick != $null) {
    if %Requeue [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ $nopath($shortfn($filename)) ] ] == $null { set %Requeue [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ $nopath($shortfn($filename)) ] ] 0 }
    if %Requeue [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ $nopath($shortfn($filename)) ] ] <= $calc($r.set(DCCmgr,RequeueCT) - 1) {
      if $address($nick,5) != $null && $level($address($nick,5)) >= $iif($r.set(DCCmgr,SQlevel) != $null,$r.set(DCCmgr,SQlevel),14) && $r.set(DCCmgr,SecondQ) == On {
        .timer -o 1 1 Pqueue.insert Requeue $nick $iif($address($nick,5) != $null,$address($nick,5),$nick) $ctime $filename
        .timer -o 1 1 notice $nick $c(1) $+ I have automatically requeued $c(2) $+ $nopath($filename) $c(1) $+ for you. $ilogo
        set %Requeue [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ $nopath($shortfn($filename)) ] ] $calc(%Requeue [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ $nopath($shortfn($filename)) ] ] + 1)
      }
      else {
        .timer -o 1 1 queue.insert Requeue $nick $iif($address($nick,5) != $null,$address($nick,5),$nick) $ctime $filename
        .timer -o 1 1 notice $nick $c(1) $+ I have automatically requeued $c(2) $+ $nopath($filename) $c(1) $+ for you. $ilogo
        set %Requeue [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ $nopath($shortfn($filename)) ] ] $calc( [ %Requeue [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ $nopath($shortfn($filename)) ] ] ] + 1)
      }
    }
    else {
      unset %Requeue [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ $nopath($shortfn($filename)) ] ]
    }
  }
  if $r.set(Fserve,AlterWin) == On { 
    DCCWinAdd Failed to Send $c(2) $+ $nopath($filename) $+ $c(1) to $c(2) $+ $nick $bracket($address) $c(1) $+ at $c(2) $+ $time(h:nntt) $+ $c(1) $+ . 
  } 
  else { aecho Failed to Send $c(2) $+ $nopath($filename) $+ $c(1) to $c(2) $+ $nick $+ $c(1) $+ . }
  DCCstatwin Failed to Send $nopath($filename) to $nick $bracket($address) at $time(h:nntt) $+ . 
  if $r.set(Fserve,Logging) == On { 
    FSlog Failed to Send $filename to $address($nick,5) 
  } 
  if ($r.set(Fserve,Status) == On) { 
    w.set Fserve Send.Fails $calc( [ $r.set(Fserve,Send.Fails) ] + 1) 
    if ($r.set(Invision,SndOpt19) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound20) } 
  }
  FservRefresh
  setsaved Fserv
  halt
}
Dialog LogSearch {
  title "Invision Log Search"
  icon %dialogIcon
  size -1 -1 300 70
  option dbu

  text "Path\filename to search (wildcards accepted):",1,5 5 110 10
  edit "",2,115 4 170 10, autohs
  button "...",3,287 4 10 10

  text "Search log file(s) for (wildcards accepted):",4,5 20 110 10
  edit "",5,115 19 170 10, autohs

  button "Search",6,5 35 25 10

  text "NOTE: Searching for a common word/phrase may 'freeze' mIRC until finished.  This may disconnect you.  This is especially true if you have a lot of log files or very large log files.  Try searching only specific files or use wildcards in the path\filename to limit the search.  Example (if your log filenames include the date and network): c:\invision\logs\irchighway\#Invision.*.2011*.log",7,45 35 250 40
}
on *:dialog:logsearch:init:0: {
  did -ra $dname 2 $logdir $+ $gettok($mklogfn($active),1--2,92) $+ \ $+ $active $+ *.log
}
on *:dialog:logsearch:sclick:*: {
  if ($did == 3) { did -ra $dname 2 $sdir($logdir $+ $gettok($mklogfn($active),1--2,92) $+ \) }
  if ($did == 6) {
    var %path = $iif($right($did($dname,2),1) == \,$did($dname,2),$gettok($did($dname,2),1- -2,92))
    var %file = $iif($right($did($dname,2),1) == \,*,$gettok($did($dname,2),-1,92))
    set %i.search $did($dname,5)
    if (!$window(@LogSearch)) { window -knz @LogSearch }
    clear @LogSearch
    aline @LogSearch Search Results for * $+ %i.search $+ * :
    noop $findfile(%path,%file,0,1,ilogsearch $1-)
  }
  dialog -c logsearch
}
