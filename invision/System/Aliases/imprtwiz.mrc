; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: imprtwiz.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: The Import Routines
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
importwiz {
  echo -s 4############################################################### 
  echo -s 4#       13IN THE EVENT THERE IS AN ERROR DURING THE IMPORTING YOUR BEST CHANCE TO       
  echo -s 4#       13RECOVER WITHOUT LOSING THE IMPORTED SETTINGS IS TO MANUALLY START            
  echo -s 4#       13ANOTHER INSTANCE OF INVISION 2 IGNORING THE WARNINGS, THEN COME BACK         
  echo -s 4#       13TO THIS CLIENT AND SHUT IT DOWN, THEN GO TO THE NEW CLIENT THAT YOU                 
  echo -s 4#       13MANUALLY OPENED AND SHUT IT DOWN. THEN RESTART INVISION 2.                              
  echo -s 4############################################################### 
  unset %imp*
  set %impList $shortfn($mircdir) $+ invision\implist.ini
  ImpWiz Starting Import...
  Implog ############# Starting Import Wizard $time(dddd mmmm dd h:nntt) #################
  :start
  set %impmdir $sdir(C:\,: $chr(32) $chr(32) Navigate to the Main Directory of script to import from where the mirc.exe and mirc.ini file is located please:) 
  var %iwchkdir = %impmdir $+ mirc.ini
  if $exists( [ %iwchkdir ] ) != $true { var %dummy = $popinfo(No mIRC.ini found!,No mIRC.exe could be found in the directory [ %impmdir ] . Please choose a directory where the mirc.exe of your old script is located) | if %dummy != $false { goto Start } | else { Halt } }   
  if $exists( [ [ %impmdir ] $+ invision\ ] ) { 
    if $exists( [ [ %impmdir ] $+ invision\Settings\SettingsInvision.i2s ] ) {
      %script = i2
      %impscript = i2
      var %keepbuild = $r.static(Script,Build)
      ImpWiz Detected Script as i2
      ImpLog **** Detected Script as Invision $r.static(Script,Version) (i3 type) ****
      Goto NewSystem
    }
    ; ************ IF SYSTEM IS i2 THEN IT WILL JUMP FROM HERE TO LABEL NewSystem *******************
    if $exists( [ [ %impmdir ] $+ info.dll ] ) { var %imptmpfn = [ [ %impmdir ] $+ info.dll ] } | else { var %imptmpfn = [ [ %impmdir ] $+ invision\settings.ini ] }
    if $exists( [ %imptmpfn ] ) {
      var %script = $readini(%imptmpfn,n,Script,Logo)
      var %version = $readini(%imptmpfn,n,Script,Version)
      var %build = $readini(%imptmpfn,n,Script,Build)
      if %build == $null { set %impScript Invision1 } | else { set %impScript Invision2 | set %impBuild %build } 
      set %impVersion %version
      var %file = %impmdir $+ invision\settings.ini
      if $exists( [ %file ] ) { set %impSetFile %file } | else { dummy = $popinfo(Error,Encountered a major error: Detected script as Invision but could not locate the Settings.ini file where it should be located! Cannot continue.) | unset %imp* | halt }
    }
  }
  elseif $exists( [ [ %impmdir ] $+ polaris.bmp ] ) || (polaris isin %impmdir) || $exists( [ %impmdir [ $+ [ info.dll ] ] ] ) {
    if $exists( [ [ %impmdir ] $+ info.dll ] ) { 
      set %tmpfile %impmdir $+ info.dll
      if Polaris isin $readini(%tmpfile,n,Script,Logo) { set %impScript Polaris }
      if Ë×Çü®§îöñ isin $readini(%tmpfile,n,Script,Logo) { set %impScript Excursion }
    }
  }
  ImpWiz Detected Script as %impscript %impversion
  ImpLog **** Detected Script as %impscript %impversion ****
  ; >>>>>>>>>>> Was there a script detected???
  if %impscript != $null {
    if %impScript == Polaris || %impScript == Excursion { set %impSetFile [ %impmdir $+ docs\settings.ini ] }
    if $exists( [ %impSetFile ] ) {
      var %ltot = $ini(%implist,polaris,0)
      var %lct = 1
      while (%lct <= %ltot) {
        var %vname = $ini(%implist,polaris,%lct)
        if $left(%vname,1) == e { ImpWiz $readini( [ %implist ] ,n,polaris,%vname) | inc %lct 1 | continue }
        var %istr = $readini(%implist,n,polaris,%vname)
        var %dtopic = $gettok(%istr,1,44)
        var %ditem = $gettok(%istr,2,44)
        var %stopic = $gettok(%istr,3,44)
        var %sitem = $gettok(%istr,4,44)
        var %desc = $gettok(%istr,5,44)
        ImpWiz Importing %desc
        if $readini(%impSetFile,n,%stopic,%sitem) != $null { w.set %dtopic %ditem $readini( [ %impSetFile ] ,n,%stopic,%sitem) }
        else { implog Feature previously not used: %desc | ImpWiz ***Feature previously not used: %desc }
        inc %lct 1
      }
    }
    else {
      Error cant find settings.ini! Canceling Import 
    }
    ImpWiz Converting Auto Joins to Channel Central Auto Joins
    var %impmircini = $nofile(%impmdir) $+ mirc.ini
    var %tmpXct = 1
    var %CurN = $ini(%impmircini,chanFolder,0)
    while (%tmpXct <= $ini(%impSetFile,Auto.Join,0)) { 
      var %vname = $ini(%impSetFile,Auto.Join,%tmpXct)
      if %vname == Networks || %vname == Status { inc %tmpXct 1 | continue }
      unset %vnet
      if Relic isin %vname { var %vnet = Relicnet }
      if Dal isin %vname { var %vnet = Dalnet }
      if Under isin %vname { var %vnet = Undernet }
      var %inCT = 1
      var %vstr = $readini(%impSetFile,n,Auto.Join,$ini(%impSetFile,Auto.Join,%tmpXct))
      while (%inCT <= $numtok(%vstr,44)) {
        var %atplace = n $+ %curN
        var %chstr = $gettok($gettok(%vstr,%inCT,44),1,32) $+ , $+ "Imported by Invision" $+ , $+ $gettok($gettok(%vstr,%inCT,44),2,32) $+ , $+ %vnet $+ ,1
        if %atplace != $null && %chstr != $null { writeini -n mirc.ini chanfolder %atplace %chstr }
        inc %CurN 1
        inc %inCT 1
      }
      inc %tmpXct 1
      continue
    }
  }
  ; ########################  If either importing from Invision1 or 2 perform |vvv|
  if %impScript == Invision1 || %impScript == Invision2 {
    if $exists( [ %impSetFile ] ) {
      var %ltot = $ini(%implist,invision1,0)
      var %lct = 1
      while (%lct <= %ltot) {
        var %vname = $ini(%implist,invision1,%lct)
        if $left(%vname,1) == e { ImpWiz $readini(%implist,n,polaris,%vname) | inc %lct 1 | continue }
        var %istr = $readini(%implist,n,invision1,%vname)
        var %dtopic = $gettok(%istr,1,44)
        var %ditem = $gettok(%istr,2,44)
        var %stopic = $gettok(%istr,3,44)
        var %sitem = $gettok(%istr,4,44)
        var %desc = $gettok(%istr,5,44)
        ImpWiz Importing %desc
        if $readini(%impSetFile,n,%stopic,%sitem) != $null { w.set %dtopic %ditem $readini(%impSetFile,n,%stopic,%sitem) }
        else { implog Feature previoulsy not used: %desc | ImpWiz ***Feature previoulsy not used: %desc }
        inc %lct 1 
      }
    }
    ; ############ Series Imports ############
    ImpWiz Importing Event Sound Configuration
    var %tmpXct = 1
    while (%tmpXct <= 35) {
      if $readini(%impSetFile,n,Invision,SndOpt [ $+ [ %tmpXct ] ] ) != $null { w.set Invision [ SndOpt [ $+ [ %tmpXct ] ] ] $readini(%impSetFile,n,Invision, [ SndOpt [ $+ [ %tmpXct ] ] ] ) } | else { implog Failed to import the Sound Option # $+ %tmpXct Setting. }
      inc %tmpXct 1
    }
    ImpWiz Importing Recent Servers
    var %tmpXct = 1
    while (%tmpXct <= 8) {
      if $readini(%impSetFile,n,Invision,Recent.Server. [ $+ [ %tmpXct ] ] ) != $null { w.glob Invision Recent.Server. [ $+ [ %tmpXct ] ] $readini(%impSetFile,n,Invision,Recent.Server. [ $+ [ %tmpXct ] ] ) } | else { implog Failed to import Server History # $+ %tmpXct Setting. }
      inc %tmpXct 1
    }
    ; ############  COMPLETE FILE COPYING ############
    ImpWiz Copying File Server Leech Records...
    if ($exists( [ [ %impmdir ] $+ invision\ $+ NickRec.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ invision\ $+ NickRec.ini $shortfn($mircdir) $+ invision\NickRec.ini } | else { implog Could not import File Server Leech Records (not the same as File Server Stats). }
    if ($exists( [ [ %impmdir ] $+ invision\ $+ Records.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ invision\ $+ Records.ini $shortfn($mircdir) $+ invision\Records.ini } | else { implog Could not import File Server Directory Records (not the same as File Server Stats). }
    ImpWiz Copying Users Set Passwords
    if ($exists( [ [ %impmdir ] $+ invision\ $+ fpw.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ invision\ $+ fpw.ini $shortfn($mircdir) $+ invision\fpw.ini } | else { implog Could not import FPW. }
    ImpWiz Copying Auto Greets
    if ($exists( [ $nofile(%impmdir) $+ invision\ $+ Autogreets.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ invision\ $+ Autogreets.ini $shortfn($mircdir) $+ invision\Autogreets.ini } | else { implog Could not import Auto greet msgs. | ImpWiz ***Failed to Import Auto Greet Messages. }
    aecho Importing File Server Tracker Records...
    if ($exists( [ [ %impmdir ] $+ FStrk\FSTrec.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ FStrk\FSTrec.ini $shortfn($mircdir) $+ FStrk\FSTrec.ini } | else { implog Could not import FS Tracker settings. }
    if ($exists( [ [ %impmdir ] $+ FStrk\FSTset.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ FStrk\FSTset.ini $shortfn($mircdir) $+ FStrk\FSTset.ini } | else { implog Could not import FS Tracker settings. }
    if ($findfile( [ [ %impmdir ] $+ FStrk\Records ] ,*.log,0) >= 1) { .timer -o 1 0 .copy -o %impmdir $+ FStrk\Records\*.* $shortfn($mircdir) $+ FStrk\Records\ } | else { implog Could not import FS Tracker Records. }
    if $input(Import your Log files?,136,Import Logs?) == $true {
      if $findfile( [ [ %impmdir ] $+ logs ] ,*.log,0) { .timer -o 1 0 .copy -o %impmdir $+ logs\*.log $shortfn($mircdir) $+ logs\ }
      else { implog Found no log files to import | ImpWiz ***Could not find any log files to copy over. }
    }
  }
  ; >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  If importing from Invision 2 perform |vvv|
  if %impScript == Invision2 {
    if $exists( [ %impSetFile ] ) {
      var %ltot = $ini(%implist,invision2,0)
      var %lct = 1
      while (%lct <= %ltot) {
        var %vname = $ini(%implist,invision2,%lct)
        if $left(%vname,1) == e { Impwiz $readini(%implist,n,polaris,%vname) | inc %lct 1 | continue }
        var %istr = $readini(%implist,n,invision2,%vname)
        var %dtopic = $gettok(%istr,1,44)
        var %ditem = $gettok(%istr,2,44)
        var %stopic = $gettok(%istr,3,44)
        var %sitem = $gettok(%istr,4,44)
        var %desc = $gettok(%istr,5,44)
        ImpWiz Importing %desc
        if $readini(%impSetFile,n,%stopic,%sitem) != $null { w.set %dtopic %ditem $readini(%impSetFile,n,%stopic,%sitem) }
        else { implog Feature previoulsy not used: %desc | ImpWiz ***Feature previoulsy not used: %desc }
        inc %lct 1 
      }
    }
    ; ********************************************************************
    ; **     New i2 Importing 
    ; ********************************************************************
    :newsystem
    if %impscript == i2 {
      Impwiz Copying Main Settings...
      ;  if $findfile( [ [ %impmdir ] $+ invision\settings\ ] ,*.i2s,0) { .timer -o 1 0 .copy -o %impmdir $+ invision\settings\*.i2s $shortfn($mircdir) $+ invision\settings\ }
      .timer -o 1 0 .run -n xcopy /e /c /q /y " $+ %impmdir $+ invision\settings\*.* $+ " $shortfn($mircdir) $+ invision\settings\. 
      ImpWiz Copying Script Data...
      ;  if $findfile( [ [ %impmdir ] $+ invision\ ] ,*.i2d,0) { .timer -o 1 0 .copy -o %impmdir $+ invision\*.i2d $shortfn($mircdir) $+ invision\ }

      ImpWiz Copying Users Set Passwords
      if ($exists( [ [ %impmdir ] $+ invision\ $+ fpw.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ invision\ $+ fpw.ini $shortfn($mircdir) $+ invision\fpw.ini } | else { implog Could not import FPW. }
      ImpWiz Copying Auto Greets
      if ($exists( [ [ $nofile(%impmdir) ] $+ invision\ $+ Autogreets.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ invision\ $+ Autogreets.ini $shortfn($mircdir) $+ invision\Autogreets.ini } | else { implog Could not import Auto greet msgs. | ImpWiz ***Failed to Import Auto Greet Messages. }
      aecho Importing File Server Tracker Records...
      if ($exists( [ [ %impmdir ] $+ FStrk\FSTrec.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ FStrk\FSTrec.ini $shortfn($mircdir) $+ FStrk\FSTrec.ini } | else { implog Could not import FS Tracker settings. }
      if ($exists( [ [ %impmdir ] $+ FStrk\FSTset.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ FStrk\FSTset.ini $shortfn($mircdir) $+ FStrk\FSTset.ini } | else { implog Could not import FS Tracker settings. }
      if ($findfile( [ [ %impmdir ] $+ FStrk\Records ] ,*.log,0) >= 1) { .timer -o 1 0 .copy -o %impmdir $+ FStrk\Records\*.* $shortfn($mircdir) $+ FStrk\Records\ } | else { implog Could not import FS Tracker Records. }
      if $input(Import your Log files?,136,Import Logs?) == $true {
        if $findfile( [ [ %impmdir ] $+ logs ] ,*.log,0) { .timer -o 1 0 .copy -o %impmdir $+ logs\*.log $shortfn($mircdir) $+ logs\ }
        else { implog Found no log files to import | ImpWiz ***Could not find any log files to copy over. }
      }
      if $findfile( [ [ %impmdir ] $+ Addons ] ,*.*,0) { .timer -o 1 0 .run -n xcopy /e /c /q /y " $+ %impmdir $+ Addons\*.* $+ " $shortfn($mircdir) $+ Addons\.  }
      else { implog Found no files in Addons directory to import | ImpWiz ***Could not find any files in Addons Directory to copy over. }
      .timer -o 1 0 .run -n xcopy /e /c /q /y " $+ %impmdir $+ invision\themes\*.* $+ " $shortfn($mircdir) $+ invision\themes\. 
      if $isdir( [ [ %impmdir ] $+ SoundFX ] ) { .mkdir $shortfn($mircdir) $+ SoundFX | .timer -o 1 0 .run -n xcopy /e /c /q /y " $+ %impmdir $+ SoundFX\*.* $+ " $shortfn($mircdir) $+ SoundFX\. }
    }
    ImpWiz Importing Font Settings
    var %tmpXct = 1
    while (%tmpXct <= $ini(%impmircini,fonts,0)) {
      if $readini(%impmircini,fonts,$ini(%impmircini,fonts,%tmpXct)) != $null { writeini -n mirc.ini fonts $ini(%impmircini,fonts,%tmpXct) $readini(%impmircini,fonts,$ini(%impmircini,fonts,%tmpXct)) }
      inc %tmpXct 1
    }
    ImpWiz Importing Color Settings (mIRC Colors)
    var %tmpXct = 1
    while (%tmpXct <= $ini(%impmircini,colours,0)) {
      if $readini(%impmircini,colours,$ini(%impmircini,colours,%tmpXct)) != $null { writeini -n mirc.ini colours $ini(%impmircini,colours,%tmpXct) $readini(%impmircini,colours,$ini(%impmircini,colours,%tmpXct)) }
      inc %tmpXct 1
    }
    ; ############  COMPLETE FILE COPYING ############
    ImpWiz Importing The User Lists
    set %impUSR %impmdir $+ system\users.ini
    if $exists( [ %impUSR ] ) { .copy -o %impUSR $shortfn($mircdir) $+ System\users.ini } | else { implog Could not import old User Lists. }
    if ($exists( [ [ %impmdir ] $+ invision\ $+ botcmds.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ invision\ $+ botcmds.ini $shortfn($mircdir) $+ invision\botcmds.ini } | else { implog Could not import the Custom Bot Commands. }
    if ($exists( [ [ %impmdir ] $+ invision\ $+ chanset.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ invision\ $+ chanset.ini $shortfn($mircdir) $+ invision\chanset.ini } | else { implog Could not import the Chan Ops Settings. }
    if ($exists( [ [ %impmdir ] $+ invision\ $+ Acroman.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ invision\ $+ Acroman.ini $shortfn($mircdir) $+ invision\Acroman.ini } | else { implog Could not import the Acromancer Settings. }
    if ($exists( [ [ %impmdir ] $+ invision\ $+ XDCC.ini ] )) { .timer -o 1 0 .copy -o %impmdir $+ invision\ $+ XDCC.ini $shortfn($mircdir) $+ invision\settings\XDCC.ini } | else { implog Could not import the XDCC Pack Settings. }
  }
  ; ******************************************************************
  ; **                                 Standard mIRC Stuff                                              **
  ; ******************************************************************
  set %impmircini %impmdir $+ mirc.ini
  if $exists( [ %impmircini ] ) {
    var %ltot = $ini(%implist,Mirc,0)
    var %lct = 1
    while (%lct <= %ltot) {
      var %vname = $ini(%implist,Mirc,%lct)
      if $left(%vname,1) == e { ImpWiz $readini(%implist,polaris,%vname) | inc %lct 1 | continue }
      if $right(%vname,-1) <= 29 && %impScript !=  Invision2 { inc %lct 1 | continue }
      var %istr = $readini(%implist,n,Mirc,%vname)
      var %dtopic = $gettok(%istr,1,44)
      var %ditem = $gettok(%istr,2,44)
      var %stopic = $gettok(%istr,3,44)
      var %sitem = $gettok(%istr,4,44)
      var %desc = $gettok(%istr,5,44)
      ImpWiz Importing %desc
      if $readini(%impmircini,n,%stopic,%sitem) != $null { .writeini mirc.ini %dtopic %ditem $readini(%impmircini,n,%stopic,%sitem) }
      else { implog Feature previoulsy not used: %desc | ImpWiz ***Feature previoulsy not used: %desc }
      inc %lct 1
    }

    ; #################    Special Settings  ####################
    ImpWiz Importing Window Positions
    set %impmircini %impmdir $+ mirc.ini
    var %tmpXct = 1
    while (%tmpXct <= $ini(%impmircini,windows,0)) {
      if $readini(%impmircini,windows,$ini(%impmircini,windows,%tmpXct)) != $null { writeini -n mirc.ini windows $ini(%impmircini,windows,%tmpXct) $readini(%impmircini,windows,$ini(%impmircini,windows,%tmpXct)) }
      inc %tmpXct 1
    }
    ImpWiz Importing iRC Perform Actions
    var %tmpXct = 1
    while (%tmpXct <= $ini(%impmircini,perform,0)) {
      if $readini(%impmircini,perform,$ini(%impmircini,perform,%tmpXct)) != $null { writeini -n mirc.ini perform $ini(%impmircini,perform,%tmpXct) $readini(%impmircini,perform,$ini(%impmircini,perform,%tmpXct)) }
      inc %tmpXct 1
    }
    ImpWiz Importing iRC Event Settings
    var %tmpXct = 1
    while (%tmpXct <= $ini(%impmircini,events,0)) {
      if $readini(%impmircini,events,$ini(%impmircini,events,%tmpXct)) != $null { writeini -n mirc.ini events $ini(%impmircini,events,%tmpXct) $readini(%impmircini,events,$ini(%impmircini,events,%tmpXct)) }
      inc %tmpXct 1
    }
    ImpWiz Importing iRC Highlight Actions
    var %tmpXct = 1
    while (%tmpXct <= $ini(%impmircini,highlight,0)) {
      if $readini(%impmircini,highlight,$ini(%impmircini,highlight,%tmpXct)) != $null { writeini -n mirc.ini highlight $ini(%impmircini,highlight,%tmpXct) $readini(%impmircini,highlight,$ini(%impmircini,highlight,%tmpXct)) }
      inc %tmpXct 1
    }
    ImpWiz Importing Accured iRC time
    if $readini(%impmircini,options,n1) != $null { 
      set %impTempn1 $gettok($readini(%impmircini,options,n1),5,44) $+ , $+ $gettok($readini(%impmircini,options,n1),6,44) $+ , $+ $gettok($readini(%impmircini,options,n1),7,44)
      writeini -n mirc.ini options n1 0,50,1,1, $+ %impTempn1 $+ ,0,12,1,0,1,1,1,0,0,0,1,0,0,0,1,0,0,3,0,1,0,0,0,1,0,0
    } 
    ImpWiz Importing DCC Port Settings
    if $readini(%impmircini,options,n4) != $null { 
      set %impTempn1 $readini(%impmircini,options,n4)
      writeini -n mirc.ini options n4 %impTempn1
    } 
    set %impmircini %impmdir $+ mirc.ini
    ; ********************* Importing Channel Central Entries ***********************
    ImpWiz Importing Channel Central Entries
    var %tmpXct = 1
    var %dum = $read(%impmircini,w,[chanFolder])
    var %startline = $readn
    var %totlines = $ini(%impmircini,chanFolder,0)
    if %startline > 2 {
      while (%tmpXct <= %totlines) {
        var %tmpinsline = $read(%impmircini,$calc(%startline + %tmpXct))
        if ((%tmpinsline != $null) && ($numtok(%tmpinsline,61) >= 2)) { writeini -n mirc.ini chanfolder $gettok(%tmpinsline,1,61) $gettok(%tmpinsline,2-,61) }
        inc %tmpXct 1
      }
    }
    ; ************* Do Notify, Ignore, Ops, Voice, etc.. ***************
    ImpWiz Importing Notify List...
    var %ict = 1
    while (%ict <= $ini(%impmircini,notify,0)) {
      w.mirc notify $ini(%impmircini,notify,%ict) $readini(%impmircini,notify,$ini(%impmircini,notify,%ict))
      inc %ict 1
    }
    Impwiz Importing mIRC Control Settings and Lists...
    var %mircver = $readini(%impmircini,about,version)
    if %mircver >= 6 {
      if $isfile( [ %impmdir $+ control.ini ] ) { .copy -o [ [ %impmdir ] $+ control.ini ] $shortfn($mircdir) } | Else { ImpWiz *** mIRC Control Settings and Lists not imported. }
    }
    else {
      var %sections = op,voice,protect,ignore
      var %oct = 1
      while (%oct <= 4) {
        var %curSect = $gettok(%sections,%oct,44)
        var %ict = 1
        while (%ict <= $ini(%impmircini,%curSect,0)) {
          w.mirc %curSect $ini(%impmircini,%curSect,%ict) $readini(%impmircini,%curSect,$ini(%impmircini,%curSect,%ict))
          inc %ict 1
        }
        inc %oct 1
        continue
      }
    }
  }
  if %impscript != i2 { saveallsettings | SaveAllGlobals } 
  loadallsettings

  i2crc cryoa 
  w.set Trusted.Nicks NickNames $addtok($r.glob(Trusted.Nicks,NickNames),NickServ,44)
  w.set Trusted.Nicks NickNames $addtok($r.glob(Trusted.Nicks,NickNames),ChanServ,44)
  w.set Trusted.Nicks NickNames $addtok($r.glob(Trusted.Nicks,NickNames),MemoServ,44)
  w.set Trusted.Nicks NickNames $addtok($r.glob(Trusted.Nicks,NickNames),DCCallow,44)
  w.set Trusted.Nicks NickNames $addtok($r.glob(Trusted.Nicks,NickNames),X,44)
  w.set Invision ScriptList $addtok($r.glob(Invision,ScriptList),ihelp.mrc,44)
  w.static Script %keepbuild
  if !$istok($r.glob(Invision,ScriptList),iserv.mrc,44) { w.set Invision ScriptList $addtok($r.glob(Invision,ScriptList),iserv.mrc,44) }
  if !$istok($r.glob(Invision,ScriptList),iunique.mrc,44) { w.set Invision ScriptList $addtok($r.glob(Invision,ScriptList),iunique.mrc,44) }
  if $r.glob(Invision,NickTagFormat) == $null { w.set Invision NickTagFormat $eval($c(1) $+ « $+ $c(2) $+ nick $+ $c(1) $+ »,0) }
  saveallsettings | SaveAllGlobals 
  ; if $exists($gettok($readini(%impmircini,background,@mdi),1,44)) { .background -mt $gettok($readini(%impmircini,background,@mdi),1,44) }
  ImpWiz Finished Importing Settings.
  ImpWiz This mirc will be closed after the new updated mirc has opened. DO NOT CLOSE THIS mIRC MANUALLY.
  ImpWiz See the file import.log in the main Invision directory to see any errors or failed imports.
  aecho $c(2) $+ 4This mIRC Client will be forced close in seconds. Before that happens another will open. Please use the new one. You can read details on the import in the 8import.log 4file located in the invision main directory.
  if $USDdays >= 360 { resetUSD }
  w.mirc Invision Rebooting 1
  .timer -o 1 2 run $mircexe
  .timer -o 0 1 reboot
}
implog { if $1 != $null { .write import.log $1- $+ $crlf } }
DefaultSettings {
  if $r.static(Script,Author) != cRYOa { 
    w.static Script Author cRYOa
    w.static Script Webpage http://www.i-n-v-i-s-i-o-n.com
    if $r.glob(Script,Startup) == $null { w.glob Script Startup 0 }
    if $r.glob(Script,Connect) == $null { w.glob Script Connect 0 }
    if $r.static(Script,Version) == $null { w.static Script Version 3.3 }
    if $r.static(Script,Features) == $null { w.static Script Features Advanced File Serving features }
  }
  if $r.glob(Invision,mp3announcement) == $null { w.glob Invision mp3announcement is listening to }
}
ServicesSet {
  if $isdalnet || $r.set(Invision,ForceDalnet) == On {
    set %Nserv [ $+ [ $iNetwork ] ] .nickserv
    set %Cserv [ $+ [ $iNetwork ] ] .chanserv
    set %Mserv [ $+ [ $iNetwork ] ] .memoserv
  }
  else {
    set %Nserv [ $+ [ $iNetwork ] ] .msg nickserv
    set %Cserv [ $+ [ $iNetwork ] ] .msg chanserv
    set %Mserv [ $+ [ $iNetwork ] ] .msg memoserv
  }
  ;if $isDalnet && (($me == $r.set(Auto.ID,Nick.1)) || ($me == $r.set(Auto.ID,Nick.2)) || ($me == $r.set(Auto.ID,Nick.3)) || ($me == $r.set(Auto.ID,Nick.4)) || ($me == $r.set(Auto.ID,Nick.5))) { .timer 1 3 ident } 
}
gmove {
  if $agentstat == 1 && $r.glob(Invision,Genie) == On {
    if $2 != $null {
      if $agent(mirc) == $null { .gload mirc }
      if $agent(mirc).visible == $false { .gshow mirc }
      .gmove mirc $1 $2 
    }
  }
}
gsay {
  if $agentstat == 1 && $r.glob(Invision,Genie) == On {
    if $1 != $null {
      if $agent(mirc) == $null { .gload mirc | .timerGenieTO -o 1 30 .ghide mirc }
      if $agent(mirc).visible == $false { .gshow mirc | .timerGenieTO -o 1 30 .ghide mirc }
      .gtalk -ulb mirc $1-
    }
  }
}
gwav {
  if $agentstat == 1 && $r.glob(Invision,Genie) == On {
    if $1 != $null {
      if $agent(mirc) == $null { .gload mirc | .timerGenieTO -o 1 30 .ghide mirc }
      if $agent(mirc).visible == $false { .gshow mirc | .timerGenieTO -o 1 30 .ghide mirc }
      .gtalk -ubw mirc $1-
    }
  }
}
gload {
  if $agentver != 0 && $r.glob(Invision,Genie) == On {
    .gload -h mirc
  }
}
gshow {
  if $agentstat == 1 && $r.glob(Invision,Genie) == On {
    .gshow mirc 
  }
}
mp3buildcache {
  set %rct [ $+ [ $iSetwork ] ] 1
  hfree -w mp3list [ $+ [ $iSetwork ] ]
  set %mp3cachect [ $+ [ $iSetwork ] ] 1
  set %RotateSym [ $+ [ $iSetwork ] ] 1
  set %mp3DlgFTOT [ $+ [ $iSetwork ] ] $lines($shortfn($mircdirinvision\Settings\ $+ [ $iSetwork ] $+ \mp3list.i2x))
  .timercachebuild -om %mp3dlgFTOT [ $+ [ $iSetwork ] ] 10 mp3cachetable
  halt
}
mp3cachetable {
  hadd -m mp3list [ $+ [ $iSetwork ] ] file [ $+ [ %rct [ $+ [ $iSetwork ] ] ] ]  $read($shortfn($mircdirinvision\Settings\) $+ $iSetwork $+ \mp3list.i2x, n, %mp3cachect [ $+ [ $iSetwork ] ] )
  hadd -m mp3list [ $+ [ $iSetwork ] ] size [ $+ [ %rct [ $+ [ $iSetwork ] ] ] ] $size($file($read($shortfn($mircdirinvision\Settings\) $+ $iSetwork $+ \mp3list.i2x, n, %mp3cachect [ $+ [ $iSetwork ] ] )).size) 
  if ($right($hget(mp3list [ $+ [ $iSetwork ] ] ,file [ $+ [ %rct [ $+ [ $iSetwork ] ] ] ] ),4) == .mp3) { .hadd -m mp3list [ $+ [ $iSetwork ] ] bitrate [ $+ [ %rct [ $+ [ $iSetwork ] ] ] ] [ $mp3($hget(mp3list [ $+ [ $iSetwork ] ] ,file [ $+ [ %rct [ $+ [ $iSetwork ] ] ] ] )).bitrate ] [ $+ [ Kbs ] ] }
  inc %rct [ $+ [ $iSetwork ] ] 1
  if $dialog(mp3manager) != $null {
    if %RotateSym [ $+ [ $iSetwork ] ] == 5 { set %rotatesym [ $+ [ $iSetwork ] ] 1 }
    if %RotateSym [ $+ [ $iSetwork ] ] == 4 { dialog -t mp3manager Building Index %mp3cachect [ $+ [ $iSetwork ] ] $chr(92) | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
    if %RotateSym [ $+ [ $iSetwork ] ] == 3 { dialog -t mp3manager Building Index %mp3cachect [ $+ [ $iSetwork ] ] $+ --- | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
    if %RotateSym [ $+ [ $iSetwork ] ] == 2 { dialog -t mp3manager Building Index %mp3cachect [ $+ [ $iSetwork ] ] $chr(47) | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
    if %RotateSym [ $+ [ $iSetwork ] ] == 1 { dialog -t mp3manager Building Index %mp3cachect [ $+ [ $iSetwork ] ] $chr(124) | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
  }
  if %mp3cachect [ $+ [ $iSetwork ] ] >= %mp3DlgFTot [ $+ [ $iSetwork ] ] { .hadd -m mp3list [ $+ [ $iSetwork ] ] RecordCount $calc(%rct [ $+ [ $iSetwork ] ] - 1) | mp3makehtmllist }
  inc %mp3cachect [ $+ [ $iSetwork ] ]  1
}
mp3makehtmllist {
  write -c $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \ $+ [ $mp3servListName ] $+ 's_mp3list.htm $chr(32)
  write $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \ $+ [ $mp3servListName ] $+ 's_mp3list.htm $htmlhdr( [ $remove($mp3servListName,!) $+ 's mp3 list ] , [ $time(dddd) $time(m/dd/yyyy) at $time(h:nntt) ] )
  set %RotateSym [ $+ [ $iSetwork ] ] 1
  set %tmpLoopCT [ $+ [ $iSetwork ] ] 1
  set %timect [ $+ [ $iSetwork ] ] $iif($hget(mp3list [ $+ [ $iSetwork ] ] ,RecordCount) != $null, $hget(mp3list [ $+ [ $iSetwork ] ] ,RecordCount),0)
  .timerhtmlmake $+ $iSetwork -om %timect [ $+ [ $iSetwork ] ] 20 mp3htmllist
}
mp3htmllist {
  write $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \ [ $+ [ $mp3servListName ] ] [ $+ [ 's_mp3list.htm ] ] $htmlrow($iif($r.set(mp3serv,triginlist) == On, $strip($mp3serv.ad.trigger,burc)) $replace($nopath($hget(mp3list [ $+ [ $iSetwork ] ] , file [ $+ [ %tmpLoopCT [ $+ [ $iSetwork ] ] ] ] )),$chr(63),$chr(32),$chr(34),$chr(44)), $replace($hget(mp3list [ $+ [ $iSetwork ] ] , size [ $+ [ %tmpLoopCT [ $+ [ $iSetwork ] ] ] ] ),$chr(184),$chr(44),$chr(158),$chr(40),$chr(159),$chr(41)), $iif($hget(mp3list [ $+ [ $iSetwork ] ] , bitrate [ $+ [ %tmpLoopCT [ $+ [ $iSetwork ] ] ] ] ) != kbs,$hget(mp3list [ $+ [ $iSetwork ] ] , bitrate [ $+ [ %tmpLoopCT [ $+ [ $iSetwork ] ] ] ] ),n/a))
  if $dialog(mp3manager) != $null {
    if %RotateSym [ $+ [ $iSetwork ] ] == 5 { set %rotatesym 1 }
    if %RotateSym [ $+ [ $iSetwork ] ] == 4 { dialog -t mp3manager Building List - Adding File %tmploopct [ $+ [ $iSetwork ] ] $chr(92) | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
    if %RotateSym [ $+ [ $iSetwork ] ] == 3 { dialog -t mp3manager Building List - Adding File %tmploopct [ $+ [ $iSetwork ] ] $+ --- | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
    if %RotateSym [ $+ [ $iSetwork ] ] == 2 { dialog -t mp3manager Building List - Adding File %tmploopct [ $+ [ $iSetwork ] ] $chr(47) | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
    if %RotateSym [ $+ [ $iSetwork ] ] == 1 { dialog -t mp3manager Building List - Adding File %tmploopct [ $+ [ $iSetwork ] ] $chr(124) | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
  }
  if %tmpLoopCt [ $+ [ $iSetwork ] ] >= %timect [ $+ [ $iSetwork ] ] { 
    .timerhtmlmake $+ $iSetwork off
    write $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \ $+ [ $mp3servListName ] $+ 's_mp3list.htm $htmlend
    if $r.set(mp3serv,ZipList) == On {
      if $exists($shortfn($mircdirpkzipc.exe)) { 
        var %listname = $shortfn($mircdir) $+ Invision\Settings\ $+ $iSetwork $+ \ $+ [ $mp3servListName ] $+ 's_mp3list.zip $shortfn($mircdir) $+ Invision\Settings\ $+ $iSetwork $+ \ [ $+ [ [ $mp3servListName ] ] ] [ $+ [ 's_mp3list.htm ] ] 
        .run -n $shortfn($mircdir) $+ pkzipc.exe -add %listname 
      }
      else { set %sfxdummy $?!="Could not find ''pkzipc.exe'' in the invision main directory! This is needed to archive your schemes." }
    }
    if $dialog(mp3manager) != $null {
      dialog -t mp3Manager Invision mp3 Server Manager for $iif($iSetwork != $null,$iSetwork,Global)
    }
    secho mp3list Cache and List of $c(2) $+ $iif($hget(mp3list [ $+ [ $iSetwork ] ] ,RecordCount) >= 1,$hget(mp3list [ $+ [ $iSetwork ] ] ,RecordCount),0) files $c(1) $+ built in $c(2) $+ $duration($calc($ctime - %mp3liststarttime [ $+ [ $iSetwork ] ] ),1)
  }
  inc %tmpLoopCt [ $+ [ $iSetwork ] ] 1
}
mp3cachestart {
  if $r.set(mp3serv,DirCount) != 0 && $r.set(mp3serv,DirCount) != $null {
    set %mp3liststarttime [ $+ [ $iSetwork ] ] $ctime
    unset %didsome [ $+ [ $iSetwork ] ]
    write -c $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \mp3dir.bat $chr(32)
    set %mp3DlgCT [ $+ [ $iSetwork ] ] 1
    while (%mp3DlgCT [ $+ [ $iSetwork ] ] <= $r.set(mp3serv,DirCount)) {
      var %fct = 1
      var %filetypes = $r.set(mp3serv,FileTypes)
      while (%fct <= $numtok(%FileTypes,44)) {
        set %mp3DlgFCT [ $+ [ $iSetwork ] ] 1
        set %RotateSym [ $+ [ $iSetwork ] ] 1
        write $shortfn($mircdir) $+ Invision\Settings\ $+ [ $iSetwork ] $+ \mp3dir.bat dir /b /s " $+ [ $shortfn($r.set(mp3serv,LongDir [ $+ [  %mp3DlgCT [ $+ [ $iSetwork ] ] ] ] )) $+ * [ $+ [ $gettok(%FileTypes,%fct,44) ] ] ] $+ " >> $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \mp3list.i2x      
        if $dialog(mp3manager) != $null {
          if %RotateSym [ $+ [ $iSetwork ] ] == 5 { set %rotatesym [ $+ [ $iSetwork ] ] 1 }
          if %RotateSym [ $+ [ $iSetwork ] ] == 4 { dialog -t mp3manager Building Directory List %mp3DlgCT [ $+ [ $iSetwork ] ] $chr(92) | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
          if %RotateSym [ $+ [ $iSetwork ] ] == 3 { dialog -t mp3manager Building Directory List %mp3DlgCT [ $+ [ $iSetwork ] ] $+ --- | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
          if %RotateSym [ $+ [ $iSetwork ] ] == 2 { dialog -t mp3manager Building Directory List %mp3DlgCT [ $+ [ $iSetwork ] ] $chr(47) | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
          if %RotateSym [ $+ [ $iSetwork ] ] == 1 { dialog -t mp3manager Building Directory List %mp3DlgCT [ $+ [ $iSetwork ] ] $chr(124) | inc %rotatesym [ $+ [ $iSetwork ] ] 1 }
        }
        inc %fct 1
      }
      inc %mp3DlgCT [ $+ [ $iSetwork ] ] 1
      continue
    }
    if $dialog(mp3manager) != $null { dialog -t mp3manager Setting Up Directories List... }
    if $exists( [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \mp3list.i2x ] ) { .remove $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \mp3list.i2x }
    .run -n $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \mp3dir.bat
    .timer -o 1 $iif(%mp3cachedelay != $null,%mp3cachedelay,15) mp3buildcache
  }
}
FsearchSTD {
  ;  ************************* FsearchSTD <type(not used yet)> <nick> <search string>
  if $3 != $null {
    if $r.set(Invision,SndOpt22) == On { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound23) }
    var %allx = 0 | var %foundnodir = 0 | unset %fsfind*
    var %fssearch = * $+ $replace($remove($3-,**),$chr(32),*,_,*,?,*) $+ *
    if (. isin $3-) { goto leapfrog }
    var %ct = 1
    while (%ct <= 5) {
      var %tmp = Fserve. $+ %ct
      if ($r.set(Fserve. [ $+ [ %ct ] ] ,Status) == On) { set %fsfind. [ $+ [ %ct ] ] $finddir($r.set(Fserve. [ $+ [ %ct ] ] ,Root.Dir),%fssearch,0) }
      inc %ct 1
    }
    var %fsfind.total = $calc(%fsfind.1 + %fsfind.2 + %fsfind.3 + %fsfind.4 + %fsfind.5)
    :leapfrog
    if (%fsfind.total == 0) || (%fsfind.total == $null) { 
      var %foundnodir = 1
      var %ct = 1
      while (%ct <= 5) {
        if ($r.set(Fserve. [ $+ [ %ct ] ] ,Status) == On) { set %fsfind. [ $+ [ %ct ] ] $findfile($r.set(Fserve. [ $+ [ %ct ] ] ,Root.Dir),%fssearch,0) }
        inc %ct 1 
      }
      var %fsfind.total = $calc(%fsfind.1 + %fsfind.2 + %fsfind.3 + %fsfind.4 + %fsfind.5)
    }
    if %fsfind.total >= 1 {
      msg $2 $C(2) $+ File Server Search $C(1) Found: $C(2) $+  $+ %fsfind.total $+  $+ $C(1) $chr(32)  match(s) for: $+ $C(2) $+  $chr(32) $+ %fssearch $+ $c(1) $+ . $sv(Current Server Status,Sends: $isend(0) $+ / $+ $r.set(Fserve,Max.Sends.Total) Queues: $queue(0) $+ / $+ $r.set(Fserve,Max.Queues.Total)) $ilogo
      var %ct = 1
      while (%ct <= 5) {
        if (%fsfind. [ $+ [ %ct ] ] > 0) {  
          %inct = 1
          while (%inct <= %fsfind. [ $+ [ %ct ] ] ) {
            inc %allx
            if (%allx > 8) { .timer 1 $calc( [ %allx * 2 ] + 2) .msg $2 $C(1) $+ Too many results found to display. You might want to consider refining your search. | break }
            if (%foundnodir != 1) { if ($finddir($r.set(Fserve. [ $+ [ %ct ] ] ,Root.Dir),%fssearch,%inct) != $null) { .timer 1 $calc(%allx * 2) .msg $2 $C(1) Found: $+ $C(2) $+ $right($finddir($r.set(Fserve. [ $+ [ %ct ] ] ,Root.Dir),%fssearch,%inct),$calc($len($finddir($r.set(Fserve. [ $+ [ %ct ] ] ,Root.Dir),%fssearch,%inct)) - $len($r.set(Fserve. [ $+ [ %ct ] ] ,Root.Dir)))) $+ $C(1) $+ $chr(32)  Use the trigger: $+ $C(2) $+  $+ $iif($r.set(Fserve,CTCPonly) == On,/ctcp $me $+ $chr(32)) $+ $r.set(Fserve. [ $+ [ %ct ] ] ,Trigger) $+  $+ $C(1) $+  $chr(32) $iif($r.set(Fserve,CTCPonly) != On,in the channel.) } }
            else { if ($findfile($r.set(Fserve. [ $+ [ %ct ] ] ,Root.Dir),%fssearch,%inct) != $null) { .timer 1 $calc(%allx * 2) .msg $2 $C(1) Found: $+ $C(2) $+ $right($findfile($r.set(Fserve. [ $+ [ %ct ] ] ,Root.Dir),%fssearch,%inct),$calc($len($findfile($r.set(Fserve. [ $+ [ %ct ] ] ,Root.Dir),%fssearch,%inct)) - $len($r.set(Fserve. [ $+ [ %ct ] ] ,Root.Dir)))) $+ $C(1) $+ $chr(32)  Use the trigger: $+ $C(2) $+  $+ $iif($r.set(Fserve,CTCPonly) == On,/ctcp $me $+ $chr(32)) $+ $r.set(Fserve. [ $+ [ %ct ] ] ,Trigger) $+  $+ $c(1) $+  $chr(32) $iif($r.set(Fserve,CTCPonly) != On,in the channel.) } }
            inc %inct 1 
          }
        }
        inc %ct 1
      }
    }
  }
}
FsearchCACHE {
  ;  ************************* FsearchCACHE <type(not used yet)> <nick> <search string>
  if $3 != null {
    clrreadn
    var %FSsrchCT = 1
    var %FSsrchLN = 1
    var %FSsrchFindCT = 0
    while (%FSsrchCT <= 5) { 
      if $r.set(Fserve. [ $+ [ %FSsrchCT ] ] ,Status) != On { inc %FSsrchCT 1 | continue }
      if $exists( [ $shortfn($mircdir) $+ invision\Settings\ [ $+ [ $iSetwork ] ] $+ \FSdir [ $+ [ %FSsrchCT ] ] ] ) {
        var %FSsrchLNTOT = $lines( [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir [ $+ [ %FSsrchCT ] ] ] ) 
        var %FSsrchLN = 1
        :start
        var %FSsrchbs = $read( [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir [ $+ [ %FSsrchCT ] ] ] ,w, * [ $+ [ $3- ] ] [ $+ [ * ] ] , [ %FSsrchLN ] )
        var %FSsrchResult = $readn
        if $numtok(%FSsrchDir [ $+ [ %FSsrchCT ] ] ,32) >= 1 {
          if $read( [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir [ $+ [ %FSsrchCT ] ] ] , $gettok(%FSsrchDir [ $+ [ %FSsrchCT ] ] ,$numtok(%FSsrchDir [ $+ [ %FSsrchCT ] ] ,32),32)) isin %FSsrchbs {
            var %FSsrchLN = $calc(%FSsrchResult + 1)
            clrreadn
            if (%FSsrchResult != $null) && (%FSsrchResult != 0) { goto start }
          }
        }
        if (%FSsrchResult != $null) && (%FSsrchResult != 0) { 
          if %FSsrchFindCT >= 10 { break }
          var %FSsrchDir [ $+ [ %FSsrchCT ] ] %FSsrchDir [ $+ [ %FSsrchCT ] ] %FSsrchResult 
          var %FSsrchLN = $calc(%FSsrchResult + 1)
          :leap1 
          unset %FSsrchResult 
          clrreadn
          inc %FSsrchFindCT 1
          if %FSsrchLN <= %FSsrchLNTOT { goto start }
        }
        if %FSsrchFindCT >= 10 { break }
      }
      inc %FSsrchCT 1
    }
    if %FSsrchFindCT != 0 {
      msg $2 $c(1) $+ I found $iif(%FSsrchFindCT >= 10,over) $c(2) $+ %FSsrchFindCT $c(1) $+ match(s) for $c(2) $+ $3- $+ $c(1) $+ . $sv(Current Server Status,Sends: $isend(0) $+ / $+ $r.set(Fserve,Max.Sends.Total) Queues: $queue(0) $+ / $+ $r.set(Fserve,Max.Queues.Total)) $ilogo
      var %FSisoct = 1
      var %FSsrchCT = 1
      var %FSsrchLN = 1
      while (%FSsrchCT <= 5) {
        if $exists( [ $shortfn($mircdir) $+ invision\Settings\ [ $+ [ $iSetwork ] ] $+ \FSdir [ $+ [ %FSsrchCT ] ] ] ) {
          if (%FSsrchdir [ $+ [ %FSsrchCT ] ] != $null) {
            var %FSsrchINCT = 1
            while (%FSsrchINCT <= $numtok(%FSsrchdir [ $+ [ %FSsrchCT ] ] ,32)) { 
              if $r.set(Fserve. [ $+ [ %FSsrchCT ] ] ,Status) != On { break }
              var %FSsrchPathClip = $read( [ $shortfn($mircdir) $+ invision\Settings\ $+ [ $iSetwork ] $+ \FSdir [ $+ [ %FSsrchCT ] ] ] , $gettok(%FSsrchdir [ $+ [ %FSsrchCT ] ] ,%FSsrchINCT,32))
              .timer 1 $calc(%FSisoCT * 2) .msg $2 $c(1) $+ Found $c(2) $+ $replace($remove(%FSsrchPathClip, [ $longfn($r.set(Fserve. [ $+ [ %FSsrchCT ] ] ,Root.Dir)) $+ \ ] ,$r.set(Fserve. [ $+ [ %FSsrchCT ] ] ,Root.Dir)),$chr(184),$chr(44),$chr(158),$chr(40),$chr(159),$chr(41)) $c(1) $+ To access this, type $c(2) $+ $iif($r.set(Fserve,CTCPonly) == On,/ctcp $me $+ $chr(32)) $+ $r.set(Fserve. [ $+ [ %FSsrchCT ] ] ,Trigger) $c(1) $+ $iif($r.set(Fserve,CTCPonly) != On,in the channel.)
              inc %FSisoct 1
              inc %FSsrchINCT 1
              if %FSisoCT >= 10 { .timer 1 $calc(%FSisoCT * 2) .msg $2 $c(1) $+ Too many results to display. Please refine your search. | break }
            }
          }
        }
        inc %FSsrchCT 1
        continue
      }
      .timer 1 $calc(%FSisoCT * 2) .msg $2 $c(1) $+ These results are from searching cached index's of the fileservers. 
    }
  }
}
BugReport {
  .write -c $shortfn($mircdir) $+ bugrep.txt support@i-n-v-i-s-i-o-n.com?subject=Bug Report&body=
  if $isfile($shortfn($mircdirbugrep)) {
    var %ct = 1
    var %linect = $lines($shortfn($mircdirbugrep))
    while (%ct <= %linect) {
      .write -al1 $shortfn($mircdir) $+ bugrep.txt $read($shortfn($mircdirbugrep),%ct) $+ $chr(37) $+ 0A
      inc %ct 1
    } 
  }
  .write -al1 $shortfn($mircdir) $+ bugrep.txt ______________________________________________________________ $+ $chr(37) $+ 0A
  run [ mailto: $+ $read($shortfn($mircdirbugrep.txt),1) ]
  else { error couldnt find bug report file! Exiting! }
}
iNetworkLive {
  var %servgrp = $server($server).group
  if ($server == $null) { return }
  elseif (%servgrp != $null) { return $remove(%servgrp,$chr(32)) }
  else {
    if (($network != $null) && ($network != unknown)) { return $remove($network,$chr(32)) }
    else { return $upper($remove($gettok($server, [ [ $calc($numtok($server,46) - 1) ] $+ - ] ,46),$chr(46))) }
  }
}
iNetwork { return %SCIDnet [ $+ [ $cid ] ] }
setiNetwork {
  var %servgrp = $server($server).group
  ; if ($server == $null) { unset %SCIDnet [ $+ [ $cid ] ] }
  if (%servgrp != $null) { set %SCIDnet [ $+ [ $cid ] ] $remove(%servgrp,$chr(32)) }
  else {
    if (($network != $null) && ($network != unknown)) { set %SCIDnet [ $+ [ $cid ] ] $remove($network,$chr(32)) }
    else { set %SCIDnet [ $+ [ $cid ] ] $upper($remove($gettok($server, [ [ $calc($numtok($server,46) - 1) ] $+ - ] ,46),$chr(46))) }
  }
}
iSetworkLive {
  if ($r.glob(Invision,SettingsMethod) == Global) { return }
  var %servgrp = $server($server).group
  if ($server == $null) { return }
  elseif (%servgrp != $null) { return $remove(%servgrp,$chr(32)) }
  else {
    if (($network != $null) && ($network != unknown)) { return $remove($network,$chr(32)) }
    else { return $upper($remove($gettok($server, [ [ $calc($numtok($server,46) - 1) ] $+ - ] ,46),$chr(46))) }
  }
}
iSetwork { 
  ;  if ($r.glob(Invision,SettingsMethod) == Global) { return }
  if ($hget(SettingsGlobalGlobals,InvisionSettingsMethod) == Global) { return }
  else { return %SCIDnet [ $+ [ $cid ] ] }
}
setiSetwork {
  if ($r.glob(Invision,SettingsMethod) == Global) { unset %SCIDnet [ $+ [ $cid ] ] | return }
  var %servgrp = $server($server).group
  ; if ($server == $null) { unset %SCIDnet [ $+ [ $cid ] ] }
  if (%servgrp != $null) { set %SCIDnet [ $+ [ $cid ] ] $remove(%servgrp,$chr(32)) }
  else {
    if (($network != $null) && ($network != unknown)) { set %SCIDnet [ $+ [ $cid ] ] $remove($network,$chr(32)) }
    else { set %SCIDnet [ $+ [ $cid ] ] $upper($remove($gettok($server, [ [ $calc($numtok($server,46) - 1) ] $+ - ] ,46),$chr(46))) }
  }
}
networkidmode {
  if ($r.glob(Invision,NetworkIDmode) == 1) {
    w.glob Invision NetworkIDmode 2
    aecho Network Identification Mode 2 now in effect. In this mode networks are identified first by Server Group entered in the Server List, then via the network ID request, then last an alternate method. To switch back to the default mode (Mode 1) do a "NetworkIDmode" command again.
  }
  else {
    w.glob Invision NetworkIDmode 1
    aecho Network Identification Mode 1 now in effect. This is the Default mode. In this mode networks are identified first via the network ID request, then by Server Group in the Server List, then last an alternate method. To switch to Mode 2 do a "NetworkIDmode" command again.
  }
}
NetworkInit {
  .mkdir $shortfn($mircdir) $+ invision\settings\ $+ $iNetwork
  .copy [ $shortfn($mircdir) $+ invision\settings\*.* ] [ $shortfn($mircdir) $+ invision\settings\ $+ [ $iNetwork ] $+ \ ] 
}
isend {
  if $1 != $null {
    if $1 == 0 {
      var %tot = 0
      var %ct = 1
      while (%ct <= $send(0)) {
        if $send(%ct).cid == $cid { inc %tot 1 }
        inc %ct 1
      }
      return %tot
    }
    elseif ($1 isnum) && ($1 >= 1) {
      var %tot = 0
      var %ct = 1
      while (%ct <= $send(0)) {
        if $send(%ct).cid == $cid { 
          inc %tot 1 
          if %tot == $1 { return [ $send(%ct) [ $+ [ $iif($prop != $null,. $+ $prop) ] ] ] }
        }
        inc %ct 1
      }
      return
    }
    else {
      if $2 == $null {
        var %ct = 1
        while (%ct <= $send($1,0)) {
          if $send($1,%ct).cid == $cid { return [ $send($1,%ct) [ $+ [ $iif($prop != $null,. $+ $prop) ] ] ] }
          inc %ct 1
        }
      }
      elseif ($2 isnum) {
        var %ct = 1
        var %tot = 0
        while (%ct <= $send($1,0)) {
          if $send($1,%ct).cid == $cid { 
            inc %tot 1
            if %tot == $2 {
              return [ $send($1,%ct) [ $+ [ $iif($prop != $null,. $+ $prop) ] ] ] 
            }
          }
          inc %ct 1
        }
      }
    }
  }
}
iget {
  if $1 != $null {
    if $1 == 0 {
      var %tot = 0
      var %ct = 1
      while (%ct <= $get(0)) {
        if $get(%ct).cid == $cid { inc %tot 1 }
        inc %ct 1
      }
      return %tot
    }
    elseif ($1 isnum) && ($1 >= 1) {
      var %tot = 0
      var %ct = 1
      while (%ct <= $get(0)) {
        if $get(%ct).cid == $cid { 
          inc %tot 1 
          if %tot == $1 { return [ $get(%ct) [ $+ [ $iif($prop != $null,. $+ $prop) ] ] ] }
        }
        inc %ct 1
      }
      return
    }
    else {
      if $2 == $null {
        var %ct = 1
        while (%ct <= $get($1,0)) {
          if $get($1,%ct).cid == $cid { return [ $get($1,%ct) [ $+ [ $iif($prop != $null,. $+ $prop) ] ] ] }
          inc %ct 1
        }
      }
      elseif ($2 isnum) {
        var %ct = 1
        var %tot = 0
        while (%ct <= $send($1,0)) {
          if $get($1,%ct).cid == $cid { 
            inc %tot 1
            if %tot == $2 {
              return [ $get($1,%ct) [ $+ [ $iif($prop != $null,. $+ $prop) ] ] ] 
            }
          }
          inc %ct 1
        }
      }
    }
  }
}
CommonChannelScan {
  if $2 != $null {
    if $me ison $1 {
      if $me ison $2 {
        ScanResults $c(2) $+ Scan Results of Common People in both $c(1) $+ $1 $c(2) $+ and $c(1) $+ $2 $+ $c(2) $+ .
        ScanResults $c(1) $+ ====================================================
        ScanResults $chr(160)
        var %ct = 1
        var %tot = 0
        if $ialchan(*,$1,0) >= $ialchan(*,$2,0) {
          while (%ct <= $ialchan(*,$2,0)) {
            if $ialchan($ialchan(*,$2,%ct),$1,0) >= 1 { ScanResults $c(2) $+ $gettok($ialchan(*,$2,%ct),1,33) $bracket($ialchan(*,$2,%ct)) | inc %tot 1 }
            inc %ct 1
          }
        }
        else {
          while (%ct <= $ialchan(*,$1,0)) {
            if $ialchan($ialchan(*,$1,%ct),$2,0) >= 1 { ScanResults $c(2) $+ $gettok($ialchan(*,$1,%ct),1,33) $bracket($ialchan(*,$1,%ct)) | inc %tot 1 }
            inc %ct 1
          }
        }
        ScanResults $chr(160)
        ScanResults $c(1) $+ ============== $c(2) $+ Scan Finished. %tot $iif(%tot == 1,person,people) found. $c(1) $+ ============== 
      }
      else {
        var %ct = 1
        var %tot = 0
        ScanResults $c(2) $+ Scan Results of Common People in both $c(1) $+ $1 $c(2) $+ and $c(1) $+ $2 $+ $c(2) $+ .
        ScanResults $c(1) $+ ====================================================
        ScanResults $chr(160)
        while (%ct <= $nick($1,0)) {
          if $istok($remove($ial($nick($1,%ct)).mark,+,@),$2,32) { ScanResults $c(2) $+ $nick($1,%ct) $bracket($address($nick($1,%ct),5)) | inc %tot 1 }
          inc %ct 1
        }
        ScanResults $chr(160)
        ScanResults $c(1) $+ ============== $c(2) $+ Scan Finished. %tot $iif(%tot == 1,person,people) found. $c(1) $+ ============== 
        ScanResults $chr(160)
        Scanresults $c(1) $+ Note: You can get more accurate results if you are actually in both channels. 
      }
    }
  }
}
AddtoChanFolder {
  if ($isChannel($1)) {
    var %loc = n $+ $iif($ini($shortfn($mircini),chanfolder,0),$v1,0) 
    var %entry = $1, $+ $iif($2- != $null,$chr(34) $+ $2- $chr(34),$chr(34) $+ Added from Invision Menu $+ $chr(34)) $+ ,, $+ $iNetwork $+ ,1 
    w.mirc chanfolder %loc %entry
    aecho $1 was added to the Channels Folder to Auto-Join on connect. 
  }
}
isChannel { if $left($1,1) == $chr(35) || $left($1,1) == $chr(38) || $left($1,1) == $chr(43) { return $true } | else { return $false } }
confusion {
  if ($1 != $null) {
    var %tot = $len($1-)
    ;   var %wline = $1-
    var %ct = 1
    while (%ct <= %tot) {
      if ($rand(1,100) >= 40) { var %wline = %wline $+ $replace($mid($1-,%ct,1),$chr(32),¬) | inc %ct 1 | continue }
      var %wts = $rand(1,5)
      var %nchar = $replacecs($mid($1-,%ct,1),$chr(32),$chr(160),A,À,a,à,B,ß,C,Ç,c,©,D,Ð,E,È,e,è,H,$chr(124) $+ - $+ $chr(124),I,$chr(124),i,¡,K,$chr(93) $+ $chr(123),k,$chr(124) $+ <,V,\/,L,$chr(93) $+ _,l,$chr(124),M,$chr(124) $+ V $+ $chr(124),N,$chr(124) $+ \ $+ $chr(124),O,0,o,ò,R,®,S,§,T,¯ $+ $chr(124) $+ ¯,U,Ù,u,µ,W,\/\/,x,×,Y,¥,y,ý)
      if (%wts >= 2) {
        var %nchar = $replacecs(%nchar,À,Á,à,á,Ç,©,©,ç,Ð,$chr(93) $+ $chr(41),È,É,è,é,$chr(124),l,¡,î,ò,ó,Ù,Ú,µ,ù)
      }
      if (%wts >= 3) {
        var %nchar = $replacecs(%nchar,Á,Â,á,â,É,Ê,é,ê,î,ì,ó,ô,Ú,Û,ù,ú)
      }
      if (%wts >= 4) {
        var %nchar = $replacecs(%nchar,Â,Ã,â,ã,Ê,Ë,ê,ë,ì,í,ô,õ,Û,Ü,ú,û)
      }
      if (%wts >= 5) {
        var %nchar = $replacecs(%nchar,Ã,Å,ã,å,í,ï,õ,ö,û,ü)
      }
      var %wline = %wline $+ %nchar
      inc %ct 1
    }
    return $replace(%wline,¬,$chr(32))
  }
}
flud {
  ;  *********************  flud <type> <host> 
  ;  **   Current valid types are: text, ctcp, notice, invite, dcc, and fserve
  if ($2 != $null) {
    if ($r.set(Flood,$1 [ $+ Status ] ) == On) {
      var %tmp = -mz Flud $+ $1 $replace($mask($2,3),*,_,?,_)
      .timer $+ $1 $+ $2 -io 1 $r.set(Flood, $1 [ $+ [ Delay ] ] ) Hdel Flud $+ $1 $replace($mask($2,3),*,_,?,_) 
      var %nick = $gettok($2,1,33)
      .hinc %tmp
      if ($hget(Flud [ $+ [ $1 ] ] , $replace($mask($2,3),*,_,?,_)) >= $r.set(Flood, $1 [ $+ Lines ] )) {
        if (($level($2) <= 14) && ($gnick(%nick) == $true)) {
          .hdel Flud $+ $1 $replace($mask($2,3),*,_,?,_)
          close -mcf $nick 
          .ignore -u [ $+ [ $r.set(Flood, $1 [ $+ IgnoreTime) ] ] ] $mask($2,2)
          if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } 
          if ($r.set(Flood,$1 [ $+ Notify ] ) == On) {
            .notice %nick $c(1) $+ $1 flood detected, protection enabled. $bracket($r.set(Flood,$1 [ $+ Lines ] ),lines within a,$r.set(Flood,$1 [ $+ Delay ] ),second period) $ilogo
          }
          aecho %nick $bracket($gettok($2,2,33)) was put on ignore for $r.set(Flood,$1 [ $+ IgnoreTime ] ) seconds for $1 flooding you.  To unignore %nick press $c(2) $+ Control+F6 $+ $c(1) now! $bracket($r.set(Flood,$1 [ $+ Lines ] ),lines within a,$r.set(Flood,$1 [ $+ Delay ] ),second period)
        }
      }
    }
  }
}
mflud {
  ;  *********************  mflud <type> [ channel ]
  ;  **   Current valid types are: text, ctcp, notice, invite, join, and nick
  if ($1 != $null) {
    if ($r.set(mFlood,$1 [ $+ Status ] ) == On) {
      var %tmp = -mz mFlud $1 $+ $2 
      .timer $+ $1 $+ $2 1 $r.set(mFlood, $1 [ $+ Delay ] ) hdel mFlud [ $1 ] [ $+ [ $2 ] ] 
      .hinc %tmp
      if ($hget(mFlud, [ $1 ] [ $+ [ $2 ] ] ) >= $r.set(mFlood, $1 [ $+ Lines ] )) {
        .hdel mFlud [ $1 ] [ $+ [ $2 ] ] 
        if ($1 == ctcp) { var %typ = t }
        elseif ($1 == invite) { var %typ = i }
        elseif ($1 == notice) { var %typ = n }
        elseif ($1 == text) { var %typ = c }
        else { unset %typ }
        if (%typ != $null) {
          var %tmp = - $+ %typ $+ u $+ $r.set(mFlood, $1 [ $+ [ IgnoreTime ] ] ) *!*@*
          .ignore %tmp
        }
        else {
          if ($1 == join) {
            .timer -o 1 $r.set(mFlood, [ $1 ] [ $+ [ IgnoreTime ] ] ) unset %mFLUDjp [ $+ [ $2 ] ] 
            set %mFludjp [ $+ [ $2 ] ] 1
          } 
          else {
            .timer -o 1 $r.set(mFlood, [ $1 ] [ $+ [ IgnoreTime ] ] ) unset %mFLUDnick [ $+ [ $2 ] ] 
            set %mFludnick [ $+ [ $2 ] ] 1
          }
        }
        if ($r.set(mFlood,LogHalt) == On) {
          .timer -o 1 $iif($r.set(mFlood,LogHaltTime) isnum, $r.set(mFlood,LogHaltTime),20) .log on $2 
          .log off $2 
        }
        if ($r.set(ChanOps,LogDefense) == On) { .timer 1 0 deflog Mass Flood Protection Activated $iif($2 != $null,for $2) at $time(h:nn:tt) for:  $+ [ $1 ] Flooding }
        if ($r.set(Invision,SndOpt9) == On) { SoundQ $shortfn($mircdir) $+ $r.glob(Themes,Sound9) } 
        aecho [ $1 ] Mass Flood Protection activated for $iif($2 != $null,$2 for) $r.set(mFlood, [ $1 ] [ $+ IgnoreTime ] ) seconds.  $iif(%typ != $null,To deactivate press $c(2) $+ Control+F6 $+ $c(1) now!) $bracket($r.set(mFlood,$1 [ $+ Lines ] ),lines within a,$r.set(mFlood,$1 [ $+ Delay ] ),second period)
      }
    }
  }
}
AntiGET { if ($r.set(Fserve,AntiGET) == On) { 
    return $true 
  } 
  else { return $false } 
} 
Abouti2 {
  if ($window(@About) == $null) {
    window -kpado +Ls @About $int($calc(( [ $window(-3).w ] - 280)/2)) 200 455 415
    drawpic -c @About 0 0 invision\gfx\i2about.jpg
    var %x = $calc(220 - ($width(Version $r.static(Script,Version) $r.static(Script,Build),Verdana,10,1) / 2))
    drawtext -bp @About 8 1 Verdana 10 %x 56 Version $r.static(Script,Version) $r.static(Script,Build) 
    .timer -io 1 0 splay -m $shortfn($mircdir) $+ invision\gfx\i2about.mp3 
    if $!window(@About) != $!null $chr(123) drawpic -c @About 330 360 invision\gfx\CloseBtn.jpg $chr(124) splay -w $shortfn($mircdir) $+ invision\themes\sounds\default\click.wav $chr(125)
  }
  else { window -c @About }
}
NATCheck {
  if ($left($ip,7) == 192.168) {
    if $r.set(Invision,CorrectNAT) == On {
      .timer 1 3 /.localinfo -u
    }
    elseif $r.set(Invision,CorrectNAT) == Never {
      return
    }
    else {
      dopen NATcheck NATcheck
    }
  }
}
DCCdefaults {
  if ($r.glob(Invision,PDCC) == $null) || ($r.glob(Invision,PDCC) isnum) {
    w.glob Invision PDCC On
    .pdcc on
  }
  if $r.glob(Invision,FSend) == $null { w.glob Invision FSend On | /.fsend on }
  if $r.glob(Invision,packetsize) == $null { w.glob Invision PacketSize 4096 | /.dcc packetsize 4096 }
}
TrackURLsMaster { scid -a trackurls }
ModePrefix { if ($gettok($readini($shortfn($mircini),Options,N2),30,44) == 1) { return $true } | else { return $false } }
ModePre { ; ~!&@%+
  if ($1 = q) { return  $+ $r.glob(Nick.Colors,Color.0) $+ $2 $+  }
  return $+(,$cnick($nick).color,$iif($left($nick($1,$2).pnick,1) isin ~!&@%+,$left($nick($1,$2).pnick,1)),$2,)
}
isDalnet { 
  if (lagnet.org isin $server) { return $true } 
  if (alphanine.net isin $server) { return $true }
  if (.dal.net isin $server) { return $true }
  if ($r.set(Invision,ForceDalnet) == On) { return $true }
  return $false
}
hasDCCallow {
  if (alphanine.net isin $server) { return $true }
  if (.dal.net isin $server) { return $true }
  return $false
}
ForceXP { 
  if ($r.glob(Invision,ForceXP) == On) { 
    w.glob Invision ForceXP Off
    aecho ForceXP mode now off!
  }
  else {
    w.glob Invision ForceXP On
    aecho ForceXP now on!
  }
}
iReadINI {
  ;   ******************  iReadINI(<filename>,<section>,<item>)
  if $3 != $null {
    clrreadn
    var %dummy = $read( $1 , w,$chr(91) $+ $2 $+ $chr(93) $+ *)
    var %sectstart = $calc($readn + 1)
    if %sectstart == 0 || %dummy == $null { return }
    clrreadn
    var %sectstop = $read($1, w, [ [ $chr(91) ] $+ [ $chr(42) ] ] , %sectstart )
    var %sectstop = $calc($readn - 1)
    clrreadn
    var %data = $read($1, nw, [ $3 ] $+ $chr(61) $+ $chr(42), %sectstart )
    if %data == $null { return }
    var %datafound = $readn
    if (%sectstop > %sectstart) && (%datafound > %sectstop) { return }
    var %dev = - $+ $calc($len($3) + 1)
    var %data = $right(%data,%dev)
    return %data
  }
}
iWriteINI {
  ;     *****************  iWriteINI <filename> <section> <item> <data>
  if $4 != $null {
    ; Section exists??
    clrreadn
    var %dummy = $read( $1 , w, $chr(91) $+ $2 $+ $chr(93) $+ *)
    if %dummy == $null { var %location = NEWSECT | goto doit }
    var %sectStart = $calc($readn + 1)
    clrreadn
    var %sectstop = $read($1, w, $chr(91) $+ $chr(42), %sectstart )
    var %sectstop = $calc($readn - 1)
    clrreadn
    var %data = $read($1, w, $3 $+ $chr(61) $+ $chr(42), %sectstart )
    if %data == $null { var %location = NEWITEM | goto doit }
    var %datafound = $readn
    if (%sectstop > %sectstart) && (%datafound > %sectstop) { var %location = NEWITEM | goto doit }
    var %location = %datafound
    :doit
    var %newsect = $chr(91) $+ $2 $+ $chr(93)
    var %newitem = $3 $+ $chr(61) $+ $4-
    if %location == NEWSECT {
      .write $1 %newsect
      .write $1 %newitem
    }
    elseif %location == NEWITEM {
      var %insert = -il $+ %sectStart
      .write %insert $1 %newitem
    }
    else {
      var %del = -l $+ %location
      .write %del $1 %newitem
    }
  }
}
Fkey12 {
  if (($chan(0) == $null) || ($chan(0) == 0)) { goto leave }
  var %ChanTot = $chan(0)
  var %X = 1  
  :nChan
  var %i = 1
  :next
  while (%i <= $nick($chan(%X),0)) {
    var %curlev = $level($address($nick($chan(%X),%i),5))
    if (%curlev == 20) { cline $r.glob(Nick.Colors,Color.6) $chan(%X) %i }
    elseif (%curlev == 30) { cline $r.glob(Nick.Colors,Color.5) $chan(%X) %i }
    elseif (%curlev == 17) { cline $r.glob(Nick.Colors,Color.7) $chan(%X) %i }
    elseif (%curlev == 15) { cline $r.glob(Nick.Colors,Color.8) $chan(%X) %i }
    elseif (%curlev == 13) { cline $r.glob(Nick.Colors,Color.9) $chan(%X) %i }
    elseif (%curlev == 7) { cline $r.glob(Nick.Colors,Color.10) $chan(%X) %i }
    elseif (%curlev == 5) { cline $r.glob(Nick.Colors,Color.11) $chan(%X) %i }
    elseif ($ignore($address($nick($chan(%X),%i),3)) != $null) { cline $r.glob(Nick.Colors,Color.12) $chan(%X) %i }
    else { if (%curlev == 10) { cline $colour(listbox text) $chan(%X) %i } }
    if ($nick($chan(%X),%i) == $me) { cline $r.glob(Nick.Colors,Color.4) $chan(%X) %i }
    inc %i 1
  }
  ;  goto next
  :skipit
  if (%X >= %ChanTot) { goto bail } | else { inc %X 1 }
  goto nChan
  :bail
  aecho User list color scheme in effect!
  aecho $colordefine($r.glob(Nick.Colors,Color.6)) = Fellow Op | $colordefine($r.glob(Nick.Colors,Color.8)) = Friend | $colordefine($r.glob(Nick.Colors,Color.10)) = DCC Banned | $colordefine($r.glob(Nick.Colors,Color.5)) = Elite
  aecho $colordefine($r.glob(Nick.Colors,Color.11)) = Shitlisted | $colordefine($r.glob(Nick.Colors,Color.12)) = Ignored | $colordefine($r.glob(Nick.Colors,Color.7)) = Bot | $colordefine($r.glob(Nick.Colors,Color.9)) = Temp DCC permited
  .timerFkey12 $+ $iNetwork -io 1 30 NickListReset
  :leave
}
