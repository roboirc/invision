; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: ifsmdlg.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: File Server Manager Dialog Routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
;#############################################################
;                           THE ON TEXT ROUTINES FOR THE MP3 SERVER
;#############################################################
on ^*:text:*:#:{
  var %fulladdress = $fulladdress
  var %curNetwork = $iNetwork
  if $r.set(mp3serv,Status) == On {
    if (($r.set(mp3serv,Channels) == All) || ($r.set(mp3serv,Channels) == $null) || ($istok($r.set(mp3serv,Channels),$chan,44) == $true)) {
      if ($1 == !List) && ($r.set(mp3serv,Status) == On) && ($mp3serv.ad.temp != $null) && ($r.set(mp3serv,List) == On) && ($r.set(mp3serv,Listen) == On) && ($r.set(mp3serv,Pause) != On) && %mp3ListFlag [ $+ [ %curNetwork ] ] != 1 {
        .timer -o 1 10 unset %mp3ListFlag [ $+ [ %curNetwork ] ]
        set %mp3ListFlag [ $+ [ %curNetwork ] ] 1 
        .notice $nick $mp3serv.ad.temp 
      }
      if ($r.set(mp3serv,mp3search) == On) && ($r.set(mp3serv,Status) == On) && ($r.set(mp3serv,Listen) == On) {
        if (($1 == !mp3search) || ($1 == @find)  || ($1 == @locator)) && (%mp3searchFlag [ $+ [ %curNetwork ] ] != 1) && ($2 != $null) && ($len($2-) >= 3) {
          .timer -o 1 2 unset %mp3searchFlag [ $+ [ %curNetwork ] ]
          unset %mp3srch*
          set %mp3searchFlag [ $+ [ %curNetwork ] ] 1
          var %mp3srchstr = *:* $+ $replace($2-,$chr(32),*,$chr(44),*) $+ *
          var %mp3srchFindCT = $iif($istable(mp3list [ $+ [ %curNetwork ] ] ),$hmatch(mp3list [ $+ [ %curNetwork ] ] ,%mp3srchstr,0).data,0)
          if (%mp3srchFindCT >= 10) { var %mp3srchFindCT = 10 }
          if (%mp3srchFindCT != 0) {
            msg $nick $c(1) $+ I found $iif(%mp3srchFindCT >= 10,over) $c(2) $+ %mp3srchFindCT $c(1) $+ match(s) for $c(2) $+ $2- $c(1) $+ Current Status: $+ $chr(40) $c(1) $+ $sv(Sends, $isend(0) $+ / $+ $r.set(mp3serv,Max.Sends.Total)) $c(1) $+ $sv(Queues, $queue(0) $+ / $+ $r.set(mp3serv,Max.Queues.Total)) $c(1) $+ $chr(41) $ilogo
            set %mp3isoct [ $+ [ %curNetwork ] ] 1
            var %ct = 1
            while (%ct <= %mp3srchFindCT ) { 
              set %mp3srchPathClip [ $+ [ %curNetwork ] ] $hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] ,%mp3srchstr,%ct).data)
              .timer 1 $calc(%ct * 2) .msg $nick $replace($c(1) $+ Found $c(2) $+ $mp3serv.ad.trigger $nopath($hget(mp3list [ $+ [ %curNetwork ] ] ,$hmatch(mp3list [ $+ [ %curNetwork ] ] ,%mp3srchstr,%ct).data)) $bracket($hget(mp3list [ $+ [ %curNetwork ] ] ,bitrate [ $+ [ $right($hmatch(mp3list [ $+ [ %curNetwork ] ] ,%mp3srchstr,%ct).data,-4) ] ] )) $bracket($hget(mp3list [ $+ [ %curNetwork ] ] ,size [ $+ [ $right($hmatch(mp3list [ $+ [ %curNetwork ] ] ,%mp3srchstr,%ct).data,-4) ] ] )),$chr(32) $+ $chr(91) $+ $chr(32), $chr(32) $chr(36) $+ chr(91) $chr(32),$chr(32) $+ $chr(93) $+ $chr(32),$chr(32) $chr(36) $+ chr(93) $chr(32),$chr(32) $+ $chr(123) $+ $chr(32),$chr(32) $chr(36) $+ chr(123) $chr(32),$chr(32) $+ $chr(125) $+ $chr(32),$chr(32) $chr(36) $+ chr(125) $chr(32),$chr(32) $+ $chr(124) $+ $chr(32),$chr(32) $chr(36) $+ chr(124) $chr(32)) 
              inc %ct 1 
            }
            if (%mp3srchFindCT >= 10) { .timer 1 $calc((%ct * 2) + 2) .msg $nick $c(1) $+ Too many results to display. Please refine your search $iif($r.set(mp3serv,SendList) == On,or get my list) $+ . }
            .timer 1 $calc((%ct * 2) + 3) .msg $nick $c(1) $+ You can copy and paste $iif($r.set(mp3serv,CTCP) != On,it in the channel) to get it (do not include the streamrate or filesize tags). 
          }
        }
      }
      if ($r.set(mp3serv,Status) == On) && ($r.set(mp3serv,Listen) == On) && ($r.set(mp3serv,Pause) != On) {
        if ($strip($1-,burc) ==  @ [ $+ [ $me ] ] ) && ($r.set(mp3serv,SendList) == On) && (%mp3ReqFlag [ $+ [ %curNetwork ] ] != 1) { .timer -o 1 8 unset %mp3ReqFlag [ $+ [ %curNetwork ] ] | set %mp3ReqFlag [ $+ [ %curNetwork ] ] 1 | mp3servLIST $nick | halt }
        if ((($strip($1,burc) == ! [ $+ [ $me ] ] ) && ($r.set(mp3serv,UseNickTrigger) == On)) || (($strip($1,burc) == $strip($r.set(mp3serv,Trigger),burc)) && ($r.set(mp3serv,UseNickTrigger) != On))) && (%mp3ReqFlag [ $+ [ %curNetwork ] ] != 1) && ($2 != $null) {
          .timer -o 1 3 unset %mp3ReqFlag [ $+ [ %curNetwork ] ]
          set %mp3ReqFlag [ $+ [ %curNetwork ] ] 1
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
    }
  }
}
;#############################################################
;  File Server Manager Dialog
;#############################################################
dialog fileServer {
  title "Invision File Server Manager"
  icon %dialogIcon
  size -1 -1 300 281
  option dbu

  tab "Setup", 1, 5 3 294 215
  tab "Records", 2
  tab "Triggers", 6
  tab "Scheduler", 7

  box " Active Help ", 1501, 4 220 292 49
  edit "", 1502, 8 228 284 39, multi autovs

  button "OK", 680, 85 272 40 9, Ok
  button "Cancel", 681, 130 272 40 9, Cancel
  button "Apply", 682, 175 272 40 9

  ;#############################################################
  ;           SETUP tab 1
  ;#############################################################

  ; @@@@@@ ID's 908 - 924 @@@@@@
  box "", 908, 7 16 164 135, tab 1
  box "Max Sends:", 910, 10 20 50 28, tab 1
  text "Each:", 911, 16 29 13 10, tab 1
  edit "", 912, 32 28 18 10, tab 1 center autohs
  text "Total:", 913, 16 38 13 10, tab 1
  edit "", 914, 32 37 18 10, tab 1 center autohs
  box "Max Queues:", 920, 62 20 50 28, tab 1
  text "Each:", 921, 68 29 13 10, tab 1
  edit "", 922, 84 28 18 10, tab 1 center autohs
  text "Total:", 923, 68 38 13 10, tab 1
  edit "", 924, 84 37 18 10, tab 1 center autohs
  ; @@@@@@ ID's 947,701,930 - 932,353,200-205 @@@@@@
  check "", 947, 10 48 8 10, tab 1
  text "Anti GET Script mode", 1947, 19 49 56 8, tab 1
  check "", 701, 85 48 8 10, tab 1 
  text "Enable Anti-Camp", 1701, 94 49 56 8, tab 1
  check "", 930, 10 58 8 10, tab 1
  text "File Server Chat", 1930, 19 59 56 8, tab 1
  check "", 931, 10 68 8 10, tab 1
  text "Announce Open Slots", 1931, 19 69 56 8, tab 1
  check "Auto Start on Connect", 932, 10 78 8 10, tab 1
  text "Auto Start on Connect", 1932, 19 79 56 8, tab 1
  check "", 353, 85 68 8 10, tab 1
  text "Enable CloneGuard", 1353, 94 69 47 8, tab 1

  check "Cache Directory Indexes for Searching" , 200, 10 98 113 10, tab 1
  button "Build All", 201, 127 98 30 9, tab 1
  button "?", 205, 160 98 7 9, tab 1
  check "Automatically Rebuild Indexes every" , 202, 10 108 100 10, tab 1
  edit "", 203, 111 108 15 10, tab 1 center autohs
  text "mins", 204, 127 110 15 8, tab 1
  ; @@@@@@ ID's 940 - 946 @@@@@@
  text "Max Users:", 940, 121 29 27 8, tab 1
  edit "", 941, 148 27 18 10, tab 1 center autohs
  text "Ad Delay(min)", 945, 114 38 34 8, tab 1
  edit "", 946, 148 36 18 10, tab 1 center autohs
  ; @@@@@@ ID's 960 - 964 @@@@@@
  box "Advertising Channels:", 960, 175 20 120 123, tab 1
  combo 961, 179 30 113 100, tab 1
  check "All Channels", 962, 179 130 50 10, tab 1
  button "Add", 963, 235 130 25 10, tab 1 
  button "Rem", 964, 262 130 25 10, tab 1
  ; @@@@@@ ID's 591,981,948,983 @@@@@@
  check "CTCP Triggers only", 591, 85 58 65 10, tab 1
  check "Enable !Search/@Find", 981, 10 88 70 10, tab 1
  check "Run with no Advertisement", 948, 85 88 75 10, tab 1
  check "Enable !List", 983, 85 78 60 10, tab 1
  ; @@@@@@ ID's 966,976,982,985,980,978 @@@@@@
  check "Enable Insta-Send.   File Size Threshold (bytes)", 966, 10 121 123 8, tab 1
  edit "", 976, 135 120 33 10, tab 1 autohs
  check "Enable Size Guard. File Size Threshold (bytes)", 982, 10 131 123 8, tab 1
  edit "", 985, 133 130 35 10, tab 1 autohs
  check "Enable Remote Control.   Use Password", 980, 10 141 105 8, tab 1
  edit "", 978, 118 140 50 10, tab 1 autohs
  ; @@@@@@ ID's 967,925 - 927,280 @@@@@@
  box " Ad Options ", 967, 8 151 285 41, tab 1
  check "Verbose Ad", 925, 14 158 40 8, tab 1
  check "Include Current BW", 926, 56 158 58 8, tab 1
  check "Include Avg. Queue Time", 927, 116 158 70 8, tab 1
  check "Use 2 line Ad", 280, 190 158 45 8, tab 1
  ; @@@@@@ ID's 950,951,350 - 352 @@@@@@
  text "MOTD", 950, 10 168 16 10, tab 1
  edit "", 951, 29 166 260 24, multi tab 1 
  text "Terms File", 350, 10 197 27 10, tab 1
  edit "", 351, 37 195 234 10, autohs, tab 1
  button "...", 352, 273 195 15 10, tab 1

  ; text "Clone Guard - Blocks people from using clones to get or queue more files the you intend per user." 975, 10 188 280 8, tab 1
  ; text "Anti-Camp - Prevents people from hanging out on your server taking up Fserve Session Slots.", 977, 10 195 280 8, tab 1
  ; text "SizeGuard - This blocks files from beings sent/queued that are larger then the size you specify in the threshold box." , 968, 10 203 280 8, tab 1
  ; text "Insta-Send - Will allow files under the size specified in the threshold box to be sent instantly with no bandwidth limiting", 984, 10 210 280 8, tab 1
  ;#############################################################
  ;      Records Tab 
  ;#############################################################
  ; @@@@@@ ID's 165,170 - 181 @@@@@@
  box " Stats: ", 165, 10 19 150 107, tab 2 
  text "Record CPS:", 170, 18 30 40 13, tab 2
  edit "", 171, 60 27 90 12, center, tab 2 autohs
  text "Bytes Sent:", 172, 18 50 40 13, tab 2
  edit "", 173, 60 47 90 12, center, tab 2 autohs
  text "Files Sent:", 174, 18 70 40 13, tab 2
  edit "", 175, 60 67 90 12, center, tab 2 autohs
  text "Failed Sends:", 176, 18 90 40 13, tab 2
  edit "", 177, 60 87 90 12, center, tab 2 autohs
  text "Accessed:", 178, 18 110 40 13, tab 2
  edit "", 179, 60 107 90 12, center, tab 2 autohs
  text "Most Requested:", 180, 10 130 284 9, tab 2 center
  list 181, 10 137 284 72, tab 2 vsbar 
  ; @@@@@@ ID's 185 - 191 @@@@@@
  box "Reset Stats for:", 185, 165 19 130 80, tab 2
  button "Record CPS", 186, 175 27 110 9, tab 2
  button "Bytes Sent", 187, 175 37 110 9, tab 2
  button "Files Sent", 188, 175 47 110 9, tab 2
  button "Failed Sends", 189, 175 57 110 9, tab 2
  button "Accessed", 190, 175 67 110 9, tab 2
  button "Most Requested", 191, 175 77 110 9, tab 2
  ; @@@@@@ ID's 311 - 320 @@@@@@
  button "All Request and Leech Records", 315, 175 87 110 9, tab 2
  button "Request Stats", 311, 60 207 45 10, tab 2
  button "Leech Stats", 312, 115 207 45 10, tab 2
  button "Daily Limits", 313, 170 207 45 10, tab 2
  box " Most Requested Settings ", 316, 165 99 130 27, tab 2
  radio "Record Files", 317, 170 106 50 9, tab 2 group
  radio "Record Directories", 318, 225 106 60 9, tab 2
  text "Top records to keep:", 319, 170 117 75 8, tab 2
  edit "", 320, 246 115 17 10, tab 2 center autohs

  ;#############################################################
  ;           Triggers Tab 6
  ;#############################################################

  box "", 75, 10 16 284 41, tab 6
  check "Enable #1", 70, 13 22 35 8, tab 6
  text "Trigger 1", 71, 117 23 35 12, tab 6
  edit "", 72, 140 21 80 10, tab 6 autohs
  button "AscIIize", 551, 223 22 25 8, tab 6 
  check "Allow /CTCP", 556, 250 21 40 10, tab 6
  text "Root Directory", 76, 14 35 60 10, tab 6
  edit "", 77, 50 33 170 10, autohs, tab 6
  button "...", 78, 222 33 15 10, tab 6
  text "Welcome File", 80, 14 46 60 10, tab 6
  edit "", 81, 50 44 170 10, autohs, tab 6
  button "...", 82, 222 44 15 10, tab 6
  box "Access",500,240 30 51 25, tab 6
  radio "Ops",501, 244 37 20 8, tab 6 group
  radio "Voices",502, 266 37 23 8, tab 6
  radio "All",503, 244 45 20 8, tab 6

  box "", 95, 10 56 284 41, tab 6
  check "Enable #2", 90, 13 62 35 8, tab 6
  button "Channels", 262, 50 62 25 8, tab 6
  button "Rebuild Index", 252, 77 62 38 8, tab 6
  text "Trigger 2", 91, 117 63 35 12, tab 6
  edit "", 92, 140 61 80 10, tab 6 autohs
  button "AscIIize", 552, 223 62 25 8, tab 6 
  check "Allow /CTCP", 557, 250 61 40 10, tab 6
  text "Root Directory", 96, 14 75 60 10, tab 6
  edit "", 97, 50 73 170 10, autohs, tab 6
  button "...", 98, 222 73 15 10, tab 6
  text "Welcome File", 100, 14 86 60 10, tab 6
  edit "", 101, 50 84 170 10, autohs, tab 6
  button "...", 102, 222 84 15 10, tab 6
  box "Access",504,240 70 51 25, tab 6
  radio "Ops",505, 244 77 20 8, tab 6 group
  radio "Voices",506, 266 77 23 8, tab 6 
  radio "All",507, 244 85 20 8, tab 6
  box "", 115, 10 96 284 41, tab 6
  check "Enable #3", 110, 13 102 35 8, tab 6
  button "Channels", 261, 50 22 25 8, tab 6
  button "Rebuild Index", 251, 77 22 38 8, tab 6
  button "Channels", 263, 50 102 25 8, tab 6
  button "Rebuild Index", 253, 77 102 38 8, tab 6

  text "Trigger 3", 111, 117 103 35 12, tab 6
  edit "", 112, 140 101 80 10, tab 6 autohs
  button "AscIIize", 553, 223 102 25 8, tab 6 
  check "Allow /CTCP", 558, 250 101 40 10, tab 6
  text "Root Directory", 116, 14 115 60 10, tab 6
  edit "", 117, 50 113 170 10, autohs, tab 6
  button "...", 118, 222 113 15 10, tab 6
  text "Welcome File", 120, 14 126 60 10, tab 6
  edit "", 121, 50 124 170 10, autohs, tab 6
  button "...", 122, 222 124 15 10, tab 6
  box "Access",508,240 110 51 25, tab 6
  radio "Ops",509, 244 117 20 8, tab 6 group
  radio "Voices",510, 266 117 23 8, tab 6 
  radio "All",511, 244 125 20 8, tab 6

  box "", 135, 10 136 284 41, tab 6
  check "Enable #4", 130, 13 142 35 8, tab 6
  button "Channels", 264, 50 142 25 8, tab 6
  button "Rebuild Index", 254, 77 142 38 8, tab 6

  text "Trigger 4", 131, 117 143 35 12, tab 6
  edit "", 132, 140 141 80 10, tab 6 autohs
  button "AscIIize", 554, 223 142 25 8, tab 6 
  check "Allow /CTCP", 559, 250 141 40 10, tab 6
  text "Root Directory", 136, 14 155 60 10, tab 6
  edit "", 137, 50 153 170 10, autohs, tab 6
  button "...", 138, 222 153 15 10, tab 6
  text "Welcome File", 140, 14 166 60 10, tab 6
  edit "", 141, 50 164 170 10, autohs, tab 6
  button "...", 142, 222 164 15 10, tab 6
  box "Access",512,240 150 51 25, tab 6
  radio "Ops",513, 244 157 20 8, tab 6 group
  radio "Voices",514, 266 157 23 8, tab 6 
  radio "All",515, 244 165 20 8, tab 6

  box "", 155, 10 176 284 41, tab 6
  check "Enable #5", 150, 13 182 35 8, tab 6
  button "Channels", 265, 50 182 25 8, tab 6
  button "Rebuild Index", 255, 77 182 38 8, tab 6
  ; button "Channels ??", 256, 261 223 35 13, tab 6
  ; button "Reindex ??", 257, 4 223 35 13, tab 6

  text "Trigger 5", 151, 117 183 35 12, tab 6
  edit "", 152, 140 181 80 10, tab 6 autohs
  button "AscIIize", 555, 223 182 25 8, tab 6 
  check "Allow /CTCP", 560, 250 181 40 10, tab 6
  text "Root Directory", 156, 14 195 60 10, tab 6
  edit "", 157, 50 193 170 10, autohs, tab 6
  button "...", 158, 222 193 15 10, tab 6
  text "Welcome File", 160, 14 206 60 10, tab 6
  edit "", 161, 50 204 170 10, autohs, tab 6
  button "...", 162, 222 204 15 10, tab 6
  box "Access",516,240 190 51 25, tab 6
  radio "Ops",517, 244 197 20 8, tab 6 group
  radio "Voices",518, 266 197 23 8, tab 6 
  radio "All",519, 244 205 20 8, tab 6

  ;#############################################################
  ;           Scheduler Tab 7
  ;#############################################################
  box "", 600, 10 16 284 200, tab 7
  box " Start/Stop Times ", 601, 14 20 140 183, tab 7

  check "Timer #1 set for:", 610, 18 27 50 10,tab 7
  edit "", 611, 67 28 35 10, tab 7 center
  check "Sun", 711, 16 40 14 9, tab 7 push
  check "Mon",712, 30 40 14 9, tab 7 push
  check "Tue", 713, 44 40 14 9, tab 7 push
  check "Wed",714, 58 40 14 9, tab 7 push
  check "Thu", 715, 72 40 14 9, tab 7 push
  check "Fri",716, 86 40 14 9, tab 7 push
  check "Sat", 717, 100 40 14 9, tab 7 push
  radio "Startup", 612, 117 26 30 8, tab 7 group
  radio "Shutdown", 613, 117 34 35 8, tab 7 
  radio "Close", 614, 117 42 30 8, tab 7
  box "", 602, 14 50 140 1, tab 7

  check "Timer #2 set for:", 620, 18 58 50 10,tab 7
  edit "", 621, 67 58 35 10, tab 7 center
  check "Sun", 721, 16 70 14 9, tab 7 push
  check "Mon",722, 30 70 14 9, tab 7 push
  check "Tue", 723, 44 70 14 9, tab 7 push
  check "Wed",724, 58 70 14 9, tab 7 push
  check "Thu", 725, 72 70 14 9, tab 7 push
  check "Fri", 726, 86 70 14 9, tab 7 push
  check "Sat", 727, 100 70 14 9, tab 7 push
  radio "Startup", 622, 117 56 35 8, tab 7 group
  radio "Shutdown", 623, 117 64 35 8, tab 7 
  radio "Close", 624, 117 72 35 8, tab 7
  box "", 603, 14 80 140 1, tab 7

  check "Timer #3 set for:", 630, 18 88 50 10,tab 7
  edit "", 631, 67 88 35 10, tab 7 center
  check "Sun", 731, 16 100 14 9, tab 7 push
  check "Mon",732, 30 100 14 9, tab 7 push
  check "Tue", 733, 44 100 14 9, tab 7 push
  check "Wed",734, 58 100 14 9, tab 7 push
  check "Thu", 735, 72 100 14 9, tab 7 push
  check "Fri", 736, 86 100 14 9, tab 7 push
  check "Sat", 737, 100 100 14 9, tab 7 push
  radio "Startup", 632, 117 86 35 8, tab 7 group
  radio "Shutdown", 633, 117 94 35 8, tab 7 
  radio "Close", 634, 117 102 35 8, tab 7
  box "", 604, 14 110 140 1, tab 7

  check "Timer #4 set for:", 640, 18 118 50 10,tab 7
  edit "", 641, 67 118 35 10, tab 7 center
  check "Sun", 741, 16 130 14 9, tab 7 push
  check "Mon",742, 30 130 14 9, tab 7 push
  check "Tue", 743, 44 130 14 9, tab 7 push
  check "Wed",744, 58 130 14 9, tab 7 push
  check "Thu", 745, 72 130 14 9, tab 7 push
  check "Fri", 746, 86 130 14 9, tab 7 push
  check "Sat", 747, 100 130 14 9, tab 7 push
  radio "Startup", 642, 117 116 35 8, tab 7 group
  radio "Shutdown", 643, 117 124 35 8, tab 7 
  radio "Close", 644, 117 132 35 8, tab 7
  box "", 605, 14 140 140 1, tab 7

  check "Timer #5 set for:", 650, 18 148 50 10,tab 7
  edit "", 651, 67 148 35 10, tab 7 center
  check "Sun", 751, 16 160 14 9, tab 7 push
  check "Mon",752, 30 160 14 9, tab 7 push
  check "Tue", 753, 44 160 14 9, tab 7 push
  check "Wed",754, 58 160 14 9, tab 7 push
  check "Thu", 755, 72 160 14 9, tab 7 push
  check "Fri", 756, 86 160 14 9, tab 7 push
  check "Sat", 757, 100 160 14 9, tab 7 push
  radio "Startup", 652, 117 146 35 8, tab 7 group
  radio "Shutdown", 653, 117 154 35 8, tab 7 
  radio "Close", 654, 117 162 35 8, tab 7
  box "", 608, 14 170 140 1, tab 7

  check "Timer #6 set for:", 660, 18 178 50 10,tab 7
  edit "", 661, 67 178 35 10, tab 7 center
  check "Sun", 761, 16 190 14 9, tab 7 push
  check "Mon",762, 30 190 14 9, tab 7 push
  check "Tue", 763, 44 190 14 9, tab 7 push
  check "Wed",764, 58 190 14 9, tab 7 push
  check "Thu", 765, 72 190 14 9, tab 7 push
  check "Fri", 766, 86 190 14 9, tab 7 push
  check "Sat", 767, 100 190 14 9, tab 7 push
  radio "Startup", 662, 117 176 35 8, tab 7 group
  radio "Shutdown", 663, 117 184 35 8, tab 7 
  radio "Close", 664, 117 192 35 8, tab 7

  box " Bandwidth Adjust Times ", 401, 155 20 135 183, tab 7
  check "Timer A set for:", 410, 159 28 46 10, tab 7
  edit "", 411, 204 28 22 10, tab 7
  text "Bandwidth:", 412, 232 29 27 10, tab 7
  edit "", 413, 258 28 30 10, tab 7
  box "", 415, 155 42 135 1, tab 7

  check "Timer B set for:", 420, 159 50 46 10, tab 7
  edit "", 421, 204 50 22 10, tab 7
  text "Bandwidth:", 422, 232 51 27 10, tab 7
  edit "", 423, 258 50 30 10, tab 7
  box "", 416, 155 64 135 1, tab 7

  check "Timer C set for:", 430, 159 72 46 10, tab 7
  edit "", 431, 204 72 22 10, tab 7
  text "Bandwidth:", 432, 232 73 27 10, tab 7
  edit "", 433, 258 72 30 10, tab 7
  box "", 417, 155 86 135 1, tab 7

  check "Timer D set for:", 440, 159 94 46 10, tab 7
  edit "", 441, 204 94 22 10, tab 7
  text "Bandwidth:", 442, 232 95 27 10, tab 7
  edit "", 443, 258 94 30 10, tab 7
  box "", 418, 155 108 135 1, tab 7

  check "Timer E set for:", 450, 159 116 46 10, tab 7
  edit "", 451, 204 116 22 10, tab 7
  text "Bandwidth:", 452, 232 117 27 10, tab 7
  edit "", 453, 258 116 30 10, tab 7
  box "", 419, 155 130 135 1, tab 7

  check "Timer F set for:", 460, 159 138 46 10, tab 7
  edit "", 461, 204 138 22 10, tab 7
  text "Bandwidth:", 462, 232 139 27 10, tab 7
  edit "", 463, 258 138 30 10, tab 7
  box "", 465, 155 152 135 1, tab 7

  text "Time settings must be entered in 24hour format. For example, if you wanted to have the File Server start at say 10:00pm you would enter 22:00 for the time. If you want it to shutdown at 4:00am you would enter 04:00. Bandwidth is for Total Server Bandwidth and must be entered in CPS.", 667, 159 160 126 40, tab 7

}
on *:dialog:InvisFserve:*:*:{
  if ($devent == edit) {
    if ( $did == 46) { w.set Min.Cps Rate $did($dname, 46).text }
    if ( $did == 972 ) { did -ra InvisFserve 46 $did($dname, 972).text }
    if ($did == 970) { if ($did($dname,970).text == 0) || ($did($dname,970).text == $null) { did -u $dname 700 | did -b $dname 700 } | else { did -e $dname 700 } }
  }
  if $devent == mouse { 
    .timer -om 1 500 FSMHELP $mouse.x $mouse.y
  }
  if ($devent == init) {
    dialog -t $dname Invision File Server Manager for $iif($iSetwork != $null,$iSetwork,Global)
    .timerFSidx $+ $iNetwork off
    CleanTriggers
    var %days = Sun,Mon,Tue,Wed,Thu,Fri,Sat
    var %sets = T1days,T2days,T3days,T4days,T5days,T6days
    var %doct = 710
    while (%doct <= 760) {
      var %dinct  = 1
      unset %curdays
      while (%dinct <= 7) {
        if $istok($r.set(Fserve.sch, [ $gettok(%sets,$calc((%doct / 10) - 70),44) ] ) , $gettok(%days,%dinct,44) , 44) { did -c $dname $calc(%doct + %dinct) } 
        inc %dinct 1
      }
      inc %doct 10
    }
    if $r.set(Fserve,SilentMode) == On { did -c $dname 948 }
    if $r.set(Fserve,AntiGet) == On { did -c $dname 947 }
    if $r.set(Fserve,TwoLineAd) == On { did -c $dname 280,925 }
    did -ra $dname 180 Top $r.set(Fserve,RecordsKeep) Most Requested
    did -ra $dname 320 $vnum($r.glob(Fserve,RecordsKeep),5)
    if ($r.glob(DCCmgr,MostRequested) == File || $r.glob(DCCmgr,MostRequested) == $null) { did -c $dname 317 } | else { did -c $dname 318 } 
    if $r.set(Fserve,AQT) == On { did -c $dname 927 }
    if $r.set(Fserve,AdBW) == On { did -c $dname 926 }
    did -ra $dname 976 $vnum($r.set(Fserve,Insta.Send.Size),1)
    did -ra $dname 912 $iif($r.set(Fserve,Max.Sends.Each) isnum 0-500,$r.set(Fserve,Max.Sends.Each),1)
    did -ra $dname 914 $iif($r.set(Fserve,Max.Sends.Total) isnum 0-500,$r.set(Fserve,Max.Sends.Total),2)
    did -ra $dname 922 $iif($r.set(Fserve,Max.Queues.Each) isnum 0-500,$r.set(Fserve,Max.Queues.Each),4)
    did -ra $dname 924 $iif($r.set(Fserve,Max.Queues.Total) isnum 0-500,$r.set(Fserve,Max.Queues.Total),10)
    did -ra $dname 978 $r.set(Fserve,Remote.pw)
    if ($r.set(Fserve,AntiCamp) == On) { did -c $dname 701 }
    if ($r.set(Fserve,Fserve.Chat) == On) { did -c $dname 930 }
    if ($r.set(Fserve,Slot.Announce) == On) { did -c $dname 931 }
    if ($r.set(Fserve,Auto.Start) == On) { did -c $dname 932 }
    did -ra $dname 941 $vnum($r.set(Fserve,Max.Serve),4)
    did -ra $dname 946 $vnum($r.set(Fserve,Ad.Delay),5)
    if $r.set(Fserve,Note) != $null { did -ra $dname 951 $r.set(Fserve,Note) }
    if (($r.set(Fserve,Channels) == All) || ($r.set(Fserve,Channels) == $null)) { 
      did -c $dname 962 
      did -b $dname 961,963,964 
    }
    else { 
      var %FSchans = $r.set(Fserve,Channels)
      var %ct = 1
      while (%ct <= $numtok(%FSchans,44)) {
        var %chan = $gettok(%FSchans,%ct,44)
        var %temp = %chan $chr(160) $chr(160) $chr(91) $iif(($istok($r.set(Fserve.1,Channels),%chan,44) || ($r.set(Fserve.1,Channels) == all) || ($r.set(Fserve.1,channels) == $null)),1) $iif(($istok($r.set(Fserve.2,Channels),%chan,44) || ($r.set(Fserve.2,Channels) == all) || ($r.set(Fserve.2,channels) == $null)),2) $iif(($istok($r.set(Fserve.3,Channels),%chan,44) || ($r.set(Fserve.3,Channels) == all) || ($r.set(Fserve.3,channels) == $null)),3) $iif(($istok($r.set(Fserve.4,Channels),%chan,44) || ($r.set(Fserve.4,Channels) == all) || ($r.set(Fserve.4,channels) == $null)),4) $iif(($istok($r.set(Fserve.5,Channels),%chan,44) || ($r.set(Fserve.5,Channels) == all) || ($r.set(Fserve.5,channels) == $null)),5) $chr(93)
        var %newchans = $addtok(%newchans,%temp,44)
        inc %ct 1
        continue
      }
      dla $dname 961 %newchans 
    }
    ; if ($r.set(Min.CPS,Status) == On) { did -c $dname 968 }
    if ($r.set(Fserve,InstaSend.Status) == On) { did -c $dname 966 }
    if ($r.set(Fserve,Remote.Control) == On) { did -c $dname 980 }
    if ($r.set(Fserve,Search) == On) { did -c $dname 981 }
    if ($r.set(Fserve,SizeGuard) == On) { did -c $dname 982 }
    if ($r.set(Fserve,List) == On) { did -c $dname 983 }
    did -mra $dname 171 [ [ $ratefix($vnum($gettok($r.set(Fserve,Record.CPS),1,32),0))  by $isset($gettok($r.set(Fserve,Record.CPS),2,32)) ] ]
    did -mra $dname 173 $size($r.set(Fserve,Send.Bytes))
    did -mra $dname 175 $vnum($r.set(Fserve,Send.Total),0)
    did -mra $dname 177 $vnum($r.set(Fserve,Send.Fails),0)
    did -mra $dname 179 $vnum($r.set(Fserve,Access),0)
    var %tot = $iif($r.glob(Fserve,RecordsKeep) >= 1,$r.glob(Fserve,RecordsKeep),1)
    var %ct = 1
    while (%ct <= %tot) {
      did -a $dname 181 $chr(91) $+ $chr(35) $+ %ct $+ $chr(93) $chr(160) $r.glob(Fserve,DirRecord.Name [ $+ [ %ct ] ] ) $iif($r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) != $null, $chr(160) $chr(40) $+ $r.glob(Fserve,DirRecord.Count [ $+ [ %ct ] ] ) $+ $chr(41))
      inc %ct 1
      continue
    }
    if ($r.set(Fserve.1,Status) == On) { did -c $dname 70 }
    did -ra $dname 72 $r.set(Fserve.1,Trigger)
    did -mra $dname 77 $longfn($r.set(Fserve.1,Root.Dir))
    did -mra $dname 81 $iif($r.set(Fserve.1,Welcome.File) != None && $r.set(Fserve.1,Welcome.File) != $null,$longfn($r.set(Fserve.1,Welcome.File)),None)
    if ($r.set(Fserve.2,Status) == On) { did -c $dname 90 }
    did -ra $dname 92 $r.set(Fserve.2,Trigger)
    did -mra $dname 97 $longfn($r.set(Fserve.2,Root.Dir))
    did -mra $dname 101 $iif($r.set(Fserve.2,Welcome.File) != None && $r.set(Fserve.2,Welcome.File) != $null,$longfn($r.set(Fserve.2,Welcome.File)),None)
    if ($r.set(Fserve.3,Status) == On) { did -c $dname 110 }
    did -ra $dname 112 $r.set(Fserve.3,Trigger)
    did -mra $dname 117 $longfn($r.set(Fserve.3,Root.Dir))
    did -mra $dname 121 $iif($r.set(Fserve.3,Welcome.File) != None && $r.set(Fserve.3,Welcome.File) != $null,$longfn($r.set(Fserve.3,Welcome.File)),None)
    if ($r.set(Fserve.4,Status) == On) { did -c $dname 130 }
    did -ra $dname 132 $r.set(Fserve.4,Trigger)
    did -mra $dname 137 $longfn($r.set(Fserve.4,Root.Dir))
    did -mra $dname 141 $iif($r.set(Fserve.4,Welcome.File) != None && $r.set(Fserve.4,Welcome.File) != $null,$longfn($r.set(Fserve.4,Welcome.File)),None)
    if ($r.set(Fserve.5,Status) == On) { did -c $dname 150 }
    did -ra $dname 152 $r.set(Fserve.5,Trigger)
    did -mra $dname 157 $longfn($r.set(Fserve.5,Root.Dir))
    did -mra $dname 161 $iif($r.set(Fserve.5,Welcome.File) != None && $r.set(Fserve.5,Welcome.File) != $null,$longfn($r.set(Fserve.5,Welcome.File)),None)
    did -mra $dname 351 $iif($r.set(Fserve,Terms.file) != None && $r.set(Fserve,Terms.file) != $null,$longfn($r.set(Fserve,Terms.file)),None)
    if ($did($dname,980).state == 1) { did -e $dname 978 } | else { did -b $dname 978 }

    did -ra $dname 985 $vnum($r.set(Fserve,sg.size),25000000)
    if ($r.set(Fserve.Sch,T1status) == On) { did -c $dname 610 }
    if ($r.set(Fserve.Sch,T2status) == On) { did -c $dname 620 }
    if ($r.set(Fserve.Sch,T3status) == On) { did -c $dname 630 }
    if ($r.set(Fserve.Sch,T4status) == On) { did -c $dname 640 }
    if ($r.set(Fserve.Sch,T5status) == On) { did -c $dname 650 }
    if ($r.set(Fserve.Sch,T6status) == On) { did -c $dname 660 }
    if ($r.set(Fserve.Sch,TAstatus) == On) { did -c $dname 410 }
    if ($r.set(Fserve.Sch,TBstatus) == On) { did -c $dname 420 }
    if ($r.set(Fserve.Sch,TCstatus) == On) { did -c $dname 430 }
    if ($r.set(Fserve.Sch,TDstatus) == On) { did -c $dname 440 }
    if ($r.set(Fserve.Sch,TEstatus) == On) { did -c $dname 450 }
    if ($r.set(Fserve.Sch,TFstatus) == On) { did -c $dname 460 }
    did -ra $dname 611 $isset($r.set(Fserve.Sch,T1time),03:00)
    did -ra $dname 621 $isset($r.set(Fserve.Sch,T2time),06:00)
    did -ra $dname 631 $isset($r.set(Fserve.Sch,T3time),09:00)
    did -ra $dname 641 $isset($r.set(Fserve.Sch,T4time),17:00)
    did -ra $dname 651 $isset($r.set(Fserve.Sch,T5time),20:00)
    did -ra $dname 661 $isset($r.set(Fserve.Sch,T6time),24:00)
    did -ra $dname 411 $isset($r.set(Fserve.Sch,TAtime),03:00)
    did -ra $dname 421 $isset($r.set(Fserve.Sch,TBtime),06:00)
    did -ra $dname 431 $isset($r.set(Fserve.Sch,TCtime),09:00)
    did -ra $dname 441 $isset($r.set(Fserve.Sch,TDtime),17:00)
    did -ra $dname 451 $isset($r.set(Fserve.Sch,TEtime),20:00)
    did -ra $dname 461 $isset($r.set(Fserve.Sch,TFtime),24:00)
    did -ra $dname 413 $isset($r.set(Fserve.Sch,TAbw),0)
    did -ra $dname 423 $isset($r.set(Fserve.Sch,TBbw),40000)
    did -ra $dname 433 $isset($r.set(Fserve.Sch,TCbw),20000)
    did -ra $dname 443 $isset($r.set(Fserve.Sch,TDbw),30000)
    did -ra $dname 453 $isset($r.set(Fserve.Sch,TEbw),50000)
    did -ra $dname 463 $isset($r.set(Fserve.Sch,TFbw),0)
    if ($r.set(Fserve.Sch,T1action) == Start) { did -c $dname 612 } 
    elseif ($r.set(Fserve.Sch,T1action) == Close) { did -c $dname 614 }
    else { did -c $dname 613 }
    if ($r.set(Fserve.Sch,T2action) == Start) { did -c $dname 622 } 
    elseif ($r.set(Fserve.Sch,T2action) == Close) { did -c $dname 624 }
    else { did -c $dname 623 }
    if ($r.set(Fserve.Sch,T3action) == Start) { did -c $dname 632 } 
    elseif ($r.set(Fserve.Sch,T3action) == Close) { did -c $dname 634 }
    else { did -c $dname 633 }
    if ($r.set(Fserve.Sch,T4action) == Start) { did -c $dname 642 } 
    elseif ($r.set(Fserve.Sch,T4action) == Close) { did -c $dname 644 }
    else { did -c $dname 643 }
    if ($r.set(Fserve.Sch,T5action) == Start) { did -c $dname 652 } 
    elseif ($r.set(Fserve.Sch,T5action) == Close) { did -c $dname 654 }
    else { did -c $dname 653 }
    if ($r.set(Fserve.Sch,T6action) == Start) { did -c $dname 662 } 
    elseif ($r.set(Fserve.Sch,T6action) == Close) { did -c $dname 664 }
    else { did -c $dname 663 }
    if ($r.set(Fserve,CloneGuard) == On) { did -c $dname 353 }
    if ($r.set(Fserve,CTCPonly) == On) { did -c $dname 591 }
    if ($r.set(Fserve.1,CTCP) == On) { did -c $dname 556 }
    if ($r.set(Fserve.2,CTCP) == On) { did -c $dname 557 }
    if ($r.set(Fserve.3,CTCP) == On) { did -c $dname 558 }
    if ($r.set(Fserve.4,CTCP) == On) { did -c $dname 559 }
    if ($r.set(Fserve.5,CTCP) == On) { did -c $dname 560 }
    if ($r.set(Fserve.1,ACCESS) == O) { did -c $dname 501 }
    if ($r.set(Fserve.1,ACCESS) == V) { did -c $dname 502 }
    if ($r.set(Fserve.1,ACCESS) == A) { did -c $dname 503 }
    if ($r.set(Fserve.2,ACCESS) == O) { did -c $dname 505 }
    if ($r.set(Fserve.2,ACCESS) == V) { did -c $dname 506 }
    if ($r.set(Fserve.2,ACCESS) == A) { did -c $dname 507 }
    if ($r.set(Fserve.3,ACCESS) == O) { did -c $dname 509 }
    if ($r.set(Fserve.3,ACCESS) == V) { did -c $dname 510 }
    if ($r.set(Fserve.3,ACCESS) == A) { did -c $dname 511 }
    if ($r.set(Fserve.4,ACCESS) == O) { did -c $dname 513 }
    if ($r.set(Fserve.4,ACCESS) == V) { did -c $dname 514 }
    if ($r.set(Fserve.4,ACCESS) == A) { did -c $dname 515 }
    if ($r.set(Fserve.5,ACCESS) == O) { did -c $dname 517 }
    if ($r.set(Fserve.5,ACCESS) == V) { did -c $dname 518 }
    if ($r.set(Fserve.5,ACCESS) == A) { did -c $dname 519 }

    if ($r.set(Fserve,SearchCache) == On) { did -c $dname 200 }
    if ($r.set(Fserve,AutoCache) == On) { did -c $dname 202 }
    did -a $dname 203 $vnum($r.set(Fserve,CacheTime),120)
    if ($r.set(Fserve,Verbose) == On) { did -c $dname 925 }
  }
  if ($devent == sclick) {
    if $did == 1 {
      did -r $dname 961
      if (($r.set(Fserve,Channels) == All) || ($r.set(Fserve,Channels) == $null)) { 
        did -c $dname 962 
        did -b $dname 961,963,964 
      }
      else { 
        var %FSchans = $r.set(Fserve,Channels)
        var %ct = 1
        while (%ct <= $numtok(%FSchans,44)) {
          var %chan = $gettok(%FSchans,%ct,44)
          var %temp = %chan $chr(160) $chr(160) $chr(91) $iif(($istok($r.set(Fserve.1,Channels),%chan,44) || ($r.set(Fserve.1,Channels) == all) || ($r.set(Fserve.1,channels) == $null)),1) $iif(($istok($r.set(Fserve.2,Channels),%chan,44) || ($r.set(Fserve.2,Channels) == all) || ($r.set(Fserve.2,channels) == $null)),2) $iif(($istok($r.set(Fserve.3,Channels),%chan,44) || ($r.set(Fserve.3,Channels) == all) || ($r.set(Fserve.3,channels) == $null)),3) $iif(($istok($r.set(Fserve.4,Channels),%chan,44) || ($r.set(Fserve.4,Channels) == all) || ($r.set(Fserve.4,channels) == $null)),4) $iif(($istok($r.set(Fserve.5,Channels),%chan,44) || ($r.set(Fserve.5,Channels) == all) || ($r.set(Fserve.5,channels) == $null)),5) $chr(93)
          var %newchans = $addtok(%newchans,%temp,44)
          inc %ct 1
          continue
        }
        dla $dname 961 %newchans 
      }
    }
    if $did == 313 {
      if $exists( [ $shortfn($mircdir) $+ invision\leech.ini ] ) { .remove $shortfn($mircdir) $+ invision\leech.ini }
    }
    if $did == 256 {
      phelp Trigger Channels let you select which channels out of the channels listed on the setup tab that you want that particular trigger to be active on. Triggers that you have set to off for a listed channel will not appear in the add nor will respond in that channel.  This allows you to setup your Fserve so that you can simultaneously serve in multiple channels with isolated triggers. Note that you cannot have Channels on setup tab set to ALL and specify channels for the triggers. You must specify all the channels you intend to serve on in order to use this feature.
    }
    if $did == 257 {
      phelp Reindex well cause the cache file for this directory alone to be updated without updating any other trigger directories. You must have ''Use Fast Index Building'' enabled to use this feature. If for some reason you have had to disable Use Fast Index Building then you will need to use the Build All button from the setup tab to update. 
    }
    if $did == 205 {
      phelp Use Cached Directory Indexes for Searching allows you to use precompiled cache listings for search requests rather then having to scan all drives involved each time a request is made. This is generally faster (especially over networked drives) and saves time. The one draw back is you must update your indexes everytime there is something added or changed in or under a directory used by the server. There is an option however to have it automatically reindex at intervals you set. 
    }
    if ($did == 78) { did -ra $dname 77 $sdir(C:\,Choose Root Directory) | w.set Fserve.1 Root.Dir $shortfn($did($dname,77).text) }
    if ($did ==  82) { .timer 1 0 did -ra InvisFserve 81 $isset( $sfile($shortfn($mircdir),Choose Welcome File (Cancel = None),Select) ,None ) }
    if ($did == 98) { did -ra $dname 97 $sdir(C:\,Choose Root Directory) | w.set Fserve.2 Root.Dir $shortfn($did($dname,97).text) }
    if ($did ==  102) { .timer 1 0 did -ra $dname 101 $isset( $sfile($shortfn($mircdir),Choose Welcome File (Cancel = None),Select) ,None ) }
    if ($did == 118) { did -ra $dname 117 $sdir(C:\,Choose Root Directory) | w.set Fserve.3 Root.Dir $shortfn($did($dname,117).text) }
    if ($did ==  122) { .timer 1 0 did -ra $dname 121 $isset( $sfile($shortfn($mircdir),Choose Welcome File (Cancel = None),Select) ,None ) }
    if ($did == 138) { did -ra $dname 137 $sdir(C:\,Choose Root Directory) | w.set Fserve.4 Root.Dir $shortfn($did($dname,137).text) }
    if ($did ==  142) { .timer 1 0 did -ra $dname 141 $isset( $sfile($shortfn($mircdir),Choose Welcome File (Cancel = None),Select) ,None ) }
    if ($did == 158) { did -ra $dname 157 $sdir(C:\,Choose Root Directory) | w.set Fserve.5 Root.Dir $shortfn($did($dname,157).text) }
    if ($did ==  162) { .timer 1 0 did -ra $dname 161 $isset( $sfile($shortfn($mircdir),Choose Welcome File (Cancel = None),Select) ,None ) }
    if ($did ==  352) { .timer 1 0 did -ra $dname 351 $isset( $sfile($shortfn($mircdir),Choose Terms File (Cancel = None),Select) ,None ) }
    if ($did == 963) && ($did($dname,961).sel == $null || $did($dname,961).sel == 0) && ($did($dname,961).text != $null) {
      var %chan = $vc($did($dname,961).text) 
      var %temp = %chan $chr(160) $chr(160) $chr(91) $iif(($istok($r.set(Fserve.1,Channels),%chan,44) || ($r.set(Fserve.1,Channels) == all) || ($r.set(Fserve.1,channels) == $null)),1) $iif(($istok($r.set(Fserve.2,Channels),%chan,44) || ($r.set(Fserve.2,Channels) == all) || ($r.set(Fserve.2,channels) == $null)),2) $iif(($istok($r.set(Fserve.3,Channels),%chan,44) || ($r.set(Fserve.3,Channels) == all) || ($r.set(Fserve.3,channels) == $null)),3) $iif(($istok($r.set(Fserve.4,Channels),%chan,44) || ($r.set(Fserve.4,Channels) == all) || ($r.set(Fserve.4,channels) == $null)),4) $iif(($istok($r.set(Fserve.5,Channels),%chan,44) || ($r.set(Fserve.5,Channels) == all) || ($r.set(Fserve.5,channels) == $null)),5) $chr(93)
      did -a $dname 961 %temp
      did -c $dname 961 $did($dname,961).lines 
    }
    if ($did == 964) && ($did($dname,961).sel isnum) { 
      did -d $dname 961 $did($dname,961).sel 
    }
    if ($did == 962) { if ($did($dname,$did).state == 1) { did -b $dname 961,963,964 } | else { did -e $dname 961,963,964 } }
    if ($did == 186) { w.set Fserve Record.CPS 0 n/a | did -mra $dname 171 $ratefix($vnum($gettok($r.set(Fserve,Record.CPS),1,32),0)) by $isset($gettok($r.set(Fserve,Record.CPS),2-,32)) }
    if ($did == 187) { w.set Fserve Send.Bytes 0 | did -mra $dname 173 $size($r.set(Fserve,Send.Bytes)) }
    if ($did == 188) { w.set Fserve Send.Total 0 | did -mra $dname 175 $vnum($r.set(Fserve,Send.Total),0) }
    if ($did == 189) { w.set Fserve Send.Fails 0 | did -mra $dname 177 $vnum($r.set(Fserve,Send.Fails),0) }
    if ($did == 190) { w.set Fserve Access 0 | did -mra $dname 179 $vnum($r.set(Fserve,Access),0) }
    if ($did == 191) { 
      var %ct = 1
      while (%ct <= 20) {
        d.glob Fserve DirRecord.Name [ $+ [ %ct ] ] 
        d.glob Fserve DirRecord.Count [ $+ [ %ct ] ] 
        inc %ct 1
        continue
      }
      if $?!="Most likely you will want to erase the Directory/Filename Records too in order to fully have a clean slate for the Most Requested List" == $true { c.rec }
      dialog -ev InvisFserve fileServer
      did -r $dname 181 
    }
    if ($did == 980) { if ($did($dname,980).state == 1) { did -e $dname 978 } | else { did -b $dname 978 } } 
    if ($did == 261) {
      set %TCHnum 1
      set %TCHtitle Trigger 1 Active Channels
      set %TCHchans $r.set(Fserve.1,Channels)
      dopen TrigChans TrigChans
    }
    if ($did == 262) {
      set %TCHnum 2
      set %TCHtitle Trigger 2 Active Channels
      set %TCHchans $r.set(Fserve.2,Channels)
      dopen TrigChans TrigChans
    }
    if ($did == 263) {
      set %TCHnum 3
      set %TCHtitle Trigger 3 Active Channels
      set %TCHchans $r.set(Fserve.3,Channels)
      dopen TrigChans TrigChans
    }
    if ($did == 264) {
      set %TCHnum 4
      set %TCHtitle Trigger 4 Active Channels
      set %TCHchans $r.set(Fserve.4,Channels)
      dopen TrigChans TrigChans
    }
    if ($did == 265) {
      set %TCHnum 5
      set %TCHtitle Trigger 5 Active Channels
      set %TCHchans $r.set(Fserve.5,Channels)
      dopen TrigChans TrigChans
    }
    if $did == 280 { did -c $dname 925 }
    if $did != 680 && $did != 682 { click }
    if ($did == 680) || ($did == 682) {
      setsaved Fserve
      .timerFS $+ $iNetwork off
      .timerCheckForTransfers $+ $iNetwork off
      unset %countSendsHold [ $+ [ $iNetwork ] ] %countGetsHold [ $+ [ $iNetwork ] ]
      var %days = Sun,Mon,Tue,Wed,Thu,Fri,Sat
      var %sets = T1days,T2days,T3days,T4days,T5days,T6days
      var %doct = 710
      while (%doct <= 760) {
        var %dinct  = 1
        unset %curdays
        while (%dinct <= 7) {
          if $did($dname, [ $calc(%doct + %dinct) ] ).state == 1 { var %curdays = $addtok(%curdays,$gettok(%days,%dinct,44),44) }
          inc %dinct 1
          continue
        }
        w.set Fserve.sch $gettok(%sets,$calc((%doct / 10) - 70),44) %curdays
        inc %doct 10
        continue
      }
      if $did($dname,948).state == 1 { w.set Fserve SilentMode On } | else { w.set Fserve SilentMode Off }
      if $did($dname,947).state == 1 { w.set Fserve AntiGET On } | else { w.set Fserve AntiGET Off }
      if $did($dname,280).state == 1 { w.set Fserve TwoLineAd On } | else { w.set Fserve TwoLineAd Off }
      if $did($dname,317).state == 1 { w.glob DCCmgr MostRequested File } | else { w.glob DCCmgr MostRequested Dir }
      if $did($dname,320).text >= 1 && $did($dname,320).text <= 20 { w.glob Fserve RecordsKeep $did($dname,320).text } | else { w.glob Fserve RecordsKeep 5 }
      if $did($dname,927).state == 1 { w.set Fserve AQT On } | else { w.set Fserve AQT Off }
      if ($did($dname,610).state == 1) { w.set Fserve.Sch T1status On } | else { w.set Fserve.Sch T1Status Off }
      if ($did($dname,620).state == 1) { w.set Fserve.Sch T2status On } | else { w.set Fserve.Sch T2Status Off }
      if ($did($dname,630).state == 1) { w.set Fserve.Sch T3status On } | else { w.set Fserve.Sch T3Status Off }
      if ($did($dname,640).state == 1) { w.set Fserve.Sch T4status On } | else { w.set Fserve.Sch T4Status Off }
      if ($did($dname,650).state == 1) { w.set Fserve.Sch T5status On } | else { w.set Fserve.Sch T5Status Off }
      if ($did($dname,660).state == 1) { w.set Fserve.Sch T6status On } | else { w.set Fserve.Sch T6Status Off }
      if ($did($dname,410).state == 1) { w.set Fserve.Sch TAstatus On } | else { w.set Fserve.Sch TAStatus Off }
      if ($did($dname,420).state == 1) { w.set Fserve.Sch TBstatus On } | else { w.set Fserve.Sch TBStatus Off }
      if ($did($dname,430).state == 1) { w.set Fserve.Sch TCstatus On } | else { w.set Fserve.Sch TCStatus Off }
      if ($did($dname,440).state == 1) { w.set Fserve.Sch TDstatus On } | else { w.set Fserve.Sch TDStatus Off }
      if ($did($dname,450).state == 1) { w.set Fserve.Sch TEstatus On } | else { w.set Fserve.Sch TEStatus Off }
      if ($did($dname,460).state == 1) { w.set Fserve.Sch TFstatus On } | else { w.set Fserve.Sch TFStatus Off }
      w.set Fserve.Sch T1time $isset($did($dname,611).text,03:00)
      w.set Fserve.Sch T2time $isset($did($dname,621).text,06:00)
      w.set Fserve.Sch T3time $isset($did($dname,631).text,09:00)
      w.set Fserve.Sch T4time $isset($did($dname,641).text,17:00)
      w.set Fserve.Sch T5time $isset($did($dname,651).text,20:00)
      w.set Fserve.Sch T6time $isset($did($dname,661).text,24:00)
      w.set Fserve.Sch TAtime $isset($did($dname,411).text,03:00)
      w.set Fserve.Sch TBtime $isset($did($dname,421).text,06:00)
      w.set Fserve.Sch TCtime $isset($did($dname,431).text,09:00)
      w.set Fserve.Sch TDtime $isset($did($dname,441).text,17:00)
      w.set Fserve.Sch TEtime $isset($did($dname,451).text,20:00)
      w.set Fserve.Sch TFtime $isset($did($dname,461).text,23:59)
      w.set Fserve.Sch TAbw $isset($did($dname,413).text,0)
      w.set Fserve.Sch TBbw $isset($did($dname,423).text,40000)
      w.set Fserve.Sch TCbw $isset($did($dname,433).text,20000)
      w.set Fserve.Sch TDbw $isset($did($dname,443).text,30000)
      w.set Fserve.Sch TEbw $isset($did($dname,453).text,50000)
      w.set Fserve.Sch TFbw $isset($did($dname,463).text,0)
      StartFSTimers
      if ($did($dname,966).state == 1) { w.set Fserve InstaSend.Status On } | else { w.set Fserve InstaSend.Status Off }
      w.set Fserve Insta.Send.Size $iif($did($dname,976).text isnum 1-500000000000,$did($dname,976).text,50000) 
      w.set Fserve Max.Sends.Each $iif($did($dname,912).text isnum 0-500,$did($dname,912),1)
      w.set Fserve Max.Sends.Total $iif($did($dname,914).text isnum 0-500,$did($dname,914).text,2) 
      w.set Fserve Max.Queues.Each $iif($did($dname,922).text isnum 0-500,$did($dname,922).text,4)
      w.set Fserve Max.Queues.Total $iif($did($dname,924).text isnum 0-500,$did($dname,924).text,10)
      w.set Fserve sg.size $vnum($did($dname,985).text,25000000)
      if ($did($dname,930).state == 1) { w.set Fserve Fserve.Chat On } | else { w.set Fserve Fserve.Chat Off }
      if ($did($dname,931).state == 1) { w.set Fserve Slot.Announce On } | else { w.set Fserve Slot.Announce Off }
      if ($did($dname,932).state == 1) { w.set Fserve Auto.Start On } | else { w.set Fserve Auto.Start Off }
      if ($did($dname,980).state == 1) { w.set Fserve Remote.Control On } | else { w.set Fserve Remote.Control Off }
      if ($did($dname,981).state == 1) { w.set Fserve Search On } | else { w.set Fserve Search Off }
      if ($did($dname,982).state == 1) { w.set Fserve SizeGuard On } | else { w.set Fserve SizeGuard Off }
      if ($did($dname,983).state == 1) { w.set Fserve List On } | else { w.set Fserve List Off }
      if ($did($dname,701).state == 1) { w.set Fserve AntiCamp On } | else { w.set Fserve AntiCamp Off }
      w.set Fserve Remote.pw $did($dname,978).text
      w.set Fserve Max.Serve $vnum($did($dname,941).text,4)
      w.set Fserve Ad.Delay $vnum($did($dname,946).text,5)
      if ($did($dname,962).state == 1) || ($did($dname,961).lines == 0) { w.set Fserve Channels All } | else { dlstok1 $dname 961 w.set Fserve Channels }
      if $did($dname,951).text != $null { iw.set Fserve Note $did($dname,951,1).text $did($dname,951,2).text $did($dname,951,3).text } | else { d.set fserve Note }
      if ($did($dname,70).state == 1) { w.set Fserve.1 Status On } | else { w.set Fserve.1 Status Off }
      iw.set Fserve.1 Trigger $remove($isset($did($dname,72).text,!trigger1),$chr(44),$chr(40),$chr(41),$chr(91),$chr(93))
      w.set Fserve.1 Welcome.File $iif((($did($dname,81).text != None) && ($did($dname,81).text != $null)),$shortfn($did($dname,81).text),None)
      if ($did($dname,90).state == 1) { w.set Fserve.2 Status On } | else { w.set Fserve.2 Status Off }
      iw.set Fserve.2 Trigger $remove($isset($did($dname,92).text,!trigger2),$chr(44),$chr(40),$chr(41),$chr(91),$chr(93))
      w.set Fserve.2 Welcome.File $iif(($did($dname,101).text != None && $did($dname,101).text != $null),$shortfn($did($dname,101).text),None)
      if ($did($dname,110).state == 1) { w.set Fserve.3 Status On } | else { w.set Fserve.3 Status Off }
      iw.set Fserve.3 Trigger $remove($isset($did($dname,112).text,!trigger3),$chr(44),$chr(40),$chr(41),$chr(91),$chr(93))
      w.set Fserve.3 Welcome.File $iif(($did($dname,121).text != None && $did($dname,121).text != $null),$shortfn($did($dname,121).text),None)
      if ($did($dname,130).state == 1) { w.set Fserve.4 Status On } | else { w.set Fserve.4 Status Off }
      iw.set Fserve.4 Trigger $remove($isset($did($dname,132).text,!trigger4),$chr(44),$chr(40),$chr(41),$chr(91),$chr(93))
      w.set Fserve.4 Welcome.File $iif(($did($dname,141).text != None && $did($dname,141).text != $null),$shortfn($did($dname,141).text),None)
      if ($did($dname,150).state == 1) { w.set Fserve.5 Status On } | else { w.set Fserve.5 Status Off }
      iw.set Fserve.5 Trigger $remove($isset($did($dname,152).text,!trigger5),$chr(44),$chr(40),$chr(41),$chr(91),$chr(93))
      w.set Fserve.5 Welcome.File $iif(($did($dname,161).text != None && $did($dname,161).text != $null),$shortfn($did($dname,161).text),None)
      w.set Fserve Terms.File $iif(($did($dname,351).text != None && $did($dname,351).text != $null),$shortfn($did($dname,351).text),None)
      if ($r.set(Fserve,Status) == On) && ($r.set(Fserve,Listen) == On) && ($r.set(Fserve,SilentMode) != On) { .timerFserve $+ $iNetwork -o 0 $calc( [ $r.set(Fserve,Ad.Delay) ] * 60) fserve.ad }
      if ($did($dname,612).state == 1) { w.set Fserve.Sch T1action Start } 
      elseif ($did($dname,614).state == 1) { w.set Fserve.Sch T1action Close }
      else { w.set Fserve.Sch T1action Stop }
      if ($did($dname,622).state == 1) { w.set Fserve.Sch T2action Start }
      elseif ($did($dname,624).state == 1) { w.set Fserve.Sch T2action Close }
      else { w.set Fserve.Sch T2action Stop }
      if ($did($dname,632).state == 1) { w.set Fserve.Sch T3action Start }
      elseif ($did($dname,634).state == 1) { w.set Fserve.Sch T3action Close }
      else { w.set Fserve.Sch T3action Stop }
      if ($did($dname,642).state == 1) { w.set Fserve.Sch T4action Start }
      elseif ($did($dname,644).state == 1) { w.set Fserve.Sch T4action Close }
      else { w.set Fserve.Sch T4action Stop }
      if ($did($dname,652).state == 1) { w.set Fserve.Sch T5action Start }
      elseif ($did($dname,654).state == 1) { w.set Fserve.Sch T5action Close }
      else { w.set Fserve.Sch T5action Stop }
      if ($did($dname,662).state == 1) { w.set Fserve.Sch T6action Start } 
      elseif ($did($dname,664).state == 1) { w.set Fserve.Sch T6action Close }
      else { w.set Fserve.Sch T6action Stop }
      if ($did($dname,353).state == 1) { w.set Fserve CloneGuard On } | else { w.set Fserve CloneGuard Off }
      if ($did($dname,591).state == 1) { w.set Fserve CTCPonly On } | else { w.set Fserve CTCPonly Off }
      if ($did($dname,556).state == 1) { w.set Fserve.1 CTCP On } | else { w.set Fserve.1 CTCP Off }
      if ($did($dname,557).state == 1) { w.set Fserve.2 CTCP On } | else { w.set Fserve.2 CTCP Off }
      if ($did($dname,558).state == 1) { w.set Fserve.3 CTCP On } | else { w.set Fserve.3 CTCP Off }
      if ($did($dname,559).state == 1) { w.set Fserve.4 CTCP On } | else { w.set Fserve.4 CTCP Off }
      if ($did($dname,560).state == 1) { w.set Fserve.5 CTCP On } | else { w.set Fserve.5 CTCP Off }

      if ($did($dname,501).state == 1) { w.set Fserve.1 ACCESS O } | elseif ($did($dname,502).state == 1) { w.set Fserve.1 ACCESS V } | else { w.set Fserve.1 ACCESS A } 
      if ($did($dname,505).state == 1) { w.set Fserve.2 ACCESS O } | elseif ($did($dname,506).state == 1) { w.set Fserve.2 ACCESS V } | else { w.set Fserve.2 ACCESS A }
      if ($did($dname,509).state == 1) { w.set Fserve.3 ACCESS O } | elseif ($did($dname,510).state == 1) { w.set Fserve.3 ACCESS V } | else { w.set Fserve.3 ACCESS A }
      if ($did($dname,513).state == 1) { w.set Fserve.4 ACCESS O } | elseif ($did($dname,514).state == 1) { w.set Fserve.4 ACCESS V } | else { w.set Fserve.4 ACCESS A }
      if ($did($dname,517).state == 1) { w.set Fserve.5 ACCESS O } | elseif ($did($dname,518).state == 1) { w.set Fserve.5 ACCESS V } | else { w.set Fserve.5 ACCESS A }

      if ($did($dname,200).state == 1) { w.set Fserve SearchCache On } | else { w.set Fserve SearchCache Off }
      if ($did($dname,202).state == 1) { w.set Fserve AutoCache On } | else { w.set Fserve AutoCache Off }
      if ($did($dname,925).state == 1) { w.set Fserve Verbose On } | else { w.set Fserve Verbose Off }
      if $did($dname,926).state == 1 { w.set Fserve AdBW On } | else { w.set Fserve AdBW Off }
      w.set Fserve CacheTime $did($dname,203).text
      if $r.set(Fserve,AutoCache) == On { .timerFSidx $+ $iNetwork 0 $calc($iif($r.set(Fserve,CacheTime) >= 1,$r.set(Fserve,CacheTime),60) * 60) FSautoindex }
      CleanTriggers
    }

    if ($did == 315) { if $?!="Are you sure you want to erase all Fserve Records?" == $true { c.rec | c.nickrec } }
    if ($did == 311) { dialog -i $dname | .timer -o 1 1 ShowFSRdir }
    if ($did == 312) { dialog -i $dname | .timer -o 1 1 ShowFSRNick }
    if ($did == 551) { did -ra $dname 72 $ascii($did($dname,72).text) }
    if ($did == 552) { did -ra $dname 92 $ascii($did($dname,92).text) }
    if ($did == 553) { did -ra $dname 112 $ascii($did($dname,112).text) }
    if ($did == 554) { did -ra $dname 132 $ascii($did($dname,132).text) }
    if ($did == 555) { did -ra $dname 152 $ascii($did($dname,152).text) }
    if ($did == 201) {
      if $chkFStriggers == $true {
        did -b $dname 201
        if $r.set(Fserve,DMC) != On { 
          var %FSDlgCT = 1
          while (%FSDlgCT <= 5) { 
            w.set Fserve SDirCount 5
            if $r.set(Fserve. [ $+ [ %FSDlgCT ] ] ,Status) != On { inc %FSDlgCT 1 | continue }
            write -c $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \FSdir [ $+ [ %FSDlgCT ] ] $chr(32)
            var %FSDlgFCT = 1
            var %RotateSym = 1
            var %FSDlgFTOT = $findfile($r.set(Fserve. [ $+ [ %FSdlgCT ] ] ,Root.Dir),*.*,0)
            while (%FSDlgFCT <= %FSDlgFTOT) {
              write $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \FSdir [ $+ [ %FSDlgCT ] ] $replace($findfile($r.set(Fserve. [ $+ [ %FSdlgCT ] ] ,Root.Dir),*.*,%FSDlgFCT),$chr(44),$chr(184),$chr(40),$chr(158),$chr(41),$chr(159))
              if %RotateSym == 5 { var %rotatesym = 1 }
              if %RotateSym == 4 { dialog -t InvisFserve Building Index %FSDlgCT $chr(92) | inc %rotatesym 1 }
              if %RotateSym == 3 { dialog -t InvisFserve Building Index %FSDlgCT $+ --- | inc %rotatesym 1 }
              if %RotateSym == 2 { dialog -t InvisFserve Building Index %FSDlgCT $chr(47) | inc %rotatesym 1 }
              if %RotateSym == 1 { dialog -t InvisFserve Building Index %FSDlgCT $chr(124) | inc %rotatesym 1 }
              inc %FSDlgFCT 1
              continue
            }
            inc %FSDlgCT 1
            continue
          }
          dialog -t InvisFserve Invision File Server Manager for $iif($iSetwork != $null,$iSetwork,Global)
          did -e InvisFserve 201
        }
        else {
          .timer -o 1 3 if $dialog(InvisFserve) != $!null { did -e InvisFserve 201 }
          if ($os != 95 && $os != 98) {
            if $r.set(Fserve.1,Status) == On { .timer -om 1 1 .run -n cmd /c " [ $left($r.set(Fserve.1,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.1,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir1 ] " }
            if $r.set(Fserve.2,Status) == On { .timer -om 1 200 .run -n cmd /c " [ $left($r.set(Fserve.2,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.2,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir2 ] " }
            if $r.set(Fserve.3,Status) == On { .timer -om 1 400 .run -n cmd /c " [ $left($r.set(Fserve.3,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.3,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir3 ] " }
            if $r.set(Fserve.4,Status) == On { .timer -om 1 600 .run -n cmd /c " [ $left($r.set(Fserve.4,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.4,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir4 ] " }
            if $r.set(Fserve.5,Status) == On { .timer -om 1 800 .run -n cmd /c " [ $left($r.set(Fserve.5,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.5,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir5 ] " }
          }
          else {
            if $r.set(Fserve.1,Status) == On { .run -n command /c [ $left($r.set(Fserve.1,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.1,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir1 ] }
            if $r.set(Fserve.2,Status) == On { .run -n command /c [ $left($r.set(Fserve.2,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.2,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir2 ] }
            if $r.set(Fserve.3,Status) == On { .run -n command /c [ $left($r.set(Fserve.3,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.3,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir3 ] }
            if $r.set(Fserve.4,Status) == On { .run -n command /c [ $left($r.set(Fserve.4,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.4,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir4 ] }
            if $r.set(Fserve.5,Status) == On { .run -n command /c [ $left($r.set(Fserve.5,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.5,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir5 ] }
          }

        }
      }
    }
    if ($did == 251) {
      if $exists($r.set(Fserve.1,Root.Dir)) && $r.set(Fserve.1,Status) == On {
        w.set Fserve.1 Root.Dir $did($dname,77).text
        if ($os != 95 && $os != 98) {
          .run -n cmd /c " [ $left($r.set(Fserve.1,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.1,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir1 ] "
        }
        else {
          .run -n command /c [ $left($r.set(Fserve.1,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.1,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir1 ] 
        }
      }
    }
    if ($did == 252) {
      if $exists($r.set(Fserve.2,Root.Dir)) && $r.set(Fserve.2,Status) == On {
        if ($os != 95 && $os != 98) {
          .run -n cmd /c " [ $left($r.set(Fserve.2,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.2,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir2 ] "
        }
        else {
          .run -n command /c [ $left($r.set(Fserve.2,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.2,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir2 ]
        }
      }
    }
    if ($did == 253) {
      if $exists($r.set(Fserve.3,Root.Dir)) && $r.set(Fserve.3,Status) == On {
        if ($os != 95 && $os != 98) {
          .run -n cmd /c " [ $left($r.set(Fserve.3,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.3,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir3 ] "
        }
        else {
          .run -n command /c [ $left($r.set(Fserve.3,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.3,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir3 ]
        }
      }
    }
    if ($did == 254) {
      if $exists($r.set(Fserve.4,Root.Dir)) && $r.set(Fserve.4,Status) == On {
        if ($os != 95 && $os != 98) {
          .run -n cmd /c " [ $left($r.set(Fserve.4,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.4,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir4 ] "
        }
        else {
          .run -n command /c [ $left($r.set(Fserve.4,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.4,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir4 ]
        }
      }
    }
    if ($did == 255) {
      if $exists($r.set(Fserve.5,Root.Dir)) && $r.set(Fserve.5,Status) == On {
        if ($os != 95 && $os != 98) {
          .run -n cmd /c " [ $left($r.set(Fserve.5,Root.Dir),2) ] && cd\ && cd [ $right($r.set(Fserve.5,Root.Dir),-2) ] && dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir5 ] "
        }
        else {
          .run -n command /c [ $left($r.set(Fserve.5,Root.Dir),2) ] $chr(124) cd\ $chr(124) cd [ $right($r.set(Fserve.5,Root.Dir),-2) ] $chr(124) dir /b /s > [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir5 ]
        }
      }
    }
    if $did == 202 && $r.set(Fserve,DMC) != On {
      if $did($dname,202).state == 1 { did -u $dname 202 | dopen DMCOK DMCOK }
    }
  }
}
Dialog DMCOK {
  title "Warning!"
  size -1 -1 100 60
  option dbu

  text "Before you can use this feature you need to enable ''Use Fast Index Builds'' and then manually build your indexes to make sure that method will work on your system. This option can be found on the Main Settings / Adv Tab", 1, 3 2 96 48, center
  button "Ok", 500,  35 49 30 10, ok

}
alias -l phelp {
  if ( $1 ) {
    noop $input($1-,io,Help Wizard)
    dialog -ve InvisFserve
  }
}

on *:Dialog:DMCOK:SCLICK:500:{ click | dialog -ev Invisfserve }
