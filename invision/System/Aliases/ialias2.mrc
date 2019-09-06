; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: ialias2.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: Miscellaneous Alias Routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
msg {
  if ($chr(32) $+ AMIP $+ $chr(32) isin $1-) { halt }
  if $me ison $1 {
    if ($r.set(filterch,$1)) {
      if ($show) { !msg $1 $strip($2-) } | else { !.msg $1 $strip($2-) }
      return
    }
  }
  if ($show) { !msg $1- } | else { !.msg $1- }
  return
  :error
  halt
}
describe {
  if ($chr(32) $+ AMIP $+ $chr(32) isin $1-) { halt }
  if $me ison $1 {
    if ($r.set(filterch,$1)) {
      if ($show) { !describe $1 $strip($2-) } | else { !.describe $1 $strip($2-) }
      return
    }
  }
  if ($show) { !describe $1- } | else { !.describe $1- }
  return
  :error
  halt
}
say {
  if $me ison $chan {
    noop $regex($chan($chan).mode,/(\+.*?)\s/)
    if ($r.set(filterch,$chan) || c isincs $regml(1)) {
      if ($show) { !say $strip($1-) } | else { !.say $strip($1-) }
      return
    }
  }
  if ($1- == $null) halt
  if ($show) { !say $1- } | else { !.say $1- }
  return
  :error
  halt
}
me {
  if $me ison $chan {
    noop $regex($chan($chan).mode,/(\+.*?)\s/)
    if ($r.set(filterch,$chan) || c isincs $regml(1)) {
      if ($show) { !me $strip($1-) } | else { !.me $strip($1-) }
      return
    }
  }
  if ($show) { !me $1- } | else { !.me $1- }
  return
  :error
  halt
}

