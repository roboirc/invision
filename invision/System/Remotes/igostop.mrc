; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: igostop.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: 
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
on ^*:quit:{
  if ($nick == $me) { scid -a saveallsettings | SaveAllGlobals }
  if ($chr(126) isin $nick) { return }
  d.whois $nick
  if (($3 == $null) && ($chr(46) isin $1) && ($chr(46) isin $2) && (%netsplit [ $+ [ $iNetwork ] ] != on)) {
    aecho 4Netsplit Detected. $c(1) $+ « $+ $c(2) $+ $1- $+ $c(1) $+ » | if ($r.set(Invision,SndOpt25) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound27) }
    set %netsplit [ $+ [ $iNetwork ] ] on
    set %chkSplit [ $+ [ $iNetwork ] ] 1    
    .timer -o 1 50 checksplit
    .timer -o 1 60 unset %netsplit [ $+ [ $iNetwork ] ]
    .timer -o 1 300 unset %chkSplit [ $+ [ $iNetwork ] ]
  }
  if  (%netsplit [ $+ [ $iNetwork ] ] != on) {
    if ( ( $nick == $r.set(Personal.Info,Nick) ) && ( $r.set(Invision,KeepNick) == On ) && ( $r.set(Personal.Info,Nick) != n/a ) ) { nick $r.set(Personal.Info,Nick) }
    if ($r.set(DCC.Watch,Status) == On) {
      .timer -o 1 0 watchclose $nick q
      .timer -o 1 0 watchqueues $nick q
    }
  }
  if $r.set(Invision,Seen) == On && (($level($fulladdress) >= 15) || ($r.set(Invision,SeenTrack) == All)) { 
    wseen $remove($nick,$chr(123),$chr(125),$chr(94),$chr(91),$chr(93)) QUIT $adate $ctime $1-
  }
  If ($nick != $me) { .timer 1 0 gainops }
  if $mevents(quits) == 0 || $mevents(quits) == 2 {
    ;var %ct = 1
    ;while (%ct <= $chan(0)) {
    incomwith $colour(quit) $nick $nick « $+ $gettok($fulladdress,2-,33) $+ » has Quit iRC $iif($len($1-) > 6, $chr(40)) $+ $iif($left($1-,5) == QUIT:,$right($replace($1-,$chr(151),$chr(8212)),-6),$replace($1-,$chr(151),$chr(8212))) $+  $+ $color(quit) $+ $iif($len($1-) > 6, $chr(41)) 
    ;  inc %ct 1
    ;  continue
    ;}
  }
  if $mevents(quits) == 1 || $mevents(quits) == 2 {
    echo $color(quit) -st $nick « $+ $gettok($fulladdress,2-,33) $+ » has Quit iRC $iif($len($1-) > 6, $chr(40)) $+ $iif($left($1-,5) == QUIT:,$right($1-,-6),$1-) $+  $+ $color(quit) $+ $iif($len($1-) > 6, $chr(41))
  }
  if ($nick == $me) { 
    unset %Nserv [ $+ [ $iNetwork ] ]
    unset %Mserv [ $+ [ $iNetwork ] ]
    unset %Cserv [ $+ [ $iNetwork ] ]
    unset %Lag.Time [ $+ [ $iNetwork ] ]
    unset %whoisjoinflag [ $+ [ $iNetwork ] ]
    unset %FTct [ $+ [ $iNetwork ] ]
    unset %urlct [ $+ [ $iNetwork ] ]
    unset %nfchan [ $+ [ $iNetwork ] ]
    unset %chk.chtouse [ $+ [ $iNetwork ] ]
  }
  halt
}
alias watchclose {
  if $1 != $null {
    if $DCCwatchchk($1) == $false { 
      if (($isend($1) != $null) || ($fserv($1) != $null)) { 
        .timerDCCW $+ $iNetwork $+ $1 -o 1 $iif($2 == P,60,600) close -fs $1 
        set %DCCW [ $+ [ $1 ] ] [ $+ [ $iNetwork ] ] 1 
        .timer -o 1 $iif($2 == P,65,185) unset %DCCW [ $+ [ $1 ] ]  [ $+ [ $iNetwork ] ] 
        aecho DCC Sends to $1 will be stopped in $iif($2 == p,1,10) $+ min. if they don't return to the channel. 
        if $2 == p { .msg $1 Your DCC Sends will be terminated unless you return to the channel within 1 min. }
      }
    }
  }
}
alias watchqueues {
  if $1 != $null {
    if $DCCwatchchk($1) == $false {
      if $Queue.nick($1) >= 1 || $PQueue.nick($1) >= 1 {
        .timerDCCQ $+ $1 $+ $inetwork -o 1 $iif($2 == P,58,598) ClrQueues $1 
        set %DCCQ [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ] 1 
        .timer -o 1 $iif($2 == P,65,185) unset %DCCQ [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ]
        aecho DCC Queues for $1 will be deleted in $iif($2 == p,1,10) $+ min. if they don't return to the channel. 
        if $2 == p { .msg $1 Your DCC Queues will be removed unless you return to the channel within 1 min. }
      }
    }
  }
}
; ################################################
; ##                                    PART
; ################################################
on ^*:part:#:{
  if (%mfludjp [ $+ [ $chan ] ] == 1) { Halt }
  mflud join $chan
  if $comchan($nick,0) == 0 { d.whois $nick }
  if ($r.set(DCC.Watch,Status) == On) {
    .timer -o 1 0 watchclose $nick p
    .timer -o 1 0 watchqueues $nick p
  }
  if ($nick != $me) {
    if ($1- != $null) {
      if $mevents(parts) == 0 { 
        echo $colour(part) -t $chan $nick ( $+ $address $+ ) has parted. ( $+ $1- $+ ) $bracket($calc($nick($chan,0,a) - 1),$iif($calc($nick($chan,0,a) - 1) == 1,person,people)) 
      }
      if $mevents(parts) == 1 { 
        echo $colour(part) -st $nick ( $+ $address $+ ) has parted $chan $+ . ( $+ $1- $+ ) $bracket($calc($nick($chan,0,a) - 1),$iif($calc($nick($chan,0,a) - 1) == 1,person,people)) 
      }
    }
    else { 
      if $mevents(parts) == 0 { 
        echo $colour(part) -t $chan $nick ( $+ $address $+ ) has parted. $bracket($calc($nick($chan,0,a) - 1),$iif($calc($nick($chan,0,a) - 1) == 1,person,people)) 
      }
      if $mevents(parts) == 1 { 
        echo $colour(part) -st $nick ( $+ $address $+ ) has parted $chan $+ . $bracket($calc($nick($chan,0,a) - 1),$iif($calc($nick($chan,0,a) - 1) == 1,person,people)) 
      }
    }
  }
  if $r.set(Invision,Seen) == On && (($level($fulladdress) >= 15) || ($r.set(Invision,SeenTrack) == All)) { 
    wseen $remove($nick,$chr(123),$chr(125),$chr(94),$chr(91),$chr(93)) PART $adate $ctime $chan
  }
  if ($nick != $me) { .timer 1 0 gainops }
  if $r.set(AutoInform,Status) == On {
    if $r.set(AutoInform,Part) == On && $istok($r.set(AutoInform,Channels),$chan,44) { 
      if $r.set(AutoInform,Excludes) == On && $level($address($nick,5)) >= 15 { goto jump }
      if $r.set(AutoInform,Via) == Msg {
        if $r.set(AutoInform,Msg) != $null { .msg $nick [ [ $r.set(AutoInform,Msg) ] ] }
      }
      else {
        if $r.set(AutoInform,Msg) != $null { .notice $nick [ [ $r.set(AutoInform,Msg) ] ] }
      } 
      :jump
    }
  }
  haltdef
}
; ################################################
; ##                                    JOIN
; ################################################
on ^*:join:#:{
  var %curNetwork = $iNetwork
  if (%mfludjp [ $+ [ $chan ] ] == 1) { Halt }
  mflud join $chan
  if ($r.set(Invision,ChanScan) == On) {
    if ($chr(126) !isin $nick) {
      if (%whoisjoinflag [ $+ [ %curNetwork ] ] <= 3) || (%whoisjoinflag [ $+ [ %curNetwork ] ] == $null) {
        inc %whoisjoinflag [ $+ [ %curNetwork ] ] 1
        .timerwjf $+ %curNetwork -o 1 2 unset %whoisjoinflag [ $+ [ %curNetwork ] ]
        if ($r.whois($nick) == $null) && ($nick != $me) {
          w.whois $nick 1
          set -u2 %whois.chan. $+ $nick $chan
          whois $nick
          .timer 1 $iif((%chanscandly isnum),%chanscandly,2) if $!remove($ial( $+ [ $nick ] $+ ).mark, [ $chan ] ) != $!null $chr(123) echo [ $chan ] $c(1) $!ts < $+ [ $nick ] $+ > is also in channels $!bracket($remtok($ial( $+ [ $nick ] $+ ).mark,$wildtok($ial( $+ [ $nick ] $+ ).mark,* $!+ $chan ,1,32),1,32)) $chr(125)
        }
      }
    }
  }
  if ($nick != $me) && (%DCCW [ $+ [ $nick ] ] [ $+ [ %curNetwork ] ] == 1) { 
    .timerDCCW $+ $nick $+ %curNetwork off 
    unset %DCCW [ $+ [ $nick ] ] [ $+ [ %curNetwork ] ]
    aecho $c(2) $+ $nick $c(1) $+ returned to the channel in time enough not to lose their sends.
    .timer 1 0 .notice $nick $c(1) $+ You returned to the channel in time enough not to lose your sends.
  }
  if ($nick != $me) && (%DCCQ [ $+ [ %curNetwork ] ] [ $+ [ $nick ] ] == 1) { 
    .timerDCCQ $+ $nick $+ %curNetwork off 
    unset %DCCQ [ $+ [ %curNetwork ] ] [ $+ [ $nick ] ]
    aecho $c(2) $+ $nick $c(1) $+ returned to the channel in time enough not to lose their Queues.
    .timer 1 0 .notice $nick $c(1) $+ You returned to the channel in time enough not to lose your Queues.
  }
  if ($nick == $me) { 
    echo $chan $tag $c(1) $+ Successfully joined $c(2) $+ $chan $c(1) $+ on $c(2) $+ $time(dddd) $c(1) $+ at $c(2) $+ $time(h:nntt) 
    .timer 1 1 pladjsetup $chan
    if ($r.glob(Nick.Colors,ForceUL) == On) || ($r.set(Invision,ForceIAL) == On) { .timer 1 $calc($chan(0) * 3) .who $chan } 
    w.set Invision RecentChans $addtok($r.set(Invision,RecentChans),$chan,44)
    :jmp1
    if ($numtok($r.set(Invision,RecentChans),44) >= 10) { w.set Invision RecentChans $deltok($r.set(Invision,RecentChans),1,44) | goto jmp1 }
    if ($r.set(Invision,SndOpt32) == On) { .timer 1 1 SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound35) } 
    if ($istok($r.cf(ChanOps,Channels),$chan,44)) {   
      .timer 1 12 chmodeEnforce $chan
    } 
  }
  else {
    if ($ialchan($wildsite,$chan,0) > 1) {
      var %clone.w-c = 0
      :start
      inc %clone.w-c
      if ($ialchan($wildsite,$chan,%clone.w-c) == $null) {
        if ($mevents(joins) == 0) {
          echo $colour(join) -t $chan $nick ( $+ $address $+ ) has joined $+ $iif($r.set(Invision,HideClones) != On,$chr(44) but is a 4Clone of $gettok(%clone.w-m,1-,38),.)  $+ $colour(join) $bracket($nick($chan,0,a),$iif($nick($chan,0,a) == 1,person,people))
        }
        if ($mevents(joins) == 1) {
          echo $colour(join) -st $nick ( $+ $address $+ ) has joined $+ $chan $iif($r.set(Invision,HideClones) != On,$chr(44) but is a 4Clone of $gettok(%clone.w-m,1-,38),.)  $+ $colour(join) $bracket($nick($chan,0,a),$iif($nick($chan,0,a) == 1,person,people))
        }
        unset %clone.w-c %clone.w-m
      }
      elseif ($ialchan($wildsite,$chan,%clone.w-c).nick == $nick) { goto start }
      else { if ($len(%clone.w-m) <= 500) { var %clone.w-m = %clone.w-m $ialchan($wildsite,$chan,%clone.w-c).nick & } | goto start }
    }
    else { 
      if ($mevents(joins) == 0) {
        echo $colour(join) -t $chan $nick ( $+ $address $+ ) has joined. $bracket($nick($chan,0,a),$iif($nick($chan,0,a) == 1,person,people)) 
      }
      if ($mevents(joins) == 1) {
        echo $colour(join) -st $nick ( $+ $address $+ ) has joined $chan. $bracket($nick($chan,0,a),$iif($nick($chan,0,a) == 1,person,people)) 
      }
    }
  }
  if ($r.set(Messenger,Status) == On) {
    if ($r.set(Messenger,Mode) == Join) {
      if ($CheckPending($fulladdress)) {
        .msg $nick $c(1) $+ I have $c(2) $+ $messagect($fulladdress) $c(1) $+ message(s) waiting for you. Please message me back $c(2) $+ !getmsg $c(1) $+ command to receive. $ilogo 
      }
    }
  }
  if ($level($fulladdress) == 5) { if ($me isop $chan || $me ishop $chan) { mode $chan -o+b $nick $mask($fulladdress,3) | kick $chan $nick $isset($r.shit($replace($address($nick,3),^,$chr(61))),No Reason Specified) (Shitlisted) | aecho $nick $bracket($address) is going to be removed from $c(2) $+ $chan $+ $c(1) $+ . $bracket(Shitlisted) } }
  if ($gettok($r.greet($nick),1,32) == $nick) && ($r.set(Auto.Greet,Status) == On) && (($istok($r.set(Auto.Greet,Channels),$chan,44) == $true) || ($r.set(Auto.Greet,Channels) == All) || ($r.set(Auto.Greet,Channels) == $null)) { msg $chan $c(2) $+ «  $nick  » $c(1) $+ -  $+ $gettok($r.greet($nick),2-,32) }
  if ($r.set(Invision,Seen) == On) && (($level($address($nick,5)) >= 15) || ($r.set(Invision,SeenTrack) == All)) { 
    wseen $remove($nick,$chr(123),$chr(125),$chr(94),$chr(91),$chr(93)) JOIN $adate $ctime $chan
  }
  if ($me isop $chan) {
    if ($ufchk($fulladdress,+v,$chan)) { .timer 1 $rand(1,10) isvoc $nick . $+ $chan $address($nick,2) }
    if ($ufchk($fulladdress,+o,$chan)) { .timer 1 $rand(1,10) isopc $nick . $+ $chan $address($nick,2) }
  }
  if ($r.set(AutoInform,Status) == On) {
    if ($r.set(AutoInform,Join) == On) && ($istok($r.set(AutoInform,Channels),$chan,44)) { 
      if ($r.set(AutoInform,Excludes) == On) && ($level($address($nick,5)) >= 15) { goto jump }
      if ($r.set(AutoInform,Via) == Msg) {
        if ($r.set(AutoInform,Msg) != $null) { .msg $nick [ [ $r.set(AutoInform,Msg) ] ] }
      }
      else {
        if ($r.set(AutoInform,Msg) != $null) { .notice $nick [ [ $r.set(AutoInform,Msg) ] ] }
      } 
      :jump
    }
  }
  .timerjj $+ %curNetwork -o 1 8 unset %jj [ $+ [ %curNetwork ] ]
  set %jj [ $+ [ %curNetwork ] ] 1
  if ($nick != $me) { if ($r.set(Enforcer,Status) == On) { if ($istok($r.set(Enforcer,Channels),$chan,44)) { .timer $+ Enforce $+ $nick $+ %curNetwork 1 $r.set(Enforcer,Delay) Enforcer $nick } } }
  haltdef
}
; ################################################
; ##                                    KICK
; ################################################
on ^*:kick:#:{
  if ($r.set(DCC.Watch,Status) == On) && (($isend($knick) != $null) || ($fserv($knick) != $null)) && (($istok($r.set(DCC.Watch,Channels),$chan,44) == $true) || ($r.set(DCC.Watch,Channels) == All) || ($r.set(DCC.Watch,Channels) == $null)) { close -fs $knick | .notice $knick $c(1) $+ All of your DCC connections with me have been halted because you left one of the following channels. $bracket($iif($r.set(DCC.Watch,Channels) == $null || $r.set(DCC.Watch,Channels) == All,Any channel I am on,$r.set(DCC.Watch,Channels))) | aecho $knick lost all of their DCC connections because they left $c(2) $+ $chan $+ $c(1) $+ . }
  if ($knick == $me) { 
    if ($r.set(Invision,SndOpt4) == On) { 
      SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound4) 
      if ($me ison $chan) { 
        echo $colour(kick) -t $chan You were kicked by $nick ( $+ $clradj($1-) $+ ) 
      } 
      echo $colour(kick) -st You were kicked from $chan by $nick ( $+ $clradj($1-) $+ ) 
    }
    else { 
      if $mevents(kicks) == 0 {
        echo $colour(kick) -t $chan $knick was kicked by $nick ( $+ $clradj($1-) $+ ) 
      }
      if $mevents(kicks) == 1 {
        echo $colour(kick) -st $knick was kicked from $chan by $nick ( $+ $clradj($1-) $+ ) 
      }
    }
    haltdef
  } 
}
; ################################################
; ##                                    CONNECT
; ################################################
on *:connect:{ .timer 1 1 connroutine }
; ################################################
; ##                                    DISCONNECT
; ################################################
on *:disconnect:{
  if $scon(0) == 0 { if $exists( [ $r.glob(Themes,TrayIcon1) ] ) { .tray -i0 $r.glob(Themes,TrayIcon1) } | else { .tray -ix } }
  if ($window(@Ports) != $null) { window -c @Ports }
  ; .timer 1 0 tbar 
  if ($r.set(Invision,SndOpt3) == On) { .timer 1 0 SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound3) }
  .timerAlways_Home $+ $iNetwork off
  .timerKeep_Nick $+ $iNetwork off
  if $scon(0) == 0 {
    .timerevery3 off 
    .titlebar - Invision $r.static(Script,Version) $r.static(Script,Build) - http://www.i-n-v-i-s-i-o-n.com
    .addonunload dalnet.mrc
  }
  if (%Connected [ $+ [ $server ] ] != 1) { aecho Settings Not Saved | halt }
  if %impscript != i2 && %spacesindir != 1 { freetables }
  ; unset %SCIDnet [ $+ [ $cid ] ] 
  unset %connected [ $+ [ $server ] ]
  unset %Nserv [ $+ [ $iNetwork ] ]
  unset %Mserv [ $+ [ $iNetwork ] ]
  unset %Cserv [ $+ [ $iNetwork ] ]
  unset %Lag.Time [ $+ [ $iNetwork ] ]
  unset %whoisjoinflag [ $+ [ $iNetwork ] ]
  unset %FTct [ $+ [ $iNetwork ] ]
  unset %urlct [ $+ [ $iNetwork ] ]
  unset %advise [ $+ [ $iNetwork ] ]
  unset %reply [ $+ [ $iNetwork ] ]
  unset %nfchan [ $+ [ %curNetwork ] ]
  unset %jj [ $+ [ %curNetwork ] ]
  unset %chk.chtouse [ $+ [ $iNetwork ] ]
}
; ################################################
; ##                                    STARTUP
; ################################################
on 1:start:{
  if (%iDebug) echo -s 13Entered STARTUP
  var %os = $iif(((Windows 2000 isin $dll(invision.dll,invisionOS,_)) && (Build 2600 isin $dll(invision.dll,invisionOS,_))),$replace($dll(invision.dll,invisionOS,_),2000,XP),$dll(invision.dll,invisionOS,_))
  var %os = $iif(Windows 2000 isin %os || Windows XP isin %os,$xpos $+ $right(%os,- $+ $calc($pos(%os,build) + 9)),%os)
  if ($procinfo(Name) != $null) {
    var %cores = $replace($procinfo(NumberOfCores),2,Dual,3,Triple,4,Quad)
    set %procinfo $iif(%cores isnum 5-,$v1 $+ x) $procinfo(Name)
    if (Core !isin %procinfo && %cores isnum 2-4) { set %procinfo %procinfo %cores Core }
  }
  else unset %procinfo
  set %imemtotal $isystem(ComputerSystem,TotalPhysicalMemory,1)
  unset %startcheck %fservenicks %chatserv* %lastct* %ojk* %LFL* %LFN* %tmp* %flud* %NOSSEND* %DCCallow* %Sessionlevel* %SCIDnet*
  if (%iDebug) echo -s 13Unset Variables
  ;  .timerstartchk $+ $iNetwork -io 1 1 if $chr(37) $+ startcheck != 1 $chr(123) .timer -io 1 60 exit $chr(124) dialog -m booterror booterror $chr(125) 
  .timerstartchk $+ $iNetwork -io 1 1 if $chr(37) $+ startcheck != 1 $chr(123) echo -s 04SEVERE ERROR ON STARTUP.  Invision may not function correctly.  It is recommended that you find and fix the error, or reinstall Invision. $chr(125)
  if (%iDebug) echo -s 13Did Boot Error Timer 
  if ( $r.mirc(Invision,Shutdown) != 1  && $r.mirc(Invision,Rebooting) != 1 && $r.mirc(Invision,HideTwoInvisionsWarning) != 1 ) { 
    .timerAutoClosedTI $+ $iNetwork -io 1 30 if $!dialog(twoinvisions) != $!null $chr(123) dialog -x twoinvisions $chr(125) 
    dialog -m twoinvisions twoinvisions
  } 
  else { w.mirc Invision Shutdown 0 }
  if (%iDebug) echo -s 13Finished Two Instance running check
  if ($bits != 32) { error Invision is designed to work with 32 bit mIRC and will not run correctly with other versions. | halt }
  if (%iDebug) echo -s 13bits 32 check
  if ($version < 7) { error Invision is designed for mIRC 7.0 and above, please download mIRC 7.0 or above from http://www.mirc.com or else download Invision 3.1.3, which will work with mIRC $version $+ . | halt }
  if (%iDebug) echo -s 13version check
  if $lock(dll) || $lock(run) {
    .timerstartchk $+ $iNetwork off
    var %dum =  $input(The Lock options in mIRC for /run and /dll have been enabled. Invision like most other scripts cannot function correctly under this condition. To fix this $+ $chr(44) go to mIRC Options $crlf $chr(40) $+ ALT + O $+ $chr(41) > General > Lock > and make sure everything in this section is unchecked. Hit OK and then Restart Invision.,516,Invision is locked out!!) 
    set %spacesindir 1 
    halt
  }
  if (%iDebug) echo -s 13Did Lock Check
  if %LogoQuiet != On { .scriptinfo }
  if %LogoQuiet != On { .ibar 1 }
  loadallglobals
  if (%iDebug) echo -s 13Loaded Globals
  loadallsettings
  if (%iDebug) echo -s 13Loaded Settings
  if ($r.static(Script,Build) == $null) { w.static Script Build (May '10) }
  var %vd = 1068933333
  if ($r.glob(Invision,LastUpdate) < %vd) { w.glob Invision LastUpdate %vd }
  if ($r.glob(Invision,PatchUpdate) < %vd) { w.glob Invision PatchUpdate %vd }
  if ($r.glob(Invision,LastNews) < %vd) { w.glob Invision LastNews %vd }
  if (%iDebug) echo -s 13Did Last Updates
  if %LogoQuiet != On { .ibar 10 }
  DefaultSettings
  if (%iDebug) echo -s 13Did Default Settings
  unset %OKB*
  ulcleanout
  if (%iDebug) echo -s 13Did Userlist Cleanout
  if %LogoQuiet != On { .ibar 15 }
  set %Screen@ $gettok($dll(invision.dll,invisionRES,_),1,32)
  if (%iDebug) echo -s 13Did Screen Res
  w.glob Script Start $calc( [ $r.glob(Script,Start) ] + 1)
  SaveAllGlobals
  if (%iDebug) echo -s 13DId Startup Time Clac
  if $r.glob(Script,Start) == 1 { defaultsounds | if (%iDebug) echo -s 13Did Default Sounds }
  if ($r.glob(Invision,SndOpt1) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound1) }
  if (%iDebug) echo -s 13Did Startup SOund
  if $exists( [ $r.glob(Themes,TrayIcon1) ] ) { .tray -i0 $r.glob(Themes,TrayIcon1) } | else { .tray -ix }
  if %LogoQuiet != On { .ibar 18 }
  if $exists( [ $shortfn($mircdir) $+ patch\i2patch.exe ] ) { .timer -io 1 30 .remove $shortfn($mircdir) $+ patch\i2patch.exe }
  if (%iDebug) echo -s 13Timer set for patch clean
  load-all-inputs
  if (%iDebug) echo -s 13loaded winamp filters
  load-waveout
  if (%iDebug) echo -s 13did winamp waveout
  if %LogoQuiet != On { .ibar 22 }
  unset %Messenger* %Requeue* %Away* %ForceTrig* 
  .rlevel 13
  if (%iDebug) echo -s 13cleared temp dcc
  unset %DirRecCT* %DRN* %DCCW* %BOT* %mp3his* %TWCT* %BI* %LastSound %DST* %DFWK* %DSWK*
  .timer -io 1 0 soundFXtable
  if %LogoQuiet != On { .ibar 30 }
  acrotable
  if (%iDebug) echo -s 13Did Acro Table
  tbar 
  if ($r.glob(Script,Start) == 1) && $r.mirc(Invision,Reboot) != 1 { w.set Colors Colors On | w.set Colors Color.1 12 | w.set Colors Color.2 11 }
  aecho  $+ You are running $r.glob(Script,Logo) $r.static(Script,Version) $r.static(Script,build) with $r.static(Script,Features) created by $r.static(Script,Author) running under mIRC v $+ $version from $C(2) $+ #Invision on irc.irchighway.net
  aecho You have now started Invision $iif($r.glob(Script,Start) == 1,$v1 time,$v1 times) since installed.
  if %LogoQuiet != On { .ibar 40 }
  if ($r.glob(Script,Start) == 1) { .timer -o 1 5 firststartimp | w.glob Invision USD $ctime | aecho This is your first time running $r.glob(Script,Logo) $+ , you should go to the Main Settings under ''Invision'' on the Menu bar. If you have questions please use the Invision Help under the Invision Menu. | DefaultSounds } | nobad | if $r.glob(Invision,Halted) == $someid { exit }
  if %LogoQuiet != On { .ibar 50 }
  unset %masstmp
  .flood off
  if %LogoQuiet != On { .ibar 60 }
  if $r.glob(Invision,PDCC) != $null || $r.glob(Invision,PDCC) != off { .pdcc on } | else { .pdcc off } 
  .dcc packetsize $r.glob(Invision,PacketSize) | echo $clradj($ilogo) 4DCC Sends have been optimized for best performance 
  .timerAdjustBW -io 0 10 AdjustBW
  if %LogoQuiet != On { .ibar 70 }
  unset %mp3dirplay %mp3resume 
  if $isfile( [ $r.glob(Themes,ToolBarBG1) ] ) { background -l $r.glob(Themes,ToolBarBG1) } | else { /background -lx }
  if $r.glob(Invision,ScriptGuard) == On { .timer -io 1 0 scriptguard }
  if %LogoQuiet != On { .ibar 80 }
  if $r.glob(Invision,ScriptCheck) == On { .timer -io 1 0 scriptcheck }
  if $r.glob(Invision,PortChk) == On { .timer -io 1 0 portcheck }
  if $r.glob(Invision,SpamList) == $null { w.glob Invision SpamList .pro,inviter,#,www.,http:// }
  if $r.glob(mp3serv,FileTypes) == $null { w.glob mp3serv FileTypes .mp3,.wma,.mpg,.wav }
  if $r.glob(Invision,SizeOn) == $null { w.glob Invision SizeOn On }
  if $r.glob(Invision,RateFixOn) == $null { w.glob Invision RateFixOn On }
  if $r.glob(Invision,SeenTrack) == $null { w.glob Invision SeenTrack Friends }

  if %LogoQuiet != On { .ibar 90 }
  if %LastDCCQueDir == $null { set %LastDCCQueDir C:\ }
  usdstat
  clralltmpdcc
  if %LogoQuiet != On { .ibar 100 }
  if %mp3cachedelay == $null || %mp3cachedelay >= 600 || %mp3cachedelay <= 0 { set %mp3cachedelay 15 }
  .timer -io 1 2 .window -c @Invision 
  .timer -io 1 2 if $!exists( [ $gettok($readini($r.glob(Invision,Theme),n,background,Status),1,44) ] ) == $!true .background -sc $gettok($readini($r.glob(Invision,Theme),n,background,Status),1,44)
  if $r.mirc(Invision,mp3btn) == On { .timer -io 1 5 testmp3 }
  unset %ispeed.disp
  if ($r.glob(DCCmgr,DCCSpeedMonitor) == On) { .timer -io 1 5 dispdccbar | unset %ispeed.disp }
  if $exists( [ $gettok($readini($r.glob(Invision,Theme),n,files,TrayIcon1),1,44) ] ) { tray -i0 $readini($r.glob(Invision,Theme),n,files,TrayIcon1) } | else { tray -ix }

  .timer -io 1 1 w.mirc Invision Rebooting 0
  unset %imp*
  if $r.glob(Invision,TS) != $null { .timestamp -fe $r.glob(Invision,TS) | .timestamp on } | else { .timestamp off } 
  set %startcheck 1
  set %mircdir $shortfn($mircdir)
  w.mirc Wizard Advise $calc($r.mirc(wizard,advise) + 1)
  if ($r.glob(Invision,ConnectOnStart) == On) {
    .timer 1 1 iConnectOnStart
  }
  DCCSpeedWindow
}
alias -l iConnectOnStart {
  if ($read($shortfn($mircdir\Invision\Settings\Servers.lst),1)) { server $v1 }
  var %c = 2, %t = $lines($shortfn($mircdir\Invision\Settings\Servers.lst))
  while (%c <= %t) {
    server -m $read($shortfn($mircdir\Invision\Settings\Servers.lst),%c)
    inc %c
  }
}
; ################################################
; ##                                    EXIT
; ################################################
on *:exit:{
  RequeueSends
  titlebar $tbar.site
  w.mirc Invision Shutdown 1
  .background -sx
  teststop
  if %impscript != i2 && %spacesindir != 1 { }
  unset %spacesindir
}
; ################################################
; ##                            SET DEFAULT SOUNDS
; ################################################
alias DefaultSounds {
  var %ct = 1
  var %sounds = i2start.wav,connect.wav,disconn.wav,kicked.wav,opped.wav,deopped.wav,voiced.wav,devoiced.wav,flood.wav,gainops.wav,banset.wav,banunset.wav,privmsg.wav,invited.wav,addonl.wav,addonu.wav,dccfilex.wav,dccsend.wav,dccfail.wav,dccfail.wav,dccignore.wav,OpenFS.wav,FSsearch.wav,Qfull.wav,FSstart.wav,FSstop.wav,netsplit.wav,pager.wav,topic.wav,chngserv.wav,scanning.wav,chanlock.wav,chanrstr.wav,sitestor.wav,chanjoin.wav,nickspot.wav,mp3start.wav,mp3stop.wav,ipscan.wav,away.wav,back.wav,click.wav,saved.wav,dopen.wav,privmsg.wav,dccchat.wav
  while (%ct <= $numtok(%sounds,44)) {
    w.glob Themes Sound $+ %ct invision\themes\sounds\default\ $+ $gettok(%sounds,%ct,44) 
    inc %ct 1 
  }
}
alias settingsafety {
  if ($r.set(Invision,SeenTrack) == $null) {
    loadallsettings
  }
}
