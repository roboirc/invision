; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: iserv.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: 
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
on *:close:=:{ unset %SessionLevel [ $+ [ $nick ] ] }
on *:open:=:{ 
  if $istok(%fservenicks [ $+ [ $iNetwork ] ] ,$replace($nick,$chr(124),$chr(160)),44) {
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
    if (%SessionLevel [ $+ [ $nick ] ] <= 7) { close -c $nick | if $r.set(Fserve,Logging) == On { FSlog Refused File Server Session to $nick due to ban } | .notice $nick $c(1) $+You are banned from this File Server ( $+ $c(2) $+ $ulist($address($nick,3),*,1).info $+ $c(1) $+ ) }
    if ($r.set(Fserve,CloneGuard) == On) && ($cloneQchk($nick) == $true) { msg =$nick $c(2) $+ Invision CloneGuard $c(1) $+ has detected you have queues already under another nick. Queuing files with clones is prohibited. This Session will force close in 10 seconds. $ilogo | .timer -o 1 10 FSclose $nick | Secho CloneGuard in action towards $nick | if $r.set(Fserve,Logging) == On { FSlog CloneGuard blocked the sending of $replace(%fn,$chr(63), $chr(32), $chr(34), $chr(44)) $bracket($size($file($replace(%fn,$chr(63), $chr(32), $chr(34), $chr(44))).size)) to $address($nick,5) } | close -cf $nick | Halt }
    else {
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
      if $r.set(Flood,FserveStatus) == On {
        msg =$nick 04WARNING: Flood Protection is Activated. If you enter commands at an excessive rate, the session will be closed and you will be temporarily placed on ignore.
        msg =$nick -
      }
      msg =$nick $c(1) $+ ***********************  $c(2) $+ $iif($r.glob(Fserve,RecordsKeep) >= 2,Top $r.glob(Fserve,RecordsKeep)) Most Requested $c(1) $+ ***********************  
      var %tot = $iif($r.glob(Fserve,RecordsKeep) >= 1,$r.glob(Fserve,RecordsKeep),1)
      var %ct = 1
      while (%ct <= %tot) {
        msg =$nick $c(1) $chr(91) $+ $chr(35) $+ %ct $+ $chr(93) $c(2) $r.glob(Fserve,DirRecord.Name [ $+ [ %ct ] ] ) $iif($r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) != $null, $c(1) $chr(40) $+ $r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) $+ $chr(41))
        inc %ct 1
        continue
      }
      msg =$nick -
      if (dal.net isin $server) { 
        msg =$nick 04 #############################################
        msg =$nick 04           Make sure I am in your /dccallow list before you GET files! 
        msg =$nick 04 #############################################
        msg =$nick -
      }
      msg =$nick $c(1) $+ $sv(Current Queue Status,$Queue(0) $+ / $+ $r.set(fserve,Max.Queues.Total)) $iif($r.set(DCCmgr,SecondQ) == On && %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel),$sv(Current Priority Queue Status,$Pqueue(0) $+ / $+ $r.set(Fserve,Max.Queues.Total))) $sv(Your Personal Queue Status,$iif($r.set(DCCmgr,SecondQ) == On && %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel),$Pqueue.nick($nick) $+ / $+ $r.set(Fserve,Max.Queues.Each),$Queue.nick($nick) $+ / $+ $r.set(Fserve,Max.Queues.Each)))
      msg =$nick -

      var %curtrig = %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ TRIG ] ]
      if ($r.set( [ Fserve. [ $+ [ %curtrig ] ] ] ,Welcome.File) != None) && ($r.set( [ Fserve. [ $+ [ %curtrig ] ] ] ,Welcome.File) != $null) && $exists($r.set( [ Fserve. [ $+ [ %curtrig ] ] ] ,Welcome.File)) { .play =$nick $r.set( [ Fserve. [ $+ [ %curtrig ] ] ] ,Welcome.File) 100 }
      msg =$nick [\]
      if !$exists( [ %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] ] ) { close -c $nick | secho There was an error with the root directory setting for Chat Serv Session for $nick. The Session was closed | halt }
      if $r.set(Fserve,AntiCamp) == On { .timerAC $+ $nick $+ $iNetwork -o 1 300 anticamp $nick TIMEOUT }
      var %addy = $replace($address($nick,3),$chr(61),$chr(58))
      if $r.leech(Leech,%addy) != $null {
        var %time = $gettok($r.leech(Leech,%addy),2,44)
        if $calc($ctime - %time) >= 86400 { d.leech Leech %addy }
      }
      .timeridlekill $+ $replace($nick,$chr(124),$chr(160)) $+ $iNetwork off
      .timerFSidle $+ $replace($nick,$chr(124),$chr(160)) $+ $iNetwork -o 0 $FSidletime FSidlechk $nick
    }
  }
}
on ^*:chat:*:{
  if $istok(%fservenicks [ $+ [ $iNetwork ] ] ,$replace($nick,$chr(124),$chr(160)),44) { 
    if (%SessionLevel [ $+ [ $nick ] ] <= 7) { close -c $nick | Halt }
    flud Fserve $fulladdress
    .timeridlekill $+ $replace($nick,$chr(124),$chr(160)) $+ $iNetwork off
    .timerFSidle $+ $replace($nick,$chr(124),$chr(160)) $+ $iNetwork -o 0 $FSidletime FSidlechk $nick
    if ($1 == DIR || $1 == LS) { ChatServSendDir $nick [ %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] ] }
    if ($1 == READ) { msg =$nick this feature is currently disabled. }
    if ($1 == CD\) {
      set %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ RDIR ] ]
      var %dispdir = $remove($remove($remove($remove($remove(%ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] ,$left($r.set(Fserve.1,Root.Dir),-1)),$left($r.set(Fserve.2,Root.Dir),-1)),$left($r.set(Fserve.3,Root.Dir),-1)),$left($r.set(Fserve.4,Root.Dir),-1)),$left($r.set(Fserve.5,Root.Dir),-1))
      msg =$nick $chr(91) $+ $iif(%dispdir == $null,\,%dispdir) $+ $chr(93)
    }
    if ($1 == CD..) {
      var %tmpdir = $uponedir( [ %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] ] )
      if $left(%tmpdir,$len( [ %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ RDIR ] ] ] )) != %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ RDIR ] ] {
        msg =$nick 04Illegal Directory. 
      }
      else { 
        set %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] %tmpdir 
        var %dispdir = $remove($remove($remove($remove($remove(%ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] ,$left($r.set(Fserve.1,Root.Dir),-1)),$left($r.set(Fserve.2,Root.Dir),-1)),$left($r.set(Fserve.3,Root.Dir),-1)),$left($r.set(Fserve.4,Root.Dir),-1)),$left($r.set(Fserve.5,Root.Dir),-1))
        msg =$nick $chr(91) $+ $iif(%dispdir == $null,\,%dispdir) $+ $chr(93)
      }
    }
    if ($1 == CD) && ($2 != $null) {
      if ($2 == ..) {
        var %tmpdir = $uponedir(%ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] )
        if $left(%tmpdir,$len(%ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ RDIR ] ] )) != %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ RDIR ] ] {
          msg =$nick 04Illegal Directory. 
        }
        else { 
          set %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] %tmpdir 
          var %dispdir = $remove($remove($remove($remove($remove(%ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] ,$left($r.set(Fserve.1,Root.Dir),-1)),$left($r.set(Fserve.2,Root.Dir),-1)),$left($r.set(Fserve.3,Root.Dir),-1)),$left($r.set(Fserve.4,Root.Dir),-1)),$left($r.set(Fserve.5,Root.Dir),-1))
          msg =$nick $chr(91) $+ $iif(%dispdir == $null,\,%dispdir) $+ $chr(93)
        }
      }
      else {
        if (\ !isin $2) && (/ !isin $2) {
          var %tmpdir = %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] $+ $2- $+ \
          if $isdir(%tmpdir) {
            if $left(%tmpdir,$len( [ %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ RDIR ] ] ] )) != %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ RDIR ] ] {
              msg =$nick 04Illegal Directory. 
            }
            else { 
              set %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] %tmpdir 
              var %dispdir = $remove($remove($remove($remove($remove( [ %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ] ] ,$left($r.set(Fserve.1,Root.Dir),-1)),$left($r.set(Fserve.2,Root.Dir),-1)),$left($r.set(Fserve.3,Root.Dir),-1)),$left($r.set(Fserve.4,Root.Dir),-1)),$left($r.set(Fserve.5,Root.Dir),-1))
              msg =$nick $chr(91) $+ $iif(%dispdir == $null,\,%dispdir) $+ $chr(93)
            }
          }
          else { msg =$nick 08Invalid Directory. }
        }
        else { msg =$nick 04Illegal Directory. }
      }
    }
    if ($1 == Bye) || ($1 == Exit) { msg =$nick Cya! | close -c $nick | unset %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ * ] ] | set %FserveNicks [ $+ [ $iNetwork ] ] $remtok(%FserveNicks [ $+ [ $iNetwork ] ] ,$nick,1,44) | halt }
    if (($1 == Who) && ($2 == $null)) {
      if ($chat(2) == $null) { msg =$nick $c(1) $+ There is no one else currently on this File Server. }
      else {
        if ($chat(0) == 2) { msg =$nick $c(1) $+ There is 1 other user online. }
        if ($chat(0) >= 3) { msg =$nick $c(1) $+ There is $calc($chat(0) - 1) other users currently online. }
        var %srvwho = 1        
        while (%srvwho <= $chat(0)) {
          var %srvdir = $remove($remove($remove($remove($remove(%ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $chat(%srvwho) ] ] [ $+ [ CWD ] ] ,$left($r.set(Fserve.1,Root.Dir),-1)),$left($r.set(Fserve.2,Root.Dir),-1)),$left($r.set(Fserve.3,Root.Dir),-1)),$left($r.set(Fserve.4,Root.Dir),-1)),$left($r.set(Fserve.5,Root.Dir),-1))
          if %srvdir == $null { var %srvdir = \ }
          if $chat(%srvwho) != $nick { msg =$nick $c(1) $+ User:  $c(2) $+ $chat(%srvwho) $iif((($r.set(DCCmgr,SecondQ) == On) && (%SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel))),*) $c(1) $+ is in $c(2) $+ %srvdir  }
          inc %srvwho 1
          continue
        }
      }
      halt
    }
    elseif (($1 == Stats) && ($2 == $null)) {
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
        continue
      }
      msg =$nick -
      if (dal.net isin $server) { 
        msg =$nick 04 #############################################
        msg =$nick 04           Make sure I am in your /dccallow list before you GET files! 
        msg =$nick 04 #############################################
      }
      halt
    }
    elseif (($1 == Terms) && ($2 == $null)) {
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
      if $r.set(DCCmgr,SecondQ) == On && %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel) { 
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
      halt
    }
    elseif (($1 == Clr_queues) && ($2 == $null)) {
      if %queueflood [ $+ [ $nick ] ] == 1 { halt }
      .timer -o 1 15 unset %queueflood [ $+ [ $nick ] ]
      set %queueflood [ $+ [ $nick ] ] 1
      echo = $+ $nick -t $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
      if $r.set(DCCmgr,SecondQ) == On && %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel) {
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
      halt
    }
    elseif (($1 == Help) && ($2 == $null)) {
      echo = $+ $nick -t $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
      msg =$nick $bracket(File Server Help Menu)
      msg =$nick $c(1) $+ (cd,Change your current directory [cd <directory|..>])
      msg =$nick $c(1) $+ (dir,List all the files in current directory)
      msg =$nick $c(1) $+ (ls,List all the files in current directory [wide])
      msg =$nick $c(1) $+ (get,Gets file from the file server [get <filename>])
      msg =$nick $c(1) $+ (read,Reads file from file server [read <filename>])
      msg =$nick $c(1) $+ (stats,Shows file server statistics)
      msg =$nick $c(1) $+ (who,Shows a list of who is connected)
      msg =$nick $c(1) $+ (sends,Shows a list of current sends)
      msg =$nick $c(1) $+ (queues,Shows a list of waiting queues)
      msg =$nick $c(1) $+ (clr_queues,Deletes all of your queues from server)
      msg =$nick $c(1) $+ (terms,Shows you the terms you accept for using this file server)
      if $r.set(Fserve,Logging) == On { FSlog Displayed the Help to $address($nick,5) }
      halt
    }
    elseif ($1 == GET) { 
      ;  echo -t = $+ $nick $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) 
      if ($2 == $null) { msg =$nick $c(1) $+ Syntax: get <filename> | Halt }
      if (\ isin $2-) || (/ isin $2-) { msg =$nick $c(2) $+ ERROR: $c(1) $+ Illegal Directory. | Halt }
      var %fpath = %ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $nick ] ] [ $+ [ CWD ] ]  $+ \ $+ $2- 
      var %fn = $replace(%fpath ,$chr(32),$chr(63),$chr(44),$chr(34))
      if $isfile($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))) == $false { msg =$nick $c(2) $+ ERROR: $c(1) $+ That is not a valid File. | Halt }
      if $r.set(Fserve,DCClimit) == On && $r.set(Fserve,Limit) != $null && $r.set(Fserve,Limit) != 0 {
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
      if ($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size <= $r.set(Fserve,Insta.Send.Size) && ($r.set(Fserve,InstaSend.Status) == On) && ($send.nick($nick) < $r.set(Fserve,Max.Sends.Each))) { secho 8Invision Insta-Send in action for files less then $size($r.set(Fserve,Insta.Send.Size)) | if $r.set(Fserve,Logging) == On { .timer 1 0 FSlog Insta-Send sent $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) to $address($nick,5) } | .timer 1 0 idcc send $nick " $+ $replace(%fn,$chr(63), $chr(32), $chr(34), $chr(44)) $+ " | .timer 1 0 msg =$nick $c(1) $+ InstaSending™ $+ $c(2) $nopath($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) $+ . | .timer 1 0 DirRecord $nick $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) | halt } 
      if $file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size > $r.set(Fserve,sg.size) && $r.set(Fserve,SizeGuard) == On  { secho 8Invision Size Guard in action for files larger then $size($r.set(Fserve,sg.size)) | if $r.set(Fserve,Logging) == On { FSlog SizeGuard blocked the sending of $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) to $address($nick,5) } | msg =$nick $c(2) $+ Files larger then $size($r.set(Fserve,sg.size)) may not be downloaded. $ilogo | halt } 
      if $calc($queue.nick($nick) + $Pqueue.nick($nick)) >= $r.set(Fserve,Max.Queues.Each) { .timer 1 0 msg =$nick $c(1) $+ Invision $iif($antiget,$confusion(has determined you have used all your queue slots.),has determined you have used all your queue slots.) | if ($r.set(Fserve,AntiCamp) == On) { .timer 1 0 anticamp $nick } | Halt }
      if ($r.glob(Fserve,SmartSend) == On && $SSend.chk(1) && $send.nick($nick) < $r.set(Fserve,Max.Sends.Each)) || ($r.glob(Fserve,SmartSend) != On && $isend(0) < $r.set(Fserve,Max.Sends.Total) && $send.nick($nick) < $r.set(Fserve,Max.Sends.Each)) && %NOSSend [ $+ [ $iNetwork ] ] != 1 { 
        unset %nossend [ $+ [ $iNetwork ] ]
        .timer -o 1 0 idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $nick " $+ $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $+ " 
        .timer 1 0 msg =$nick $c(1) $+ $iif($r.glob(Fserve,SmartSend) == On,Smart) $+ Sending $+ $c(2) $nopath($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) $+ . 
        .timer 1 0 if $r.set(Fserve,Logging) == On { FSlog Sending $replace(%fn,$chr(63), $chr(32), $chr(34), $chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) to $address($nick,5) } 
        .timer 1 0 DirRecord $nick $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))
        Halt
      }
      else { 
        if $r.set(DCCmgr,SecondQ) == On && %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel) { 
          if $PQueue(0) < $r.set(Fserve,Max.Queues.Total) {
            Pqueue.add Fserve $nick $iif($address($nick,5) != $null,$address($nick,5),$chat($nick).ip) $ctime $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 

          }
          else {
            msg =$nick $c(1) $+ Sorry but the Maximum Allowed Queues of $r.set(Fserve,Max.Queues.Total) has been reached. Please try again later.
            halt
          }
        }
        else { 
          if $Queue(0) < $r.set(Fserve,Max.Queues.Total) {
            queue.add Fserve $nick $iif($address($nick,5) != $null,$address($nick,5),$chat($nick).ip) $ctime $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 
          }
          else {
            msg =$nick $c(1) $+ $iif($antiget,$confusion(Sorry but the Maximum Allowed Queues of),Sorry but the Maximum Allowed Queues of) $r.set(Fserve,Max.Queues.Total) $iif($antiget,$confusion(has been reached. Please try again later.),has been reached. Please try again later.)
            halt
          }
        }
        if ($result isnum) { .timer 1 0 msg =$nick $c(1) $+ $iif($antiget,$confusion(That queue already exists in queue slot),That queue already exists in queue slot) $chr(35) $+ $result $+ , try another file. | Halt }
        .timer 1 0 msg =$nick $iif($antiget,$confusion(The file has been queued in slot),The file has been queued in slot) $iif((%SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel) && ($r.set(DCCmgr,SecondQ) == On)),$Pqueue(0),$queue(0))
        if $r.set(Fserve,Logging) == On { FSlog Queued $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) $bracket($size($file($replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44))).size)) for $address($nick,5) in slot $chr(35) $+ $queue(0) } 
        .timer -o 1 0 DirRecord $nick $replace(%fn,$chr(63),$chr(32),$chr(34),$chr(44)) 
        if $r.set(Fserve,AntiCamp) == On { anticamp $nick } 
        Halt 
      }
      halt
    }
    elseif ($r.set(Fserve,Fserve.Chat) == On) {
      if $1- != bye && $1- != ls && $1- != dir && $1 != cd && $1- != exit && $1 != read && $1 != quit && $1 != cd.. {
        if ($window(@Fserve.Chat) == $null) { window -enk @Fserve.Chat $r.winpos(@Fserve.Chat) @Fserve.Chat }
        titlebar @Fserve.Chat - Type messages in the box to talk with fserve users.
        if (ACTION * iswm $1-) { aline -ph $colour(action) @Fserve.Chat $ts * $nick $clradj($gettok($gettok($1-,1-,1),2-,32)) }
        else { aline -ph @Fserve.Chat $ts $c(1) $+ < $+ $nick $+ $c(1) $+ > $clradj($1-) }
        if ($chat(0) > 1) {
          var %fserve-p = 0
          :start
          inc %fserve-p 1
          if ($chat(%fserve-p) == $null) { unset %fserve-p }
          elseif ($chat(%fserve-p) == $nick) { goto start }
          elseif (ACTION * iswm $1-) { msg = $+ $chat(%fserve-p) * $nick $gettok($gettok($1-,1-,1),2-,32) | goto start }
          else { msg = $+ $chat(%fserve-p) < $+ $nick $+ > $1- | goto start }
        }
        halt
      }
    }
    :leave
  }
  else {
    flud DCC $fulladdress
  }
}
on *:CLOSE:=:{ set %FserveNicks [ $+ [ $iNetwork ] ] $remtok(%FserveNicks [ $+ [ $iNetwork ] ] ,$nick,1,44) }
alias ChatServSendDir {
  ; ************ ChatServSendDir <nick> <directory>
  if $exists($2-) {
    var %dispdir = $remove($remove($remove($remove($remove(%ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ] [ $+ [ CWD ] ] ,$left($r.set(Fserve.1,Root.Dir),-1)),$left($r.set(Fserve.2,Root.Dir),-1)),$left($r.set(Fserve.3,Root.Dir),-1)),$left($r.set(Fserve.4,Root.Dir),-1)),$left($r.set(Fserve.5,Root.Dir),-1))
    msg = $+ $1 $chr(91) $+ $iif(%dispdir == $null,\,%dispdir) $+ *.* $+ $chr(93)
    if $chat($1) != $null {
      var %tct = $finddir($2-,*.*,0,1)
      var %ct = 1
      while (%ct <= %tct) {
        msg = $+ $1 $remove($finddir($2-,*.*,%ct,1),%ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ] [ $+ [ CWD ] ] ,\,/)
        inc %ct 1
        continue
      }
      var %tct = $findfile($2-,*.*,0,1)
      var %ct = 1
      while (%ct <= %tct) {
        msg = $+ $1 $remove($findfile($2-,*.*,%ct,1),%ChatServ [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ] [ $+ [ CWD ] ] ,\,/) $size($file($findfile($2-,*.*,%ct,1)).size)
        inc %ct 1
        continue
      }
      msg = $+ $1 End of List.
    }
  }
}
on *:TEXT:*:#:{
  if ($1 == !list && $r.set(XDCC,Status) == ON && (!$2 || $2 == $me) && $r.set(XDCC,List) == On && ($r.set(XDCC,Channels) == All || $istok($r.set(XDCC,Channels),$chan,44))) {
    .notice $nick $c(1) $chr(91) $+ $c(2) $+ XDCC Server Active $+ $c(1) $+ $chr(93) $+ $c(2) - $c(1) $+ $xdcc.ad.packs $xdcc.ad.sends $xdcc.ad.queues $xdcc.ad.snagged $xdcc.ad.bw $xdcc.ad.record.cps $c(1) $+ Trigger: $+ « $+ $c(2) $+ /ctcp $me XDCC List $+ $c(1) $+ »
    .notice $nick $$xdcc.ad.motd
  }
  if ($1 == !list && $2 == $me && ($fserve.ad.temp != $null) && ($r.set(Fserve,List) == On) && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve,Pause) != On) && ($r.set(Fserve,Status) == On) && (($r.set(Fserve,Channels) == All) || ($r.set(Fserve,Channels) == $null) || ($istok($r.set(Fserve,Channels),$chan,44) == $true))) {
    advertise notice fserve $chan $nick
  }
  var %fulladdress = $fulladdress
  var %curNetwork = $iNetwork
  if ($r.set(Customs,WWATCH1.desc) != $null) {
    var %ct = 1
    while (%ct <= 9) { 
      if ($r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .desc ] ] ) == $null) { inc %ct 1 | continue } 
      if ($r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .desc ] ] ) iswm $strip($1-,burc)) {
        if ($istok($r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .chan ] ] ),$chan,32) == $true) || ($r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .chan ] ] ) == All) {
          if (Request isin $strip($1-,burc)) && ($r.set(Customs,WWreq. [ $+ [ %ct ] ] ) == On) { goto leave }
          if ($nick isop $chan) && ($r.set(Customs,WWops. [ $+ [ %ct ] ] ) == On) { goto leave }
          if ($nick isvo $chan) && ($r.set(Customs,WWvos. [ $+ [ %ct ] ] ) == On) { goto leave }
          if ($r.set(Customs,WWtt. [ $+ [ %ct ] ] ) == On) { noop $tip(WordWatch,WordWatch triggered by $nick in $chan,$1-,$null,$readini($mircini,files,trayicon),1,window -a $chan,$null) }
          if (%WWflag [ $+ [ %curNetwork ] ] != 1) && ($r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .msg ] ] ) != $null) { 
            if ($r.set(Customs,WWusemsg [ $+ [ %ct ] ] ) == On) { msg $chan $c(2) $+ [ [ $r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .msg ] ] ) ] ] }
            if ($r.set(Customs,WWusenot [ $+ [ %ct ] ] ) == On) { notice $nick $c(2) $+ [ [ $r.set(Customs,WWATCH [ $+ [ %ct ] ] [ $+ [ .msg ] ] ) ] ] }
          }
          set %WWflag [ $+ [ %curNetwork ] ] 1 
          .timerStopWW $+ %curNetwork -o 1 $r.set(Invision,WWtime) set %WWflag [ $+ [ %curNetwork ] ] 0 
          if (($r.set(Customs, [ WWkick. [ $+ [ %ct ] ] ] ) == On) || ($r.set(customs, [ WWban. [ $+ [ %ct ] ] ] ) == On)) && ($me isop $chan) { 
            if ($r.set(Customs, [ WWban. [ $+ [ %ct ] ] ] ) == On) { 
              .timer -o 1 $calc(%defban * 60) if $!me isop $chan $chr(123) mode $chan -b $address($nick,3) $chr(125) 
              mode $chan +b $address($nick,$r.glob(Invision,DefaultBan)) 
            } 
            kick $chan $nick  $+ $rkick $+ ) ( $+ $ilogo(X) 
          } 
        }
      }
      :leave
      inc %ct 1 
    }
  }
}
