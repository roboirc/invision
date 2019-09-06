; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: ictcp.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: CTCP Routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
alias Icheckaxs {
  if ($chr(126) isin $1 || $chr(33) isin $1 || $chr(38) isin $1 || $chr(64) isin $1 || $chr(37) isin $1) { return 1 }
  elseif ($r.set(Fserve. [ $+ [ $2 ] ],ACCESS) == A) { return 1 }
  elseif ($r.set(Fserve. [ $+ [ $2 ] ],ACCESS) == V) && ($chr(43) isin $1) { return 1 }
  else { if ($4 != no) { .notice $3 Sorry, you do not have access to the trigger you entered. } | return 0 }
}
alias Icheckaxsctcp {
  if ($2) { var %ictcpaxs = $r.set(Fserve,Channels)
    if %ictcpaxs == All { var %ictcpaxsv1 = 1
      while ((%ictcpaxsv1 <= $comchan($1,0)) && (%ictcpaxsvar != 1)) {
        if ($Icheckaxs($nick($comchan($1,%ictcpaxsv1),$1).pnick,$2,$1,no) == 1) { var %ictcpaxsvar = 1 }
        inc %ictcpaxsv1
      }
    }
    else {
      while (($numtok(%ictcpaxs,44) > 0)  && (%ictcpaxsvar != 1)) {
        if ($Icheckaxs($nick($gettok(%ictcpaxs,1,44),$1).pnick,$2,$1,no) == 1) { var %ictcpaxsvar = 1 }
        var %ictcpaxs = $deltok(%ictcpaxs,1,44)
      }
    }
    if %ictcpaxsvar == 1 { return $true } | else { .notice $1 Sorry, you do not have access to the trigger you entered. | return $false }
  }
}
on ^*:text:*:#:{
  var %fulladdress = $fulladdress
  var %curNetwork = $iNetwork
  if ($r.set(Fserve,Status) == On) {
    if (($r.set(Fserve,Channels) == All) || ($r.set(Fserve,Channels) == $null) || ($istok($r.set(Fserve,Channels),$chan,44) == $true)) {
      if ($r.set(Fserve,CTCPonly) != On) {
        if (($strip($1-,burc) == $strip($r.set(Fserve.1,Trigger),burc)) || ($strip($1-,burc) == $strip($r.set(Fserve.2,Trigger),burc)) || ($strip($1-,burc) == $strip($r.set(Fserve.3,Trigger),burc)) || ($strip($1-,burc) == $strip($r.set(Fserve.4,Trigger),burc)) || ($strip($1-,burc) == $strip($r.set(Fserve.5,Trigger),burc))) {
          if ($r.set(Fserve,Listen) == On) && ($r.set(Fserve,Pause) == On) { notice $nick $c(1) $+ The file server is currently paused. It will be resumed here shortly. }
          elseif ($r.set(Fserve,Listen) != On) { .notice $nick $c(1) $+ The file server is no longer taking queues but is sending out existing queues in order to shut down. To see the current queue list do a $c(2) $+ /msg $me !queues }
          elseif ($fserv(0) >= $r.set(Fserve,Max.Serve)) { .notice $nick $c(1) $+ The file server is currently full, please try later. }
          elseif ($level($fulladdress) == 7) { 
            .notice $nick $c(1)  $+ $nick You have been banned from this File Server.
            close -f $nick            
          } 
          elseif ($strip($1-,burc) == $strip($r.set(Fserve.1,Trigger),burc)) && ($Icheckaxs($nick($chan,$nick).pnick,1,$nick) == 1) && ($r.set(Fserve.1,Status) == On) && ($r.set(Fserve,Listen) == On) && ($texttrigchk($chan,1)) && (%FStrigFlag [ $+ [ %curNetwork ] ] != 1) { fserve.start $nick 1 | .timer -o 1 10 unset %FStrigFlag [ $+ [ %curNetwork ] ] | set %FStrigFlag [ $+ [ %curNetwork ] ] 1 }
          elseif ($strip($1-,burc) == $strip($r.set(Fserve.2,Trigger),burc)) && ($Icheckaxs($nick($chan,$nick).pnick,2,$nick) == 1) && ($r.set(Fserve.2,Status) == On) && ($r.set(Fserve,Listen) == On) && ($texttrigchk($chan,2)) && (%FStrigFlag [ $+ [ %curNetwork ] ] != 1) { fserve.start $nick 2 | .timer -o 1 10 unset %FStrigFlag [ $+ [ %curNetwork ] ] | set %FStrigFlag [ $+ [ %curNetwork ] ] 1 }
          elseif ($strip($1-,burc) == $strip($r.set(Fserve.3,Trigger),burc)) && ($Icheckaxs($nick($chan,$nick).pnick,3,$nick) == 1) && ($r.set(Fserve.3,Status) == On) && ($r.set(Fserve,Listen) == On) && ($texttrigchk($chan,3)) && (%FStrigFlag [ $+ [ %curNetwork ] ] != 1) { fserve.start $nick 3 | .timer -o 1 10 unset %FStrigFlag [ $+ [ %curNetwork ] ] | set %FStrigFlag [ $+ [ %curNetwork ] ] 1 }
          elseif ($strip($1-,burc) == $strip($r.set(Fserve.4,Trigger),burc)) && ($Icheckaxs($nick($chan,$nick).pnick,4,$nick) == 1) && ($r.set(Fserve.4,Status) == On) && ($r.set(Fserve,Listen) == On) && ($texttrigchk($chan,4)) && (%FStrigFlag [ $+ [ %curNetwork ] ] != 1) { fserve.start $nick 4 | .timer -o 1 10 unset %FStrigFlag [ $+ [ %curNetwork ] ] | set %FStrigFlag [ $+ [ %curNetwork ] ] 1 }
          elseif ($strip($1-,burc) == $strip($r.set(Fserve.5,Trigger),burc)) && ($Icheckaxs($nick($chan,$nick).pnick,5,$nick) == 1) && ($r.set(Fserve.5,Status) == On) && ($r.set(Fserve,Listen) == On) && ($texttrigchk($chan,5)) && (%FStrigFlag [ $+ [ %curNetwork ] ] != 1) { fserve.start $nick 5 | .timer -o 1 10 unset %FStrigFlag [ $+ [ %curNetwork ] ] | set %FStrigFlag [ $+ [ %curNetwork ] ] 1 }
        }
      }
      if ($strip($1-,burc) == !List) && ($fserve.ad.temp != $null) && ($r.set(Fserve,List) == On) && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve,Pause) != On) && %ListFlag [ $+ [ %curNetwork ] ] != 1 {
        .notice $nick $fserve.ad.temp($chan) 
        if ($r.set(Fserve,TwoLineAd) == On && $r.set(Fserve,Note) != $null) { .notice $nick $left($fserve.ad.temp.note,428) }
      }
    }
  }
  if (($1- == !list) && (%ListFlag [ $+ [ %curNetwork ] ] != 1)) {
    .timer -o 1 10 unset %ListFlag [ $+ [ %curNetwork ] ]
    set %ListFlag [ $+ [ %curNetwork ] ] 1
    var %ftpct = 1
    while (%ftpct <= 5) {
      if (($r.set(FTP. [ $+ [ %ftpct ] ] ,Status) == On) && ($r.set(FTP. [ $+ [ %ftpct ] ] ,List) == On) && ($istok($r.set(FTP. [ $+ [ %ftpct ] ] ,Channels), $chan,44))) { .notice $nick $ftp.ad.temp(%ftpct) }
      inc %ftpct 1
    }
  }
  if ($strip($1-,burc) == $r.set(TDCC.1,Trigger)) && ($r.set(TDCC,AdTo) == 1) && ($r.set(TDCC.1,Status) == On) && (($istok($r.set(TDCC.1,Channels),$chan,44) == $true) || ($r.set(TDCC.1,Channels) == All)) { tdcc.send $nick 1 }
  if ($strip($1-,burc) == $r.set(TDCC.2,Trigger)) && ($r.set(TDCC,AdTo) == 1) && ($r.set(TDCC.2,Status) == On) && (($istok($r.set(TDCC.2,Channels),$chan,44) == $true) || ($r.set(TDCC.2,Channels) == All)) { tdcc.send $nick 2 }
  if ($strip($1-,burc) == $r.set(TDCC.3,Trigger)) && ($r.set(TDCC,AdTo) == 1) && ($r.set(TDCC.3,Status) == On) && (($istok($r.set(TDCC.3,Channels),$chan,44) == $true) || ($r.set(TDCC.3,Channels) == All)) { tdcc.send $nick 3 }
  if ($strip($1-,burc) == $r.set(TDCC.4,Trigger)) && ($r.set(TDCC,AdTo) == 1) && ($r.set(TDCC.4,Status) == On) && (($istok($r.set(TDCC.4,Channels),$chan,44) == $true) || ($r.set(TDCC.4,Channels) == All)) { tdcc.send $nick 4 }
  if ($strip($1-,burc) == $r.set(TDCC.5,Trigger)) && ($r.set(TDCC,AdTo) == 1) && ($r.set(TDCC.5,Status) == On) && (($istok($r.set(TDCC.5,Channels),$chan,44) == $true) || ($r.set(TDCC.5,Channels) == All)) { tdcc.send $nick 5 }
}
ctcp &*:*:*:{ 
  if $r.set(Invision,BlockCTCPall) == On && $1 != DCC { Halt }
  flud CTCP $fulladdress
  mflud ctcp
  var %curLevel = $level($fulladdress)
  if %curlevel == 5 { Halt }
  if $chan != $null {
    if $me isop $chan || $me ishop $chan {
      if $cfchk($chan,+rf) {
        if %lastflood [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] = $left($1-,200) { 
          inc %repeat [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 1
          .timerrepeatsafety  $+ $chan $+ $iNetwork -o 1 10 $chr(123) unset $chr(37) $+ repeat $+ $iNetwork $+ $chan $chr(125)
          if %repeat [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] >= $cgetset($chan,rfct) { 
            if (m !isin $chan($chan).mode) { /.timerclearplusM $+ iNetwork $+ $chan 1 60 mode $chan -m  | /.mode $chan +m } 
            var %ct = 1
            while (%ct <= $cgetset($chan,rfct)) {
              if %LFL [ $+ [ $chan ] ] [ $+ [ %ct ] ] == $left($1-,200) {
                if (%LFN [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] [ $+ [ %ct ] ] !isop $chan) && (%LFN [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] [ $+ [ %ct ] ] !isvo $chan) && (%LFN [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] [ $+ [ %ct ] ] !ishop $chan) {
                  if !$istok(%repeatnicks [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] ,%LFN [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] [ $+ [ %ct ] ] ,44) {
                    ban -u3600 $chan %LFN [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] [ $+ [ %ct ] ] $r.glob(Invision,DefaultBan)
                    kick $chan %LFN [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] [ $+ [ %ct ] ] CTCP RePeaT FLuD!
                    if $r.set(ChanOps,LogDefense) == On { deflog %LFN [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] [ $+ [ %ct ] ] was kicked and banned at $time(h:nn:tt) for: CTCP RePeAT FLuD! }
                    ;var %repeatnicks [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] = $addtok(%repeatnicks [ $+ [ $iNetwork ] ] ,%LFN [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] [ $+ [ %ct ] ] ,44)
                  }
                }
              }
              inc %ct 1
            }
            unset %repeat [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
          }  
        }
        else { unset %repeat [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] }
        set %lastflood [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] $left($1-,200)
        set %LFL9 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFL8 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFL8 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFL7 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFL7 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFL6 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFL6 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFL5 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFL5 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFL4 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFL4 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFL3 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFL3 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFL2 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFL2 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFL1 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFL1 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %lastflood [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFN9 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFN8 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFN8 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFN7 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFN7 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFN6 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFN6 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFN5 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFN5 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFN4 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFN4 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFN3 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFN3 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFN2 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFN2 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] %LFN1 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] 
        set %LFN1 [ $+ [ $iNetwork ] ] [ $+ [ $chan ] ] $nick
      }
    }
  }
  if ($r.set(Invision,BlockCTCP2) == On) && (%curLevel <= 14) && ($1 != DCC) { Halt }
  if ($r.set(Invision,BlockCTCP) == On) && ($1 != DCC) && ($1 != Version) { if %curLevel <= 12 { if $comchan($nick,0) < 1 { Halt } } }
  if ($1 == mp3) { if ($r.set(Invision,BlockSLOT) == On) { Halt } }
  if ($1 == SLOTS) { if ($r.set(Invision,BlockSLOT) == On) { Halt } }
  if ($r.set(Invision,LogCTCP) == On) { write $shortfn($mircdir) $+ invision\logs\ctcp.log $time(dddd m/d/yyyy h:nntt) $chr(91) $+ $iSetwork $+ $chr(93) - $nick ( $+ [ $fulladdress ] $+ ) CTCP $1- }
  if ($1 == DCC) && ($2 == RESUME) { return }
  if $1 == PING { return }
  if (($1 != DCC) && ($1 != SOUND)) {
    if $mevents(ctcps) == 0 {
      var %ct = 1
      while (%ct <= $chan(0)) {
        echo $colour(ctcp) -t $chan(%ct) $chr(91) $+ $nick $1- $chr(93) 
        inc %ct 1
      }
      haltdef
    }
    if $mevents(ctcps) == 1 {
      echo $colour(ctcp) -st $chr(91) $+ $nick $1- $chr(93) 
      haltdef
    }
  }
  if $1- == !list && %ListFlag [ $+ [ $iNetwork ] ] != 1 {
    var %ftpct = 1
    while (%ftpct <= 5) {
      if $r.set(FTP. [ $+ [ %ftpct ] ] ,Status) == On && $r.set(FTP. [ $+ [ %ftpct ] ] ,List) == On && $FTPChanCheck($nick,%ftpct) { .notice $nick $ftp.ad.temp(%ftpct) }
      inc %ftpct 1
    }
  }
  if $r.set(Fserve,Status) == On {
    if $ChanCheck($nick) {
      if $1 == !list { 
        if ($fserve.ad.temp != $null) && ($r.set(Fserve,CTCPonly) == On) && ($r.set(Fserve,List) == On) && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve,Pause) != On) && %ListFlag [ $+ [ $iNetwork ] ] != 1 {
          if $chan != $null { if $r.set(Fserve,Channels) != all && $r.set(Fserve,Channels) != $null && !$istok($r.set(Fserve,Channels),$chan,44) { halt } }
          .notice $nick $fserve.ad.temp(all) 
          if ($r.set(Fserve,TwoLineAd) == On && $r.set(Fserve,Note) != $null) { .notice $nick $left($fserve.ad.temp.note,428) }
        }
      }
      if ($1 == @find || $1 == !search || $1 == @locator) {
        if $r.set(Fserve,CTCPonly) == On && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve,Search) == On) && ($r.set(Fserve,Pause) != On) && ($r.set(Fserve,SearchCache) != On) && (%searchFLag [ $+ [ $iNetwork ] ] != 1) && ($remove($2-,*) != $null) {
          .timer -o 1 10 unset %searchFLag [ $+ [ $iNetwork ] ]
          set %searchFLag [ $+ [ $iNetwork ] ] 1
          FsearchSTD 1 $nick $2-
        }
        if (($1 == !Search)  || ($1 == @find) || ($1 == @locator)) && $r.set(Fserve,CTCPonly) == On && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve,Search) == On) && ($r.set(Fserve,Pause) != On) && ($r.set(Fserve,SearchCache) == On) && (%searchFLag [ $+ [ $iNetwork ] ] != 1) && ($len($2-) >= 3) {
          .timer -o 1 10 unset %searchFLag [ $+ [ $iNetwork ] ]
          .set %searchFLag [ $+ [ $iNetwork ] ] 1
          FsearchCACHE 1 $nick $2-
        }
      }
    }
  }
  if $r.set(mp3serv,Status) == On {
    if $mp3ChanChk($nick) {
      if ($1 == @find || $1 == !mp3search || $1 == @locator) && $r.set(mp3serv,ctcp) == On {
        if (%mp3searchFlag [ $+ [ $iNetwork ] ] != 1) && ($2 != $null) && ($len($2-) >= 3) {
          .timer -o 1 10 unset %mp3searchFlag [ $+ [ $iNetwork ] ]
          unset %mp3srch*
          set %mp3searchFlag [ $+ [ $iNetwork ] ] 1
          var %mp3srchstr = *:* $+ $replace($2-,$chr(32),*,$chr(44),*) $+ *
          var %mp3srchFindCT = $iif($istable(mp3list [ $+ [ $iSetwork ] ] ),$hmatch(mp3list [ $+ [ $iSetwork ] ] ,%mp3srchstr,0).data,0)
          if %mp3srchFindCT >= 20 { var %mp3srchFindCT = 20 }
          if %mp3srchFindCT != 0 {
            msg $nick $c(1) $+ I found $iif(%mp3srchFindCT >= 20,over) $c(2) $+ %mp3srchFindCT $c(1) $+ match(s) for $c(2) $+ $2- $ilogo
            set %mp3isoct [ $+ [ $iNetwork ] ] 1
            var %ct = 1
            while (%ct <= %mp3srchFindCT ) { 
              set %mp3srchPathClip [ $+ [ $iNetwork ] ] $hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] ,%mp3srchstr,%ct).data)
              .timer 1 $calc(%ct * 2) .msg $nick $replace($c(1) $+ Found $c(2) $+ $mp3serv.ad.trigger $nopath($hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] ,%mp3srchstr,%ct).data)) $bracket($hget(mp3list [ $+ [ $iSetwork ] ] ,bitrate [ $+ [ $right($hmatch(mp3list [ $+ [ $iSetwork ] ] ,%mp3srchstr,%ct).data,-4) ] ] )) $bracket($hget(mp3list [ $+ [ $iSetwork ] ] ,size [ $+ [ $right($hmatch(mp3list [ $+ [ $iSetwork ] ] ,%mp3srchstr,%ct).data,-4) ] ] )),$chr(32) $+ $chr(91) $+ $chr(32), $chr(32) $chr(36) $+ chr(91) $chr(32),$chr(32) $+ $chr(93) $+ $chr(32),$chr(32) $chr(36) $+ chr(93) $chr(32),$chr(32) $+ $chr(123) $+ $chr(32),$chr(32) $chr(36) $+ chr(123) $chr(32),$chr(32) $+ $chr(125) $+ $chr(32),$chr(32) $chr(36) $+ chr(125) $chr(32),$chr(32) $+ $chr(124) $+ $chr(32),$chr(32) $chr(36) $+ chr(124) $chr(32)) 
              inc %ct 1 
            }
            if %mp3srchFindCT >= 20 { .timer 1 $calc((%ct * 2) + 2) .msg $nick $c(1) $+ Too many results to display. Please refine your search $iif($r.set(mp3serv,SendList) == On,or get my list) $+ . }
            .timer 1 $calc((%ct * 2) + 3) .msg $nick $c(1) $+ You can copy and paste $iif($r.set(mp3serv,CTCP) != On,it in the channel) to get it (do not include the streamrate or filesize tags). Current Server Status(Queues: $!queue(0) $chr(36) $+ + / $+ $r.set(mp3serv,Max.Queues.Total) Sends: $!send(0) $chr(36) $+ + / $+ $r.set(mp3serv,Max.Sends.Total) $chr(36) $+ + $chr(41)

          }
        }
      }
    }
  }
  if $1- == !list && %ListFlag [ $+ [ $iNetwork ] ] != 1 {
    .timer -o 1 10 unset %ListFlag [ $+ [ $iNetwork ] ]
    set %ListFlag [ $+ [ $iNetwork ] ] 1
  }
  if ($1 == DCC) && ($2 == Send) { 
    flud DCC $fulladdress
    if ($r.set(Invision,SndOpt16) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound17) } 
    if (" isin $1- && $numtok($gettok($1-,3,34),32) ==  4) || (" !isin $1- && $7) {
      var %passive == $true
      if (" isin $1- && $gettok($gettok($1-,3,34),2,32) == 0) || (" !isin $1- && $5 == 0) {
        var %passive.chk = $true
      }
    }
    tokenize 32 $iif((" isin $1- && $numtok($gettok($1-,3,34),32) ==  4) || (" !isin $1- && $7),$deltok($1-,$numtok($1-,32),32),$1-)
    if (!%passive || %passive.chk) { aecho  $+ $c(2) $nick $bracket($address) $c(1) $+ is attempting to send $c(2) $+ $remove($gettok($1-,3 - $calc($gettok($1-,0,32) - 3),32) $bracket($size($gettok($1-,$gettok($1-,0,32),32))),") to you $iif(%passive,via $c(2) $+ passive DCC $+ $c(1) $+ .,on port $c(2) $+ $gettok($1-,$calc($gettok($1-,0,32) - 1),32) $+ $c(1) $+ .)  }
    If ($r.set(Invision,AutoGets) == On) { 
      if $dccok($fulladdress) == $false { 
        Aecho $c(2) $+ DCC From $nick Blocked. $nick has no DCC permissions. 
        halt 
      } 
      aecho $c(1) $+ DCC permissions verified for $nick  
    } 
  } 
  if ($1 == DCC) && ($2 == Chat) {
    flud DCC $fulladdress
    if $r.set(Invision,BlockDCC) == On && $2 != Resume { if $dccok($fulladdress) == $false { aecho $c(1) $+ DCC Chat from $nick Blocked. $nick has no dcc permissions | halt } }  
    if ($r.set(Invision,SndOpt21) == On) && %FxPopenFlag [ $+ [ $iNetwork ] ] != 1 { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound46) } 
    aecho $nick $bracket($address) is attempting to chat with you via port $c(2) $+ $5 $+ $c(1) $+ . $bracket($iif((($away == $true) && ($r.set(Away,Reject.Chat) == On)),Rejected for Being Away)) 
    if ($away == $true) && ($r.set(Away,Reject.Chat) == On) { Halt } 
    if ((%FxPopenFlag [ $+ [ $iNetwork ] ] == 1) || (%altFxPflag [ $+ [ $iNetwork ] ] == 1)) && ($5 != 0) { OpenFxP $nick $4 $5 } 
  }
  if ($chkFSctcp == $true) && ($r.set(Fserve,Pause) != On) {
    if ($strip($1-,burc) == $strip($r.set(Fserve.1,Trigger),burc)) || ($strip($1-,burc) == $strip($r.set(Fserve.2,Trigger),burc)) || ($strip($1-,burc) == $strip($r.set(Fserve.3,Trigger),burc)) || ($strip($1-,burc) == $strip($r.set(Fserve.4,Trigger),burc)) || ($strip($1-,burc) == $strip($r.set(Fserve.5,Trigger),burc)) { 
      if $ChanCheck($nick) == $true { 
        if ($r.set(Fserve,Status) != On) && ($r.set(Fserve,Listen) != On) { .notice $nick $c(1) $+ The file server is currently offline. Sorry for the inconvenience. | halt }
        elseif ($r.set(Fserve,Status) == On) && ($r.set(Fserve,Listen) != On) { .notice $nick $c(1) $+ The file server is no longer taking queues but is sending out existing queues in order to shut down. | halt }      
        elseif ($fserv(0) >= $r.set(Fserve,Max.Serve)) { .notice $nick $c(1) $+ The file server is currently full, please try later. | halt }
        elseif (%curLevel == 7) { 
          .notice $nick $c(1)  $+ $nick you have been banned from this File Server!
          close -f $nick 
          halt           
        }          
        elseif ($strip($1-,burc) == $strip($r.set(Fserve.1,Trigger),burc)) && ($r.set(Fserve.1,Status) == On) && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve.1,CTCP) == On || $r.set(Fserve,CTCPonly)) { if ($Icheckaxsctcp($nick,1) == $true) { var %server = 1 } }
        elseif ($strip($1-,burc) == $strip($r.set(Fserve.1,Trigger),burc)) && ($r.set(Fserve.1,Status) == On) && ($r.set(Fserve,Listen) == On) && $r.set(Fserve.1,CTCP) != On && $r.set(Fserve,CTCPonly) { .notice $nick That trigger cannot be used in /CTCP | Halt }
        elseif ($strip($1-,burc) == $strip($r.set(Fserve.2,Trigger),burc)) && ($r.set(Fserve.2,Status) == On) && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve.2,CTCP) == On || $r.set(Fserve,CTCPonly)) { if ($Icheckaxsctcp($nick,2) == $true) { var %server = 2 } }
        elseif ($strip($1-,burc) == $strip($r.set(Fserve.2,Trigger),burc)) && ($r.set(Fserve.2,Status) == On) && ($r.set(Fserve,Listen) == On) && $r.set(Fserve.2,CTCP) != On && $r.set(Fserve,CTCPonly) { .notice $nick That trigger cannot be used in /CTCP | Halt }
        elseif ($strip($1-,burc) == $strip($r.set(Fserve.3,Trigger),burc)) && ($r.set(Fserve.3,Status) == On) && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve.3,CTCP) == On || $r.set(Fserve,CTCPonly)) { if ($Icheckaxsctcp($nick,3) == $true) { var %server = 3 } }
        elseif ($strip($1-,burc) == $strip($r.set(Fserve.3,Trigger),burc)) && ($r.set(Fserve.3,Status) == On) && ($r.set(Fserve,Listen) == On) && $r.set(Fserve.3,CTCP) != On && $r.set(Fserve,CTCPonly) { .notice $nick That trigger cannot be used in /CTCP | Halt }
        elseif ($strip($1-,burc) == $strip($r.set(Fserve.4,Trigger),burc)) && ($r.set(Fserve.4,Status) == On) && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve.4,CTCP) == On || $r.set(Fserve,CTCPonly)) { if ($Icheckaxsctcp($nick,4) == $true) { var %server = 4 } }
        elseif ($strip($1-,burc) == $strip($r.set(Fserve.4,Trigger),burc)) && ($r.set(Fserve.4,Status) == On) && ($r.set(Fserve,Listen) == On) && $r.set(Fserve.4,CTCP) != On && $r.set(Fserve,CTCPonly) { .notice $nick That trigger cannot be used in /CTCP | Halt }
        elseif ($strip($1-,burc) == $strip($r.set(Fserve.5,Trigger),burc)) && ($r.set(Fserve.5,Status) == On) && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve.5,CTCP) == On || $r.set(Fserve,CTCPonly)) { if ($Icheckaxsctcp($nick,5) == $true) { var %server = 5 } }
        elseif ($strip($1-,burc) == $strip($r.set(Fserve.5,Trigger),burc)) && ($r.set(Fserve.5,Status) == On) && ($r.set(Fserve,Listen) == On) && $r.set(Fserve.5,CTCP) != On && $r.set(Fserve,CTCPonly) { .notice $nick That trigger cannot be used in /CTCP | Halt }
        if (%server isnum 1-5) {
          if ($ip == $null) { ERROR Users cannot access your fserv because you do not have an IP address set in Alt-O > Connect > Local Info. | halt }
          if ($r.set(Fserve. $+ %server,Channels) == all) { fserve.start $nick %server }
          else {
            var %cnt = 1, %total = $gettok($r.set(Fserve. $+ %server,Channels),0,44)
            while (%cnt <= %total) {
              if ($nick ison $gettok($r.set(Fserve. $+ %server,Channels),%cnt,44)) { fserve.start $nick %server | halt }
              inc %cnt
            }
            .notice $nick $c(1) $+ You must be in a channel I am serving in to activate my file server. | halt
          }
        }
      }
      else { .notice $nick $c(1) $+ You must be in a channel I am serving in to activate my file server. | halt } 
    }
  }
  if ($r.set(mp3serv,CTCP) == On) && ($r.set(mp3serv,Pause) != On) && ($r.set(mp3serv,Listen) == On) { 
    if ($mp3ChanChk($nick) == $true) { 
      if ($ip == $null) { ERROR Users cannot access your MP3 server because you do not have an IP address set in Alt-O > Connect > Local Info. | halt }
      if (($1- == List) || ($1- == @ [ $+ [ $me ] ] )) && ($r.set(mp3serv,SendList) == On) { mp3servLIST $nick | halt }
      ; if ($1- == Queues) { mp3servQueues $nick | halt }
      if ($1- == Clear All) { mp3servClearAll $nick | halt } 
      if ($1 == Clear) && ($2 isnum 1- 999) && ($3 == $null) { mp3servClearOne $nick $2 | halt }
      if ($1- == mp3Help) { mp3servHELP $nick | halt }
      set %newtwo $replace($1-,$chr(44),$chr(42),$chr(40),*,$chr(41),*)
      if $istok($r.set(mp3serv,FileTypes),$right($strip(%newtwo,burc),4),44) && $2 != Resume {
        if $hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data) == $null { .notice $nick $c(1) $+ Sorry $c(2) $+ $nick $+ $c(1) $+ , but $c(2) $+ $1- $c(1) $+ was not found. Be sure you have spelled it correctly. | halt }
        if $exists($hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)) {
          if ($isend(0) >= $r.set(mp3serv,Max.Sends.Total)) {
            if ($queue(0) >= $r.set(mp3serv,Max.Queues.Total)) { .notice $nick $c(1) $+ Sorry, you have too many transfers right now and all the queue slots are in use. | Halt }
            elseif ($queue.nick($nick) >= $r.set(Fserve,Max.Queues.Each)) { .notice $nick $c(1) $+ You have too many transfers right now and you have used all your queue slots. | Halt }
            elseif ($r.set(mp3serv,CloneGuard) == On) && ($cloneQchk($nick) == $true) { .notice $nick $c(2) $+ CloneGuard $c(1) $+ has detected you have queues already under another nick. Queuing files with clones is prohibited. | Secho CloneGuard in action towards $nick | Halt }
            else {
              queue.add mp3serv $nick $iif($address($nick,5) != $null,$address($nick,5),$nick) $ctime $hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)
              if ($result isnum) { .notice $nick $c(1) $+ That queue already exists in the queue for you. }
              else { .notice $nick $c(1) $+ Queuing $+ $c(2) $nopath($hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)) $bracket($size($file($hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)).size)) $+ .  It has been placed in queue slot $chr(35) $+ $queue(0) $+ , it will send asap. }
            }
          }
          elseif ($send.nick($nick) >= $r.set(mp3serv,Max.Sends.Each)) {
            if ($queue(0) >= $r.set(mp3serv,Max.Queues.Total)) { .notice $nick $c(1) $+ Sorry, you have too many transfers right now and all the queue slots are in use. | Halt }
            elseif ($queue.nick($nick) >= $r.set(Fserve,Max.Queues.Each)) { .notice $nick $c(1) $+ You have too many transfers right now and you have used all your queue slots. | Halt }
            elseif ($r.set(mp3serv,CloneGuard) == On) && ($cloneQchk($nick) == $true) { .notice $nick $c(2) $+ CloneGuard $c(1) $+ has detected you have queues already under another nick. Queuing files with clones is prohibited. | Secho CloneGuard in action towards $nick | Halt }
            else {
              queue.add mp3serv $nick $iif($address($nick,5) != $null,$address($nick,5),$nick) $ctime $hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] , [ *:*\ [ $+ [ $strip($1-,burc) ] ] ] ,1).data)
              if ($result isnum) { .notice $nick $c(1) $+ That queue already exists in the queue for you. }
              else { .notice $nick $c(1) $+ Queuing $+ $c(2) $nopath($hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)) $bracket($size($file($hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] , [ *:*\ [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data)).size)) $+ .  It has been placed in queue slot $chr(35) $+ $queue(0) $+ , it will send asap. }
            }
          }
          else {
            .idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $nick $hget(mp3list [ $+ [ $iSetwork ] ] ,$hmatch(mp3list [ $+ [ $iSetwork ] ] , [ *:* [ $+ [ $strip(%newtwo,burc) ] ] ] ,1).data) | if ($r.set(Invision,SndOpt17) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound18) } 
          }
        }
        else {
          .notice $nick $c(1) $+ Sorry $c(2) $+ $nick $+ $c(1) $+ , but $c(2) $+ $1- $c(1) $+ is currently unavailable. 
          halt 
        }
        halt
      }
    }
  }
  if $getmychans != NOCHANS {
    if $r.set(TDCC,AdTo) != 1 {
      if $r.set(TDCC,AdTo) == 2 { 
        if ($ip == $null) { ERROR Users cannot access your TDCC server because you do not have an IP address set in Alt-O > Connect > Local Info. | halt }
        if ($1- == $r.set(TDCC.1,Trigger)) { if $OPchk($r.set(TDCC.1,Channels),$nick) == $true || $Vchk($r.set(TDCC.1,Channels),$nick) == $true { tdcc.send $nick 1 CTCP } }
        if ($1- == $r.set(TDCC.2,Trigger)) { if $OPchk($r.set(TDCC.2,Channels),$nick) == $true || $Vchk($r.set(TDCC.2,Channels),$nick) == $true { tdcc.send $nick 2 CTCP } }
        if ($1- == $r.set(TDCC.3,Trigger)) { if $OPchk($r.set(TDCC.3,Channels),$nick) == $true || $Vchk($r.set(TDCC.3,Channels),$nick) == $true { tdcc.send $nick 3 CTCP } }
        if ($1- == $r.set(TDCC.4,Trigger)) { if $OPchk($r.set(TDCC.4,Channels),$nick) == $true || $Vchk($r.set(TDCC.4,Channels),$nick) == $true { tdcc.send $nick 4 CTCP } }
        if ($1- == $r.set(TDCC.5,Trigger)) { if $OPchk($r.set(TDCC.5,Channels),$nick) == $true || $Vchk($r.set(TDCC.5,Channels),$nick) == $true { tdcc.send $nick 5 CTCP } }
      }
      if $r.set(TDCC,AdTo) == 3 { 
        if ($ip == $null) { ERROR Users cannot access your TDCC server because you do not have an IP address set in Alt-O > Connect > Local Info. | halt }
        if ($1- == $r.set(TDCC.1,Trigger)) { if $Vchk($r.set(TDCC.1,Channels),$nick) == $true && $Opchk($r.set(TDCC.1,Channels),$nick) == $false { tdcc.send $nick 1 CTCP } }
        if ($1- == $r.set(TDCC.2,Trigger)) { if $Vchk($r.set(TDCC.2,Channels),$nick) == $true && $Opchk($r.set(TDCC.2,Channels),$nick) == $false { tdcc.send $nick 2 CTCP } }
        if ($1- == $r.set(TDCC.3,Trigger)) { if $Vchk($r.set(TDCC.3,Channels),$nick) == $true && $Opchk($r.set(TDCC.3,Channels),$nick) == $false { tdcc.send $nick 3 CTCP } }
        if ($1- == $r.set(TDCC.4,Trigger)) { if $Vchk($r.set(TDCC.4,Channels),$nick) == $true && $Opchk($r.set(TDCC.4,Channels),$nick) == $false { tdcc.send $nick 4 CTCP } }
        if ($1- == $r.set(TDCC.5,Trigger)) { if $Vchk($r.set(TDCC.5,Channels),$nick) == $true && $Opchk($r.set(TDCC.5,Channels),$nick) == $false { tdcc.send $nick 5 CTCP } }
      }
      if $r.set(TDCC,AdTo) == 4 { 
        if ($ip == $null) { ERROR Users cannot access your TDCC server because you do not have an IP address set in Alt-O > Connect > Local Info. | halt }
        if ($1- == $r.set(TDCC.1,Trigger)) { if $Opchk($r.set(TDCC.1,Channels),$nick) == $true { tdcc.send $nick 1 CTCP } }
        if ($1- == $r.set(TDCC.2,Trigger)) { if $Opchk($r.set(TDCC.2,Channels),$nick) == $true { tdcc.send $nick 2 CTCP } }
        if ($1- == $r.set(TDCC.3,Trigger)) { if $Opchk($r.set(TDCC.3,Channels),$nick) == $true { tdcc.send $nick 3 CTCP } }
        if ($1- == $r.set(TDCC.4,Trigger)) { if $OPchk($r.set(TDCC.4,Channels),$nick) == $true { tdcc.send $nick 4 CTCP } }
        if ($1- == $r.set(TDCC.5,Trigger)) { if $Opchk($r.set(TDCC.5,Channels),$nick) == $true { tdcc.send $nick 5 CTCP } }
      }
    }
  }
  if ($1 == OPME) && $me isop $2 { 
    if $3 == $null || $4 != $null { .notice $nick $c(1) $+ Invalid Format. | goto end }
    if ($level($fulladdress) >= 20) { 
      if $r.fpw($replace($address($nick,3),$chr(61),~)) != $null {
        if $r.fpw($replace($address($nick,3),$chr(61),~)) == $decipher($3) { 
          if  $cfchk($2,+of) { 
            if $ufchk($fulladdress,+ro,$2) {
              if $nick ison $2 { .mode $2 +o $nick } 
            }
            else { .notice $nick $c(1) $+ Sorry $nick $+ , but you don't have remote op permissions in $c(2) $+ $2 }
          }
          else { .notice $nick $c(1) $+ Sorry $nick $+ , but I don't have Remote Ops enabled for $c(2) $+ $2 }
        }
        else { .notice $nick $c(1) $+ Sorry $nick $+ , but the password is incorrect. }
      }
      else { .msg $nick $c(1) $+ Hi $nick $+ , You are in my friends list but you havn't set a password yet. You can do this by doing a $c(2) $+ /ctcp $me SETPW <pw> <confirm pw> }
    }
    :end
  }
  if ($1 == SETPW) {
    if ($level($fulladdress) >= 20) {
      if $3 == $null || $4 != $null { .notice $nick $c(1) $+ Invalid Format. Need /ctcp $me SETPW <new password> <confirm password> | halt }
      if $r.fpw($replace($address($nick,3),$chr(61),~)) != $null {
        .notice $nick $c(1) $+ Sorry $nick $+ , but you already have a password set! you will have to do a /ctcp $me CHANGEPW <old pw> <new pw> <confirm new pw> 
        halt 
      }
      if $2 != $3 { notice $nick $c(1) $+ Sorry $nick $+ , but the confirmation password doesn't match. | halt }
      w.fpw $replace($address($nick,3),$chr(61),~) $2 | notice $nick $c(1) $+ Your Password has been set. Please try not to forget it. $ilogo | aecho $nick just set his/her Password.
    }
    :end
  }
  if ($1 == CHANGEPW) {
    if ($level($fulladdress) >= 20) {
      if $4 == $null || $5 != $null { .notice $nick $c(1) $+ Invalid Format. Need /ctcp $me CHANGEPW <old password> <new password> <confirm new password> | goto end }
      if $r.fpw($replace($address($nick,3),$chr(61),~)) != $null {
        if $r.fpw($replace($address($nick,3),$chr(61),~)) == $2 {
          if $3 != $4 { notice $nick $c(1) $+ Sorry $nick $+ , but the confirmation password doesn't match the new password. | goto end }
          w.fpw $replace($address($nick,3),$chr(61),~) $3 | notice $nick $c(1) $+ Your Password has been successfully changed. Please try not to forget it. $ilogo | aecho $nick just changed his/her password.   
        }    
        else { .notice $nick $c(1) $+ Sorry $nick $+ , but the existing password $C(2) $+ $2 $c(1) $+ is incorrect. }    
      }
      else { .notice $nick $c(1) $+ Sorry $nick $+ , but I don't have a pasword set for you yet. You can do this by doing a $c(2) $+ /ctcp $me SETPW <pw> <confirm pw> }
    }
    :end
  }
  if ($1 == XDCC) {
    if $xdccChanCheck($nick) {
      if ($level($fulladdress) == 7) { .notice $nick $c(1) $+ Your access has been denied. $ilogo | aecho $nick $bracket($address) is trying to use the XDCC. $bracket(Banned) }
      elseif ($chan != $null) { .notice $nick $c(1) $+ The XDCC doesn't respond to mass channel ctcps! $ilogo }
      elseif ($r.set(XDCC,Status) != On) { .notice $nick $c(1) $+ The XDCC is down, try again later. $ilogo }
      else {
        if ($ip == $null) { ERROR Users cannot access your XDCC server because you do not have an IP address set in Alt-O > Connect > Local Info. | halt }
        if ($2 == $null) { .notice $nick Syntax: XDCC command | .notice $nick /ctcp $me XDCC HELP for more information. | halt }
        elseif ($2 == Help) {
          aecho $nick $bracket($address) is requesting XDCC help.
          if ($3 == Send) { .notice $nick Syntax: Send #<Pack Number> | .notice $nick This will initiate file transfer. }
          elseif ($3 == List) { .notice $nick Syntax: List | .notice $nick The list command lists the offered packs. }
          elseif ($3 != $null) { .notice $nick Syntax: Help command | .notice $nick Send   Sends Specified Pack | .notice $nick List   Lists the offered Packs }
          else { .notice $nick An XDCC is a server where the only files that you can get are the ones that are offered in the form of packs.  For more info, type /ctcp $me XDCC Help command | .notice $nick Send   Sends Specified Pack | .notice $nick List   Lists the offered Packs }
        }
        elseif ($2 == List) {
          aecho $nick $bracket($address) is requesting the XDCC packet list. $iif($isnum($r.set(XDCC,Pack.List)) != $true,$bracket(Packet Listing Disabled)) $+ $iif($tc($nick,XDCC) != $true,$bracket(Rejected Request))
          if ($isnum($r.set(XDCC,Pack.List)) != $true) { .notice $nick $c(1) $+ Pack listing has been currently disabled. $ilogo }
          elseif ($tc($nick,XDCC) != $true) { .notice $nick $c(1) $+ Access has been denied because your not in one of the required channels. $bracket($iif($r.set(XDCC,Channels) == $null || $r.set(XDCC,Channels) == All,Every Channel I am On,$r.set(XDCC,Channels))) $ilogo }
          elseif (($calc($ctime - [ %xdcc-ctime [ $+ [ $iNetwork ] ] ] ) <= $r.set(XDCC,Pack.List)) && (%xdcc-ctime != $null)) { .notice $nick $c(1) $+ Please wait another $lduration($calc($r.set(XDCC,Pack.List) - ($ctime - [ %xdcc-ctime ] ))) before requesting the XDCC packets again. $ilogo }
          elseif ($findfile(Invision\Settings\ $+ $iSetwork $+ \,XDCCList*.txt,1)) { .msg $nick $c(1) $+ DCC Sending XDCC List.  To download a file from the list, type /ctcp $me XDCC Send #<pack number> | dcc send $nick $findfile(Invision\Settings\ $+ $iSetwork $+ \,XDCCList*.txt,1) }
          else { set -u [ $+ [ $calc($r.set(XDCC,Pack.List) * 2) ] ] %xdcc-ctime [ $+ [ $iNetwork ] ] $ctime | xdcc.ad.temp 1 .notice $nick }
        }
        elseif ($2 == Remove) && $3 == $null {
          if $r.set(DCCmgr,SecondQ) == On {
            if %SessionLevel [ $+ [ $nick ] ] >= $r.set(DCCmgr,SQlevel) {
              if ($Pqueue.nick($nick) == 0) { .notice $nick $c(1) $+ You have no queues waiting. }
              else {
                var %fserve-cq = 0
                :clr_queue-start-1
                inc %fserve-cq 1
                :clr_queue-start-2
                if ($Pqueue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
                elseif ($gettok($Pqueue(%fserve-cq),2,32) == $nick) { .notice $nick $c(1) $+ Removing $c(2) $+ $nopath($gettok($Pqueue(%fserve-cq),5-,32)) $bracket($size($lof($gettok($Pqueue(%fserve-cq),5-,32)))) from your queue. | Pqueue.del %fserve-cq | goto clr_queue-start-2 }
                else { goto clr_queue-start-1 }
                if $r.set(Fserve,Logging) == On { FSlog $address($nick,5) deleted there queues. }
              }
            }
            else {
              if ($queue.nick($nick) == 0) { .notice $nick $c(1) $+ You have no queues waiting. }
              else {
                var %fserve-cq = 0
                :clr_queue-start-1
                inc %fserve-cq 1
                :clr_queue-start-2
                if ($queue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
                elseif ($gettok($queue(%fserve-cq),2,32) == $nick) { .notice $nick $c(1) $+ Removing $c(2) $+ $nopath($gettok($queue(%fserve-cq),5-,32)) $bracket($size($lof($gettok($queue(%fserve-cq),5-,32)))) from your queue. | queue.del %fserve-cq | goto clr_queue-start-2 }
                else { goto clr_queue-start-1 }
                if $r.set(Fserve,Logging) == On { FSlog $address($nick,5) deleted there queues. }
              }
            }
          }
          else {
            if ($queue.nick($nick) == 0) { .notice $nick $c(1) $+ You have no queues waiting. }
            else {
              var %fserve-cq = 0
              :clr_queue-start-1
              inc %fserve-cq 1
              :clr_queue-start-2
              if ($queue(%fserve-cq) == $null) { unset %fserve-cq | Halt }
              elseif ($gettok($queue(%fserve-cq),2,32) == $nick) { .notice $nick $c(1) $+ Removing $c(2) $+ $nopath($gettok($queue(%fserve-cq),5-,32)) $bracket($size($lof($gettok($queue(%fserve-cq),5-,32)))) from your queue. | queue.del %fserve-cq | goto clr_queue-start-2 }
              else { goto clr_queue-start-1 }
              if $r.set(Fserve,Logging) == On { FSlog $address($nick,5) deleted there queues. }
            }
          }
          halt
        }
        elseif (($2 == Send) || ($2 == Get)) {
          aecho $nick $bracket($address) is requesting an XDCC packet. $iif($tc($nick,XDCC) != $true,$bracket(Rejected Request),$iif($3 == $null,$bracket(n/a),$bracket($3)))
          if ($tc($nick,XDCC) != $true) { .notice $nick $c(1) $+ Access has been denied because your not in one of the required channels. $ilogo }
          else {
            if ($3 == $null) { .notice $nick Syntax: Send #<Pack Number> }
            elseif ($r.xdcc.pack($remove($3,$chr(35)),DL) == $null) { .notice $nick $c(1) $+ Invalid Pack }
            elseif ($isend(0) >= $r.set(XDCC,Max.Sends.Total)) {
              if $r.set(DCCmgr,SecondQ) == On && $level($fulladdress) >= $r.set(DCCmgr,SQlevel) { 
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
              if $r.set(DCCmgr,SecondQ) == On && $level($fulladdress) >= $r.set(DCCmgr,SQlevel) {
                if ($Pqueue(0) >= $r.set(XDCC,Max.Queues.Total)) { .notice $nick $c(1) $+ You have too many transfers right now and all Priority Queue slots are in use. }
                elseif ($Pqueue.nick($nick) >= $r.set(XDCC,Max.Queues.Each)) { .notice $nick $c(1) $+ Sorry, you have too many transfers right now and you have used all your queue slots.  If you still want to get a file please wait for one to finish and try again. }
                else {
                  Pqueue.add XDCC $nick $iif($address($nick,5) != $null,$address($nick,5),$fulladdress) $ctime $r.xdcc.pack($remove($3,$chr(35)),Filename)
                  if ($result isnum) { .notice $nick $c(1) $+ That queue already exists in queue slot $chr(35) $+ $result $+ , try and get another file next time. }
                  else { .notice $nick $c(1) $+ Priority Queuing $+ $c(2) $r.xdcc.pack($remove($3,$chr(35)),Desc) $+ $c(1) ( $+ $size($file($r.xdcc.pack($remove($3,$chr(35)),Filename)).size) $+ ).  It has been placed in queue slot $chr(35) $+ $Pqueue(0) $+ , it will send when sends are available. }
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
        else { .notice $nick Unrecognized command $2 $+ .  Type "/ctcp $me XDCC Help" for help. }
      }
    }
  }
  if ($1- == QUEUES) && %prvQueuesFlag [ $+ [ $iNetwork ] ] != 1 {
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
        else { .timer 1 $calc(%fserve-q * 2) .msg $nick $c(2) $+ Queue $chr(35) $+ %fserve-q $C(1) $+ for $c(2) $+ $iif(($r.set(DCCmgr,CloakNicks) != On || $nick == $gettok($Pqueue(%fserve-q),2,32)),$gettok($Pqueue(%fserve-q),2,32),Cloaked User) $+ $c(1) is queued for file $c(2) $+ $nopath($gettok($Pqueue(%fserve-q),5-,32)) $bracket($size($lof($gettok($Pqueue(%fserve-q),5-,32)))) using the $c(2) $+ $gettok($Pqueue(%fserve-q),1,32) $+ $c(1) $+ . | goto queuestart }
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
        else { .timer 1 $calc(%fserve-q * 2) .msg $nick $c(2) $+ Queue $chr(35) $+ %fserve-q $c(1) $+ for $c(2) $+ $iif(($r.set(DCCmgr,CloakNicks) != On || $nick == $gettok($queue(%fserve-q),2,32)),$gettok($queue(%fserve-q),2,32),Cloaked User) $+ $c(1) is queued for file $c(2) $+ $nopath($gettok($queue(%fserve-q),5-,32)) $bracket($size($lof($gettok($queue(%fserve-q),5-,32)))) using the $c(2) $+ $gettok($queue(%fserve-q),1,32) $+ $c(1) $+ . | goto queuestart }
      }
    }
    close -m $nick
    halt
  }
  if ($1- == SENDS) && %prvQueuesFlag [ $+ [ $iNetwork ] ] != 1 {
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
  if ($1 == PAGE) {
    if ($chan != $null) { .notice $nick My pager doesn't respond to mass channel ctcps! $ilogo }
    elseif ($away != $true) && $r.set(Invision,PagerAlways) != On { .notice $nick $c(1) $+ Pager is currently off. $ilogo }
    elseif ($r.set(Away,Pager) != On) && $r.set(Invision,PagerAlways) != On { .notice $nick $c(1) $+ Pager is currently off. $ilogo }
    else {
      if ($r.set(Invision,SndOpt26) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound28) }  
      var %page-c = 0
      :start-chk
      inc %page-c 1
      if ($r.pager(%page-c,Message) == $null) {   
        if ($r.set(Away,Tooltip.Pager) == On) { noop $tip(Pager,Page received from $nick,$iif($2 == $null,<none>,$2-),$null,$readini($mircini,files,trayicon),1,window -a @Invision_Pager,$null) } 
        w.pager %page-c Nick $replace($replace($nick,[,_),],_) $chr(40) $+ $iNetwork $+ $chr(41)
        w.pager %page-c Time $iif($atime,$v1,hh:nntt) on $date(dddd) $+ , $date(mmmm doo) $+ , $date(yyyy)
        w.pager %page-c Message $iif($2 == $null,<none>,$2-)
        if ($window(@Invision_Pager) == $null) { window -kal15 @Invision_Pager -1 -1 550 300 @Invision_Pager | if ($gettok($readini($r.glob(Invision,Theme),n,background,@Invision_Pager),1,44) != $null) { .background -c @Invision_Pager $v1 } }
        titlebar @Invision_Pager
        clear -l @Invision_Pager
        clear @Invision_Pager
        set %page-c 0
        :start-list
        inc %page-c 1
        if ($r.pager(%page-c,Message) != $null) { aline -l @Invision_Pager $r.pager(%page-c,Nick) | goto start-list }
        else {
          aline -ph @Invision_Pager Time: $r.pager($calc(%page-c - 1),Time)
          aline -ph @Invision_Pager Message: $r.pager($calc(%page-c - 1),Message)
          .notice $nick $c(1) $+ Page Received!.  $ilogo
          unset %page-c
        }
      }
      else { goto start-chk }
    }
  }
  if ($left($1,-1) == FTPinfo) { 
    if ($chan(0) > 0) { 
      set %whatftp [ $+ [ $iNetwork ] ] $right($1-,1)
      if (($r.set(FTP. [ $+ [ %whatftp [ $+ [ $iNetwork ] ] ] ] ,Ops) == On) && ($FTPrankChk($nick,%whatftp [ $+ [ $iNetwork ] ] ,OP) == $true)) || (($r.set(FTP. [ $+ [ %whatftp [ $+ [ $iNetwork ] ] ] ] ,Voice) == On) && ($FTPrankChk($nick,%whatftp [ $+ [ $iNetwork ] ] ,VOICE) == $true)) || (($r.set(FTP. [ $+ [ %whatftp  [ $+ [ $iNetwork ] ] ] ] ,Friends) == On) && ($level($fulladdress) >= 15)) || (($r.set(FTP. [ $+ [ %whatftp  [ $+ [ $iNetwork ] ] ] ] ,Everyone) == On) && ($FTPChanCheck($nick,%whatFTP [ $+ [ $iNetwork ] ] ) == $true)) { 
        advertise notice FTP $right($1,1) $nick 
      } 
      else { notice $nick $c(2) $+ FTP %whatftp [ $+ [ $iNetwork ] ] information is currently restricted. } 
    } 
  }
  if ($1 == HELP) { 
    var %tmptimeadd = 0
    if ($r.set(mp3serv,CTCP) == On) && ($r.set(mp3serv,Pause) != On) && ($r.set(mp3serv,Listen) == On) { mp3servHELP | var %tmptimeadd = 20 }
    if ($level($fulladdress) >= 20) {
      .ctcpreply $nick $1 Sending Help Info Now!
      .timer 1 $calc(2 + %tmptimeadd) .msg $nick $ilogo CTCP Channel Ops Remote Command List
      .timer 1 $calc(4 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me FTPINFOx $c(1) $+ to retrieve my FTP Server Information where x is the ad number 1-5 (this may require you be voiced, opped, and or in my friends list)
      .timer 1 $calc(6 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me Startup <FservePW> $c(1) $+ to startup my File Server.
      .timer 1 $calc(8 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me Shutdown <FservePW> $c(1) $+ to shutdown my File Server.
      .timer 1 $calc(10 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me Close <FservePW> $c(1) $+ to Close my File Server(Runs out the queue then shutsdown.
      .timer 1 $calc(12 + %tmptimeadd) .msg $nick $c(1) $+ The Following can only be remotely set if I am /away.
      .timer 1 $calc(14 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me BITCHMODE <On/Off> <RemotePW> $c(1) $+ When on I will deop anyone opped that's not in my friends list.
      .timer 1 $calc(16 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me PROTECTFRIENDS <On/Off> <RemotePW> $c(1) $+ When on I will protect friends from deop and kicks.
      .timer 1 $calc(18 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me SERVEROPS <On/Off> <RemotePW> $c(1) $+ When on I deop anyone opped by a server.
      .timer 1 $calc(20 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me REPEATFLOOD <On/Off> <RemotePW> $c(1) $+ When on I ban a domain when there is mass joins from one domain.
      .timer 1 $calc(22 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me NICKFLOOD <On/Off> <RemotePW> $c(1) $+ When on I will ban and kick those that nick change flood.
      .timer 1 $calc(24 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me KICKFLOOD <On/Off> <RemotePW> $c(1) $+ When on I Kick on Text Floods in Channel.
      .timer 1 $calc(26 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me BANFLOOD <On/Off> <RemotePW> $c(1) $+ When on I will ban the user for text flooding the channel.
      .timer 1 $calc(28 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me KICKTRADES <On/Off> <RemotePW> $c(1) $+ When on I will kick those that offer to "trade".
      .timer 1 $calc(30 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me MASSDEOPS <On/Off> <RemotePW> $c(1) $+ When on I deop/kick those that start mass deopping people.
      .timer 1 $calc(32 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me AUTOLIMIT <On/Off> <RemotePW> $c(1) $+ When on I maintain a set headroom for +l for the channel to block mass joins.
      .timer 1 $calc(34 + %tmptimeadd) .msg $nick $c(2) $+ /ctcp $me LOCKDOWN <On/Off> <RemotePW> $c(1) $+ In the event of multi attacks on the channel I will temporarily Lock the channel.
      .timer 1 $calc(36 + %tmptimeadd) .msg $nick $c(1) $+ Those in my friends list are immune to most all aggressive actions. ie: if a friend massdeops people no action will be taken even if MASSDEOPS is on. 
    }
    Halt
  }

  if ($1 == SETNICK) && ($level($fulladdress) >= 30) { 
    w.set Personal.Info Nick $2 | .nick $2 | .ctcpreply $nick $1 Nick successfully set to $2 | if $r.set(ChanOps,LogDefense) == On { deflog Nick Changed to $2 by $nick at $time(h:nn:tt) }  
    halt
  }
  if $1 == ChanOps {
    ;     **********************      Chanop CTCP's like so: /ctcp <my nick> ChanOps <#channel> <ChanRC-PW> <Command> <On/Off> 
    ;
    if $level($fulladdress) <= 19 || $cfchk($2,+rc) != $true || $away != $true || $5 == $null { goto leave }
    if $cgetset($2,rcpw) == $null { aecho $nick Tried to access Channel Settings Remote Control but you have no password set for it! | goto leave }
    if $ufchk($fulladdress,+rc,$2) != $true {
      aecho $nick Tried to access Channel Settings Remote Control but did not have the permisions set for it! 
      .notice $nick You do not have Remote Control Permisions for $2
      goto leave
    }
    if $decipher($3) != $cgetset($2,rcpw) && ($istok(FTPV FSV LEARNKEY WALLOPS AUTOLIMIT LOCKDOWN BITCHMODE PROTECTFRIENDS REPEATFLOOD NICKFLOOD MASSDEOPS SERVEROPS KICKTRADES KICKFLOOD BANFLOOD,$4,32) == $true) { aecho $nick Attempted to Remote Control Channel Set but the password was incorrect | .ctcpreply $nick RC PW for Channel was incorrect | goto leave }
    if ($4 == PROTECTFRIENDS) { 
      var %dum = $csetset($2,pf,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog Protect Friends %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == SERVEROPS) { 
      var %dum = $csetset($2,so,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog SERVEROPS %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == BITCHMODE) { 
      var %dum = $csetset($2,bm,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog Bitchmode %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == MASSDEOPS) { 
      var %dum = $csetset($2,do,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog MASSDEOPS %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == KICKFLOOD) { 
      var %dum = $csetset($2,kf,$5) | .ctcpreply $nick $4 %dum $5
      if $r.set(ChanOps,LogDefense) == On { deflog KICKFLOOD %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == KICKTRADES) { 
      var %dum = $csetset($2,kt,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog KICKTRADES %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == BANFLOOD) { 
      var %dum = $csetset($2,bf,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog BANFLOOD %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == REPEATFLOOD ) { 
      var %dum = $csetset($2,rf,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog REPEATFLOOD %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == NICKFLOOD) { 
      var %dum = $csetset($2,nf,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog NICKFLOOD %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == WALLOPS) { 
      var %dum = $csetset($2,wo,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog WALLOPS %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == LEARNKEY) { 
      var %dum = $csetset($2,kl,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog LEARNKEY %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == AUTOLIMIT) { 
      var %dum = $csetset($2,pl,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog AutoLimit %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == FTPV) { 
      var %dum = $csetset($2,ftp,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog FTPV %dum turned On by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    elseif ($4 == FSV) { 
      var %dum = $csetset($2,fs,$5) | .ctcpreply $nick $4 %dum $5 
      if $r.set(ChanOps,LogDefense) == On { deflog FSV %dum turned $5 by $nick at $time(h:nn:tt) } 
      goto leave 
    }
    :leave
    Halt
  }
  if ($1 == Shutdown) { if $ufchk($fulladdress,+rf,Default) && ($decipher($2) == $r.set(Fserve,Remote.pw)) && ($level($fulladdress) >= 15) { ctcpreply $nick $1 File Server Shutting Down. | advertise stop Fserve } | else { ctcpreply $nick $1 : $c(2) $+ Either the Password is incorrect or Remote Control is currently disabled. } }
  if ($1 == Startup) { if $ufchk($fulladdress,+rf,Default) && ($decipher($2) == $r.set(Fserve,Remote.pw)) && ($level($fulladdress) >= 15) { ctcpreply $nick $1 File Server Starting Up. | advertise start Fserve } | else { ctcpreply $nick $1 : $c(2) $+ Either the Password is incorrect or Remote Control is currently disabled. } }
  if ($1 == Close) { if $ufchk($fulladdress,+rf,Default) && ($decipher($2) == $r.set(Fserve,Remote.pw)) && ($level($fulladdress) >= 15) { ctcpreply $nick $1 File Server Closing Down. | advertise close Fserve } | else { ctcpreply $nick $1 : $c(2) $+ Either the Password is incorrect or Remote Control is currently disabled. } }
  if ($1 == Version) && ($r.set(Invision,Stealth) != On) { .ctcpreply $nick $1 $ilogo $+ $c(1) $r.static(Script,Version) $eval($r.static(Script,build),2) with $r.static(Script,Features) $c(1) $+ by $c(2) $+ cRYOa $c(1) $+ on $c(2) $+ Win $+ $os $c(1) $+ obtained from $c(2) $+ #Invision on irc.irchighway.net $c(1) and $c(2) $r.static(Script,WebPage) }
  ;if ($1 == Invision ) && ($nick == $r.static(Script,Author)) { .ctcpreply $nick $1 This is $r.glob(Script,Logo) v $+ $r.static(Script,Version) | .notice $nick This is $r.glob(Script,Logo) v $+ $r.static(Script,Version) b $+ $r.static(Script,Build) plus updated fixes for mIRC 6.21 }
  if ($1 == Finger) { .ctcpreply $nick $1 $c(1) $+ $sv($me Idle, $lduration($idle)) $ilogo | halt }
  if ($1 == Time) { .ctcpreply $nick $1 It is currently $time(h:nntt) on $date(dddd) $date(mmmm doo) $+ , $date(yyyy) $+ . ( $+ $tz $+ ) | Halt }
  ;if ($istok(!list @find !mp3search !search @locator [ @ [ $+ [ $me ] ] ] HELP BITCHMODE NICKFLOOD PROTECTFRIENDS SERVEROPS BANFLOOD KICKFLOOD KICKTRADES MASSDEOPS BANDOMAINS OPME SETPW CHANGEPW XDCC PAGE PING LAG FINGER ACTION DCC RESUME SOUND GET mp3 CDCC TIME VERSION FTPINFO1 FTPINFO2 FTPINFO3 FTPINFO4 FTPINFO5 SHUTDOWN STARTUP CLOSE INVISION SLOTS,$1,32) != $true) { ctcpreply $nick Invalid CTCP command. }

}
on &*:ctcpreply:*:{
  flud CTCP $fulladdress
  mflud ctcp
  if $r.set(Invision,BlockCTCPall) == On { Halt }
  if $r.set(Invision,BlockCTCP2) == On && $level($fulladdress) <= 14 { Halt }
  if $r.set(Invision,LogCTCP) == On { write $shortfn($mircdir) $+ invision\logs\ctcp.log $time(dddd m/d/yyyy h:nntt) $chr(91) $+ $iNetwork $+ $chr(93) - $nick ( $+ [ $fulladdress ] $+ ) CTCPREPLY $1- }
  if ($2 isnum) && ($1 == ping) && ($ticks >= $2) { set %ping [ $+ [ $iNetwork ] ] $calc(($ticks - $2) / 1000) | aecho $nick $bracket($address) had a ping reply of $c(2) $+ $lduration(%ping [ $+ [ $iNetwork ] ] ) $+ $c(1) $+ ! | if ($r.set(Auto.Pinger,Status) == On) { .notice $nick $c(2) $+ Your ping reply was $lduration(%ping [ $+ [ $iNetwork ] ] ) $ilogo } | unset %ping [ $+ [ $iNetwork ] ] | HALT }
  else { 
    echo $colour(ctcp) -a $chr(91) $+ $nick $upper($1) reply $+ $chr(93) $+ : $clradj($2-)
  }
  halt
}
