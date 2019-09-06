alias Autopause { dopen Apause Apause }
alias Autopausing {
  .scid -a FSpause
  .timerAPauseOFF 1 $r.glob(AutPause,StallTime) .scid -a FSpause
}
Dialog Apause {
  title "Auto-Pauser"
  icon Invision\Themes\gfx\default\i2tray1.ico
  option dbu
  size -1 -1 131 80
  check "Enable", 1, 5 8 55 13
  text "Stall Fserve for:", 2, 5 26 50 9
  edit "", 3, 45 25 25 10, center
  text "seconds", 4, 71 26 20 9

  text "Stall Interval:", 5, 5 36 50 9
  edit "", 6, 45 35 25 10, center
  text "minutes.", 7, 71 36 20 9
  button "SAVE", 200, 15 50 100 25, ok
}
On *:dialog:Apause:*:*:{
  if ($devent == init) {
    if ($r.glob(Autopauser,Enabled) == On) { did -c $dname 1 }
    did -ra $dname 3 $isset($r.glob(AutoPauser,StallTime),60)
    did -ra $dname 6 $calc($isset($r.glob(AutoPauser,StallInterval),2700) / 60)
  }
  if ($devent == sclick) {
    if ($did == 200) {
      if  (($did($dname,3) isnum) && ($did($dname,3) > 0) && ($did($dname,3) < 32000)) { w.glob Autopauser StallTime $did($dname,3).text } 
      else { w.glob Autopauser StallTime 60 }
      if  (($did($dname,6) isnum) && ($did($dname,6) > 0) && ($did($dname,6) < 2000)) { w.glob Autopauser StallInterval $calc($did($dname,6).text * 60) } 
      else { w.glob Autopauser StallInterval 2700 }
      if ($did($dname,1).state == 1) {
        w.glob AutoPauser Enabled On
        .timerAutoPauser 0 $r.glob(Autopauser,StallInterval) AutoPausing
aecho AutoPauser is On!
      }
      else {
        w.glob AutoPauser Enabled Off
        .timerAutopauser 1 1 aecho AutoPauser is Off!
      }
    }
  }
}
menu menubar {
  AutoPauser:{ Autopause }
}
