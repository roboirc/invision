; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: isoundfx.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: Dynamic Sound Triggering 
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
alias WrongFile { if $?!="You can only use .mp3 or .wav file types. Would you like to select again?" == $true { return } | else { halt } }
alias rsfx.set { if ($2 != $null)  && ($isfile($shortfn($mircdirSoundFX\Schemes\) $+ $r.glob(SoundFX,SchemeFile))) { return $readini($shortfn($mircdirSoundFX\Schemes\) $+ $r.glob(SoundFX,SchemeFile) ,n,$1,$2) } }
alias wsfx.set { if ($3 != $null)  && ($isfile($shortfn($mircdirSoundFX\Schemes\) $+ $r.glob(SoundFX,SchemeFile))) { writeini -n $shortfn($mircdirSoundFX\Schemes\) $+ $r.glob(SoundFX,SchemeFile) $1 $2 $strip($3-,burc) } }
alias dsfx.set { if ($2 != $null)  && ($isfile($shortfn($mircdirSoundFX\Schemes\) $+ $r.glob(SoundFX,SchemeFile))) { remini $shortfn($mircdirSoundFX\Schemes\) $+ $r.glob(SoundFX,SchemeFile) $1 $2 } }
alias loadsfxscheme {
  did -ra SoundFX 121 [ $shortfn($mircdir) $+ SoundFX\Schemes\ [ $+ [ $r.glob(SoundFX,SchemeFile) ] ] ]
  did -ra SoundFX 124 $rsfx.set(Name,Name)
  did -r SoundFX 101
  if ($rsfx.set(SoundFX,DirCount) != $null) || ($rsfx.set(SoundFX,DirCount) != 0) {
    set %sfxdlgCT 1
    while (%sfxdlgCT <= $rsfx.set(SoundFX,DirCount)) {
      did -a SoundFX 101 $rsfx.set(SoundTrigs,Sound [ $+ [ %sfxdlgCT ] ] )
      inc %sfxdlgCT 1
    }
    did -c SoundFX 101 1
    if $exists( [ $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound1) ] ] ] ) { did -ra SoundFX 114 [ $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound1) ] ] ] } | else { did -ra SoundFX 114 No file set! }
    if $rsfx.set(SoundType,Sound1) == notice { did -c SoundFX 112 }
    elseif $rsfx.set(SoundType,Sound1) == action { did -c SoundFX 111 }
    else { did -c SoundFX 110 }
  }
  did -ra SoundFX 102 Triggers: $rsfx.set(SoundFX,DirCount) $chr(32) 
}
alias sfxTrigAdd {
  set %sfxtmptrig $$?="Enter a Trigger String ie:*like*teletubbies*"
  if %sfxtmptrig != $null {
    did -a SoundFX 101 %sfxtmptrig
    set %sfxtmphold $rsfx.set(SoundFX,Dircount)
    inc %sfxtmphold 1
    wsfx.set SoundFX DirCount %sfxtmphold
    wsfx.set SoundTrigs Sound [ $+ [ %sfxtmphold ] ] %sfxtmptrig
    wsfx.set SoundType Sound [ $+ [ %sfxtmphold ] ] action
    did -ra SoundFX 102 Triggers: $rsfx.set(SoundFX,DirCount) $chr(32) 
    did -c SoundFX 101 %sfxtmphold
    if $exists( [ $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) ] ] ] ) { did -ra SoundFX 114 $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) ] ] } | else { did -ra SoundFX 114 No file set! }
    if $rsfx.set(SoundType,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) == notice { did -c SoundFX 112 | did -u SoundFX 110,111 }
    elseif $rsfx.set(SoundType,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) == action { did -c SoundFX 111 | did -u SoundFX 110,112 }
    else { did -c SoundFX 110 | did -u SoundFX 111,112 }
  }
}
alias sfxTrigRem {
  set %sfxdelCT $did(SoundFX,101).sel
  set %sfxprevsel $did(SoundFX,101).sel
  set %sfxtmpTot $calc($rsfx.set(SoundFX,DirCount) - 1)
  while (%sfxdelCT <= %sfxtmpTot) {
    wsfx.set SoundTrigs Sound [ $+ [ %sfxdelCT ] ] $rsfx.set(SoundTrigs,Sound [ $+ [ $calc(%sfxdelCT + 1) ] ] )
    wsfx.set SoundType Sound [ $+ [ %sfxdelCT ] ] $rsfx.set(SoundType,Sound [ $+ [ $calc(%sfxdelCT + 1) ] ] )
    wsfx.set SoundFile Sound [ $+ [ %sfxdelCT ] ] $rsfx.set(SoundFile,Sound [ $+ [ $calc(%sfxdelCT + 1) ] ] )
    inc %sfxdelct 1
  }
  dsfx.set SoundTrigs Sound [ $+ [ $rsfx.set(SoundFX,DirCount) ] ] 
  dsfx.set SoundType Sound [ $+ [ $rsfx.set(SoundFX,DirCount) ] ] 
  dsfx.set SoundFile Sound [ $+ [ $rsfx.set(SoundFX,DirCount) ] ] 
  wsfx.set SoundFX DirCount %sfxtmpTot
  did -d SoundFX 101 $did(SoundFX,101).sel
  did -r SoundFX 114
  did -u SoundFX 110,111,112
  did -c SoundFX 101 %sfxprevsel
  if $exists( [ $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) ] ] ] ) { did -ra SoundFX 114 $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) ] ] } | else { did -ra SoundFX 114 No file set! }
  if $rsfx.set(SoundType,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) == notice { did -c SoundFX 112 | did -u SoundFX 110,111 }
  elseif $rsfx.set(SoundType,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) == action { did -c SoundFX 111 | did -u SoundFX 110,112 }
  else { did -c SoundFX 110 | did -u SoundFX 111,112 }
  did -ra SoundFX 102 Triggers: $rsfx.set(SoundFX,DirCount) $chr(32) 
  did -c SoundFX 101 $rsfx.set(SoundFX,DirCount)
  if $exists( [ $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) ] ] ] ) { did -ra SoundFX 114 $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) ] ] } | else { did -ra SoundFX 114 No file set! }
  if $rsfx.set(SoundType,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) == notice { did -c SoundFX 112 | did -u SoundFX 110,111 }
  elseif $rsfx.set(SoundType,Sound [ $+ [ $did(SoundFX,101).sel ] ] ) == action { did -c SoundFX 111 | did -u SoundFX 110,112 }
  else { did -c SoundFX 110 | did -u SoundFX 111,112 }
  unset %sfxtmpTot %sfxdelCT %sfxprevsel
}
dialog SoundFX {
  title "Sound Manager"
  size -1 -1 300 240
  option dbu

  tab "Sound Events", 1, 2 0 296 225
  tab "Triggered Sound FX", 2

  button "OK", 681, 130 227 40 12, Cancel
  button "Enable All",767,110 184 40 9, tab 1
  button "Disable All",768,150 184 40 9, tab 1

  text "Sounds will not play unless you have Sounds enabled in  mIRC options (Alt - O > Sounds).",900,10 200 280 10, tab 1 center

  box " Sound Events ",701, 4 16 290 182, tab 1
  check "Enable Startup", 702, 20 30 65 10, tab 1 ; SndOpt1 global
  check "Enable Connect", 703, 20 40 65 10, tab 1 ; SndOpt2
  check "Enable Disconnect", 704, 20 50 65 10, tab 1 ; SndOpt3
  check "Enable Your Kicked", 705, 20 60 65 10, tab 1 ; SndOpt4
  check "Enable Your Opped", 706, 20 70 65 10, tab 1 ; SndOpt5
  check "Enable Your Deopped", 707, 20 80 65 10, tab 1 ; SndOpt6
  check "Enable Your Voiced", 708, 20 90 65 10, tab 1 ; SndOpt7
  check "Enable Your Devoiced", 709, 20 100 65 10, tab 1 ; SndOpt8
  check "Enable Flood Detect", 710, 20 110 59 10, tab 1 ; SndOpt9
  check "Enable Gain Ops", 711, 20 120 65 10, tab 1 ; SndOpt10
  check "Enable Ban Set", 712, 20 130 65 10, tab 1 ; SndOpt11
  check "Enable Unban Set", 713, 20 140 65 10, tab 1 ; SndOpt12
  check "Enable Msg/Query", 714, 20 150 65 10, tab 1 ; SndOpt13
  check "Enable Invites", 715, 20 160 65 10, tab 1 ; SndOpt14
  check "Enable Dialog Changes", 716, 20 170 65 10, tab 1 ; SndOpt15
  check "Enable DCC Incoming", 717, 100 30 65 10, tab 1 ; SndOpt16
  check "Enable DCC Outgoing", 718, 100 40 65 10, tab 1 ; SndOpt17
  check "Enable DCC Receive Fail", 719, 100 50 80 10, tab 1 ; SndOpt18
  check "Enable DCC Send Fail", 720, 100 60 80 10, tab 1 ; SndOpt19
  check "Enable DCC File Ignored", 721, 100 70 80 10, tab 1 ; SndOpt20
  check "Enable Fserve Char Req", 722, 100 80 80 10, tab 1 ; SndOpt21
  check "Enable Fserve Search", 723, 100 90 80 10, tab 1 ; SndOpt22
  check "Enable Queue Full", 724, 100 100 80 10, tab 1 ; SndOpt23
  check "Enable Server Start/Stop", 725, 100 110 80 10, tab 1 ; SndOpt24
  check "Enable Netsplit", 726, 100 120 80 10, tab 1 ; SndOpt25
  check "Enable Page", 727, 100 130 80 10, tab 1 ; SndOpt26
  check "Enable Topic Change", 728, 100 140 80 10, tab 1 ; SndOpt27
  check "Enable Server Change", 729, 100 150 80 10, tab 1 ; SndOpt28
  check "Enable IP Scanning", 730, 100 160 80 10, tab 1 ; SndOpt29
  check "Enable Lockdowns", 731, 100 170 80 10, tab 1 ; SndOpt30
  check "Enable URL's", 732, 190 170 80 10, tab 1 ; SndOpt31
  check "Enable Your Joins", 733, 190 160 80 10, tab 1 ; SndOpt32
  check "Enable Nick Alert", 734, 190 150 80 10, tab 1 ; SndOpt33
  check "Enable Away/Back", 735, 190 140 80 10, tab 1 ; SndOpt34
  check "Enable Inactive Messages", 736, 190 130 80 10, tab 1 ; SndOpt35
  text "Here you can select which Invision sound events you would like to hear for the stated events. You will notice that the sounds used here in Invision are not the common sound effects found in most scripts but yet prerecorded artificial speech. I did this simply because I hate having to remember what sound means what. Especially those events that don't happen often enough. I figure this way it just flat out tells you what the heck is going on.", 59, 180 30 105 100, tab 1


  box "Current Scheme:", 123, 4 21 292 34, tab 2
  edit "", 124, 5 30 90 10, tab 2 center autohs
  check "Enable SoundFX", 800, 5 43 50 9, tab 2
  check "Hear own sounds", 999, 60 43 55 9, tab 2
  text "Max Sounds per line:", 128, 125 85 50 8, tab 2
  edit "", 129, 175 83 10 10, tab 2 center

  text "Sound Allowance (1 every", 535, 198 85 70 10, tab 2
  edit "", 536, 263 83 18 10, tab 2 center autohs
  text "sec.)", 537, 282 85 15 10, tab 2

  text "Scheme File:", 120, 102 32 35 8, tab 2
  edit "" ,121, 133 30 162 10, tab 2 autohs

  button "Merge", 118, 133 42 29 10, tab 2
  button "New", 126, 164 42 23 10, tab 2
  button "Unload",125, 189 42 23 10, tab 2
  button "Load",122, 214 42 23 10 , tab 2
  button "Delete", 127, 239 42 23 10, tab 2
  button "Archive", 119, 264 42 30 10, tab 2

  box "Triggers:", 102, 4 57 292 165, tab 2
  list 101, 5 65 80 155, tab 2
  button "Add", 103, 88 65 30 12, tab 2
  button "Rem", 104, 88 80 30 12, tab 2
  ; box "",106, 118 27 1 195
  box " Trigger Type ", 105, 125 62 170 20, tab 2
  radio "On Text", 110, 130 70 30 8, tab 2 group
  radio "On Action", 111, 172 70 35 8, tab 2
  radio "On Notice", 112, 215 70 35 8, tab 2

  text "File:", 113, 92 97 12 8, tab 2
  edit "", 114, 103 95 180 10, tab 2 autohs
  button "...", 115, 283 95 10 10, tab 2

  box "", 130, 88 106 204 114, tab 2
  text "Sound FX for Invision is an Addon that will allow you to create your own Sound Schemes much like the built in ''Xtrawav'' sounds of Invision. Once you create a scheme you can then archive it and send it to your friends as well." , 131, 95 113 193 20, tab 2
  text "To create a new scheme you start by clicking the NEW button up in the Scheme box. Enter the information as prompted. Once completed you should see the file and Scheme Name in the appropriate windows. At this point you can start to add triggers." , 132, 95 133 193 30, tab 2
  text "To create a trigger click ADD button in triggers section. It will prompt for a trigger string. This is word(s) you want to cause the sound to be heard when seen. You must have a least one wildcard in the string. Wildcards are the * charactor. For example you may want to have a sound trigger for when someone said something like ''I hate it when it rains''. For this you could create a trigger string of *hate*rain* and it would trigger on that sentence. Play around with it some and you'll get the hang of it. Once you enter the trigger string you will see it appear in the list box. You can now click on it in the listbox and set the type and sound file for it." , 133, 95 160 193 59, tab 2
}
on *:dialog:SoundFX:*:*:{
  if ( $devent == init ) {
    ;  if !$isdir( [ $shortfn($mircdir) $+ soundfx ] ) { did -h $dname 2 | w.set SoundFX Status Off | w.set SoundFX HearOwn Off } 
    var %ct = 703
    while (%ct <= 736) {
      if ($r.set(Invision, [ SndOpt [ $+ [ $calc(%ct - 701) ] ] ] ) == On) { did -c $dname %ct }
      inc %ct 1
    }
    did -ra $dname 536 $r.glob(Invision,XWav)
    if ($r.glob(Invision,SndOpt1) == On) { did -c $dname 702 }
    if $rsfx.set(Name,Name) != $null { did -ra $dname 124 $rsfx.set(Name,Name) } | else { did -ra $dname 124 None }
    if $r.set(SoundFX,MaxSFX) == $null { did -a $dname 129 2 } | else { did -a $dname 129 $r.set(SoundFX,MaxSFX) }
    loadsfxscheme
    if $r.set(SoundFX,Status) == On { did -c $dname 800 | .enable #SoundFX } | else { .disable #SoundFX }
    if $r.set(SoundFX,HearOwn) == On { did -c $dname 999 }
    if ($did($dname,800).state == 0) { did -b $dname 999 | did -u $dname 999 }
  }
  if $devent == dclick {
    if $did == 101 {
      if $exists( [ $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound [ $+ [ $did($dname,101).sel ] ] ) ] ] ] ) { splay $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound [ $+ [ $did($dname,101).sel ] ] ) ] ] }
    }
  }
  if ( $devent == sclick ) {
    click
    if $did == 800 {
      if ($did($dname,800).state == 0) { did -b $dname 999 | did -u $dname 999 }
      else { did -e $dname 999 }
    }
    if ($did == 767) { 
      var %ct = 702
      while (%ct <= 736) {
        did -c $dname %ct
        inc %ct 1
      }
    }
    if ($did == 768) {
      var %ct = 702
      while (%ct <= 736) {
        did -u $dname %ct
        inc %ct 1
      }
    }
    if $did == 800 {
      if $did($dname,800).state == 1 { w.set SoundFX Status On | .enable #SoundFX } | else { w.set SoundFX Status Off | .disable #SoundFX }
    }
    if ($did == 118) {
      set %sfxmergefile $shortfn($sfile($mircdirSoundFX\Schemes\*.ifx,Choose a scheme to merge with the current scheme:))
      if $exists(%sfxmergefile) {
        set %sfxmergeCT [ $readini %sfxmergefile SoundFX DirCount ]
        if (%sfxMergeCT != $null) && (%sfxmergeCT >= 1) {
          set %sfxAddTo $rsfx.set(SoundFX,DirCount)
          if %sfxAddTo == $null { set %sfxAddTo 0 }
          if $calc(%sfxAddTo + %sfxMergeCT) >= 1001 { set %sfxdummy $?!="Sorry but the two combined would exceed the max triggers possible!" | Halt }
          set %sfxAddCT 1
          set %sfxRealAdds 0
          while (%sfxAddCT <= %sfxMergeCT) {
            set %sfxinnerCT 1
            while (%sfxInnerCT <= %sfxAddTo) {
              if ( [ $readini %sfxmergefile SoundTrigs Sound [ $+ [ %sfxAddCT ] ] ] == $rsfx.set(SoundTrigs,Sound [ $+ [ %sfxinnerCT ] ] )) { break }
              inc %sfxinnerCT 1
            }
            if %sfxinnerCT == $calc(%sfxAddTo + 1) {
              if ( [ $readini %sfxmergefile SoundTrigs Sound [ $+ [ %sfxAddCT ] ] ] != $null) { wsfx.set SoundTrigs Sound [ $+ [ $calc(%sfxAddCT + %sfxAddTo) ] ] [ $readini %sfxmergefile SoundTrigs Sound [ $+ [ %sfxAddCT ] ] ] }
              if ( [ $readini %sfxmergefile SoundType Sound [ $+ [ %sfxAddCT ] ] ] != $null) { wsfx.set SoundType Sound [ $+ [ $calc(%sfxAddCT + %sfxAddTo) ] ] [ $readini %sfxmergefile SoundType Sound [ $+ [ %sfxAddCT ] ] ] }
              if ( [ $readini %sfxmergefile SoundFile Sound [ $+ [ %sfxAddCT ] ] ] != $null) { wsfx.set SoundFile Sound [ $+ [ $calc(%sfxAddCT + %sfxAddTo) ] ] [ $readini %sfxmergefile SoundFile Sound [ $+ [ %sfxAddCT ] ] ] }
              inc %sfxRealAdds 1
            }
            inc %sfxAddCT 1
            continue
          }
          wsfx.set SoundFX DirCount $calc(%sfxAddTo + %sfxRealAdds)
          loadsfxscheme
        }
      } 
    }
    if ($did == 119) {
      if $exists($shortfn($mircdirpkzipc.exe)) {
        write -c ziplist.tmp
        did -b $dname 119
        set %sfxzipname $replace( [ $$?="Enter a filename for the archive:" ] ,$chr(32),_,?,_,/,_,\,_,:,_,<,[,>,],$chr(124),_,$chr(42),_)
        write ziplist.tmp $shortfn($mircdir) $+ SoundFX\Schemes\ [ $+ [ $r.glob(SoundFX,SchemeFile) ] ]
        set %sfxzipCT 1
        set %sfxSchemefn  $shortfn($mircdir) $+ SoundFX\Schemes\ [ $+ [ $r.glob(SoundFX,SchemeFile) ] ] 
        while (%sfxzipCT <= $ini(%sfxSchemefn,SoundFile,0)) {
          if $exists( [ $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile, [ Sound [ $+ [ %sfxzipCT ] ] ] ) ] ] ] ) {
            write ziplist.tmp $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile, [ Sound [ $+ [ %sfxzipCT ] ] ] ) ] ]
          }
          inc %sfxzipCT 1
        }
        .run -n $shortfn($mircdir) $+ pkzipc.exe -add -path=current $shortfn($mircdir) $+ SoundFX\Archives\ [ $+ [ %sfxzipname $+ .zip ] ] @ziplist.tmp
        if $!dialog(SoundFX) != $null /dialog -t SoundFX SoundFX 1.0 for Invision - SoundFX Archive Finished! 
        .timer -o 1 4 if $!dialog(SoundFX) != $null /dialog -t SoundFX SoundFX 1.0 for Invision
        did -e $dname 119
      }
      else { set %sfxdummy $?!="Could not find ''pkzipc.exe'' in the invision main directory! This is needed to archive your schemes." }
    }  
    if ($did == 122) {
      w.glob SoundFX SchemeFile $$nopath($shortfn($sfile($mircdirSoundFX\Schemes\*.ifx,Choose a Scheme)))
      if $rsfx.set(Name,Name) != $null { did -ra $dname 124 $rsfx.set(Name,Name) } | else { did -ra $dname 124 None }
      loadsfxscheme
    }
    if ($did == 681) {
      var %ct = 703
      while (%ct <= 736) {
        if ($did($dname,%ct).state == 1) { w.set Invision [ SndOpt [ $+ [ $calc(%ct - 701) ] ] ] On } | else { w.set Invision [ SndOpt [ $+ [ $calc(%ct - 701) ] ] ] Off }
        inc %ct 1
      }
      w.glob Invision Xwav $isset($did($dname,536).text,120)
      if ($did($dname,702).state == 1) { w.glob Invision SndOpt1 On } | else { w.glob Invision SndOpt1 Off }
      if $did($dname,129).text > 10 { did -ra $dname 129 10 }
      if $did($dname,129).text < 1 { did -ra $dname 129 1 }
      w.set SoundFX MaxSFX $did($dname,129).text
      .timer -o 1 0 soundFXtable
      setsaved
    }
    if ($did == 125) {
      d.glob SoundFX SchemeFile 
      did -r $dname 101,114,124,121
      did -u $dname 110,111,112
    }
    if ($did == 127) {
      if $?!="Are you sure you want to delete this Sound Scheme?" == $true {
        if $exists( [ $shortfn($mircdir) $+ SoundFX\Schemes\ [ $+ [ $r.glob(SoundFX,SchemeFile) ] ] ] ) {
          .remove $shortfn($mircdir) $+ SoundFX\Schemes\ [ $+ [ $r.glob(SoundFX,SchemeFile) ] ] 
          d.glob SoundFX SchemeFile
          did -r $dname 101,114,124,121
          did -u $dname 110,111,112
          did -a $dname 124 None
        }
      }
    }
    if ($did == 110) {
      wsfx.set SoundType Sound [ $+ [ $did($dname,101).sel ] ] text
      did -u $dname 111,112
    }
    if ($did == 111) {
      wsfx.set SoundType Sound [ $+ [ $did($dname,101).sel ] ] action
      did -u $dname 110,112
    }

    if ($did == 112) {
      wsfx.set SoundType Sound [ $+ [ $did($dname,101).sel ] ] notice
      did -u $dname 110,111
    }
    if $did == 999 { if $did($dname,999).state == 1 { w.set SoundFX HearOwn On } | else { w.set SoundFX HearOwn Off } }
    if ($did == 126) {
      set %sfxschemefile $?="Enter an 8 aplhanumeric filename for the new scheme:" $+ .ifx
      set %sfxSchemeName $?="Please enter a name for the new sound scheme"
      writeini -n $shortfn($mircdir) $+ SoundFX\Schemes\ [ $+ [ %sfxSchemeFile ] ] Name Name %sfxSchemeName 
      w.glob SoundFX SchemeFile %sfxschemefile
      loadsfxscheme
    }
    if ($did == 115) {
      :start
      set %sfxtmpFile $shortfn($sfile($mircdirSoundFX\SndFiles\*.wav;*.mp3,Choose a sound file for this trigger))
      if ($right(%sfxtmpfile,4) != .mp3) && ($right(%sfxtmpfile,4) != .wav) { WrongFile | goto start } 
      wsfx.set SoundFile Sound [ $+ [ $did($dname,101).sel ] ] $nopath(%sfxtmpfile)
      did -ra $dname 114 %sfxtmpfile
      unset %sfxtmpfile
    }
    if ($did == 103) { sfxTrigAdd }
    if ($did == 104) { sfxTrigRem }
    if ($did == 101) {
      if $exists( [ $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound [ $+ [ $did($dname,101).sel ] ] ) ] ] ] ) { did -ra $dname 114 $shortfn($mircdir) $+ SoundFX\SndFiles\ [ $+ [ $rsfx.set(SoundFile,Sound [ $+ [ $did($dname,101).sel ] ] ) ] ] } | else { did -ra $dname 114 No file set! }
      if $rsfx.set(SoundType,Sound [ $+ [ $did($dname,101).sel ] ] ) == notice { did -c $dname 112 | did -u $dname 110,111 }
      elseif $rsfx.set(SoundType,Sound [ $+ [ $did($dname,101).sel ] ] ) == action { did -c $dname 111 | did -u $dname 110,112 }
      else { did -c $dname 110 | did -u $dname 111,112 }
    }
  }
}
alias HearOwnSFX {
  if ($1 != $null) {
    if ($1 == /me) { var %sfxtype = action }
    elseif ($1 == /notice) { var %sfxtype = notice } 
    else { var %sfxtype = text }
    if ($isfile( [ $hget(soundFX,SchemeFile) ] )) {
      set %sfxSndCount 0
      set %sfxtxtCT 1
      while (%sfxtxtCT <= $rsfx.set(SoundFX,DirCount)) { 
        if ($hget(SoundFX,Trig [ $+ [ %sfxtxtCT ] ] ) iswm $strip($1-)) && ($hget(SoundFX,Type [ $+ [ %sfxtxtCT ] ] ) == %sfxtype) { 
          if ($right( [ $hget(SoundFX,File [ $+ [ %sfxtxtCT ] ] ) ] ,4) == .wav) { 
            SoundQ $hget(SoundFX,File [ $+ [ %sfxtxtCT ] ] )
            inc %sfxSndCount 1
            if (%sfxSndCount >= $hget(SoundFX,SoundCT)) { break }
          }
          else {
            mp3Q $hget(SoundFX,File [ $+ [ %sfxtxtCT ] ] )
            inc %sfxSndCount 1
            if (%sfxSndCount >= $hget(SoundFX,SoundCT)) { break }
          }
        }
        inc %sfxtxtCT 1
      }
    }
  }
}
#SoundFX off
on *:text:*:*:{
  var %curNetwork = $iNetwork
  if ($exists( [ $hget(soundFX,SchemeFile) ] )) && (%Xtrawav [ $+ [ %curNetwork ] ] != 1) {
    set %sfxSndCount 0
    set %sfxtxtCT 1
    while (%sfxtxtCT <= $rsfx.set(SoundFX,DirCount)) { 
      if ($hget(SoundFX,Trig [ $+ [ %sfxtxtCT ] ] ) iswm $strip($1-)) {
        if ($hget(SoundFX,Type [ $+ [ %sfxtxtCT ] ] ) == text) { 
          SoundQ $hget(SoundFX,File [ $+ [ %sfxtxtCT ] ] )
          inc %sfxSndCount 1
          if (%sfxSndCount >= $hget(SoundFX,SoundCT)) { break }
          set %Xtrawav [ $+ [ %curNetwork ] ] 1
          .timer -o 1 $r.glob(Invision,Xwav) unset %xtrawav [ $+ [ %curNetwork ] ]
        }
      }
      inc %sfxtxtCT 1
    }
  }
}
on *:action:*:*:{
  var %curNetwork = $iNetwork
  if ($exists( [ $hget(soundFX,SchemeFile) ] )) && (%Xtrawav [ $+ [ %curNetwork ] ] != 1) {
    set %sfxSndCount 0
    set %sfxtxtCT 1
    while (%sfxtxtCT <= $rsfx.set(SoundFX,DirCount)) { 
      if ($hget(SoundFX,Trig [ $+ [ %sfxtxtCT ] ] ) iswm $strip($1-)) {
        if ($hget(SoundFX,Type [ $+ [ %sfxtxtCT ] ] ) == action) { 
          SoundQ $hget(SoundFX,File [ $+ [ %sfxtxtCT ] ] )
          inc %sfxSndCount 1
          if (%sfxSndCount >= $hget(SoundFX,SoundCT)) { break }
          set %Xtrawav [ $+ [ %curNetwork ] ] 1
          .timer -o 1 $r.glob(Invision,Xwav) unset %xtrawav [ $+ [ %curNetwork ] ]
        }
      }
      inc %sfxtxtCT 1
    }
  }
}
on *:notice:*:*:{
  var %curNetwork = $iNetwork
  if ($exists( [ $hget(soundFX,SchemeFile) ] )) && (%Xtrawav [ $+ [ %curNetwork ] ] != 1) {
    set %sfxSndCount 0
    set %sfxtxtCT 1
    while (%sfxtxtCT <= $rsfx.set(SoundFX,DirCount)) { 
      if ($hget(SoundFX,Trig [ $+ [ %sfxtxtCT ] ] ) iswm $strip($1-)) {
        if ($hget(SoundFX,Type [ $+ [ %sfxtxtCT ] ] ) == notice) { 
          SoundQ $hget(SoundFX,File [ $+ [ %sfxtxtCT ] ] )
          inc %sfxSndCount 1
          if (%sfxSndCount >= $hget(SoundFX,SoundCT)) { break }
          set %Xtrawav [ $+ [ %curNetwork ] ] 1
          .timer -o 1 $r.glob(Invision,Xwav) unset %xtrawav [ $+ [ %curNetwork ] ]
        }
      }
      inc %sfxtxtCT 1
    }
  }
}
#SoundFX End
on *:LOAD:{ if $r.glob(SoundFX,SchemeFile) == $null { w.glob SoundFX SchemeFile default.ifx } }
on *:EXIT:{ unset %sfx* }
alias SoundFXtable {
  var %ct = 1
  var %tot = $iif($rsfx.set(SoundFX,DirCount) >= 1,$rsfx.set(SoundFX,DirCount),0)
  hfree -w soundFX
  hmake soundFX 50
  while (%ct <= %tot) {
    var %trig = $rsfx.set(SoundTrigs,Sound [ $+ [ %ct ] ] )
    var %type = $rsfx.set(SoundType,Sound [ $+ [ %ct ] ] )
    var %file = $shortfn($mircdir) $+ SoundFX\SndFiles\ $+ $rsfx.set(SoundFile,Sound [ $+ [ %ct ] ] )
    hadd soundFX Trig [ $+ [ %ct ] ] %trig
    hadd soundFX Type [ $+ [ %ct ] ] %type
    hadd soundFX File [ $+ [ %ct ] ] %file
    inc %ct 1
  }
  hadd soundFX SoundCT $r.set(SoundFX,MaxSFX)
  hadd soundFX SchemeFile $shortfn($mircdir) $+ SoundFX\Schemes\ $+ $r.glob(SoundFX,Schemefile)
}
alias FSMHelp {
  if $dialog(InvisFserve).title != $null {
    var %tab = $dialog(InvisFserve).tab
    if %tab == 1 {
      if $1 > 340 && $2 < 285 {
        did -ra InvisFserve 1502 Advertising Channels is where you add all the channels you intend to serve files in. You enter a channel by typing the channel name (including the #) into the upper box above the listbox. Once you have it typed in then click the 'Add' button to enter it into the list. To remove a channel from the list first select it in the list then click the 'Rem' button to remove it. Note: Changes do not take effect until you hit either APPLY or OK buttons at the bottom.  The numbers shown in brackets following the channel names in the list represent which triggers that are active for it.
        halt
      }
      if $1 < 121 && $2 < 97 {
        did -ra InvisFserve 1502 Max Sends Settings effect how many simultaneous dcc sends the queue will allow. I say queue will allow because manual sends, InstaSends, and other servers running may end up allowing more then what is set here. The 'Each' box refers to how many Sends each user can be receiving at a given moment. 'Total' refers to how many total sends at any given moment.
        halt
      }
      if $1 > 121 && $1 < 224 &&  $2 < 97 {
        did -ra InvisFserve 1502 Max Queues Settings effect how many queues are allowed. Only Manually queuing or queuing by another server (mp3, tdcc, etc.) can produce more queues then set here. The 'Each' box refers to how many queues each user can be receiving at a given moment. 'Total' refers to how many total queues at any given moment.
        halt
      }
      if $1 > 224 && $1 < 340 && $2 < 73 {
        did -ra InvisFserve 1502 Max Users setting dictates the maximum amount of people that can have a a fserve session open at a given time. Each user can only have one fserve session at a time so this effects how many total sessions between all users combined.
        halt
      }
      if $1 > 224 && $1 < 340 && $2 > 75 && $2 < 93 {
        did -ra InvisFserve 1502 Ad Delay setting is what you might guess it to be. It is the interval time in minutes that the Fserve Ad will be broadcasted to the channels you are serving in. If you have the 'Run Server with no Ad' option enabled then of course this has no effect since no Ad is running.  
        halt
      }
      if $2 > 97 && $2 < 192 && $1 < 341 {
        if $1 > 16 && $1 < 169 {
          if $2 < 112 {
            did -ra InvisFserve 1502 Anti Get Script feature will cause the File server to implement techniques in effort to foil those using automation scripts for downloading files from your Fserve. This is a relatively new feature is not quite perfected yet but it should help some if really don't like people using scripts like that to get files from you.
            halt
          }
          if $2 > 118 && $2 < 133 {
            did -ra InvisFserve 1502 File Server Chat will allow users to communicate with you that are on the Files Server. When a user types normal text (non fserve command) it will cause a chat box to appear (if one is not already open) to where you can talk back with them. 
            halt
          }
          if $2 > 137 && $2 < 156 {
            did -ra InvisFserve 1502 Announce open slots will cause your File Server to announce in the channels you are serving in to display an mini ad any time a slot opens up on the fserve. 
            halt
          }
          if $2 > 157 && $2 < 173 {
            did -ra InvisFserve 1502 Auto Start on connect will automatically start the fserve upon connection to an irc server. You should note that if you do not manually (or by the scheduler timer) turn the file server off it will remain on even the next time you start invision up. It stays on untill you 'stop' it.
            halt
          }
          if $2 > 178 && $2 < 192 {
            did -ra InvisFserve 1502 !Search/@Find This will allow your file server to respond to search requests !Search <search text> , @find <search text>, or @locator <search text> commands made by users either in a channel you are serving in or via /ctcp command (and they are in a channel that is in the serving list) 
            halt
          }
        }
        if $1 > 168 && $1 < 340 {
          if $2 < 112 {
            did -ra InvisFserve 1502 Anti-Camp will work to stop users from 'camping' on your fserve. Camping is what is referred to when someone just idles on your fserve occupying a slot and not really doing anything other then that. This option will boot those that spend an excessive amount of time on the fserve.
            halt
          }
          if $2 > 118 && $2 < 133 {
            did -ra InvisFserve 1502 CTCP Triggers only mode will force the Fserve to respond only to those sent via /ctcp and not those issued publicly in a channel. The CTCP check boxes in each trigger set up on the triggers tab do not need to be checked when using this option. The check boxes for CTCP next to each trigger set up is to allow ctcp triggers optionally in addition to the public text triggers.
            halt
          }
          if $2 > 137 && $2 < 156 {
            did -ra InvisFserve 1502 Cloneguard works to stop people from using clones to gain more personal queue slots on your fserve. This has been a problem for some with people wanting more queues and then using clones to obtain them. 
            halt
          }
          if $2 > 157 && $2 < 173 {
            did -ra InvisFserve 1502 This allows your file server to send an Ad via /notice to anyone who issues a ''!list'' command in a channel or via ctcp if so allowed. This is usually used when don't want to make people wait for the timer to go off or if you are not running an Ad in the first place to reduce channel clutter.
            halt
          }
          if $2 > 178 && $2 < 192 {
            did -ra InvisFserve 1502 Run with no Ad allows you to run the fserve without having pubic ad running on the time delay set above. Some channels request this in an effort to keep the channel cleaner and more usuable for other purposes.
            halt
          }
        }
      }
      if $2 > 197 && $2 < 298 && $1 < 341 {
        if $2 < 214 {
          did -ra InvisFserve 1502 Cache Directory Indexes for Searching will allow you to cache the file server directories in order to give a HUGE perfomance gain in the area of answering !Search/@Find/@Locator requests especially when using mapped network drives to serve from. This method is much faster then older conventional ways and is recommended. After you have setup all your triggers and their directories, be sure to return here and click the 'Build All' button to update the search cache when using this option.
          halt
        }
        if $2 > 217 && $2 < 235 {
          did -ra InvisFserve 1502 Auto Rebuild Indexes will cause the Search Cache to be automatically rebuilt at the interval you specify in the box. This is handy if you are sharing an Incoming/Upload directory where the content is ever changing. Enter the interval you want in minutes into the box.
          halt
        }
        if $2 > 241 && $2 < 257 {
          did -ra InvisFserve 1502 InstaSend is a feature that allows you to send files to users instantly when requested that fall below the filesize you have entered in the box (in bytes). This prevents users from taking up an entire queue slot (or simply having to wait) for just one small file such as a .nfo, .diz, or maybe even a small text file. Files sent by this feature are always sent with no bandwidth limitations, meaning if you are capping the speed of the server (in DCC Manager) these small files are sent unaffected by that limit and transfer as fast as possible. 
          halt
        }
        if $2 > 263 && $2 < 278 {
          did -ra InvisFserve 1502 SizeGuard is a feature that allows you to place a maximum file size on files that will qualify to be sent and/or queued in the file server. The purpose of this is to allow you to prevent people from queuing or downloading larger files that might take a long time then you want people to. For example, you might 'unpack' a cd image to burn it right into a directory that is currently being served for the purpose of you burning it. If SizeGuard was on and set to say 40,000,000 and the image was say 550MB then it would be protected from user 'GET' commands.
          halt
        }
        if $2 > 281 {
          did -ra InvisFserve 1502 Remote Control allows you (or anyone else you authorize) to remotely STARTUP, SHUTDOWN, and CLOSE the Fserve. To use this the user that is sending the remote commands must be in the user list as a friend or higher with the flag set and also know the current password you have set here in the password box. To setup a user add them to the user lists as a friend, fellow op, or elite. Then open the User Lists Manager. Find them in the listbox and selct them. In the lower left channels box select 'Default' and then check the flag 'Remote Fserve Ctrl' and hit APPLY. 
          halt
        }
      }
      if $2 > 302 && $2 < 383 {
        did -ra InvisFserve 1502 Ad Options is where you can select options and enter the MOTD for your Fserve Advertisement. 'Verbose Ad' when checked will show a full Ad, unchecked you will get a more brief ad showing only essential info like open slots, sends, and queues. By default this is checked. 'Include Current BW" will show the current bandwidth every time the ad appears. "Include Avg Queue Time' will show the current Average Queue Time wait in the ad everytime it appears. The 2-line ad option causes the MOTD to appear on its own ad line allowing for a much larger MOTD. 
        halt
      }
      if $2 > 386 && $2 < 412 {
        did -ra InvisFserve 1502 The Terms File is the file that is display to a user when they type 'terms' during a fserve session. It allows you to imply terms of use without automatically sending them to a user everytime they log into the fserve. If you want the terms sent automatically every time at login then you need to use the Welcome file instead located on the triggers tab.
        halt
      }
    }
    if %tab == 2 {
      ; did -ra InvisFserve 1502 X: $1      Y: $2 | Halt
      if $2 > 260 {
        did -ra InvisFserve 1502 The Top Most Requested list is shown here. This list shows you what the most popular requests are helping you with decisions when it come time to make disk room. You can adjust the type and amount of records to keep above to the left.
        halt
      }
      if $1 < 325 && $2 < 250 {
        did -ra InvisFserve 1502 The Stats area shows you relative stats to the File Server. These stats may also reflect usage stats of other servers (mp3, tdcc, etc.) and/or the combined results of them. The buttons to Reset them are to the right. 
        halt
      }
      if $1 > 249 && $2 < 199 {
        did -ra InvisFserve 1502 The Reset Stats buttons are to reset the stats that you see to the left. These stats appear in the server ads as well as here. The Resets are instant and can not be undone 
        halt
      }
      if $1 > 249 && $2 < 251 {
        did -ra InvisFserve 1502 This is where you can change the way your 'Most Top Requested' records work. You can choose whether to track directories (usually preferred when serving from File Server and serving disk images are large files that are in parts like rar files) or you can track individual files (usually prefered when you serve single large files like .bin/.cue files or mp3's, avi etc.). You can also select how many to track. I don't recommend tracking more then 20 or performance will suffer greatly usually. 5 is default.
        halt
      }
    }
    if %tab == 6 {
      ; did -ra InvisFserve 1502 X: $1      Y: $2 | Halt
      if ($2 < 107) { var %ttrig = 1 }
      elseif ($2 > 125) && ($2 < 184) { var %ttrig = 2 }
      elseif ($2 > 203) && ($2 < 264) { var %ttrig = 3 }
      elseif ($2 > 283) && ($2 < 348) { var %ttrig = 4 }
      else { var %ttrig = 5 }
      if ($2 < $calc(((%ttrig - 1) * 80) + 54)) {
        if ($1 < 92) { did -ra InvisFserve 1502 Check the box here to enable Trigger # $+ %ttrig $+ . Once enabled This trigger will show up in ads where intended and will be responded to when called. }
        elseif (($1 > 101) && ($1 < 148)) { did -ra InvisFserve 1502 Click here to open the Channels Dialog where you can set which channels (out of the ones you entered in the channels box on the Setup Tab) trigger %ttrig will be active in. As you might have guessed... you must have specified channels and not be in 'All Channels' mode to use this. }
        elseif (($1 > 155) && ($1 < 226)) { did -ra InvisFserve 1502 Click here to Rebuild the Search Index Files for just this trigger anytime you have made a change to the Root Directory for this trigger. You only need to do this if you are using the 'Use Cached Indexes for Searching' feature found on the Setup Tab. }
        elseif (($1 > 234) && ($1 < 436)) { did -ra InvisFserve 1502 Here you will enter what you want the word or phrase to be for Trigger %ttrig $+ . You can use phrases if you wish but there are some restrictions. While Spaces, Letters, and numbers are all acceptable.. most all other characters are too including color codes. There are a few characters that are not acceptable however. }
        elseif (($1 > 449) && ($1 < 492)) { did -ra InvisFserve 1502 This little button here will change what you have currently in the trigger box and make it appear in asc type. So you can trick people into thinking you are cool :) }
        else { did -ra InvisFserve 1502 You can check this box if you wish to also allow the trigger to be sent via /CTCP to you in addition to in channel text. This does not need to be checked when you are running in CTCP only mode found on the Setup Tab. }
        halt
      }
      elseif ($2 > $calc(((%ttrig - 1) * 80) + 94)) {
        if ($1 < 475) {
          did -ra InvisFserve 1502 Here you can set the Welcome File for trigger %ttrig  that is displayed when a person first connects to the File Server Using this trigger. 
          halt
        }
        if ($1 > 480) { 
          did -ra InvisFserve 1502 The access Options will allow you to select which users can access certain triggers. If you select ALL this will allow all nicks to access that certain trigger. If you select Voices Only VOICED and OPS will be able to access that certain trigger. If you Select Ops Only OPS will be able to access that certain trigger. If the nicks status is not high enough to access the certain trigger they get a notice saying that trigger is restricted to OP / Voices.
          halt
        }
      }
      else {
        if ($1 < 475) {
          did -ra InvisFserve 1502 Here you can set the Root Directory for trigger %ttig $+ . This will be the directory people have access to as well as all sub directories of it when they use the trigger and a fserve session is established. Never set this to the root of your drive where windows is installed or Windows directory itself. 
          halt
        }
        if ($1 > 480) { 
          did -ra InvisFserve 1502 The access Options will allow you to select which users can access certain triggers. If you select ALL this will allow all nicks to access that certain trigger. If you select Voices Only VOICED and OPS will be able to access that certain trigger. If you Select Ops Only OPS will be able to access that certain trigger. If the nicks status is not high enough to access the certain trigger they get a notice saying that trigger is restricted to OP / Voices.
          halt
        }
      }
    }
    if %tab == 7 {
      did -ra InvisFserve 1502 Time settings must be entered in 24hour format. For example, if you wanted to have the File Server start at say 10:00pm you would enter 22:00 for the time. If you want it to shutdown at 4:00am you would enter 04:00.. Bandwidth is for Total Server Bandwidth (not individual Send speeds) and must be entered in CPS.
      halt
    }
  }
  if $dialog(InvisFserve).title != $null { did -ra InvisFserve 1502 Move the mouse over the item you wish to know more about. }
}
