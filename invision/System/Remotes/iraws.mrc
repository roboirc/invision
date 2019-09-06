; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: iraws.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: RAW Event Routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
on ^*:text:*:#:{
  var %fulladdress = $fulladdress
  var %curNetwork = $iNetwork
  if ($strip($1-,burc) == !TDCC) && ($r.set(TDCC,AdTo) != 1) && %TDCCflag [ $+ [ %curNetwork ] ] != 1 {
    .timer -o 1 10 unset %TDCCflag [ $+ [ %curNetwork ] ]
    set %TDCCflag [ $+ [ %curNetwork ] ] 1
    if ($r.set(TDCC,AdTo) == 2) && (($nick isop $chan) || ($nick isvo $chan)) { 
      if $r.set(TDCC.1,Status) == On && (($istok($r.set(TDCC.1,Channels),$chan,44) == $true) || ($r.set(TDCC.1,Channels) == All)) { notice $nick $tdcc.ad.temp(1) }
      if $r.set(TDCC.2,Status) == On && (($istok($r.set(TDCC.2,Channels),$chan,44) == $true) || ($r.set(TDCC.2,Channels) == All)) { notice $nick $tdcc.ad.temp(2) }
      if $r.set(TDCC.3,Status) == On && (($istok($r.set(TDCC.3,Channels),$chan,44) == $true) || ($r.set(TDCC.3,Channels) == All)) { notice $nick $tdcc.ad.temp(3) }
      if $r.set(TDCC.4,Status) == On && (($istok($r.set(TDCC.4,Channels),$chan,44) == $true) || ($r.set(TDCC.4,Channels) == All)) { notice $nick $tdcc.ad.temp(4) }
      if $r.set(TDCC.5,Status) == On && (($istok($r.set(TDCC.5,Channels),$chan,44) == $true) || ($r.set(TDCC.5,Channels) == All)) { notice $nick $tdcc.ad.temp(5) }
    }
    if ($r.set(TDCC,AdTo) == 3) && ($nick isvo $chan) && ($nick !isop $chan) { 
      if $r.set(TDCC.1,Status) == On && (($istok($r.set(TDCC.1,Channels),$chan,44) == $true) || ($r.set(TDCC.1,Channels) == All)) { notice $nick $tdcc.ad.temp(1) }
      if $r.set(TDCC.2,Status) == On && (($istok($r.set(TDCC.2,Channels),$chan,44) == $true) || ($r.set(TDCC.2,Channels) == All)) { notice $nick $tdcc.ad.temp(2) }
      if $r.set(TDCC.3,Status) == On && (($istok($r.set(TDCC.3,Channels),$chan,44) == $true) || ($r.set(TDCC.3,Channels) == All)) { notice $nick $tdcc.ad.temp(3) }
      if $r.set(TDCC.4,Status) == On && (($istok($r.set(TDCC.4,Channels),$chan,44) == $true) || ($r.set(TDCC.4,Channels) == All)) { notice $nick $tdcc.ad.temp(4) }
      if $r.set(TDCC.5,Status) == On && (($istok($r.set(TDCC.5,Channels),$chan,44) == $true) || ($r.set(TDCC.5,Channels) == All)) { notice $nick $tdcc.ad.temp(5) }
    }
    if ($r.set(TDCC,AdTo) == 4) && ($nick isop $chan) { 
      if $r.set(TDCC.1,Status) == On && (($istok($r.set(TDCC.1,Channels),$chan,44) == $true) || ($r.set(TDCC.1,Channels) == All)) { notice $nick $tdcc.ad.temp(1) }
      if $r.set(TDCC.2,Status) == On && (($istok($r.set(TDCC.2,Channels),$chan,44) == $true) || ($r.set(TDCC.2,Channels) == All)) { notice $nick $tdcc.ad.temp(2) }
      if $r.set(TDCC.3,Status) == On && (($istok($r.set(TDCC.3,Channels),$chan,44) == $true) || ($r.set(TDCC.3,Channels) == All)) { notice $nick $tdcc.ad.temp(3) }
      if $r.set(TDCC.4,Status) == On && (($istok($r.set(TDCC.4,Channels),$chan,44) == $true) || ($r.set(TDCC.4,Channels) == All)) { notice $nick $tdcc.ad.temp(4) }
      if $r.set(TDCC.5,Status) == On && (($istok($r.set(TDCC.5,Channels),$chan,44) == $true) || ($r.set(TDCC.5,Channels) == All)) { notice $nick $tdcc.ad.temp(5) }
    }
  }
}
;raw *:*:{ aecho $numeric : $1- | halt }
raw 001:*:{ setiNetwork | loadallsettings | if ($r.set(Services,Update) == On) { if ((lagnet.org isin $1-) || (alphanine.net isin $1-) || (DalNet isin $1-)) { .uloads | .load -rs $shortfn($mircdir) $+ system\remotes\dalnet.mrc } } | secho $2- | halt }
raw 002:*:{ secho $2- | halt }
raw 003:*:{ secho $2- | halt }
raw 004:*:{ secho $2- | halt }
raw 005:*:{ secho $2- | halt }
raw 006:*:{ secho $2- | halt }
raw 007:*:{ secho $2- | halt }
raw 200:*:{ aecho $2- | halt }
raw 201:*:{ aecho $2- | halt }
raw 202:*:{ aecho $2- | halt }
raw 203:*:{ aecho $2- | halt }
raw 204:*:{ aecho $2- | halt }
raw 205:*:{ aecho $2- | halt }
raw 206:*:{ aecho $2- | halt }
raw 207:*:{ aecho $2- | halt }
raw 208:*:{ aecho $2- | halt }
raw 209:*:{ aecho $2- | halt }
raw 210:*:{ aecho $2- | halt }
raw 212:*:{ aecho $2- | halt }
raw 213:*:{ aecho $2- | halt }
raw 214:*:{ aecho $2- | halt }
raw 215:*:{ aecho $2- | halt }
raw 216:*:{ if ($isnum(%kline [ $+ [ $iNetwork ] ] ) != $true) { aecho Kill line list. | set %kline [ $+ [ $iNetwork ] ] 0 } | inc %kline [ $+ [ $iNetwork ] ] 1 | aecho %kline [ $+ [ $iNetwork ] ] $+ . $2 $+ :line $bracket( [ [ $5 ] $+ ] @ [ $+ [ $3 ] ] ) - $replace($4,_,$chr(32)) | halt }
raw 217:*:{ aecho $2- | halt }
raw 218:*:{ aecho $2- | halt }
raw 219:*:{ if ($window(@Ports) != $null) { aline @Ports $c(1) $+ -  | aline @Ports $c(1) $+ Fastest Port: $c(2) $+ $isset($gettok(%port-b [ $+ [ $iNetwork ] ] ,1,32)) $c(1) $+ - Current Port: $c(2) $+ $port | unset %port-* } | else { aecho End of /STATS $2 Report } | unset %qline [ $+ [ $iNetwork ] ] %port-* %oline [ $+ [ $iNetwork ] ] %kline [ $+ [ $iNetwork ] ] | halt }
raw 220:*:{ aecho $2- | halt }
raw 221:*:{ aecho Modes for $me $+ : $+ $c(2) $2 | halt }
raw 222:*:{ if ($isnum(%qline [ $+ [ $iNetwork ] ] ) != $true) { aecho Quarantine list. | set %qline [ $+ [ $iNetwork ] ] 0 } | inc %qline [ $+ [ $iNetwork ] ] 1 | aecho %qline [ $+ [ $iNetwork ] ] $+ . $2 $bracket($3-) | halt }
raw 223:*:{ aecho $2- | halt }
raw 224:*:{ aecho $2- | halt }
raw 225:*:{ aecho $2- | halt }
raw 226:*:{ aecho $2- | halt }
raw 227:*:{ aecho $2- | halt }
raw 228:*:{ aecho $2- | halt }
raw 229:*:{ aecho $2- | halt }
raw 230:*:{ aecho $2- | halt }
raw 231:*:{ aecho $2- | halt }
raw 232:*:{ aecho $2- | halt }
raw 233:*:{ aecho $2- | halt }
raw 234:*:{ aecho $2- | halt }
raw 235:*:{ aecho $2- | halt }
raw 236:*:{ aecho $2- | halt }
raw 237:*:{ aecho $2- | halt }
raw 238:*:{ aecho $2- | halt }
raw 239:*:{ aecho $2- | halt }
raw 240:*:{ aecho $2- | halt }
raw 241:*:{ aecho $2- | halt }
raw 242:*:{ aecho $2- | halt }
raw 243:*:{ if ($isnum(%oline [ $+ [ $iNetwork ] ] ) != $true) { aecho Operator list. | set %oline [ $+ [ $iNetwork ] ] 0 } | inc %oline [ $+ [ $iNetwork ] ] 1 | aecho %oline [ $+ [ $iNetwork ] ] $+ . $iif($2 === o,Local:,Global:) $5 $bracket($3) - $7 | halt }
raw 244:*:{ aecho $2- | halt }
raw 245:*:{ aecho $2- | halt }
raw 246:*:{ aecho $2- | halt }
raw 247:*:{ aecho $2- | halt }
raw 248:*:{ aecho $2- | halt }
raw 249:*:{ aecho $2- | halt }
raw 250:*:{ secho $2- | halt }
raw 251:*:{ secho $2- | halt }
raw 252:*:{ secho $2- | halt }
raw 253:*:{ secho $2- | halt }
raw 254:*:{ secho $2- | halt }
raw 255:*:{ secho $2- | halt }
raw 256:*:{ secho Administrative info for $+ $c(2) $5 | halt }
raw 257:*:{ aecho $2- | halt }
raw 258:*:{ aecho $2- | halt }
raw 259:*:{ aecho $2- | halt }
raw 260:*:{ aecho $2- | halt }
raw 261:*:{ aecho $2- | halt }
raw 262:*:{ aecho $2- | halt }
raw 263:*:{ aecho $2- | halt }
raw 264:*:{ aecho $2- | halt }
raw 265:*:{ secho $2- | halt }
raw 266:*:{ secho $2- | halt }
raw 267:*:{ aecho $2- | halt }
raw 268:*:{ aecho $2- | halt }
raw 269:*:{ aecho $2- | halt }
raw 270:*:{ aecho $2- | halt }
raw 271:*:{ aecho $2- | halt }
raw 272:*:{ aecho $2- | halt }
raw 273:*:{ aecho $2- | halt }
raw 274:*:{ aecho $2- | halt }
raw 275:*:{
  if (%iSSL. [ $+ [ $1 ] ] == On) { halt }
  else {
    set -u5 %iSSL. $+ $1 On
    if (%whois.chan. [ $+ [ $2 ] ] ) { echo %whois.chan. [ $+ [ $2 ] ] $clradj($ilogo(S)) $c(1) $+ $2- | unset %whois.chan. $+ $2 }
    else { aecho $2- }
    halt
  }
}
raw 276:*:{ aecho $2- | halt }
raw 277:*:{ aecho $2- | halt }
raw 278:*:{ aecho $2- | halt }
raw 279:*:{ aecho $2- | halt }
raw 280:*:{ aecho $2- | halt }
raw 281:*:{ aecho $2- | halt }
raw 282:*:{ aecho $2- | halt }
raw 283:*:{ aecho $2- | halt }
raw 284:*:{ aecho $2- | halt }
raw 285:*:{ aecho $2- | halt }
raw 286:*:{ aecho $2- | halt }
raw 287:*:{ aecho $2- | halt }
raw 288:*:{ aecho $2- | halt }
raw 289:*:{ aecho $2- | halt }
raw 290:*:{ aecho $2- | halt }
raw 291:*:{ aecho $2- | halt }
raw 292:*:{ aecho $2- | halt }
raw 293:*:{ aecho $2- | halt }
raw 294:*:{ aecho $2- | halt }
raw 295:*:{ aecho $2- | halt }
raw 296:*:{ aecho $2- | halt }
raw 297:*:{ aecho $2- | halt }
raw 298:*:{ aecho $2- | halt }
raw 299:*:{ aecho $2- | halt }
raw 300:*:{ aecho $2- | halt }
raw 301:*:{ if $r.whois($2) == $null { if (%whois. [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] == on) { aecho AFK $c(2) $+ $3- | unset %whois. [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] } | else { halt } | halt } | else { halt } }
raw 302:*:{ aecho $2- | halt }
raw 303:*:{ aecho $2- | halt }
raw 304:*:{ aecho $2- | halt }
raw 305:*:{ halt }
raw 306:*:{ halt }
raw 307:*:{ 
  if $r.whois($2) == $null {
    if %whoisCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On {
      UserInfo Services: $c(2) $+ Registered | halt
    }
    else {
      aecho Services: $c(2) $+ Registered | halt 
    }
  }
  else { halt }
}
raw 308:*:{ 
  if $r.whois($2) == $null {
    if %whoisCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On {
      UserInfo Admin: $c(2) $+ $2- | halt
    }
    else {
      aecho Admin: $c(2) $+ $2- | halt 
    }
  } 
  else { halt }
}
raw 309:*:{ 
  if $r.whois($2) == $null {
    if %whoisCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On {
      UserInfo SOP: $c(2) $+ $2- 
      halt 
    }
    else {
      aecho SOP: $c(2) $+ $2- 
      halt 
    }
  }
  else { halt }
}
raw 310:*:{ 
  if $r.whois($2) == $null {
    if %whoisCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On {
      UserInfo HelpOp: $c(2) $+ $2- | halt 
    }
    else {
      aecho HelpOp: $c(2) $+ $2- | halt 
    }
  }
  else { halt }
}
raw 311:*:{ 
  if $r.whois($2) == $null {
    if %whoisCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { 
      UserInfo $chr(15)
      UserInfo $c(1) $+ Nick: $c(2) $+ $2 
      UserInfo Address: $c(2) $+ $3 $+ @ $+ $4 $bracket($iif($r.country($gettok($4,$gettok($4,0,46),46)) == $null,Unknown,$r.country($gettok($4,$gettok($4,0,46),46)))) 
      if ($4 == 63.195.0.190) || ($4 == adsl-63-195-0-190.dsl.chic01.pacbell.net) { UserInfo Verified: 4This is the real cRYOa!  } 
      UserInfo Name: $c(2) $+ $6- 
      halt 
    }
    else {
      aecho $c(1) $+ Nick: $c(2) $+ $2 
      aecho Address: $c(2) $+ $3 $+ @ $+ $4 $bracket($iif($r.country($gettok($4,$gettok($4,0,46),46)) == $null,Unknown,$r.country($gettok($4,$gettok($4,0,46),46)))) 
      if ($4 == 63.195.0.190) || ($4 == adsl-63-195-0-190.dsl.chic01.pacbell.net) { aecho Verified: 4This is the real cRYOa!  } 
      aecho Name: $c(2) $+ $6- 
      halt 
    } 
  }
  else { halt }
}
raw 312:*:{ 
  if $r.whois($2) == $null {
    if (%whoisCT [ $+ [ $iNetwork ] ] >= 1) || ($r.set(Invision,isoWhois) == On) {
      UserInfo Server: $c(2) $+ $3 $+ , $+ $c(2) $4- | set %whois. [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] on | halt 
    }
    else {
      aecho Server: $c(2) $+ $3 $+ , $+ $c(2) $4- | set %whois. [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] on | halt 
    }
  }
  else { halt }
}
raw 313:*:{ if ($r.whois($2) == $null) { if (%whoisCT [ $+ [ $iNetwork ] ] >= 1) || ($r.set(Invision,isoWhois) == On) { UserInfo Status: $c(2) $+ $2- | halt } | else { aecho Status: $c(2) $+ $2- | halt } } | else { halt } }
raw 314:*:{ 
  if %whoisCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On {
    UserInfo $c(1) $+ Nick: $c(2) $+ $2 
    UserInfo Address: $c(2) $+ $3 $+ @ $+ $4 
    if ($4 == 63.195.0.190) || ($4 == adsl-63-195-0-190.dsl.chic01.pacbell.net) { UserInfo Verified: 4This is the real cRYOa!  } 
    UserInfo Name: $c(2) $+ $6- 
    halt 
  }
  else {
    aecho $c(1) $+ Nick: $c(2) $+ $2 
    aecho Address: $c(2) $+ $3 $+ @ $+ $4 | if ($4 == 63.195.0.190) || ($4 == adsl-63-195-0-190.dsl.chic01.pacbell.net) { aecho Verified: 4This is the real cRYOa!  } 
    aecho Name: $c(2) $+ $6- 
    halt 
  }
}
raw 315:*:{ 
  .timerClrIAL $+ $iNetwork -io 1 30 unset %ialwho [ $+ [ $iNetwork ] ] 
  ;   if %DOwho [ $+ [ $iNetwork ] ] == 1 { 
  ;     unset %DOwho [ $+ [ $iNetwork ] ]
  ;     secho $3- $bracket($iif(%who [ $+ [ $iNetwork ] ] == $null,0,%who [ $+ [ $iNetwork ] ] ),$iif(%who [ $+ [ $iNetwork ] ] == 1,match,matches)) 
  ;     halt 
  ;   } 
  ;   else { 
  if (%ialupdate- [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] == On) {  
    unset %ialupdate- [ $+ [ $2 ] ] 
    halt 
  }
  if (%usearch-ip [ $+ [ $iNetwork ] ] != $null) { 
    if  $vnum(%usearch-c [ $+ [ $iNetwork ] ] ,0) == 0 && %usearch-safety != $null { .timer 1 3 set %usearch-ip [ $+ [ $iNetwork ] ] $remove(%usearch-safety,*) $chr(124) who %usearch-safety | unset %usearch-* | halt }
    aecho Found $c(2) $+ $vnum(%usearch-c [ $+ [ $iNetwork ] ] ,0) $c(1) $+ nickname $+ $iif($vnum(%usearch-c [ $+ [ $iNetwork ] ] ,0) != 1,s) which match $+ $iif($vnum(%usearch-c [ $+ [ $iNetwork ] ] ,0) == 1,es) $c(2) $+  $+ $isset(%usearch-ip [ $+ [ $iNetwork ] ] ) $+  $+ $c(1) $+ . 
    if (%usearch-u1 [ $+ [ $iNetwork ] ] == $null) { 
      unset %usearch-* 
      halt 
    } 
    else { 
      set %usearch-c 0 
      :start-usearch 
      inc %usearch-c 1 
      if (%usearch-u [ $+ [ %usearch-c ] ] [ $+ [ $iNetwork ] ] == $null) { 
        aecho End of IP/Host Search list. 
        unset %usearch-* 
        halt 
      } 
      else { 
        aecho %usearch-u [ $+ [ %usearch-c ] ] [ $+ [ $iNetwork ] ] | goto start-usearch 
      } 
    } 
  }
  if ($2 == %ircop.scan-chan [ $+ [ $iNetwork ] ] ) { 
    if (%ircop.scan-dis [ $+ [ $iNetwork ] ] == -c) && ($me ison $2) { 
      msg $2 $c(1) $+ Found $c(2) $+ $vnum(%ircop.scan-c [ $+ [ $iNetwork ] ] ,0) $c(1) $+ IRC Operator $+ $iif($vnum(%ircop.scan-c [ $+ [ $iNetwork ] ] ,0) != 1,s) in $c(2) $+  $+ $2 $+ $c(1) $+ . 
    } 
    else { 
      aecho Found $c(2) $+ $vnum(%ircop.scan-c [ $+ [ $iNetwork ] ] ,0) $c(1) $+ IRC Operator $+ $iif($vnum(%ircop.scan-c [ $+ [ $iNetwork ] ] ,0) != 1,s) in $c(2) $+  $+ $2 $+ $c(1) $+ . 
    } 
    if (%ircop.scan-u1 [ $+ [ $iNetwork ] ] == $null) { 
      unset %ircop.scan-* 
      halt 
    }
    else { 
      set %ircop.scan-c 0 
      :start-ircop.scan 
      inc %ircop.scan-c 1 
      if (%ircop.scan-u [ $+ [ %ircop.scan-c ] ] [ $+ [ $iNetwork ] ] == $null) { 
        if (%ircop.scan-dis [ $+ [ $iNetwork ] ] == -c) && ($me ison $2) { msg $2 $c(1) $+ End of IRC Operators list. 
        } 
        else { 
          aecho End of IRC Operators list. 
        } 
        unset %ircop.scan-* 
        halt 
      } 
      else { 
        if (%ircop.scan-dis [ $+ [ $iNetwork ] ] == -c) && ($me ison $2) { 
          msg $2 %ircop.scan-u [ $+ [ %ircop.scan-c ] ] [ $+ [ $iNetwork ] ]  
        } 
      else { aecho %ircop.scan-u [ $+ [ %ircop.scan-c ] ] [ $+ [ $iNetwork ] ] } | goto start-ircop.scan } 
    }
  }
  if ($2 == %away.scan-chan [ $+ [ $iNetwork ] ] ) { 
    if (%away.scan-dis [ $+ [ $iNetwork ] ] == -c) && ($me ison $2) { 
      msg $2 $c(1) $+ Found $c(2) $+ $vnum(%away.scan-c [ $+ [ $iNetwork ] ] ,0) $c(1) $+ Away User $+ $iif($vnum(%away.scan-c [ $+ [ $iNetwork ] ] ,0) != 1,s) in $c(2) $+  $+ $2 $+ $c(1) $+ . 
    } 
    else { 
      aecho Found $c(2) $+ $vnum(%away.scan-c [ $+ [ $iNetwork ] ] ,0) $c(1) $+ Away User $+ $iif($vnum(%away.scan-c [ $+ [ $iNetwork ] ] ,0) != 1,s) in $c(2) $+  $+ $2 $+ $c(1) $+ . 
    } 
    if (%away.scan-u1 [ $+ [ $iNetwork ] ] == $null) { unset %away.scan-* | halt } 
    else { 
      set %away.scan-c 0 
      :start-away.scan 
      inc %away.scan-c 1 
      if (%away.scan-u [ $+ [ %away.scan-c ] ] [ $+ [ $iNetwork ] ] == $null) { 
        if (%away.scan-dis [ $+ [ $iNetwork ] ] == -c) && ($me ison $2) { msg $2 $c(1) $+ End of Away Users list. } 
        else { aecho End of Away Users list. } 
        unset %away.scan-* 
        halt 
      } 
      else { 
        if (%away.scan-dis [ $+ [ $iNetwork ] ] == -c) && ($me ison $2) { 
          msg $2 %away.scan-u [ $+ [ %away.scan-c ] ] [ $+ [ $iNetwork ] ] 
        } 
        else { 
        aecho %away.scan-u [ $+ [ %away.scan-c ] ] [ $+ [ $iNetwork ] ] } 
        goto start-away.scan 
      }
    }
  }
  if ($2 == %stats.scan-chan [ $+ [ $iNetwork ] ] ) { 
    if (%stats.scan-dis [ $+ [ $iNetwork ] ] == -c) && ($me ison $2) { 
      if %stats.scan-ircop [ $+ [ $iNetwork ] ] == $null { set %stats.scan-ircop [ $+ [ $iNetwork ] ] 0 }
      if %stats.scan-away [ $+ [ $iNetwork ] ] == $null { set %stats.scan-away [ $+ [ $iNetwork ] ] 0 }
      msg $2 $c(1) $+ Total: $c(2) $+ $nick($2,0,a) $+ $c(1) OPs: $c(2) $+ $nick($2,0,o) $bracket($percent($nick($2,0,o),$nick($2,0,a))) Voiced: $c(2) $+ $nick($2,0,v) $bracket($percent($nick($2,0,v),$nick($2,0,a))) IRCops: $c(2) $+ %stats.scan-ircop [ $+ [ $iNetwork ] ] $bracket($percent(%stats.scan-ircop [ $+ [ $iNetwork ] ] ,$nick($2,0,a))) Away: $c(2) $+ %stats.scan-away [ $+ [ $iNetwork ] ] $bracket($percent(%stats.scan-away [ $+ [ $iNetwork ] ] ,$nick($2,0,a))) $ilogo 
    } 
    else { 
      if %stats.scan-ircop [ $+ [ $iNetwork ] ] == $null { set %stats.scan-ircop [ $+ [ $iNetwork ] ] 0 }
      if %stats.scan-away [ $+ [ $iNetwork ] ] == $null { set %stats.scan-away [ $+ [ $iNetwork ] ] 0 }
      echo -a Total People: $c(2) $+ $nick($2,0,a) $+ $c(1) OPs: $c(2) $+ $nick($2,0,o) $bracket($percent($nick($2,0,o),$nick($2,0,a))) Voiced: $c(2) $+ $nick($2,0,v) $bracket($percent($nick($2,0,v),$nick($2,0,a))) 
      echo -a IRCops: $c(2) $+ %stats.scan-ircop [ $+ [ $iNetwork ] ] $bracket($percent(%stats.scan-ircop [ $+ [ $iNetwork ] ] ,$nick($2,0,a))) Away: $c(2) $+ %stats.scan-away [ $+ [ $iNetwork ] ] $bracket($percent(%stats.scan-away [ $+ [ $iNetwork ] ] ,$nick($2,0,a))) 
    } 
    unset %stats.scan-* 
    halt 
  }
  if %DOwho [ $+ [ $iNetwork ] ] == 1 { 
    secho $3- $bracket($iif(%who [ $+ [ $iNetwork ] ] == $null,0,%who [ $+ [ $iNetwork ] ] ),$iif(%who [ $+ [ $iNetwork ] ] == 1,match,matches)) 
    unset %DOwho [ $+ [ $iNetwork ] ]
  }
  unset %who [ $+ [ $iNetwork ] ]
  halt
}
raw 316:*:{ if ($r.whois($2) == $null) { aecho $2- | halt } | else { halt } }
raw 317:*:{ 
  if ($r.whois($2) == $null) {
    if (%whoisCT [ $+ [ $iNetwork ] ] >= 1) || ($r.set(Invision,isoWhois) == On) {
      UserInfo Idle: $c(2) $+ $lduration($3) 
      UserInfo SignOn: $c(2) $+ $asctime($4,dddd) $+ , $asctime($4,mmmm doo) $+ , $asctime($4,yyyy) at $asctime($4,h:nntt) 
      uStat $address($2,5) 
      halt 

    }
    else {
      aecho Idle: $c(2) $+ $lduration($3) 
      aecho SignOn: $c(2) $+ $asctime($4,dddd) $+ , $asctime($4,mmmm doo) $+ , $asctime($4,yyyy) at $asctime($4,h:nntt) 
      uStat $address($2,5) 
      halt 
    }
  }
  else { halt }
}
raw 318:*:{ if $r.whois($2) == $null { if %ialwho [ $+ [ $iNetwork ] ] != 1 {  if %whoisCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On { icomchan $2 window } | else { icomchan $2 } } | if %whoisCT [ $+ [ $iNetwork ] ] >= 1 { dec %WhoisCT [ $+ [ $iNetwork ] ] 1 } | else { unset %WhoisCT [ $+ [ $iNetwork ] ] } | .timerClrIAL $+ $iNetwork -o 1 30 unset %ialwho [ $+ [ $iNetwork ] ] %whois. [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] | halt } | else { halt } }
raw 319:*:{ 
  if $r.whois($2) == $null {
    if %whoisCT [ $+ [ $iNetwork ] ] >= 1 || $r.set(Invision,isoWhois) == On {
      UserInfo Channels: $c(2) $+ $3- 
      halt 
    }
    else {
      aecho Channels: $c(2) $+ $3- 
      halt 
    }
  }
  else { 
    .ialmark $2 $3-
    .timer -o 1 5 d.whois $2
    ;w.whois $2 $3- 
    halt 
  }
}
raw 320:*:{ aecho Given Host - $c(2) $+ $3- | halt }
raw 324:*:{ if ($($+(%,iMode.,$network,$2),2)) { halt } | else { set -u10 %iMode. $+ $network $+ $2 On } | if ($me ison $2) { echo $2 $tag Channel Modes: $c(2) $+ $3- | halt } | else { aecho $2 Channel Modes: $c(2) $+ $3- } | halt }
raw 325:*:{ aecho $2- | halt }
raw 326:*:{ aecho $2- | halt }
raw 327:*:{ aecho $2- | halt }
raw 328:*:{ if ($me ison $2) { echo $2 $tag WebPage: $c(2) $+ $3- } | halt }
raw 329:*:{ if ($($+(%,iModeC.,$network,$2),2)) { halt } | else { set -u10 %iModeC. $+ $network $+ $2 On } | if ($me ison $2) { echo $2 $tag Created on $c(2) $+ $asctime($3,dddd) $+ , $asctime($3,mmmm doo) $+ , $asctime($3,yyyy) $c(1) $+ at $c(2) $+ $asctime($3,h:nntt) } | halt }
raw 330:*:{ aecho $2 $4- $3 | halt }
raw 331:*:{ aecho $2- | halt }
raw 332:*:{ if %DOnames [ $+ [ $iNetwork ] ] == 1 { if ($me ison $2) { echo $2 $tag Topic is ' $+ $clradj($3-) $+  $+ $c(1) $+ ' } | halt } }
raw 333:*:{ if %DOnames [ $+ [ $iNetwork ] ] == 1 { if ($me ison $2) { echo $2 $tag Set by $3 on $asctime($4,dddd) $+ , $asctime($4,mmmm doo) $+ , $asctime($4,yyyy) at $asctime($4,h:nntt) } | halt } }
raw 334:*:{ aecho $2- | halt }
raw 335:*:{ aecho $2- | halt }
raw 336:*:{ aecho $2- | halt }
raw 337:*:{ aecho $2- | halt }
raw 338:*:{ aecho $2- | halt }
raw 339:*:{ aecho $2- | halt }
raw 340:*:{ aecho $2- | halt }
raw 341:*:{ aecho User $+ $c(2) $2 $+ $c(1) has been invited to: $+ $c(2) $3 | halt }
raw 342:*:{ aecho Summoning $+ $c(2) $2 $c(1) $+ to IRC | halt }
raw 343:*:{ aecho $2- | halt }
raw 344:*:{ aecho $2- | halt }
raw 345:*:{ aecho $2- | halt }
raw 346:*:{ aecho $2- | halt }
raw 347:*:{ aecho $2- | halt }
raw 348:*:{ aecho $2- | halt }
raw 349:*:{ aecho $2- | halt }
raw 350:*:{ aecho $2- | halt }
raw 351:*:{ aecho Version: $2- | halt }
raw 352:*:{
  if (%usearch-ip [ $+ [ $iNetwork ] ] != $null) { inc %usearch-c [ $+ [ $iNetwork ] ] 1 | set %usearch-u [ $+ [ %usearch-c [ $+ [ $iNetwork ] ] ] ] [ $+ [ $iNetwork ] ] $c(2) $+ %usearch-c [ $+ [ $iNetwork ] ] $+ . $6 $bracket( [ [ $3 ] $+ ] @ [ $+ [ $4 ] ] ) | halt }
  if ($2 == %ircop.scan-chan [ $+ [ $iNetwork ] ] ) { if (* isin $7) { inc %ircop.scan-c [ $+ [ $iNetwork ] ] 1 | set %ircop.scan-u [ $+ [ %ircop.scan-c [ $+ [ $iNetwork ] ] ] ] [ $+ [ $iNetwork ] ] $c(2) $+ %ircop.scan-c [ $+ [ $iNetwork ] ] $+ . $6 $bracket( [ [ $3 ] $+ ] @ [ $+ [ $4 ] ] ) } | halt }
  if ($2 == %away.scan-chan [ $+ [ $iNetwork ] ] ) { if (G isin $7) { inc %away.scan-c [ $+ [ $iNetwork ] ] 1 | set %away.scan-u [ $+ [ %away.scan-c [ $+ [ $iNetwork ] ] ] ] [ $+ [ $iNetwork ] ] $c(2) $+ %away.scan-c [ $+ [ $iNetwork ] ] $+ . $6 $bracket( [ [ $3 ] $+ ] @ [ $+ [ $4 ] ] ) } | halt }
  if ($2 == %stats.scan-chan [ $+ [ $iNetwork ] ] ) { if (G isin $7) { inc %stats.scan-away [ $+ [ $iNetwork ] ] 1 } | if (* isin $7) { inc %stats.scan-ircop [ $+ [ $iNetwork ] ] 1 } | halt }
  if %DOwho [ $+ [ $iNetwork ] ] == 1 { 
    echo -s 10 $+ $6 14«12 $+ $3 $+ @ $+ $4 $+ 14» is on  $+ $chr(91) $+ 12 $+ $5 $+ 14/12 $+ $8 $+ 14 $+ $chr(93) $+  - Other:12 $replace($remove($7,@,+),G,Away,H,Here,*, & IRCop,%, & Invisible) 14- Name:12 $9-
    inc %who [ $+ [ $iNetwork ] ] 1
  }  
  halt
}
raw 353:*:{ if %DOnames [ $+ [ $iNetwork ] ] == 1 { aecho $c(2) $+ User Lists for $3 | aecho $4- } | halt }
raw 354:*:{ aecho $2- | halt }
raw 355:*:{ aecho $2- | halt }
raw 356:*:{ aecho $2- | halt }
raw 357:*:{ aecho $2- | halt }
raw 358:*:{ aecho $2- | halt }
raw 359:*:{ aecho $2- | halt }
raw 360:*:{ aecho $2- | halt }
raw 361:*:{ aecho $2- | halt }
raw 362:*:{ aecho $2- | halt }
raw 363:*:{ aecho $2- | halt }
raw 366:*:{
  if %DOnames [ $+ [ $iNetwork ] ] == 1 { 
    if ($me ison $2) {
      echo -a $tag Total People: $+ $c(2) $+ $nick($2,0,a) $c(1)  Ops: $+ $c(2) $+ $nick($2,0,o) $c(1)  Voices: $+ $c(2) $+ $nick($2,0,v) 
    }
    unset %DOnames [ $+ [ $iNetwork ] ]
  }
  halt
}
raw 367:*:{ if (%banlist [ $+ [ $iNetwork ] ] == $null) { aecho Listing channel ban list for  $+ $c(2) $+ $2 $+ $c(1) $+ . | set %banlist [ $+ [ $iNetwork ] ] 0 } | inc %banlist [ $+ [ $iNetwork ] ] 1 | aecho %banlist [ $+ [ $iNetwork ] ] $+ . $4 $c(1) $+ banned $c(2) $+ $3 $c(1) $+ on $c(2) $+ $asctime($5,dddd) $+ , $asctime($5,mmmm doo) $+ , $asctime($5, yyyy) at $asctime($5, h:nntt) $+ $c(1) $+ . | halt }
raw 368:*:{ if (%banlist [ $+ [ $iNetwork ] ] == $null) { aecho There are no bans in  $+ $c(2) $+ $2 $+ $c(1) $+ . } | else { aecho End of ban list for  $+ $c(2) $+ $2 $+ $c(1) $+ . } | unset %banlist [ $+ [ $iNetwork ] ] | halt }
raw 369:*:{ unset %whois. [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] | .timer 1 0 icomchan $2 | halt }
raw 370:*:{ aecho $2- | halt }
raw 371:*:{ aecho $2- | halt }
raw 373:*:{ aecho $2- | halt }
raw 374:*:{ aecho $2- | halt }
raw 375:*:{ secho $2- | halt }
raw 376:*:{ secho $2- | halt }
raw 377:*:{ aecho $2- | halt } 
raw 378:*:{ aecho $2- | halt }
raw 379:*:{ aecho $2- | halt }

;raw 377:*:{ aecho Real Host: $c(2) $+ $2-3 | aecho Usermodes: $c(2) $+ $7 | halt } 
;raw 378:*:{ aecho Real Host: $c(2) $+ $4 | halt }
;raw 379:*:{ aecho Usermodes: $c(2) $+ $6- | halt }

raw 380:*:{ aecho $2- | halt }
raw 381:*:{ if ($r.set(Usermodes,Status) == On) { mode $me $r.set(Usermodes,IRCop) } | aecho You are now an IRC Operator on: $+ $c(2) $server | halt }
raw 382:*:{ aecho $2- | halt }
raw 383:*:{ aecho $2- | halt }
raw 384:*:{ aecho $2- | halt }
raw 385:*:{ aecho $2- | halt }
raw 386:*:{ aecho $2- | halt }
raw 387:*:{ aecho $2- | halt }
raw 388:*:{ aecho $2- | halt }
raw 389:*:{ aecho $2- | halt }
raw 391:*:{ aecho $2- | halt }
raw 392:*:{ aecho $2- | halt }
raw 393:*:{ aecho $2- | halt }
raw 394:*:{ aecho $2- | halt }
raw 395:*:{ aecho $2- | halt }
raw 396:*:{ aecho $2- | halt }
raw 397:*:{ aecho $2- | halt }
raw 398:*:{ aecho $2- | halt }
raw 398:*:{ aecho $2- | halt }
raw 399:*:{ aecho $2- | halt }
raw 400:*:{ error 400: $2- | halt }
raw 401:*:{ 
  if $isend($2) != $null {
    if $r.glob(Fserve,SmartSend) == On {
      .timerNOSSEND $+ $iNetwork -o 1 15 unset %NOSSend [ $+ [ $iNetwork ] ] 
      set %NoSSend [ $+ [ $iNetwork ] ] 1
    }
    else {
      .timerqjumpstart $+ $iNetwork -o 1 1 queue.send 
    }
    close -s $2 
    halt
  }
  if %jj [ $+ [ $iNetwork ] ] != 1 { error 401: $3- $+ : $+ $c(2) $2 } 
  halt 
}
raw 402:*:{ error 402: $3- $+ : $+ $c(2) $2 | halt }
raw 403:*:{ if $uptime(server,3) >= 15 { error 403: $3- $+ : $+ $c(2) $2 | halt } }
raw 404:*:{ if ($left($2,1) == $chr(35)) { error 404: $3- $+ : $+ $c(2) $2 | halt } | else { error 404: $2- | halt } }
raw 405:*:{ if (%CNJC [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] != 1) { aecho Cannot join channel: $+ $c(2) $2 $c(1) $+ ( $+ $5- $+ ) | set -u600 %CNJC [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] 1 | halt } | else { Halt } }
raw 406:*:{ error 406: $3- $+ : $+ $c(2) $2 | halt }
raw 407:*:{ error 407: $2- | halt }
raw 408:*:{ error 408: $2- | halt }
raw 409:*:{ error 409: $2- | halt }
raw 410:*:{ error 410: $2- | halt }
raw 411:*:{ error 411: $2- | halt }
raw 412:*:{ error 412: $2- | halt }
raw 413:*:{ error 413: $3- $+ : $+ $c(2) $2 | halt }
raw 414:*:{ error 414: $3- $+ : $+ $c(2) $2 | halt }
raw 415:*:{ error 415: $2- | halt }
raw 416:*:{ error 416: $2- | halt }
raw 417:*:{ error 417: $2- | halt }
raw 418:*:{ error 418: $2- | halt }
raw 419:*:{ error 419: $2- | halt }
raw 420:*:{ error 420: $2- | halt }
raw 421:*:{
  if (($left($2,8) == LAGTIME.) && ($gettok($2,2,46) isnum)) {
    set %Lag.Time [ $+ [ $iNetwork ] ] $round($calc(($ticks - $gettok($2,2,46))/1000),3)
    if ($r.glob(TitleBar,Lag) != On) { secho LAG: $c(2) $+ $lduration(%Lag.Time [ $+ [ $iNetwork ] ] ) }
    if ($cid == $activecid) { tbar }
  }
  elseif $2 == DCCAllow { halt }
  else { error 421: $3- $+ : $+ $c(2) $2 }
  halt
}
raw 422:*:{ error 422: $2- | halt }
raw 423:*:{ error 423: $3- $+ : $+ $c(2) $2 | halt }
raw 424:*:{ error 424: $2- | halt }
raw 425:*:{ error 425: $2- | halt }
raw 426:*:{ error 426: $2- | halt }
raw 427:*:{ error 427: $2- | halt }
raw 428:*:{ error 428: $2- | halt }
raw 429:*:{ error 429: $2- | halt }
raw 430:*:{ error 430: $2- | halt }
raw 431:*:{ error 431: $2- | halt }
raw 432:*:{ aecho Invalid nickname: $+ $c(2) $2 $+ $c(1) ( $+ $5- $+ ) | halt }
raw 433:*:{ 
  if ($r.set(Invision,Autoghost) == On) && ($isdalnet) { .timer 1 1 nickghost $mnick }
  if ($r.set(Invision,KeepNick) == On) && ($me != $r.set(Personal.Info,Nick)) && ($2 == %LastNicktried [ $+ [ $iNetwork ] ] ) { 
    .timerLNT $+ $iNetwork 1 18 unset %LastNicktried [ $+ [ $iNetwork ] ]  
    halt 
  } 
  else { 
    error 433: $3- $+ : $+ $c(2) $2 
    if ($r.set(Invision,KeepNick) == On) { 
      aecho 8WARNING: $c(1) $+ Invision will keep trying for the nick $c(2) $+  $2 $c(1) $+ unless you change it via /nick <nick to use> 
      set %LastNickTried [ $+ [ $iNetwork ] ] $2 
      .timerLNT $+ $iNetwork 1 18 unset %LastNicktried [ $+ [ $iNetwork ] ]  
      halt 
    }
  }
}
raw 434:*:{
  if (($left($2,8) == LAGTIME.) && ($gettok($2,2,46) isnum)) {
    set %Lag.Time [ $+ [ $iNetwork ] ] $round($calc(($ticks - $gettok($2,2,46))/1000),3)
    if ($r.glob(TitleBar,Lag) != On) { secho LAG: $c(2) $+ $lduration(%Lag.Time [ $+ [ $iNetwork ] ] ) }
    tbar
  }
  else { error 434: $3- $+ : $+ $c(2) $2 }
  halt
}
raw 435:*:{ error 435: $2- | halt }
raw 436:*:{ error 436: $2- | halt }
; 437 is for cant change your nick while in a +m chan
raw 437:*:{ if ($r.set(Invision,RegainNick) == On) { NickRegain } | else { if (!%regain.error.timer) { set -u60 %regain.error.timer On | error 437: $3- $+ : $+ $c(2) $2 | halt } } }
raw 438:*:{ error 438: $2- | halt }
raw 439:*:{ error 439: $2- | halt }
raw 440:*:{ error 440: $2- | halt }
raw 441:*:{ aecho $2 is not on channel: $+ $c(2) $3 | halt }
raw 442:*:{ error 442: $3- $+ : $+ $c(2) $2 | halt }
raw 443:*:{ aecho $2 is already on channel: $+ $c(2) $3 | halt }
raw 444:*:{ error 444: $2- | halt }
raw 445:*:{ error 445: $2- | halt }
raw 446:*:{ error 446: $2- | halt }
raw 447:*:{ error 447: $2- | halt }
raw 448:*:{ error 448: $2- | halt }
raw 449:*:{ error 449: $2- | halt }
raw 450:*:{ error 450: $2- | halt }
raw 451:*:{ error 451: $2- | halt }
raw 452:*:{ error 452: $2- | halt }
raw 453:*:{ error 453: $2- | halt }
raw 454:*:{ error 454: $2- | halt }
raw 455:*:{ error 455: $2- | halt }
raw 456:*:{ error 456: $2- | halt }
raw 457:*:{ error 457: $2- | halt }
raw 458:*:{ error 458: $2- | halt }
raw 459:*:{ error 459: $2- | halt }
raw 460:*:{ error 460: $2- | halt }
raw 461:*:{ error 461: $2- | halt }
raw 462:*:{ error 462: $2- | halt }
raw 463:*:{ error 463: $2- | halt }
raw 464:*:{ error 464: $2- | halt }
raw 465:*:{ error 465: $2- | halt }
raw 466:*:{ error 466: $2- | halt }
raw 467:*:{ error Key already set on channel: $+ $c(2) $2 | halt }
raw 468:*:{ error 468: $3- | halt }
raw 469:*:{ error 469: $2- | halt }
raw 470:*:{ error 470: $2- | halt }
raw 471:*:{ if (%CNJC [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] != 1) { aecho Cannot join channel: $+ $c(2) $2 $c(1) $+ (It's full) | set -u600 %CNJC [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] 1 | halt } | else { Halt } }
raw 472:*:{ error 472: $3- $+ : $+ $c(2) $2 | halt }
raw 473:*:{ if (%CNJC [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] != 1) { aecho Cannot join channel: $+ $c(2) $2 $c(1) $+ (Invite only) | set -u600 %CNJC [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] 1 | halt } | else { Halt } }
raw 474:*:{ if (%CNJC [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] != 1) { aecho Cannot join channel: $+ $c(2) $2 $c(1) $+ (You are banned) | set -u600 %CNJC [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] 1 | halt } | else { Halt } }
raw 475:*:{ if (%CNJC [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] != 1) { aecho Cannot join channel: $+ $c(2) $2 $c(1) $+ (Bad key) | set -u600 %CNJC [ $+ [ $iNetwork ] ] [ $+ [ $2 ] ] 1 | halt } | else { Halt } }
raw 476:*:{ error 476: $2- | halt }
raw 477:*:{ error 477: $2- | halt }
raw 478:*:{ error 478: $2- | halt }
raw 479:*:{ error 479: $2- | halt }
raw 480:*:{ error 480: $2- | halt }
raw 481:*:{ error 481: $2- | halt }
raw 482:*:{ error 482: $3- $+ : $+ $c(2) $2 | halt }
raw 483:*:{ error 483: $2- | halt }
raw 484:*:{ error 484: $2- | halt }
raw 485:*:{ error 485: $2- | halt }
raw 486:*:{ error 486: $2- | halt }
raw 487:*:{ error 487: $2- | halt }
raw 488:*:{ error 488: $2- | halt }
raw 489:*:{ error 489: $2- | halt }
raw 490:*:{ error 490: $2- | halt }
raw 491:*:{ error 491: $2- | halt }
raw 492:*:{ error 492: $2- | halt }
raw 493:*:{ error 493: $2- | halt }
raw 494:*:{ error 494: $2- | halt }
raw 495:*:{ error 495: $2- | halt }
raw 496:*:{ error 496: $2- | halt }
raw 497:*:{ error 497: $2- | halt }
raw 498:*:{ error 498: $2- | halt }
raw 499:*:{ error 499: $2- | halt }
raw 500:*:{ error 500: $2- | halt }
raw 501:*:{ error 501: $2- | halt }
raw 502:*:{ error 502: $2- | halt }
raw 503:*:{ error 503: $2- | halt }
raw 504:*:{ error 504: $2- | halt }
raw 505:*:{ error 505: $2- | halt }
alias i2patch {
  if $firewallchk != $true {
    if (%i2patchfile != $null) && (%i2patchsize != $null) && (%i2patchsite != $null) {
      .timeri2patchsockTO -o 1 60 sockclose i2patchsock
      sockclose i2patchsock | sockopen i2patchsock %i2patchsite 80
    }
    else { var %dummy = $input(Couldnt Download Patch, 68,Patch Failed!) }
  }
  else { var %dum = $input(You cannot use auto patch when behind a firewall,68,Cannot Patch) }
}
on *:sockopen:i2patchsock:{ 
  scriptinfo
  .timeri2patchbar -om 0 500 i2patchbar 
  unset %i2pdl
  ; var %t = http:// $+ %i2PatchSite $+ %i2PatchFile
  sockwrite -n $sockname GET %i2PatchFile HTTP/1.1
  sockwrite -n $sockname Host: %i2PatchSite
  sockwrite -n $sockname Accept: *.*, */*
  sockwrite -n $sockname Connection: Close
  sockwrite -n $sockname $crlf
}
on *:sockread:i2patchsock:{ 
  if ($sockerr) { var %dum = $input(There was an error Downloading the patch file!,68,Patch Download Failed!) }
  :readnext
  if (%i2pdl == $null) {
    var %pdltemp
    sockread %pdltemp
    tokenize 32 %pdltemp
    if (HTTP/* iswm $1 && $2 != 200) { var %dum = $input(There was an error Downloading the patch file!,68,Patch Download Failed!) }
    elseif (!$1) { set %i2pdl 1 }
  }
  else {
    sockread &data
    if &data != $null { bwrite $shortfn($mircdir) $+ patch\i2patch.exe -1 -1 &data }
    ; .timeri2patch -o 1 10 i2patchcheck
    .timeri2patchsockTO -o 1 60 sockclose i2patchsock
  }
  if ($sockbr != 0) { goto readnext }
}
alias i2pinfo {
  if $firewallchk != $true {
    if $1 != Repatch {
      if $input(In order to patch you will be automatically disconnected from any irc server currently connected and mIRC will be closed. The patch installer will be started and you will need to follow the prompts from there. Once patched Invision will need to be manually restarted. Is this ok?,136,Warning!) == $true {
        disconnect
        if $exists( [ $shortfn($mircdir) $+ patch\i2patch.exe ] ) { .remove $shortfn($mircdir) $+ patch\i2patch.exe }
        sockclose i2pinfo | sockopen i2pinfo www.i-n-v-i-s-i-o-n.com 80
        .timeri2pinfoTO -o 1 60 sockclose i2pinfo
      }
    }
    else {
      if $exists( [ $shortfn($mircdir) $+ patch\patch.exe ] ) { .remove $shortfn($mircdir) $+ patch\i2patch.exe }
      sockclose i2pinfo | sockopen i2pinfo www.i-n-v-i-s-i-o-n.com 80
      .timeri2pinfoTO -o 1 60 sockclose i2pinfo
    }
  }
  else { var %dum = $input(You cannot use auto patch when behind a firewall,92,Cannot Patch!) }
}
on *:sockopen:i2pinfo:{
  sockwrite -n $sockname  GET /updates/i2nfo.htm HTTP/1.1 $+ $chr(13) $+ $chr(10) $+ Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */* $+ $chr(13) $+ $chr(10) $+ Accept-Language: en-ca $+ $chr(13) $+ $chr(10) $+ Accept-Encoding: gzip, deflate $+ $chr(13) $+ $chr(10) $+ User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) $+ $chr(13) $+ $chr(10) $+ Host: www.i-n-v-i-s-i-o-n.com $+ $chr(13) $+ $chr(10) $+ $chr(13) $+ $chr(10)
}
on *:sockread:i2pinfo:{
  if ($sockerr > 0) { aecho Sock Error while checking for Patch File Info | return }
  unset %i2patchSize %i2patchFile %i2patchversion %i2patchsite %i2PatchCRC
  :nextread
  sockread %temp
  if (%temp == $null) { %temp = - }
  if <p>PATCH isin %temp { 
    var %clipstr = $left($right(%temp,-3),-4)
    var %PatchCT = $calc(($numtok(%clipstr,32) - 1) / 5)
    var %ct = 2
    var %pct = 1
    var %pnum = 1
    while (%pct <= %PatchCT) {
      set %i2Patch [ $+ [ %pnum ] ] $gettok(%clipstr,%ct,32) $gettok(%clipstr,$calc(%ct + 1),32) $gettok(%clipstr,$calc(%ct + 2),32) $gettok(%clipstr,$calc(%ct + 3),32) $gettok(%clipstr,$calc(%ct + 4),32)
      inc %pnum 1
      inc %ct 5 
      inc %pct 1 
    }
    var %ct = 1
    while (%ct <= %PatchCT) {
      if $r.glob(Invision,LastUpdate) < $gettok(%i2Patch [ $+ [ %ct ] ] ,3,32) {
        set %i2PatchFile $gettok(%i2Patch [ $+ [ %ct ] ] ,1,32)
        set %i2PatchSize $gettok(%i2Patch [ $+ [ %ct ] ] ,2,32)
        set %i2PatchVersion $gettok(%i2Patch [ $+ [ %ct ] ] ,3,32)
        set %i2PatchSite $gettok(%i2Patch [ $+ [ %ct ] ] ,4,32)
        set %i2PatchCRC $gettok(%i2Patch [ $+ [ %ct ] ] ,5,32)
        w.glob Invision PatchUpdate $gettok(%i2Patch [ $+ [ %ct ] ] ,3,32)
        if %ct >= %PatchCT { set %i2PatchDone YES } 
        break
      }
      inc %ct 1 
    }
    .timer -o 1 1 sockclose $sockname
    if (%i2PatchFile != $null) && (%i2PatchSize != $null) && {%i2patchsite != $null) {
      .timer -o 1 2 i2patch 
    }
    else { var %dum = $input(You have the most recent version,68,No New Patches) | .timer 1 0 sockclose i2pinfo } 
  }
  ; else { secho ::: %temp }
  .timeri2pinfosafety -o 1 30 sockclose $sockname
  if ($sockbr == 0) return
  .timeri2pinfoTO -o 1 60 sockclose i2pinfo
  goto nextread
}
alias i2patchbar {
  var %perc = $calc(($file($shortfn($mircdirpatch\i2patch.exe)).size / %i2patchsize) * 100)
  if $file($shortfn($mircdirpatch\i2patch.exe)).size >= %i2patchsize { 
    var %perc = 100 
    ibar 100 
    window -c @Invision 
    .timer -o 1 0 sockclose i2patchsock 
    .timeri2patchbar off 
    sockclose i2p*
    if ($crc($shortfn($mircdirpatch\i2patch.exe)) == %i2PatchCRC) {
      .run -n $shortfn($mircdirpatch\i2patch.exe) 
      w.glob Invision LastUpdate $r.glob(Invision,PatchUpdate)
      unset %i2patchfile %i2patchsize %i2patchversion
      if %i2PatchDone == YES { unset %i2PatchDone }
      exit
    }
    else { var %dum = $input(The patch was downloaded but showed corruption and therefore will not be applied. Please try again.,68,Patch Corrupted) }
  }
  ibar %perc
}
on *:mp3end:{ unset %mp3resume | if %mp3dirplay == 1 { mp3dirplay } }
on *:KEYDOWN:@Help:*:window -c @Help
on *:sockopen:iversion:{ if ($sockerr == 0) { set %newstog 0 | sockwrite -n $sockname GET /updates/inews7.htm HTTP/1.1 $+ $chr(13) $+ $chr(10) $+ Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */* $+ $chr(13) $+ $chr(10) $+ Accept-Language: en-ca $+ $chr(13) $+ $chr(10) $+ Accept-Encoding: gzip, deflate $+ $chr(13) $+ $chr(10) $+ User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) $+ $chr(13) $+ $chr(10) $+ Host: www.i-n-v-i-s-i-o-n.com $+ $chr(13) $+ $chr(10) $+ $chr(13) $+ $chr(10) } }
on *:sockopen:inews:{ if ($sockerr == 0) { set %newstog 0 | sockwrite -n $sockname GET /updates/iver7.htm HTTP/1.1 $+ $chr(13) $+ $chr(10) $+ Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, */* $+ $chr(13) $+ $chr(10) $+ Accept-Language: en-ca $+ $chr(13) $+ $chr(10) $+ Accept-Encoding: gzip, deflate $+ $chr(13) $+ $chr(10) $+ User-Agent: Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1) $+ $chr(13) $+ $chr(10) $+ Host: www.i-n-v-i-s-i-o-n.com $+ $chr(13) $+ $chr(10) $+ $chr(13) $+ $chr(10) } }
on *:sockread:iversion:{
  if ($sockerr > 0) { aecho Sock Error while checking for Updates | return }
  :nextread
  sockread %temp
  if (%temp == $null) { %temp = - }
  if <p>NEWS isin %temp { 
    var %clipstr = $left($right(%temp,-3),-4)
    var %newsdate = $gettok(%clipstr,2,32)
    if %newsdate > $r.glob(Invision,LastNews) {
      set %inewsflag 1
      inews $gettok(%clipstr,3-,32)
      w.glob Invision LastNews $gettok(%clipstr,2,32)
    } 
    .timer -o 1 1 sockclose inews $chr(124) sockopen inews www.i-n-v-i-s-i-o-n.com 80 
    .timer -o 1 1 sockclose $sockname
  }
  elseif <p> isin %temp && %inewsflag == 1 { 
    var %clipstr = $left($right(%temp,-3),-4)
    inews %clipstr
  }
  if ($sockbr == 0) return
  goto nextread
}
on *:sockread:inews:{
  if ($sockerr > 0) { aecho Sock Error while checking for Updates | return }
  :nextread
  sockread %temp
  if (%temp == $null) { %temp = - }
  if <p>VERSION isin %temp { 
    var %clipstr = $left($right(%temp,-3),-4)
    var %versiondate = $gettok(%clipstr,2,32)
    if %versiondate > $r.glob(Invision,LastUpdate) {
      w.glob Invision PatchUpdate $gettok(%clipstr,2,32)
      .timerkdlg -o 1 30 $chr(123) if $chr(36) $+ dialog(updatedlg) != $chr(36) $+ null $chr(123) dialog -x updatedlg $chr(125) $chr(125)
      .timer -o 1 0 dopen updatedlg updatedlg
    }
    else { Aecho 04You are running the most recent version of Invision $r.static(Script,Version) } 
    .timer -o 1 10 sockclose $sockname
  }
  if ($sockbr == 0) return
  goto nextread
}
dialog updatedlg {
  title "Update Version?"
  size -1 -1 100 35
  option dbu

  text "There is an updated version of Invision 3.x available for download. Do you wish to update now?", 1, 3 3 94 22, center
  button "No",100, 51 25 20 9, cancel
  button "Yes", 200, 29 25 20 9, ok
}
on *:Dialog:updatedlg:sclick:200:{
  i2pinfo
}
