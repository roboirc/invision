; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: idccmngr.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: DCC Manager Dialog
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
on ^*:text:*:#:{
  var %fulladdress = $fulladdress
  var %curNetwork = $iNetwork
  ; ##########################################################################
  ; ##
  ; ##               THE FSERVE SEARCH ROUTINES
  ; ##
  ; ##########################################################################
  if ($r.set(Fserve,Status) == On) {
    if ($1 == !Search  || $1 == @find || $1 == @locator) {
      if ($r.set(Fserve,Listen) == On) && ($r.set(Fserve,Search) == On) && ($r.set(Fserve,Pause) != On) {
        if (($r.set(Fserve,Channels) == all) || ($r.set(Fserve,Channels) == $null) || ($istok($r.set(Fserve,Channels),$chan,44))) {
          if (%searchFLag [ $+ [ %curNetwork ] ] != 1) && ($remove($2-,*) != $null) {
            if ($r.set(Fserve,SearchCache) != On) {
              .timer -o 1 12 unset %searchFLag [ $+ [ %curNetwork ] ]
              set %searchFLag [ $+ [ %curNetwork ] ] 1
              FsearchSTD 1 $nick $2-
              unset %fsfind*
            }
            else {
              .timer -o 1 12 unset %searchFLag [ $+ [ %curNetwork ] ]
              .set %searchFLag [ $+ [ %curNetwork ] ] 1
              FsearchCACHE 1 $nick $2-
            }
          }
        }
      }
    }
  }
  if ($istok($replace($rpunct($1-),$rpunct($me),$me),$me,32) == $true) {
    if ($left($strip($1,burc),1) != $chr(33)) {
      if (*serv*trig*send* !iswm $1-) {
        if (*record* !iswm $1-) {
          if ($r.set(Nick.Alert,Status) == On && !$istok($r.set(Away,Exceptions),$nick,44)) {
            if ($r.set(Nick.Alert,Tooltip) == On && $chan != $active) { noop $tip(NickAlert,Nick Alert from $nick in $iif($chan,$chan,PM),$1-,$null,$readini($mircini,files,trayicon),1,window -a $chan,$null) }
            if $away { NickAlert $c(1) $+ « $+ $c(2) $+ $nick $c(1) $+ in $+ $c(2) $chan $c(1) $+ at $+ $c(2) $time(h:nntt) $+ $c(1) $+ » $1- } 
            if ($r.set(Invision,SndOpt33) == On) && (($active != $chan) || ($appactive == $false)) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound36) } 
            if ($active != $chan) { echo -a $c(1) $+ « $+ $c(2) $+ $nick $c(1) $+ in $+ $c(2) $chan $c(1) $+ $iif($cts,at $+ $c(2) $cts $+ $c(1)) $+ » $Visufix($1-) }
          }
          if ($r.set(Invision,AwayAlert) == On) {
            if ($away == $true) && (%AwyAlertFlag [ $+ [ %curNetwork ] ] != 1) && !$istok($r.set(Away,Exceptions),$nick,44) { away.alert $chan | .timer -o 1 300 unset %AwyAlertFlag [ $+ [ %curNetwork ] ] | set %AwyAlertFlag [ $+ [ %curNetwork ] ] 1 }
          }
        }
      }
    }
  }
}
dialog DCCManager {
  title "Invision DCC Manager"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 300 271
  option dbu

  tab "Status", 1, 4 0 293 212
  ; tab "Get Tracker", 2 hide
  tab "Queues", 3
  tab "Bans", 4
  tab "Setup", 5

  ;#############################################################
  ;        STATUS TAB 1
  ;#############################################################

  text       "Sends", 25, 10 16 285 10, tab 1 center             ;label: "Sends" 
  button    "#", 11, 10 25 10 10, default tab 1             ;# user number
  button    "Nick", 12, 20 25 40 10, default tab 1          ;user nick
  button    "IP", 101, 60 25 50 10, default tab 1
  button "Network", 104, 110 25 47 10, default tab 1
  button    "File", 13, 157 25 90 10, default tab 1         ;downloding file
  button    "CPS", 14, 247 25 35 10, default tab 1         ;cps 
  button    "%",    22, 282 25 13 10, default tab 1         ;% button label 

  list        15, 10 35 10 48,  tab 1                              ;# list box for sends
  list        18, 20 35 40 48, tab 1                               ;nick list box for sends
  list       102, 60 35 50 48, tab 1
  list 105, 110 35 47 48, tab 1
  list        19, 157 35 90 48, tab 1                              ;file list box for sends
  list        20, 247 35 35 48, tab 1                              ;cps list box for sends
  list       21, 282 35 13 48, tab 1                               ;percent list box for sends 

  text     "Gets", 24, 10 78 285 7, tab 1 center                  ; label: "Gets" 
  list        26, 10 85 10 48, tab 1                               ; #list box for Gets 
  list        27, 20 85 40 48, tab 1                               ; nick list box for Gets
  list        103, 60 85 50 48, tab 1
  list        106, 110 85 47 48, tab 1
  list        28, 157 85 90 48, tab 1                              ;file list box for Gets 
  list        29, 247 85 35 48, tab 1                              ; cps list box for Gets
  list        30, 282 85 13 48, tab 1                              ; percent list box for Gets  

  ;text       "No transfers", 23,120 190 15 10, tab 1         ;displays the status (active or inavtive)
  text       "Active Sessions:" 32, 8 182 44 7, tab 1 right   ;label "fserve slots in use"
  list        31, 52 181 40 12, tab 1                                ;display the number of fserve slots in use
  text       "Bandwidth in use:", 16, 8 192 44 7, tab 1 right   ;label: Bandwidth in use
  list        17, 52 191 40 12, tab 1                               ;displays current bandwidth in use  
  text       "Minimum Speed:", 47, 8 202 44 7, tab1 right
  edit        "",46, 52 201 40 10, tab 1                           ;displays min cps
  ;check    "", 48, 145 190 10 10, tab 1                           ;enables/disables min cps

  text      "Queues:", 49, 94 192 45 7, tab 1 right                  ;label: Queues
  list         50, 140 191 50 12, tab1                               ;listbox -- queue
  text      "Channels Served:", 51, 94 182 45 7, tab 1 right          ;label Channel
  list       52, 140 181 50 12, tab 1                                ;list box number of users on first channel in list
  text      "Server Bandwidth:", 53, 94 202 45 7, tab 1 right
  list       54, 140 201 50 12, tab 1 

  text      "Next DCC speed limit", 55, 195 182 55 7, tab 1 right
  list       56, 251 181 45 12, tab 1                                 ; realmax
  text      "Insta-Send feature is", 57, 195 192 55 7, tab 1 right
  list       58, 251 191 45 12, tab 1                                ; insta-send status
  text      "CloneGuard feature is", 59, 195 202 55 7, tab 1 right
  list       60, 251 201 45 12, tab 1                                ; Flexspeed status

  text      "Status", 44, 10 128 285 8, tab 1 center     ;label "status window"
  list        43, 10 136 285 48, tab 1, hsbar                             ;status window

  ;#############################################################
  ; Queues Tab 3
  ;#############################################################

  text "Default Queue:", 200, 10 22 75 8, tab 3
  list 201, 10 30 80 115, tab 3 extsel

  button "Switch Queues", 400, 92 30 40 9, tab 3

  button "Send Selected Queue", 196, 10 149 80 10, tab 3
  button "Remove Selected", 202, 10 173 80 10, tab 3
  button "Remove All Queues", 211, 10 185 80 10, tab 3
  button "Add Queues", 212, 10 161 80 10, tab 3
  button "Move Selected to Top", 213, 10 197 80 10, tab 3

  text "System", 203, 100 96 185 8, tab 3 center
  edit "", 204, 100 104 185 10, autohs, tab 3 center
  text "Nickname", 205, 100 115 185 8, tab 3 center
  edit "", 206, 100 123 185 10, autohs, tab 3 center
  text "Address", 215, 100 134 185 8, tab 3 center
  edit "", 216, 100 142 185 10, autohs, tab 3 center
  text "Filename", 207, 100 153 185 8, tab 3 center
  edit "",209, 100 161 185 10, autohs, tab 3 center
  text "File Size", 234, 100 172 185 8, tab 3 center
  edit "",235, 100 180 185 10, autohs, tab 3 center
  text "Time Queued", 217, 100 191 185 8, tab 3 center
  edit "",218, 100 199 185 10, autohs, tab 3 center

  box "Move" ,197, 92 40 40 55 , tab 3 
  button "up" 199, 98 55 27 17,   tab 3 
  button "down" 198, 98 73 27 17,  tab 3 

  box " Options ", 701, 135 20 150 75, tab 3
  check "", 703, 140 30 8 8, tab 3
  text "Cloak Queue Holder Nicks" , 705, 149 31 120 8, tab 3

  ;#############################################################
  ;        Bans Tab 4
  ;#############################################################

  text "Ban List",300, 20 47 60 10, tab 4
  list 301, 20 35 130 160, tab 4
  button "Add", 302, 152 80 60 15, tab 4
  button "Remove", 303, 152 100 60 15, tab 4 
  button "Clear Ban List", 304, 152 120 60 15, tab 4


  ;#############################################################
  ;           SETUP Tab 5
  ;#############################################################

  text "* Note: Set CPS settings to 0 in order to impose no limit (no speed cap).", 979, 10 203 280 8, tab 5
  box "DCC Watch Channels:", 960, 175 20 120 138, tab 5
  combo 961, 195 30 80 100, tab 5
  check "All Channels I am on", 962, 195 145 60 10, tab 5
  button "Add", 963, 195 129 40 15, tab 5 
  button "Rem", 964, 236 129 40 15, tab 5

  box "Priority Queue Level", 801, 175 160 120 41, tab 5
  radio "Friends or Higher", 802, 180 168 60 10, tab 5 group
  radio "Fellow Ops or Higher", 803, 180 178 60 10, tab 5
  radio "Elite Only", 804, 180 188 60 10, tab 5
  radio "Voices or Higher", 805, 240 168 52 10, tab 5
  radio "Half-Ops or Higher", 806, 240 178 52 10, tab 5
  radio "Ops or Higher", 807, 240 188 52 10, tab 5

  check "Enable Requeuing on Failed Sends with Max Retries at", 947, 15 27 8 10, tab 5
  text "Enable Requeuing on Failed Sends with Max Retries at",1017, 24 28 130 9, tab 5
  edit "", 948, 155 26 16 10, tab 5 center autohs

  text "Minimum DCC Send Speed (in cps):", 971, 15 38 90 10, tab 5
  edit "", 972, 105 36 30 10, tab 5 center autohs
  text "Minimum CPS Check Delay (in sec):", 973, 15 48 90 10, tab 5
  edit "", 974, 105 46 30 10, tab 5 center autohs

  check "Enable Auto /dccallow (Dalnet)", 977, 15 55 8 10, tab 5
  text "Enable Auto /dccallow (Dalnet)", 1029, 24 56 90 9, tab 5
  check "Enable Priority Queue for friends/ops", 594, 15 65 8 10, tab 5
  text "Enable Priority Queue for friends/ops" ,  1001, 24 66 90 9, tab 5
  check "Enable Smart Sends", 700, 15 75 8 10, tab 5
  text "Enable Smart Sends", 1002, 24 76 90 9, tab 5
  check "Enable DCC Server Logging", 590, 15 85 8 10, tab 5
  text "Enable DCC Server Logging", 1003, 24 86 90 9, tab 5
  check "Isolate DCC Notices", 592, 15 95 8 10, tab 5
  check "Log DCC Notices", 1444, 80 96 50 9, tab 5
  check "Show Dots", 1744, 135 96 40 9, tab 5
  text "Isolate DCC Notices", 1004, 24 96 50 9, tab 5
  check "Enable DCC Watch", 593, 15 105 8 10, tab 5
  text "Enable DCC Watch", 1005, 24 106 90 9, tab 5
  check "Enable Daily DCC Limit", 601, 15 115 8 10, tab 5
  text "Enable Daily DCC Limit of", 1008, 24 116 60 9, tab 5
  edit "", 602, 85 114 50 10, tab 5 center
  text "bytes", 1007, 136 116 30 9, tab 5
  check "",603, 15 125 8 10, tab5
  text "Global Reverse DCC Init (for firewalls/routers) Port:", 1018, 24 126 124 9, tab 5
  ;  text  "Port:", 1221, 136 126 20 9, tab 5
  edit "", 1222, 148 125 25 10, tab 5 center autohs

  box " Global DCC Send Settings ", 501, 10 135 162 66, tab 5
  box "Packet Size", 502, 127 139 40 60, tab 5
  radio "512", 510, 135 147 30 10, tab 5 group
  radio "1024", 511, 135 157 30 10, tab 5
  radio "2048", 512, 135 167 30 10, tab 5
  radio "4096", 513, 135 177 30 10, tab 5
  radio "8192", 514, 135 187 21 10, tab 5

  check "", 521, 15 144 8 10, tab 5
  text "Enable PDCC", 520, 24 145 35 8, tab 5
  check "Enable FastSends", 522, 15 154 8 10, tab 5
  text "Enable FastSends", 1006, 24 155 50 9, tab 5
  text "DCC Per Send Bandwidth limit (cps)", 969, 15 165 85 10, tab 5
  edit "", 976, 99 163 25 10, tab 5 center autohs
  text "Total Server Bandwidth limit (cps)", 975, 15 175 85 10, tab 5
  edit "", 970, 99 173 25 10, tab 5 center autohs

  box " Active Help ", 401, 4 214 292 47
  edit "", 410, 8 222 284 37, multi autovs

  button "OK", 680, 85 262 40 9, Ok
  button "Cancel", 681, 130 262 40 9, Cancel
  button "Apply", 682, 175 262 40 9

}
on *:dialog:DCCManager:*:*:{
  if $devent == mouse { 
    .timer -om 1 500 DCCHELP $mouse.x $mouse.y
  }
  if ( $devent == dclick ) {
    if ( $did == 15 ) {
      var %kickedNick = $isend($did($dname,15).sel)
      close -s %kickedNick       
      did -i $dname 43 1 %kickedNick was kicked from the server
      unset %kickedNick
    }
  }
  ;#############################################################
  ;        SCLICK
  ;#############################################################
  if ( $devent == sclick ) {
    if ($did == 592) {
      if ($did($dname,592).state == 1) { did -e $dname 1444,1744 }
      else did -b $dname 1444,1744
    }
    if ($did == 196 ) {
      if ( $did(201).sel != $null ) { 
        if %Qview [ $+ [ $iNetwork ] ] == 2 {
          idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),2,32) " $+ $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ), 5- , 32 ) $+ "
          Pqueue.del $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35))
        } 
        else {
          idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),2,32) " $+ $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ), 5- , 32 ) $+ "
          queue.del $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35))
        }
      }
    }
    if ($did == 198 ) {  
      if %Qview [ $+ [ $iNetwork ] ] == 2 {    
        if ( $did(201).sel < $Pqueue(0) ) { Pqueue.swap.down $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35))  }
      }
      else {
        if ( $did(201).sel < $queue(0) ) { queue.swap.down $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35))  }
      }
    }
    if ($did == 199 ) { 
      if %Qview [ $+ [ $iNetwork ] ] == 2 {
        if ( $did(201).sel > 1 ) { Pqueue.swap.up $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) }
      }
      else {
        if ( $did(201).sel > 1 ) { queue.swap.up $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) }
      }
    }
    if $did == 400 { 
      if %Qview [ $+ [ $iNetwork ] ] == 1 {
        set %Qview [ $+ [ $iNetwork ] ] 2
        did -ra $dname 200 Priority Queues:
        Pqmu  
        did -fc $dname 201 1
        did -ra $dname 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),1,32))
        did -ra $dname 235 $bytes($file($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),5-,32)).size).suf
        did -ra $dname 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),2,32)  $chr(32) $chr(32) 
        did -ra $dname 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),5-,32)
        did -ra $dname 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),3,32)
        did -ra $dname 218 $asctime($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),4,32),dddd mmmm d - h:nntt) $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ) != $null, $duration($calc($ctime - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),4,32)),2) ago) $chr(93)
      }
      else {
        set %Qview [ $+ [ $iNetwork ] ] 1
        did -ra $dname 200 Default Queues:
        qmu  
        did -fc $dname 201 1
        did -ra $dname 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),1,32))
        did -ra $dname 235 $bytes($file($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),5-,32)).size).suf
        did -ra $dname 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),2,32)  $chr(32) $chr(32) 
        did -ra $dname 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),5-,32)
        did -ra $dname 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),3,32)
        did -ra $dname 218 $asctime($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),4,32),dddd mmmm d - h:nntt)  $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ) != $null, $duration($calc($ctime - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),4,32)),2) ago) $chr(93)

      }
    }
    if $did != 680 && $did != 682 { click }
    if ($did == 680) || ($did == 682) {
      setsaved
      if $did($dname,947).state == 1 { w.set DCCmgr Requeue On } | else { w.set DCCmgr Requeue Off }
      w.set DCCmgr RequeueCT $iif($isnum($did($dname,948).text),$did($dname,948).text,2)
      if ($did($dname,1222).text isnum) { w.glob DCCmgr ReversePort $did($dname,1222).text } | else { w.glob DCCmgr ReversePort 6060 }
      if $did($dname,603).state == 1 { w.glob DCCmgr DirectDCC On } | else { w.glob DCCmgr DirectDCC Off }
      if $did($dname,703).state == 1 { w.set DCCmgr CloakNicks On } | else { w.set DCCmgr CloakNicks Off }
      if $did($dname,977).state == 1 { w.set DCCmgr DCCallow On } | else { w.set DCCmgr DCCallow Off }
      w.glob Fserve Max.Serv.Bandwidth $vnum($did($dname,970).text,0)
      w.glob Fserve MaxBandEach $vnum($did($dname,976).text,0)
      w.set Min.CPS Delay $vnum($did($dname,974).text,10)
      w.set Min.CPS Rate $did($dname,972).text
      if ($did($dname,700).state == 1) { w.glob Fserve SmartSend On | .timerSSend $+ $iNetwork 0 60 queue.send } | else { w.glob Fserve SmartSend Off | .timerSSend $+ $iNetwork off }
      did -ra DCCManager 58 $r.set(Fserve,InstaSend.Status)
      did -ra DCCManager 60 $r.set(Fserve,FlexSpeed.Status)
      did -ra DCCManager 54 $ratefix($r.glob(Fserve,Max.Serv.Bandwidth))
      if ($did($dname,593).state == 1) { w.set DCC.Watch Status On } | else { w.set DCC.Watch Status Off }
      if ($did($dname,594).state == 1) { w.set DCCmgr SecondQ On } | else { w.set DCCmgr SecondQ Off }
      if ($did($dname,962).state == 1) || ($did($dname,961).lines == 0) { w.set DCC.Watch Channels All }
      else { dls $dname 961 w.set DCC.Watch Channels }
      if ($did($dname,592).state == 1) { w.set Fserve AlterWin On } | else { w.set Fserve AlterWin Off }
      if ($did($dname,1444).state == 1) { w.set Fserve LogWin On } | else { w.set Fserve Logwin Off }
      if ($did($dname,1744).state == 1) { w.set Fserve DotWin On } | else { w.set Fserve Dotwin Off }
      if ($did($dname,590).state == 1) { w.set Fserve Logging On } | else { w.set Fserve Logging Off }
      if ($did($dname,972).text == 0) || ($did($dname,972).text == $null) { w.set Min.CPS Status Off } | else { w.set Min.CPS Status On }
      w.set Min.CPS Rate $did($dname,972).text
      w.set Min.CPS Delay $did($dname,974).text
      if ($did($dname,510).state == 1) { w.glob Invision PacketSize 512 | .dcc packetsize 512 }
      elseif ($did($dname,511).state == 1) { w.glob Invision PacketSize 1024 | .dcc packetsize 1024 }
      elseif ($did($dname,513).state == 1) { w.glob Invision PacketSize 4096 | .dcc packetsize 4096 }
      elseif ($did($dname,514).state == 1) { w.glob Invision PacketSize 8192 | .dcc packetsize 8192 }
      else { w.glob Invision PacketSize 2048 | .dcc packetsize 2048 }
      if ($did($dname,522).state == 1) { w.glob Invision FSend On | .fsend on } | else { w.glob Invision FSend Off | .fsend off }
      if $did($dname,521).state == 1 { w.glob Invision PDCC On | .pdcc On } | else { w.glob Invision PDCC off | .pdcc off }
      ;   if $did($dname,524).text != $null && $did($dname,524).text isnum { w.glob Invision ALCF $did($dname,524).text } | else { w.glob Invision ALCF 1 }
      if $did($dname,802).state == 1 { w.set DCCmgr SQlevel 14 } | elseif $did($dname,803).state == 1 { w.set DCCmgr SQlevel 19 } | elseif $did($dname,804).state == 1 { w.set DCCmgr SQlevel 29 }
      if $did($dname,805).state == 1 { w.set DCCmgr SQlevel 39 } | elseif $did($dname,806).state == 1 { w.set DCCmgr SQlevel 49 } | elseif $did($dname,807).state == 1 { w.set DCCmgr SQlevel 59 }
      if $did($dname,601).state == 1 { w.set Fserve DCClimit On } | else { w.set Fserve DCClimit off }
      w.set Fserve Limit $did($dname,602).text
    }
    if ($did == 302) { 
      var %nicktoban = $input(Enter Nick of User to Ban $chr(90) $+ user must be currently online $+ $chr(91),65,Ban Who?)
      if $address(%nicktoban,5) != $null { adduser ban %nicktoban } | else { var %dum = $input(The user address could not be resolved and was not added. Make sure the user is online or use the User List Manager to manaully add an address to ban., 68, Failed to add user to list) }
      did -r $dname 301
      var %m = $ulist(*,7,0)
      var %c = 1
      while (%c <= %m) {
        did -a $dname 301 $ulist(*,7,%c) $gettok($ulist(*,7,%c).info,1,33)
        inc %c 1
        continue
      }
      dopen $dname $dname
    }
    if ($did == 303) && ($did($dname,301).sel isnum) { 
      .ruser $gettok($did($dname,301).seltext,1,32)
      did -d $dname 301 $did($dname,301).sel 
    }
    if ($did == 304) {
      .rlevel 7
      did -r $dname 301 0
    }
    if ($did == 962) { if ($did($dname,$did).state == 1) { did -b $dname 961,963,964 } | else { did -e $dname 961,963,964 } }
    if ($did == 963) && ($did($dname,961).sel == $null || $did($dname,961).sel == 0) && ($did($dname,961).text != $null) { did -a $dname 961 $vc($did($dname,961).text) | did -c $dname 961 $did($dname,961).lines }
    if ($did == 964) && ($did($dname,961).sel isnum) { did -d $dname 961 $did($dname,961).sel }
    if ($did == 980) { if ($did($dname,980).state == 1) { did -e $dname 978 } | else { did -b $dname 978 } } 
    if $did <= 5 && $did != 5 { did -r $dname 410 } 
    if ( $did == 3 ) { 
      /qmu  
      did -fc $dname 201 1
      did -ra $dname 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),1,32))
      did -ra $dname 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),2,32)  $chr(32) $chr(32) 
      did -ra $dname 235 $bytes($file($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),5-,32)).size).suf
      did -ra $dname 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),5-,32)
      did -ra $dname 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),3,32)
      did -ra $dname 218 $asctime($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),4,32),dddd mmmm d - h:nntt) $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ) != $null, $duration($calc($ctime - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),4,32)),2) ago) $chr(93)
    }
    if ($did == 45 ) { 
      clearFserveWindow
      did -r $dname 43
      if ( $r.set(Min.Cps,Status) == On ) { 
        did -ra $dname 46 $r.set(Min.Cps,Rate) 
      } 
      else { 
        did -o $dname 46 $r.set(Min.Cps,Status) 
      }      
    } 
    if ($did == 39  ) { 
      if ( $hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1) != $null ) {
        idcc send -c $+ $iif($r.glob(DCCmgr,SendBW) != 0,l) $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),2,32) " $+ $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue.1),5-,32) $+ "
        queue.del 1
      }
    }
    if ($did == 201) {
      if %Qview [ $+ [ $iNetwork ] ] == 2 {
        did -ra $dname 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),1,32))
        did -ra $dname 235 $bytes($file($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),5-,32)).size).suf
        did -ra $dname 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),2,32) $chr(32) $chr(32)
        did -ra $dname 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),5-,32)
        did -ra $dname 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),3,32)
        did -ra $dname 218 $asctime($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),4,32),dddd mmmm d - h:nntt) $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ) != $null, $duration($calc($ctime - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,PQueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),4,32)),2) ago) $chr(93)
      }
      else {
        did -ra $dname 204 $servname($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),1,32))
        did -ra $dname 235 $bytes($file($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),5-,32)).size).suf
        did -ra $dname 206 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),2,32) $chr(32) $chr(32)
        did -ra $dname 209 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),5-,32)
        did -ra $dname 216 $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),3,32)
        did -ra $dname 218 $asctime($gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),4,32),dddd mmmm d - h:nntt) $chr(91) $iif($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ) != $null, $duration($calc($ctime - $gettok($hget(Queues. [ $+ [ $iNetwork ] ] ,Queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] ),4,32)),2) ago) $chr(93)
      }
    }
    if ($did == 202) {
      if $did($dname,201,0).sel >= 1 {
        if %Qview [ $+ [ $iNetwork ] ] == 2 {
          if $did($dname,201,0).sel == 1 {
            Pqueue.del $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35))
          }
          else {
            var %tot = $did($dname,201,0).sel
            var %ct = %tot
            while (%ct >= 1) {
              var %dellist = $addtok(%dellist,$remove($gettok($did($dname,201,$did($dname,201,%ct).sel),1,32),$chr(35)),44)
              dec %ct 1
              continue
            }
            var %tot = $numtok(%dellist,44)
            var %ct = 1
            while (%ct <= %tot) {
              Pqueue.del $gettok(%dellist,%ct,44)
              inc %ct 1
              continue
            }
            Pqmu
          }
        } 
        else {
          if $did($dname,201,0).sel == 1 {
            queue.del $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35))
          }
          else {
            var %tot = $did($dname,201,0).sel
            var %ct = %tot
            while (%ct >= 1) {
              var %dellist = $addtok(%dellist,$remove($gettok($did($dname,201,$did($dname,201,%ct).sel),1,32),$chr(35)),44)
              dec %ct 1
              continue
            }
            var %tot = $numtok(%dellist,44)
            var %ct = 1
            while (%ct <= %tot) {
              queue.del $gettok(%dellist,%ct,44)
              inc %ct 1
              continue
            }
            qmu
          }
        }
      }
    }
    if ($did == 211) { 
      if $?!="Are you sure you want to delete all the queues?" { 
        if %Qview [ $+ [ $iNetwork ] ] == 2 {
          did -r $dname 201 | did -r $dname 204 | did -r $dname 206 | did -r $dname 209 | did -r $dname 235 | hdel -w Queues. [ $+ [ $iNetwork ] ] PQueue.*
        } 
        else {
          did -r $dname 201 | did -r $dname 204 | did -r $dname 206 | did -r $dname 209 | did -r $dname 235 | hdel -w Queues. [ $+ [ $iNetwork ] ] Queue.*
        }
        iSaveQueues
      }
      dopen DCCManager DCCManager
    } 
    if $did == 212 {
      var %dnick = $?="Who do you want to Queue Files for?" 
      dopen dccmanager dccmanager
      if %dnick != $null {
        set %DCCqnick [ $+ [ $iNetwork ] ] %dnick 
        set %SFDfunc [ $+ [ $iNetwork ] ] DCCqueue 
        dopen selfiles selfiles  
      }
    }
    if ($did == 213) {
      if $did($dname,201,0).sel >= 1 {
        if %Qview [ $+ [ $iNetwork ] ] == 2 {
          if $did($dname,201,0).sel == 1 {
            var %temp = $hget(Queues. [ $+ [ $iNetwork ] ] ,Pqueue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] )
            Pqueue.del $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35))
            Pqueue.Insert %temp
          }
          else {
            var %tot = $did($dname,201,0).sel
            var %ct = 1
            while (%ct <= %tot) {
              var %dellist = $addtok(%dellist,$remove($gettok($did($dname,201,$did($dname,201,%ct).sel),1,32),$chr(35)),44)
              inc %ct 1
              continue
            }
            var %tot = $numtok(%dellist,44)
            var %ct = 1
            while (%ct <= %tot) {
              var %temp = $hget(Queues. [ $+ [ $iNetwork ] ] ,Pqueue. [ $+ [ $gettok(%dellist,%ct,44) ] ] )
              Pqueue.del $gettok(%dellist,%ct,44)
              Pqueue.Insert %temp
              inc %ct 1
              continue
            }
            Pqmu
          }
        } 
        else {
          if $did($dname,201,0).sel == 1 {
            var %temp = $hget(Queues. [ $+ [ $iNetwork ] ] ,queue. [ $+ [ $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35)) ] ] )
            queue.del $remove($gettok($did($dname,201,$did($dname,201).sel),1,32),$chr(35))
            queue.Insert %temp
          }
          else {
            var %tot = $did($dname,201,0).sel
            var %ct = 1
            while (%ct <= %tot) {
              var %dellist = $addtok(%dellist,$remove($gettok($did($dname,201,$did($dname,201,%ct).sel),1,32),$chr(35)),44)
              inc %ct 1
              continue
            }
            var %tot = $numtok(%dellist,44)
            var %ct = 1
            while (%ct <= %tot) {
              var %temp = $hget(Queues. [ $+ [ $iNetwork ] ] ,queue. [ $+ [ $gettok(%dellist,%ct,44) ] ] )
              queue.del $gettok(%dellist,%ct,44)
              queue.Insert %temp
              inc %ct 1
              continue
            }
            qmu
          }
        }
      }
    }
  }
  if ( $devent == edit ) {
    if $did == 602 { if $did($dname,602).text isnum { did -ra $dname 1007 $chr(40) $+ $size($did($dname,602).text) $+ $chr(41) } }
    if ( $did == 46) { w.set Min.Cps Rate $did($dname, 46).text }
    if ( $did == 972 ) { did -ra DCCManager 46 $did($dname, 972).text }
    if ($did == 924) { did -ra DCCManager 50 $did(DCCManager, 201).lines $+ / $+ $did($dname, 924).text }
    if ($did == 970) { if ($did($dname,970).text == 0) || ($did($dname,970).text == $null) { did -u $dname 700 | did -b $dname 700 } | else { did -e $dname 700 } }
  }
  if ( $devent == init ) {   
    set %Qview [ $+ [ $iNetwork ] ] 1
    dialog -t $dname Invision DCC Manager for $iif($iNetwork != $null,$iNetwork,Global)
    if ( $did == 0 ) {
      if ($r.set(Fserve,LogWin) == On) { did -c $dname 1444 }
      if ($r.set(Fserve,DotWin) == On) { did -c $dname 1744 }
      if ( $gettok($r.set(Fserve,Channels),1,44) != All ) {
        did -ra DCCManager 52 $numtok($r.set(Fserve,Channels),44)
      }
      else {
        did -ra DCCManager 52 $chan(0)
      } 
      set %countSendsHold $send(0) 
      set %countGetsHold $get(0) 
      ;timerCheckForTransfers 0 1 checkForTransfers
      .timer -o 1 1 FservRefresh 

      ;show queues on main tab
      did -ra DCCManager 50 $queue(0) $+ / $+ $r.set(Fserve, Max.Queues.Total)   
      if ( $r.set(Min.Cps, Status) == On ) { 
        did -a $dname 46 $ratefix($r.set(Min.Cps,Rate))  
      } 
      else { 
        did -a $dname 46 $r.set(Min.Cps,Status)  
      } 
      var %m = $ulist(*,7,0)
      var %c = 1
      while (%c <= %m) {
        did -a $dname 301 $ulist(*,7,%c) $gettok($ulist(*,7,%c).info,1,33)
        inc %c 1
        continue
      }
      if $r.set(DCCmgr,Requeue) == On { did -c $dname 947 }
      did -ra $dname 948 $isset($r.set(DCCmgr,RequeueCT),2)
      if ($r.set(DCCmgr,CloakNicks) == On) { did -c $dname 703 }
      if ($r.set(Fserve,Logging) == On) { did -c $dname 590 }
      if ($r.set(Fserve,AlterWin) == On) { did -c $dname 592 }
      else did -b $dname 1444
      .timer -o 1 1 qmu 
      did -m $dname 204
      did -m $dname 206
      did -m $dname 209
      did -m $dname 235
      did -m $dname 216,218
      if ($r.glob(DCCmgr,ReversePort) isnum) { did -ra $dname 1222 $r.glob(DCCmgr,ReversePort) } | else { did -ra $dname 1222 6060 }
      if $r.glob(DCCmgr,DirectDCC) == On { did -c $dname 603 }
      did -a $dname 43  There are currently $isend(0) send(s) and $iget(0) get(s) in progress
      did -ra $dname 976 $vnum($r.glob(Fserve,MaxBandEach),0)
      did -ra $dname 970 $vnum($r.glob(Fserve,Max.Serv.Bandwidth),0)
      did -ra $dname 54 $ratefix($vnum($r.glob(Fserve,Max.Serv.Bandwidth),0))
      if ($r.glob(Fserve,SmartSend) == On) { did -c $dname 700 }
      did -ra $dname 972 $iif($r.set(Min.CPS,Rate) != $null,$r.set(Min.CPS,Rate),0)
      did -ra $dname 974 $vnum($r.set(Min.CPS,Delay),10)
      if ($did($dname,970).text == 0) || ($did($dname,970).text == $null) { did -u $dname 700 | did -b $dname 700 }
      if ($r.set(DCC.Watch,Status) == On) { did -c $dname 593 }
      if $r.set(DCCmgr,DCCallow) == On { did -c $dname 977 }
      if ($r.set(DCC.Watch,Channels) == All) || ($r.set(DCC.Watch,Channels) == $null) { did -c $dname 962 | did -b $dname 961,963,964 }
      else { dla $dname 961 $r.set(DCC.Watch,Channels) }
      if ($r.glob(Invision,PacketSize) == 512) { did -c $dname 510 }
      elseif ($r.glob(Invision,PacketSize) == 1024) { did -c $dname 511 }
      elseif ($r.glob(Invision,PacketSize) == 4096) { did -c $dname 513 }
      elseif ($r.glob(Invision,PacketSize) == 8192) { did -c $dname 514 }
      else { did -c $dname 512 }
      if $r.glob(Invision,PDCC) == On { did -c $dname 521 }
      if ($r.glob(Invision,FSend) == On) { did -c $dname 522 }
      if ($r.set(DCCmgr,SecondQ) == On) { did -c $dname 594 }
      if $r.set(DCCmgr,SQlevel) == 14 { did -c $dname 802 } | elseif $r.set(DCCmgr,SQlevel) == 19 { did -c $dname 803 } | elseif $r.set(DCCmgr,SQlevel) == 29 { did -c $dname 804 } | elseif $r.set(DCCmgr,SQlevel) == 39 { did -c $dname 805 } | elseif $r.set(DCCmgr,SQlevel) == 49 { did -c $dname 806 } | elseif $r.set(DCCmgr,SQlevel) == 59 { did -c $dname 807 }
      if $r.set(Fserve,DCClimit) == On { did -c $dname 601 }
      did -a $dname 602 $vnum($r.set(Fserve,Limit),800000000)
      if $did($dname,602).text isnum { did -ra $dname 1007 $chr(40) $+ $size($did($dname,602).text) $+ $chr(41) }
    }
  }
}
dialog NATcheck {
  title "Attention!"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 160 100
  option dbu

  text "The IP mIRC is using is apparently a NAT address. These address schemes are used only on local networks and are unusable on the Internet. You can continue to use this IP however you will most likely not be able to initiate DCC Chats or send DCC Files and even possibly not receive some DCC files when the sender is behind a firewall and needs to send via your DCC Server. Invision can ''try'' to correct this is if you wish right now.", 1, 10 1 140 55, center
  text "Do you want Invision to try and correct your IP address automatically?", 20, 10 65 140 18
  button "Yes", 500, 5 89 25 10, ok
  button "No", 510, 130 89 25 10, cancel
  button "Always Correct", 520, 31 89 48 10
  button "Never Correct", 530, 80 89 49 10
}
on *:dialog:NATcheck:*:*:{
  if ( $devent == sclick ) {
    if $did == 500 { /localinfo -u }
    if $did == 520 { /localinfo -u | w.set Invision CorrectNAT On | dialog -x NatCheck }
    if $did == 530 { w.set Invision CorrectNAT Never | dialog -x NatCheck } 
  }
}
alias -l phelp {
  if $1 != $null {
    var %dummy = $input($1-,64,Help Wizard)
    dialog -ve DCCmanager 
  }
}
dialog mp3Manager {
  title "Invision mp3 Server Manager"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 300 250
  option dbu

  button "OK", 680, 85 237 40 12, Ok
  button "Cancel", 681, 130 237 40 12, Cancel
  button "Apply", 682, 175 237 40 12

  box "mp3 Directories", 201, 5 1 190 138
  list 202, 10 9 180 120
  button "Build Index", 205, 17 124 40 12
  button "Add", 203, 59 124 40 12
  button "Remove", 204, 101 124 40 12
  button "Remove All", 206, 143 124 40 12

  box "mp3 Serving Channels:", 900, 200 1 95 138
  combo 901, 205 11 80 100
  check "All Channels I am on", 902, 205 126 60 10
  button "Add", 903, 205 110 40 15
  button "Rem", 904, 246 110 40 15

  check "Enable Auto Reindexing every", 305, 10 140 82 10
  edit "", 306, 92 139 15 10, center
  text "minutes", 307, 108 142 20 10
  check "CTCP trigger", 311, 82 170 45 10
  check "Show Ad on !list", 310, 82 180 50 10
  check "Enable !mp3Search", 301, 10 150 60 10
  check "Use !<nick> as trigger", 302, 10 160 65 10
  check "Enable CloneGuard", 303, 10 170 60 10
  check "Enable mp3 List Sends", 304, 10 180 65 10
  check "Use Verbose Ad", 601, 82 150 50 8
  check "Zip List file", 602, 82 160 50 8

  text "FileTypes:", 650, 140 142 25 8
  edit "", 651, 165 141 130 10, autohs center

  box "mp3 in Play Ad",1504,137 152 61 25
  check "", 1501, 140 159 8 9
  text "Enable Verbose Ad", 1500, 149 159 50 8
  check "", 1502, 140 167 8 9
  text "Graphical Progress", 1503, 149 168 50 8

  check "", 652, 140 177 8 10
  text "Put trigger in front of files in list", 1000, 149 178 50 18

  box "", 400, 200 150 95 40

  box "Max Sends", 401, 205 155 40 32
  text "Each:", 402, 200 165 25 8, right
  edit "", 403, 228 164 15 10, center
  text "Total:", 404, 200 175 25 8, right
  edit "", 405, 228 174 15 10, center

  box "Max Queues", 451, 250 155 40 32
  text "Each:", 452, 245 165 25 8, right
  edit "", 453, 273 164 15 10, center
  text "Total:", 454, 245 175 25 8, right
  edit "", 455, 273 174 15 10, center

  box "Advertisement", 500, 140 191 155 20
  check "Enable Ad Timer.  Delay:", 501, 145 199 68 10
  edit "", 502, 213 199 15 10, center
  check "Advertise what I play", 503, 233 199 65 10

  box "Custom Trigger", 700, 5 191 130 20
  text "Trigger:", 701, 10 200 18 10 
  edit "", 702, 28 199 70 10, autohs
  text "(NO SPACES)", 703, 99 200 35 10

  text "Optional Image URL for mp3 List:", 722, 5 216 80 8
  edit "", 723, 85 214 210 10
  text "MOTD:", 720, 5 226 20 8
  edit "",721, 25 224 270 10, autohs
}
on *:dialog:mp3Manager:*:*:{
  if ( $devent == edit ) {
    if ($did == 702) { did -e $dname 205 }
    if ($did == 723) { did -e $dname 205 }
  }
  if ( $devent == sclick ) {
    if ($did == 305) { if $did($dname,305).state == 1 { dopen UseIDXOK UseIDXOK } }
    if ($did == 311) { if $did($dname,311).state == 1 { did -b $dname 702 | did -b $dname 302 } | else { if $did($dname,302).state == 1 { did -e $dname 302 } | else { did -e $dname 302 | did -e $dname 702 } } } 
    if ($did == 302) { if $did($dname,302).state == 1 { did -b $dname 702 } | else { did -e $dname 702 } }
    if ($did == 203) {
      did -e $dname 205
      set %mp3DlgTMP [ $+ [ $iNetwork ] ] $r.set(mp3serv,DirCount)
      set %mp3DlgNewDir [ $+ [ $iNetwork ] ] $sdir(c:\,Choose an mp3 directory to add)
      if %mp3DlgNewDir [ $+ [ $iNetwork ] ] != $null {
        inc %mp3DlgTMP [ $+ [ $iNetwork ] ] 1
        w.set mp3serv LongDir [ $+ [ %mp3DlgTMP [ $+ [ $iNetwork ] ] ] ] %mp3DlgNewDir [ $+ [ $iNetwork ] ]
        w.set mp3serv DirCount %mp3DlgTMP [ $+ [ $iNetwork ] ]
        if ($r.set(mp3serv,DirCount) != $null) || ($r.set(mp3serv,DirCount) != 0) {
          did -r $dname 202
          var %mp3dlgCT = 1
          while (%mp3dlgCT <= $r.set(mp3serv,DirCount)) {
            did -a $dname 202 $r.set(mp3serv,LongDir [ $+ [ %mp3dlgCT ] ] )
            inc %mp3dlgCT 1
            continue
          }
        }
      }
    }
    if ($did == 204) {
      if $did($dname,202).sel != $null {
        did -e $dname 205
        var %mp3dlgsel = $did($dname,202).sel
        did -d $dname 202 %mp3dlgsel
        while (%mp3dlgsel <= $calc($r.set(mp3serv,DirCount) - 1)) {
          w.set mp3serv LongDir [ $+ [ %mp3dlgsel ] ] $r.set(mp3serv,LongDir [ $+ [ $calc(%mp3dlgsel + 1) ] ] )
          inc %mp3dlgsel 1
          continue
        }
        d.set mp3serv LongDir [ $+ [ $r.set(mp3serv,Dircount) ] ] 
        w.set mp3serv DirCount $calc($r.set(mp3serv,Dircount) - 1)
        if ($r.set(mp3serv,DirCount) != $null) || ($r.set(mp3serv,DirCount) != 0) {
          did -r $dname 202
          var %mp3dlgCT = 1
          while (%mp3dlgCT <= $r.set(mp3serv,DirCount)) {
            did -a $dname 202 $r.set(mp3serv,LongDir [ $+ [ %mp3dlgCT ] ] )
            inc %mp3dlgCT 1
            continue
          }
        }
      }
    }
    if ($did == 205) { mp3cachestart }
    if ($did == 206) {
      did -e $dname 205
      var %mp3dlgsel = 1
      while (%mp3dlgsel <= $r.set(mp3serv,DirCount)) {
        d.set mp3serv LongDir [ $+ [ %mp3dlgsel ] ] 
        inc %mp3dlgsel 1
        continue
      }
      w.set mp3serv DirCount 0
      did -r $dname 202
      var %mp3dlgCT = 1
      while (%mp3dlgCT <= $r.set(mp3serv,DirCount)) {
        did -a $dname 202 $r.set(mp3serv,LongDir [ $+ [ %mp3dlgCT ] ] )
        inc %mp3dlgCT 1
        continue
      }
    }
    if ($did == 302) { did -e $dname 205 } 
    if ($did == 311) { did -e $dname 205 } 
    if ($did == 902) { if ($did($dname,$did).state == 1) { did -b $dname 901,903,904 } | else { did -e $dname 901,903,904 } }
    if ($did == 903) && ($did($dname,901).sel == $null || $did($dname,901).sel == 0) && ($did($dname,901).text != $null) { did -a $dname 901 $vc($did($dname,901).text) | did -c $dname 901 $did($dname,901).lines } 
    if ($did == 904) && ($did($dname,901).sel isnum) { did -d $dname 901 $did($dname,901).sel }
    if $did != 680 && $did != 682 { click }
    if ($did == 680) || ($did == 682) {
      setsaved
      var %ftypes = $did($dname,651)
      if %ftypes == $null { w.set mp3serv FileTypes .mp3 }
      else {
        var %fct = 1
        unset %newftypes
        while (%fct <= $numtok(%ftypes,44)) {
          var %curtype = $gettok(%ftypes,%fct,44)
          if $left(%curtype,1) != . { var %curtype = . $+ %curtype }
          if $len(%curtype) != 4 { unset %curtype }
          if %curtype != $null { var %newftypes = $addtok(%newftypes,%curtype,44) }
          inc %fct 1
          continue
        }
        if %newftypes != $null { w.set mp3serv FileTypes %newftypes }
        else { w.set mp3serv FileTypes .mp3 }
      }
      if ($did($dname,902).state == 1) || ($did($dname,901).lines == 0) { w.set mp3serv Channels All }
      else { dls $dname 901 w.set mp3serv Channels }
      if ($did($dname,1501).state == 1) { w.set mp3serv VerboseAdDisplay On } | else { w.set mp3serv VerboseAdDisplay Off }
      if ($did($dname,1502).state == 1) { w.set mp3serv GraphicalProgress On } | else { w.set mp3serv GraphicalProgress Off  }
      if ($did($dname,652).state == 1) { w.set mp3serv triginlist On } | else { w.set mp3serv triginlist Off }
      if ($did($dname,301).state == 1) { w.set mp3serv mp3search On } | else { w.set mp3serv mp3search Off }
      if ($did($dname,302).state == 1) { w.set mp3serv UseNickTrigger On } | else { w.set mp3serv UseNickTrigger  Off }
      if ($did($dname,303).state == 1) { w.set mp3serv CloneGuard On } | else { w.set mp3serv CloneGuard Off }
      if ($did($dname,304).state == 1) { w.set mp3serv SendList On } | else { w.set mp3serv SendList Off }
      if ($did($dname,305).state == 1) { w.set mp3serv AutoIndex On } | else { w.set mp3serv AutoIndex Off }
      if ($did($dname,501).state == 1) { w.set mp3serv AdTimer On } | else { w.set mp3serv AdTimer Off }
      if ($did($dname,503).state == 1) { w.set mp3serv AdPlay On } | else { w.set mp3serv AdPlay Off }
      if ($did($dname,310).state == 1) { w.set mp3serv List On } | else { w.set mp3serv List Off }
      if ($did($dname,311).state == 1) { w.set mp3serv CTCP On } | else { w.set mp3serv CTCP Off }
      if ($did($dname,601).state == 1) { w.set mp3serv VerboseAd On } | else { w.set mp3serv VerboseAd Off }
      if ($did($dname,602).state == 1) { w.set mp3serv ZipList On } | else { w.set mp3serv ZipList Off }
      w.set mp3serv AdDelay $did($dname,502).text
      iw.set mp3serv Trigger $remove($replace($did($dname,702).text,$chr(32),_),$chr(44),$chr(40),$chr(41),$chr(123),$chr(125),$chr(91),$chr(93))
      w.set mp3serv Max.Sends.Each $did($dname,403).text
      w.set mp3serv Max.Sends.Total $did($dname,405).text
      w.set mp3serv Max.Queues.Each $did($dname,453).text
      w.set mp3serv Max.Queues.Total $did($dname,455).text
      if $did($dname,721).text != $null { iw.set mp3serv MOTD $did($dname,721).text } | else { d.set mp3serv MOTD }
      if $did($dname,723).text != $null { w.set mp3serv ListImage $did($dname,723).text } | else { d.set mp3serv ListImage }
      w.set mp3serv IndexTime $did($dname,306).text
      if $r.set(mp3serv,AutoIndex) == On { .timermp3Idx $+ $iNetwork 0 $calc($iif($r.set(mp3serv,Indextime) >= 1,$r.set(mp3serv,Indextime),60) * 60) mp3cachestart }
    }
  }
  if ( $devent == init ) { 
    .timermp3Idx $+ $iNetwork off
    dialog -t $dname Invision mp3 Server Manager for $iif($iSetwork != $null,$iSetwork,Global)
    did -a $dname 651 $isset($r.set(mp3serv,FileTypes),.mp3)
    if $r.set(mp3serv,VerboseAdDisplay) == On { did -c $dname 1501 }
    if $r.set(mp3serv,GraphicalProgress) != Off { did -c $dname 1502 }
    if $r.set(mp3serv,triginlist) == On { did -c $dname 652 }
    if $r.set(mp3serv,mp3search) == On { did -c $dname 301 }
    if $r.set(mp3serv,UseNickTrigger) == On { did -c $dname 302 }
    if $r.set(mp3serv,CloneGuard ) == On { did -c $dname 303 }
    if $r.set(mp3serv,SendList) == On { did -c $dname 304 }
    if $r.set(mp3serv,AutoIndex) == On { did -c $dname 305 }
    if $r.set(mp3serv,AdTimer) == On { did -c $dname 501 }
    if $r.set(mp3serv,AdPlay) == On { did -c $dname 503 }
    if $r.set(mp3serv,List) == On { did -c $dname 310 }
    if $r.set(mp3serv,CTCP) == On { did -c $dname 311 }
    if $r.set(mp3serv,VerboseAd) == On { did -c $dname 601 }
    if $r.set(mp3serv,ZipList) == On { did -c $dname 602 }
    did -a $dname 403 $vnum($r.set(mp3serv,Max.Sends.Each),1)
    did -a $dname 405 $vnum($r.set(mp3serv,Max.Sends.Total),1)
    did -a $dname 453 $vnum($r.set(mp3serv,Max.Queues.Each),3)
    did -a $dname 455 $vnum($r.set(mp3serv,Max.Queues.Total),10)
    did -a $dname 502 $vnum($r.set(mp3serv,AdDelay),30)
    did -a $dname 702 $r.set(mp3serv,Trigger)
    did -a $dname 721 $r.set(mp3serv,MOTD)
    did -a $dname 723 $r.set(mp3serv,ListImage)
    did -a $dname 306 $r.set(mp3serv,IndexTime)
    if ($r.set(mp3serv,Channels) == All) || ($r.set(mp3serv,Channels) == $null) { did -c $dname 902 | did -b $dname 901,903,904 }
    else { dla $dname 901 $r.set(mp3serv,Channels) }
    if $did($dname,302).state == 1 { did -b $dname 702 }
    if $did($dname,311).state == 1 { did -b $dname 302,702 }
    if ($r.set(mp3serv,DirCount) != $null) || ($r.set(mp3serv,DirCount) != 0) {
      var %mp3dlgCT = 1
      while (%mp3dlgCT <= $r.set(mp3serv,DirCount)) {
        did -a $dname 202 $r.set(mp3serv,LongDir [ $+ [ %mp3dlgCT ] ] )
        inc %mp3dlgCT 1
        continue
      }
    }
  }
}
Dialog UseIDXOK {
  title "Warning!"
  size -1 -1 100 60
  option dbu

  text "Please be aware that if you offer a large number of files that auto reindexing could cause you to ping out when it comes time to reindex. Test how long it takes you to reindex manually. Most servers will allow at least 120 seconds before disconnecting you.", 1, 3 2 96 48, center
  button "Ok", 500,  35 49 30 10, ok

}
on *:Dialog:UseIDXOK:SCLICK:500:{ dialog -ev mp3Manager }
menu @mp3_control { 
  sclick:{ 
    if $mouse.x > 5 && $mouse.x < 85 {
      if $mouse.y > 1 && $mouse.y < 11 {
        if $mouse.x < 15 { mp3playstop }
        if $mouse.x > 16 && $mouse.x < 35 { mp3playback }
        if $mouse.x > 41 && $mouse.x < 51 { if $mouse.key == 3 { mp3playplayDIR } | else { mp3playplaySEL } }
        if $mouse.x > 55 && $mouse.x < 69 { mp3playnext }
        if $mouse.x > 75 { mp3playpause }
      }
      if $mouse.y > 13 && $mouse.y < 23 {
        mp3reversetime
      }
    }

    showmirc -s
  }
  dclick:{ 
    if $mouse.x > 5 && $mouse.x < 85 {
      if $mouse.y > 1 && $mouse.y < 11 {
        if $mouse.x > 41 && $mouse.x < 51 { mp3playplaySEL }
      }
    }
  }

  ; rclick:{ if $mouse.key == 3 { teststop } }
  lbclick:/echo mouse selected $active $1
}
alias ign { return }
alias load-input-plugin { if (linein isin $1-) { return } | else { dll invision\winamp\amp_in.dll PluginManager load input $1- } }
alias load-all-inputs { var %dummy = $findfile( [ $r.glob(Invision,WinampDir) ] ,in_*.dll,0,1,load-input-plugin $1-) }
alias load-waveout { dll invision\winamp\amp_in.dll PluginManager load output [ [ $r.glob(Invision,WinampDir) ] [ $+ [ out_wave.dll ] ] ] }
alias play-queue dll invision\winamp\amp_in.dll Play <QUEUE>
alias play-wa-file dll invision\winamp\amp_in.dll Play $remove($1-,")

dialog DCCSpeedWindow {
  title "DCC"
  size 805 23 55 10
  option dbu

  text "",1,1 1 25 9
  text "/",2,27 1 5 9
  text "",3,30 1 24 9,right
}

on *:dialog:DCCSpeedWindow:close:*: { w.glob DCCmgr DCCSpeedMonitor Off }

alias DCCSpeedWindow {
  .timerspeedwindow 0 1 updatespeedwindow
}

alias updatespeedwindow {
  ;if ($r.glob(DCCmgr,DCCSpeedMonitor) == On) {
  ;  if (!$dialog(DCCSpeedWindow)) { dialog -m DCCSpeedWindow DCCSpeedWindow }
  ;  if ($dialog(DCCSpeedWindow).active == $true) { showmirc -s }
  ;}
  ;elseif ($dialog(DCCSpeedWindow)) { dialog -x DCCSpeedWindow }
  unset %i.sendspeed
  unset %i.getspeed
  set %i.totalsends $send(0)
  set %i.sends.cnt 1
  while (%i.sends.cnt <= %i.totalsends) {
    if ($send(%i.sends.cnt).done != $true && $send(%i.sends.cnt).status != failed) { set %i.sendspeed $calc(%i.sendspeed + $send(%i.sends.cnt).cps) }
    inc %i.sends.cnt
  }
  set %i.totalgets $get(0)
  set %i.gets.cnt 1
  while (%i.gets.cnt <= %i.totalgets) {
    if ($get(%i.gets.cnt).done != $true && $get(%i.gets.cnt).status != failed) { set %i.getspeed $calc(%i.getspeed + $get(%i.gets.cnt).cps) }
    inc %i.gets.cnt
  }
  if (%i.sendspeed == $null) { set %i.sendspeed 0 }
  if (%i.getspeed == $null) { set %i.getspeed 0 }
  if ((%i.sendspeed > $r.glob(DCCMgr,i.recordsendspeed) || $r.glob(DCCMgr,i.recordsendspeed) == $null)) { w.glob DCCMgr i.recordsendspeed %i.sendspeed }
  if ((%i.getspeed > $r.glob(DCCMgr,i.recordgetspeed) || $r.glob(DCCMgr,i.recordgetspeed) == $null)) { w.glob DCCMgr i.recordgetspeed %i.getspeed }
  if ($r.glob(DCCmgr,DCCSpeedMonitor) == On) {
    ;did -a DCCSpeedWindow 1 $bytes(%i.sendspeed).suf
    ;did -a DCCSpeedWindow 3 $bytes(%i.getspeed).suf
    ;var %totalspeed = $round($calc(%i.sendspeed + %i.getspeed),0)
    ;dialog -t DCCSpeedWindow $round($bytes(%totalspeed),0) $+ $iif($right($bytes(%totalspeed).suf,2) isalpha,$v1,$right($bytes(%totalspeed).suf,1))
    ;dialog -s DCCSpeedWindow $calc($window(-2).w - 235 + $window(-2).x) $calc($window(-2).y + 23)  110 20
  }
}

on ^*:HOTLINK:*Open*:@DCC_Info:{
  if (Successfully Received !isin $hotline) { halt }
  if ($strip($1) == {Open) return
  halt
}

on ^*:HOTLINK:*File}*:@DCC_Info:{
  if (Successfully Received !isin $hotline) { halt }
  if ($strip($1) == File}) return
  halt
}

on ^*:HOTLINK:*Location}*:@DCC_Info:{
  if (Successfully Received !isin $hotline) { halt }
  if ($strip($1) == Location}) return
  halt
}

on *:HOTLINK:*:*:{
  var %i.hotline = $gettok($hotline,1,171)
  var %file = $strip($gettok(%i.hotline,$calc($findtok(%i.hotline,Received,32) + 1) $+ -,32))
  var %dir = $getdir(*. $+ $gettok(%file,$numtok(%file,46),46))
  if ($1 == {Open) {
    var %i.open.short = $gettok($hotline,$calc($gettok($hotlinepos,1,32) + 1),32)
  }
  if (File} isin %i.open.short || $1 == File}) {
    if ($exists(%dir $+ %file)) {
      if ($r.glob(Fserve,OpenFileWarning) != Off && $?!="WARNING: Opening unknown files can be dangerous. Are you sure you want to open the file?" == $false) { halt }
      run %dir $+ %file
    }
    else { ERROR Can't open the file.  It either no longer exists, or is not in %dir $+ . }
  }
  elseif (Location} isin %i.open.short || $1 == Location}) {
    if ($exists(%dir)) { run %dir }
    else { ERROR %dir doesn't exist. }
  }
}
