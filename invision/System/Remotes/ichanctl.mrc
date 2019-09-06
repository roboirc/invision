; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: ichanctl.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: The Channel Control Events
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
#ChanCTRL on
on *:TEXT:*serve*trig*send*:#:{
  if ($me isop $chan) { 
    if ($cfchk($chan,+fs)) { 
      if (($r.set(ChanOps,Channels) == All) || ($r.set(ChanOps,Channels) == $null) || ($istok($r.set(ChanOps,Channels),$chan,44) == $true)) {
        if ($nick !isvo $chan) && ($nick !isop $chan) {
          .timer 1 $rand(1,12) if $nick !isvo $chan mode $chan +v $nick
        }
      }
    }
  }
}
on *:TEXT:*§ËRV*t®îg*SeND*:#:{
  if ($me isop $chan) {
    if ($cfchk($chan,+fs)) { 
      if (($r.set(ChanOps,Channels) == All) || ($r.set(ChanOps,Channels) == $null) || ($istok($r.set(ChanOps,Channels),$chan,44) == $true)) {
        if ($nick !isvo $chan) && ($nick !isop $chan) {
          .timer 1 $rand(1,12) if $nick !isvo $chan mode $chan +v $nick
        }
      }
    }
  }
}
on *:TEXT:*mp3 Server Online*:#:{
  if ($me isop $chan) {
    if ($cfchk($chan,+mp3)) { 
      if (($r.set(ChanOps,Channels) == All) || ($r.set(ChanOps,Channels) == $null) || ($istok($r.set(ChanOps,Channels),$chan,44) == $true)) {
        if ($nick !isvo $chan) && ($nick !isop $chan) {
          .timer 1 $rand(1,12) if $nick !isvo $chan mode $chan +v $nick
        }
      }
    }
  }
}
on *:TEXT:*@*list*slots*:#:{
  if ($me isop $chan) {
    if ($cfchk($chan,+mp3)) { 
      if (($r.set(ChanOps,Channels) == All) || ($r.set(ChanOps,Channels) == $null) || ($istok($r.set(ChanOps,Channels),$chan,44) == $true)) {
        if ($nick !isvo $chan) && ($nick !isop $chan) {
          .timer 1 $rand(1,12) if $nick !isvo $chan mode $chan +v $nick
        }
      }
    }
  }
}
on *:TEXT:*packs*slots open*:#:{
  if ($me isop $chan) {
    if ($cfchk($chan,+xdcc)) { 
      if (($r.set(ChanOps,Channels) == All) || ($r.set(ChanOps,Channels) == $null) || ($istok($r.set(ChanOps,Channels),$chan,44) == $true)) {
        if ($nick !isvo $chan) && ($nick !isop $chan) {
          .timer 1 $rand(1,12) if $nick !isvo $chan mode $chan +v $nick
        }
      }
    }
  }
}
on *:TEXT:*xdcc server active*:#:{
  if ($me isop $chan) {
    if ($cfchk($chan,+xdcc)) { 
      if (($r.set(ChanOps,Channels) == All) || ($r.set(ChanOps,Channels) == $null) || ($istok($r.set(ChanOps,Channels),$chan,44) == $true)) {
        if ($nick !isvo $chan) && ($nick !isop $chan) {
          .timer 1 $rand(1,12) if $nick !isvo $chan mode $chan +v $nick
        }
      }
    }
  }
}
on *:TEXT:*FTP*.*.*.*l*p*:#:{
  if ($me isop $chan) {
    if $cfchk($chan,+ftp) {
      if (($r.set(ChanOps,Channels) == All) || ($r.set(ChanOps,Channels) == $null) || ($istok($r.set(ChanOps,Channels),$chan,44) == $true)) {
        if ($nick !isvo $chan) && ($nick !isop $chan) {
          .timer 1 $rand(1,12) if $nick !isvo $chan mode $chan +v $nick
          ; echo $ilogo $nick was Auto Voiced for running a FTP.
        }
      }
    }
  }
}
on *:deop:#:{
  if ($chr(126) isin $nick) { return }
  if ($me isop $chan) && ($nick != $me) {
    if ($istok($r.cf(ChanOps,Channels),$chan,44) == $true) {
      if ($level($address($opnick,5)) <= 16) && ($level($address($nick,5)) >= 17) { if $cfchk($chan,+pf) && $uchanchk($address($nick,5),$chan) { mode $chan +o $opnick | msg $chan $bracket($opnick) $c(2) $+ is a protected friend of mine $ilogo | if $cfchk($chan,+wo) { .xonotice $chan $opnick was reopped at $time(h:nn:tt) Deop Protection for Friends } | if $r.set(ChanOps,LogDefense) == On { deflog $nick was reopped in $chan at $time(h:nn:tt) after being deopped by $nick Deop Protection for Friends } } }
      if ($level($address($opnick,5)) <= 16) { if $cfchk($chan,+do) { .timerMASSDEOPRST $+ $iNetwork -o 1 15 unset %MassDeopCt [ $+ [ $iNetwork ] ] | set %MassDeopCt [ $+ [ $iNetwork ] ] $calc(%MassDeopCt [ $+ [ $iNetwork ] ] + $mode(0).deop) | if (%MassDeopCt [ $+ [ $iNetwork ] ] > 4)  { mode $chan -o $nick | kick $chan $nick Mass Deop Protection) ( $+ $ilogo(X) | if $cfchk($chan,+wo) { .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Mass Deop Protection } | if $r.set(ChanOps,LogDefense) == On { deflog $nick was kicked from $chan at $time(h:nn:tt) for: Mass Deop Protection } } | else { .timer -o 1 15 unset %MassDeopCt [ $+ [ $iNetwork ] ] } } }
    }
  }
}
on *:kick:#: {
  if ($chr(126) isin $nick) { return }
  if ($me isop $chan) {
    if ($nick == $me) || ($level($address($nick,5)) >= 17) {
      var %curNetwork = $iNetwork
      if ($r.set(ChanOps,ldStatus) == On) {
        if ($istok($r.cf(ChanOps,Channels),$chan,44) == $true) {
          set %ldFlag [ $+ [ %curNetwork ] ] 0
          if ($chan == %ldLastChan [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] ) { inc %ldtracker [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 1 | .timer 1 $cgetset($chan,lkspan) dec %ldtracker [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 1 | .timerldCleanup $+ %curNetwork $+ 1 -o 1 $cgetset($chan,lkspan) unset %ldtracker [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | set %ldFlag [ $+ [ %curNetwork ] ] 1 | goto bail }
          if ($chan == %ldLastChan [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] ) { inc %ldtracker [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 1 | .timer 1 $cgetset($chan,lkspan) dec %ldtracker [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 1 | .timerldCleanup $+ %curNetwork $+ 2 -o 1 $cgetset($chan,lkspan) unset %ldtracker [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | set %ldFlag [ $+ [ %curNetwork ] ] 1 }
          :bail
          if (%ldFlag [ $+ [ %curNetwork ] ] != 1) {
            if (%lcLastChan [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] == $null) { set %ldLastChan [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] $chan | goto cya }
            if (%lcLastChan [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] == $null) { set %ldLastChan [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] $chan | goto cya }
            unset %ldFlag [ $+ [ %curNetwork ] ]
          }
          if (%ldtracker [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] >= $cgetset($chan,lkct)) { .timer -o 1 $calc($cgetset($chan,lktime) * 60) UnlockChannel $chan | LockChannel $chan | unset %ldtracker [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] %ldLastChan [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] }
          if (%ldtracker [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] >= $cgetset($chan,lkct)) { .timer -o 1 $calc($cgetset($chan,lktime) * 60) UnlockChannel $chan | LockChannel $chan | unset %ldtracker [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] %ldLastChan [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] }
          :cya
          unset %ldFlag [ $+ [ %curNetwork ] ]
        }
      }
    }
    if $nick != $me {
      if ($istok($r.cf(ChanOps,Channels),$chan,44) == $true) {
        if ($level($address($knick,5)) >= 17) && ($level($address($nick,5)) <= 19) { if $cfchk($chan,+pf) && ($uchanchk($address($nick,5),$chan)) { mode $chan -o $nick | kick $chan $nick for kicking a protected friend!)( $ilogo(X) | .notice $knick $bracket($nick) $c(2) $+ was deopped and kicked from $chan for kicking you! $ilogo | if $cfchk($chan,+wo) { .xonotice $chan $nick was kicked at $time(h:nn:tt) for: kicking a protected friend, $knick } | if $r.set(ChanOps,LogDefense) == On { deflog $nick was kicked from $chan at $time(h:nn:tt) for: kicking a protected friend, $knick } } }
      }
    }
  }
}
on *:serverop:#: {
  if ($chr(126) isin $nick) { return }
  if ($me isop $chan) {
    if ($ufchk($fulladdress,-o,$chan)) { mode $chan -o $nick }
    if ($me isop $chan) && ($opnick != $me) {
      if ($istok($r.cf(ChanOps,Channels),$chan,44) == $true) {
        if ($level($address($opnick,5)) <= 16) { 
          if ($cfchk($chan,+so)) { mode $chan -o $opnick | msg $chan $c(2) $+ Sorry $opnick $+ , but Server Ops arn't allowed for those not in my ops list. $ilogo 
            if ($cfchk($chan,+wo)) { .xonotice $chan $nick was deopped at $time(h:nn:tt) for: Serverops not allowed } 
            if ($r.set(ChanOps,LogDefense) == On) { deflog $nick was deopped in $chan at $time(h:nn:tt) for: Serverops not allowed } 
          } 
        }
      }
    }
  }
}
on *:op:#: {
  if ($chr(126) isin $nick) { return }
  if ($me isop $chan) {
    if ($ufchk($fulladdress,-o,$chan)) { mode $chan -o $nick }
    if ($istok($r.cf(ChanOps,Channels),$chan,44)) {   
      if ($opnick == $me) {
        chmodeEnforce $chan
      }
    } 
    if ($me isop $chan) && ($nick != $me) && ($opnick != $me) {
      if ($istok($r.cf(ChanOps,Channels),$chan,44) == $true) {
        if ($level($address($opnick,5)) <= 16)  { if ($cfchk($chan,+bm)) { mode $chan -o $opnick | .xonotice $chan $bracket($opnick) $c(2) $+ is not in my list $bracket(ß!TÇHMØУ) $ilogo | if ($cfchk($chan,+wo)) { .xonotice $chan $nick was deopped at $time(h:nn:tt) for: Not in my User list, ß!TÇHMØУ } | if $r.set(ChanOps,LogDefense) == On { deflog $nick was deopped in $chan at $time(h:nn:tt) for: Not in my User list, ß!TÇHMØУ } } }
      }
    }
  }
}
on *:text:*:#: {
  if ($chr(126) isin $nick) { return }
  if ($me isop $chan) {
    if ($nick !isop $chan) && ($nick !isvo $chan) && ($nick !ishop $chan) {
      if ($istok($r.cf(ChanOps,Channels),$chan,44) == $true) {
        var %curNetwork = $iNetwork
        if ($level($fulladdress) >= 15) { return }
        if ($cfchk($chan,+kt)) { 
          if (($chr(32) $+ trade isin $1-) || (reward isin $1-)) { 
            inc %TWCT [ $+ [ $address($nick,3) ] ] 1
            if (%TWCT [ $+ [ $address($nick,3) ] ] >= 4) { .mode $chan +b $address($nick,$r.glob(Invision,DefaultBan)) | .timer -o 1 $calc(%defban * 60) .mode $chan -b $address($nick,$r.glob(Invision,DefaultBan)) }
            .kick $chan $nick $c(1) $+ No Trading!, $ord(%TWCT [ $+ [ $address($nick,3) ] ] ) offence.) ( $+ $ilogo(X) 
            if ($cfchk($chan,+wo)) { 
              .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Trading! 
            } 
            if ($r.set(ChanOps,LogDefense) == On) { 
              deflog $nick was kicked in $chan at $time(h:nn:tt) for: Trading! 
            } 
          } 
        }
        if ($cfchk($chan,+kf)) || ($cfchk($chan,+bf)) {
          var %tFlag = 0
          set %TFchan [ $+ [ %curNetwork ] ] $chan
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] 0 }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 1 | .timerTF $+ %curNetwork $+ 1 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | .timerCFT1 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 1 | .timerTF $+ %curNetwork $+ 2 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | .timerCFT2 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] 1 | .timerTF $+ %curNetwork $+ 3 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | .timerCFT3 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] 1 | .timerTF $+ %curNetwork $+ 4 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | .timerCFT4 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] 1 | .timerTF $+ %curNetwork $+ 5 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | .timerCFT5 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] 1 | var %tFlag = 1 | goto donenow }
          :donenow
          if (%tFLag != 1) {
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] $nick | .timerTF $+ %curNetwork $+ 1 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] $nick | .timerTF $+ %curNetwork $+ 2 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] $nick | .timerTF $+ %curNetwork $+ 3 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] $nick | .timerTF $+ %curNetwork $+ 4 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] $nick | .timerTF $+ %curNetwork $+ 5 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | goto scram }
            :scram
          }
          if ($cfchk($chan,+kf)) {
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT1 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT2 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT3 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT4 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT5 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
          }
        }
      }
      :leave
    }
  }
}
on *:nick:{ 
  if ($chr(126) isin $nick) { return }
  var %curNetwork = $iNetwork
  set %nfchan [ $+ [ %curNetwork ] ] $comchan($newnick,1)
  if ($me isop %nfchan [ $+ [ %curNetwork ] ] ) {
    if ($nick !isop %nfchan [ $+ [ %curNetwork ] ] ) && ($nick !isvo %nfchan [ $+ [ %curNetwork ] ] ) && ($nick !ishop %nfchan [ $+ [ %curNetwork ] ] ) { 
      if $cfchk(%nfchan [ $+ [ %curNetwork ] ] ,+nf) { 
        if ($istok($r.cf(ChanOps,Channels),%nfchan [ $+ [ %curNetwork ] ] ,44) == $true)  { 
          if ($level($fulladdress) >= 15) { return }
          .timerCleanup $+ %curNetwork 1 30 unset %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ * ] ] 
          var %nFlag = 0
          if $nick == %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] { set %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] $calc(%nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] + 1) | .timerNW1 $+ %curNetwork 1 15 unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | .timer 1 15 set %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] $!calc(%nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] - 1) | set %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] $newnick | var %nFlag [ $+ [ %curNetwork ] ] = 1 | goto skipit }
          if $nick == %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] { set %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] $calc(%nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] + 1) | .timerNW2 $+ %curNetwork 1 15 unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | .timer 1 15 set %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] $!calc(%nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] - 1) | set %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] $newnick | var %nFlag [ $+ [ %curNetwork ] ] = 1 | goto skipit }
          if $nick == %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] { set %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] $calc(%nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] + 1) | .timerNW3 $+ %curNetwork 1 15 unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | .timer 1 15 set %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] $!calc(%nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] - 1) | set %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] $newnick | var %nFlag [ $+ [ %curNetwork ] ] = 1 | goto skipit }
          if $nick == %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] { set %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] $calc(%nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] + 1) | .timerNW4 $+ %curNetwork 1 15 unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | .timer 1 15 set %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] $!calc(%nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] - 1) | set %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] $newnick | var %nFlag [ $+ [ %curNetwork ] ] = 1 | goto skipit }
          if $nick == %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] { set %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] $calc(%nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] + 1) | .timerNW5 $+ %curNetwork 1 15 unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | .timer 1 15 set %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] $!calc(%nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] - 1) | set %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] $newnick | var %nFlag [ $+ [ %curNetwork ] ] = 1 | goto skipit }
          :skipit
          if %nFlag != 1 {
            if %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] == $null { set %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] $newnick | .timerNW1 $+ %curNetwork 1 15 unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | goto done }
            if %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] == $null { set %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] $newnick | .timerNW2 $+ %curNetwork 1 15 unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | goto done }
            if %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] == $null { set %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] $newnick | .timerNW3 $+ %curNetwork 1 15 unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | goto done }
            if %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] == $null { set %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] $newnick | .timerNW4 $+ %curNetwork 1 15 unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | goto done }
            if %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] == $null { set %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] $newnick | .timerNW5 $+ %curNetwork 1 15 unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | goto done }
            :done
          }
          if %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] >= 3 && %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] ison %nfchan [ $+ [ %curNetwork ] ] { ban -u [ $+ [ $calc(%defban * 60) ] ] %nfchan [ $+ [ %curNetwork ] ] %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 3 | .kick %nfchan [ $+ [ %curNetwork ] ] %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] Nick Change Flood) ( $+ $ilogo(X) | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | unset %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | if $cfchk(%nfchan [ $+ [ %curNetwork ] ] ,+wo) { .xonotice %nfchan [ $+ [ %curNetwork ] ] $nick was banned and kicked at $time(h:nn:tt) for: Nick Change Flooding } | if $r.set(ChanOps,LogDefense) == On { deflog $nick was banned and Kicked in %nfchan [ $+ [ %curNetwork ] ] at $time(h:nn:tt) for: Nick Change Flood } }
          if %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] >= 3 && %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] ison %nfchan [ $+ [ %curNetwork ] ] { ban -u [ $+ [ $calc(%defban * 60) ] ] %nfchan [ $+ [ %curNetwork ] ] %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 3 | .kick %nfchan [ $+ [ %curNetwork ] ] %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] Nick Change Flood) ( $+ $ilogo(X) | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | unset %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | if $cfchk(%nfchan [ $+ [ %curNetwork ] ] ,+wo) { .xonotice %nfchan [ $+ [ %curNetwork ] ] $nick was banned and kicked at $time(h:nn:tt) for: Nick Change Flooding } | if $r.set(ChanOps,LogDefense) == On { deflog $nick was banned and Kicked in %nfchan [ $+ [ %curNetwork ] ] at $time(h:nn:tt) for: Nick Change Flood } }
          if %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] >= 3 && %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] ison %nfchan [ $+ [ %curNetwork ] ] { ban -u [ $+ [ $calc(%defban * 60) ] ] %nfchan [ $+ [ %curNetwork ] ] %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] 3 | .kick %nfchan [ $+ [ %curNetwork ] ] %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] Nick Change Flood) ( $+ $ilogo(X) | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | unset %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | if $cfchk(%nfchan [ $+ [ %curNetwork ] ] ,+wo) { .xonotice %nfchan [ $+ [ %curNetwork ] ] $nick was banned and kicked at $time(h:nn:tt) for: Nick Change Flooding } | if $r.set(ChanOps,LogDefense) == On { deflog $nick was banned and Kicked in %nfchan [ $+ [ %curNetwork ] ] at $time(h:nn:tt) for: Nick Change Flood } }
          if %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] >= 3 && %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] ison %nfchan [ $+ [ %curNetwork ] ] { ban -u [ $+ [ $calc(%defban * 60) ] ] %nfchan [ $+ [ %curNetwork ] ] %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] 3 | .kick %nfchan [ $+ [ %curNetwork ] ] %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] Nick Change Flood) ( $+ $ilogo(X) | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | unset %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | if $cfchk(%nfchan [ $+ [ %curNetwork ] ] ,+wo) { .xonotice %nfchan [ $+ [ %curNetwork ] ] $nick was banned and kicked at $time(h:nn:tt) for: Nick Change Flooding } | if $r.set(ChanOps,LogDefense) == On { deflog $nick was banned and Kicked in %nfchan [ $+ [ %curNetwork ] ] at $time(h:nn:tt) for: Nick Change Flood } }
          if %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] >= 3 && %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] ison %nfchan [ $+ [ %curNetwork ] ] { ban -u [ $+ [ $calc(%defban * 60) ] ] %nfchan [ $+ [ %curNetwork ] ] %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] 3 | .kick %nfchan [ $+ [ %curNetwork ] ] %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] Nick Change Flood) ( $+ $ilogo(X) | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | unset %LastNChange [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | unset %nickfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | if $cfchk(%nfchan [ $+ [ %curNetwork ] ] ,+wo) { .xonotice %nfchan [ $+ [ %curNetwork ] ] $nick was banned and kicked at $time(h:nn:tt) for: Nick Change Flooding } | if $r.set(ChanOps,LogDefense) == On { deflog $nick was banned and Kicked in %nfchan [ $+ [ %curNetwork ] ] at $time(h:nn:tt) for: Nick Change Flood } }
          unset %nfchan [ $+ [ %curNetwork ] ]   
        }
      }
      :leave
    }
  }
}
on *:JOIN:#:{
  if ($chr(126) isin $nick) { return }
  if ($me isop $chan) || ($me ishop $chan) {
    if $istok($r.cf(ChanOps,Channels),$chan,44) {
      if $ufchk($fulladdress,+v,$chan) { .timer 1 $rand(1,12) if $nick !isvo $chan mode $chan +v $nick }
    }
  }
}
on *:voice:#:{ if ($chr(126) isin $nick) { return } | if $ufchk($fulladdress,-v,$chan) { mode $chan -v $nick } }
on *:MODE:#:{
  if ($me isop $chan) {
    if ($istok($r.cf(ChanOps,Channels),$chan,44)) {   
      if ($cfchk($chan,+kl)) {
        if (*+k* iswm $1-) {
          if ($uchanchk($address($nick,5),$chan)) || ($nick == $me) {
            chmodeSAVE $chan +k [ $+ [ $gettok($1-,2,32) ] ] 
          }
        }
        if (*-k* iswm $1-) {
          if ($uchanchk($address($nick,5),$chan)) || ($nick == $me) {
            chmodeSAVE $chan -k 
          }
        }
      }
      .timerch $+ $iNetwork 1 $rand(1,2) chmodeEnforce $chan 
    } 
  }
}
on *:NOTICE:*:#: {
  if ($chr(126) isin $nick) { return }
  if ($me isop $chan) {
    if ($nick !isop $chan) && ($nick !isvo $chan) && ($nick !ishop $chan) {
      if ($istok($r.cf(ChanOps,Channels),$chan,44) == $true) {
        var %curNetwork = $iNetwork
        if ($level($fulladdress) >= 15) { return }
        if ($cfchk($chan,+kt)) { 
          if (($chr(32) $+ trade isin $1-) || (reward isin $1-)) { 
            inc %TWCT [ $+ [ $address($nick,3) ] ] 1
            if (%TWCT [ $+ [ $address($nick,3) ] ] >= 4) { .mode $chan +b $address($nick,$r.glob(Invision,DefaultBan)) | .timer -o 1 $calc(%defban * 60) .mode $chan -b $address($nick,$r.glob(Invision,DefaultBan)) }
            .kick $chan $nick $c(1) $+ No Trading!, $ord(%TWCT [ $+ [ $address($nick,3) ] ] ) offence.) ( $+ $ilogo(X) 
            if $cfchk($chan,+wo) { 
              .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Trading! 
            } 
            if ($r.set(ChanOps,LogDefense) == On) { 
              deflog $nick was kicked in $chan at $time(h:nn:tt) for: Trading! 
            } 
          } 
        }
        if ($cfchk($chan,+kf)) || ($cfchk($chan,+bf)) {
          var %tFlag = 0
          set %TFchan [ $+ [ %curNetwork ] ] $chan
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] 0 }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 1 | .timerTF $+ %curNetwork $+ 1 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | .timerCFT1 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 1 | .timerTF $+ %curNetwork $+ 2 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | .timerCFT2 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] 1 | .timerTF $+ %curNetwork $+ 3 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | .timerCFT3 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] 1 | .timerTF $+ %curNetwork $+ 4 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | .timerCFT4 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] 1 | .timerTF $+ %curNetwork $+ 5 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | .timerCFT5 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] 1 | var %tFlag = 1 | goto donenow }
          :donenow
          if (%tFLag != 1) {
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] $nick | .timerTF $+ %curNetwork $+ 1 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] $nick | .timerTF $+ %curNetwork $+ 2 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] $nick | .timerTF $+ %curNetwork $+ 3 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] $nick | .timerTF $+ %curNetwork $+ 4 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] $nick | .timerTF $+ %curNetwork $+ 5 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | goto scram }
            :scram
          }
          if ($cfchk($chan,+kf)) {
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT1 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT2 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT3 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT4 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT5 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
          }
        }
      }
      :leave
    }
  }
}
on *:ACTION:*:#: {
  if ($chr(126) isin $nick) { return }
  if ($me isop $chan) {
    if ($nick !isop $chan) && ($nick !isvo $chan) && ($nick !ishop $chan) {
      if ($istok($r.cf(ChanOps,Channels),$chan,44) == $true) {
        var %curNetwork = $iNetwork
        if ($level($fulladdress) >= 15) { return }
        if ($cfchk($chan,+kt)) { 
          if (($chr(32) $+ trade isin $1-) || (reward isin $1-)) { 
            inc %TWCT [ $+ [ $address($nick,3) ] ] 1
            if (%TWCT [ $+ [ $address($nick,3) ] ] >= 4) { .mode $chan +b $address($nick,$r.glob(Invision,DefaultBan)) | .timer -o 1 $calc(%defban * 60) .mode $chan -b $address($nick,$r.glob(Invision,DefaultBan)) }
            .kick $chan $nick $c(1) $+ No Trading!, $ord(%TWCT [ $+ [ $address($nick,3) ] ] ) offence.) ( $+ $ilogo(X) 
            if $cfchk($chan,+wo) { 
              .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Trading! 
            } 
            if ($r.set(ChanOps,LogDefense) == On) { 
              deflog $nick was kicked in $chan at $time(h:nn:tt) for: Trading! 
            } 
          } 
        }
        if ($cfchk($chan,+kf)) || ($cfchk($chan,+bf)) {
          var %tFlag = 0
          set %TFchan [ $+ [ %curNetwork ] ] $chan
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] 0 }
          if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] < 0) { set %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] 0 }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 1 | .timerTF $+ %curNetwork $+ 1 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | .timerCFT1 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 1 | .timerTF $+ %curNetwork $+ 2 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | .timerCFT2 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] 1 | .timerTF $+ %curNetwork $+ 3 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | .timerCFT3 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] 1 | .timerTF $+ %curNetwork $+ 4 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | .timerCFT4 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] 1 | var %tFlag = 1 | goto donenow }
          if ($nick == %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] ) { inc %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] 1 | .timerTF $+ %curNetwork $+ 5 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | .timerCFT5 $+ %curNetwork $+ %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] -o 1 10 dec %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] 1 | var %tFlag = 1 | goto donenow }
          :donenow
          if (%tFLag != 1) {
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] $nick | .timerTF $+ %curNetwork $+ 1 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] $nick | .timerTF $+ %curNetwork $+ 2 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] $nick | .timerTF $+ %curNetwork $+ 3 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] $nick | .timerTF $+ %curNetwork $+ 4 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | goto scram }
            if (%LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] == $null) { set %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] $nick | .timerTF $+ %curNetwork $+ 5 1 10 unset %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | goto scram }
            :scram
          }
          if ($cfchk($chan,+kf)) {
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT1 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .1 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT2 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .2 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT3 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .3 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT4 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .4 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
            if (%chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] > 5) { if $cfchk($chan,+bf) { ban -u [ $+ [ $calc(%defban * 60) ] ] $chan $nick $r.glob(Invision,DefaultBan) } | kick $chan $nick Text Flooding) ( $+ $ilogo(X) | .timerCFT5 [ $+ [ %curNetwork ] ] [ $+ [ * ] ] off |  unset %chanfloodct [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] %LastBlab [ $+ [ %curNetwork ] ] [ $+ [ .5 ] ] | if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } | if $cfchk($chan,+wo) { .timer 1 0 .xonotice $chan $nick was kicked at $time(h:nn:tt) for: Text Flooding } | if $r.set(ChanOps,LogDefense) == On { .timer 1 0 deflog $nick was banned and kicked in $chan at $time(h:nn:tt) for: Text Flooding } }
          }
        }
      }
      :leave
    }
  }
}
#ChanCTRL end
