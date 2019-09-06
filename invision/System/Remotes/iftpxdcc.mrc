; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: iftpdlg.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: FTP Ad Manager Dialog Tables and Routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
Dialog PopError {
  title "ERROR"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 181 100
  text "E R R O R:", 1, 62 8 55 13
  text "", 2, 5 25 171 60
  button "OK", 200, 43 70 92 25, ok
}
on *:dialog:PoPError:*:*:{
  if ($devent == init) {
    did -ra $dname 2 %error
  }
}
dialog FTP_Setup {
  title "FTP Ad Manager"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 213 157
  option dbu

  tab "Ad 1", 1, 3 5 207 130
  tab "Ad 2", 2
  tab "Ad 3", 3
  tab "Ad 4", 4
  tab "Ad 5", 5
  tab "Help", 6


  box "", 160, 5 19 203 113, tab 6
  text "The ''Allow CTCP from'' section is so you can allow those groups checked to retrieve your FTP Ad 1 info via a /ctcp FTPinfo command. The info is sent only to the requestor, not the channel. This is great if you want the info to be available to say the OPs of your channel but not the entire channel for example." 161, 10 25 180 65, tab 6


  box "", 10, 5 19 203 113, tab 1
  text "Address:", 12, 12 30 25 7, tab 1
  edit "", 13, 37 28 80 11, autohs, tab 1
  text "Port:", 14, 120 30 13 7, tab 1
  edit "", 15, 133 28 17 11, autohs, tab 1
  text "Login:", 16, 12 41 25 7, tab 1
  edit "", 17, 37 39 50 11, autohs, tab 1
  text "Password:", 18, 12 52 25 7, tab 1
  edit "", 19, 37 50 50 11, autohs, tab 1
  text "Ad Delay (min):", 20, 100 41 38 7, tab 1
  edit "", 21, 138 39 12 11, autohs, tab 1
  text "Users (max):", 22, 100 52 37 7, tab 1
  edit "", 23, 138 50 12 11, autohs, tab 1
  text "Advertising Channels:", 24, 12 65 60 7, tab 1
  combo 25, 11 73 65 45, tab 1
  button "Add", 26, 80 88 15 12, tab 1
  button "Rem", 27, 80 100 15 12, tab 1
  check "Answer !list", 35, 100 75 40 8, tab 1
  check "All Channel", 28, 100 92 40 7, tab 1
  check "Auto Start", 29, 100 100 40 7, tab 1
  text "Speed:", 30, 105 63 20 7, tab 1
  edit "", 31, 125 61 25 11, autohs, tab 1
  text "Note:", 32, 12 117 13 7, tab 1
  edit "", 33, 25 115 180 11, autohs, tab 1
  ;button "Open Viewer", 34, 90 67 50 15, tab 1
  box "Allow CTCP from", 34, 153 24 52 48, tab 1
  check "@ps", 311, 156 31 40 10, tab 1
  check "Friends List", 312, 156 51 40 10, tab 1
  check "Voiced", 313, 156 41 40 10, tab 1
  check "Everyone", 314, 156 61 40 10, tab 1

  box "", 40, 5 19 203 113, tab 2
  text "Address:", 41, 12 30 25 7, tab 2
  edit "", 42, 37 28 80 11, autohs, tab 2
  text "Port:", 43, 120 30 25 7, tab 2
  edit "", 44, 133 28 17 11, autohs, tab 2
  text "Login:", 45, 12 41 25 7, tab 2
  edit "", 46, 37 39 50 11, autohs, tab 2
  text "Password:", 47, 12 52 25 7, tab 2
  edit "", 48, 37 50 50 11, autohs, tab 2
  text "Ad Delay (min):", 49, 100 41 40 7, tab 2
  edit "", 50, 138 39 12 11, autohs, tab 2
  text "Users (max):", 51, 100 52 37 7, tab 2
  edit "", 52, 138 50 12 11, autohs, tab 2
  text "Advertising Channels:", 53, 12 65 60 7, tab 2
  combo 54, 11 73 65 45, tab 2
  button "Add", 55, 80 88 15 12, tab 2
  button "Rem", 56, 80 100 15 12, tab 2
  check "Answer !list", 36, 100 75 40 8, tab 2
  check "All Channel", 57, 100 92 40 7, tab 2
  check "Auto Start", 58, 100 100 40 7, tab 2
  text "Speed:", 59, 105 63 25 7, tab 2
  edit "", 60, 125 61 25 11, autohs, tab 2
  text "Note:", 61, 12 117 25 7, tab 2
  edit "", 62, 25 115 180 11, autohs, tab 2
  ;button "Open Viewer", 63, 90 67 50 15, tab 2
  box "Allow CTCP from", 63, 153 24 52 48, tab 2
  check "@ps", 321, 156 31 40 10, tab 2
  check "Friends List", 322, 156 51 40 10, tab 2
  check "Voiced", 323, 156 41 40 10, tab 2
  check "Everyone", 324, 156 61 40 10, tab 2

  box "", 70, 5 19 203 113, tab 3
  text "Address:", 71, 12 30 25 7, tab 3
  edit "", 72, 37 28 80 11, autohs, tab 3
  text "Port:", 73, 120 30 25 7, tab 3
  edit "", 74, 133 28 17 11, autohs, tab 3
  text "Login:", 75, 12 41 25 7, tab 3
  edit "", 76, 37 39 50 11, autohs, tab 3
  text "Password:", 77, 12 52 25 7, tab 3
  edit "", 78, 37 50 50 11, autohs, tab 3
  text "Ad Delay (min):", 79, 100 41 40 7, tab 3
  edit "", 80, 138 39 12 11, autohs, tab 3
  text "Users (max):", 81, 100 52 37 7, tab 3
  edit "", 82, 138 50 12 11, autohs, tab 3
  text "Advertising Channels:", 83, 12 65 60 7, tab 3
  combo 84, 11 73 65 45, tab 3
  button "Add", 85, 80 88 15 12, tab 3
  button "Rem", 86, 80 100 15 12, tab 3
  check "Answer !list", 37, 100 75 40 8, tab 3
  check "All Channel", 87, 100 92 40 7, tab 3
  check "Auto Start", 88, 100 100 40 7, tab 3
  text "Speed:", 89, 105 63 25 7, tab 3
  edit "", 90, 125 61 25 11, autohs, tab 3
  text "Note:", 91, 12 117 25 7, tab 3
  edit "", 92, 25 115 180 11, autohs, tab 3
  ;button "Open Viewer", 93, 90 67 50 15, tab 3
  box "Allow CTCP from", 93, 153 24 52 48, tab 3
  check "@ps", 331, 156 31 40 10, tab 3
  check "Friends List", 332, 156 51 40 10, tab 3
  check "Voiced", 333, 156 41 40 10, tab 3
  check "Everyone", 334, 156 61 40 10, tab 3

  box "", 100, 5 19 203 113, tab 4
  text "Address:", 101, 12 30 25 7, tab 4
  edit "", 102, 37 28 80 11, autohs, tab 4
  text "Port:", 103, 120 30 25 7, tab 4
  edit "", 104, 133 28 17 11, autohs, tab 4
  text "Login:", 105, 12 41 25 7, tab 4
  edit "", 106, 37 39 50 11, autohs, tab 4
  text "Password:", 107, 12 52 25 7, tab 4
  edit "", 108, 37 50 50 11, autohs, tab 4
  text "Ad Delay (min):", 109, 100 41 40 7, tab 4
  edit "", 110, 138 39 12 11, autohs, tab 4
  text "Users (max):", 111, 100 52 37 7, tab 4
  edit "", 112, 138 50 12 11, autohs, tab 4
  text "Advertising Channels:", 113, 12 65 60 7, tab 4
  combo 114, 11 73 65 45, tab 4
  button "Add", 115, 80 88 15 12, tab 4
  button "Rem", 116, 80 100 15 12, tab 4
  check "Answer !list", 38, 100 75 40 8, tab 4
  check "All Channel", 117, 100 92 40 7, tab 4
  check "Auto Start", 118, 100 100 40 7, tab 4
  text "Speed:", 119, 105 63 25 7, tab 4
  edit "", 120, 125 61 25 11, autohs, tab 4
  text "Note:", 121, 12 117 25 7, tab 4
  edit "", 122, 25 115 180 11, autohs, tab 4
  ;button "Open Viewer", 123, 90 67 50 15, tab 4
  box "Allow CTCP from", 123, 153 24 52 48, tab 4
  check "@ps", 341, 156 31 40 10, tab 4
  check "Friends List", 342, 156 51 40 10, tab 4
  check "Voiced", 343, 156 41 40 10, tab 4
  check "Everyone", 344, 156 61 40 10, tab 4

  box "", 130, 5 19 203 113, tab 5
  text "Address:", 131, 12 30 25 7, tab 5
  edit "", 132, 37 28 80 11, autohs, tab 5
  text "Port:", 133, 120 30 25 7, tab 5
  edit "", 134, 133 28 17 11, autohs, tab 5
  text "Login:", 135, 12 41 25 7, tab 5
  edit "", 136, 37 39 50 11, autohs, tab 5
  text "Password:", 137, 12 52 25 7, tab 5
  edit "", 138, 37 50 50 11, autohs, tab 5
  text "Ad Delay (min):", 139, 100 41 40 7, tab 5
  edit "", 140, 138 39 12 11, autohs, tab 5
  text "Users (max):", 141, 100 52 37 7, tab 5
  edit "", 142, 138 50 12 11, autohs, tab 5
  text "Advertising Channels:", 143, 12 65 60 7, tab 5
  combo 144, 11 73 65 45, tab 5
  button "Add", 145, 80 88 15 12, tab 5
  button "Rem", 146, 80 100 15 12, tab 5
  check "Answer !list", 39, 100 75 40 8, tab 5
  check "All Channel", 147, 100 92 40 7, tab 5
  check "Auto Start", 148, 100 100 40 7, tab 5
  text "Speed:", 149, 105 63 25 7, tab 5
  edit "", 150, 125 61 25 11, autohs, tab 5
  text "Note:", 151, 12 117 25 7, tab 5
  edit "", 152, 25 115 180 11, autohs, tab 5
  ;button "Open Viewer", 153, 90 67 50 15, tab 5
  box "Allow CTCP from", 153, 153 24 52 48, tab 5
  check "@ps", 351, 156 31 40 10, tab 5
  check "Friends List", 352, 156 51 40 10, tab 5
  check "Voiced", 353, 156 41 40 10, tab 5
  check "Everyone", 354, 156 61 40 10, tab 5

  button "OK", 200, 45 137 40 15, ok
  button "Cancel", 201, 87 137 40 15, cancel
  button "Apply", 202, 129 137 40 15
}
on *:dialog:FTP_Setup:*:*:{
  if ($devent == init) {
    dialog -t $dname FTP Ad Manager for $iif($iSetwork != $null,$iSetwork,Global)
    if $r.set(FTP.1,List) == On { did -c $dname 35 }
    if $r.set(FTP.2,List) == On { did -c $dname 36 }
    if $r.set(FTP.3,List) == On { did -c $dname 37 }
    if $r.set(FTP.4,List) == On { did -c $dname 38 }
    if $r.set(FTP.5,List) == On { did -c $dname 39 }
    if ($r.set(FTP.1,Address) == $null) { did -ra $dname 13 $ip }
    elseif ($r.set(FTP.1,Address) != $null) { did -ra $dname 13 $r.set(FTP.1,Address) }
    if ($r.set(FTP.2,Address) == $null) { did -ra $dname 42 $ip }
    elseif ($r.set(FTP.2,Address) != $null) { did -ra $dname 42 $r.set(FTP.2,Address) }
    if ($r.set(FTP.3,Address) == $null) { did -ra $dname 72 $ip }
    elseif ($r.set(FTP.3,Address) != $null) { did -ra $dname 72 $r.set(FTP.3,Address) }
    if ($r.set(FTP.4,Address) == $null) { did -ra $dname 102 $ip }
    elseif ($r.set(FTP.4,Address) != $null) { did -ra $dname 102 $r.set(FTP.4,Address) }
    if ($r.set(FTP.5,Address) == $null) { did -ra $dname 132 $ip }
    elseif ($r.set(FTP.5,Address) != $null) { did -ra $dname 132 $r.set(FTP.5,Address) }
    did -ra $dname 15 $r.set(FTP.1,Port)
    did -ra $dname 44 $r.set(FTP.2,Port)
    did -ra $dname 74 $r.set(FTP.3,Port)
    did -ra $dname 104 $r.set(FTP.4,Port)
    did -ra $dname 134 $r.set(FTP.5,Port)
    did -ra $dname 17 $r.set(FTP.1,Login)
    did -ra $dname 46 $r.set(FTP.2,Login)
    did -ra $dname 76 $r.set(FTP.3,Login)
    did -ra $dname 106 $r.set(FTP.4,Login)
    did -ra $dname 136 $r.set(FTP.5,Login)
    did -ra $dname 19 $r.set(FTP.1,Password)
    did -ra $dname 48 $r.set(FTP.2,Password)
    did -ra $dname 78 $r.set(FTP.3,Password)
    did -ra $dname 108 $r.set(FTP.4,Password)
    did -ra $dname 138 $r.set(FTP.5,Password)
    did -ra $dname 31 $r.set(FTP.1,Speed)
    did -ra $dname 60 $r.set(FTP.2,Speed)
    did -ra $dname 90 $r.set(FTP.3,Speed)
    did -ra $dname 120 $r.set(FTP.4,Speed)
    did -ra $dname 150 $r.set(FTP.5,Speed)
    did -ra $dname 23 $r.set(FTP.1,Max.Users)
    did -ra $dname 52 $r.set(FTP.2,Max.Users)
    did -ra $dname 82 $r.set(FTP.3,Max.Users)
    did -ra $dname 112 $r.set(FTP.4,Max.Users)
    did -ra $dname 142 $r.set(FTP.5,Max.Users)
    did -ra $dname 33 $r.set(FTP.1,Note)
    did -ra $dname 62 $r.set(FTP.2,Note)
    did -ra $dname 92 $r.set(FTP.3,Note)
    did -ra $dname 122 $r.set(FTP.4,Note)
    did -ra $dname 152 $r.set(FTP.5,Note)
    if (($r.set(FTP.1,Channels) == All) || ($r.set(FTP.1,Channels) == $null)) { did -c $dname 28 | did -b $dname 25,26,27 } | else { dla $dname 25 $r.set(FTP.1,Channels) }
    if (($r.set(FTP.2,Channels) == All) || ($r.set(FTP.2,Channels) == $null)) { did -c $dname 57 | did -b $dname 54,55,56 } | else { dla $dname 54 $r.set(FTP.2,Channels) }
    if (($r.set(FTP.3,Channels) == All) || ($r.set(FTP.3,Channels) == $null)) { did -c $dname 87 | did -b $dname 84,85,86 } | else { dla $dname 84 $r.set(FTP.3,Channels) }
    if (($r.set(FTP.4,Channels) == All) || ($r.set(FTP.4,Channels) == $null)) { did -c $dname 117 | did -b $dname 114,115,116 } | else { dla $dname 114 $r.set(FTP.4,Channels) }
    if (($r.set(FTP.5,Channels) == All) || ($r.set(FTP.5,Channels) == $null)) { did -c $dname 147 | did -b $dname 144,145,146 } | else { dla $dname 144 $r.set(FTP.5,Channels) }
    did -ra $dname 21 $vnum($r.set(FTP.1,Ad.Delay),5)
    did -ra $dname 50 $vnum($r.set(FTP.2,Ad.Delay),5)
    did -ra $dname 80 $vnum($r.set(FTP.3,Ad.Delay),5)
    did -ra $dname 110 $vnum($r.set(FTP.4,Ad.Delay),5)
    did -ra $dname 140 $vnum($r.set(FTP.5,Ad.Delay),5)
    if ($r.set(FTP.1,Auto.Start) == On) { did -c $dname 29 }
    if ($r.set(FTP.2,Auto.Start) == On) { did -c $dname 58 }
    if ($r.set(FTP.3,Auto.Start) == On) { did -c $dname 88 }
    if ($r.set(FTP.4,Auto.Start) == On) { did -c $dname 118 }
    if ($r.set(FTP.5,Auto.Start) == On) { did -c $dname 148 }
    if ($r.set(FTP.1,Ops) == On) { did -c $dname 311 }
    if ($r.set(FTP.1,Friends) == On) { did -c $dname 312 }
    if ($r.set(FTP.1,Voice) == On) { did -c $dname 313 }
    if ($r.set(FTP.1,Everyone) == On) { did -c $dname 314 | did -b $dname 311,312,313 }
    if ($r.set(FTP.2,Ops) == On) { did -c $dname 321 }
    if ($r.set(FTP.2,Friends) == On) { did -c $dname 322 }
    if ($r.set(FTP.2,Voice) == On) { did -c $dname 323 }
    if ($r.set(FTP.2,Everyone) == On) { did -c $dname 324 | did -b $dname 321,322,323 }
    if ($r.set(FTP.3,Ops) == On) { did -c $dname 331 }
    if ($r.set(FTP.3,Friends) == On) { did -c $dname 332 }
    if ($r.set(FTP.3,Voice) == On) { did -c $dname 333 }
    if ($r.set(FTP.3,Everyone) == On) { did -c $dname 334 | did -b $dname 331,332,333 }
    if ($r.set(FTP.4,Ops) == On) { did -c $dname 341 }
    if ($r.set(FTP.4,Friends) == On) { did -c $dname 342 }
    if ($r.set(FTP.4,Voice) == On) { did -c $dname 343 }
    if ($r.set(FTP.4,Everyone) == On) { did -c $dname 344 | did -b $dname 341,342,343 }
    if ($r.set(FTP.5,Ops) == On) { did -c $dname 351 }
    if ($r.set(FTP.5,Friends) == On) { did -c $dname 352 }
    if ($r.set(FTP.5,Voice) == On) { did -c $dname 353 }
    if ($r.set(FTP.5,Everyone) == On) { did -c $dname 354 | did -b $dname 351,352,353 }

  }
  if ($devent == sclick) {
    if ($did == 314) { if ($did($dname,314).state == 1) { did -b $dname 311,312,313 } | else { did -e $dname 311,312,313 } }
    if ($did == 324) { if ($did($dname,324).state == 1) { did -b $dname 321,322,323 } | else { did -e $dname 321,322,323 } }
    if ($did == 334) { if ($did($dname,334).state == 1) { did -b $dname 331,332,333 } | else { did -e $dname 331,332,333 } }
    if ($did == 344) { if ($did($dname,344).state == 1) { did -b $dname 341,342,343 } | else { did -e $dname 341,342,343 } }
    if ($did == 354) { if ($did($dname,354).state == 1) { did -b $dname 351,352,353 } | else { did -e $dname 351,352,353 } }
    if ($did == 26) && ($did($dname,25).sel == $null || $did($dname,25).sel == 0) && ($did($dname,25).text != $null) { did -a $dname 25 $vc($did($dname,25).text) | did -c $dname 25 $did($dname,25).lines }
    if ($did == 55) && ($did($dname,54).sel == $null || $did($dname,54).sel == 0) && ($did($dname,54).text != $null) { did -a $dname 54 $vc($did($dname,54).text) | did -c $dname 54 $did($dname,54).lines }
    if ($did == 85) && ($did($dname,84).sel == $null || $did($dname,84).sel == 0) && ($did($dname,84).text != $null) { did -a $dname 84 $vc($did($dname,84).text) | did -c $dname 84 $did($dname,84).lines }
    if ($did == 115) && ($did($dname,114).sel == $null || $did($dname,114).sel == 0) && ($did($dname,114).text != $null) { did -a $dname 114 $vc($did($dname,114).text) | did -c $dname 114 $did($dname,114).lines }
    if ($did == 145) && ($did($dname,144).sel == $null || $did($dname,144).sel == 0) && ($did($dname,144).text != $null) { did -a $dname 144 $vc($did($dname,144).text) | did -c $dname 144 $did($dname,144).lines }
    if ($did == 27) && ($did($dname,25).sel isnum) { did -d $dname 25 $did($dname,25).sel }
    if ($did == 56) && ($did($dname,54).sel isnum) { did -d $dname 54 $did($dname,54).sel }
    if ($did == 86) && ($did($dname,84).sel isnum) { did -d $dname 84 $did($dname,84).sel }
    if ($did == 116) && ($did($dname,114).sel isnum) { did -d $dname 114 $did($dname,114).sel }
    if ($did == 146) && ($did($dname,144).sel isnum) { did -d $dname 144 $did($dname,144).sel }
    if ($did == 28) { if ($did($dname,$did).state == 1) { did -b $dname 25,26,27 } | else { did -e $dname 25,26,27 } }
    if ($did == 57) { if ($did($dname,$did).state == 1) { did -b $dname 54,55,56 } | else { did -e $dname 54,55,56 } }
    if ($did == 87) { if ($did($dname,$did).state == 1) { did -b $dname 84,85,86 } | else { did -e $dname 84,85,86 } }
    if ($did == 117) { if ($did($dname,$did).state == 1) { did -b $dname 114,115,116 } | else { did -e $dname 114,115,116 } }
    if ($did == 147) { if ($did($dname,$did).state == 1) { did -b $dname 144,145,146 } | else { did -e $dname 144,145,146 } }
    if $did != 200 && $did != 202 { click }
    if (($did == 200) || ($did == 202)) {
      setsaved FTP
      if $did($dname,35).state == 1 { w.set FTP.1 List On } | else { w.set FTP.1 List Off } 
      if $did($dname,36).state == 1 { w.set FTP.2 List On } | else { w.set FTP.2 List Off } 
      if $did($dname,37).state == 1 { w.set FTP.3 List On } | else { w.set FTP.3 List Off } 
      if $did($dname,38).state == 1 { w.set FTP.4 List On } | else { w.set FTP.4 List Off } 
      if $did($dname,39).state == 1 { w.set FTP.5 List On } | else { w.set FTP.5 List Off } 
      if (($did($dname,28).state == 1) || ($did($dname,25).lines == 0)) { w.set FTP.1 Channels All } | else { dls $dname 25 w.set FTP.1 Channels }
      if (($did($dname,57).state == 1) || ($did($dname,54).lines == 0)) { w.set FTP.2 Channels All } | else { dls $dname 54 w.set FTP.2 Channels }
      if (($did($dname,87).state == 1) || ($did($dname,84).lines == 0)) { w.set FTP.3 Channels All } | else { dls $dname 84 w.set FTP.3 Channels }
      if (($did($dname,117).state == 1) || ($did($dname,114).lines == 0)) { w.set FTP.4 Channels All } | else { dls $dname 114 w.set FTP.4 Channels }
      if (($did($dname,147).state == 1) || ($did($dname,144).lines == 0)) { w.set FTP.5 Channels All } | else { dls $dname 144 w.set FTP.5 Channels }
      w.set FTP.1 Address $did($dname,13).text
      w.set FTP.2 Address $did($dname,42).text
      w.set FTP.3 Address $did($dname,72).text
      w.set FTP.4 Address $did($dname,102).text
      w.set FTP.5 Address $did($dname,132).text
      w.set FTP.1 Port $did($dname,15).text
      w.set FTP.2 Port $did($dname,44).text
      w.set FTP.3 Port $did($dname,74).text
      w.set FTP.4 Port $did($dname,104).text
      w.set FTP.5 Port $did($dname,134).text
      w.set FTP.1 Login $did($dname,17).text
      w.set FTP.2 Login $did($dname,46).text
      w.set FTP.3 Login $did($dname,76).text
      w.set FTP.4 Login $did($dname,106).text
      w.set FTP.5 Login $did($dname,136).text
      w.set FTP.1 Password $did($dname,19).text
      w.set FTP.2 Password $did($dname,48).text
      w.set FTP.3 Password $did($dname,78).text
      w.set FTP.4 Password $did($dname,108).text
      w.set FTP.5 Password $did($dname,138).text
      w.set FTP.1 Speed $did($dname,31).text
      w.set FTP.2 Speed $did($dname,60).text
      w.set FTP.3 Speed $did($dname,90).text
      w.set FTP.4 Speed $did($dname,120).text
      w.set FTP.5 Speed $did($dname,150).text
      w.set FTP.1 Max.Users $did($dname,23).text
      w.set FTP.2 Max.Users $did($dname,52).text
      w.set FTP.3 Max.Users $did($dname,82).text
      w.set FTP.4 Max.Users $did($dname,112).text
      w.set FTP.5 Max.Users $did($dname,142).text
      if ($did($dname,33).text) { iw.set FTP.1 Note $did($dname,33).text } | else { d.set FTP.1 Note }
      if ($did($dname,62).text) { iw.set FTP.2 Note $did($dname,62).text } | else { d.set FTP.2 Note }
      if ($did($dname,92).text) { iw.set FTP.3 Note $did($dname,92).text } | else { d.set FTP.3 Note }
      if ($did($dname,122).text) { iw.set FTP.4 Note $did($dname,122).text } | else { d.set FTP.4 Note }
      if ($did($dname,152).text) { iw.set FTP.5 Note $did($dname,152).text } | else { d.set FTP.5 Note }
      w.set FTP.1 Ad.Delay $did($dname,21).text
      w.set FTP.2 Ad.Delay $did($dname,50).text
      w.set FTP.3 Ad.Delay $did($dname,80).text
      w.set FTP.4 Ad.Delay $did($dname,110).text
      w.set FTP.5 Ad.Delay $did($dname,140).text
      if ($did($dname,29).state == 1) { w.set FTP.1 Auto.Start On } | else { w.set FTP.1 Auto.Start Off }
      if ($did($dname,58).state == 1) { w.set FTP.2 Auto.Start On } | else { w.set FTP.2 Auto.Start Off }
      if ($did($dname,88).state == 1) { w.set FTP.3 Auto.Start On } | else { w.set FTP.3 Auto.Start Off }
      if ($did($dname,118).state == 1) { w.set FTP.4 Auto.Start On } | else { w.set FTP.4 Auto.Start Off }
      if ($did($dname,148).state == 1) { w.set FTP.5 Auto.Start On } | else { w.set FTP.5 Auto.Start Off }
      if ($did($dname,311).state == 1) { w.set FTP.1 Ops On } | else { w.set FTP.1 Ops Off }
      if ($did($dname,312).state == 1) { w.set FTP.1 Friends On } | else { w.set FTP.1 Friends Off }
      if ($did($dname,313).state == 1) { w.set FTP.1 Voice On } | else { w.set FTP.1 Voice Off }
      if ($did($dname,314).state == 1) { w.set FTP.1 Everyone On } | else { w.set FTP.1 Everyone Off }
      if ($did($dname,321).state == 1) { w.set FTP.2 Ops On } | else { w.set FTP.2 Ops Off }
      if ($did($dname,322).state == 1) { w.set FTP.2 Friends On } | else { w.set FTP.2 Friends Off }
      if ($did($dname,323).state == 1) { w.set FTP.2 Voice On } | else { w.set FTP.2 Voice Off }
      if ($did($dname,324).state == 1) { w.set FTP.2 Everyone On } | else { w.set FTP.2 Everyone Off }
      if ($did($dname,331).state == 1) { w.set FTP.3 Ops On } | else { w.set FTP.3 Ops Off }
      if ($did($dname,332).state == 1) { w.set FTP.3 Friends On } | else { w.set FTP.3 Friends Off }
      if ($did($dname,333).state == 1) { w.set FTP.3 Voice On } | else { w.set FTP.3 Voice Off }
      if ($did($dname,334).state == 1) { w.set FTP.3 Everyone On } | else { w.set FTP.3 Everyone Off }
      if ($did($dname,341).state == 1) { w.set FTP.4 Ops On } | else { w.set FTP.4 Ops Off }
      if ($did($dname,342).state == 1) { w.set FTP.4 Friends On } | else { w.set FTP.4 Friends Off }
      if ($did($dname,343).state == 1) { w.set FTP.4 Voice On } | else { w.set FTP.4 Voice Off }
      if ($did($dname,344).state == 1) { w.set FTP.4 Everyone On } | else { w.set FTP.4 Everyone Off }
      if ($did($dname,351).state == 1) { w.set FTP.5 Ops On } | else { w.set FTP.5 Ops Off }
      if ($did($dname,352).state == 1) { w.set FTP.5 Friends On } | else { w.set FTP.5 Friends Off }
      if ($did($dname,353).state == 1) { w.set FTP.5 Voice On } | else { w.set FTP.5 Voice Off }
      if ($did($dname,354).state == 1) { w.set FTP.5 Everyone On } | else { w.set FTP.5 Everyone Off }

    }
  }
}
Dialog XDCC {
  title "XDCC Manager"
  icon Invision\Themes\gfx\default\i2tray1.ico
  size -1 -1 314 220
  option dbu

  tab "General", 1, 2 3 309 200
  tab "Categories",3
  tab "Packs", 2
  tab "Full Pack List",4

  button "OK", 498, 86 207 35 10, ok
  button "Cancel", 499, 126 207 35 10, cancel
  button "&Apply", 500, 166 207 35 10

  text "Max Sends Total:", 55, 5 25 45 10, tab 1
  edit "", 56, 50 23 22 10, tab 1
  text "Max Sends Each:", 60, 5 35 45 10, tab 1
  edit "", 61, 50 33 22 10, tab 1
  text "Max Queues Total:", 65, 5 45 46 10, tab 1
  edit "", 66, 50 43 22 10, tab 1
  text "Max Queues Each:", 20, 5 55 45 10, tab 1
  edit "", 21, 50 53 22 10, tab 1
  text "Delay (sec):" 31, 90 25 30 10, tab 1
  edit "", 32, 121 23 28 10, tab 1
  text "Ad Delay (min):", 40, 90 35 37 8, tab 1
  edit "", 41, 127 33 22 10, tab 1
  text "Line Delay:", 67, 90 45 30 10, tab 1
  edit "", 68, 121 43 28 10, tab 1
  check "Pack Listing", 30, 155 25 100 10, tab 1
  check "Block Text Flood Notices", 989, 155 35 100 10, tab 1
  check "Use High-Resolution Timers (May fix out of order packs,", 990, 155 45 150 10, tab 1
  text "at the cost of CPU time)", 991, 238 55 60 10, tab 1

  box " MOTD ", 1020, 5 63 288 20, tab 1
  edit "", 1021, 8 71 282 10, tab 1 autohs

  text "Advertising Channels:", 45, 6 85 120 10, tab 1
  combo 46, 5 94 130 110, tab 1
  button "Add", 47, 138 127 35 15, tab 1
  button "Rem", 48, 138 149 35 15, tab 1
  check "All Channels", 50, 180 127 90 10, tab 1
  check "Auto Start", 51, 180 142 90 10, tab 1
  check "Display Latest", 1951, 180 157 44 10, tab 1
  edit "",1952,225 156 15 10, tab 1
  text "Packs Only", 1953, 243 158 40 10, tab 1
  check "Enable !List",1954,180 172 40 10, tab 1

  button "Erase XDCC Records", 300, 185 185 70 9, tab 1

  text "Category:",1210,20 27 25 10, tab 3
  edit "",1211,45 26 40 10, autohs tab 3
  text "Color 1:",1212,89 27 20 10, tab 3
  combo 1213,108 26 47 10, drop tab 3
  text "Color 2:",1217,159 27 20 10, tab 3
  combo 1218,178 26 47 10, drop tab 3
  button "Add",1214,230 26 20 10, tab 3
  list 1215,20 40 150 150, sort tab 3
  button "Remove Selected",1216,20 185 150 10, center tab 3
  text "Here, you can select categories and colors for your Packs if you want to.  If you just want colors and no categories, leave the Category field blank.  It will show up in the list as n/a, but that will not show when displaying your packs.                                                                         Once you have added your categories to the list, you can select the categories in the Packs tab for each of your Packs.                                                                         Note that if you do not want any color or category for your Pack, you should have a n/a category with both colors set to Plain Text, then select that from the list.",1219,180 40 100 120, tab 3

  box "Pack #1 of 1", 100, 4 20 290 180, tab 2
  text "File:", 101, 30 32 20 10, tab 2
  edit "", 102, 40 30 230 10, tab 2 autohs
  button "...", 103, 270 30 10 10, tab 2
  text "Description:", 104, 11 52 30 10, tab 2
  edit "", 105, 40 50 230 10, tab 2 autohs
  text "Type:",1203,111 65 20 10, tab 2
  combo 1204,132 64 47 10, drop sort tab 2
  button "Remove This Pack", 106, 115 85 60 15, tab 2
  text "To set up a pack you can browse with the ... button and select a file to be served as that pack #. You can then enter a description in the box below which will be shown with the pack number.", 107, 20 105 260 20, tab 2
  text "Downloads:",108, 120 130 30 10, tab 2
  edit "", 109, 150 128 20 10, tab 2
  box "Change Pack",1200,112 165 63 34, tab 2
  button "<",1201,132 175 10 10, tab 2
  button ">",1202,147 175 10 10, tab 2
  text "Select Pack",1205,115 188 35 10, tab 2
  edit "",1206,145 187 15 10, tab 2
  button "Go",1207,162 187 10 10, tab 2

  list 1220,30 30 200 170, hsbar  tab 4
  button "Remove ALL Packs",1221,235 100 60 20, tab 4
}
on *:dialog:XDCC:*:*:{
  if ($devent == init) {
    var %fill1 = 00 White,01 Black,02 Blue,03 Green,04 Red,05 Brown,06 Purple,07 Orange,08 Yellow,09 Light Green,10 Cyan,11 Light Cyan,12 Royal Blue,13 Pink,14 Grey,15 Light Grey,16 Plain Text
    dla $dname 1213,1218 %fill1
    did -c $dname 1213,1218 17
    var %Path = $shortfn($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini)
    var %cnt = 1
    while (%cnt <= $ini(%Path,Types,0)) {
      did -a $dname 1215,1204 $replace($readini(%Path,Types,%cnt),#Þ!,,#Þ@,,#Þ$,,#Þ%,)
      inc %cnt
    }
    set %pack.cnt 1
    did -ra $dname 100 Pack # $+ %pack.cnt of $calc($ini(%Path,0) - $iif($ini(%Path,Types),1,0))
    did -b $dname 1201
    var %cnt = 1
    while (%cnt <= $ini(%Path,0)) {
      var %Pack = $ini(%Path,%cnt)
      var %Filename = $readini(%Path,%Pack,Filename)
      var %Desc = $readini(%Path,%Pack,Desc)
      var %Type = $gettok($readini(%Path,%Pack,Type),1,32)
      var %Cat = $readini(%Path,Types,%Type)
      if (%Pack != Types && %Filename != None) { did -a $dname 1220 $remove(%Pack,Pack_) $gettok(%Cat,1- $calc($gettok(%Cat,0,32) - 2),32) %Desc }
      did -z $dname 1220
      inc %cnt
    }
    if ($r.xdcc.pack(%pack.cnt,Filename) != $null) { did -ra $dname 102 $r.xdcc.pack(%pack.cnt,Filename) } | else { did -ra $dname 102 None }
    if ($r.xdcc.pack(%pack.cnt,Desc) != $null) { did -ra $dname 105 $r.xdcc.pack(%pack.cnt,Desc) } | else { did -ra $dname 105 None }
    if ($r.xdcc.pack(%pack.cnt,DL) != $null) && ($r.xdcc.pack(%pack.cnt,DL) != 0) { did -ra $dname 109 $r.xdcc.pack(%pack.cnt,DL) } | else { did -ra $dname 109 0 }
    if ($r.xdcc.pack(%pack.cnt,Type) != $null && $gettok($r.xdcc.pack(%pack.cnt,Type),2-,32) == $readini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,Types,$gettok($r.xdcc.pack(%pack.cnt,Type),1,32))) { did -c $dname 1204 $gettok($r.xdcc.pack(%pack.cnt,Type),1,32) }
    else { did -u $dname 1204 }
    if ($r.set(XDCC,Latest) == 1) { did -c $dname 1951 }
    if ($r.set(XDCC,List) == On || $r.set(XDCC,List) == $null) { did -c $dname 1954 }
    if ($r.set(XDCC,Latest.Num)) { did -ra $dname 1952 $v1 }
    dialog -t $dname XDCC Settings for $iif($iSetwork != $null,$iSetwork,Global)
    did -ra $dname 1021 $r.set(XDCC,motd)
    did -ra $dname 61 $vnum($r.set(XDCC,Max.Sends.Each),1)
    did -ra $dname 56 $vnum($r.set(XDCC,Max.Sends.Total),2)
    did -ra $dname 21 $vnum($r.set(XDCC,Max.Queues.Each),2)
    did -ra $dname 66 $vnum($r.set(XDCC,Max.Queues.Total),5)
    did -ra $dname 68 $vnum($r.set(XDCC,Line.Delay),1000)
    if ($isnum($r.set(XDCC,Pack.List)) == $true) { did -c $dname 30 | did -ra $dname 32 $vnum($r.set(XDCC,Pack.List),15) }
    else { did -b $dname 31,32 | did -r $dname 32 }
    did -ra $dname 41 $vnum($r.set(XDCC,Ad.Delay),20)
    if (($r.set(XDCC,Channels) == All) || ($r.set(XDCC,Channels) == $null)) { did -c $dname 50 | did -b $dname 46,47,48 } | else { dla $dname 46 $r.set(XDCC,Channels) }
    if ($r.set(XDCC,Auto.Start) == On) { did -c $dname 51 }
    if ($r.set(Invision,blkfloodnotice) == On) { did -c $dname 989 }
    if ($r.set(Invision,XDCCHighRes) == On) { did -c $dname 990 }
  }
  if ($devent == sclick) {
    if ($did == 1214 && $did(1213).seltext != $null && $did(1218).seltext != $null) {
      did -a $dname 1215,1204 $iif($did(1211).text,$v1,n/a) $gettok($did(1213).seltext,1,32) $gettok($did(1218).seltext,1,32)
      did -r $dname 1211
    }
    elseif ($did == 1216 && $did(1215).sel != $null) {
      did -d $dname 1215,1204 $did(1215).sel
    }
    elseif ($did == 1201 && %pack.cnt != 1) {
      w.xdcc.pack %pack.cnt Filename $did($dname,102).text
      w.xdcc.pack %pack.cnt Desc $did($dname,105).text
      w.xdcc.pack %pack.cnt DL $iif($did($dname,109).text isnum 0-9999,$v1,0)
      if ($did($dname,1204).seltext != $null) { w.xdcc.pack %pack.cnt Type $did($dname,1204).sel $replace($did($dname,1204).seltext,,#Þ!,,#Þ@,,#Þ$,,#Þ%) }
      if (%pack.cnt == 999) { did -e $dname 1202 }
      dec %pack.cnt
      if (%pack.cnt < 1) { set %pack.cnt 1 }
      if (%pack.cnt == 1) { did -b $dname 1201 }
      did -ra $dname 100 Pack # $+ %pack.cnt of $calc($ini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,0) - $iif($ini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,Types),1,0))
      if ($r.xdcc.pack(%pack.cnt,Filename) != $null) { did -ra $dname 102 $r.xdcc.pack(%pack.cnt,Filename) } | else { did -ra $dname 102 None }
      if ($r.xdcc.pack(%pack.cnt,Desc) != $null) { did -ra $dname 105 $r.xdcc.pack(%pack.cnt,Desc) } | else { did -ra $dname 105 None }
      if ($r.xdcc.pack(%pack.cnt,DL) != $null) && ($r.xdcc.pack(%pack.cnt,DL) != 0) { did -ra $dname 109 $r.xdcc.pack(%pack.cnt,DL) } | else { did -ra $dname 109 0 }
      if ($r.xdcc.pack(%pack.cnt,Type) != $null && $gettok($r.xdcc.pack(%pack.cnt,Type),2-,32) == $readini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,Types,$gettok($r.xdcc.pack(%pack.cnt,Type),1,32))) { did -c $dname 1204 $gettok($r.xdcc.pack(%pack.cnt,Type),1,32) }
      else { did -u $dname 1204 }
    }
    elseif ($did == 1202 && %pack.cnt != 999) {
      w.xdcc.pack %pack.cnt Filename $did($dname,102).text
      w.xdcc.pack %pack.cnt Desc $did($dname,105).text
      w.xdcc.pack %pack.cnt DL $iif($did($dname,109).text isnum 1-9999,$v1,0)
      if ($did($dname,1204).seltext != $null) { w.xdcc.pack %pack.cnt Type $did($dname,1204).sel $replace($did($dname,1204).seltext,,#Þ!,,#Þ@,,#Þ$,,#Þ%) }
      if (%pack.cnt == 1) { did -e $dname 1201 }
      inc %pack.cnt
      if (%pack.cnt > 999) { set %pack.cnt 999 }
      if (%pack.cnt == 999) { did -b $dname 1202 }
      did -ra $dname 100 Pack # $+ %pack.cnt of $calc($ini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,0) - $iif($ini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,Types),1,0))
      if ($r.xdcc.pack(%pack.cnt,Filename) != $null) { did -ra $dname 102 $r.xdcc.pack(%pack.cnt,Filename) } | else { did -ra $dname 102 None }
      if ($r.xdcc.pack(%pack.cnt,Desc) != $null) { did -ra $dname 105 $r.xdcc.pack(%pack.cnt,Desc) } | else { did -ra $dname 105 None }
      if ($r.xdcc.pack(%pack.cnt,DL) != $null) && ($r.xdcc.pack(%pack.cnt,DL) != 0) { did -ra $dname 109 $r.xdcc.pack(%pack.cnt,DL) } | else { did -ra $dname 109 0 }
      if ($r.xdcc.pack(%pack.cnt,Type) != $null && $gettok($r.xdcc.pack(%pack.cnt,Type),2-,32) == $readini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,Types,$gettok($r.xdcc.pack(%pack.cnt,Type),1,32))) { did -c $dname 1204 $gettok($r.xdcc.pack(%pack.cnt,Type),1,32) }
      else { did -u $dname 1204 }
    }
    elseif ($did == 1207 && $did(1206).text isnum 1-999) {
      w.xdcc.pack %pack.cnt Filename $did($dname,102).text
      w.xdcc.pack %pack.cnt Desc $did($dname,105).text
      w.xdcc.pack %pack.cnt DL $iif($did($dname,109).text isnum 1-9999,$v1,0)
      if ($did($dname,1204).seltext != $null) { w.xdcc.pack %pack.cnt Type $did($dname,1204).sel $replace($did($dname,1204).seltext,,#Þ!,,#Þ@,,#Þ$,,#Þ%) }
      if (%pack.cnt == 1) { did -e $dname 1201 }
      if (%pack.cnt == 999) { did -e $dname 1202 }
      set %pack.cnt $did(1206).text
      if (%pack.cnt == 1) { did -b $dname 1201 }
      if (%pack.cnt == 999) { did -b $dname 1202 }
      did -ra $dname 100 Pack # $+ %pack.cnt of $calc($ini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,0) - $iif($ini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,Types),1,0))
      if ($r.xdcc.pack(%pack.cnt,Filename) != $null) { did -ra $dname 102 $r.xdcc.pack(%pack.cnt,Filename) } | else { did -ra $dname 102 None }
      if ($r.xdcc.pack(%pack.cnt,Desc) != $null) { did -ra $dname 105 $r.xdcc.pack(%pack.cnt,Desc) } | else { did -ra $dname 105 None }
      if ($r.xdcc.pack(%pack.cnt,DL) != $null) && ($r.xdcc.pack(%pack.cnt,DL) != 0) { did -ra $dname 109 $r.xdcc.pack(%pack.cnt,DL) } | else { did -ra $dname 109 0 }
      if ($r.xdcc.pack(%pack.cnt,Type) != $null && $gettok($r.xdcc.pack(%pack.cnt,Type),2-,32) == $readini($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini,Types,$gettok($r.xdcc.pack(%pack.cnt,Type),1,32))) { did -c $dname 1204 $gettok($r.xdcc.pack(%pack.cnt,Type),1,32) }
      else { did -u $dname 1204 }
    }
    elseif ($did == 1221) {
      did -r $dname 1220
      did -ra $dname 102,105 None
      did -ra $dname 109 0
      did -u $dname 1204
      did -ra $dname 100 Pack # $+ %pack.cnt of $calc($ini(%Path,0) - $iif($ini(%Path,Types),1,0))
      var %Path = $shortfn($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini)
      .remove %Path
      if ($ini(%Path,Types)) remini %Path Types
      var %cnt = 1
      while (%cnt <= $did(1215).lines) {
        writeini %Path Types %cnt $replace($did(1215,%cnt).text,,#Þ!,,#Þ@,,#Þ$,,#Þ%)
        inc %cnt
      }
    }
    elseif ($did == 4) {
      var %Path = $shortfn($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini)
      set %pack.cnt $gettok($did($dname,100).text,2,32)
      w.xdcc.pack %pack.cnt Filename $did($dname,102).text
      w.xdcc.pack %pack.cnt Desc $did($dname,105).text
      w.xdcc.pack %pack.cnt DL $iif($did($dname,109).text isnum 1-9999,$v1,0)
      if ($did($dname,1204).seltext != $null) { w.xdcc.pack %pack.cnt Type $did($dname,1204).sel $replace($did($dname,1204).seltext,,#Þ!,,#Þ@,,#Þ$,,#Þ%) }
      did -r $dname 1220
      var %cnt = 1
      while (%cnt <= $ini(%Path,0)) {
        var %Pack = $ini(%Path,%cnt)
        var %Filename = $readini(%Path,%Pack,Filename)
        var %Desc = $readini(%Path,%Pack,Desc)
        var %Type = $gettok($readini(%Path,%Pack,Type),1,32)
        var %Cat = $readini(%Path,Types,%Type)
        if (%Pack != Types && %Filename != None) { did -a $dname 1220 $remove(%Pack,Pack_) $gettok(%Cat,1- $calc($gettok(%Cat,0,32) - 2),32) %Desc }
        did -z $dname 1220
        inc %cnt
      }
    }
    if ($did == 300) { if $?!="Are you sure you want to erase all the XDCC records?" == $true {
        d.set XDCC Record.CPS
        d.set XDCC Snagged
        var %ct = 1
        while (%ct <= 15) {
          w.xdcc.pack %ct DL 0
          inc %ct
        }
      }
      dopen XDCC XDCC
    }
    if ($did == 30) { if ($did($dname,$did).state == 1) { did -e $dname 31,32 | did -ra $dname 32 30 } | else { did -b $dname 31,32 | did -r $dname 32 } }
    if ($did == 47) && ($did($dname,46).sel == $null || $did($dname,46).sel == 0) && ($did($dname,46).text != $null) { did -a $dname 46 $vc($did($dname,46).text) | did -c $dname 46 $did($dname,46).lines } 
    if ($did == 48) && ($did($dname,46).sel isnum) { did -d $dname 46 $did($dname,46).sel }
    if ($did == 50) { if ($did($dname,$did).state == 1) { did -b $dname 46,47,48 } | else { did -e $dname 46,47,48 } }
    if ($did == 106) {
      did -ra $dname 102 None
      did -ra $dname 105 None
      did -ra $dname 109 0
      did -u $dname 1204
    }   
    if ($did ==  103) {
      did -ra $dname 109 0
      var %xfn = $isset($sfile($mircdir,Choose the file for this pack (Cancel = None),Select),None)
      if (%xfn != None || $did($dname,102).text == $null) { did -ra $dname 102 %xfn }
      if (%xfn != None || $did($dname,105).text == $null) { did -ra $dname 105 $left($nopath(%xfn),-4) }
    }
    if $did != 498 && $did != 500 { click }
    if ($did == 498) || ($did == 500) {
      var %Path = $shortfn($mircdir\Invision\Settings\ $+ [ $iSetwork ] $+ \XDCC.ini)
      if ($ini(%Path,Types)) remini %Path Types
      var %cnt = 1
      while (%cnt <= $did(1215).lines) {
        writeini %Path Types %cnt $replace($did(1215,%cnt).text,,#Þ!,,#Þ@,,#Þ$,,#Þ%)
        inc %cnt
      }
      noop $findfile($remove(%Path,XDCC.ini),XDCCList*.txt,0,.remove $1-)
      var %cnt = 1
      while (%cnt <= $did($dname,1220).lines) {
        write $remove(%Path,XDCC.ini) $+ XDCCList- $+ $me $+ - $+ $date(mmddyy) $+ .txt $did($dname,1220,%cnt)
        inc %cnt
      }
      setsaved
      if $did($dname,1021).text != $null { w.set XDCC motd $did($dname,1021).text } | else { d.set XDCC motd }
      w.set XDCC Latest $did($dname,1951).state
      if ($did($dname,1954).state == 1) { w.set XDCC List On } | else { w.set XDCC List Off }
      w.set XDCC Latest.Num $iif($did($dname,1952),$v1,0)
      w.set XDCC Max.Sends.Each $vnum($did($dname,61).text,1)
      w.set XDCC Max.Sends.Total $vnum($did($dname,56).text,2)
      w.set XDCC Max.Queues.Each $vnum($did($dname,21).text,2)
      w.set XDCC Max.Queues.Total $vnum($did($dname,66).text,5)
      if ($did($dname,68).text isnum) && ($did($dname,68).text > 499) { w.set XDCC Line.Delay $did($dname,68).text } | else { w.set XDCC Line.Delay 500 }
      if ($did($dname,30).state == 1) && ($isnum($vnum($did($dname,32).text),30) == $true) { w.set XDCC Pack.List $vnum($did($dname,32).text,30) }
      else { w.set XDCC Pack.List Off }
      if ($did($dname,41).text isnum) { w.set XDCC Ad.Delay $did($dname,41).text } | else { w.set XDCC Ad.Delay 20 }
      if ($did($dname,50).state == 1) || ($did($dname,46).lines == 0) { w.set XDCC Channels All } | else { dls $dname 46 w.set XDCC Channels }
      if ($did($dname,51).state == 1) { w.set XDCC Auto.Start On } | else { w.set XDCC Auto.Start Off }
      if ($did($dname,989).state == 1) { w.set Invision BlkFloodNotice On } | else { w.set Invision BlkFloodNotice Off }
      if ($did($dname,990).state == 1) { w.set Invision XDCCHighRes On } | else { w.set Invision XDCCHighRes Off }
      set %pack.cnt $gettok($did($dname,100).text,2,32)
      w.xdcc.pack %pack.cnt Filename $did($dname,102).text
      w.xdcc.pack %pack.cnt Desc $did($dname,105).text
      w.xdcc.pack %pack.cnt DL $iif($did($dname,109).text isnum 1-9999,$v1,0)
      if ($did($dname,1204).seltext != $null) { w.xdcc.pack %pack.cnt Type $did($dname,1204).sel $replace($did($dname,1204).seltext,,#Þ!,,#Þ@,,#Þ$,,#Þ%) }
      unset %pack.cnt
    }
  }
}
