; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: ialias1.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: The common Alias routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

iq { if ($r.set(Invision,Stealth) != On) { return $ilogo $r.static(Script,Version) $r.static(Script,build) } | else { return $null } }
j { if ($server != $null) { if ($1 != $null) { if ($1 == -i) { join -i } | else { join $iif($2,$iif($1 == -n,-n #$2 $3-,$iif($1 == -x,-x #$2 $3-,#$1 $2-)),#$1 $2-) } } | else { error Usage: /j <#channel> } } | else { error Connect to server first! } } 
p { if (($me ison $1) || ($me ison $active)) { part $iif($me ison $1,$1,$active) $iif($me ison $1,$2-,$1-) } | else { error Usage: /p <#channel> <message> } }
k { if ((($me ison $1) && ($2 != $null)) || (($me ison $active) && ($1 != $null))) { kick $iif($me ison $1,$1,$active) $iif($me ison $1,$2-,$1-) } | else { error Usage: /k [#channel] <nick> [message] } }
q { if ($1 != $null) { query $1 $2- } | else { error Usage: /q <nickname> [message] } }
join { if ($server != $null) { if ($1 != $null) { if ($1 == -i) { !join -i } | else { if ($me ison #$1) { !join $iif($2,$iif($1 == -n,-n #$2 $3-,$iif($1 == -x,-x #$2 $3-,#$1 $2-)),#$1 $2-) } | else { !join $iif($2,$iif($1 == -n,-n #$2 $3-,$iif($1 == -x,-x #$2 $3-,#$1 $2-)),#$1 $2-) } } } } | else { error Connect to server first! } }
ping { if ($1 != $null) { .ctcp $1 ping } }
kb { if (($me ison $1) && ($2 != $null)) || (($me ison $active) && ($1 != $null)) { if ($address($iif($me ison $1,$2,$1),5) == $null) { mode $iif($me ison $1,$1,$active) -o+b $iif($me ison $1,$2,$1) $iif($me ison $1,$2,$1) $+ !*@* | kick $iif($me ison $1,$1,$active) $iif($me ison $1,$2-,$1-) } | else { mode $iif($me ison $1,$1,$active) -o+b $iif($me ison $1,$2,$1) $address($iif($me ison $1,$2,$1),$r.glob(Invision,DefaultBan)) | kick $iif($me ison $1,$1,$active) $iif($me ison $1,$2-,$1-) } } | else { error Usage: /kb [#channel] <nick> [message] } }
kb2 { if (($me ison $1) && ($2 != $null)) || (($me ison $active) && ($1 != $null)) { if ($address($iif($me ison $1,$2,$1),5) == $null) { mode $iif($me ison $1,$1,$active) -o+b $iif($me ison $1,$2,$1) $iif($me ison $1,$2,$1) $+ !*@* | kick $iif($me ison $1,$1,$active) $iif($me ison $1,$2-,$1-) $+  } | else { mode $iif($me ison $1,$1,$active) -o+b $iif($me ison $1,$2,$1) $address($iif($me ison $1,$2,$1),$r.glob(Invision,DefaultBan)) | kick $iif($me ison $1,$1,$active) $iif($me ison $1,$2-,$1-) $+  } } | else { error Usage: /kb [#channel] <nick> [message] } }
rkick { return $read($shortfn($mircdir) $+ Text\kick.txt) }
rk { kick $1 $2  $+ $rkick $+  $+ $iif($ilogo,$+($chr(41) $chr(40),$ilogo)) }
whodat { if ($address($1,5) == $null) { .who $1 } }
pladjsetup {
  if ($1 != $null) {
    if ($istok($r.cf(ChanOps,Channels),$1,44)) && ($cfchk($1,+pl)) {
      .timerpladj $+ $1 $+ $iNetwork 0 $calc($cgetset($1,plint) * 60) pladj $1
    }
  }
  else { 
    var %ct = 1
    while (%ct <= $chan(0)) { 
      if ($istok($r.cf(ChanOps,Channels),$chan(%ct),44)) && ($cfchk($chan(%ct),+pl)) {
        .timerpladj $+ $chan(%ct) $+ $iNetwork 0 $calc($cgetset($chan(%ct),plint) * 60) pladj $chan(%ct)
      }
      inc %ct 1 
    }
  }
}
pladj {
  if ($1 != $null) {
    if (($me isop $1) && ($cfchk($1,+pl))) {
      var %limit = $calc($cgetset($1,plhr) + $nick($chan($1),0))
      if ($chan($1).limit != %limit) { .mode $1 +l %limit }
    }
  }
}
LockChannel { 
  if (($1 != $null) && ($1 ischan) && ($me isop $1)) {
    if (%LOCK [ $+ [ $iNetwork ] ] $+ $right($1,-1) != 1) {
      if ($r.set(Invision,SndOpt30) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound32) }
      if ($len($chan($1).topic) >= 1) { set %LOCK [ $+ [ $iNetwork ] ] $+ $right($1,-1) $+ .topic $chan($1).topic } | else { set %LOCK [ $+ [ $iNetwork ] ] $+ $right($1,-1) $+ .topic 12-I12-n12-v12-i12-s12-i12-o12-n12- $chan 12-I12-n12-v12-i12-s12-i12-o12-n12- }
      set %LOCK [ $+ [ $iNetwork ] ] $+ $right($1,-1) $+ .mode $chan($1).mode
      .msg $1 $c(2) $+ is temporarily locking down the channel. Sorry for any inconvience. $ilogo
      .mode $1 +minpsl $calc($nick($1,0) -2)
      .topic $1 $c(2) $+ Temporarily locking down Channel. Sorry for any inconvience.
      set %LOCK [ $+ [ $iNetwork ] ] $+ $right($1,-1) 1
      .timerplWatch $+ $iNetwork off
      aecho $1 has been locked down for $r.set(ChanOps,ldTime) minutes.
      if ($r.set(ChanOps,LogDefense) == On) { deflog $1 was locked down at $time(h:nn:tt) }
    }
  }
}
UnlockChannel {
  if (($1 != $null) && ($me isop $1)) {
    if (%LOCK [ $+ [ $iNetwork ] ] [ $+ [ $right($1,-1) ] ] == 1 ) { 
      if ($r.set(Invision,SndOpt30) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound33) }
      .mode $1 -milntsp
      .msg $1 $c(2) $+ has restored the channel to Normal Mode. Sorry for the inconvience. $ilogo
      .mode $1 %LOCK [ $+ [ $iNetwork ] ] [ $+ [ $right($1,-1) ] ] [ $+ [ .mode ] ]
      if (%LOCK [ $+ [ $iNetwork ] ] $+ $right($1,-1) $+ .topic != $null) { 
        .topic $1 %LOCK [ $+ [ $iNetwork ] ] [ $+ [ $right($1,-1) ] ] [ $+ [ .topic ] ]
      } 
      else { .topic $1 Welcome to $1 }
      if ($r.set(ChanOps,plStatus) == On) { 
        plAdj 
        .timerplWatch $+ $iNetwork 0 $calc($r.set(ChanOps,plTime) * 60) plAdj 
      }
      unset %LOCK [ $+ [ $iNetwork ] ] [ $+ [ $right($1,-1) ] ] [ $+ [ * ] ]
      aecho $1 has been unlocked and restored to it's previous state.
      if ($r.set(ChanOps,LogDefense) == On) { deflog $1 was unlocked and restored at $time(h:nn:tt) }
    }
  }
}
scriptinfo { window -hkpado +Ls @Invision $int($calc(( [ $window(-3).w ] - 220)/2)) 200 366 72 @Invision | clear @Invision | drawpic -c @Invision 0 0 invision\gfx\i2logostat.jpg }
usearch { if ($1 != $null) { scanclear | set %usearch-ip [ $+ [ $iNetwork ] ] $1 | dns $1 } }
port { if ($server != $null) { if ($window(@Ports) == $null) { window -kl @Ports $r.winpos(@Ports) @Ports } | else { window -a @Ports } | stats l } | else { error You are not connected to a server } }
bandwidth { var %bw-u = 0 | var %bw-c = 0 | :start | inc %bw-c 1 | if ($send(%bw-c) == $null) { return %bw-u } | else { inc %bw-u $iif($send(%bw-c).done != $true && $send(%bw-c).status != failed,$send(%bw-c).cps,0) | goto start } }
gbandwidth { var %gbw-u = 0 | var %gbw-c = 0 | :start | inc %gbw-c 1 | if ($get(%gbw-c) == $null) { return %gbw-u } | else { inc %gbw-u $iif($get(%gbw-c).done != $true && $get(%gbw-c).status != failed,$get(%gbw-c).cps,0) | goto start } }
rpunct { return $remove($strip($1-,burc),$chr(33),$chr(34),$chr(39),$chr(40),$chr(41),$chr(44),$chr(45),$chr(46),$chr(47),$chr(58),$chr(59),$chr(60),$chr(62),$chr(63),$chr(91),$chr(92),$chr(93),$chr(94),$chr(95),$chr(96),$chr(123),$chr(124),$chr(125)) }
incomwith { 
  if (($1 isnum) && ($3 != $null)) { 
    var %ecomc = 0 
    :start 
    inc %ecomc 1 
    if ($comchan($2,%ecomc) == $null) { unset %ecomc } 
    else { 
      echo $1 -t $comchan($2,%ecomc) $3- $iif(has QUIT isin $3-,$bracket($calc($nick($comchan($2,%ecomc),0,a) - 1),$iif($calc($nick($comchan($2,%ecomc),0,a) - 1) == 1,person,people)))
      goto start 
    } 
  } 
}
rejoin { if ($1 == $null) { if ($me ison $chan) { hop } | elseif ($chan) { join $chan } } | else { if ($me ison $1) { hop -c $1 } | else { join $1 } } }
uloads { .timer 1 0 .Addonunload system\remotes\dalnet.mrc }
close { if ($1 == $null) { echo -a  $+ $colour(info) $+ * /close: insufficient parameters | halt } | !close $1- | if (-s isin $1) || (-fs isin $1) { queue.send } }
ilogo { 
  if (($r.set(Invision,Stealth) != On) || ($1 == S)) {
    if (($1 != X) && ($r.set(colors,colors) == On)) { 
      var %logoclr = $r.set(colors,LogoClr)
      if ($r.set(Colors,LogoTheme) == On && $r.set(Colors,LogoThemeNumber) != $null) {
        ; Alternating Color Themes
        if ($istok(Christmas@Thanksgiving@Valentines@Candy Cane@Spring Frost@Snowing,$r.set(Colors,LogoThemeNumber),64)) {
          if ($r.set(Colors,LogoThemeNumber) == Christmas) { var %ilogoc1 = 04, %ilogoc2 = 09 }
          elseif ($r.set(Colors,LogoThemeNumber) == Thanksgiving) { var %ilogoc1 = 07, %ilogoc2 = 05 }
          elseif ($r.set(Colors,LogoThemeNumber) == Valentines) { var %ilogoc1 = 13, %ilogoc2 = 04 }
          elseif ($r.set(Colors,LogoThemeNumber) == Candy Cane) { var %ilogoc1 = 04, %ilogoc2 = 00 }
          elseif ($r.set(Colors,LogoThemeNumber) == Spring Frost) { var %ilogoc1 = 09, %ilogoc2 = 00 }
          elseif ($r.set(Colors,LogoThemeNumber) == Snowing) { var %ilogoc1 = 12, %ilogoc2 = 00 }
          if ($r.set(Colors,LogoThemeReverse) == On) { var %ilogoc.tmp = %ilogoc1, %ilogoc1 = %ilogoc2, %ilogoc2 = %ilogoc.tmp }
          return  $+ %logoclr $+ — $+ %ilogoc1 $+ I $+ %logoclr $+ - $+ %ilogoc2 $+ n $+ %logoclr $+ - $+ %ilogoc1 $+ v $+ %logoclr $+ - $+ %ilogoc2 $+ i $+ %logoclr $+ - $+ %ilogoc1 $+ s $+ %logoclr $+ - $+ %ilogoc2 $+ i $+ %logoclr $+ - $+ %ilogoc1 $+ o $+ %logoclr $+ - $+ %ilogoc2 $+ n $+ %logoclr $+ — 
        }
        ; 3/2/3 Themes
        if ($istok(Bloody@Fourth of July,$r.set(Colors,LogoThemeNumber),64)) {
          if ($r.set(Colors,LogoThemeNumber) == Bloody) { var %ilogoc1 = 04, %ilogoc2 = 05, %ilogoc3 = 04 }
          elseif ($r.set(Colors,LogoThemeNumber) == Fourth of July) { var %ilogoc1 = 04, %ilogoc2 = 00, %ilogoc3 = 12 }
          if ($r.set(Colors,LogoThemeReverse) == On && $r.set(Colors,LogoThemeNumber) == Bloody) { var %ilogoc1 = %ilogoc2, %ilogoc2 = %ilogoc3, %ilogoc3 = %ilogoc1 }
          elseif ($r.set(Colors,LogoThemeReverse) == On) { var %ilogoc.tmp = %ilogoc1, %ilogoc1 = %ilogoc3, %ilogoc3 = %ilogoc.tmp }
          return  $+ %logoclr $+ — $+ %ilogoc1 $+ I $+ %logoclr $+ - $+ %ilogoc1 $+ n $+ %logoclr $+ - $+ %ilogoc1 $+ v $+ %logoclr $+ - $+ %ilogoc2 $+ i $+ %logoclr $+ - $+ %ilogoc2 $+ s $+ %logoclr $+ - $+ %ilogoc3 $+ i $+ %logoclr $+ - $+ %ilogoc3 $+ o $+ %logoclr $+ - $+ %ilogoc3 $+ n $+ %logoclr $+ — 
        }
        ; Standard Gradient Themes
        if ($r.set(Colors,LogoThemeNumber) == Default (Gray)) { var %ilogoc1 = 14, %ilogoc2 = 15, %ilogoc3 = 00 }
        elseif ($r.set(Colors,LogoThemeNumber) == Fire) { var %ilogoc1 = 04, %ilogoc2 = 07, %ilogoc3 = 08 }
        elseif ($r.set(Colors,LogoThemeNumber) == Green) { var %ilogoc1 = 10, %ilogoc2 = 03, %ilogoc3 = 09 }
        elseif ($r.set(Colors,LogoThemeNumber) == Ice) { var %ilogoc1 = 12, %ilogoc2 = 11, %ilogoc3 = 15 }
        elseif ($r.set(Colors,LogoThemeNumber) == Kids) { var %ilogoc1 = 04, %ilogoc2 = 08, %ilogoc3 = 09 }
        elseif ($r.set(Colors,LogoThemeNumber) == Ocean) { var %ilogoc1 = 12, %ilogoc2 = 10, %ilogoc3 = 11 }
        elseif ($r.set(Colors,LogoThemeNumber) == Primary Color) { var %ilogoc1 = $c(1), %ilogoc2 = $c(1), %ilogoc3 = $c(1) }
        elseif ($r.set(Colors,LogoThemeNumber) == Secondary Color) { var %ilogoc1 = $c(2), %ilogoc2 = $c(2), %ilogoc3 = $c(2) }
        elseif ($r.set(Colors,LogoThemeNumber) == Violet) { var %ilogoc1 = 05, %ilogoc2 = 06, %ilogoc3 = 13 }
        if ($r.set(Colors,LogoThemeReverse) == On) { var %ilogoc.tmp = %ilogoc1, %ilogoc1 = %ilogoc3, %ilogoc3 = %ilogoc.tmp }
        return  $+ %logoclr $+ — $+ %ilogoc1 $+ I $+ %logoclr $+ - $+ %ilogoc2 $+ n $+ %logoclr $+ - $+ %ilogoc2 $+ v $+ %logoclr $+ - $+ %ilogoc3 $+ i $+ %logoclr $+ - $+ %ilogoc3 $+ s $+ %logoclr $+ - $+ %ilogoc2 $+ i $+ %logoclr $+ - $+ %ilogoc2 $+ o $+ %logoclr $+ - $+ %ilogoc1 $+ n $+ %logoclr $+ — 
      }
      else return  $+ %logoclr $+ —14I $+ %logoclr $+ -15n $+ %logoclr $+ -15v $+ %logoclr $+ -00i $+ %logoclr $+ -00s $+ %logoclr $+ -15i $+ %logoclr $+ -15o $+ %logoclr $+ -14n $+ %logoclr $+ — 
    } 
    else { 
      return —I-n-v-i-s-i-o-n— 
    } 
  }
}
i2BigReset {
  w.glob Script Connect 0
  w.glob Script Start 0
  d.glob Invision Recent.Server.1
  d.glob Invision Recent.Server.2
  d.glob Invision Recent.Server.3
  d.glob Invision Recent.Server.4
  d.glob Invision Recent.Server.5
  d.glob Invision Recent.Server.6
  d.glob Invision Recent.Server.7
  d.glob Invision Recent.Server.8
  d.glob Invision Recent.Server.9
  d.glob Invision Recent.Channels
  saveallglobals
  aecho 9Settings Reinitialized.
}
dns { if ($1 == $null) { aecho Error Usage: /dns [-c] <host/ip/nick> | return } | .!dns $1- }
tag { return $c(1) $+ > }
aecho { 
  if ($1 != $null) {
    if ((%lastaecho == $1-) && (433 isin $1-)) { goto leave }
    if (%AEFlag [ $+ [ $iNetwork ] ] == $null) { 
      set %AEFlag [ $+ [ $iNetwork ] ] 1 
      .timerAEFclr $+ $iNetwork 1 2 .unset %AEFlag [ $+ [ $iNetwork ] ] 
      if ($left($active,1) == @) { secho $1- }
      else { 
        if ($activecid != $cid) {
          echo -st $clradj($ilogo(S)) $c(1) $+ $1- 
        }
        else {
          echo -at $clradj($ilogo(S)) $c(1) $+ $1- 
        }
      } 
    } 
    else { 
      if ($left($active,1) == @) { secho $1- } 
      else { 
        if ($activecid != $cid) {
          echo -st $c(1) $+ > $1- 
        }
        else {
          echo -at $c(1) $+ > $1- 
        }
      }
    }

    :leave
    set %lastaecho $1-
    .timerAECHOclr $+ $iNetwork -o 1 60 unset %lastaecho
  }
}
secho { 
  if ($1 != $null) {
    if ((%lastsecho == $1-) && (away isin $1-)) { goto leave }
    if (%SEFlag [ $+ [ $iNetwork ] ] != 1) { 
      set %SEFlag [ $+ [ $iNetwork ] ] 1 
      .timerSEFclr $+ $iNetwork 1 2 unset %SEFlag [ $+ [ $iNetwork ] ] 
      echo -st $clradj($ilogo(S)) $+ $c(1) $1- 
    } 
    else { echo -st $c(1) $+ > $1- } 

    :leave
    set %lastsecho $1-
    .timerSECHOclr $+ $iNetwork -o 1 60 unset %lastsecho
  }
}
echo { if ($strip($2-) == Playback stopped) || ($strip($2-) == Playback paused) { Halt } | else { !echo $1- } }
bracket { 
  if ($1- != $null) { 
    if ((http: !isin $1-) && ($chr(35) !isin $1-)) { return $c(1) $+ « $+ $c(2) $+ $1- $+ $c(1) $+ » } 
    else { return $c(1) $+ « $+ $c(2) $+ $chr(32) $+ $1- $+ $chr(32) $+ $c(1) $+ » } 
  }
}
tbracket { 
  if ($1- != $null) { 
    if ((http: !isin $1-) && ($chr(35) !isin $1-)) { return $c(1) $+ « $+ $c(2) $+ $1- $+ $c(1) $+ » } 
    else { return $c(1) $+ « $+ $c(2) $+ $chr(32) $+ $1- $+ $chr(32) $+ $c(1) $+ » } 
  }
}
border { if ($1- != $null) { return $chr(91) $+ $1- $+ $chr(93) } }
sv { if (http: !isin $1-) { return $1 $+ : $+ $chr(171) $+ $c(2) $+ $iif($r.set(Invision,BoldData) == On,) $+ $2- $+ $iif($r.set(Invision,BoldData) == On,) $+ $c(1) $+ $chr(187) } | else { return $1 $+ : $+ $chr(171) $+ $chr(32) $+ $c(2) $+ $2- $+ $c(1) $+ $chr(32) $+ $chr(187) } } 
sv2 { if (http: !isin $1-) { return $1 $+ : $+ $chr(171) $+ $c(2) $+ $iif($r.set(Invision,BoldData) == On,) $+ $2- $+ $iif($r.set(Invision,BoldData) == On,) $+ $c(1) $+ $chr(187) } | else { return $1 $+ : $+ $chr(171) $+ $chr(32) $+ $c(2) $+ $2- $+ $c(1) $+ $chr(32) $+ $chr(187) } } 
nosv { if (http: !isin $1-) { return $1 $+ : $c(2) $+ $iif($r.set(Invision,BoldData) == On,) $+ $2- $+ $iif($r.set(Invision,BoldData) == On,) $+ $c(1) } | else { return $1 $+ : $chr(32) $+ $c(2) $+ $2- $+ $c(1) } } 
gnick { if ($istok($r.set(Trusted.Nicks,Nicknames),$1,44) == $true) { return $false } | else { return $true } }
isnum { if ($1 isnum) && (($1 >= 1) || (($1 == $2) && ($2 isnum) && ($2 >= 0))) { return $true } | else { return $false } }
vnum { if ($1 == $null) { return $iif($isnum($2,0) == $true,$2,1) } | var %isnum = 0 | :start | inc %isnum 1 | if ($mid($1,%isnum,1) == $null) { if ($isnum($1) == $true) { return $1 } | else { return $iif($isnum($2,0) == $true,$2,1) } } | elseif ($mid($1,%isnum,1) !isnum) { if ($mid($1,$calc(%isnum - 1),1) == $null) { return $iif($isnum($2,0) == $true,$2,1) } | elseif ($isnum($mid($1,1,$calc(%isnum - 1))) == $true) { return $mid($1,1,$calc(%isnum - 1)) } | else { return $iif($isnum($2,0) == $true,$2,1) } } | else { goto start } }
isset { if (($1 == $null) && ($2 == $null)) { return n/a } | elseif (($1 == $null) && ($2 != $null)) { return $2 } | else { return $1 } }
atime { return $time($r.glob(Invision,TS)) }
month { return $date(mmmm) }
year { return $date(yyyy) }
error { echo -at $iif($activecid != $cid,$iNetwork) $c(2) $+ ERROR $c(1) $+ > $1- }
warn { aecho 8,8---08,01W14,8A8,1R14,8N8,1I14,8N8,1G8,8---1,4 $1- 8,8---8,1W14,8A8,1R14,8N8,1I14,8N8,1G8,8--- }
size { 
  if (($1 < 0) || ($1 !isnum)) { return n/a } 
  if ($r.glob(Invision,SizeOn) == On) { 
    return $bytes($1,3).suf
  }
  else { return $int($1) $+ B }
}
isize {
  if (($1 < 0) || ($1 !isnum)) { return n/a } 
  if ($len($1) <= 3) { return $1 B }
  var %nHold = $bytes($1,3)
  var %nLen = $len(%nHold) 
  if ($chr(46) isin %nHold) {
    if (%nLen < 6) { var %nHold = %nHold $+ $str(0,$calc(4 - %nlen))) }
  }
  else {
    if (%nLen < 5) { var %nHold = %nHold $+ $iif($calc(3 - %nlen) <= 0,$chr(160) $+ $chr(32),$chr(46)) $+ $str(0,$calc(3 - %nlen))) }
  }
  if ($right($bytes($1,3).suf,2) == TB) { 
    var %nSuf = TB 
  } 
  elseif ($right($bytes($1,3).suf,2) == GB) { 
    var %nSuf = GB 
  }
  elseif ($right($bytes($1,3).suf,2) == MB) {
    var %nSuf = MB
  }
  elseif ($right($bytes($1,3).suf,2) == KB) {
    var %nSuf = KB
  }
  else { var %nSuf = 0B }
  return %nHold $+ %nSuf
}
dopen { if ($2 != $null) { if ($dialog($1) == $null) { openingD | dialog -md $1 $2 } | else { dialog -v $1 $2 } | .gmove $calc($dialog($2).x + $dialog($2).w - 40) $dialog($2).y } }
ts { if ($atime != $null) { return $atime } | else { return } }
;cts { return  $+ $atime $+  } 
cts { return $atime } 
cw { return $int($calc(( [ $window(-3).w ] - ( [ $window(-3).w ] * (3/4)))/2)) $int($calc(( [ $window(-3).h ] - ( [ $window(-3).h ] * (3/4)))/2)) $int($calc( [ $window(-3).w ] * (3/4))) $int($calc( [ $window(-3).h ] * (3/4))) }
color { if ($1 isnum 0-15) { if ($1 == 0) { return White } | if ($1 == 1) { return Black } | if ($1 == 2) { return Blue } | if ($1 == 3) { return Green } | if ($1 == 4) { return Red } | if ($1 == 5) { return Brown } | if ($1 == 6) { return Purple } | if ($1 == 7) { return Orange } | if ($1 == 8) { return Yellow } | if ($1 == 9) { return Light Green } | if ($1 == 10) { return Cyan } | if ($1 == 11) { return Light Cyan } | if ($1 == 12) { return Royal Blue } | if ($1 == 13) { return Pink } | if ($1 == 14) { return Grey } | if ($1 == 15) { return Light Grey } } }
vc { if ($left($1,1) != $chr(35)) { return $chr(35) $+ $1- } | else { return $1- } }
nicktimer { 
  if ($isnum($2) == $true) { 
    .timer $+ $1 $+ $iNetwork 0 $2 dec $chr(37) $+ $1 1 $chr(124) if ( $+ $chr(37) $+ $1 <= 0) $chr(123) unset $chr(37) $+ $1 $chr(124) .timer $+ $1 $+ $iNetwork Off $chr(125) 
  } 
}
percent { if (($1 isnum) && ($2 isnum)) { return $round($calc(($1 / $2) * 100),2) $+ $chr(37) } }
chatops { .raw chatops : $+ $1- }
dla { 
  ;   ***********************  dla <$dname> <$did> <csv string> 
  if ($3 != $null) { 
    var %ct = 1 
    while (%ct <= $numtok($3-,44)) {
      did -a $1 $2 $gettok($3-,%ct,44)
      inc %ct 1 
    }
  } 
}
dls { 
  ;   ***********************  dls <$dname> <$did> <saving command> 
  if (($3 != $null) || ($left($3,1) != w)) { 
    var %ct = 0 
    :start 
    inc %ct 1 
    if ($did($1,$2,%ct).text == $null) { 
      $3- %dlg-data 
    } 
    else { 
      var %dlg-data = $addtok(%dlg-data,$did($1,$2,%ct).text,44) 
      goto start 
    } 
  } 
}
dlatok1 { 
  ;   ***********************  dlatok1 <$dname> <$did> <csv string> 
  if ($3 != $null) { 
    var %ct = 1 
    while (%ct <= $numtok($3-,44)) {
      did -a $1 $2 $gettok($gettok($3-,%ct,44),1,32)
      inc %ct 1 
    }
  } 
}
dlstok1 { 
  ;   ***********************  dlstok1 <$dname> <$did> <saving command> 
  if (($3 != $null) || ($left($3,1) != w)) { 
    var %ct = 0 
    :start 
    inc %ct 1 
    if ($did($1,$2,%ct).text == $null) { 
      $3- $gettok(%dlg-data,1,32) 
    } 
    else { 
      var %dlg-data = $addtok(%dlg-data,$gettok($did($1,$2,%ct).text,1,32),44) 
      goto start 
    } 
  } 
}
addons { var %addon = 0 | :start | inc %addon 1 | var %addon-file = $findfile($shortfn($mircdir) $+ Addons,*.ini,%addon) | if (%addon-file == $null) { return %addon-msg } | elseif ($r.addon(%addon-file,Script) != $null) && ($r.addon(%addon-file,Version) != $null) && ($r.addon(%addon-file,Author) != $null)  && ($r.addon(%addon-file,Desc) != $null) && ($r.addon(%addon-file,Date) != $null) && ($script(%addon-file) != $null) { set -u0 %addon-msg %addon-msg + $r.addon(%addon-file,Script) v $+ $r.addon(%addon-file,Version) | goto start } | else { goto start } }
away.msg { if (($away == $true) && ($r.set(Away,Away.Msg) == On)) { awayame $c(1) $+ is AFK, $c(2) $+ $away.reason $away.pager $ilogo } }
away.alert { if ($away == $true) { if ($awaychok($1)) { describe $1 $c(1) $+ is AFK, $away.reason $+ $c(1) $+ . $sv(Gone now for,$away.time) $away.pager $ilogo } } }
away.time { return $c(2) $+ $duration($vnum($calc($ctime - %Away.CTime [ $+ [ $iNetwork ] ] )),2) }
awaytim { return $c(2) $+ $duration($vnum($calc($ctime - %Away.CTime [ $+ [ $iNetwork ] ] )),2) }
away.reason { return $isset(%Away.Reason [ $+ [ $iNetwork ] ] ) }
away.pager { if ($r.set(Away,Pager) == On) { return $c(1) $+ ( $+ $c(2) $+ Pager is On, /ctcp $me Page <message> $+ $c(1) $+ ) } | else { return $c(1) $+ Pager is $c(2) $+ Off } }
away {
  if ($server != $null) {
    if ($1 == sb) { 
      ; ******* Silent Back ******
      aecho $c(1) $+ You are now back from $c(2) $+ $away.reason $+ $c(1) $+ . You were gone for $c(2) $+ $away.time 
      if $r.set(Invision,SndOpt34) == On { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound41) } 
      unset %Away.CTime [ $+ [ $iNetwork ] ] %Away.Reason [ $+ [ $iNetwork ] ] 
      .timerAway. [ $+ [ $iNetwork ] ] [ $+ [ * ] ] Off 
      tbar 
      if (($r.set(Personal.Info,Nick) != $null) && ($r.set(Personal.Info,Nick) != n/a)) { nick $r.set(Personal.Info,Nick) } 
      !away 
    }
    elseif ((%Away.CTime [ $+ [ $iNetwork ] ] != $null) && (%Away.Reason [ $+ [ $iNetwork ] ] != $null) && ($1 != -s)) { 
      ;******* REGULAR BACK ******
      awayame $c(1) $+ is back from $c(2) $+ $away.reason $+ $c(1) $+ . I was gone for $c(2) $+ $away.time $ilogo 
      if $r.set(Invision,SndOpt34) == On { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound41) } 
      unset %Away.CTime [ $+ [ $iNetwork ] ] %Away.Reason [ $+ [ $iNetwork ] ] 
      .timerAway. [ $+ [ $iNetwork ] ] [ $+ [ * ] ] Off 
      tbar 
      if (($r.set(Away,Auto.Away) == On) && ($isnum($r.set(Away,Auto.Away.Delay)) == $true)) { 
        .timerAuto.Away $+ $iNetwork 1 $calc($r.set(Away,Auto.Away.Delay) * 60) if $!away == $!false $chr(123) .away auto away after $r.set(Away,Auto.Away.Delay) minutes. $chr(125) 
        if ($r.set(Invision,SndOpt34) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound40) } 
      } 
      if (($r.set(Personal.Info,Nick) != $null) && ($r.set(Personal.Info,Nick) != n/a)) { nick $r.set(Personal.Info,Nick) } 
      !away
    }
    else { 
      ; ******* SET AWAY *******
      set %Away.Reason [ $+ [ $iNetwork ] ] $iif($1 == -s,$2-,$1-) 
      if (%Away.Reason [ $+ [ $iNetwork ] ] == $null) { set %Away.Reason [ $+ [ $iNetwork ] ] on another planet }
      if (%Away.CTime [ $+ [ $iNetwork ] ] == $null) { 
      set %Away.CTime [ $+ [ $iNetwork ] ] $ctime } 
      if ($1 != -s) { 
        awayame $c(1) $+ is AFK, $c(2) $+ $away.reason $ilogo 
        if $r.set(Invision,SndOpt34) == On { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound40) } 
      } 
      else { 
        aecho $c(1) $+ You are now away, $c(2) $+ $away.reason
        if ($r.set(Invision,SndOpt34) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound40) } 
      } 
      if ($isnum($r.set(Away,Away.Msg.Delay)) == $true) { 
      .timerAway. $+ $iNetwork $+ Msg 0 $calc($r.set(Away,Away.Msg.Delay) * 60) away.msg } 
      tbar 
      if ($r.set(Away,Auto.Deop) == On) { dopall } 
      if ($r.set(Away,Away.Nick) != $null) && ($r.set(Away,Away.Nick) != n/a) { .raw nick $r.set(Away,Away.Nick) } 
      .timerAuto.Away $+ $iNetwork Off 
      !away $iif($1 == -s,$2-,$1-) 
    }
  }
}
awayame { 
  if (($r.set(Away,Channels) == All) && ($r.set(Away,ChanInclude) == On)) { ame $1- }
  else {
    var %sss = 0
    var %ct = 1 
    while (%ct <= $chan(0)) { 
      if ($awaychok($chan(%ct))) { 
        .timer 1 $calc(%sss * 2) describe $chan(%ct) $1- 
        inc %sss 1
      }
      inc %ct 1 
    }
  }
}
auto-away { if (($away != $true) && ($r.set(Away,Auto.Away) == On)) { if (($r.set(Invision,AutoAwayMsg.Status) == On) && ($r.set(Invision,AutoAwayMsg.Msg) != $null)) { away $r.set(Invision,AutoAwayMsg.Msg) } | else { away auto away after $r.set(Away,Auto.Away.Delay) minutes. } } }
pager { if ($window(@Invision_Pager) == $null) { window -kal10 @Invision_Pager -1 -1 550 300 @Invision_Pager | .background -c @Invision_Pager $gettok($readini($r.glob(Invision,Theme),n,background,@Invision_Pager),1,44) } | titlebar @Invision_Pager | window -a @Invision_Pager | clear -l @Invision_Pager | clear @Invision_Pager | var %page-c = 0 | :start | inc %page-c 1 | if ($r.pager(%page-c,Nick) == $null)  { unset unset %page-c } | else { aline -l @Invision_Pager $r.pager(%page-c,Nick) | goto start } }
dopall { var %dopall = 0 | :start | inc %dopall 1 | if ($chan(%dopall) == $null) { unset %dopall } | elseif ($me isop $chan(%dopall)) { mode $chan(%dopall) +v-o $me $me | goto start } | else { goto start } }
opall { var %opall = 0 | :start | inc %opall 1 | if ($chan(%opall) == $null) { unset %opall } | elseif ($me !isop $chan(%opall)) { .msg ChanServ OP $chan(%opall) $me | goto start } | else { goto start } }
tz { return GMT $calc($timezone / -3600) $+ $chr(58) $+ 00 }
inisize { if (($file($1).size > 102400) && (*.ini iswm $1)) { write -c $1 } }
c { if (($1 != $null) && ($2 == $null)) { if (($1 isnum 1-2) && ($r.set(Colors,Colors) == On) && ($r.set(Colors,Color. [ $+ [ $1 ] ] ) isnum)) { return $tds($r.set(Colors,Color. [ $+ [ $1 ] ] )) } } }
tds { if ($1 isnum) { if ($1 != 16) { return $chr(3) $+ $iif($len($1) == 1,0) $+ $1 $+ $iif($r.set(Colors,BackgroundScript) isnum 0-1,$+ $chr(44) $+ 0 $+ $v1) } | else { return  } } }
spclr { return $chr(3) $+ $iif($len($r.set(Colors,SpeechClr)) == 1,0) $+ $r.set(Colors,SpeechClr) }
w.acro { if ($3 != $null) { writeini Invision\Acroman.ini $1 $2 $3- } }
r.acro { if ($2 != $null) { return $ireadini(Invision\Acroman.ini,$1,$2) } }
e.acro { if ($2 != $null) { return $readini Invision\Acroman.ini $1 $2 } }
d.acro { if ($2 != $null) { remini Invision\Acroman.ini $1 $2 } }
w.set {
  if (FTP.* iswm $1 && $3 == $null && $hget( [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] )) { hdel [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] $2 }
  elseif ($3 != $null) { hadd -m [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] $2 $3- | hadd -m [ SettingsTables $+ [ $iSetwork ] ] [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] 1 }
}
r.set {  if ($2 != $null) { if ((Fserve.* iswm $1) && ($2 == Root.Dir)) { return $shortfn($hget( [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] ,$2)) } | else { return $hget( [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] ,$2) } } }
d.set { if ($2 != $null) { if $istable( [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] ) { .hdel [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] $2 } } }
d.glob { if ($2 != $null) { if $istable(SettingsGlobal) { .hdel SettingsGlobal $1 $+ $2 } } }
w.glob { if ($3 != $null) { hadd -m SettingsGlobal $1 $+ $2 $3- } }
r.glob { if ($2 != $null) { return $hget(SettingsGlobal, $1 $+ $2) } }
d.gettrk { if ($2 != $null) { if $istable(GetTracker) { .hdel GetTracker $1 $+ $2 } } }
w.gettrk { if ($3 != $null) { hadd -m GetTracker $1 $+ $2 $3- } }
r.gettrk { if ($2 != $null) { return $hget(GetTracker, $1 $+ $2) } }
r.dccwarn { if ($1 != $null) { return $hget(DCCwarn,$1) } } 
w.dccwarn { if ($1 != $null) { hadd -mu900 DCCwarn $1 $ctime } }
wseen { if ($2 != $null) { hadd -m [ SeenData $+ [ $iSetwork ] ] $1 $2- } }
rseen { if ($1 != $null) { return $hget( [ SeenData $+ [ $iSetwork ] ] ,$1) } }
searchseen { 
  var %ct = 1
  while (%ct <= $len($1)) {
    if ($mid($1,%ct,1) isletter) { var %newstr = %newstr $+ $mid($1,%ct,1) }
    else { var %newstr = %newstr $+ * }
    inc %ct 1
  }
  if (($2 isnum) && ($2 != $null)) { 
    return $hmatch( [ SeenData $+ [ $iSetwork ] ] , [ * [ $+ [ %newstr ] ] [ $+ [ * ] ] ] ,$2) 
  } 
} 
searchseenct { 
  var %ct = 1
  while (%ct <= $len($1)) {
    if ($mid($1,%ct,1) isletter) { var %newstr = %newstr $+ $mid($1,%ct,1) }
    else { var %newstr = %newstr $+ * }
    inc %ct 1
  }
  if ($1 != $null) { 
    return $hmatch( [ SeenData $+ [ $iSetwork ] ] , [ * [ $+ [ %newstr ] ] [ $+ [ * ] ] ] ,0) 
  } 
} 
w.fpw { if ($2 != $null) { writeini -n Invision\fpw.ini FPW $1 $strip($2-,burc) } }
r.fpw { if ($1 != $null) { return $readini -n Invision\fpw.ini FPW $1 } }
ow.set { if ($3 != $null) { writeini Invision\Settings.ini $1 $2 $strip($3-,burc) } }
or.set { if ($2 != $null) { return $readini Invision\Settings.ini $1 $2 } }
iw.set { if ($3 != $null) { hadd -m [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] $2 $3- | hadd -m [ SettingsTables $+ [ $iSetwork ] ] [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] 1 } }
ir.set { if ($2 != $null) { return $hget( [ [ $iSetwork ] $+ Settings $+ [ $1 ] ] ,$2) } }
r.imp { if ($3 != $null) { return $readini -n $3- $1 $2 } }
r.addon { if ($2 != $null) { return $readini -n $1 Addon $2 } }
r.country { if ($1 != $null) { return $readini -n System\Country.ini Country $1 } }
w.mirc { if ($3 != $null) { writeini -n $shortfn($mircini) $1 $2 $strip($3-,burc) } }
r.mirc  { if ($2 != $null) { return $readini -n $shortfn($mircini) $1 $2 } }
d.mirc  { if ($2 != $null) { remini $shortfn($mircini) $1 $2 } }
w.static { if ($3 != $null) { writeini -n $shortfn($mircdir) $+ system\i2static.ini $1 $2 $strip($3-,burc) } }
r.static { if ($2 != $null) { return $readini -n $shortfn($mircdir) $+ system\i2static.ini $1 $2 } }
d.static { if ($2 != $null) { remini $shortfn($mircdir) $+ system\i2static.ini $1 $2 } }
w.pager { if ($3 != $null) { writeini -n Invision\Pager.ini Page_# $+ $1 $2 $strip($3-,burc) } }
r.pager { if ($2 != $null) { return $readini -n Invision\Pager.ini Page_# $+ $1 $2 } }
d.pager { if ($isnum($1) == $true) { remini Invision\Pager.ini Page_# $+ $1 } }
xdcc.packs { var %xdcc-p = 0, %xdcc-p2 = 0 | :start | inc %xdcc-p 1 | if (($r.xdcc.pack(%xdcc-p,Filename) != $null) && ($r.xdcc.pack(%xdcc-p,Filename) != None) && (Pack_# isin $ini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,%xdcc-p))) { inc %xdcc-p2 } | if (($r.xdcc.pack(%xdcc-p,Filename) == $null) || ($r.xdcc.pack(%xdcc-p,Filename) == None) && (%xdcc-p >= $ini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,0))) { return $calc(%xdcc-p2) } | goto start }
w.xdcc.pack { if ($3 != $null) { writeini Invision\settings\ $+ [ $iSetwork ] $+ \XDCC.ini Pack_# $+ $1 $2 $3- } }
r.xdcc.pack { if ($2 != $null) { return $ireadini(Invision\settings\ [ $+ [ $iSetwork ] ] [ $+ [ \XDCC.ini ] ] ,Pack_# [ $+ [ $1 ] ] ,$2) } }
d.xdcc.pack { if ($isnum($1) == $true) { remini Invision\settings\ $+ [ $iSetwork ] $+ \XDCC.ini Pack_# $+ $1 } }
r.info { if ($1 != $null) { return $hget(SettingsScript,$1-) } }
w.info { if ($2 != $null) { hadd -m SettingsScript $1 $2- } }
w.winpos { if (($1 != $null) && ($window($1) != $null)) { hadd -m SettingsWinPos $1 $window($1).x $window($1).y $window($1).w $window($1).h } }
r.winpos { if ($hget(SettingsWinPos,$1) == $null) { return $cw } | else { return $hget(SettingsWinPos,$1) } }
w.greet { if ($2 != $null) { hadd -m AutoGreetMessages $replace($1,[,_,],_) $1 $2- | w.set Auto.Greet Status On } }
r.greet { if ($1 != $null) { return $hget(AutoGreetMessages,$replace($1,[,_,],_)) } }
d.greet { if ($1 != $null) { if ($istable(AutoGreetMessages)) { hdel AutoGreetMessages $replace($1,[,_,],_) } } }
c.greet { hfree -w AutoGreetMessages | if $exists( [ $shortfn($mircdir) $+ Invision\AutoGreetMessages.i2d ] ) { .remove $shortfn($mircdir) $+ Invision\AutoGreetMessages.i2d } }
w.cf { if ($3 != $null) { hadd -m [ [ $iSetwork ] $+ Chanset $+ [ $1 ] ] $2 $3- | hadd -m [ SettingsTables $+ [ $iSetwork ] ] [ [ $iSetwork ] $+ Chanset $+ [ $1 ] ] 1 } }
r.cf { if ($2 != $null) { return $hget( [ [ $iSetwork ] $+ Chanset $+ [ $1 ] ] ,$2) } }
d.cf { if ($2 != $null) { if ($istable( [ [ $iSetwork ] $+ Chanset $+ [ $1 ] ] )) { hdel [ [ $iSetwork ] $+ Chanset $+ [ $1 ] ] $2 } } }
w.whois { if ($2 != $null) { hadd -m [ [ $iNetwork ] $+ Whoispool ] $1 $2- } }
r.whois { if ($1 != $null) { return $hget( [ [ $iNetwork ] $+ Whoispool ] ,$1) } }
d.whois { if ($1 != $null) { if ($istable( [ [ $iNetwork ] $+ Whoispool ] )) { hdel [ [ $iNetwork ] $+ Whoispool ] $1 } } }
c.whois { if ($istable( [ [ $iNetwork ] $+ Whoispool ] )) { hfree -w [ [ $iNetwork ] $+ Whoispool ] } }
w.shit { if ($2 != $null) { writeini -n Invision\slmsg.ini Messages $replace($1,[,_,],_) $strip($2-,burc) } }
r.shit { if ($1 != $null) { return $readini -n Invision\slmsg.ini Messages $replace($1,[,_,],_) } }
d.shit { if ($1 != $null) { remini Invision\slmsg.ini Messages $replace($1,[,_,],_) } }
w.rec { if ($3 != $null) { hadd -m Records [ $+ [ $1 ] ] $2 $3- | hadd -m SettingsTables Records [ $+ [ $1 ] ] 1 } }
r.rec { if ($2 != $null) { return $hget(Records [ $+ [ $1 ] ] ,$2) } }
d.rec { if ($2 != $null) { if ($istable( [ Records [ $+ [ $1 ] ] ] )) { hdel Records [ $+ [ $1 ] ] $2 } } }
c.rec { 
  .timer -o 1 0 hdel SettingsTables RecordsDirectories
  .timer -o 1 0 hdel SettingsTables RecordsUsers
  if ($exists( [ $shortfn($mircdir) $+ invision\settings\recordsdirectories.i2s ] )) { .remove [ $shortfn($mircdir) $+ invision\settings\recordsdirectories.i2s ] }
  if ($exists( [ $shortfn($mircdir) $+ invision\settings\recordsusers.i2s ] )) { .remove [ $shortfn($mircdir) $+ invision\settings\recordsusers.i2s ] }
  .hfree -w RecordsDirectories
  .hfree -w RecordsUsers
}
w.nickrec { if ($3 != $null) { hadd -m NickRecords [ $+ [ $1 ] ] $2 $3- | hadd -m SettingsTables NickRecords [ $+ [ $1 ] ] 1 } }
r.nickrec { if ($2 != $null) { return $hget(NickRecords [ $+ [ $1 ] ] ,$2) } }
d.nickrec { if ($2 != $null) { hdel NickRecords [ $+ [ $1 ] ] $2 } }
c.nickrec { 
  .hfree -w NickRecordsNicks
  .timer -o 1 0 hdel SettingsTables NickRecordsNicks
  if $exists( [ $shortfn($mircdir) $+ invision\settings\nickrecordsNicks.i2s ] ) { .remove [ $shortfn($mircdir) $+ invision\settings\nickrecordsNicks.i2s ] }
}
w.leech { if ($3 != $null) { hadd -m Leech [ $+ [ $1 ] ] $2 $3- | hadd -m SettingsTables Leech [ $+ [ $1 ] ] 1 } }
r.leech { if ($2 != $null) { return $hget(Leech [ $+ [ $1 ] ] ,$2) } }
d.leech { if ($2 != $null) { if ($istable( [ Leech [ $+ [ $1 ] ] ] )) { hdel Leech [ $+ [ $1 ] ] $2 } } }
istable { 
  if ($1 != $null) {
    if (($hget($1-,0).item != $null) && ($hget($1-,0).item != 0)) { return $true }
  }
  return $false
}
tableempty { 
  if ($1 != $null) {
    if (($hget($1-,0).item != $null) && ($hget($1-,0).item >= 10)) { return $false }
  }
  return $true
}
ctcp { 
  .timerFSEB $+ $iNetwork -o 1 60 unset %altFxPflag [ $+ [ $iNetwork ] ] 
  set %altFxPflag [ $+ [ $iNetwork ] ] 1
  if ($strip($2,burc) == !list) { set %isoadchan [ $+ [ $iNetwork ] ] $1 }
  if ($2 == $null) { 
    echo $colour(info) *** /ctcp: insufficient parameters 
    Halt 
  }
  elseif ($2 == DCC) {
    echo $color(info) *** Use /DCC command
    Halt
  }
  elseif ($2 == PING) {
    raw -q PRIVMSG $1 : $+ $chr(1) $+ PING $ticks $+ $chr(1) 
    echo $colour(ctcp) -q -> $chr(91) $+ $1 $+ $chr(93) $upper($2) $3- 
    Halt
  } 
  elseif (($2 == XDCC) && (($3 == SEND) || ($3 == GET))) {
    if ($r.set(DCCmgr,DCCallow) == On) {
      if (%DCCallow [ $+ [ $iNetwork ] ] [ $+ [ %tnick ] ] == $null) { idccallow $1 } 
    }
    !ctcp $1-
    Halt
  }
  else { !ctcp $1- } 
  :leave
}
allchk { if ($1 == $null) { return All } | else { return $1- } }
reply { if ($1 != $null) { if (%reply == $null) { error Nobody has /notice'd you yet! } | else { notice %reply $1- } } }
kick { if (($me ison $1) && ($2 != $null)) { if (($chr(42) !isin $2) && ($chr(63) !isin $2)) { !kick $1 $2 $3- } | else { var %kick-c = 0 | :start | inc %kick-c 1 | if ($nick($1,%kick-c) == $null) { unset %kick-c } | else { if ($nick($1,%kick-c) == $me) { goto start } | if ($2 iswm $nick($1,%kick-c)) { !kick $1 $nick($1,%kick-c) $3- } | goto start } } } | else { error Usage: /kick <#channel> <nick[?/*]> [message] } }
ident { if ($1 != $null) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $1- | return } | if ($me == $r.set(Auto.ID,Nick.1)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.1) | return } | if ($me == $r.set(Auto.ID,Nick.2)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.2) | return } | if ($me == $r.set(Auto.ID,Nick.3)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.3) | return } | if ($me == $r.set(Auto.ID,Nick.4)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.4) | return } | if ($me == $r.set(Auto.ID,Nick.5)) { %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $r.set(Auto.ID,Pass.5) | return } | %Nserv [ $+ [ $iNetwork ] ] IDENTIFY $$?*="Enter Nick Password" }
ascii { return $replace($upper($1-),AE,Æ,A,å,B,ß,C,©,D,Ð,E,€,F,f,G,g,H,}{,I,î,J,J,K,|{,L,£,M,m,N,ñ,O,ö,P,þ,Q,¶,R,®,S,§,T,†,U,µ,V,V,W,w,X,×,Y,¥,Z,z,1,¹,2,²,3,³) }
ttusd {
  var %text = $strip($replacex($1-,a,ɐ,b,q,c,ɔ,d,p,e,ǝ,f,ɟ,g,ƃ,h,ɥ,i,ı,j,ɾ,k,ʞ,l,ן,m,ɯ,n,u,o,o,p,d,q,b,r,ɹ,s,s,t,ʇ,u,n,v,ʌ,w,ʍ,x,x,y,ʎ,z,z,!,¡,;,؛,',$chr(44),.,˙,$chr(44),',?,¿,",„,_,‾,‾,_,1,⇂,0,0,9,6,8,8,7,Ɫ,6,9,5,5,4,ᔭ,3,Ɛ,2,ᄅ,$chr(91),$chr(93),$chr(93),$chr(91),$chr(40),$chr(41),$chr(41),$chr(40),$chr(123),$chr(125),$chr(125),$chr(123)))
  var %t = $len(%text)
  while (%t) {
    var %letter = $mid(%text,%t,1)
    var %newtext = %newtext $+ $iif(%space,$chr(32)) $+ %letter
    unset %space
    if (%letter == $chr(32)) { var %space = 1 }
    dec %t
  }
  return %newtext
}
caps { return $replace($upper($1-),A,a,E,e,I,i,O,o,U,u) }
hack { return $replace($upper($1-),A,4,E,3,I,1,O,0,S,5,T,7) }
hsay { say $hack($1-) }
scan {
  scanclear
  if (($1 == ircop) && (($2 == -e) || ($2 == -c)) && ($me ison $3)) { set %ircop.scan-dis [ $+ [ $iNetwork ] ] $2 | set %ircop.scan-chan [ $+ [ $iNetwork ] ] $3 | who $3 }
  elseif (($1 == away) && (($2 == -e) || ($2 == -c)) && ($me ison $3)) { set %away.scan-dis [ $+ [ $iNetwork ] ] $2 | set %away.scan-chan [ $+ [ $iNetwork ] ] $3 | who $3 }
  elseif (($1 == stats) && (($2 == -e) || ($2 == -c)) && ($me ison $3)) { set %stats.scan-dis [ $+ [ $iNetwork ] ] $2 | set %stats.scan-chan [ $+ [ $iNetwork ] ] $3 | who $3 }
}
scanclear { unset %usearch* %away.scan-* %stats.scan-* %ircop.scan-* }
shitlist { 
  if (($1 == add) && ($2 != $null)) { 
    whodat $2 
    adduser Shitlist $2 $3 
    w.shit $replace($address($2,3), $chr(61) ,^) $4- 
    shitlist-h $2 $4- 
  }
  elseif (($1 == del) && ($2 != $null)) { whodat $2 | .ruser $address($2,3) }
  elseif ($1 == clr) { .rlevel -r 5 }
}
shitlist-h { if ($1 != $null) { var %shitlist = 0 | :start | inc %shitlist 1 | if ($comchan($1,%shitlist) == $null) { unset %shitlist } | elseif ($me isop $comchan($1,%shitlist)) { kb2 $comchan($1,%shitlist) $1 $iif($2 == $null,No Reason Specified,$2-) $bracket(Shitlisted) | goto start } | else { goto start } } }
lagbar { 
  var %tmpval = $int($calc(%lag.time [ $+ [ $iNetwork ] ] * 10))
  var %barlag = :
  var %loopct = 0 
  :loopLB
  var %barlag = %barlag $+ $chr(108)
  inc %loopct 1
  if (%loopct >= %tmpval) { return %barlag $+  }
  if (%loopct >= 49) { return %barlag $+  } 
  goto loopLB
}
op { if (($me ison $1) && ($2 != $null)) || (($me ison $active) && ($1 != $null)) { mode $iif($me ison $1,$1,$active) +oooooo $iif($me ison $1,$2-,$1-) } | else { error Usage: /op [#channel] <nick> [nick2-6] } }
dop { if (($me ison $1) && ($2 != $null)) || (($me ison $active) && ($1 != $null)) { mode $iif($me ison $1,$1,$active) -oooooo $iif($me ison $1,$2-,$1-) } | else { error Usage: /dop [#channel] <nick> [nick2-6] } }
vo { if (($me ison $1) && ($2 != $null)) || (($me ison $active) && ($1 != $null)) { mode $iif($me ison $1,$1,$active) +vvvvvv $iif($me ison $1,$2-,$1-) } | else { error Usage: /vo [#channel] <nick> [nick2-6] } }
dvo { if (($me ison $1) && ($2 != $null)) || (($me ison $active) && ($1 != $null)) { mode $iif($me ison $1,$1,$active) -vvvvvv $iif($me ison $1,$2-,$1-) } | else { error Usage: /dvo [#channel] <nick> [nick2-6] } }
o { onotice $1- }
zonotice { if (($me isop $active) && ($1 != $null)) { onotice $c(1) $+ ( $+ $c(2) $+ ØP§ $+ $c(1) $+  $active  $+ $c(2) $+ ØP§ $+ $c(1) $+ ) $+ : $1- } | else { error Usage: /onotice [#channel] <message> } }
omsg { if (($me isop $active) && ($1 != $null)) { omsg $c(1) $+ ( $+ $c(2) $+ ØP§ $+ $c(1) $+  $active  $+ $c(2) $+ ØP§ $+ $c(1) $+ ) $+ : $1- } | else { error Usage: /omsg [#channel] <message> } }
lsay { if ($1 != $null) { say $1- $ilogo } }
lamsg { if ($1 != $null) { amsg $1- $ilogo } }
tbar { titlebar $tbar.script $tbar.site $tbar.nick $tbar.fserve $tbar.server $tbar.chanstats $tbar.status $tbar.time $tbar.socks $tbar.bots $tbar.idle $tbar.mp3inplay $tbar.lag }
tbar.script { if ($r.glob(Titlebar,Invision) == On) { return - $r.glob(Script,Logo) $r.static(Script,Version) } | else { return } }
tbar.nick { if (($scid($activecid).server != $null) && ($r.glob(TitleBar,Nick) == On)) { return - $scid($activecid).me $iif($scid($activecid).usermode != +,$scid($activecid).usermode) } }
tbar.server { if (($scid($activecid).server != $null) && ($r.glob(TitleBar,Server) == On)) { return - $scid($activecid).network $chr(40) $+ $scid($activecid).server $+ : $+ $scid($activecid).port $+ $chr(41) } }
tbar.fserve { if (($r.glob(Titlebar,Fserve) == On) && ($send(0) >= 1)) { return - $chr(40) $+ Sends: $send(0)  Queues: $QueuesGlobal $+ $chr(41) } } 
tbar.mp3serv { if (($r.glob(Titlebar,mp3serv) == On) && ($r.set(mp3serv,Status) == On)) { return - mp3 Server:( Sends: $+ $isend(0)  Queues: $+ $calc($queue(0) + $Pqueue(0)) $+ / $+ $r.set(mp3serv,Max.Queues.Total) ) } } 
tbar.mp3inplay { if ($r.glob(Titlebar,mp3inplay) == On) { return $iif($mp3play.title != $null,- mp3: $+ $chr(91) $+ $iif($getid3(title) $+ $getid3(artist),$iif($getid3(artist),$v1 $c(2) $+ - ) $getid3(title),$mp3play.title) $+ $chr(93)) } }
tbar.status { if (($scid($activecid).server != $null) && ($r.glob(TitleBar,Status) == On) && ($scid($activecid).away == $true)) { return - Away $strip($scid($activecid).awaytim,burc) } }
tbar.modes { if (($scid($activecid).server != $null) && ($usermode != +)) { return  } }
tbar.lag { if (($scid($activecid).server != $null) && ($r.glob(TitleBar,Lag) == On) && ($r.glob(Lag.Checker,Status) == On)) { if ($r.glob(Invision,LagBarGraphic) == On) { return - Lag Meter $+ $lagbar } | else { return - Lag Time: $sduration(%Lag.Time [ $+ [ $iNetwork ] ] ) } } }
tbar.site { if ($scid($activecid).server == $null) { return - $r.static(Script,WebPage) } }
tbar.chanstats { if ($scid($activecid).server != $null) && ($chan(0) >= 1) && ($left($active,1) == $chr(35)) && ($r.glob(TitleBar,ChanStats) == On) { return - O: $+ $nick($active,0,o) $iif($HalfOpsOk,H: $+ $nick($active,0,v)) V: $+ $nick($active,0,v) R: $+ $nick($active,0,r)  } }
tbar.time { if ($r.glob(TitleBar,Time) == On) { return - $atime on $adate } }
tbar.idle { if (($scid($activecid).server != $null) && ($r.glob(TitleBar,Idle) == On) && ($scid($activecid).away != $true) && ($scid($activecid).idle >= 300)) { return - Idle: $duration($scid($activecid).idle,2) } } 
tbar.socks { if (($r.glob(TitleBar,Socks) == On) && ($sock(*,0) >= 1)) { return - Socks: $sock(*,0) } }
tbar.bots { if (($r.glob(TitleBar,Bots) == On) && ($sock(BOT+*,0) >= 1)) { return - Bot Links: $sock(BOT+*,0) } }
s3d { if ($1 != $null) { .say $crykeys($1-) } }
crykeys { var %tmpstr = -=[0,15 | var %tmpcnt = 1 | var %incoming = $1-
  :start
  if ($mid(%incoming,%tmpcnt,1) != $chr(32)) { %tmpstr = %tmpstr $+ 0(12 $+ $mid(%incoming,%tmpcnt,1) $+ 46) } | else { %tmpstr = %tmpstr $+ 15,15.. }
  inc %tmpcnt 1
  if (%tmpcnt < $calc($len(%incoming) +1)) { goto start }
  return %tmpstr $+ ]=-
} 
DriveFo {
  if ($1) {
    var %tmpASCT = 67, %counter = 0, %tempfile = DrvDisp.tmp
    var %tmpDrvDisp, %tmpTotFree = 0, %tmpTotStor = 0, %tmpTotUsed
    ; Line below can be changed to customize how many drives are shown on each line.  Recommended values are 2-5.
    var %DrivesPerLine = 3
    ; Delete temp file (should already be removed, but just in case)
    .remove %tempfile
    .write %tempfile $c(2) $+ Current Drive Storage Status  $+ $ilogo
    ; Sanity check, make sure file was created
    if ( !$isfile(%tempfile) ) {
      ERROR There was an error creating a temporary file.  Unable to display Drive Info to channel.
      halt
    }
    while (%tmpASCT <= 90) {
      if (($disk($chr(%tmpASCT))) && (($disk($chr(%tmpASCT)).type == fixed) || ($disk($chr(%tmpASCT)).type == remote))) {
        ; If we have reach the DrivesPerLine limit, dump it to the temp file and start a new line
        if ( %counter == %DrivesPerLine ) {
          .write %tempfile %tmpDrvDisp
          var %tmpDrvDisp
          set %counter 0
        }
        set %tmpDrvDisp %tmpDrvDisp $c(1) $+ Drive $c(2) $+ $chr(%tmpASCT) $c(1) $+ of $c(2) $+ $size($disk($chr(%tmpASCT)).size) $c(1) $+ has $c(2) $+ $size($disk($chr(%tmpASCT)).free) $c(1) $+ free.
        inc %tmpTotStor $disk($chr(%tmpASCT)).size
        inc %tmpTotFree $disk($chr(%tmpASCT)).free
        inc %counter
      }
      inc %tmpASCT 1
    }
    ; Dump remaining drives, build totals line
    .write %tempfile %tmpDrvDisp
    set %tmpTotUsed $calc(%tmpTotStor - %tmpTotFree)
    .write %tempfile $c(1) $+ Total Storage: $c(2) $+ $size(%tmpTotStor) $c(1) Total Used: $c(2) $+ $size(%tmpTotUsed) $c(1) Total Free: $c(2) $+ $size(%tmpTotFree) | unset %tmpASCT %tmpTotUsed %tmpTotStor %tmpTotFree %tmpDrvDisp
    ; Send text to the channel, with a 1.1s line delay to prevent flood
    .play $1 %tempfile 1100
    .remove %tempfile
  }
}
ibar {
  if ($window(@Invision) != $null) {
    if (($1 isnum) && ($1 <= 100)) {
      var %val = $int($calc($1 * 3.52))
      if (%val > 351) { var %val = 352 }
      drawrect -f @Invision 12 2 4 60 %val 2
    }
  }
}
reboot {
  if ($r.mirc(Invision,Rebooting) == 0) { .timer -o 1 10 exit }
}
clrreadn { var %dummy = $read(mirc.ini,w, xiwuey2323dhv) | return }
decrypt {
  ; setup the variables.
  var %pass = $r.set(Invision,CryptKey) | var %pwlen = $len(%pass) | var %workstr = $right($1-,-2) 
  var %lstring = $len(%workstr) | var %c = 1 | var %newstr = TESTPASS
  ;start the decrypting...
  while (%c < %lstring) {
    var %tmp = $mid(%workstr,%c,1) 
    var %tmp = $asc(%tmp) 
    if (%c > %pwlen) { var %mod = $mid(%pass,$calc(%c - (%pwlen * $int($calc(%c / %pwlen)))),1) } | else { var %mod = $mid(%pass,%c,1) }
    var %tmp = $calc(%tmp - $asc(%mod))
    if (%tmp = 20) { var %tmp = 32 } 
    var %tmp = $chr(%tmp)
    if (%tmp != $chr(32)) { var %newstr = %newstr $+ %tmp } | else { var %newstr = %newstr %tmp }
    inc %c 1
  }
  if ($len(%newstr) < 8) { return Failed to Decrypt message. }
  if ($left(%newstr,8) != TESTPASS) { return §§§ }
  if ($right(%newstr,-8) == $null) { return I have nothing to say... $c(2) $+ (no text was sent in the encryption) }
  return $right(%newstr,-8)
}
ec { say $encrypt3($1-) }
' { say $encrypt3($1-) }
dc { return $decrypt3($1-) }
checkkey { set %tlen $len($1)
  if (%tlen < 5) { set %tnuth $?!="The decryption key is less then 5 characters. Set key to default?" | if (%tnuth == $true) { return crazycrypt } | return $null }
  set %tct 1
  while (%tct <= %tlen) { 
    set %tchk $asc($mid($1,%tct,1))
    if (%tchk > 127) { set %tnuth $?!="You have used an illegal character ( $+ $chr(%tchk) $+ ) in the Decryption Key. The key has been set to default." | return crazycrypt }
    inc %tct 1
  }
  unset %tlen | unset %tct | unset %tchk | unset %tnuth
  return $1
}
nobad { if (($r.mirc(wizard,advise) >= 2) && ($r.glob(Invision,SomeID) != $someid)) { dialog -mdo alertbad alertbad } }
f11 { .run http://www.i-n-v-i-s-i-o-n.com/ }
f1 { helptoggle }
f2 { pager }
f3 { if (%received == $null) { error You haven't recieved any files yet. | return } | if ($isfile(%received) == $false) { error The file no longer exists. | return } | run " $+ %received $+ " }
f4 { if (($r.set(Invision,Visufix) == Off) || ($r.set(Invision,Visufix) == $null)) { w.set Invision Visufix On | aecho Visufix is now On } | else { w.set Invision Visufix Off | aecho Visufix is now Off } }
f5 { if %SoundKill [ $+ [ $iSetwork ] ] == 1 { unset %SoundKill [ $+ [ $iSetwork ] ] | if $exists( [ $r.glob(Themes,ToolBarBG1) ] ) { background -l $r.glob(Themes,ToolBarBG1) } } | else { Set %SoundKill [ $+ [ $iSetwork ] ] 1 | if $exists( [ $r.glob(Themes,ToolBarBG2) ] ) { background -l $r.glob(Themes,ToolBarBG2) } } }
f6 { FxpToggle }
cf6 { if ($ignore(0) >= 1) { aecho $iif($gettok($ignore($ignore(0)),1,33) == *,$iif($ial($ignore($ignore(0)),1) == $null,n/a,$ial($ignore($ignore(0)),1).nick),$gettok($ignore($ignore(0)),1,33)) $bracket($ignore($ignore(0))) has been removed from your ignore list. | .ignore -r $ignore($ignore(0)) } | else { error There are no users on your ignore list. } }
f7 { usearch $$?="Enter IP or Host to Search For" }
f8 { if ($me !ison $active) { error You must be on a channel. } | else { onotice $active $$?="Enter Message to OPz on [ $chan ] " } }
f9 { set %mp3toplay $mp3historyGET | mp3stop | mp3play %mp3toplay | set %mp3resume Pause mp3 playback | if ($r.glob(Invision,Amip) != On) { .timer -o 1 2 mp3info %mp3toplay } }
f10 { if %mp3dirplay == 1 { mp3playnext } }
;f12 { 
;  if ($r.glob(Nick.Colors,ForceUL) != On) { whoallchan | .timer 1 1 fkey12 } 
;  else { 
;    aecho **************     User Lists Color Scheme Legend      **************** 
;    aecho $colordefine($r.glob(Nick.Colors,Color.6)) = Fellow Op | $colordefine($r.glob(Nick.Colors,Color.8)) = Friend | $colordefine($r.glob(Nick.Colors,Color.10)) = DCC Banned | $colordefine($r.glob(Nick.Colors,Color.5)) = Elite
;    aecho $colordefine($r.glob(Nick.Colors,Color.11)) = Shitlisted | $colordefine($r.glob(Nick.Colors,Color.12)) = Ignored | $colordefine($r.glob(Nick.Colors,Color.7)) = Bot | $colordefine($r.glob(Nick.Colors,Color.9)) = Temp DCC permited
;  }
;}
whoallchan { 
  var %chantot = $chan(0)
  var %ct = 1
  while (%ct <= %chantot) {
    .who $chan(%ct)
    inc %ct
  }
}
lduration {
  if ($1 isnum) {
    if ($int($calc($1 / 3600)) == 0) {
      if ($int($calc(($1 % 3600)/60)) == 0) {
        if ($calc($1 % 60) == 1) { return $calc($1 % 60) Second }
        return $calc($1 % 60) Seconds
      }
      if ($calc($1 % 60) == 0) {
        if ($int($calc(($1 % 3600)/60)) == 1) { return $int($calc(($1 % 3600)/60)) Minute }
        return $int($calc(($1 % 3600)/60)) Minutes
      }
      if ($int($calc(($1 % 3600)/60)) == 1) {
        if ($calc($1 % 60) == 1) { return $int($calc(($1 % 3600)/60)) Minute and $calc($1 % 60) Second }
        return $int($calc(($1 % 3600)/60)) Minute and $calc($1 % 60) Seconds
      }
      if ($calc($1 % 60) == 1) { return $int($calc(($1 % 3600)/60)) Minutes and $calc($1 % 60) Second }
      return $int($calc(($1 % 3600)/60)) Minutes and $calc($1 % 60) Seconds
    }
    if ($int($calc(($1 % 3600)/60)) == 0) {
      if ($calc($1 % 60) == 0) {
        if ($int($calc($1 / 3600)) == 1) { return $int($calc($1 / 3600)) Hour }
        return $int($calc($1 / 3600)) Hours
      }
      if ($int($calc($1 / 3600)) == 1) {
        if ($calc($1 % 60) == 1) { return $int($calc($1 / 3600)) Hour and $calc($1 % 60) Second }
        return $int($calc($1 / 3600)) Hour and $calc($1 % 60) Seconds
      }
      if ($calc($1 % 60) == 1) { return $int($calc($1 / 3600)) Hours and $calc($1 % 60) Second }
      return $int($calc($1 / 3600)) Hours and $calc($1 % 60) Seconds      
    }
    if ($calc($1 % 60) == 0) {
      if ($int($calc($1 / 3600)) == 1) {
        if ($int($calc(($1 % 3600)/60)) == 1) { return $int($calc($1 / 3600)) Hour and $int($calc(($1 % 3600)/60)) Minute }
        return $int($calc($1 / 3600)) Hour and $int($calc(($1 % 3600)/60)) Minutes
      }
      if ($int($calc(($1 % 3600)/60)) == 1) { return $int($calc($1 / 3600)) Hours and $int($calc(($1 % 3600)/60)) Minute }
      return $int($calc($1 / 3600)) Hours and $int($calc(($1 % 3600)/60)) Minutes
    }
    if ($int($calc($1 / 3600)) == 1) {
      if ($int($calc(($1 % 3600)/60)) == 1) {
        if ($calc($1 % 60) == 1) { return $int($calc($1 / 3600)) Hour $int($calc(($1 % 3600)/60)) Minute and $calc($1 % 60) Second }
      }
      if ($calc($1 % 60) == 1) { return $int($calc($1 / 3600)) Hour $int($calc(($1 % 3600)/60)) Minutes and $calc($1 % 60) Second }
      return $int($calc($1 / 3600)) Hour $int($calc(($1 % 3600)/60)) Minutes and $calc($1 % 60) Seconds
    }
    if ($int($calc(($1 % 3600)/60)) == 1) {
      if ($calc($1 % 60) == 1) { return $int($calc($1 / 3600)) Hours $int($calc(($1 % 3600)/60)) Minute and $calc($1 % 60) Second }
      return $int($calc($1 / 3600)) Hours $int($calc(($1 % 3600)/60)) Minute and $calc($1 % 60) Seconds
    }
    if ($calc($1 % 60) == 1) { return $int($calc($1 / 3600)) Hours $int($calc(($1 % 3600)/60)) Minutes and $calc($1 % 60) Second }
    return $int($calc($1 / 3600)) Hours $int($calc(($1 % 3600)/60)) Minutes and $calc($1 % 60) Seconds
  }
  else { return n/a }
}
sduration {
  if ($1 == ??) { return ?? }
  if ($1 isnum) {
    if ($int($calc($1 / 3600)) == 0) {
      if ($int($calc(($1 % 3600)/60)) == 0) { return $calc($1 % 60) $+ s }
      if ($calc($1 % 60) == 0) { return $int($calc(($1 % 3600)/60)) $+ m }
      return $int($calc(($1 % 3600)/60)) $+ m $+ $calc($1 % 60) $+ s
    }
    if ($int($calc(($1 % 3600)/60)) == 0) {
      if ($calc($1 % 60) == 0) { return $int($calc($1 / 3600)) $+ h }
      return $int($calc($1 / 3600)) $+ h $+ $calc($1 % 60) $+ s
    }
    if ($calc($1 % 60) == 0) { return $int($calc($1 / 3600)) $+ h $+ $int($calc(($1 % 3600)/60)) $+ m }
    return $int($calc($1 / 3600)) $+ h $+ $int($calc(($1 % 3600)/60)) $+ m $+ $calc($1 % 60) $+ s
  }
  else { return n/a }
}
cduration {
  if ($1 isnum) {
    if ($int($calc($1 / 3600)) == 0) {
      if ($int($calc(($1 % 3600)/60)) == 0) { return 00:00: $+ $iif($calc($1 % 60) isnum 0-9,0) $+ $calc($1 % 60) }
      if ($calc($1 % 60) == 0) { return 00: $+ $iif($int($calc(($1 % 3600)/60)) isnum 0-9,0) $+ $int($calc(($1 % 3600)/60)) $+ :00 }
      return 00: $+ $iif($int($calc(($1 % 3600)/60)) isnum 0-9,0) $+ $int($calc(($1 % 3600)/60)) $+ : $+ $iif($calc($1 % 60) isnum 0-9,0) $+ $calc($1 % 60)
    }
    if ($int($calc(($1 % 3600)/60)) == 0) {
      if ($calc($1 % 60) == 0) { return $iif($int($calc($1 / 3600)) isnum 0-9,0) $+ $int($calc($1 / 3600)) $+ :00:00 }
      return $iif($int($calc($1 / 3600)) isnum 0-9,0) $+ $int($calc($1 / 3600)) $+ :00: $+ $iif($calc($1 % 60) isnum 0-9,0) $+ $calc($1 % 60)
    }
    if ($calc($1 % 60) == 0) { return $iif($int($calc($1 / 3600)) isnum 0-9,0) $+ $int($calc($1 / 3600)) $+ : $+ $iif($int($calc(($1 % 3600)/60)) isnum 0-9,0) $+ $int($calc(($1 % 3600)/60)) $+ :00 }
    return $iif($int($calc($1 / 3600)) isnum 0-9,0) $+ $int($calc($1 / 3600)) $+ : $+ $iif($int($calc(($1 % 3600)/60)) isnum 0-9,0) $+ $int($calc(($1 % 3600)/60)) $+ : $+ $iif($calc($1 % 60) isnum 0-9,0) $+ $calc($1 % 60)
  }
  else { return 00:00:00 }
}
gduration { if ($1 isnum) { return $replace($duration($1),wk,$chr(32) $+ Week,day,$chr(32) $+ Day,hr,$chr(32) $+ Hour,min,$chr(32) $+ Minute,sec,$chr(32) $+ Second) } | else { return n/a } }
logviewer {
  if ($1) { set %log-f $1 | var %log.fn = $logdir $+ $gettok($mklogfn($1),1- $calc($numtok($mklogfn($1),92) - 1),92) $+ \ $+ $1 }
  if ( !$isfile(%log-f) ) { set %log-f $$sfile($qt($shortfn($iif(%log.fn,$v1,$logdir)) $+ *.log),Choose Log File to View) }
  if ($window(@logviewer) == $null) { window -k0az @logviewer $r.winpos(@logviewer) @logviewer } | else { window -a @logviewer }
  
  titlebar @logviewer - %log-f | clear @logviewer

  if ( $isfile(%log-f) ) {
    if ( ( $r.glob(Invision,ViewLogLoadAll) == On ) && ( $len($gettok(%log-f,$calc($numtok(%log-f,46) - 1),46)) = 8 ) && ( $left($gettok(%log-f,$calc($numtok(%log-f,46) - 1),46),1) = 2 ) ) { set %log-f $puttok(%log-f,*,$calc($numtok(%log-f,46) - 1),46) }
    noop $findfile( $nofile(%log-f) , $nopath(%log-f), 0, 0, logviewerfile $1- )
  }

  aline -ph @logviewer $c(1) $+ -
  aline -ph @logviewer $c(1) $+ *** End of Log.
  unset %log-f
}
logviewerfile {
  var %logfilename $1-
  if ( $isfile( %logfilename ) ) {
    aline -ph @logviewer $c(1) $+ Name: $nopath(%logfilename)
    aline -ph @logviewer $c(1) $+ Size: $size($file(%logfilename).size)
    aline -ph @logviewer $c(1) $+ Lines: $lines(%logfilename)
    aline -ph @logviewer $c(1) $+ -
    loadbuf -ph @logviewer $qt(%logfilename)
  }
}
ilogsd { dialog -m LogSearch LogSearch }
ilogsearch {
  if ($fopen(ilogsearch)) { .fclose ilogsearch }
  .fopen ilogsearch $qt($1-)
  .fseek -w ilogsearch * $+ %i.search $+ * 
  var %isearch = $fread(ilogsearch)
  if (%isearch)  { aline -ip @LogSearch 04 $+ $gettok($1-,-1,92) $+ : }
  while (%isearch) {
    aline -i10p @LogSearch $str( $+ $chr(32),10) %isearch
    .fseek -w ilogsearch * $+ %i.search $+ * 
    var %isearch = $fread(ilogsearch)
  }
  .fclose ilogsearch
}
fsON { if ($dialog(InvisFserve) != $null ) { return $true } | else { return $false } }
;############################################################# 
;   check for transfers
;#############################################################
checkForTransfers {  
  if ( $isend(0) != 0 || $iget(0) != 0 ) { .timerCheckForTransfers $+ $iNetwork off | .timerFS $+ $iNetwork 0 1 FservRefresh }
  if ( $dialog(DCCManager ) == $null ) { .timerCheckForTransfers $+ $iNetwork off } | else { did -o DCCManager 31 1 $fserv(0) $+ / $+ $vnum($r.set(Fserve,Max.Serve),4) } 
}
;#############################################################
;   Clear window
;#############################################################
clearFserveWindow {
  .timerFS $+ $iNetwork off
  ; Set counter to number of sends
  did -r DCCManager 15,18,19,20,21,27,26,28,29,30,17,102,103 

  if ( $isend(0) != 0 || $iget(0) != 0 ) { .timerFS $+ $iNetwork 0 1 FservRefresh }  
  if ( $isend(0) == 0 && $iget(0) == 0 && $timer(CheckForTransfers) == $null )  { .timerCheckForTransfers $+ $iNetwork 0 1 checkForTransfers }
}
;#############################################################
; Updates all sends/gets and their properties (on a 1 sec timer)
;#############################################################
FservRefresh {
  if ($dialog(DCCManager) == $null) { .timerFS $+ $iNetwork off | return }
  if (($send(0) == 0) && ($get(0) == 0)) { .timerFS $+ $iNetwork off | clearFserveWindow | .timerCheckForTransfers $+ $iNetwork 0 1 checkForTransfers }
  ; Set counter to number of sends
  set %countSends $send(0) 
  if ( $send(0) != 0 ) { 
    if ((%countSendsHold != $send(0)) || (%countGetsHold != $get(0))) {       
      set %countSendsHold $send(0) 
      set %countGetsHold $get(0) 
      clearFserveWindow
    }
    :loop   
    did -o DCCManager 15 %countSends %countSends
    did -o DCCManager 18 %countSends $send(%countSends)
    did -o DCCManager 102 %countSends $send(%countSends).ip
    did -o DCCManager 105 %countSends %SCIDnet [ $+ [ $send(%countSends).cid ] ]
    did -o DCCManager 19 %countSends $send(%countSends).file  
    did -o DCCManager 20 %countSends $ratefix($send(%countSends).cps)
    did -o DCCManager 21 %countSends $send(%countSends).pc

    set %countSendsTotal $calc(%countSendsTotal + $send(%countSends).cps)
    ; Decrease  counter and then loop if still above zero
    dec %countSends
    if (%countSends > 0) goto loop
  }
  ; Set counter to number of gets
  set %countGets $get(0)
  if ( $get(0) != 0  ) {
    :loops          
    did -o DCCManager 26 %countGets %countGets
    did -o DCCManager 27 %countGets $get(%countGets) 
    did -o DCCManager 103 %countGets $get(%countGets).ip
    did -o DCCManager 106 %countGets %SCIDnet [ $+ [ $get(%countGets).cid ] ]
    did -o DCCManager 28 %countGets $get( %countGets [ $+ [ $iNetwork ] ] ).file 
    did -o DCCManager 29 %countGets $ratefix($get(%countGets).cps)
    did -o DCCManager 30 %countGets $get(%countGets).pc
    ; .ip, .status, .file, .size, .rcvd, .cps, .pc
    set %countGetsTotal $calc(%countGetsTotal + $get(%countGets).cps )
    ; Decrease  counter and then loop if still above zero
    dec %countGets
    if (%countGets > 0) { goto loops }
  } 
  ;set %fserveSlots 4
  if ($gettok($r.set(Fserve,Channels),1,44) != All) {
    did -ra DCCManager 52 $numtok($r.set(Fserve,Channels),44) 
  }
  else {
    did -ra DCCManager 52 $chan(0)
  }
  did -ra DCCManager 50 S: $+ $queue(0) $+ / $+ $r.set(Fserve, Max.Queues.Total) P: $+ $Pqueue(0) $+ / $+ $r.set(Fserve, Max.Queues.Total)
  did -ra DCCManager 31  $fserv(0) $+ / $+ $vnum($r.set(Fserve,Max.Serve),4)
  ;did -o  
  did -ra DCCManager 17  $ratefix($calc(%countGetsTotal + %countSendsTotal))
  unset %countGetsTotal %countSendsTotal
  did -ra DCCManager 56  $dispnextbw
  did -ra DCCManager 58  $r.set(Fserve,InstaSend.Status)
  did -ra DCCManager 60  FS: $+ $r.set(Fserve,CloneGuard) mp3: $+ $r.set(mp3serv,CloneGuard)
  :leaving
}
dispnextbw {
  if ($r.glob(Fserve,MaxBandEach) >= 1) {
    return $ratefix($r.glob(Fserve,MaxBandEach))
  }
  else {
    if ($r.glob(Fserve,Max.Serv.Bandwidth) >= 1) {
      return $ratefix($int($calc($r.glob(Fserve,Max.Serv.Bandwidth) / $r.set(Fserve,Max.Sends.Total))))
    }
    else { return No Limit }
  }
}
FileView {
  if ($1 == $null) { set %txt-f $$file="Choose File to View" $shortfn($mircdir) } | else { set %txt-f $shortfn($mircdir) $+ $replace($1,|,_,^,_) }
  if ($isfile(%txt-f) == $false) { error Could not locate %txt-f $+ . | return }
  if ($window(@File_Viewer) == $null) { window -ka @File_Viewer $r.winpos(@File_Viewer) @File_Viewer } | else { window -a @File_Viewer }
  titlebar @File_Viewer - %txt-f | clear @File_Viewer
  aline -ph @File_Viewer $c(1) $+ Name: $nopath(%txt-f)
  aline -ph @File_Viewer $c(1) $+ Size: $size($file(%txt-f).size)
  aline -ph @File_Viewer $c(1) $+ Lines: $lines(%txt-f)
  aline -ph @File_Viewer $c(1) $+ -
  loadbuf -ph @File_Viewer %txt-f
  aline -ph @File_Viewer $c(1) $+ -
  aline -ph @File_Viewer $c(1) $+ *** End of File.
  sline @File_Viewer 50000000
  unset %txt-f
}
showhelp { 
  window -kpado +s @Help $int($calc(( [ $window(-3).w ] - 760)/2)) $int($calc(( [ $window(-3).h ] - 140)/2)) 712 142 @Help | clear @Help | drawpic -c @Help 0 0 invision\gfx\invHelp.jpg
}
helptoggle {
  if ($window(@Help).dw == $null) { showhelp }
  else { window -c @Help }
}
timecalc {
  if ($2 != $null) {
    return $duration($calc($1 - $2),2)
  }
}
e {
  /' $1-
  ;if ($1 != $null) {
  ;  crypt 0 $r.set(Invision,CryptKey) $strip($1-)
  ;  say ] $result
  ;}
}
servname {
  if ($1 != $null) {
    if ($1 == Fserve) { return The File Server }
    if ($1 == XDCC) { return The XDCC Server }
    if ($1 == mp3serv) { return The mp3 Server }
    if ($1 == Manual) { return Manually Queued }
    if ($1 == Requeue) { return Automatically Requeued }
    if ($left($1,4) == TDCC) { return TDCC Server # $+ $right($1,1) }
    return Unknown
  }
}
syslogview {
  if ($1 != $null) { 
    if ($left($1,1) != @) { set %log-f $shortfn($mircdir) $+ invision\logs\ [ $+ [ $1- ] ] }
    else { set %log-f $shortfn($mircdir) $+ logs\ [ $+ [ $1- ] ] }
    if ($isfile(%log-f) == $false) { error There is no log yet. | return }
    if ($window(@syslogview) == $null) { window -ka @syslogview $r.winpos(@syslogview) @syslogview } | else { window -a @syslogview }
    titlebar @syslogview - %log-f | clear @syslogview
    aline -ph @syslogview $c(1) $+ Name: $nopath(%log-f)
    aline -ph @syslogview $c(1) $+ Size: $size($file(%log-f).size)
    aline -ph @syslogview $c(1) $+ Lines: $lines(%log-f)
    aline -ph @syslogview $c(1) $+ -
    loadbuf -ph @syslogview %log-f
    aline -ph @syslogview $c(1) $+ -
    aline -ph @syslogview $c(1) $+ *** End of File.
    sline @syslogview 50000000
    unset %log-f
  }
}
dqwin {
  if ($gettok($readini(mirc.ini,options,n0),22,44) == 1) { return $true }
  else { return $false }
}
mircopt {
  if ($gettok($readini(mirc.ini,options,n0),22,44) == 1) { return $true }
  else { return $false }
}
restorei2 {
  .events off
  .load -rs1 $shortfn($mircdir) $+ System\Remotes\itext.mrc
  .load -rs2 $shortfn($mircdir) $+ System\Remotes\ichanctl.mrc
  .load -rs3 $shortfn($mircdir) $+ System\Remotes\igostop.mrc
  .load -rs4 $shortfn($mircdir) $+ System\Remotes\imisc.mrc
  .load -rs5 $shortfn($mircdir) $+ System\Remotes\ictcp.mrc
  .load -rs6 $shortfn($mircdir) $+ System\Remotes\iraws.mrc
  .load -rs7 $shortfn($mircdir) $+ System\Remotes\isoundfx.mrc
  .load -rs8 $shortfn($mircdir) $+ System\Remotes\imaindlg.mrc
  .load -rs9 $shortfn($mircdir) $+ System\Remotes\ifsmgr.mrc
  .load -rs10 $shortfn($mircdir) $+ System\Remotes\idccnmp3.mrc
  .load -rs11 $shortfn($mircdir) $+ System\Remotes\imiscdlg.mrc
  .load -rs12 $shortfn($mircdir) $+ System\Remotes\imiscmgr.mrc
  .load -rs13 $shortfn($mircdir) $+ System\Remotes\ipcustom.mrc
  .load -rs14 $shortfn($mircdir) $+ System\Remotes\iftpxdcc.mrc
  .load -rs15 $shortfn($mircdir) $+ System\Remotes\ihelp.mrc
  .load -rs16 $shortfn($mircdir) $+ System\Remotes\iserv.mrc
  .load -rs17 $shortfn($mircdir) $+ System\Remotes\iunique.mrc
  .load -a $shortfn($mircdir) $+ System\Aliases\ialias2.mrc
  .load -a $shortfn($mircdir) $+ System\Aliases\ialias3.mrc
  .load -a $shortfn($mircdir) $+ System\Aliases\ialias4.mrc
  .load -a $shortfn($mircdir) $+ System\Aliases\ialias5.mrc
  .load -a $shortfn($mircdir) $+ System\Aliases\imprtwiz.mrc
  w.glob Invision scriptlist ichanctl.mrc,ictcp.mrc,idccnmp3.mrc,ifsmgr.mrc,iftpxdcc.mrc,igostop.mrc,imaindlg.mrc,imisc.mrc,imiscdlg.mrc,imiscmgr.mrc,ipcustom.mrc,iraws.mrc,isoundfx.mrc,itext.mrc,ihelp.mrc,iserv.mrc,iunique.mrc,ialias1.mrc,ialias2.mrc,ialias3.mrc,ialias4.mrc,ialias5.mrc,imprtwiz.mrc,dalnet.mrc
  .events on
  defaultsounds
  aecho Scripts Reloaded in order.
}
encrypt2 {
  if ($1 != $null) {
    ;setup the variables...
    var %pass = $r.set(Invision,CryptKey) 
    var %pwlen = $len(%pass) 
    var %workstr = $1- 
    var %lstring = $len(%workstr) 
    var %c = 1 
    var %pc = 1
    ;start encrypting the password.
    var %lstring = %lstring + 2
    while (%c < %lstring) {
      var %tmp = $mid(%workstr,%c,1) 
      var %tmp = $asc(%tmp) 
      if %tmp = 32 { set %tmp 20 }
      if %pc > %pwlen { var %pc = 1 } 
      var %mod = $mid(%pass,%pc,1) 
      var %tmp = $calc(%tmp + $asc(%mod)) 
      var %tmp = $chr(%tmp)
      var %newstr = %newstr $+ %tmp
      inc %pc 1
      inc %c 1
    }
    return §ť $+ %newstr
  }
}
decrypt2 {
  if ($1 != $null) {
    ; setup the variables.
    var %pass = $r.set(Invision,CryptKey) 
    var %pwlen = $len(%pass) 
    var %workstr = $right($1-,-3) 
    var %lstring = $len(%workstr) 
    var %c = 1 
    var %pc = 1
    ;start the decrypting...
    ; set %lstring %lstring + 2
    while (%c < %lstring) {
      var %tmp = $mid(%workstr,%c,1) 
      var %tmp = $asc(%tmp) 
      if (%pc > %pwlen) { var %pc = 1 } 
      var %mod = $mid(%pass,%pc,1) 
      var %tmp = $calc(%tmp - $asc(%mod))
      if (%tmp = 20) { var %tmp = 32 } 
      var %tmp = $chr(%tmp)
      if (%tmp != $chr(32)) { var %newstr = %newstr $+ %tmp } 
      else { var %newstr = %newstr %tmp }
      inc %pc 1
      inc %c 1
    }
    return %newstr
  }
}
chrkey { 
  var %key = $r.set(Invision,CryptKey) 
  var %c = 1, %t = $len(%key) 
  while (%c <= %t) { 
    var %out.sum = $calc(%out.sum + $asc($mid(%key,%c,1))) 
    inc %c 
  } 
  var %newkey = %out.sum 
  var %c = 1, %t = $len(%newkey) 
  while (%c <= %t) { 
    var %out.sum = $calc(%out.sum * $asc($mid(%newkey,%c,1)) * $asc($mid(%key,%c,1)) + $asc($mid(%key,%c,1)) / 3) 
    inc %c 
  } 
  var %c = 1, %t = $len(%out.sum) 
  while (%c <= %t) { 
    if ($calc(%c + 3) > $calc(%t + 1)) { break } 
    var %out = %out $+ $chr($calc($mid(%out.sum,%c,3) + 900)) 
    inc %c 3 
  } 
  return %out 
} 
encrypt3 { 
  var %key = $r.set(Invision,CryptKey) 
  var %input = $1- 
  var %c = 1, %ck = 1, %t = $len(%input), %tk = $len(%key), %ckr = %tk 
  while (%c <= %t) { 
    var %out.sum = $calc($asc($mid(%input,%c,1)) + $asc($mid(%key,%ck,1)) + $asc($mid(%key,%ckr,1)) - 100) 
    var %out = %out $+ $chr($calc(%out.sum + 900)) 
    inc %ck 
    dec %ckr 
    if (%ck > %tk) { set %ck 1 } 
    if (%ckr < 1) { set %ckr %tk } 
    inc %c 
  } 
  return $chr(8751) $+ $chr(8751) $+ %out $chr(8752) $+ $chrkey 
} 
decrypt3 { 
  tokenize 32 $1-
  if (!$2 || $chr(8752) != $left($2,1)) { return } 
  if ($chrkey != $remove($2,$chr(8752))) { echo -a $c(1) $+ Error decrypting text. Verify key. | return } 
  var %key = $r.set(Invision,CryptKey)  
  var %input = $right($1,-2) 
  var %c = 1, %ck = 1, %t = $len(%input), %tk = $len(%key), %ckr = %tk 
  while (%c <= %t) { 
    var %in.sum = $calc($asc($mid(%input,%c,1)) - 900) 
    var %in.t = $calc(%in.sum - $asc($mid(%key,%ck,1)) - $asc($mid(%key,%ckr,1)) + 100) 
    if (%in.t = 32) { var %in = %in $chr(%in.t) } 
    else { var %in = %in $+ $chr(%in.t) } 
    inc %ck 
    dec %ckr 
    if (%ck > %tk) { set %ck 1 } 
    if (%ckr < 1) { set %ckr %tk } 
    inc %c 
  } 
  return %in 
} 
recoverchans {
  var %tot = $ini($shortfn($mircdirinvision\chanset.ini),Chanset,0)
  var %ct = 1
  if (%tot >= 2) {
    while (%ct <= %tot) {
      var %chans = $addtok(%chans,$ini($shortfn($mircdirinvision\chanset.ini),Chanset,%ct),44)
      inc %ct 1 
    }
    w.cf Chanops Channels %chans
  }
}
ticktest { aecho TICKS: $ticks }
idccallow {
  if ($r.set(DCCmgr,DCCallow) == On) {
    .dccallow + [ $+ [ $1 ] ]
    set %DCCallow [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ] $ctime
  }
}
idccremove {
  .dccallow - [ $+ [ $1 ] ]
  unset %DCCallow [ $+ [ $iNetwork ] ] [ $+ [ $1 ] ] 
}
idcc {
  if ($1 == Send) {
    if ("" isin $2-) { error Bad filename or trying to send to an invalid location. | halt }
    if ($r.glob(DCCmgr,DirectDCC) == On) {
      if (($2 != -cl) && ($2 != -l)) {
        ; ***** START OF NON LIMIT SEND *****
        if (($address($iif($2 == -c,$3,$2),5) != $null) || ($chr(46) isin $iif($2 == -c,$3,$2))) {
          reversedccwarn $iif($2 == -c,$3,$2)
          .timerNOSSEND [ $+ [ $iNetwork ] ] -o 1 22 unset %NOSSend [ $+ [ $iNetwork ] ] 
          set %NOSSend [ $+ [ $iNetwork ] ] 1
          .timer -o 1 1 .dcc send $iif(($chr(46) !isin $iif($2 == -c,$3,$2)),$gettok($address($iif($2 == -c,$3,$2),5),2,64),$iif($2 == -c,$3,$2)) $+ : $+ $iif($r.glob(DCCmgr,ReversePort) != $null,$r.glob(DCCmgr,ReversePort),6060) $iif($2 == -c,$4-,$3-) 
        }
        else { 
          if ($chr(46) !isin $iif($2 == -c,$3,$2)) { reversedccwarn $iif($2 == -c,$3,$2) }
          aecho DirectDCC is On but couldn't find the host $iif($2 == -c,$3,$2) 
          set %CatchDNS [ $+ [ $iNetwork ] ] 1
          set %DCCdirectNick [ $+ [ $iNetwork ] ] $iif($2 == -c,$3,$2)
          set %DCCdirectFile [ $+ [ $iNetwork ] ] [ $+ [ $iif($2 == -c,$3,$2) ] ] $iif($2 == -c,$4-,$3-)
          .dns $iif($2 == -c,$3,$2)
        }
      }
      ; ***** END OF NONLIMIT SEND *****
      else { 
        ; ***** START OF LIMIT SEND *****
        if (($address($3,5) != $null) || ($chr(46) isin $3)) {
          reversedccwarn $3
          .timerNOSSEND [ $+ [ $iNetwork ] ] -o 1 22 unset %NOSSend [ $+ [ $iNetwork ] ] 
          set %NOSSend [ $+ [ $iNetwork ] ] 1
          .timer -o 1 1 .dcc send -l $iif(($chr(46) !isin $3),$gettok($address($3,5),2,64),$3) $+ : $+ $iif($r.glob(DCCmgr,ReversePort) != $null,$r.glob(DCCmgr,ReversePort),6060) $4- 
        }
        else { 
          aecho DirectDCC is On but couldn't find the host $3 
          if ($chr(46) !isin $3) { reversedccwarn $3 }
          set %CatchDNS [ $+ [ $iNetwork ] ] 1
          set %DCCdirectNick [ $+ [ $iNetwork ] ] $3
          set %DCCdirectFile [ $+ [ $iNetwork ] ] [ $+ [ $3 ] ] $4-
          .dns $3
        }
      }
      ; ***** END OF LIMIT SEND *****
    }
    ; ******* END OF DIRECTDCC ********
    else {
      if (%DST [ $+ [ $remove($iif($left($2,1) == -,$3,$2),$chr(124),$chr(91),$chr(93)) ] ] != $null) {
        dcc send $2-
        return
      }
      else {
        .dcc send $2- 
      }
    }
    set %DST [ $+ [ $remove($iif($left($2,1) != -,$3,$2),$chr(124),$chr(91),$chr(93)) ] ] $cid
    if ($r.set(Fserve,Logging) == On) { FSlog Starting DCC send to: $iif($left($2,1) != -,$3,$2) for File: $iif($left($2,1) != -,$4-,$3-) } 
  }
  else {
    dcc $1-
  }
}