ame {
  if ($chr(32) $+ AMIP $+ $chr(32) isin $1-) { .timer -o 1 2 amipdet | halt }
  if $1 != $null {
    var %sss = 0
    var %ct = 1 
    while (%ct <= $chan(0)) { 
      .timer -m 1 $calc(%sss * 500) describe $chan(%ct) $1- 
      inc %sss 1
      inc %ct 1 
    }
  }
}
amipdet {
  ; echo -s amipdet entered!
  var %mp3fn = $dde(mPlug,var_s,"")
  set %mp3nplay %mp3fn
  mp3info %mp3fn
  mp3brag %mp3fn
}
opallf {
  if !$cfchk($1,+oaf) { aecho Op All Friends is disabled in Main Settings -> Channel Control. | goto leave }
  if $1 == $null { aecho $c(1) $+ None found | Halt }
  if ($me isop $1) {
    var %tmpUserCt = $nick($1,0) | var %tmpCurCt = 0 | unset %tboplist
    while (%tmpCurCt < %tmpUserCt) {
      Inc %tmpCurCt 1
      if $level($address($nick($1,%tmpCurCt),5)) >= 17 && $uchanchk($address($nick($1,%tmpCurCt),5),$1) && $nick($1,%tmpCurCt) != $me && $nick($1,%tmpCurCt) !isop $1 {
        var %tboplist = %tboplist $nick($1,%tmpCurCt) 
      }
    }
    mopl $1 %tboplist    
  }
  :leave
}
mopl {
  if $1 == $null { Error NO CHANNEL SPECIFIED | goto leave }
  if $2 == $null { aecho None Found | goto leave } 
  var %namect = $numtok($2-,32) 
  var %cyclect = $int($calc((%namect / 4) + .999)) 
  var %tmpctr = 0 | var %CurNick = 0 
  while (%tmpctr <= %cyclect) { 
    unset %tmpnlist
    inc %tmpctr 1
    inc %CurNick 1 
    if %CurNick > %NameCt { goto jmptoop }
    var %tmpnlist = $gettok($2-,%CurNick,32) 
    inc %CurNick 1
    if %CurNick > %NameCt { goto jmptoop }
    var %tmpnlist = %tmpnlist $gettok($2-,%CurNick,32)
    inc %CurNick 1
    if %CurNick > %NameCt { goto jmptoop } 
    var %tmpnlist = %tmpnlist $gettok($2-,%CurNick,32)
    inc %CurNick 1
    if %CurNick > %NameCt { goto jmptoop } 
    var %tmpnlist = %tmpnlist $gettok($2-,%CurNick,32)
    :jmptoop
    if $me isop $1 { mode $1 +oooo %tmpnlist }
    continue
  }
  :leave
}
massausers {
  if ($2 != $null) {
    if ($snick($1,0) > 0) {
      var %snct = 1
      While (%snct <= $snick($1,0)) {
        adduser $2 $snick($1,%snct) $1
        inc %snct 1
      }
      aecho The following people were added to the $2 $+ 's list: $c(2) $+ $replace($replace($snicks,$chr(44),$chr(32) • ),•,$chr(32) $+ • $+ $chr(32))
    }
    else { aecho No one is selected to add to the $2 $+ s list. }
  }
}
masstmpdcc {
  ;                               ***************  masstmpdcc <chan> 
  if ($1 != $null) {
    if ($snick($1,0) > 0) {
      .timer -o 1 10 unset %masstmp
      set %masstmp [ $+ [ $iNetwork ] ] 1
      var %snct = 1
      While (%snct <= $snick($1,0)) {
        udccset $address($snick($1,%snct),5) $snick($1,%snct) 
        inc %snct 1
      }
      aecho The following people were given Temporary DCC Permissions: $c(2) $+ $replace($snicks,$chr(44),$chr(32) • )
    }
    else { aecho No one is selected. }
  }
}
massctcp {
  ;                               ***************  massctcp <chan,ctcp command> 
  if ($2 != $null) {
    if ($snick($1,0) > 0) {
      .timer -o 1 10 unset %masstmp
      set %masstmp [ $+ [ $iNetwork ] ] 1
      var %snct = 1
      While (%snct <= $snick($1,0)) {
        .ctcp $snick($1,%snct) $2- 
        inc %snct 1
      }
      aecho The following people were sent a /ctcp $2- $+ : $c(2) $+ $replace($snicks,$chr(44),$chr(32) • )
    }
    else { aecho No one is selected. }
  }
}
massnotifyadd {
  if ($1 != $null) {
    if ($snick($1,0) > 0) {
      var %snct = 1
      While (%snct <= $snick($1,0)) {
        .notify $snick($1,%snct) 
        inc %snct 1
      }
      aecho The following people were added to your notify list: $c(2) $+ $replace($replace($snicks,$chr(44),$chr(32) • ),•,$chr(32) $+ • $+ $chr(32))
    }
    else { aecho No one is selected to add to your notify list. }
  }
}
mass {
  if ($me !ison $active) { error You must be on a channel. | return }
  if ($snick($chan,1) == $null) { error You must have at least one nickname selected. | return }
  if ($1 == $null) { return }
  if ($1 == -v) { if ($snick($chan,0) <= 4) { mode $chan -vvvv $snick($chan,1) $snick($chan,2) $snick($chan,3) $snick($chan,4) } | else { var %mass = -3 | :start | inc %mass 4 | if (%mass > $snick($chan,0)) { unset %mass | return } | mode $chan -vvvv $snick($chan,%mass) $snick($chan,$calc(%mass + 1)) $snick($chan,$calc(%mass + 2)) $snick($chan,$calc(%mass + 3)) | goto start } }
  if ($1 == -o) { if ($snick($chan,0) <= 4) { mode $chan -oooo $snick($chan,1) $snick($chan,2) $snick($chan,3) $snick($chan,4) } | else { var %mass = -3 | :start | inc %mass 4 | if (%mass > $snick($chan,0)) { unset %mass | return } | mode $chan -oooo $snick($chan,%mass) $snick($chan,$calc(%mass + 1)) $snick($chan,$calc(%mass + 2)) $snick($chan,$calc(%mass + 3)) | goto start } }
  if ($1 == -h) { if ($snick($chan,0) <= 4) { mode $chan -hhhh $snick($chan,1) $snick($chan,2) $snick($chan,3) $snick($chan,4) } | else { var %mass = -3 | :start | inc %mass 4 | if (%mass > $snick($chan,0)) { unset %mass | return } | mode $chan -hhhh $snick($chan,%mass) $snick($chan,$calc(%mass + 1)) $snick($chan,$calc(%mass + 2)) $snick($chan,$calc(%mass + 3)) | goto start } }
  if ($1 == -o+h) { if ($snick($chan,0) <= 2) { mode $chan -o+h-o+h $snick($chan,1) $snick($chan,1) $snick($chan,2) $snick($chan,2) } | else { var %mass = -1 | :start | inc %mass 2 | if (%mass > $snick($chan,0)) { unset %mass | return } | mode $chan -o+h-o+h $snick($chan,%mass) $snick($chan,%mass) $snick($chan,$calc(%mass + 1)) $snick($chan,$calc(%mass + 1)) | goto start } }
  if ($1 == -o+v) { if ($snick($chan,0) <= 2) { mode $chan -o+v-o+v $snick($chan,1) $snick($chan,1) $snick($chan,2) $snick($chan,2) } | else { var %mass = -1 | :start | inc %mass 2 | if (%mass > $snick($chan,0)) { unset %mass | return } | mode $chan -o+v-o+v $snick($chan,%mass) $snick($chan,%mass) $snick($chan,$calc(%mass + 1)) $snick($chan,$calc(%mass + 1)) | goto start } }
  if ($1 == -h+v) { if ($snick($chan,0) <= 2) { mode $chan -h+v-h+v $snick($chan,1) $snick($chan,1) $snick($chan,2) $snick($chan,2) } | else { var %mass = -1 | :start | inc %mass 2 | if (%mass > $snick($chan,0)) { unset %mass | return } | mode $chan -h+v-h+v $snick($chan,%mass) $snick($chan,%mass) $snick($chan,$calc(%mass + 1)) $snick($chan,$calc(%mass + 1)) | goto start } }
  if ($1 == +v) { if ($snick($chan,0) <= 4) { mode $chan +vvvv $snick($chan,1) $snick($chan,2) $snick($chan,3) $snick($chan,4) } | else { var %mass = -3 | :start | inc %mass 4 | if (%mass > $snick($chan,0)) { unset %mass | return } | mode $chan +vvvv $snick($chan,%mass) $snick($chan,$calc(%mass + 1)) $snick($chan,$calc(%mass + 2)) $snick($chan,$calc(%mass + 3)) | goto start } }
  if ($1 == +o) { if ($snick($chan,0) <= 4) { mode $chan +oooo $snick($chan,1) $snick($chan,2) $snick($chan,3) $snick($chan,4) } | else { var %mass = -3 | :start | inc %mass 4 | if (%mass > $snick($chan,0)) { unset %mass | return } | mode $chan +oooo $snick($chan,%mass) $snick($chan,$calc(%mass + 1)) $snick($chan,$calc(%mass + 2)) $snick($chan,$calc(%mass + 3)) | goto start } }
  if ($1 == +h) { if ($snick($chan,0) <= 4) { mode $chan +hhhh $snick($chan,1) $snick($chan,2) $snick($chan,3) $snick($chan,4) } | else { var %mass = -3 | :start | inc %mass 4 | if (%mass > $snick($chan,0)) { unset %mass | return } | mode $chan +hhhh $snick($chan,%mass) $snick($chan,$calc(%mass + 1)) $snick($chan,$calc(%mass + 2)) $snick($chan,$calc(%mass + 3)) | goto start } }
  if ($1 == kick) { if ($snick($chan,0) == 1) { kick $chan $snick($chan,1) $2- } | else { var %mass = 0 | :start | inc %mass 1 | if (%mass > $snick($chan,0)) { unset %mass | return } | if ($snick($chan,%mass) == $me) { goto start } | kick $chan $snick($chan,%mass) $2- | goto start } }
}
Addressk {
  if ($me !ison $active) { error You must be on a channel. }
  else {
    if ($1 == Address) {
      if ($3 == $null) { return }
      var %filter-ac = 0
      :start
      inc %filter-ac 1
      if ($ialchan($3,$chan,%filter-ac).nick == $me) { goto start }
      elseif ($ialchan($3,$chan,%filter-ac) != $null) {
        if ($2 == bk) { mode $chan -o+b $ialchan($3,$chan,%filter-ac).nick $mask($ialchan($3,$chan,%filter-ac),$r.glob(Invision,DefaultBan)) }
        kick $chan $ialchan($3,$chan,%filter-ac).nick $4- $+  $ilogo(X)
        goto start
      }
    }
    unset %filter-*
  }
}
filterk {
  ;                                                           ************ filterk <type> <jk/bk> <chan> <reason>
  if ($3 != $null) {
    var %ct = 1
    while (%ct <= $nick($3,0)) {
      if ($1 == Ops) { 
        if (($nick($3,%ct) isop $3) && ($nick($3,%ct) != $me)) {
          if ($2 == bk) { .mode $3 +b $address($nick($3,%ct),$r.glob(Invision,DefaultBan)) }
          kick $3 $nick($3,%ct) $4-
        }
      }
      if ($1 == NonOps) { 
        if (($nick($3,%ct) !isop $3) && ($nick($3,%ct) != $me)) {
          if ($2 == bk) { .mode $3 +b $address($nick($3,%ct),$r.glob(Invision,DefaultBan)) }
          kick $3 $nick($3,%ct) $4-
        }
      }
      if ($1 == Voice) { 
        if (($nick($3,%ct) isvo $3) && ($nick($3,%ct) != $me)) {
          if ($2 == bk) { .mode $3 +b $address($nick($3,%ct),$r.glob(Invision,DefaultBan)) }
          kick $3 $nick($3,%ct) $4-
        }
      }
      if ($1 == Commons) { 
        if (($nick($3,%ct) !isvo $3) && ($nick($3,%ct) !isop $3) && ($nick($3,%ct) != $me)) {
          if ($2 == bk) { .mode $3 +b $address($nick($3,%ct),$r.glob(Invision,DefaultBan)) }
          kick $3 $nick($3,%ct) $4-
        }
      }
      if ($1 == OpsVoices) { 
        if ((($nick($3,%ct) isvo $3) || ($nick($3,%ct) isop $3)) && ($nick($3,%ct) != $me)) {
          if ($2 == bk) { .mode $3 +b $address($nick($3,%ct),$r.glob(Invision,DefaultBan)) }
          kick $3 $nick($3,%ct) $4-
        }
      }
      if ($1 == All) { 
        if ($nick($3,%ct) != $me) {
          if ($2 == bk) { .mode $3 +b $address($nick($3,%ct),$r.glob(Invision,DefaultBan)) }
          kick $3 $nick($3,%ct) $4-
        }
      }
      if ($1 == UL) { 
        if (($nick($3,%ct) != $me) && ($level($address($nick($3,%ct),5)) <= 14)) {
          if ($2 == bk) { .mode $3 +b $address($nick($3,%ct),$r.glob(Invision,DefaultBan)) }
          kick $3 $nick($3,%ct) $4-
        }
      }
      inc %ct 1 
    }
  }
}
massinfo {
  ;                                                           ************ massinfo <type> <chan> 
  if ($2 != $null) {
    var %ct = 1
    if (($1 == whois) || ($1 == swhois)) { set %whoisCT [ $+ [ $iNetwork ] ] $snick($2,0) }
    if ($1 == dns) { set %dnsCT [ $+ [ $iNetwork ] ] $snick($2,0) }
    while (%ct <= $snick($2,0)) {
      if ($1 == whois) { 
        d.whois $snick($2,%ct)  
        .whois $snick($2,%ct) 
      }
      if ($1 == dns) { 
        .dns $snick($2,%ct) 
      }   
      if ($1 == uwho) { 
        .uwho $snick($2,%ct) 
      }   
      if ($1 == swhois) { 
        d.whois $snick($2,%ct)
        .whois $snick($2,%ct) $snick($2,%ct)
      }   
      inc %ct 1 
    }
  }
}
fserve.start { 
  ; *********************            fserve.start <Nick> <Trigger Number>
  if ($2 != $null) { 
    if ($exists($r.set( [ Fserve. [ $+ [ $2 ] ] ] ,Root.Dir))) {
      if ($r.glob(DCCmgr,DirectDCC) == On) {
        if ($address($1,5) != $null) {
          .notice $1 $c(1) $+ In order to successfully connect make sure you have your dccserver on. You can manually turn it on with the ' $c(2) $+ /dccserver +sc-f on $iif($r.glob(DCCmgr,ReversePort) != $null,$r.glob(DCCmgr,ReversePort),6060) $c(1) $+ ' command. Also make sure you have port $iif($r.glob(DCCmgr,ReversePort) != $null,$r.glob(DCCmgr,ReversePort),6060) cleared in any firewall you might be running as well. 
          set %FserveNicks [ $+ [ $iNetwork ] ] $addtok(%FserveNicks [ $+ [ $iNetwork ] ] ,$replace($1,$chr(124),$chr(160)),44)
          set %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ] [ $+ [ RDIR ] ]  $shortfn($iif($right($r.set( [ Fserve. [ $+ [ $2 ] ] ] ,Root.Dir),1) != \,$r.set( [ Fserve. [ $+ [ $2 ] ] ] ,Root.Dir) $+ \,$r.set( [ Fserve. [ $+ [ $2 ] ] ] ,Root.Dir))) 
          set %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ] [ $+ [ CWD ] ] %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ] [ $+ [ RDIR ] ]
          set %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ] [ $+ [ TRIG ] ] $2
          dcc chat $gettok($address($1,5),2,64) $+ : $+ $iif($r.glob(DCCmgr,ReversePort) != $null,$r.glob(DCCmgr,ReversePort),6060)  
        }
        else { aecho Reverse DCC Init is on but couldn't find host to make connection with }
      }
      else {
        fserve $1 99 $shortfn($r.set( [ Fserve. [ $+ [ $2 ] ] ] ,Root.Dir)) $iif($isfile($shortfn($r.set( [ Fserve. [ $+ [ $2 ] ] ] ,Welcome.File))),$shortfn($r.set( [ Fserve. [ $+ [ $2 ] ] ] ,Welcome.File))) 
      }
    }
    else { Aecho Error: File server for trigger $2 could not open because the Root Directory is invalid or no longer exists. Please set a valid directory for this trigger in File Server Manager. | Halt }
  } 
}
tdcc.send {
  if ($2 isnum 1-5) {
    if (%tsendFlag [ $+ [ $iNetwork ] ] != 1) {
      .timer -o 1 2 unset %tsendFlag [ $+ [ $iNetwork ] ]
      set %tsendFlag [ $+ [ $iNetwork ] ] 1
      if ((($r.set(TDCC. [ $+ [ $2 ] ] ,Channels) == All) || ($r.set(TDCC. [ $+ [ $2 ] ] ,Channels) == $null) || ($findtok($r.set(TDCC. [ $+ [ $2 ] ] ,Channels),$chan,1,44) isnum)) || ($3 == CTCP)) {
        if ($r.set(TDCC. [ $+ [ $2 ] ] ,Status) != On) { .notice $1 $c(1) $+ Sorry, this file offering is currently down. $ilogo | return }
        if ($calc($queue.nick($1) + $Pqueue.nick($1)) >= $r.set(TDCC,Max.Queues.Each)) { .timer 1 0 .notice $1 $c(1) $+ Sorry, there are too many sends in progress right now and you have used all your queue slots.  If you still want to get a file please wait for one to finish and try again. $ilogo | return }
        if ((($r.glob(Fserve,SmartSend) == On) && ($SSend.chk(1)) && ($send.nick($1) < $r.set(TDCC,Max.Sends.Each))) || (($r.glob(Fserve,SmartSend) != On) && ($isend(0) < $r.set(TDCC,Max.Sends.Total)) && ($send.nick($1) < $r.set(TDCC,Max.Sends.Each))) && (%NOSSend [ $+ [ $iNetwork ] ] != 1)) { 
          unset %nossend [ $+ [ $iNetwork ] ]
          .timer -o 1 0 .idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $1 " $+ [ $r.set(TDCC. [ $+ [ $2 ] ] ,Filename) ] $+ "
          .timer -o 1 0 .notice $1 $c(1) $+ Sending $c(2) $+ $r.set(TDCC. [ $+ [ $2 ] ] ,Desc) $+ $c(1) $bracket($size($file($r.set(TDCC. [ $+ [ $2 ] ] ,Filename)).size))  It has been downloaded $c(2) $+ $r.set(TDCC. [ $+ [ $2 ] ] ,Downloads) $+ $c(1) time $+ $iif($r.set(TDCC. [ $+ [ $2 ] ] ,Downloads) != 1,s) $+ . $ilogo
          .timer 1 0 if $r.set(Fserve,Logging) == On { FSlog Sending $nopath($r.set(TDCC. [ $+ [ $2 ] ] ,Filename)) $bracket($size($file($r.set(TDCC. [ $+ [ $2 ] ] ,Filename)).size)) to $address($1,5) } 
          return
        }
        else { 
          if (($r.set(DCCmgr,SecondQ) == On) && ($level($address($1,5)) >= $r.set(DCCmgr,SQlevel))) { 
            if ($calc($queue(0) + $PQueue(0)) < $r.set(TDCC,Max.Queues.Total)) {
              Pqueue.add TDCC_ [ $+ [ $2 ] ] $1 $iif($address($1,5) != $null,$address($1,5),$1) $ctime $r.set(TDCC. [ $+ [ $2 ] ] ,Filename) 
            }
            else {
              .notice $1 $c(1) $+ Sorry but the Maximum Allowed Queues of $r.set(TDCC,Max.Queues.Total) has been reached. Please try again later.
              return
            }
          }
          else { 
            if ($calc($queue(0) + $PQueue(0)) < $r.set(TDCC,Max.Queues.Total)) {
              queue.add TDCC_ [ $+ [ $2 ] ] $1 $iif($address($1,5) != $null,$address($1,5),$1) $ctime $r.set(TDCC. [ $+ [ $2 ] ] ,Filename)
            }
            else {
              .notice $1 $c(1) $+ Sorry but the Maximum Allowed Queues of $r.set(TDCC,Max.Queues.Total) has been reached. Please try again later.
              return
            }
          }
          if ($result isnum) { .timer 1 0 .notice $1 $c(1) $+ That queue already exists in queue slot $chr(35) $+ $result $+ , try another file. | return }
          .timer 1 0 .notice $1 The file has been queued in slot $iif(($level($address($1,5)) >= $r.set(DCCmgr,SQlevel) && ($r.set(DCCmgr,SecondQ) == On)),$Pqueue(0),$queue(0))
          if ($r.set(Fserve,Logging) == On) { FSlog Queued $nopath($r.set(TDCC. [ $+ [ $2 ] ] ,Filename)) $bracket($size($file($r.set(TDCC. [ $+ [ $2 ] ] ,Filename)).size)) for $address($1,5) in slot $chr(35) $+ $queue(0) } 
          return 
        }
        return
      }
    }
  }
}
FserverBan {
  if (($1 == add) && ($3 != $null)) { auser -a 7 $address($2,3) $3- | aecho $2 was added to the file server ban list $ilogo }
  elseif (($1 == add) && ($3 == $null)) { auser -a 7 $address($2,3) No Reason | aecho $2 was added to the file server ban list $ilogo }
  elseif (($1 == del) && ($2 != $null)) { ruser $address($2,3) }
  elseif (($1 == clr) && ($2 == $true)) { rlevel 7 }
  else { error Syntax: /FserverBan <add|del|clr> [nick] [reason] }

}
ratefix { if (($1 < 0) || ($1 !isnum)) { return n/a } | if ($r.glob(Invision,Ratefixon) == On) { if ($round($calc($1 / 1000000),1) >= 1) { return $round($calc($1 / 1048576),1) MB/s } | if ($round($calc($1 / 1000),1) >= 1) { return $round($calc($1 / 1024),1) KB/s } | return $int($1) cps } | else { return $1- $+ cps } }
NickListCLR {
  NickColorClr
  var %ct = 1
  while (%ct <= $scon(0)) {
    if ($scon(%ct).me != $null && $scon(%ct).me != YourNick) {
      .cnick $scon(%ct).me $r.glob(Nick.Colors,Color.4) 
    }
    inc %ct 1
  }
  .cnick $ $+ me $r.glob(Nick.Colors,Color.4)   
  .cnick * $r.glob(Nick.Colors,Color.13) $chr(126)
  .cnick * $r.glob(Nick.Colors,Color.14) $chr(33)
  .cnick * $r.glob(Nick.Colors,Color.15) $chr(38)
  .cnick * $r.glob(Nick.Colors,Color.1) @ 
  .cnick * $r.glob(Nick.Colors,Color.2) %
  .cnick * $r.glob(Nick.Colors,Color.3) + 
  .cnick * $r.glob(Nick.Colors,Color.0) 
  NickListReset
}
UserListCLR {
  NickColorClr
  .cnick $iif($me != $null,$me,$ $+ me) $r.glob(Nick.Colors,Color.4)
  .cnick -a * $r.glob(Nick.Colors,Color.5) * 30
  .cnick -a * $r.glob(Nick.Colors,Color.6) * 20
  .cnick -a * $r.glob(Nick.Colors,Color.7) * 17
  .cnick -a * $r.glob(Nick.Colors,Color.8) * 15
  .cnick -a * $r.glob(Nick.Colors,Color.9) * 13
  .cnick -a * $r.glob(Nick.Colors,Color.10) * 7
  .cnick -a * $r.glob(Nick.Colors,Color.11) * 5
  .cnick -i * $r.glob(Nick.Colors,Color.12)
  NickListReset
}
NickColorClr {
  .cnick -r $iif($me != $null,$me,$ $+ me) 
  var %tot = $cnick(0)
  var %ct = 1
  while (%ct <= %tot) {
    .cnick -r *
    inc %ct 1
  }
}
NickListReset {
  var %ChanTot = $chan(0)
  var %ct = 1
  while (%ct <= %ChanTot) {
    var %nicktot = $nick($chan(%ct),0)
    var %ict = 1
    while (%ict <= %nicktot) {
      .cline -r $chan(%ct) %ict
      inc %ict 1
    }
    inc %ct 1
  }
}
gainops {
  if ($r.set(Invision,Gainops) == On) {
    var %tmpTotal = $chan(0)
    var %ct = 1
    :loop
    var %tmpChan = $chan(%ct)
    if ($nick(%tmpChan,0) == 1) { if ($me !isop %tmpChan) { echo $ilogo 8GAINING OPS IN CHANNEL: %tmpChan | if ($r.set(Invision,SndOpt10) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound10) } | .timerGO2 $+ $iNetwork 1 2 .join %tmpChan | .timerGO1 $+ $iNetwork 1 1 .join %tmpChan | if $me ison %tmpChan { .part %tmpChan } | .join %tmpChan } }
    if (%ct >= %tmpTotal) { goto leave }
    inc %ct 1
    goto loop
    :leave
  }
}
testsnd { .splay $shortfn($mircdir) $+ $r.glob(Themes,Sound27) }
poperror { /dialog -mrov PopError PopError }
perror { if ($1- != $null) { set %error $1- | /poperror | unset %error } }
big {
  if ($1 isnum) {
    var %size = $1- 
    if ($len(%size) <= 3) { var %kb = B | goto end }
    if ($len(%size) <= 6) { var %kb = Kb | var %size = $calc(%size / 1000) | var %size = $round(%size,1) | goto end }
    if ($len(%size) <= 9) { var %kb = Mb | var %size = $calc(%size / 1000000) | var %size = $round(%size,2) | goto end }
    if ($len(%size) <= 12) { var %kb = Gb | var %size = $calc(%size / 1000000000) | var %size = $round(%size,2) | goto end }
    :end
    return %size $+ %kb
  }
  else {
    if ($exists($1-) != $true) { return N/A | goto leave }
    if ($exists($1-)) {
      var %size = $lof($1-) 
      if ($len(%size) <= 3) { var %kb = B | goto end }
      if ($len(%size) <= 6) { var %kb = Kb | var %size = $calc(%size / 1000) | var %size = $round(%size,1) | goto end }
      if ($len(%size) <= 9) { var %kb = Mb | var %size = $calc(%size / 1000000) | var %size = $round(%size,2) | goto end }
      if ($len(%size) <= 12) { var %kb = Gb | var %size = $calc(%size / 1000000000) | var %size = $round(%size,2) | goto end }
      :end
      return %size $+ %kb
    }
  }
  :leave
}
jhandy { if ($isfile($shortfn($mircdirTEXT\JackHand.txt))) { return $read($shortfn($mircdir) $+ TEXT\JackHand.txt) } }
decipher {
  if ($1 != $null) {
    if ($left($1,3) == §€¥) {
      return $decrypt($1)
    }
    if ($left($1,3) == §Å¥) {
      return $decrypt2($1)
    }
    return $1
  }
}
dblclknick {
  if ($1 != $me) {
    if (($r.set(Nick.Complete,Status) == On) && ($2 != 3)) {
      .respond $1
    }
    else {
      query $1
    }
  }
}
rainbow {
  if ($1 != $null) {
    return 2,2 12,12 10,10 3,3 9,9 8,8 7,7 4,4 5,5 6,6 13,13   $1   13,13 6,6 5,5 4,4 7,7 8,8 9,9 3,3 10,10 12,12 2,2.
  }
}
rbow {
  say $rainbow($1-)
}
FSpause {
  if ($r.set(Fserve,Pause) == On) {
    w.set Fserve Pause Off 
    Set %FSpause [ $+ [ $iNetwork ] ] Pause
    if (%FSpOldTmr [ $+ [ $iNetwork ] ] != $null) && ($r.set(Fserve,SilentMode) != On) { .timerFserve $+ $iNetwork -o 0 $calc( [ $r.set(Fserve,Ad.Delay) ] * 60) fserve.ad }
    .timer 1 0 queue.send
    aecho The File Server has been resumed
    if ($exists( [ $r.glob(Themes,SwitchBar1) ] )) { background -h $r.glob(Themes,SwitchBar1) }
    close -f *
  }
  else {
    w.set Fserve Pause On
    Set %FSpause [ $+ [ $iNetwork ] ] Resume
    set %FSpOldTmr [ $+ [ $iNetwork ] ] $timer(fserve [ $+ [ $iNetwork ] ] )
    .timerfserve $+ $iNetwork off
    RequeueSends PAUSE
    aecho The File Server has been paused
    if ($exists( [ $r.glob(Themes,SwitchBar2) ] )) { background -h $r.glob(Themes,SwitchBar2) }
  }
  setsaved fserve
}
DCCWin { if ($window(@DCC_Info) == $null) { window -nk0az @DCC_Info -1 -1 550 300 @DCC_Info } | else { window -a @DCC_Info } }
DCCWinAdd {
  if ($1 != $null) {
    if ($window(@DCC_Info) == $null) { DCCWin }
    var %indent = $iif($r.glob(Fserve,DateWinIndentValue) != $null && $r.glob(Fserve,DateWinIndent) == On,$r.glob(Fserve,DateWinIndentValue),0)
    if ($r.glob(Fserve,OpenFile) == 1 && $r.glob(Fserve,OpenLocation) == 1) { var %open = 04{Open File} {Open Location} }
    elseif ($r.glob(Fserve,OpenFile) == 1) { var %open = 04{Open File} }
    elseif ($r.glob(Fserve,OpenLocation) == 1) { var %open = 04{Open Location} }
    if ($r.glob(Fserve,DateWin) == On && %dccdate != $date(mmddyy)) { aline -p @DCC_Info $str( $+ $chr(32),%indent) $+ $c(1) $+ ----- $+ $c(2) $+ $date($r.glob(Fserve,DateWinFormat)) $+ $c(1) $+ ----- | set %dccdate $date(mmddyy) }
    aline -p @DCC_Info $iif($r.set(Fserve,DotWin) == On,$iif($1 == Failed,04•,09•)) $ts $chr(91) $+ $iNetwork $+ $chr(93) $c(1) $+ $1- $iif(Successfully Received isin $1-,%open)
    if ($r.set(Fserve,LogWin) == On) {
      var %logfn = $shortfn($logdir) $+ @DCC_Info $+ . $+ $time(yyyy) $+  $time(mm) $+ $time(dd)) $+ .log
      .write %logfn $chr(91) $+ $iNetwork $+ $chr(93) $1- 
    }
  }
}
AddonLOAD { 
  if ($1 != $null) {
    .load -rs1 $1-
    w.glob Invision ScriptList $addtok($r.glob(Invision,Scriptlist),$nopath($1-),44)
    var %loadCT = 1
    while (%loadCT <= $ini($1-,Dependants,0)) {
      .load [ - [ $+ [ $readini $1- Dependants $ini($1-,Dependants,%loadct) ] ] ] $ini($1-,Dependants,%loadct)
      w.glob Invision ScriptList $addtok($r.glob(Invision,Scriptlist),$nopath($ini($1-,Dependants,%loadct)),44)
      inc %loadct 1
    }
  }
}
AddonUNLOAD {
  if ($1 != $null) {
    .unload -rs $1-
    w.glob Invision ScriptList $remtok($r.glob(Invision,Scriptlist),$nopath($1-),1,44)
    var %loadCT = 1
    while (%loadCT <= $ini($1-,Dependants,0)) {
      .unload [ - [ $+ [ $readini $1- Dependants $ini($1-,Dependants,%loadct) ] ] ] $ini($1-,Dependants,%loadct)
      w.glob Invision ScriptList $remtok($r.glob(Invision,Scriptlist),$nopath($ini($1-,Dependants,%loadct)),1,44)
      inc %loadct 1
    }
  }
}
USDstat {
  if ($r.set(Colors,Logo) == On) { set %logoclr $c(2) | goto done }
  if ($r.set(Colors,Colors) == On) { set %logoclr $c(1) | goto done }
  if ($r.glob(Invision,USD) == $null) { set %logoclr 12 | goto done }
  set %logonum $int($calc(((($ctime - $r.glob(Invision,USD)) / 60) / 60) / 24))
  if (%logonum > 360) { set %logoclr 04 | goto done }
  if (%logonum > 330) { set %logoclr 11 | goto done }
  if (%logonum > 300) { set %logoclr 14 | goto done }
  if (%logonum > 270) { set %logoclr 02 | goto done }
  if (%logonum > 240) { set %logoclr 10 | goto done }
  if (%logonum > 210) { set %logoclr 07 | goto done }
  if (%logonum > 180) { set %logoclr 13 | goto done }
  if (%logonum > 150) { set %logoclr 09 | goto done }
  if (%logonum > 120) { set %logoclr 08 | goto done }
  if (%logonum > 90) { set %logoclr 03 | goto done }
  if (%logonum > 60) { set %logoclr 05 | goto done }
  if (%logonum > 30) { set %logoclr 06 | goto done }
  set %logoclr 12
  :done
  w.set colors LogoClr %logoclr
}
UserInfo {
  if ($window(@UserInfo) == $null) { /window -nk0 +l @UserInfo -1 -1 500 350 }
  aline -p @UserInfo $chr(91) $+ $iNetwork $+ $chr(93) $c(1) $+ $1-
  var %logfn = $shortfn($logdir) $+ @UserInfo $+ . $+ $time(yyyy) $+  $time(mm) $+ $time(dd)) $+ .log
  .write %logfn $chr(91) $+ $iNetwork $+ $chr(93) $1- 
}
NickAlert {
  if ($window(@NickAlert) == $null) { /window -nk0 +l @NickAlert -1 -1 500 350 }
  aline -p @NickAlert $chr(91) $+ $iNetwork $+ $chr(93) $c(1) $+ $1-
  if ($r.set(Nick.Alert,Log) == On) {
    var %logfn = $shortfn($logdir) $+ @NickAlert $+ . $+ $time(yyyy) $+  $time(mm) $+ $time(dd)) $+ .log
    .write %logfn $chr(91) $+ $iNetwork $+ $chr(93) $1- 
  }
}
ScanResults {
  if ($window(@ScanResults) == $null) { /window -k0 +l @ScanResults -1 -1 600 400 }
  aline -p @ScanResults $c(1) $+ $1-
  var %logfn = $shortfn($logdir) $+ @ScanResults $+ . $+ $time(yyyy) $+  $time(mm) $+ $time(dd)) $+ .log
  .write %logfn $1- 
}
FSxplog {
  var %logfn = $shortfn($logdir) $+ @FileServerExplorer $+ . $+ $time(yyyy) $+  $time(mm) $+ $time(dd)) $+ .log
  .write %logfn $eval($c(1) $+ $chr(91) $+ $time(ddd h:nntt) $+ $chr(93) $+ $c(2),2) $chr(91) $+ $iNetwork $+ $chr(93)  $1- 
}
ImpWiz {
  if ($dialog(ImpWiz) == $null) { dialog -m ImpWiz ImpWiz }
  did -a ImpWiz 50 $1-
  did -c ImpWiz 50 $did(ImpWiz,50).lines
}
INews {
  if ($1 != $null) {
    if ($dialog(INews) == $null) { dopen INews INews }
    did -a INews 101 $iif($1- != -,$1-,$chr(32)) $crlf
  }
}
check {
  if ($2 isnum 1-5) {
    if ($1 == FTP) { if ($check.h(ftp,$2) != $null) { error The FTP Ad is not correctly set up $chr(35) $+ $2 $+ . $bracket($left($check.h(FTP,$2),-5)) } }
    if ($1 == TDCC) { if ($check.h(tdcc,$2) != $null) { error The TDCC is not correctly set up $chr(35) $+ $2 $+ . $bracket($left($check.h(TDCC,$2),-5)) } }
  }
  else {
    if ($1 == Fserve) { if ($check.h(fserve) != $null) { error You didn't set any of the folllowing required items correctly to start the File Server. $bracket($left($check.h(Fserve),-5)) } }
    if ($1 == mp3serv) { if ($check.h(mp3serv) != $null) { error You didn't set any of the folllowing required items correctly to start the mp3 Server. $bracket($left($check.h(mp3serv),-5)) } }
    if ($1 == XDCC) { if ($check.h(xdcc) != $null) { error You didn't set any of the folllowing required items correctly to start the XDCC. $bracket($left($check.h(XDCC),-5)) } }
    if ($1 == Request) { if ($check.h(request) != $null) { error You didn't set any of the folllowing required items correctly to start the Request Ad. $bracket($left($check.h(Request),-5)) } }
  }
}
check.h {
  if ($1 == FTP) && ($2 isnum 1-5) { return $iif($r.set(FTP. [ $+ [ $2 ] ] ,Login) == $null,Login & ) $+ $iif($r.set(FTP. [ $+ [ $2 ] ] ,Password) == $null,Password & ) $+ $iif($isnum($r.set(FTP. [ $+ [ $2 ] ] ,Port)) != $true,Port & ) $+ $iif($isnum($r.set(FTP. [ $+ [ $2 ] ] ,Max.Users)) != $true,Max Users & ) }
  elseif ($1 == TDCC) && ($2 isnum 1-5) { return $iif($isnum($r.set(TDCC,Max.Sends.Total)) != $true,Max Sends Total & ) $+ $iif($isnum($r.set(TDCC,Max.Sends.Each)) != $true,Max Sends Each & ) $+ $iif($isnum($r.set(TDCC,Max.Queues.Total)) != $true,Max Queues Total & ) $+ $iif($isnum($r.set(TDCC,Max.Queues.Each)) != $true,Max Queues Each & ) $+ $iif($r.set(TDCC. [ $+ [ $2 ] ] ,Trigger) == $null,Trigger & ) $+ $iif($r.set(TDCC. [ $+ [ $2 ] ] ,Filename) == $null,Filename & ) $+ $iif($r.set(TDCC. [ $+ [ $2 ] ] ,Desc) == $null,Description & ) }
  elseif ($1 == Fserve) { return $iif($isnum($r.set(Fserve,Max.Sends.Total)) != $true,MaxSendsTotal & ) $iif($isnum($r.set(Fserve,Max.Sends.Each)) != $true,Max Sends Each & ) $+ $iif($isnum($r.set(Fserve,Max.Queues.Total)) != $true,MaxQueuesTotal & ) $iif($isnum($r.set(Fserve,Max.Queues.Each)) != $true,Max Queues Each & ) $+ $iif($fserve.ad.triggers.h(all) == $null,Active Triggers & ) $+ $FserveChk }
  elseif ($1 == mp3serv) { return $iif($isnum($r.set(mp3serv,Max.Sends.Total)) != $true,MaxSendsTotal & ) $iif($isnum($r.set(mp3serv,Max.Sends.Each)) != $true,Max Sends Each & ) $+ $iif($isnum($r.set(mp3serv,Max.Queues.Total)) != $true,MaxQueuesTotal & ) $iif($istable(mp3list [ $+ [ $iSetwork ] ] ) != $true,No mp3 Index Built & ) $iif($isnum($r.set(mp3serv,Max.Queues.Each)) != $true,Max Queues Each & ) $+ $iif($mp3serv.ad.trigger == $null,Active Trigger & ) }
  elseif ($1 == XDCC) { return $iif($isnum($r.set(XDCC,Max.Sends.Total)) != $true,Max Sends Total & ) $+ $iif($isnum($r.set(XDCC,Max.Sends.Each)) != $true,MaxSendsEach & ) $iif($isnum($r.set(XDCC,Max.Queues.Total)) != $true,MaxQueues Total & ) $+ $iif($isnum($r.set(XDCC,Max.Queues.Each)) != $true,MaxQueuesEach) $iif($isnum($xdcc.packs) != $true,Packs & ) }
  elseif ($1 == Request) { return $iif($r.set(Request,Request) == $null,Request & ) }
}
ad { advertise $1- }
advertise { 
  if (($2 == Fserve || $2 == mp3serv || $2 == TDCC || $2 == XDCC) && ($1 == Start || $1 == Say || $1 == Silent || $1 == Notice)) { if ($readini($mircdir\mirc.ini,local,localip) == $null) { ERROR Users will not be able to access your server because you do not have an IP address set in Alt-O > Connect > Local Info. } }
  if ($2 == Fserve) {
    if ($1 == Start) { w.set Fserve SilentMode Off | if ($check.h(fserve) != $null) { check fserve } | else { if ($r.set(Invision,SndOpt24) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound25) } | .timerFserveClose $+ $iNetwork off | w.set Fserve Status On | w.set Fserve Listen On | if $r.set(Fserve,Logging) == On { FSlog The File Server was Started. } | if ($r.set(Fserve,SilentMode) != On) { /.timerFserve $+ $iNetwork 0 $iif($isnum($r.set(Fserve,Ad.Delay)) == $true,$calc( [ $r.set(Fserve,Ad.Delay) ] * 60),1800) fserve.ad | fserve.ad } | if $r.set(Fserve,Pause) == On { set %FSpause [ $+ [ $iNetwork ] ] Resume } | else { set %FSpause [ $+ [ $iNetwork ] ] Pause } | aecho $c(1) $+ The File Server has been started. } }
    if ($1 == Stop) { w.set Fserve Status Off | w.set Fserve Listen Off | .timerFserve $+ $iNetwork Off | if $exists( [ $r.glob(Themes,SwitchBar1) ] ) { background -h $r.glob(Themes,SwitchBar1) } | unset %FSpause [ $+ [ $iNetwork ] ] | .timerFserveClose $+ $iNetwork off | aecho $c(1) $+ The File Server has been shut down. | if $3 != $null { FserveAnnounce $3- } | if $r.set(Fserve,Logging) == On { FSlog The File Server was Stopped. } | if ($r.set(Invision,SndOpt24) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound26) } }
    if ($1 == Close) { w.set Fserve Listen Off | .timerFserve $+ $iNetwork Off | .timerFserveClose $+ $iNetwork -o 0 60 checkq | if $exists( [ $r.glob(Themes,SwitchBar1) ] ) { background -h $r.glob(Themes,SwitchBar1) } | unset %FSpause [ $+ [ $iNetwork ] ] | aecho $c(1) $+ The File Server is shutting down, Finishing whats left in the queues. | if $3 != $null { FserveAnnounce $3- } | if $r.set(Fserve,Logging) == On { FSlog The File Server was Closed. } | if ($r.set(Invision,SndOpt24) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound26) } }
    if ($1 == Silent) { w.set Fserve SilentMode On | if ($check.h(fserve) != $null) { check fserve } | else { if ($r.set(Invision,SndOpt24) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound25) } | .timerFserveClose $+ $iNetwork off | w.set Fserve Status On | w.set Fserve Listen On | if $r.set(Fserve,Logging) == On { FSlog The File Server was Started. } | if ($r.set(Fserve,SilentMode) != On) { /.timerFserve $+ $iNetwork 0 $iif($isnum($r.set(Fserve,Ad.Delay)) == $true,$calc( [ $r.set(Fserve,Ad.Delay) ] * 60),1800) fserve.ad | fserve.ad } | if $r.set(Fserve,Pause) == On { set %FSpause [ $+ [ $iNetwork ] ] Resume } | else { set %FSpause [ $+ [ $iNetwork ] ] Pause } | aecho $c(1) $+ The File Server has been started. } }
    if ($1 == Say) { if ($check.h(fserve) != $null) { check fserve } | else { say $fserve.ad.temp($3) | if ( $r.set(Fserve,TwoLineAd) == On && $r.set(Fserve,Note) ) { say $fserve.ad.temp.note } } }
    if ($1 == Notice) { if ($check.h(fserve) != $null) { check fserve } | elseif ($strip($gettok($fserve.ad.temp($3),4,32)) != Triggers:«») { .notice $4 $fserve.ad.temp($3) | if ( $r.set(Fserve,TwoLineAd) == On && $r.set(Fserve,Note) ) { .notice $4 $fserve.ad.temp.note } } | else .notice $4 $c(2) $+ Fserve is currently offline in $3 $+ . }
  }
  if ($2 == mp3serv) {
    if ($1 == Start) { if ($check.h(mp3serv) != $null) { check mp3serv } | else { if ($r.set(Invision,SndOpt24) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound37) } | w.set mp3serv Status On | w.set mp3serv Listen On | if ($isnum($r.set(mp3serv,AdDelay)) == $true) { .timermp3serv $+ $iNetwork 0 $calc( [ $r.set(mp3serv,AdDelay) ] * 60) mp3serv.ad } | mp3serv.ad | if $r.set(mp3serv,Pause) == On { set %mp3pause [ $+ [ $iNetwork ] ] Resume } | else { set %mp3pause [ $+ [ $iNetwork ] ] Pause } | aecho $c(1) $+ The mp3 Server has been started. } }
    if ($1 == Stop) { w.set mp3serv Status Off | w.set mp3serv Listen Off | .timermp3serv $+ $iNetwork Off | if $exists( [ $r.glob(Themes,SwitchBar1) ] ) { background -h $r.glob(Themes,SwitchBar1) } | unset %mp3pause [ $+ [ $iNetwork ] ] | aecho $c(1) $+ The mp3 Server has been shut down. | if $3 != $null { mp3servAnnounce $3- } | if ($r.set(Invision,SndOpt24) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound38) } }
    if ($1 == Close) { w.set mp3serv Listen Off | .timermp3serv $+ $iNetwork Off | .timermp3servClose $+ $iNetwork -o 0 60 checkq | unset %mp3pause [ $+ [ $iNetwork ] ] | aecho $c(1) $+ The mp3 Server is shutting down, Finishing whats left in the queues. | if $3 != $null { mp3servAnnounce $3- } | if ($r.set(Invision,SndOpt24) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound38) } }
    if ($1 == Silent) { if ($check.h(mp3serv) != $null) { check mp3serv } | else { if ($r.set(Invision,SndOpt24) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound37) } | w.set mp3serv Status On | w.set mp3serv Listen On | if $r.set(mp3serv,Pause) == On { set %mp3pause [ $+ [ $iNetwork ] ] Resume } | else { set %mp3pause [ $+ [ $iNetwork ] ] Pause } | aecho $c(1) $+ The mp3 Server has been started. | .timermp3serv $+ $iNetwork off } }
    if ($1 == Say) { if ($check.h(mp3serv) != $null) { check mp3serv } | else { w.set mp3serv Status On | say $mp3serv.ad.temp } }
  }
  elseif ($2 == FTP) {
    if ($3 isnum 1-5) {
      if ($1 == Start) { if ($check.h(ftp,$3) != $null) { check ftp $3 } | else { if ($isnum($r.set(FTP. [ $+ [ $3 ] ] ,Ad.Delay)) == $true) { .timerFTP. $+ $3 $+ $iNetwork -o 0 $calc( [ $r.set(FTP. [ $+ [ $3 ] ] ,Ad.Delay) ] * 60) ftp.ad $3 } | ftp.ad $3 | w.set [ FTP. [ $+ [ $3 ] ] ] Status On | aecho $c(1) $+ FTP $chr(35) $+ $3 has been started. } }
      if ($1 == Stop) { .timerFTP. $+ $3 $+ $iNetwork Off | w.set [ FTP. [ $+ [ $3 ] ] ] Status Off | aecho $c(1) $+ FTP $chr(35) $+ $3 has been shut down. }
      if ($1 == Say) { if ($check.h(ftp,$3) != $null) { check ftp $3 } | else { say $ftp.ad.temp($3) } }
      if ($1 == Notice) { if ($check.h(ftp,$3) != $null) { check ftp $3 } | else { notice $4 $ftp.ad.temp($3) } }
    }
  }
  elseif ($2 == TDCC) {
    if ($3 isnum 1-5) {
      if ($1 == Start) { if ($check.h(tdcc,$3) != $null) { check tdcc $3 } | else { w.set TDCC. $+ $3 Status On | if ($isnum($r.set(TDCC. [ $+ [ $3 ] ] ,Ad.Delay)) == $true) { .timerTDCC. $+ $3 $+ $iNetwork -o 0 $calc( [ $r.set(TDCC. [ $+ [ $3 ] ] ,Ad.Delay) ] * 60) tdcc.ad $3 } | tdcc.ad $3 | aecho $c(1) $+ TDCC $chr(35) $+ $3 has been started. } }
      if ($1 == Stop) { w.set TDCC. $+ $3 Status Off | .timerTDCC. $+ $3 $+ $iNetwork Off | aecho $c(1) $+ TDCC $chr(35) $+ $3 has been shut down. }
      if ($1 == Silent) { if ($check.h(tdcc,$3) != $null) { check tdcc $3 } | else { w.set TDCC. $+ $3 Status On | aecho $c(1) $+ TDCC $chr(35) $+ $3 has been started. } }
      if ($1 == Say) { if ($check.h(tdcc,$3) != $null) { check tdcc $3 } | else { w.set TDCC. $+ $3 Status On | say $tdcc.ad.temp($3) } }
    }
  }
  elseif ($2 == XDCC) {
    if ($3 isnum 1-2) {
      if ($1 == Start && %xdcc.silent. [ $+ [ $iNetwork ] ] != On) { if ($check.h(xdcc) != $null) { check xdcc } | else { w.set XDCC Status On | if ($isnum($r.set(XDCC,Ad.Delay)) == $true) { .timerXDCC $+ $iNetwork -o 0 $calc( [ $r.set(XDCC,Ad.Delay) ] * 60) xdcc.ad $3 } | aecho $c(1) $+ XDCC has been started. | xdcc.ad.temp $3 say } }
      if ($1 == Say) { if ($check.h(xdcc) != $null) { check xdcc } | else { w.set XDCC Status On | xdcc.ad.temp $3 say } }
    }
    else {
      if ($1 == Stop) { w.set XDCC Status Off | .timerXDCC $+ $iNetwork Off | aecho $c(1) $+ XDCC has been shut down. | if $3 != $null { xdccannounce $3- } }
      if ($1 == Silent) { if ($check.h(xdcc) != $null) { check xdcc } | else { w.set XDCC Status On | aecho $c(1) $+ XDCC has been started. } }
    }
  }
  elseif ($2 == Request) {
    if ($1 == Start) { if ($check.h(request) != $null) { check request } | else { if ($isnum($r.set(Request,Ad.Delay)) == $true) { .timerRequest $+ $iNetwork -o 0 $calc( [ $r.set(Request,Ad.Delay) ] * 60) request.ad } | request.ad | aecho $c(1) $+ Request Ad has been started. } }
    if ($1 == Stop) { .timerRequest $+ $iNetwork Off | aecho $c(1) $+ Request Ad has been stopped. }
    if ($1 == Say) { if ($check.h(request) != $null) { check request } | else { say $request.ad.temp } }
  }
  elseif ($2 == Announcer) {
    if ($1 == Start) { if ($check.h(Announcer) != $null) { check Announcer } | else { if ($isnum($r.set(Announcer,Ad.Delay)) == $true) { .timerAnnouncer $+ $iNetwork -o 0 $calc( [ $r.set(Announcer,Ad.Delay) ] * 60) Announcer.ad } | Announcer.ad | aecho $c(1) $+ Announcer has been started. } }
    if ($1 == Stop) { .timerAnnouncer $+ $iNetwork Off | aecho $c(1) $+ Announcer has been stopped. }
    if ($1 == Say) { if ($check.h(Announcer) != $null) { check Announcer } | else { say $Announcer.ad.temp } }
  }
}
getid3 {
  if ($insong.fname != %i.LastSong) {
    unset %i.LastSong.*
    var %cnt = 1, %tot = $sound($insong.fname).tag
    while (%cnt <= %tot) {
      var %tag = $left($sound($insong.fname,%cnt).tag,300)
      if ($gettok(%tag,1,32) == TIT2) { set %i.LastSong.title $gettok(%tag,2-,32) }
      elseif ($gettok(%tag,1,32) == TPE1) { set %i.LastSong.artist $gettok(%tag,2-,32) }
      elseif ($gettok(%tag,1,32) == TALB) { set %i.LastSong.album $gettok(%tag,2-,32) }
      elseif ($gettok(%tag,1,32) == TYER) { set %i.LastSong.year $iif($gettok(%tag,2-,32) isnum 1000-2500,$v1) }
      elseif ($gettok(%tag,1,32) == TCON) { set %i.LastSong.genre $gettok(%tag,2-,32) }
      elseif ($gettok(%tag,1,32) == COMM) { set %i.LastSong.comment $gettok(%tag,3-,32) }
      inc %cnt
    }
    set %i.LastSong $insong.fname
  }
  var %title = %i.LastSong.title, %artist = %i.LastSong.artist, %album = %i.LastSong.album, %year = %i.LastSong.year, %genre = %i.LastSong.genre, %comment = %i.LastSong.comment
  if ($1 == title) { return $iif(%title,$v1,$sound($insong.fname).title) }
  elseif ($1 == artist) { return $iif(%artist,$v1,$sound($insong.fname).artist) }
  elseif ($1 == album) { return $iif(%album,$v1,$sound($insong.fname).album) }
  elseif ($1 == year) { return $iif(%year,$v1,$iif($sound($insong.fname).year isnum 1000-2500,$sound($insong.fname).year)) }
  elseif ($1 == genre) {
    var %genre.f = $iif(%genre,$v1,$sound($insong.fname).genre)
    if ($chr(40) isin %genre.f && $chr(41) isin %genre.f && $gettok($gettok(%genre.f,1,40),1,41) isnum && $gettok(%genre.f,2,41)) { var %genre.f = $right(%genre.f,- $+ $pos(%genre.f,$chr(41))) }
    elseif ($chr(40) isin %genre.f && $chr(41) isin %genre.f && $gettok($gettok(%genre.f,1,40),1,41) isnum && !$gettok(%genre.f,2,41)) { var %genre.f = $sound($insong.fname).genre }
    return %genre.f
  }
  elseif ($1 == comment) { return $iif(%comment,$v1,$sound($insong.fname).comment) }
}
show {
  if (($me ison $active) || ($query($active) != $null) || ($chat($right($active,-1)) != $null) || ($fserv($right($active,-1)) != $null)) {
    if ($1 == Script) { 
      if ($r.set(Invision,Stealth) != On) {
        me $C(1) $+ is running $ilogo $C(1) $+ $r.static(Script,Version) $r.static(Script,build) with $r.static(Script,Features) by12 $r.static(Script,Author) $C(1) $+ on mIRC v [ $+ [ $version ] ] [ [ $bits ] $+ ] bit obtained from $C(2) $+ #Invision on irc.irchighway.net $c(1) and $c(2) $r.static(Script,WebPage)
      }
      else { aecho Cannot Advertise Script while in Stealth Mode. You can turn it off in Main Settings on the General Tab } 
    }
    elseif ($1 == MassScript) { 
      if ($r.set(Invision,Stealth) != On) {
        ame $C(1) $+ is running $ilogo $C(1) $+ $r.static(Script,Version) $r.static(Script,build) with $r.static(Script,Features) by12 $r.static(Script,Author) $C(1) $+ on mIRC v [ $+ [ $version ] ] [ [ $bits ] $+ ] bit obtained from $C(2) $+ #Invision on irc.irchighway.net $c(1) and $c(2) $r.static(Script,WebPage)
      }
      else { aecho Cannot Advertise Script while in Stealth Mode. You can turn it off in Main Settings on the General Tab } 
    }
    elseif ($1 == Homepage) { 
      if ( $isset($r.set(Personal.Info,Webpage)) != n/a ) { say $c(2) $+ Homepage Info $c(1) $+ $sv(Address,$isset($r.set(Personal.Info,Webpage)))  $+ $ilogo } 
      else { error No Homepage entered in the Invision menu > Personalization > Info }
    }
    elseif ($1 == Email) { 
      if ( $isset($r.set(Personal.Info,Email)) != n/a ) { say $c(2) $+ Email Info $c(1) $+ $sv(Address,$isset($r.set(Personal.Info,Email)))  $+ $ilogo } 
      else { error No Email entered in the Invision menu > Personalization > Info }
    }
    elseif ($1 == IM) {
      if ($isset($r.set(Personal.Info,AIM)) == n/a && $isset($r.set(Personal.Info,ICQ)) == n/a && $isset($r.set(Personal.Info,Skype)) == n/a && $isset($r.set(Personal.Info,Yahoo)) == n/a) { error No IM information entered in the Invision menu > Personalization > Info }
      else { say $c(2) $+ IM Info $c(1) $+ $iif($isset($r.set(Personal.Info,AIM)) != n/a,$sv(AIM,$isset($r.set(Personal.Info,AIM)))) $iif($isset($r.set(Personal.Info,ICQ)) != n/a,$sv(ICQ,$isset($r.set(Personal.Info,ICQ)))) $iif($isset($r.set(Personal.Info,Skype)) != n/a,$sv(Skype,$isset($r.set(Personal.Info,Skype)))) $iif($isset($r.set(Personal.Info,Yahoo)) != n/a,$sv(Yahoo,$isset($r.set(Personal.Info,Yahoo))))  $+ $ilogo }
    }
    elseif ($1 == Time) { say $c(2) $+ Current Time $c(1) $+ $sv(Time,$time(h:nntt)) $sv(Day,$date(dddd)) $sv(Date,$date(mmmm doo),$date(yyyy)) $sv(TimeZone,$tz)  $+ $ilogo }
    elseif ($1 == Titlebar) { say $c(2) $+ Titlebar $c(1) $+ $titlebar  $+ $ilogo }
    elseif ($1 == OS) {
      var %os = $iif(((Windows 2000 isin $dll(invision.dll,invisionOS,_)) && (Build 2600 isin $dll(invision.dll,invisionOS,_))),$replace($dll(invision.dll,invisionOS,_),2000,XP),$dll(invision.dll,invisionOS,_))
      var %os = $iif(Windows 2000 isin %os || Windows XP isin %os,$xpos $+ $right(%os,- $+ $calc($pos(%os,build) + 9)),%os)
      var %xpos = $xpos
      ;var %os = $iif(Unknown Windows NT isin %os && (Vista isin %xpos || 2008 isin %xpos || *Windows*7* iswm %xpos),%xpos,%os)
      var %os = $iif(Unknown Windows NT isin %os,%xpos,%os)
      say $c(2) $+ Operating System $c(1) $+ $sv2(Platform,%os) $sv2(UpTime,$gduration($uptime(system,3))) $sv2(Record UpTime,$gduration($r.glob(Invision,UTRecord)))  $ilogo
    }
    elseif ($1 == sys) { systemview }
    elseif ($1 == Ops) { 
      set %t.ops 0
      set %t.vos 0
      set %t.peeps 0
      set %t.chans 0
      scon -at1 OpsDisplay
      say $c(1) $+ On $c(2) $+ $scon(0) $c(1) $+ networks, I am currently Opped in $c(2) $+ %t.ops $c(1) $+ and Voiced in $c(2) $+ %t.vos $c(1) $+ out of $c(2) $+ %t.chans $c(1) $+ channels totaling $c(2) $+ %t.peeps $c(1) $+ people. $ilogo 
      unset %t.ops
      unset %t.vos
      unset %t.peeps
      unset %t.chans
    }
    elseif ($1 == Address) { if ($host != $null) { say $c(2) $+ Address $c(1) $+ $sv(IP,$ip) $sv(Host,$host) $ilogo } | else { say $c(2) $+ Address $c(1) $+ $sv(IP,$ip) $sv(Host,$ip)  $+ $ilogo } }
    elseif ($1 == Server) { 
      say $c(2) $+ Active Server Connections $c(1) $+ $sv(Accrued IRC Time,$lduration($online))  $+ $ilogo
      var %ct = 1
      while (%ct <= $scon(0)) {
        .timer 1 %ct say $c(1) $+ Connection $c(2) $+ $chr(35) $+ %ct $c(1) $+ to $c(2) $+ $scon(%ct).server $+ : $+ $scon(%ct).port $c(1) $+ on $c(2) $+ $scon(%ct).inetwork $c(1) $+ as $iif($2 == mes,$c(2) $+ $scon(%ct).me,$iif(o isin $scon(%ct).usermode,an $c(2) $+ iRC Operator,a $c(2) $+ Normal User))
        inc %ct 1
      }
    }
    elseif ($1 == IRCUptime) { say $c(1) $+ $sv(Accrued IRC Time,$lduration($online))  $+ $ilogo }
    elseif ($1 == mp3play) {
      if ($mp3isplaying == $true) {
        var %mp3announce = $r.glob(Invision,mp3announcement)
        me $c(1) $+ %mp3announce $c(2) $+ $iif($getid3(title) $+ $getid3(artist),$iif($getid3(artist),$v1 $c(2) $+ - ) $getid3(title),$mp3play.title) $+ $c(1) $+ , $iif($r.set(mp3serv,GraphicalProgress) == On,Progress Meter:,Time:) $mp3meter  $ilogo
      }
    }
    elseif ($1 == mp3play2) {
      if ($mp3isplaying == $true) {
        var %mp3announce = $r.glob(Invision,mp3announcement)
        me $c(1) $+ %mp3announce $c(2) $+ $iif($getid3(title),$v1,$mp3play.title) $iif($getid3(artist),$c(1) $+ by $+ $c(2) $getid3(artist)) $iif($getid3(album),$c(1) $+ Album: $+ $c(2) $getid3(album)) $iif($getid3(year),$c(1) $+ ( $+ $c(2) $+ $getid3(year) $+ $c(1) $+ )) $iif($getid3(genre),$c(1) $+ Genre: $+ $c(2) $getid3(genre)) $c(1) $+ $iif($r.set(mp3serv,GraphicalProgress) == On,Progress Meter:,Time:) $mp3meter  $ilogo
      }
    }
    elseif ($1 == Sends) { 
      if ($isend(0) == 0) { 
        say $c(1) $+ Currently no sends open.  $+ $ilogo 
        goto leave 
      } 
      elseif ($isend(0) == 1) { 
        say $c(1) $+ Currently 1 send open.  $+ $ilogo 
      } 
      elseif ($isend(0) > 1) { 
        say $c(1) $+ Currently $isend(0) sends open.  $+ $ilogo 
      } 
      var %sends = 0 
      :sendstart 
      inc %sends 1 
      if ($isend(%sends) == $null) { 
        unset %sends 
        goto leave 
      } 
      .timer 1 %sends say $c(1) $+ Send $chr(35) $+ %sends $+ : $c(2) $+ $isend(%sends) $+ $c(1) has $c(2) $+ $isend(%sends).pc $+ % $c(1) $+ of $+ $c(2) $isend(%sends).file $c(1) $+ $bracket($size($isend(%sends).size)) at $+ $c(2) $ratefix($isend(%sends).cps) $c(1) $+ $bracket( [ Approximately $lduration($round($calc(($isend(%sends).size - $isend(%sends).sent) / $isend(%sends).cps),0)) left ] )  $chr(91) $+ $c(2) $+ $iif($isend(%sends).status == Failed,04Failed,$iif($isend(%sends).done == $true,09Complete,10Active)) $+ $c(1) $+ $chr(93)
      goto sendstart 
    }
    elseif ($1 == Gets) { 
      if ($iget(0) == 0) { 
        say $c(1) $+ Currently no gets open.  $+ $ilogo 
        goto leave 
      } 
      elseif ($iget(0) == 1) { 
        say $c(1) $+ Currently 1 get open.  $+ $ilogo 
      } 
      elseif ($iget(0) > 1) { 
      say $c(1) $+ Currently $iget(0) gets open.  $+ $ilogo } 
      var %gets = 0 
      :getstart 
      inc %gets 1 
      if ($iget(%gets) == $null) { 
        unset %gets 
        goto leave
      } 
      .timer 1 %gets say $c(1) $+ Get $chr(35) $+ %gets $+ : $c(2) $+ $iget(%gets) $+ $c(1) has sent $c(2) $+ $iget(%gets).pc $+ % $c(1) $+ of $+ $c(2) $iget(%gets).file $c(1) $+ $bracket($size($iget(%gets).size)) at $+ $c(2) $ratefix($iget(%gets).cps) $+ $c(1) $+ . $chr(91) $+ $c(2) $+ $iif($iget(%gets).status == Failed,04Failed,$iif($iget(%gets).done == $true,09Complete,10Active)) $+ $c(1) $+ $chr(93)
      goto getstart 
    }
    elseif ($1 == Bandwidth) { say $c(2) $+ Bandwidth $c(1) $+ $sv(Currently, $ratefix($calc($gbandwidth + $bandwidth)))  $+ $ilogo }
  }

  :leave
}
fserve.ad.fitlogo {
  if ($r.set(Fserve,Verbose) == On) {
    if ($calc($len($c(2) $+ File Server Online $c(1)) + $len($fserve.ad.min.cps) + $len($fserve.ad.triggers) + $len($fserve.ad.ctcp) + $len($fserve.ad.sends) + $len($fserve.ad.queues) + $len($fserve.ad.access) + $len($fserve.ad.on) + $len($fserve.ad.record.cps) + $len($fserve.ad.bw) + $len($fserve.ad.filect) + $len($fserve.ad.aqt) + $len($fserve.ad.snagged) + $iif($r.set(Fserve,TwoLineAd) != On, $len($fserve.ad.note), 0)) >= 400) {
      return 
    }
    if ($calc($len($c(2) $+ File Server Online $c(1)) + $len($fserve.ad.min.cps) + $len($fserve.ad.triggers) + $len($fserve.ad.ctcp) + $len($fserve.ad.sends) + $len($fserve.ad.queues) + $len($fserve.ad.access) + $len($fserve.ad.on) + $len($fserve.ad.record.cps) + $len($fserve.ad.snagged) + $len($fserve.ad.bw) + $len($fserve.ad.aqt) + $len($fserve.ad.filect) + $iif($r.set(Fserve,TwoLineAd) != On, $len($fserve.ad.note), 0)) >= 350) {
      return $ilogo(X)
    }
    else { return $ilogo }
  }
  else {
    if ($calc($len($c(2) $+ File Server Online $c(1)) + $len($fserve.ad.min.cps) + $len($fserve.ad.triggers) + $len($fserve.ad.sends) + $len($fserve.ad.queues) + $len($fserve.ad.bw) + $len($fserve.ad.aqt) + $iif($r.set(Fserve,TwoLineAd) != On, $len($fserve.ad.note), 0)) >= 400) {
      return 
    }
    if ($calc($len($c(2) $+ File Server Online $c(1)) + $len($fserve.ad.min.cps) + $len($fserve.ad.triggers) + $len($fserve.ad.sends) + $len($fserve.ad.queues) + $len($fserve.ad.bw) + $len($fserve.ad.aqt) + $iif($r.set(Fserve,TwoLineAd) != On, $len($fserve.ad.note), 0)) >= 350) {
      return $ilogo(X)
    }
    else { return $ilogo }

  }
}
correctfactor { if ($r.set(Colors,Colors) == On) { return -5 } | else { return -2 } } 
fserve.ad { if (($server != $null) && ($r.set(Fserve,Status) == On)) { fadmsg $allchk($r.set(Fserve,Channels)) } }
fserve.ad.temp { 
  if ($r.set(Fserve,Verbose) == On) {
    return $c(2) $+ File Server Online $c(1) $+ $fserve.ad.triggers($1) $fserve.ad.ctcp $fserve.ad.min.cps $fserve.ad.sends $fserve.ad.queues $fserve.ad.access $fserve.ad.on $fserve.ad.record.cps $fserve.ad.snagged $fserve.ad.bw $fserve.ad.aqt $fserve.ad.filect $iif($r.set(Fserve,TwoLineAd) != On, $fserve.ad.note) $fserve.ad.fitlogo 
  }
  else {
    return $c(2) $+ File Server Online $c(1) $+ $fserve.ad.triggers($1) $fserve.ad.sends $fserve.ad.queues $fserve.ad.bw $fserve.ad.aqt $iif($r.set(Fserve,TwoLineAd) != On, $fserve.ad.note) $fserve.ad.fitlogo 

  }
}
fserve.ad.freeslot { return $bracket(File Server Slot Free) $fserve.ad.triggers($1) $fserve.ad.on $fserve.ad.sends $fserve.ad.queues $iif($r.set(Fserve,TwoLineAd) != On, $fserve.ad.note) $ilogo } 
fserve.ad.triggers { return $sv(Triggers,$left($fserve.ad.triggers.h($1),$correctfactor)) }
fserve.ad.triggers.h { 
  var %ft1 = $iif($r.set(Fserve.1,Status) == On,$c(2) $+ $iif($r.set(Fserve,CTCPonly) == On, $chr(47) $+ ctcp $me $+ $chr(32)) $+ [ [ $r.set(Fserve.1,Trigger) ] ] ) 
  var %ft2 = $iif($r.set(Fserve.2,Status) == On,$c(2) $+ $iif($r.set(Fserve,CTCPonly) == On, $chr(47) $+ ctcp $me $+ $chr(32)) $+ [ [ $r.set(Fserve.2,Trigger) ] ] )
  var %ft3 = $iif($r.set(Fserve.3,Status) == On,$c(2) $+ $iif($r.set(Fserve,CTCPonly) == On, $chr(47) $+ ctcp $me $+ $chr(32)) $+ [ [ $r.set(Fserve.3,Trigger) ] ] ) 
  var %ft4 = $iif($r.set(Fserve.4,Status) == On,$c(2) $+ $iif($r.set(Fserve,CTCPonly) == On, $chr(47) $+ ctcp $me $+ $chr(32)) $+ [ [ $r.set(Fserve.4,Trigger) ] ] ) 
  var %ft5 = $iif($r.set(Fserve.5,Status) == On,$c(2) $+ $iif($r.set(Fserve,CTCPonly) == On, $chr(47) $+ ctcp $me $+ $chr(32)) $+ [ [ $r.set(Fserve.5,Trigger) ] ] )
  var %tf1 = $iif($trigchanchk($1,1),%ft1 $iif($r.set(Fserve.1,Status) == On, $iif($r.set(Colors,Colors) != On,$chr(32),$c(1)) $+ • $+ ) $iif($r.set(Colors,Colors) == On,$chr(32)))
  var %tf2 = $iif($trigchanchk($1,2),%ft2 $iif($r.set(Fserve.2,Status) == On, $iif($r.set(Colors,Colors) != On,$chr(32),$c(1)) $+ • $+ ) $iif($r.set(Colors,Colors) == On,$chr(32)))
  var %tf3 = $iif($trigchanchk($1,3),%ft3 $iif($r.set(Fserve.3,Status) == On, $iif($r.set(Colors,Colors) != On,$chr(32),$c(1)) $+ • $+ ) $iif($r.set(Colors,Colors) == On,$chr(32)))
  var %tf4 = $iif($trigchanchk($1,4),%ft4 $iif($r.set(Fserve.4,Status) == On, $iif($r.set(Colors,Colors) != On,$chr(32),$c(1)) $+ • $+ ) $iif($r.set(Colors,Colors) == On,$chr(32)))
  var %tf5 = $iif($trigchanchk($1,5),%ft5 $iif($r.set(Fserve.5,Status) == On, $iif($r.set(Colors,Colors) != On,$chr(32),$c(1)) $+ • $+ ) $iif($r.set(Colors,Colors) == On,$chr(32)))
  return %tf1 %tf2 %tf3 %tf4 %tf5
}
trigchanchk {
  if ($2 != $null) {
    if (($istok($r.set(Fserve. [ $+ [ $2 ] ] ,Channels),$1,44)) || ($r.set(Fserve. [ $+ [ $2 ] ] ,Channels) == all) || ($r.set(Fserve,Channels) == all) || ($1 == all)) { return $true }
    else { return $false }
  }
}
fserve.ad.filect { 
  if ($r.set(Fserve,SearchCache) == On) { 
    if ($r.set(Fserve.1,Status) == On) { var %tot = $lines(invision\Settings\ $+ [ $iSetwork ] $+ \FSdir1) }
    if ($r.set(Fserve.2,Status) == On) { var %tot = $calc(%tot + $lines(invision\Settings\ $+ [ $iSetwork ] $+ \FSdir2)) }
    if ($r.set(Fserve.3,Status) == On) { var %tot = $calc(%tot + $lines(invision\Settings\ $+ [ $iSetwork ] $+ \FSdir3)) }
    if ($r.set(Fserve.4,Status) == On) { var %tot = $calc(%tot + $lines(invision\Settings\ $+ [ $iSetwork ] $+ \FSdir4)) }
    if ($r.set(Fserve.5,Status) == On) { var %tot = $calc(%tot + $lines(invision\Settings\ $+ [ $iSetwork ] $+ \FSdir5)) }
    if (%tot >= 1) { return $sv(Serving,%tot files) }
  }
  return
}
fserve.ad.snagged { return $sv(Served, [ [ $size($vnum($r.set(Fserve,Send.Bytes),0)) in $vnum($r.set(Fserve,Send.Total),0) file ] ] [ $+ [ $iif($vnum($r.set(Fserve,Send.Total),0) != 1,s) ] ] ) }
fserve.ad.min.cps { if ($r.set(Min.CPS,Rate) isnum) && ($isnum($r.set(Min.CPS,Delay)) == $true) && ($r.set(Min.CPS,Status) == On) { return $sv(Min, [ [ $ratefix($vnum($r.set(Min.CPS,Rate),0)) ] ] ) } }
fserve.ad.record.cps { return $sv(Record, [ [ $ratefix($vnum($gettok($r.set(Fserve,Record.CPS),1,32),0)) by $isset($gettok($r.set(Fserve,Record.CPS),2,32)) ] ] ) }
fserve.ad.on { return $sv(Online, [ [ $fserv(0) ] $+ ] / [ $+ [ $vnum($r.set(Fserve,Max.Serve),0) ] ] ) }
fserve.ad.sends { if ($r.glob(Fserve,SmartSend) != On) { return $sv(Sends, [ [ $isend(0) ] $+ ] / [ $+ [ $vnum($r.set(Fserve,Max.Sends.Total),0) ] ] ) } | else { return $sv(Sends, [ $isend(0) ] ) } }
fserve.ad.queues { return $sv(Queues, [ [ $calc($queue(0) + $Pqueue(0)) ] $+ ] / [ $+ [ $vnum($r.set(Fserve,Max.Queues.Total),0) ] ] ) }
fserve.ad.access { return $sv(Accessed, [ [ $vnum($r.set(Fserve,Access),0) times ] ] ) }
fserve.ad.ctcp { if (($r.set(Fserve,CTCPonly) != On) && ($chkFSctcp == $true)) { return $sv(Ctcp,On) } }
fserve.ad.bw { if ($r.set(Fserve,AdBW) == On) { return $sv(Current BW,$ratefix($bandwidth)) } }
fserve.ad.aqt { if ($r.set(Fserve,AQT) == On) { return $sv(AQT,$queuetime) } }
fserve.ad.note {  if ($r.set(Fserve,Note) != $null) { return MOTD: $c(2) $+ -= [ [ $r.set(Fserve,Note) ] ] $c(2) $+ =- $c(1) } }
texttrigchk {
  if ($2 != $null) {
    ;                                              *******************     texttrigchk(<chan>,<trigger#>)
    if (($istok($r.set(Fserve,Channels),$1,44)) || ($r.set(Fserve,Channels) == all)) {
      if (($istok($r.set(Fserve. [ $+ [ $2 ] ] ,Channels),$1,44)) || ($r.set(Fserve. [ $+ [ $2 ] ] ,Channels) == all))  { return $true }
    }
    return $false 
  }
}
fserve.ad.temp.note { if ($fserve.ad.note != $null) { return $c(2) $+ File Server Online $c(1) $+ $fserve.ad.note } }
tdcc.status { if (($r.set(TDCC.1,Status) == On) || ($r.set(TDCC.2,Status) == On) || ($r.set(TDCC.3,Status) == On) || ($r.set(TDCC.4,Status) == On) || ($r.set(TDCC.5,Status) == On)) { return On } | else { return Off } }
tdcc.ad.temp { if ($1 isnum 1-5) { return $C(2) $+  $+ TDCC Server Online $c(1) $+ $tdcc.ad.desc($1) $tdcc.ad.trigger($1) $tdcc.ad.size($1) $tdcc.ad.sends $tdcc.ad.queues $tdcc.ad.min.cps $tdcc.ad.record.cps($1) $tdcc.ad.downloads($1) $ilogo } }
tdcc.ad.desc { if ($1 isnum 1-5) { return [ [ $sv(Desc,$isset($left($r.set(TDCC. [ $+ [ $1 ] ] ,Desc),100))) ] ] } }
tdcc.ad.size { if ($1 isnum 1-5) { return $sv(Size,$size($file($r.set(TDCC. [ $+ [ $1 ] ] ,Filename)).size)) } }
tdcc.ad.trigger { if ($1 isnum 1-5) { if $r.set(TDCC,AdTo) == 1 { return [ [ $sv(Trigger,$isset($r.set(TDCC. [ $+ [ $1 ] ] ,Trigger))) ] ] } | else { return [ [ $sv(Trigger,/ctcp [ $me ] [ $r.set(TDCC. [ $+ [ $1 ] ] ,Trigger) ] ) ] ] } } }
tdcc.ad.sends { return $sv(Sends, [ [ $isend(0) ] $+ ] / [ $+ [ $vnum($r.set(TDCC,Max.Sends.Total),0) ] ] ) }
tdcc.ad.queues { return $sv(Queues, [ [ $queue(0) ] $+ ] / [ $+ [ $vnum($r.set(TDCC,Max.Queues.Total),0) ] ] ) }
tdcc.ad.min.cps { if (($r.set(Min.CPS,Rate) isnum) && ($isnum($r.set(Min.CPS,Delay)) == $true) && ($r.set(Min.CPS,Status) == On)) { return $sv(Min CPS, [ [ $ratefix($vnum($r.set(Min.CPS,Rate),0)) ] ] ) } }
tdcc.ad.record.cps { if ($1 isnum 1-5) { return $sv(Record CPS, [ [ $ratefix($vnum($gettok($r.set(TDCC. [ $+ [ $1 ] ] ,Record.CPS),1,32),0)) by $isset($gettok($r.set(TDCC. [ $+ [ $1 ] ] ,Record.CPS),2,32)) ] ] ) } }
tdcc.ad.downloads { if ($1 isnum 1-5) { return $sv(Downloads,$vnum($r.set(TDCC. [ $+ [ $1 ] ] ,Downloads),0)) } }
ftp.ad { if (($1 isnum 1-5) && ($server != $null)) { admsg $allchk($r.set(FTP. [ $+ [ $1 ] ] ,Channels)) 1 $ftp.ad.temp($1) } }
ftp.ad.temp { if ($1 isnum 1-5) { return $c(1) $+ FTP Online $+ $c(1) $+ $c(2)  $ftp.ad.address($1) $+ : $+ $ftp.ad.port($1) $+ $c(2) $+ $c(1) l/p: $+ $c(2) $+  $ftp.ad.login($1) $+ $chr(47) $+ $ftp.ad.pass($1) $c(1) $ftp.ad.max.users($1) $ftp.ad.speed($1) $ftp.ad.note($1) $ilogo } }
ftp.ad.address { if ($1 isnum 1-5) { if ($r.set(FTP. [ $+ [ $1 ] ] ,Address) == Auto) || ($r.set(FTP. [ $+ [ $1 ] ] ,Address) == $null) { return Address,$ip } | else { return $r.set(FTP. [ $+ [ $1 ] ] ,Address) } } }
ftp.ad.port { if ($1 isnum 1-5) { return $r.set(FTP. [ $+ [ $1 ] ] ,Port) } }
ftp.ad.login { if ($1 isnum 1-5) { return $r.set(FTP. [ $+ [ $1 ] ] ,Login) } }
ftp.ad.pass { if ($1 isnum 1-5) { return $r.set(FTP. [ $+ [ $1 ] ] ,Password) } }
ftp.ad.speed { if ($1 isnum 1-5) { return $sv(Bandwidth,$isset($r.set(FTP. [ $+ [ $1 ] ] ,Speed))) } }
ftp.ad.max.users { if ($1 isnum 1-5) { return $sv(Max users, [ [ $vnum($r.set(FTP. [ $+ [ $1 ] ] ,Max.Users),0) ] ] user [ $+ [ $iif($vnum($r.set(FTP. [ $+ [ $1 ] ] ,Max.Users),0) != 1,s) ] ] ) } }
ftp.ad.note { if ($1 isnum 1-5) { return [ [ $sv(MOTD,$r.set(FTP. [ $+ [ $1 ] ] ,Note)) ] ] } }
xdcc.ad { 
  if (($1 isnum 1-2) && (($isend(0) < $r.set(XDCC,Max.Sends.Total)) || ($queue(0) < $r.set(XDCC,Max.Queues.Total))) && ($r.set(XDCC,Status) == On) && ($r.xdcc.pack(1,DL) != $null) && ($server != $null)) { 
    if (($r.set(XDCC,Channels) == All) || ($r.set(XDCC,Channels) == $null)) { 
      if ($getmychans != NOCHANS) {  
        var %chans = $getmychans
        var %tot = $numtok(%chans,44)
        var %ct = 1
        while (%ct <= %tot) {
          .timer 1 $calc((%ct - 1)  * $r.set(XDCC,Pack.List)) xdcc.ad.temp $1 msg $gettok(%chans,%ct ,44)
          inc %ct 1
        }
      }
    } 
    else { 
      var %xdcc-ad = 0 
      :start 
      inc %xdcc-ad 1 
      if ($gettok($r.set(XDCC,Channels),%xdcc-ad,44) != $null) { 
        if ($me ison $gettok($r.set(XDCC,Channels),%xdcc-ad,44)) { 
          .timer 1 $calc((%xdcc-ad - 1) * $r.set(XDCC,Pack.List)) xdcc.ad.temp $1 msg $gettok($r.set(XDCC,Channels),%xdcc-ad,44) 
        } 
        goto start 
      } 
      else { unset %xdcc-ad } 
    } 
  } 
}
xdcc.ad.temp { 
  if (($2 != $null) && ($r.xdcc.pack(1,DL) != $null)) {
    $2- $c(2) $+ XDCC Server Active $c(1) $+ $xdcc.ad.sends $xdcc.ad.queues  
    if ($1 == 1) { 
      $2- $c(1) $+ $xdcc.ad.min.cps $xdcc.ad.bw $xdcc.ad.record.cps 
      if ($r.set(XDCC,Latest) == 1) { var %xdcc-at = $iif($calc($xdcc.packs - $r.set(XDCC,Latest.Num)) >= 0,$v1,0) }
      else { var %xdcc-at = 0 }
      var %xdcc-at2 = 0
      :start 
      inc %xdcc-at 1
      if (($r.xdcc.pack(%xdcc-at,Filename) == None) || ($r.xdcc.pack(%xdcc-at,Filename) == $null) && (%xdcc-at >= $ini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,0))) { 
        .timer -hm 1 $calc((%xdcc-at2 * $r.set(XDCC,Line.Delay)) + $r.set(XDCC,Line.Delay)) $2- $c(1) $+ $xdcc.ad.snagged $xdcc.ad.packs 
        if ($xdcc.ad.motd != $null) { .timer -hm 1 $calc((%xdcc-at2 * $r.set(XDCC,Line.Delay)) + ($r.set(XDCC,Line.Delay) * 2)) $2- $c(1) $+ $xdcc.ad.motd } 
        .timer -hm 1 $calc((%xdcc-at2 * $r.set(XDCC,Line.Delay)) + ($r.set(XDCC,Line.Delay) * 3)) $2- $c(1) $+ Type: $+ $c(2) /ctcp $me XDCC Send #<pack number> $ilogo  
        unset %xdcc-at 
      } 
      else { 
        if (($r.xdcc.pack(%xdcc-at,Filename) == None) || ($r.xdcc.pack(%xdcc-at,Filename) == $null) || (Pack_# !isin $ini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,%xdcc-at))) { goto start }
        inc %xdcc-at2
        var %type.temp = $readini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,Pack_# $+ %xdcc-at,Type)
        var %c1 = $iif($numtok(%type.temp,32) > 3 && $gettok(%type.temp,-2,32) isnum, $+ $v1,99)
        var %c2 = $iif($numtok(%type.temp,32) > 3 && $gettok(%type.temp,-1,32) isnum, $+ $v1,99)
        var %type = $iif($numtok(%type.temp,32) > 3 && $gettok(%type.temp,2- -3,32) != n/a,$replace($gettok(%type.temp,2- -3,32),#Þ!,,#Þ@,,#Þ$,,#Þ%,))
        if ($r.set(Invision,XDCCHighRes) == On) {
          .timer -hm 1 $calc(%xdcc-at2 * $r.set(XDCC,Line.Delay)) $2- %c2 $+ $chr(35) $+ %xdcc-at %c1 $+ « $+ %c2 $+ $isize($file($r.xdcc.pack(%xdcc-at,Filename)).size) $+ %c1 $+ » $iif(%type,%c2 $+ $v1 $+  $+ %c2 $+ $chr(32),%c2) $+ $iif($r.xdcc.pack(%xdcc-at,Desc) != None,$v1,$nopath($r.xdcc.pack($remove(%xdcc-at,$chr(35)),Filename))) %c1 $+ - ( $+ %c2 $+ $r.xdcc.pack(%xdcc-at,DL) %c1 $+ gets  $+ ) 
        }
        else {
          .timer -m 1 $calc(%xdcc-at2 * $r.set(XDCC,Line.Delay)) $2- %c2 $+ $chr(35) $+ %xdcc-at %c1 $+ « $+ %c2 $+ $isize($file($r.xdcc.pack(%xdcc-at,Filename)).size) $+ %c1 $+ » $iif(%type,%c2 $+ $v1 $+  $+ %c2 $+ $chr(32),%c2) $+ $iif($r.xdcc.pack(%xdcc-at,Desc) != None,$v1,$nopath($r.xdcc.pack($remove(%xdcc-at,$chr(35)),Filename))) %c1 $+ - ( $+ %c2 $+ $r.xdcc.pack(%xdcc-at,DL) %c1 $+ gets  $+ ) 
        }
        goto start 
      } 
    }
    elseif ($1 == 2) { 
      if ($isnum($r.set(XDCC,Pack.List)) != $true) { 
        :start 
        var %pu = $?="Enter the Pack List Delay. (sec) $crlf $+ Example: 30" 
        if ($isnum(%pu) != $true) { goto start } 
        w.set XDCC Pack.List %pu 
        unset %pu 
      } 
      .timer -m 1 $calc((%xdcc-at * $r.set(XDCC,Line.Delay)) + $r.set(XDCC,Line.Delay)) $2- $c(1) $+ $xdcc.ad.sends $xdcc.ad.queues $xdcc.ad.min.cps $xdcc.ad.record.cps  
      .timer -m 1 $calc((%xdcc-at * $r.set(XDCC,Line.Delay)) + $r.set(XDCC,Line.Delay) + $r.set(XDCC,Line.Delay)) $2- $c(1) $+ Type $c(2) $+ /ctcp $me XDCC List $c(1) $ilogo | $2- $c(1) $+ $xdcc.ad.snagged $xdcc.ad.packs $xdcc.ad.bytes
    }
  }
}
xdcc.ad.motd { if ($r.set(XDCC,motd) != $null) { return $c(1) $+ MOTD: $c(2) $+ -= [ [ $r.set(XDCC,motd) ] ] $c(2) $+ =- $c(1) } }
xdcc.ad.bw { return $sv(Current BW,$ratefix($bandwidth)) } 
xdcc.ad.sends { return $sv(Sends, [ [ $isend(0) ] $+ ] / [ $+ [ $vnum($r.set(XDCC,Max.Sends.Total),0) ] ] ) }
xdcc.ad.queues { return $sv(Queues, [ [ $queue(0) ] $+ ] / [ $+ [ $vnum($r.set(XDCC,Max.Queues.Total),0) ] ] ) }
xdcc.ad.min.cps { if (($r.set(Min.CPS,Rate) isnum) && ($isnum($r.set(Min.CPS,Delay)) == $true) && ($r.set(Min.CPS,Status) == On)) { return $sv(Min CPS, [ [ $ratefix($vnum($r.set(Min.CPS,Rate),0)) ] ] ) } }
xdcc.ad.record.cps { return $sv(Record CPS, [ [ $ratefix($vnum($gettok($r.set(XDCC,Record.CPS),1,32),0)) by $isset($gettok($r.set(XDCC,Record.CPS),2,32)) ] ] ) }
xdcc.ad.snagged { return $sv(Served,$size($vnum($r.set(XDCC,Snagged),0))) }
xdcc.ad.packs { return $sv(Packs Offered,$vnum($xdcc.packs)) }
xdcc.ad.bytes { var %xdcc-ab = 0 | var %xs = 0 | :start | inc %xdcc-ab 1 | if ($r.xdcc.pack(%xdcc-ab,DL) == $null) { return $sv(Offering,$size($vnum(%xs,0))) } | inc %xs $file($r.xdcc.pack(%xdcc-ab,Filename)).size | goto start }
request.ad { if ($server != $null) { admsg $allchk($r.set(Request,Channels)) 1 $request.ad.temp } }
request.ad.temp { return $c(2) Request $c(1) $request.ad.request $ilogo }
request.ad.request { return [ [ $bracket($isset($r.set(Request,Request))) ] ] }
Announcer.ad { if ($server != $null) { admsg $allchk($r.set(Announcer,Channels)) 1 $Announcer.ad.temp } }
Announcer.ad.temp { return $c(2)  $+ $iif($r.set(Announcer,Prefix) != $null, $r.set(Announcer,Prefix), Notice) $+  $c(1) $Announcer.ad.Msg $ilogo }
Announcer.ad.Msg { return [ [ $bracket($isset($r.set(Announcer,Msg))) ] ] }
send.nick { if ($1 != $null) { if ($isend($1) == $null) { return 0 } | var %send-nc = 0 | var %send-nt = 0 | :start | inc %send-nc 1 | if ($isend(%send-nc) == $null) { return %send-nt } | if ($isend(%send-nc) == $1) { inc %send-nt 1 } | goto start } }
min.cps { 
  var %curNetwork = $iNetwork
  if (($isend(0) > 0) && ($r.set(Min.CPS,Status) == On)) { 
    var %mincps-c = $calc($isend(0) + 1) 
    :start 
    dec %mincps-c 1 
    if (%send.cps. [ $+ [ %mincps-c ] ] == $null) { set %send.cps. $+ %mincps-c $r.set(Min.CPS,Rate) }
    if (%mincps-c < 1) { unset %mincps-c | return } 
    var %fname = $isend(%mincps-c).path $+ $isend(%mincps-c).file
    var %cnick = $isend(%mincps-c)
    var %chost = $iif($address(%cnick,5) != $null,$address(%cnick,5),%cnick)
    var %trkcpsX = $int($calc(($isend(%mincps-c).cps + %send.cps. [ $+ [ %mincps-c ] ] ) / 2))
    if ((%trkcpsX < $r.set(Min.CPS,Rate)) && ($isend(%mincps-c).cps != $null) && ($isend(%mincps-c).cps != 0) && ($isend(%mincps-c).cps != n/a) && ($isend(%mincps-c).secs > 40)) { 
      aecho $isend(%mincps-c) had their DCC send(s) stopped because their speed was $c(2) $+ $ratefix(%trkcpsX) $+ $c(1) when minimum speed is $c(2) $+ $ratefix($r.set(Min.CPS,Rate)) $+ $c(1) $+ . 
      if ($comchan($isend(%mincps-c),1) != $null) { 
        .notice $isend(%mincps-c) $c(1) $+ Your sends were closed because one of your sends were going at $c(2) $+ $ratefix(%trkcpsX) $+ $c(1) which is below the minimum of $c(2) $+ $ratefix($r.set(Min.CPS,Rate)) $+ $c(1) $+ . 
      } 
      if ($r.set(DCCmgr,Requeue) == On) {
        if (%Requeue [ $+ [ %curNetwork ] ] [ $+ [ %cnick ] ] [ $+ [ $nopath($shortfn(%fname)) ] ] == $null) { set %Requeue [ $+ [ %curNetwork ] ] [ $+ [ %cnick ] ] [ $+ [ $nopath($shortfn(%fname)) ] ] 0 }
        if (%Requeue [ $+ [ %curNetwork ] ] [ $+ [ %cnick ] ] [ $+ [ $nopath($shortfn(%fname)) ] ] <= $calc($r.set(DCCmgr,RequeueCT) - 1)) {
          if (($address(%cnick,5) != $null) && ($level(%chost) >= $iif($r.set(DCCmgr,SQlevel) != $null,$r.set(DCCmgr,SQlevel),14)) && ($r.set(DCCmgr,SecondQ) == On)) {
            .timer -o 1 1 Pqueue.insert Requeue %cnick %chost $ctime %fname
            .timer -o 1 1 notice %cnick $c(1) $+ I have automatically requeued $c(2) $+ $nopath(%fname) $c(1) $+ for you. $ilogo
            set %Requeue [ $+ [ %curNetwork ] ] [ $+ [ %cnick ] ] [ $+ [ $nopath($shortfn(%fname)) ] ] $calc(%Requeue [ $+ [ %cnick ] ] [ $+ [ $nopath($shortfn(%fname)) ] ] + 1)
          }
          else {
            .timer -o 1 1 queue.insert Requeue %cnick %chost $ctime %fname
            .timer -o 1 1 notice %cnick $c(1) $+ I have automatically requeued $c(2) $+ $nopath(%fname) $c(1) $+ for you. $ilogo
            set %Requeue [ $+ [ %curNetwork ] ] [ $+ [ %cnick ] ] [ $+ [ $nopath($shortfn(%fname)) ] ] $calc(%Requeue [ $+ [ %curNetwork ] ] [ $+ [ %cnick ] ] [ $+ [ $nopath($shortfn(%fname)) ] ] + 1)
          }
          if ($r.set(Fserve,Logging) == On) { 
            FSlog Requeuing %fname for %cnick $bracket(%chost) because MinCPS was not met. 
          }
          if ($r.set(Fserve,AlterWin) == On) { 
            DCCWinAdd Requeuing $c(2) $+ $nopath(%fname) $+ $c(1) for $c(2) $+ %cnick $c(1) $+ at $c(2) $+ $cts $c(1) $+ because MinCPS was not met. 
          } 
        }
        else {
          unset %Requeue [ $+ [ %curNetwork ] ] [ $+ [ %cnick ] ] [ $+ [ $nopath($shortfn(%fname)) ] ]
        }
      }
      if ($r.set(Fserve,AlterWin) == On) { 
        DCCWinAdd MinCPS was to low sending $c(2) $+ $nopath(%fname) $+ $c(1) to $c(2) $+ %cnick $c(1) $+ at $c(2) $+ $cts $+ $c(1) $+ . 
      } 
      if ($r.set(Fserve,Logging) == On) { 
        FSlog MinCPS was to low sending %fname to %cnick $bracket(%chost) 
      } 
      if ($r.glob(Fserve,SmartSend) == On) {
        .timerNOSSEND $+ %curNetwork -o 1 15 unset %NOSSend [ $+ [ %curNetwork ] ] $chr(124) queue.send
        set %NoSSend [ $+ [ %curNetwork ] ] 1
      }
      else {
        .timer 1 0 queue.send
      }

      close -s $isend(%mincps-c)
    } 
    set %send.cps. $+ %mincps-c %trkcpsX
    goto start 
  } 
}
xpos {
  var %os = $replace($iSystem(OperatingSystem,Caption,1),$chr(160),$chr(32))
  if (Windows !isin %os) { var %os = Windows %os }
  if (Vista isin %os || Windows 7 isin $replace(%os,$chr(160),$chr(32)) || Windows 8 isin $replace(%os,$chr(160),$chr(32))) { var %sp = $iSystem(OperatingSystem,ServicePackMajorVersion,1) }
  if (%sp >= 1) { var %os = %os $+ $chr(44) Service Pack %sp }
  return $replace(%os,(TM),™,(R),®,(C),©)
}
displaysystem { return $iSystem(VideoController,$1,1) }
monitor { return $iSystem(DesktopMonitor,MonitorType,1) }
procinfo {
  ; $1 can include these and more: Caption,Manufacturer,MaxClockSpeed,Name,NumberOfCores,ProcessorType,Version
  var %a = a $+ $ticks, %b = b $+ $ticks
  .comopen %a WBemScripting.SWBemLocator
  if (!$com(%a)) { 
    echo -abcfilqrt info * /procinfo: problem connecting to WMI. 
    return
  }
  .comclose %a $com(%a,ConnectServer,1,dispatch* %b)
  if (!$com(%b)) { 
    echo -abcfilqrt info * /procinfo: problem connecting to WMI. 
    return
  }
  var %query = SELECT $1 FROM Win32_Processor
  .comclose %b $com(%b,ExecQuery,1,bstr,%query,dispatch* %a)
  if (!$com(%a)) { 
    echo -abcfilqrt info * /procinfo: problem connecting to WMI. 
    return
  }
  var %i = 1, %n = $comval(%a,0)
  while (%i <= %n) {
    var %value = $comval(%a,%i,$1)
    if (%i < %n) { linesep -a }
    inc %i
  }
  .comclose %a
  return %value
}
uvf {
  var %total = $disk(0)
  while (%total) {
    if ($disk(%total).type == fixed) {
      var %total.space = $calc(%total.space + $disk(%total).size)
      var %used.space = $calc(%used.space + $disk(%total).size - $disk(%total).free)
    }
    dec %total
  }
  var %percent.used = %used.space / %total.space
  var %c1 = $gettok($remove($c(1),$chr(3)),1,44) $+ , $+ $gettok($remove($c(1),$chr(3)),1,44)
  var %c2 = $gettok($remove($c(2),$chr(3)),1,44) $+ , $+ $gettok($remove($c(2),$chr(3)),1,44)
  msg $1 $c(1) $+ Hard Drive Space Used:  $+ %c2 $+ $str(¯,$int($calc(%percent.used * 20))) $+  $+ %c1 $+ $str(_,$calc(20 - $int($calc(%percent.used * 20)))) $+  $+ $c(1) -- $+ $c(2) $bytes(%used.space).suf $c(1) $+ of $+ $c(2) $bytes(%total.space).suf $+ $c(1) $chr(40) $+ $c(2) $+ $round($calc(%percent.used * 100),1) $+ % $+ $c(1) $+ $chr(41) $ilogo
}
isvoc { tokenize 32 $1 $mid($2,2) $3 | if ($1 ison $2 && $1 !isvo $2 && $me isop $2 && $address($1,2) == $3) mode $2 +v $1 }
isopc { tokenize 32 $1 $mid($2,2) $3 | if ($1 ison $2 && $1 !isop $2 && $me isop $2 && $address($1,2) == $3) mode $2 +o $1 }
OpsDisplay {
  var %ct = 1
  while (%ct <= $chan(0)) {
    if ($me isop $chan(%ct)) { inc %t.ops }
    if (($me isvo $chan(%ct)) && ($me !isop $chan(%ct))) { inc %t.vos }
    inc %t.peeps $nick($chan(%ct),0)
    inc %t.chans
    inc %ct 1 
  }
}
iTotalDriveSpace {
  var %iDrives = $iSystem(DiskDrive,Size,0)
  while (%iDrives) {
    var %iTotalDiskSize = $calc(%iTotalDiskSize + $iSystem(DiskDrive,Size,%iDrives))
    dec %iDrives
  }
  return $bytes(%iTotalDiskSize).suf
}
iSystem {
  ; $1 = Win32_Class
  ; $2 = Item Requested
  ; $3 = Device Number
  .comopen xpver1 WbemScripting.SWbemLocator
  .comclose xpver1 $com(xpver1,ConnectServer,1,dispatch* xpver2)
  if $com(xpver2) {
    .comclose xpver2 $com(xpver2,ExecQuery,1,bstr*,select $2 from Win32_ $+ $1,dispatch* xpver3)
    if $com(xpver3) {
      var %a = $comval(xpver3,$3,$2)
      .comclose xpver3
      return %a
    }
  }
}
