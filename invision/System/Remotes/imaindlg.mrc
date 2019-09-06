; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: imaindlg.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: 
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
Dialog InvisMain {
  title "Invision $r.static(Script,Version) Script Settings"
  icon %dialogIcon
  size -1 -1 300 271
  option dbu

  tab "General", 1, 2 0 294 212
  tab "Colors", 2
  ;  tab "Sound", 3
  tab "Filtering && NickServ", 4
  ; tab "Personal", 5
  ;tab "Filtering", 6
  tab "Protection", 7
  tab "Channel Ops", 8
  tab "Adv.", 9

  box " Active Help ", 1501, 4 214 292 47
  edit "", 1502, 8 222 284 37, multi autovs

  button "OK", 498, 91 262 35 9, ok
  button "Cancel", 499, 131 262 35 9, cancel
  button "&Apply", 500, 171 262 35 9

  box " Lag Monitor ", 892, 4 19 135 19, tab1
  check "Enable", 25, 10 25 30 10, tab 1
  check "Graphical", 28, 43 25 33 10, tab 1
  text "Refresh (sec)", 26, 87 27 34 8, tab 1
  edit "", 27, 121 25 15 10, tab 1
  box " Nickname ", 897, 141 19 153 19, tab 1
  check "Maintain Nick", 822, 145 25 42 11, tab 1  
  text "Nick:", 820, 217 27 13 8, tab 1
  edit "", 821, 230 25 60 10, autohs, tab 1
  box " Encrypt/Decrypt ", 896, 176 40 118 32, tab 1
  check "Auto Decrypt", 816, 182 48 65 10, tab 1
  text "Decrypt Key (min 5 chr)" 85, 182 60 57 12, tab 1
  edit "", 86, 239 58 50 10, tab 1

  box " Titlebar ", 890, 4 38 170 44, tab1
  check "", 80, 10 45 8 9, tab 1
  text "Lag Meter", 1000, 19 46 40 8, tab 1 
  check "", 81, 10 54 8 9, tab 1
  text "Active Chan Stats", 1001, 19 55 45 8, tab 1
  check "", 852, 10 63 8 9, tab 1
  text "Open Socks", 1002, 19 64 40 8, tab 1
  check "", 853, 130 63 8 9, tab 1
  text "Linked Bots", 1003, 139 64 30 8, tab 1
  check "", 82, 70 45 8 9, tab 1
  text "Server Name", 1004, 79 46 45 8, tab 1
  check "", 83, 70 54 8 9, tab 1
  text "Away Status", 1005, 79 55 45 8, tab 1
  check "", 84, 130 45 8 9, tab 1
  text "Current Time", 1006, 139 46 31 8, tab 1
  check "", 895, 130 54 8 9, tab 1
  text "Nick +modes", 1007, 139 55 35 8, tab 1
  check "", 894, 70 63 8 9, tab 1
  text "Idle Time", 1008, 79 64 45 8, tab 1
  check "", 480, 10 71 8 9, tab 1
  text "Invision Name", 1009, 19 72 45 8, tab 1
  check "", 482, 70 71 8 9, tab 1
  text "Sends/Queues", 1010, 79 72 45 8, tab 1
  check "", 483, 130 71 8 9, tab 1
  text "mp3 in play", 1011, 139 72 30 8, tab 1

  box " Options: ", 451, 4 83 170 58, tab1
  check "", 851, 10 90 8 10, tab 1
  text "Stealth Mode", 1012, 19 91 45 8, tab 1
  check "", 564, 90 90 8 10, tab 1, disable
  text "BlackIce Support", 1013, 99 91 45 8, tab 1, disable
  check "", 861, 10 100 8 10, tab 1
  text "mp3 info in Active Window", 1014, 19 101 65 8, tab 1
  check "", 871, 90 100 8 10, tab 1
  text "Display mp3 Buttons", 1015, 99 101 60 8, tab 1
  check "", 560, 10 110 8 10, tab 1
  text "Enable Channel Scan", 1016, 19 111 60 8, tab 1
  check "", 561, 90 110 8 10, tab 1
  text "Fast Indexing Method", 1017, 99 111 60 8, tab 1
  check "", 562, 10 120 8 10, tab 1
  text "Auto Notice Reply Prompt", 1018, 19 121 70 8, tab 1
  check "" 563, 90 120 8 10, tab 1
  text "Auto Update Check", 1019, 99 121 70 8, tab 1, disable
  check "", 565, 10 130 8 10, tab 1
  text "Info Responses Isolated", 1020, 19 131 70 8, tab 1
  check " Part Channels for Nick Regain", 763, 90 130 80 8, tab 1
  ; text "Enable Spam Filter", 1021, 99 131 45 8, tab 1


  box "Auto Greet Channels:", 181, 176 73 118 68, tab1
  check "Enable Auto Greeter", 180, 181 82 60 10, tab 1
  combo 182, 181 92 65 50, tab 1
  check "All Channels", 183, 248 125 40 10, tab 1
  button "Add", 184, 248 92 30 12, tab 1
  button "Rem", 185, 248 106 30 12, tab 1

  box " Miscellaneous ", 893, 4 141 200 58, tab 1
  check "", 701, 10 148 8 10, tab 1
  text "Enable Messenger", 1069, 19 149 60 8, tab 1
  check "", 702, 70 148 8 10, tab 1
  text "/msg history revive", 1067, 79 149 55 8, tab 1
  check "", 703, 130 148 8 10, tab 1
  text "Data in Bold Type", 1066, 139 149 60 8, tab 1
  check "", 832, 10 158 8 10, tab 1
  text "Enable !Seen", 1025, 19 159 60 8, tab 1
  check "", 810, 10 168 8 10, tab 1
  text "Auto !Ping Reply", 1026, 19 169 60 8, tab 1
  check "", 811, 10 178 8 10, tab 1
  text "Nick Alert", 1027, 19 179 50 8, tab 1
  check "Log", 1445, 45 178 20 10, tab 1
  check "", 812, 10 188 8 10, tab 1
  text "Dclk Nick Repond", 1028, 19 189 55 8, tab 1
  check "", 831, 70 158 8 10, tab 1
  text "Pager Always On", 1029, 79 159 55 8, tab 1 
  check "", 813, 70 168 8 10, tab 1
  text "Capture Notice Ads", 1030, 79 169 55 8, tab 1
  check "", 814, 70 178 8 10, tab 1
  text "Capture Text Ads", 1031, 79 179 55 8, tab 1
  check "", 815, 70 188 8 10, tab 1
  text "Gain Ops", 1032, 79 189 50 8, tab 1
  check "", 830, 130 158 8 10, tab 1
  text "Leave weak side of splits", 1033, 139 159 70 8, tab 1
  check "", 700, 130 168 8 10, tab 1
  text "Use Fserve Explorer", 1034, 139 169 60 8, tab 1
  check "", 541, 130 178 8 10, tab 1
  text "Enable VisuFix", 1035, 139 179 50 8, tab 1
  check "", 818, 130 188 8 10, tab 1
  text "File Server Anti-Idle", 1036, 139 189 60 8, tab 1

  box " Home Channels ", 898, 206 141 88 58, tab 1
  check "", 819, 210 148 8 9, tab 1
  text "Always in Channels", 1037, 219 149 47 8, tab 1
  check "", 57, 210 156 8 9, tab 1
  text "Learn Keys", 1038, 219 157 45 8, tab 1
  combo 58,210 165 60 37, tab 1 
  button "Add", 60, 272 165 20 9, tab 1
  button "Rem", 61, 272 175 20 9, tab 1

  box "", 730, 4 197 290 14, tab 1
  text "For mp3 playback use:", 734, 8 202 55 8, tab 1
  radio "mIRC (Windows)", 731, 65 201 50 9, tab 1 group
  radio "Winamp (pre 3.0)", 732, 120 201 50 9, tab 1
  radio "amip for Winamp", 733, 175 201 50 9, tab 1
  button "Announcement...", 735, 237 201 55 9, tab 1
  ; ####################   COLORS TAB ######################
  box "", 11, 4 16 224 60, tab 2 
  check "", 12, 6 22 8 8, tab 2
  text "Enable Nick Colors", 1039, 15 23 25 22, tab 2

  text "Regular:", 30, 40 22 50 10, tab 2
  combo 31, 40 31 40 120, tab 2 drop
  text "Ops: (@)", 13, 86 22 50 10, tab 2
  combo 14, 86 31 40 120, tab 2 drop
  text "HalfOps: (%)", 15, 132 22 50 10, tab 2
  combo 16, 132 31 40 120, tab 2 drop
  text "Voices: (+)", 17, 178 22 50 10, tab 2
  combo 18, 178 31 40 120, tab 2 drop

  text "Yourself:", 19, 40 47 50 10, tab 2
  combo 20, 40 56 40 120, tab 2 drop
  text "Founders: (~)", 1330, 86 47 50 10, tab 2
  combo 1331, 86 56 40 120, tab 2 drop
  text "Admins: (!)", 1313, 132 47 50 10, tab 2
  combo 1314, 132 56 40 120, tab 2 drop
  text "Protected Ops: (%&)", 1315, 178 47 50 10, tab 2
  combo 1316, 178 56 40 120, tab 2 drop

  button "Random", 21, 6 52 30 10, tab 2

  box "", 22, 227 16 67 60, tab 2
  check "", 23, 229 22 8 10, tab 2
  text "Enable Speech Color", 1041, 238 23 55 10, tab 2
  list 24, 240 35 50 35, tab 2
  button "Random", 106, 244 64 30 10, tab 2

  box "", 10, 4 76 178 61, tab 2
  check "", 100, 6 81 8 10, tab 2
  text "Enable Script Colors", 1042, 15 82 50 8, tab 2
  check "", 888, 6 91 8 8, tab 2
  text "Logo Bar Color Matches Secondary Color", 1043, 15 91 58 16, tab 2
  text "Primary:", 101, 80 84 50 10, tab 2
  list 102, 80 93 50 45, tab 2
  text "Secondary:", 103, 130 84 50 10, tab 2
  list 104, 130 93 50 45, tab 2
  check "Enable Black Background",506, 6 108 70 8, tab 2
  check "Enable White Background",507, 6 117 70 8, tab 2
  button "Random", 105, 10 125 30 10, tab 2

  box "",909,182 76 112 61, tab 2
  check "",912,185 81 8 10, tab 2
  text "Use Logo Color Theme",910,194 82 45 16, tab 2
  list 911, 240 93 50 45, tab 2
  check "",913,185 98 8 10, tab 2
  text "Reverse Selected Theme",916,194 99 45 16, tab 2
  text "Theme:",915,240 84 40 8, tab 2
  check "",914,185 115 8 10, tab 2
  text "Preview Theme",917,194 116 45 10, tab 2

  box "", 1150, 4 137 290 73, tab 2
  check "", 88, 6 142 8 10, tab 2
  text "Force User List Scheme", 1040, 15 143 70 8, tab 2
  text "Elite", 1600, 90 143 50 8, tab 2
  list 1200, 90 150 50 30, tab 2
  text "Fellow Ops", 1601, 140 143 50 8, tab 2
  list 1201, 140 150 50 30, tab 2
  text "Bots", 1602, 190 143 50 8, tab 2
  list 1202, 190 150 50 30, tab 2
  text "Friends", 1603, 240 143 50 8, tab 2
  list 1203, 240 150 50 30, tab 2

  text "Temp DCC", 1604, 90 178 50 8, tab 2
  list 1204, 90 185 50 30, tab 2
  text "DCC Banned", 1605, 140 178 50 8, tab 2
  list 1205, 140 185 50 30, tab 2
  text "Shitlist", 1606, 190 178 50 8, tab 2
  list 1206, 190 185 50 30, tab 2
  text "Ignored", 1607, 240 178 50 8, tab 2
  list 1207, 240 185 50 30, tab 2
  button "Set to Defaults", 1210, 8 162 50 10, tab 2

  box " Network Services ", 153, 107 130 187 80, tab 4
  text "Nickname:", 140, 177 152 50 10, tab 4
  text "Password:", 141, 242 152 50 10, tab 4
  edit "", 142, 175 159 60 10, tab 4 autohs
  edit "", 143, 240 159 50 10, pass, tab 4 autohs
  edit "", 144, 175 169 60 10, tab 4 autohs
  edit "", 145, 240 169 50 10, pass, tab 4 autohs
  edit "", 146, 175 179 60 10, tab 4 autohs
  edit "", 147, 240 179 50 10, pass, tab 4 autohs
  edit "", 148, 175 189 60 10, tab 4 autohs
  edit "", 149, 240 189 50 10, pass, tab 4 autohs
  edit "", 150, 175 199 60 10, tab 4 autohs
  edit "", 151, 240 199 50 10, pass, tab 4 autohs
  check "Enable Auto-Identify", 152, 112 150 60 10, tab 4
  check "Enable AutoGhost", 764, 112 162 60 10, tab 4
  check "Enable Auto Load Dalnet Menus", 850, 200 138 85 10, tab 4
  check "Enable Network Services", 166, 112 138 70 10, tab 4
  radio "",167, 130 172 8 9, tab 4
  text "Use Ghost", 1323, 138 173 30 10, tab 4
  radio "", 168, 130 182 8 9, tab 4
  text "Use Recover", 1324, 138 183 38 10, tab 4

  box "Trusted Nicknames:", 170, 4 130 100 80, tab 4
  combo 171, 7 142 60 70, tab 4
  button "Add", 172, 70 142 30 10, tab 4
  button "Rem", 173, 70 154 30 10, tab 4

  box " Incoming Screens ", 751, 4 19 290 80, tab 4
  check "", 756, 8 28 8 8, tab 4
  text "Block /MSGs from those not in a mutual channel", 1044, 17 29 120 8, tab 4
  check "", 781, 8 38 8 8, tab 4
  text "Block /MSGs from those not a friend or higher", 1045, 17 39 120 8, tab 4
  check "", 755, 8 48 8 8, tab 4
  text "Block /CTCPs from those not in Friends/Ops Lists", 1046, 17 49 120 8, tab 4
  check "", 757, 8 58 8 8, tab 4
  text "Block /CTCPs from those not in a mutual channel", 1047, 17 59 120 8, tab 4
  check "", 566, 150 28 8 10, tab 4
  text "Block CTCP mp3/SLOT", 1048, 159 29 80 8, tab 4
  check "", 760, 150 38 8 8, tab 4
  text "Block DCC Auto-Gets from those not permited", 1049, 159 39 120 8, tab 4
  check "", 758, 150 48 8 8, tab 4
  text "Block DCC Chats from those not a friend or higher", 1050, 159 49 125 8, tab 4
  check "", 759, 150 58 8 8, tab 4
  text "Block /Notices from those not in a mutual channel", 1051, 159 59 120 8, tab 4
  check "", 542, 8 68 8 10, tab 4
  text "Block File Server Ads", 1022, 17 69 120 8, tab 4
  check "", 543, 150 68 8 10, tab 4
  text "Block FTP Server Ads", 1023, 159 69 120 8, tab 4
  check "",544, 8 78 8 10, tab 4
  text "Block common triggers that start with ''!'' and ''@''", 1024, 17 79 120 8, tab 4
  check "", 762, 150 78 8 10, tab 4
  text "Block Channel XDCC Ads", 1068, 159 79 120 8, tab 4
  check "", 761, 8 89 8 8, tab 4
  text "Enable Spam Filter", 1021, 17 89 45 8, tab 4
  button "Edit Filter Settings", 29, 69 88 60 10, tab 4
  check "Capture Server Notices to Isolated Window (Global)", 749, 150 88 140 10, tab 4

  box " Mass Flood Protection ", 1070, 4 16 290 64, tab 7
  box " CTCP ", 210, 8 23 45 47, tab 7
  check "Enabled", 211, 10 30 30 10, tab 7
  text "Time Frame", 212, 10 43 29 10, tab 7 
  edit "", 213, 38 40 13 10, tab 7 center autohs
  text "Lines", 214, 10 52 28 10, tab 7 right
  edit "", 215, 38 49 13 10, tab 7 center autohs
  text "Ignore Time", 216, 10 61 29 8, tab 7
  edit "", 217, 38 58 13 10, tab 7 center autohs


  box " Invite ", 220, 55 23 45 47, tab 7
  check "Enabled", 221, 57 30 30 10, tab 7
  text "Time Frame", 222, 57 43 29 10, tab 7 
  edit "", 223, 85 40 13 10, tab 7 center autohs
  text "Lines", 224, 57 52 28 10, tab 7 right
  edit "", 225, 85 49 13 10, tab 7 center autohs
  text "Ignore Time", 226, 57 61 29 8, tab 7
  edit "", 227, 85 58 13 10, tab 7 center autohs

  box " Notice ", 230, 102 23 45 47, tab 7
  check "Enabled", 231, 104 30 30 10, tab 7
  text "Time Frame", 232, 104 43 29 10, tab 7 
  edit "", 233, 132 40 13 10, tab 7 center autohs
  text "Lines", 234, 104 52 28 10, tab 7 right
  edit "", 235, 132 49 13 10, tab 7 center autohs
  text "Ignore Time", 236, 104 61 29 8, tab 7
  edit "", 237, 132 58 13 10, tab 7 center autohs

  box " Text ", 240, 149 23 45 47, tab 7
  check "Enabled", 241, 151 30 30 10, tab 7
  text "Time Frame", 242, 151 43 29 10, tab 7 
  edit "", 243, 179 40 13 10, tab 7 center autohs
  text "Lines", 244, 151 52 28 10, tab 7 right
  edit "", 245, 179 49 13 10, tab 7 center autohs
  text "Ignore Time", 246, 151 61 29 8, tab 7
  edit "", 247, 179 58 13 10, tab 7 center autohs

  box " Join/Part ", 250, 196 23 45 47, tab 7
  check "Enabled", 251, 198 30 30 10, tab 7
  text "Time Frame", 252, 198 43 29 10, tab 7 
  edit "", 253, 226 40 13 10, tab 7 center autohs
  text "Lines", 254, 198 52 28 10, tab 7 right
  edit "", 255, 226 49 13 10, tab 7 center autohs
  text "Ignore Time", 256, 198 61 29 8, tab 7
  edit "", 257, 226 58 13 10, tab 7 center autohs

  box " Nick Change ", 260, 243 23 45 47, tab 7
  check "Enabled", 261, 245 30 30 10, tab 7
  text "Time Frame", 262, 245 43 29 10, tab 7 
  edit "", 263, 273 40 13 10, tab 7 center autohs
  text "Lines", 264, 245 52 28 10, tab 7 right
  edit "", 265, 273 49 13 10, tab 7 center autohs
  text "Ignore Time", 266, 245 61 29 8, tab 7
  edit "", 267, 273 58 13 10, tab 7 center autohs

  check "", 290, 90 70 8 9, tab 7
  text "Halt Logging on Trigger for", 291, 99 71 65 8, tab 7
  edit "", 292, 164 69 13 10, tab 7 center autohs
  text "seconds.", 293, 179 71 23 8, tab 7

  box " User Flood Protection ", 891, 4 80 290 68, tab 7
  box " CTCP ", 2110, 8 87 45 58, tab 7
  check "Enabled", 2111, 10 94 30 10, tab 7
  text "Time Frame", 2112, 10 107 29 10, tab 7 
  edit "", 2113, 38 104 13 10, tab 7 center autohs
  text "Lines", 2114, 10 117 28 10, tab 7 right
  edit "", 2115, 38 114 13 10, tab 7 center autohs
  text "Ignore Time", 2116, 10 126 29 8, tab 7
  edit "", 2117, 38 123 13 10, tab 7 center autohs
  check "Notify User", 2118, 10 135 40 9, tab 7

  box " Invite ", 2210, 55 87 45 58, tab 7
  check "Enabled", 2211, 57 94 30 10, tab 7
  text "Time Frame", 2212, 57 107 29 10, tab 7 
  edit "", 2213, 85 104 13 10, tab 7 center autohs
  text "Lines", 2214, 57 117 28 10, tab 7 right
  edit "", 2215, 85 114 13 10, tab 7 center autohs
  text "Ignore Time", 2216, 57 126 29 8, tab 7
  edit "", 2217, 85 123 13 10, tab 7 center autohs
  check "Notify User", 2218, 57 135 40 9, tab 7

  box " Notice ", 2310, 102 87 45 58, tab 7
  check "Enabled", 2311, 104 94 30 10, tab 7
  text "Time Frame", 2312, 104 107 29 10, tab 7 
  edit "", 2313, 132 104 13 10, tab 7 center autohs
  text "Lines", 2314, 104 117 28 10, tab 7 right
  edit "", 2315, 132 114 13 10, tab 7 center autohs
  text "Ignore Time", 2316, 104 126 29 8, tab 7
  edit "", 2317, 132 123 13 10, tab 7 center autohs
  check "Notify User", 2318, 104 135 40 9, tab 7

  box " Text ", 2410, 149 87 45 58, tab 7
  check "Enabled", 2411, 151 94 30 10, tab 7
  text "Time Frame", 2412, 151 107 29 10, tab 7 
  edit "", 2413, 179 104 13 10, tab 7 center autohs
  text "Lines", 2414, 151 117 28 10, tab 7 right
  edit "", 2415, 179 114 13 10, tab 7 center autohs
  text "Ignore Time", 2416, 151 126 29 8, tab 7
  edit "", 2417, 179 123 13 10, tab 7 center autohs
  check "Notify User", 2418, 151 135 40 9, tab 7


  box " DCC ", 2510, 196 87 45 58, tab 7
  check "Enabled", 2511, 198 94 30 10, tab 7
  text "Time Frame", 2512, 198 107 29 10, tab 7 
  edit "", 2513, 226 104 13 10, tab 7 center autohs
  text "Lines", 2514, 198 117 28 10, tab 7 right
  edit "", 2515, 226 114 13 10, tab 7 center autohs
  text "Ignore Time", 2516, 198 126 29 8, tab 7
  edit "", 2517, 226 123 13 10, tab 7 center autohs
  check "Notify User", 2518, 198 135 40 9, tab 7

  box " Fserve ", 2610, 243 87 45 58, tab 7
  check "Enabled", 2611, 245 94 30 10, tab 7
  text "Time Frame", 2612, 245 107 29 10, tab 7 
  edit "", 2613, 273 104 13 10, tab 7 center autohs
  text "Lines", 2614, 245 117 28 10, tab 7 right
  edit "", 2615, 273 114 13 10, tab 7 center autohs
  text "Ignore Time", 2616, 245 126 29 8, tab 7
  edit "", 2617, 273 123 13 10, tab 7 center autohs
  check "Notify User", 2618, 245 135 40 9, tab 7

  box " Self Scans and Logging ", 450, 4 149 290 60, tab 7
  check "", 752, 8 159 8 8, tab 7
  text "Run ScriptGuard at Startup", 1058, 17 160 65 8, tab 7
  check "" , 753, 8 169 8 8, tab 7
  text "Run ScriptCheck at Startup" , 1059, 17 170 65 8, tab 7
  check "", 765, 8 179 8 8, tab 7
  text "Run PortCheck at Startup", 1060, 17 180 65 8, tab 7
  check "", 754, 8 189 8 8, tab 7
  text "Log all CTCP Requests", 1061, 17 190 65 8, tab 7
  check "", 327, 8 199 8 10, tab 7
  text "Log Defensive Actions", 1062, 17 200 65 8, tab 7
  text "Immune Scripts" , 766, 94 155 42 8, tab 7 center
  button "+", 768, 85 156 7 7, tab 7 
  button "-", 769, 138 156 7 7, tab 7
  list 767, 85 165 60 45, tab 7

  check "", 661, 150 159 8 8, tab 7
  text "Use isolated report window", 1052, 159 160 65 8, tab 7

  box "Scanned Ports", 770, 234 155 55 52, tab 7
  check "", 771, 238 162 8 8, tab 7
  text "1-1024", 1053, 247 163 40 8, tab 7
  check "", 772, 238 171 8 8, tab 7
  text "1024-10,000", 1054, 247 172 40 8, tab 7
  check "", 773, 238 180 8 8, tab 7
  text "10,001-32,000", 1055, 247 181 40 8, tab 7
  check "", 774, 238 189 8 8, tab 7
  text "32,001-65,535", 1056, 247 190 40 8, tab 7
  check "", 775, 238 198 8 8, tab 7
  text "Common Ports", 1057, 247 199 40 8, tab 7

  ; ****************          Spare Text IDs 1066 -1067         ****************

  box " Ops and DeOps ", 300, 4 19 290 39, tab 8
  check "", 301, 10 25 8 10, tab 8
  text "Protect Ops from deops and kicks.", 1071, 19 26 110 8, tab 8
  check "", 302, 10 35 8 10, tab 8
  text "Allow /ctcp OPME <#chan> <pw> requests", 1072, 19 36 110 8, tab 8
  check "", 303, 10 45 8 10, tab 8
  text  "Deop on Server Op (excluding fellow ops)", 1073, 19 46 111 8, tab 8
  check "", 304, 135 25 8 10, tab 8
  text "Enable Bitch Mode (deop anyone not in fellow ops list)",  1074, 144 26 129 8, tab 8
  check "", 305, 135 35 8 10, tab 8
  text "Deop on mass deop (Fellow Ops excluded)", 1075, 144 36 121 8, tab 8
  check "Allow ''Op all Fellow Ops'' menu feature", 306, 135 45 8 10, tab 8
  text "Allow ''Op all Fellow Ops'' menu feature", 1063, 144 46 121 8, tab 8

  box " Kicks and Bans ", 310, 4 59 290 40, tab 8
  check "", 311, 10 66 8 10, tab 8
  text "Kick on Flood (excluding friends)", 1076, 19 67 106 8, tab 8
  check "", 312, 10 76 8 10, tab 8
  text "Kick on ''..will trade..''", 1077, 19 77 106 8, tab 8
  check "", 313, 135 66 8 10, tab 8
  text "Ban on Flood (excluding friends)", 1078, 144 67 106 8, tab 8
  check "", 314, 10 85 8 12, tab 8
  text "Kick/Ban Repeat Flood Offenders when", 1079, 19 87 106 8, tab 8
  edit "", 315, 115 86 11 9, tab 8 center
  text "or more repeated lines are detected.", 316, 127 87 115 10, tab 8
  check "", 317, 135 76 8 10, tab 8
  text "Kick and Temp Ban for nick change floods", 1080, 144 77 121 8, tab 8
  box " Channel Modes ", 400, 4 100 118 40, tab 8
  list 403, 8 108 70 35, tab 8
  radio "+", 404, 85 108 13 8, tab 8
  radio "-", 405, 100 108 13 8, tab 8
  button "Clear Set" 406,85 117 30 8, tab 8
  edit "", 407, 80 126 40 10, tab 8 autohs 
  box " Channels Affected By These Settings ", 320, 4 140 118 70, tab 8
  combo 321, 10 148 80 60, tab 8
  button "Add", 323, 95 148 20 15, tab 8
  button "Rem", 324, 95 163 20 15, tab 8
  box " Miscellaneous ", 325, 124 100 170 110, tab 8
  check "", 326, 130 108 8 10, tab 8
  text "Wallop Explanations for Actions", 1065, 139 109 91 8, tab 8
  check "", 348, 130 118 8 10, tab 8
  text "Learn New Channel Keys", 1081, 139 119 71 8, tab 8

  check "", 328, 130 128 8 10, tab 8
  text "Allow Remote Control Access to Friends when I'm Away", 1082, 139 129 150 8, tab 8
  text "Remote Control Password:", 329, 139 140 64 10, tab 8
  edit "", 330, 202 138 50 10, tab 8
  check "", 331, 130 150 8 10, tab 8
  text "Maintain Channel Occupancy Limit", 1083, 139 151 91 8, tab 8
  text "Adjust Every:", 332, 139 161 33 10, tab 8
  edit "", 333, 170 159 10 10, tab 8 center
  text "min.           Headroom:", 334, 181 161 60 10, tab 8
  edit "", 335, 234 159 10 10, tab 8 center
  check "", 336, 130 170 8 10, tab 8
  text "Moderate and Lock Down Under Multi Floods", 1084, 139 171 111 8, tab 8
  text "Lock down for:", 337, 139 181 38 10, tab 8
  edit "", 338, 175 179 10 10, tab 8 center
  text "min. on", 339, 185 181 19 10, tab 8
  edit "", 340, 203 179 10 10, tab 8 center
  text "events in", 341, 213 181 22 10, tab 8
  edit "", 342, 235 179 10 10, tab 8 center
  text "seconds.", 343, 245 181 20 10, tab 8

  check "", 817, 130 190 8 10, tab 8
  text "Auto +v Fserves", 1085, 139 191 41 8, tab 8
  check "", 866, 200 190 8 10, tab 8
  text "Auto +v FTP Ads", 1086, 209 191 36 8, tab 8
  check "Auto +v XDCC Ads", 736, 130 199 55 10, tab 8
  check "Auto +v mp3 Ads", 737, 200 199 55 10, tab 8

  ; ***************     Spare Text IDs 1087 - 1090    **************** 
  box " Defaults ", 530, 155 17 139 91, tab 9
  check "Use Global Settings For All Networks", 535, 164 25 120 9, tab 9

  check "Convert Bitrate from cps > kbs", 626, 164 34 90 9, tab 9

  text "Default Temp Ban Time:", 531, 164 45 60 10, tab 9
  edit "", 532, 224 43 15 10, tab 9 center autohs
  text "minutes", 534, 240 45 20 10, tab 9

  ; text "Special Sounds Allowance (1 every", 535, 164 45 84 10, tab 9
  ; edit "", 536, 249 43 15 10, tab 9 center autohs
  ; text "sec.)", 537, 264 45 15 10, tab 9

  text "Word Watcher responds (1 every", 538, 164 55 84 10, tab 9
  edit "", 539, 245 53 15 10, tab 9 center autohs
  text "sec.)", 540, 261 55 15 10, tab 9
  text "Bot Link Keep Active", 601, 164 65 53 8, tab 9
  edit "", 602, 214 63 15 10, tab 9 center autohs
  text "mins", 603, 230 65 15 8, tab 9
  text "Bot Link Connect Timeout", 611, 164 75 65 8, tab 9
  edit "", 612, 225 73 15 10, tab 9 center autohs
  text "sec", 613, 241 75 15 8, tab 9
  text "Temp DCC Permission Time:", 621, 164 85 70 8, tab 9
  edit "", 622, 228 83 17 10, tab 9 center autohs
  text "mins", 623, 246 85 15 8, tab 9
  check "Convert bytes > gb,mb,kb", 624, 164 95 75 9, tab 9
  button "Reset Uptime", 625, 240 95 50 10, tab 9

  box " Time Stamp Format ", 570, 4 17 145 70, tab 9
  edit "", 571, 35 25 80 10, tab 9, center autohs
  text "Format Variables", 572, 55 37 40 10, tab 9 
  text "Day: d, dd, ddd, dddd", 573, 20 46 60 8, tab 9
  text "1, 01, Mon, Monday", 578, 90 46 50 8, tab 9
  text "Hours: h, hh, H, HH", 574, 20 54 60 8, tab 9
  text "1, 01, 13, 13", 579, 90 54 40 8, tab 9
  text "Minutes: n, nn", 575, 20 62 60 8, tab 9
  text "1, 01", 580, 90 62 40 8, tab 9
  text "Seconds: s, ss", 576, 20 70 60 8, tab 9
  text "1, 01", 581, 90 70 40 8, tab 9
  text "AM/PM: t, tt", 577, 20 78 60 8, tab 9
  text "a/p, am/pm", 582, 90 78 40 8, tab 9
  ; text "The default format is: h:nntt", 583, 40 89 80 8, tab 9

  box " IAL Updating ", 740, 4 88 145 20, tab 9
  check "", 741, 10 96 9 9, tab 9
  text "Update IAL on Channel Join  (See Active Help)", 742, 19 97 120 8, tab 9

  box " Winamp Plugin Directory (or just the Winamp Main directory when using AMIP mode) ", 584, 4 110 290 20, tab 9
  edit "", 585, 8 118 270 10, tab 9
  button "...", 586, 279 119 10 8, tab 9

  box "Messenger Mode" , 590, 4 130 100 30, tab 9
  radio "Deliver on Text Detected", 591, 15 138 80 9, tab 9 group
  radio "Deliver on Channel Join", 592, 15 148 80 9, tab 9

  box "!Seen Tracking", 1305, 4 160 100 28, tab 9
  radio "Track Friends and higher",593, 8 168 70 9, tab 9 group
  radio "Track Everyone", 594, 8 178 50 9, tab 9

  box "!Seen Messaging", 1320, 4 188 100 20, tab 9
  radio "Use /notice",595, 8 196 37 9, tab 9 group
  radio "Channel Msg", 596, 52 196 40 9, tab 9

  box "HalfOp Support" , 650, 108 130 186 30, tab 9
  check "Force Always On", 651, 244 149 8 10, tab 9
  text "Force Always On", 1301, 253 151 40 8, tab 9
  text "Networks:", 1302, 112 139 25 8, tab 9
  edit "", 652, 138 138 154 10, tab 9 autohs
  text "Current Network", 1303, 113 150 40 8, tab 9
  edit "", 653, 155 149 60 10, tab 9 read autohs center
  button "ADD", 654, 216 149 18 9, tab 9

  box " Miscellaneous ", 1310, 108 160 186 48, tab 9
  check "", 655, 112 168 8 9, tab 9
  text "Do not scan for local drives in File Server Explorer",1311, 121 169 160 8, tab 9
  text "Nick Tag Format:", 1312, 112 179 43 8, tab 9
  edit "", 989, 155 177 137 10, tab 9 autohs

  tab "Additional Settings",1995
  text "Default Ban Type:",1996,10 25 45 10, tab 1995
  combo 1997,55 24 70 10, drop tab 1995

  box "Traytips",1998,9 40 120 50, tab 1995
  text "Enable Traytips for:",1999,12 50 60 10, tab 1995
  check "Nick Alert",2000,12 58 40 10, tab 1995
  check "Pager",2001,12 67 40 10, tab 1995
  check "Away",2002,12 76 40 10, tab 1995

  box "Notice Settings",2010,9 90 120 50, tab 1995
  radio "Show in Status",2011,12 99 100 10, group tab 1995
  radio "Show in Active",2012,12 109 100 10, tab 1995
  radio "Show in All Common Channels",2013,12 119 100 10, tab 1995
  check "If no Common Channels, show in Status",2014,20 129 105 10, tab 1995
  check "Hide clones in JOIN messages",2015,12 144 105 10, tab 1995
  check "Automatically change # to the channel name",2033,12 154 130 10, tab 1995
  check "Display DCC speed monitor on toolbar",2032,12 164 130 10, tab 1995
  check "Display Time and Date on toolbar",2050,12 174 130 10, tab 1995
  check "View Logs - Load all linked files",2051,12 184 130 10, tab 1995
  check "Separate @DCC_Info messages by date",2034,145 144 106 10, tab 1995
  edit "",2035,253 144 37 10, autohs tab 1995
  check "Indent date by",2036,155 154 45 10, tab 1995
  edit "",2037,200 154 20 10, tab 1995
  check "Enable 'Open File' link in @DCC_Info",2038,145 164 106 10, tab 1995
  check "Enable 'Open Location' link in @DCC_Info",2039,145 174 106 10, tab 1995 
  check "Enable warning when opening files",2040,145 184 106 10, tab 1995

  box "Connect on Start (irc.server.net port password)",2020,140 40 150 100, tab 1995
  check "Connect to these servers on start",2021,145 50 130 10, tab 1995
  combo 2022,145 62 110 78, autohs vsbar tab 1995
  button "Add",2023,260 62 25 10, tab 1995
  button "Rem",2024,260 74 25 10, tab 1995
  button "Up",2025,260 96 25 10, tab 1995
  button "Down",2026,260 108 25 10, tab 1995
}
On *:dialog:InvisMain:*:*:{
  if $devent == mouse { 
    .timer -om 1 500 MainHELP $mouse.x $mouse.y
  }
  if ($devent == init) {
    did -a $dname 1997 0: *!user@host
    did -a $dname 1997 1: *!*user@host
    did -a $dname 1997 2: *!*@host
    did -a $dname 1997 3: *!*user@*.host
    did -a $dname 1997 4: *!*@*.host
    did -a $dname 1997 5: nick!user@host
    did -a $dname 1997 6: nick!*user@host
    did -a $dname 1997 7: nick!*@host
    did -a $dname 1997 8: nick!*user@*.host
    did -a $dname 1997 9: nick!*@*.host
    if ($r.glob(Invision,DefaultBan) isnum 0-9) { did -c $dname 1997 $calc($v1 + 1) }
    else did -c $dname 1997 3
    set %lastmp3btn $r.mirc(Invision,mp3btn)
    set %Screen@ $gettok($dll(invision.dll,invisionRES,_),1,32)
    dialog -t $dname Main Settings for $iif($iSetwork != $null,$iSetwork,Global)
    .timerpladj* off
    if $eval($r.set(Invision,NickTagFormat),1) != $null { did -a $dname 989 $eval($r.set(Invision,NickTagFormat),1) }
    if ($r.glob(Invision,SettingsMethod) == Global) { did -c $dname 535 } 
    if ($r.set(Nick.Alert,Tooltip) == On) { did -c $dname 2000 }
    if ($r.set(Away,Tooltip.Away) == On) { did -c $dname 2002 }
    if ($r.set(Away,Tooltip.Pager) == On) { did -c $dname 2001 }
    if ($r.set(Invision,Notice.Location) == 1) { did -c $dname 2011 | did -b $dname 2014  }
    elseif ($r.set(Invision,Notice.Location) == 2) { did -c $dname 2012 | did -b $dname 2014 }
    elseif ($r.set(Invision,Notice.Location) == 3) { did -c $dname 2013 }
    else { did -c $dname 2013 }
    if ($r.set(Invision,Notice.Server) == 1) { did -c $dname 2014 }
    if ($r.set(Invision,HideClones) == On) { did -c $dname 2015 }
    if ($r.glob(Invision,ConnectOnStart) == On) { did -c $dname 2021 }
    if ($r.glob(DCCmgr,DCCSpeedMonitor) == On) { did -c $dname 2032 }
    if ($r.glob(Invision,TimeDisplay) == On) { did -c $dname 2050 }
    if ($r.glob(Invision,ViewLogLoadAll) == On) { did -c $dname 2051 }
    did $iif($gettok($readini(mirc.ini,options,n3),4,44) != 1,-h,-v) $dname 2051
    if ($r.glob(Invision,Replace#) != False) { did -c $dname 2033 }
    if ($r.glob(Fserve,DateWin) != Off) { did -c $dname 2034 | did -e $dname 2035,2036 } | else { did -b $dname 2035,2036,2037 }
    if ($r.glob(Fserve,DateWinFormat)) { did -ra $dname 2035 $v1 } | else { did -ra $dname 2035 mm/dd/yyyy }
    if ($r.glob(Fserve,DateWinIndent) != Off) {
      did -c $dname 2036
      if ($r.glob(Fserve,DateWin) != Off) { did -e $dname 2037 }
    }
    else { did -b $dname 2037 }
    if ($r.glob(Fserve,DateWinIndentValue) != $null) { did -ra $dname 2037 $v1 } | else { did -ra $dname 2037 0 }
    if ($r.glob(Fserve,OpenFile) == 1) { did -c $dname 2038 }
    if ($r.glob(Fserve,OpenLocation) == 1) { did -c $dname 2039 }
    if ($r.glob(Fserve,OpenFileWarning) != Off) { did -c $dname 2040 }
    if ($r.set(Invision,ForceIAL) == On) { did -c $dname 741 } 
    if ($r.glob(Invision,SnoticeCapt) == On) { did -c $dname 749 } 
    if $r.set(Filtering,BlockXDCC) == On { did -c $dname 762 }
    if $r.set(Invision,RegainNick) == On { did -c $dname 763 }
    if $r.set(Invision,AutoGhost) == On { did -c $dname 764 }
    if ( $r.set(Invision,GhostCmd) == Recover ) { did -c $dname 168 } | else { did -c $dname 167 }
    if $r.set(Messenger,Status) == On { did -c $dname 701 }
    if ($r.set(Invision,msgHistory) == On) { did -c $dname 702 }
    if ($r.set(Invision,BoldData) == On) { did -c $dname 703 }
    if $r.set(Invision,FXPnoscan) == On { did -c $dname 655 }
    if $r.set(Invision,ForceDalnet) == On { did -c $dname 166 }
    else { did -b $dname 152,764,850 }
    if $r.set(Invision,SeenTrack) == All { did -c $dname 594 } | else { did -c $dname 593 }
    if ( $r.set(Invision,SeenMsg) == Msg ) { did -c $dname 596 } | else { did -c $dname 595 }
    if $r.set(Invision,ForceHalfops) == On { did -c $dname 651 }
    did -a $dname 652 $r.set(Invision,HalfOpsList)
    did -a $dname 653 $iif($network != $null, $network, unknown)
    if $r.glob(Invision,RateFixOn) == On { did -c $dname 626 } 
    if $r.glob(Titlebar,Invision) == On { did -c $dname 480 } 
    if $r.glob(Titlebar,Fserve) == On { did -c $dname 482 }
    if $r.glob(titlebar,mp3inplay) == On { did -c $dname 483 }
    if $r.set(Invision,LearnKeys) == On { did -c $dname 57 } 
    if $r.set(Messenger,Mode) == Join { did -c $dname 592 } | else { did -c $dname 591 }
    var %fill1 = 00 White,01 Black,02 Blue,03 Green,04 Red,05 Brown,06 Purple,07 Orange,08 Yellow,09 Light Green,10 Cyan,11 Light Cyan,12 Royal Blue,13 Pink,14 Grey,15 Light Grey,16 Plain Text
    var %fill2 = 00 White,01 Black,02 Blue,03 Green,04 Red,05 Brown,06 Purple,07 Orange,08 Yellow,09 Light Green,10 Cyan,11 Light Cyan,12 Royal Blue,13 Pink,14 Grey,15 Light Grey
    dla InvisMain 102 %fill1
    dla InvisMain 104 %fill1
    dla InvisMain 14 %fill2
    dla InvisMain 16 %fill2
    dla InvisMain 18 %fill2
    dla InvisMain 20 %fill2
    dla InvisMain 24 %fill2
    dla InvisMain 31 %fill2
    dla InvisMain 1331 %fill2
    dla InvisMain 1316 %fill2
    dla InvisMain 1314 %fill2

    dla InvisMain 1200 %fill2
    dla InvisMain 1201 %fill2
    dla InvisMain 1202 %fill2
    dla InvisMain 1203 %fill2
    dla InvisMain 1204 %fill2
    dla InvisMain 1205 %fill2
    dla InvisMain 1206 %fill2
    dla InvisMain 1207 %fill2
    did -c InvisMain 1200 $calc($r.glob(Nick.Colors,Color.5) + 1)
    did -c InvisMain 1201 $calc($r.glob(Nick.Colors,Color.6) + 1)
    did -c InvisMain 1202 $calc($r.glob(Nick.Colors,Color.7) + 1)
    did -c InvisMain 1203 $calc($r.glob(Nick.Colors,Color.8) + 1)
    did -c InvisMain 1204 $calc($r.glob(Nick.Colors,Color.9) + 1)
    did -c InvisMain 1205 $calc($r.glob(Nick.Colors,Color.10) + 1)
    did -c InvisMain 1206 $calc($r.glob(Nick.Colors,Color.11) + 1)
    did -c InvisMain 1207 $calc($r.glob(Nick.Colors,Color.12) + 1)
    did -a InvisMain 911 Default (Gray)
    did -a InvisMain 911 Bloody
    did -a InvisMain 911 Candy Cane
    did -a InvisMain 911 Christmas
    did -a InvisMain 911 Fire
    did -a InvisMain 911 Fourth of July
    did -a InvisMain 911 Green
    did -a InvisMain 911 Ice    
    did -a InvisMain 911 Kids
    did -a InvisMain 911 Ocean
    did -a InvisMain 911 Primary Color
    did -a InvisMain 911 Secondary Color
    did -a InvisMain 911 Snowing
    did -a InvisMain 911 Spring Frost
    did -a InvisMain 911 Thanksgiving
    did -a InvisMain 911 Valentines
    did -a InvisMain 911 Violet
    if ($r.set(Colors,LogoTheme) == On) { did -c $dname 912 }
    if ($r.set(Colors,LogoThemeReverse) == On) { did -c $dname 913 }
    if ($r.set(Colors,LogoThemeNumber)) {
      if ($v1 == Default) { did -c $dname 911 1 }
      elseif ($v1 == Bloody) { did -c $dname 911 2 }
      elseif ($v1 == Candy Cane) { did -c $dname 911 3 }
      elseif ($v1 == Christmas) { did -c $dname 911 4 }
      elseif ($v1 == Fire) { did -c $dname 911 5 }
      elseif ($v1 == Fourth of July) { did -c $dname 911 6 }
      elseif ($v1 == Green) { did -c $dname 911 7 }
      elseif ($v1 == Ice) { did -c $dname 911 8 }
      elseif ($v1 == Kids) { did -c $dname 911 9 }
      elseif ($v1 == Ocean) { did -c $dname 911 10 }
      elseif ($v1 == Primaty Color) { did -c $dname 911 11 }
      elseif ($v1 == Secondary Color) { did -c $dname 911 12 }
      elseif ($v1 == Snowing) { did -c $dname 911 13 }
      elseif ($v1 == Spring Frost) { did -c $dname 911 14 }
      elseif ($v1 == Thanksgiving) { did -c $dname 911 15 }
      elseif ($v1 == Valentines) { did -c $dname 911 16 }
      elseif ($v1 == Violet) { did -c $dname 911 17 }
    }
    else did -c $dname 911 1
    if ($r.set(Colors,LogoThemePreview) == On) { did -c $dname 914 }
    if ($r.glob(Nick.Colors,Colors) == On) { did -c $dname 12 }
    if ($r.set(Colors,Speech) == On) { did -c $dname 23 }
    if ($r.glob(Nick.Colors,Color.0) !isnum 0-15) { did -c $dname 31 15 } | else { did -c $dname 31 $calc($r.glob(Nick.Colors,Color.0) + 1) }
    if ($r.glob(Nick.Colors,Color.1) !isnum 0-15) { did -c $dname 14 $rand(2,15) } | else { did -c $dname 14 $calc($r.glob(Nick.Colors,Color.1) + 1) }
    if ($r.glob(Nick.Colors,Color.2) !isnum 0-15) { did -c $dname 16 $rand(2,15) } | else { did -c $dname 16 $calc($r.glob(Nick.Colors,Color.2) + 1) }
    if ($r.glob(Nick.Colors,Color.3) !isnum 0-15) { did -c $dname 18 $rand(2,15) } | else { did -c $dname 18 $calc($r.glob(Nick.Colors,Color.3) + 1) }
    if ($r.glob(Nick.Colors,Color.4) !isnum 0-15) { did -c $dname 20 $rand(2,15) } | else { did -c $dname 20 $calc($r.glob(Nick.Colors,Color.4) + 1) }
    if ($r.glob(Nick.Colors,Color.13) !isnum 0-15) { did -c $dname 1331 $rand(2,15) } | else { did -c $dname 1331 $calc($r.glob(Nick.Colors,Color.13) + 1) }
    if ($r.glob(Nick.Colors,Color.14) !isnum 0-15) { did -c $dname 1314 $rand(2,15) } | else { did -c $dname 1314 $calc($r.glob(Nick.Colors,Color.14) + 1) }
    if ($r.glob(Nick.Colors,Color.15) !isnum 0-15) { did -c $dname 1316 $rand(2,15) } | else { did -c $dname 1316 $calc($r.glob(Nick.Colors,Color.15) + 1) }
    if ($r.set(Colors,Colors) == On) { did -c $dname 100 }
    if ($r.set(Colors,Color.1) !isnum 0-16) { did -c $dname 102 $gettok(3 4 5 6 7 8 11 13 14 15,$rand(1,10),32) } | else { did -c $dname 102 $calc($r.set(Colors,Color.1) + 1) }
    if ($r.set(Colors,Color.2) !isnum 0-16) { did -c $dname 104 $gettok(3 4 5 6 7 8 11 13 14 15,$rand(1,10),32) } | else { did -c $dname 104 $calc($r.set(Colors,Color.2) + 1) }
    if ($r.set(Colors,SpeechClr) !isnum 0-15) { did -c $dname 24 $gettok(3 4 5 6 7 8 11 13 14 15,$rand(1,10),32) } | else { did -c $dname 24 $calc($r.set(Colors,SpeechClr) + 1) }
    if ($r.set(Colors,BackgroundScript) isnum 0-1) { did -c $dname $iif($v1 == 1,506,507) }
    dla $dname 403 Only Ops Change Topic,No External Messages,Moderated,Invite Only,Secret,Private,Keyed,Registered nicks only
    dla $dname 321 $r.cf(ChanOps,Channels) 
    did -c $dname 321 1
    if ($r.set(ChanOps,LogDefense) == On) { did -c $dname 327 }
    if ($r.set(Invision,JmpOnSplit) == On) { did -c $dname 830 }
    if ($r.set(Invision,PagerAlways) == On) { did -c $dname 831 }
    if ($r.set(Invision,Seen) == On) { did -c $dname 832 }
    if ($r.set(Auto.Pinger,Status) == On) { did -c $dname 810 }
    if ($r.set(Nick.Alert,Status) == On) { did -c $dname 811 }
    else did -b $dname 1445
    if ($r.set(Nick.Alert,Log) == On) { did -c $dname 1445 }
    if ($r.set(Nick.Complete,Status) == On) { did -c $dname 812 }
    if ($r.set(Invision,IsoAds) == On) { did -c $dname 813 }
    if ($r.set(Invision,IsoAdsOT) == On) { did -c $dname 814 }
    if ($r.set(Services,Update) == On) { did -c $dname 850 }
    if ($r.set(Invision,Gainops) == On) { did -c $dname 815 }
    if ($r.set(Invision,Decrypt) == On) { did -c $dname 816 }   
    if ($r.set(Invision,AutoV) == On) { did -c $dname 817 }
    if ($r.set(Invision,AutoFTPv) == On) { did -c $dname 866 }
    if ($r.set(Invision,Fxp) == On) { did -c $dname 700 }
    if ($r.set(Invision,FserveAI) == On) { did -c $dname 818 }
    if ($r.set(Invision,AlwaysHome) == On) { did -c $dname 819 }
    if ($r.set(Invision,KeepNick) == On) { did -c $dname 822 }
    if ($r.glob(Lag.Checker,Status) == On) { did -c $dname 25 }
    did -ra $dname 27 $vnum($r.glob(Lag.Checker,Delay),15)
    did -ra $dname 821 $r.set(Personal.Info,Nick)
    did -ra $dname 86 $r.set(Invision,CryptKey)

    if ($r.glob(Titlebar,Lag) == On) { did -c $dname 80 }
    if ($r.glob(Titlebar,ChanStats) == On) { did -c $dname 81 }
    if ($r.glob(Titlebar,Server) == On) { did -c $dname 82 }
    if ($r.glob(Titlebar,Status) == On) { did -c $dname 83 }
    if ($r.glob(Titlebar,Time) == On) { did -c $dname 84 }
    if ($r.glob(Titlebar,Nick) == On) { did -c $dname 895 }
    if ($r.glob(Titlebar,Idle) == On) { did -c $dname 894 }

    if ($r.set(mFlood,CTCPStatus) == On) { did -c $dname 211 }
    did -ra $dname 213 $vnum($r.set(mFlood,CTCPDelay),1)
    did -ra $dname 215 $vnum($r.set(mFlood,CTCPLines),7)
    did -ra $dname 217 $vnum($r.set(mFlood,CTCPIgnoreTime),20)
    if ($r.set(mFlood,InviteStatus) == On) { did -c $dname 221 }
    did -ra $dname 223 $vnum($r.set(mFlood,InviteDelay),1)
    did -ra $dname 225 $vnum($r.set(mFlood,InviteLines),7)
    did -ra $dname 227 $vnum($r.set(mFlood,InviteIgnoreTime),20)
    if ($r.set(mFlood,NoticeStatus) == On) { did -c $dname 231 }
    did -ra $dname 233 $vnum($r.set(mFlood,NoticeDelay),1)
    did -ra $dname 235 $vnum($r.set(mFlood,NoticeLines),9)
    did -ra $dname 237 $vnum($r.set(mFlood,NoticeIgnoreTime),20)
    if ($r.set(mFlood,TextStatus) == On) { did -c $dname 241 }
    did -ra $dname 243 $vnum($r.set(mFlood,TextDelay),2)
    did -ra $dname 245 $vnum($r.set(mFlood,TextLines),20)
    did -ra $dname 247 $vnum($r.set(mFlood,TextIgnoreTime),20)
    if ($r.set(mFlood,JOINStatus) == On) { did -c $dname 251 }
    did -ra $dname 253 $vnum($r.set(mFlood,JOINDelay),1)
    did -ra $dname 255 $vnum($r.set(mFlood,JOINLines),9)
    did -ra $dname 257 $vnum($r.set(mFlood,JOINIgnoreTime),20)
    if ($r.set(mFlood,NickStatus) == On) { did -c $dname 261 }
    did -ra $dname 263 $vnum($r.set(mFlood,NickDelay),1)
    did -ra $dname 265 $vnum($r.set(mFlood,NickLines),7)
    did -ra $dname 267 $vnum($r.set(mFlood,NickIgnoreTime),20)
    if ($r.set(mFlood,LogHalt) == On) { did -c $dname 290 }
    did -ra $dname 292 $vnum($r.set(mFlood,LogHaltTime),20)

    if ($r.set(Flood,CTCPStatus) == On) { did -c $dname 2111 }
    did -ra $dname 2113 $vnum($r.set(Flood,CTCPDelay),2)
    did -ra $dname 2115 $vnum($r.set(Flood,CTCPLines),3)
    did -ra $dname 2117 $vnum($r.set(Flood,CTCPIgnoreTime),60)
    if ($r.set(Flood,CTCPNotify) == On) { did -c $dname 2118 }
    if ($r.set(Flood,InviteStatus) == On) { did -c $dname 2211 }
    did -ra $dname 2213 $vnum($r.set(Flood,InviteDelay),2)
    did -ra $dname 2215 $vnum($r.set(Flood,InviteLines),2)
    did -ra $dname 2217 $vnum($r.set(Flood,InviteIgnoreTime),60)
    if ($r.set(Flood,InviteNotify) == On) { did -c $dname 2218 }
    if ($r.set(Flood,NoticeStatus) == On) { did -c $dname 2311 }
    did -ra $dname 2313 $vnum($r.set(Flood,NoticeDelay),2)
    did -ra $dname 2315 $vnum($r.set(Flood,NoticeLines),5)
    did -ra $dname 2317 $vnum($r.set(Flood,NoticeIgnoreTime),60)
    if ($r.set(Flood,NoticeNotify) == On) { did -c $dname 2318 }
    if ($r.set(Flood,TextStatus) == On) { did -c $dname 2411 }
    did -ra $dname 2413 $vnum($r.set(Flood,TextDelay),2)
    did -ra $dname 2415 $vnum($r.set(Flood,TextLines),15)
    did -ra $dname 2417 $vnum($r.set(Flood,TextIgnoreTime),60)
    if ($r.set(Flood,TextNotify) == On) { did -c $dname 2418 }
    if ($r.set(Flood,DCCStatus) == On) { did -c $dname 2511 }
    did -ra $dname 2513 $vnum($r.set(Flood,DCCDelay),2)
    did -ra $dname 2515 $vnum($r.set(Flood,DCCLines),10)
    did -ra $dname 2517 $vnum($r.set(Flood,DCCIgnoreTime),60)
    if ($r.set(Flood,DCCNotify) == On) { did -c $dname 2518 }
    if ($r.set(Flood,FserveStatus) == On) { did -c $dname 2611 }
    did -ra $dname 2613 $vnum($r.set(Flood,FserveDelay),2)
    did -ra $dname 2615 $vnum($r.set(Flood,FserveLines),3)
    did -ra $dname 2617 $vnum($r.set(Flood,FserveIgnoreTime),180)
    if ($r.set(Flood,FserveNotify) == On) { did -c $dname 2618 }

    did -ra $dname 142 $r.set(Auto.Id,Nick.1)
    did -ra $dname 143 $r.set(Auto.Id,Pass.1)
    did -ra $dname 144 $r.set(Auto.Id,Nick.2)
    did -ra $dname 145 $r.set(Auto.Id,Pass.2)
    did -ra $dname 146 $r.set(Auto.Id,Nick.3)
    did -ra $dname 147 $r.set(Auto.Id,Pass.3)
    did -ra $dname 148 $r.set(Auto.Id,Nick.4)
    did -ra $dname 149 $r.set(Auto.Id,Pass.4)
    did -ra $dname 150 $r.set(Auto.Id,Nick.5)
    did -ra $dname 151 $r.set(Auto.Id,Pass.5)
    if ($r.set(Auto.Id,Status) == On) { did -c $dname 152 }
    dla $dname 171 $r.set(Trusted.Nicks,Nicknames)
    if ($r.set(Auto.Greet,Status) == On) { did -c $dname 180 }
    if ($r.set(Auto.Greet,Channels) == All) || ($r.set(Auto.Greet,Channels) == $null) { did -c $dname 183 | did -b $dname 182,184,185 }
    else { dla $dname 182 $r.set(Auto.Greet,Channels) }
    dla $dname 767 $r.glob(Invision,ScriptList)
    did -ra $dname 532 $r.glob(Invision,DefBan)
    if ($did($dname,321).lines >= 2) { did -c $dname 321 2 } | else { did -c $dname 321 1 }
    choCLEAR
    choLOAD $did($dname,321).seltext 
    if $r.glob(Invision,PortChk) == On { did -c $dname 765 }
    if $r.glob(Invision,PortRng1) == On { did -c $dname 771 }
    if $r.glob(Invision,PortRng2) == On { did -c $dname 772 }
    if $r.glob(Invision,PortRng3) == On { did -c $dname 773 }
    if $r.glob(Invision,PortRng4) == On { did -c $dname 774 }
    if $r.glob(Invision,PortRng5) == On { did -c $dname 775 }
    AlwaysHomeOff
    if ($r.glob(Invision,SizeOn) == On) { did -c $dname 624 }
    if ($r.glob(Nick.Colors,ForceUL) == On) { did -c $dname 88 }
    if ($r.set(Colors,Logo) == On) { did -c $dname 888 }
    if ($r.glob(Invision,ScriptGuard) == On) { did -c $dname 752 }
    if ($r.glob(Invision,ScriptCheck) == On) { did -c $dname 753 }
    if ($r.set(Invision,LogCTCP) == On) { did -c $dname 754 }
    if ($r.set(Invision,BlockCTCP2) == On) { did -c $dname 755 }
    if ($r.set(Invision,AutoGets) == On) { did -c $dname 760 }
    if ($r.set(Invision,SpamFilter) == On) { did -c $dname 761 }
    if ($r.set(Invision,BlockMSG) == On) { did -c $dname 756 }
    if ($r.set(Invision,BlockMSG2) == On) { did -c $dname 781 }
    if ($r.set(Invision,BlockCTCP) == On) { did -c $dname 757 }
    if ($r.set(Invision,BlockDCC) == On) { did -c $dname 758 }
    if ($r.set(Invision,BlockNOTICE) == On) { did -c $dname 759 }
    if ($r.set(Invision,Stealth) == On) { did -c $dname 851 }
    if ($r.mirc(Invision,mp3btn) == On) { did -c $dname 871 }
    if ($r.glob(TitleBar,Socks) == On) { did -c $dname 852 }
    if ($r.glob(TitleBar,Bots) == On) { did -c $dname 853 }
    if ($r.set(Invision,NoticePrompt) == On) { did -c $dname 562 }
    if ($r.set(Invision,BlockFS) == On) { did -c $dname 542 }
    if ($r.set(Invision,BlockFTP) == On) { did -c $dname 543 }
    if ($r.set(Invision,BlockTrig) == On) { did -c $dname 544 }
    if ($r.set(Invision,isoWhois) == On) { did -c $dname 565 }
    if ($r.set(Invision,BlockSLOT) == On) { did -c $dname 566 }
    if ($r.glob(Invision,PortsIso) == On) { did -c $dname 661 }
    if ($r.glob(Invision,mp3ExtInfo) == Active) { did -c $dname 861 }
    if ($r.glob(Invision,WinAmp) == On) { did -c $dname 732 } 
    elseif ($r.glob(Invision,amip) == On) { did -c $dname 733 }
    else { did -c $dname 731 }
    if ($r.set(Fserve,DMC) == On) { did -c $dname 561 }
    ;    if ($r.glob(Invision,AutoUpdate) == On) { did -c $dname 563 }
    did -b $dname 563
    dla $dname 58 $r.set(Personal.Info,HomeChannel)
    did -ra $dname 571 $r.glob(Invision,TS)
    did -ra $dname 539 $r.set(Invision,WWtime)
    did -ra $dname 585 $isset($r.glob(Invision,WinampDir),C:\Program Files\WinAmp\Plugins\)
    if ($r.glob(Invision,LagBarGraphic) == On) { did -c $dname 28 }
    if ($r.set(Invision,VisuFix) == On) { did -c $dname 541 }
    if ($r.set(Invision,ChanScan) == On) { did -c $dname 560 }
    did -ra $dname 622 $r.glob(Invision,TempDCCtime)
    did -ra $dname 602 $r.glob(Invision,BotKeepTime)
    did -ra $dname 612 $r.glob(Invision,BotConnTO)
    var %c = 1, %t = $lines($shortfn($mircdir\Invision\Settings\Servers.lst))
    while (%c <= %t) {
      did -a $dname 2022 $read($shortfn($mircdir\Invision\Settings\Servers.lst),%c)
      inc %c
    }
  }
  if ($devent == sclick) {
    if $did == 2023 && $did($dname,2022) {
      did -a $dname 2022 $did($dname,2022)
      did -u $dname 2022
    }
    elseif $did == 2024 && $did($dname,2022).sel {
      did -d $dname 2022 $did($dname,2022).sel
      did -u $dname 2022
    }
    elseif $did == 2025 && $did($dname,2022).sel && $did($dname,2022).sel != 1 {
      var %sel.num = $did($dname,2022).sel
      var %sel.text = $did($dname,2022).seltext
      did -d $dname 2022 %sel.num
      did -i $dname 2022 $calc(%sel.num - 1) %sel.text
      did -c $dname 2022 $calc(%sel.num - 1)
    }
    elseif $did == 2026 && $did($dname,2022).sel && $did($dname,2022).sel != $did($dname,2022).lines {
      var %sel.num = $did($dname,2022).sel
      var %sel.text = $did($dname,2022).seltext
      did -d $dname 2022 %sel.num
      did -i $dname 2022 $calc(%sel.num + 1) %sel.text
      did -c $dname 2022 $calc(%sel.num + 1)
    }
    elseif $did == 2034 {
      if ($did($dname,2034).state == 1) {
        did -e $dname 2035,2036
        if ($did($dname,2036).state == 1) { did -e $dname 2037 }
      }
      else { did -b $dname 2035,2036,2037 }
    }
    elseif $did == 2036 {
      if ($did($dname,2036).state == 1) { did -e $dname 2037 }
      else { did -b $dname 2037 }
    }
    if $did isnum 2011-2012 { did -b $dname 2014 }
    elseif $did == 2013 { did -e $dname 2014 }
    if $did == 12 {
      if ($did(12).state == 0) { NickColorClr }
      else { NickListClr }
    }
    if $did == 88 {
      if ($did(88).state == 0) { NickColorClr }
      else { UserListClr }
    }
    if $did == 811 {
      if ($did(811).state == 1) { did -e $dname 1445 }
      else did -b $dname 1445
    }
    if $did == 25 {
      if ($did(25).state == 1) { did -c $dname 80 }
    }
    if $did == 29 { dialog -m spamfilters spamfilters }
    if $did == 1210 {
      var %ct = 1200
      var %defaults = 7,14,13,11,4,8,5,15
      while (%ct <= 1207) {
        did -c InvisMain %ct $gettok(%defaults, $calc(%ct - 1199),44)
        inc %ct 1
      }
    }
    if $did == 654 {
      if $inetwork != $null { 
        w.set Invision HalfOpsList $addtok($r.set(Invision,HalfOpsList),$iNetwork,44) 
        aecho entered halfop network routine! >> $r.set(Invision,HalfOpsList)
        did -ra $dname 652 $r.set(Invision,HalfOpsList)
      }
      else { var %dummy = $input(You cannot add ''unknown'' networks. If the iRC network you use supports half ops but shows up unknown you can check ''Force Always On" to enable then menu options.,68,Cannot Add Network!) } 
    }
    if $did == 403 {
      if $did($dname,403).seltext == Keyed { did -v $dname 407 } | else { did -h $dname 407 }
      chmodeCLR 
      if $chmodeLOAD($did($dname,321).seltext,$chmodeLTR) == P { did -c $dname 404 }
      if $chmodeLOAD($did($dname,321).seltext,$chmodeLTR) == M { did -c $dname 405 }
    }
    if ($did == 506 && $did($dname,506).state == 1 && $did($dname,507).state == 1) { did -u $dname 507 }
    elseif ($did == 507 && $did($dname,506).state == 1 && $did($dname,507).state == 1) { did -u $dname 506 }
    if $did == 404 { 
      if $chmodeLTR != k {
        chmodeSAVE [ $did($dname,321).seltext + [ $+ [ $chmodeLTR ] ] ]
      } 
      else { 
        chmodeSAVE [ $did($dname,321).seltext + [ $+ [ $chmodeLTR ] ] [ $+ [ $did($dname,407).text ] ] ]
      }
    }
    if $did == 405 { 
      if $chmodeLTR != k {
        chmodeSAVE [ $did($dname,321).seltext - [ $+ [ $chmodeLTR ] ] ]
      } 
      else { 
        chmodeSAVE [ $did($dname,321).seltext - [ $+ [ $chmodeLTR ] ] ] 
      }
    }
    if $did == 735 { mp3annouceset | dopen InvisMain InvisMain }
    if $did == 406 {
      did -u $dname 404,405 
      chmodeDEL $did($dname,321).seltext $chmodeLTR
    }
    if $did >= 1 && $did <= 9 { did -r $dname 1502 }
    if $did == 321 {
      choCLEAR
      chmodeCLR
      choLOAD $did($dname,321).seltext 
    }
    if $did == 625 { w.glob Invision UTRecord 0 }
    if ($did == 106) { did -c $dname 24 $gettok(3 4 5 6 7 8 11 13 14 15,$rand(1,10),32) }
    if ($did == 105) { did -c $dname 102 $gettok(3 4 5 6 7 8 11 13 14 15,$rand(1,10),32) | did -c $dname 104 $gettok(3 4 5 6 7 8 11 13 14 15,$rand(1,10),32) }
    if ($did == 21) { did -c $dname 14 $gettok(2 3 4 5 6 7 8 9 10 11 12 13 14 15,$rand(1,14),32) | did -c $dname 16 $gettok(2 3 4 5 6 7 8 9 10 11 12 13 14 15,$rand(1,14),32) | did -c $dname 18 $gettok(2 3 4 5 6 7 8 9 10 11 12 13 14 15,$rand(1,14),32) | did -c $dname 20 $gettok(2 3 4 5 6 7 8 9 10 11 12 13 14 15,$rand(1,14),32) }
    if ($did == 163) { if ($did($dname,$did).state == 1) { did -b $dname 162,164,165 } | else { did -e $dname 162,164,165 } }
    if ($did == 164) && ($did($dname,162).sel == $null || $did($dname,162).sel == 0) && ($did($dname,162).text != $null) { did -a $dname 162 $vc($did($dname,162).text) | did -c $dname 162 $did($dname,162).lines }
    if ($did == 165) && ($did($dname,162).sel isnum) { did -d $dname 162 $did($dname,162).sel }
    if ($did == 172) && ($did($dname,171).sel == $null || $did($dname,171).sel == 0) && ($did($dname,171).text != $null) { did -a $dname 171 $did($dname,171).text | did -c $dname 171 $did($dname,171).lines }
    if ($did == 173) && ($did($dname,171).sel isnum) { did -d $dname 171 $did($dname,171).sel }
    if ($did == 183) { if ($did($dname,$did).state == 1) { did -b $dname 182,184,185 } | else { did -e $dname 182,184,185 } }
    if ($did == 184) && ($did($dname,182).sel == $null || $did($dname,182).sel == 0) && ($did($dname,182).text != $null) { did -a $dname 182 $vc($did($dname,182).text) | did -c $dname 182 $did($dname,182).lines }
    if ($did == 185) && ($did($dname,182).sel isnum) { did -d $dname 182 $did($dname,182).sel }
    if ($did == 323) && ($did($dname,321).sel == $null || $did($dname,321).sel == 0) && ($did($dname,321).text != $null) {
      did -a $dname 321 $vc($did($dname,321).text) 
      did -c $dname 321 $did($dname,321).lines
      w.cf Chanset $did($dname,321).seltext $r.cf(Chanset,Default)
      w.cf Chanmodes $did($dname,321).seltext $r.cf(Chanmodes,Default)
      choCLEAR
      choLOAD $did($dname,321).seltext 
    }
    if ($did == 324) && ($did($dname,321).sel isnum) && ($did($dname,321).seltext != Default) { choDEL $did($dname,321).seltext | did -d $dname 321 $did($dname,321).sel | choCLEAR | chmodeCLR }
    if $did == 768 {
      did -a $dname 767 $nopath($sfile($mircdir,Select Script to Add))
      did -c $dname 767 $did($dname,767).lines
    }
    if ($did == 769) && ($did($dname,767).sel isnum) { did -d $dname 767 $did($dname,767).sel }
    if ($did == 771) || ($did == 772) || ($did == 773) || ($did == 774) {
      if $did($dname,771).state == 1 && $did($dname,772).state == 1 && $did($dname,773).state == 1 && $did($dname,774).state == 1 {
        did -ub $dname 775
      }
      else { did -e $dname 775 }
    }
    if $did == 88 { if $did($dname,88).state == 1 { did -u $dname 12 } } 
    if $did == 12 { if $did($dname,12).state == 1 { did -u $dname 88 } } 
    if ($did == 60) && ($did($dname,58).sel == $null || $did($dname,58).sel == 0) && ($did($dname,58).text != $null) { did -a $dname 58 $vc($did($dname,58).text) | did -c $dname 58 $did($dname,58).lines }
    if ($did == 61) && ($did($dname,58).sel isnum) { did -d $dname 58 $did($dname,58).sel }
    if $did == 499 {  
      if ($did($dname,819).state == 1) { w.set Invision AlwaysHome On | AlwaysHomeOn | JoinHomes } | else { w.set Invision AlwaysHome Off | AlwaysHomeOff } 
      if $r.mirc(Invision,mp3btn) == On { testmp3 } | else { teststop }
      if $r.glob(DCCmgr,DCCSpeedMonitor) == On { dispdccbar } | else { stopdccbar }
      tbar
      USDstat
      chmodeEnforce
      pladjsetup
      if $r.glob(Invision,TS) != $null { .timestamp -fe $r.glob(Invision,TS) | .timestamp on } | else { .timestamp off }
      if $r.glob(Nick.Colors,ForceUL) == On { UserListCLR } | else  { if $r.glob(Nick.Colors,Colors) == On { NickListCLR } }

    }
    if $did == 586 {
      var %dn = $sdir(C:\Program Files\Winamp\Plugins\,Select your Winamp Plugins Directory)
      did -ra $dname 585 %dn
    }
    if $did == 733 {
      if ($isfile($shortfn($r.glob(Invision,WinampDir) $+ \wacs\amip.dll)) != $true) && ($isfile($shortfn($r.glob(Invision,WinampDir) $+ \plugins\gen_irc.dll)) != $true) { var %dum = $input(Please make sure you have installed AMIP for Winamp and set the correct path to your winamp main directory (not plugin directory) located on the ADV tab here in Main Settings before enabling this mode,ow,AMIP not detected!) | did -u $dname 733 | did -c $dname 731 }
    }
    if $did == 166 {
      if $did($dname,166).state == 1 { did -e $dname 152,764,850 }
      else { did -b $dname 152,764,850 }
    }
    if $did == 911 || $did == 913 || $did == 912 || $did == 888 {
      if $did($dname,913).state == 1 { w.set  Colors LogoThemeReverse On } | else { w.set Colors LogoThemeReverse Off }
      if $did($dname,912).state == 1 { w.set  Colors LogoTheme On } | else { w.set Colors LogoTheme Off }
      if $did($dname,911).seltext { w.set Colors LogoThemeNumber $v1 }
      if $did($dname,888).state == 1 { w.set Colors Logo On } | else { w.set Colors Logo Off }
      if $did == 888 { usdstat }
      if $did($dname,914).state == 1 && $did($dname,912).state == 1 { echo -a $ilogo }
    }
    if $did != 498 && $did != 500 { click }
    if ($did == 498) || ($did == 500) { 
      setsaved
      if $did($dname,1997).sel { w.glob Invision DefaultBan $calc($v1 - 1) }
      if $did($dname,2000).state == 1 { w.set Nick.Alert Tooltip On } | else { w.set Nick.Alert Tooltip Off }
      if $did($dname,2001).state == 1 { w.set Away Tooltip.Pager On } | else { w.set Away Tooltip.Pager Off }
      if $did($dname,2002).state == 1 { w.set Away Tooltip.Away On } | else { w.set Away Tooltip.Away Off }
      if $did($dname,2011).state == 1 { w.set Invision Notice.Location 1 } | elseif $did($dname,2012).state == 1 { w.set Invision Notice.Location 2 } | else { w.set Invision Notice.Location 3 }
      if $did($dname,2014).state == 1 { w.set Invision Notice.Server 1 } | else { w.set Invision Notice.Server 0 }
      if $did($dname,2015).state == 1 { w.set Invision HideClones On } | else { w.set Invision HideClones Off }
      if $did($dname,2021).state == 1 { w.glob Invision ConnectOnStart On } | else { w.glob Invision ConnectOnStart Off }
      if $did($dname,2032).state == 1 { w.glob DCCmgr DCCSpeedMonitor On | dispdccbar } | else { w.glob DCCmgr DCCSpeedMonitor Off | stopdccbar | unset %ispeed.disp }
      if $did($dname,2050).state == 1 { w.glob Invision TimeDisplay On | disptimebar } | else { w.glob Invision TimeDisplay Off | stoptimebar }
      if $did($dname,2051).state == 1 { w.glob Invision ViewLogLoadAll On } | else { w.glob Invision ViewLogLoadAll Off }
      if $did($dname,2033).state == 1 { w.glob Invision Replace# True } | else { w.glob Invision Replace# False }
      if $did($dname,2034).state == 1 { w.glob Fserve DateWin On } | else { w.glob Fserve DateWin Off }
      if $did($dname,2035) { w.glob Fserve DateWinFormat $v1 } | else { w.glob Fserve DateWinFormat mm/dd/yyyy }
      if $did($dname,2036).state == 1 { w.glob Fserve DateWinIndent On } | else { w.glob Fserve DateWinIndent Off }
      if $did($dname,2037) { w.glob Fserve DateWinIndentValue $v1 } | else { w.glob Fserve DateWinIndentValue 0 }
      if $did($dname,2038).state == 1 { w.glob Fserve OpenFile $v1 } | else { w.glob Fserve OpenFile 0 }
      if $did($dname,2039).state == 1 { w.glob Fserve OpenLocation $v1 } | else { w.glob Fserve OpenLocation 0 }
      if $did($dname,2040).state == 1 { w.glob Fserve OpenFileWarning On } | else { w.glob Fserve OpenFileWarning Off }
      .fopen -o iServers $qt($shortfn($mircdir\Invision\Settings\Servers.lst))
      var %c = 1, %t = $did($dname,2022).lines
      while (%c <= %t) {
        .fwrite -n iServers $did($dname,2022,%c)
        inc %c
      }
      .fclose iServers
      if $did($dname,506).state == 1 { w.set Colors BackgroundScript 1 }
      elseif $did($dname,507).state == 1 { w.set Colors BackgroundScript 0 }
      elseif ($did($dname,506).state == 0 && $did($dname,507).state == 0) { w.set Colors BackgroundScript 2 }
      if $did($dname,912).state == 1 { w.set  Colors LogoTheme On } | else { w.set Colors LogoTheme Off }
      if $did($dname,914).state == 1 { w.set  Colors LogoThemePreview On } | else { w.set Colors LogoThemePreview Off }
      if $did($dname,535).state == 1 { w.glob Invision SettingsMethod Global } | else { w.glob Invision SettingsMethod Normal }
      if $did($dname,741).state == 1 { w.set Invision ForceIAL On } | else { w.set Invision ForceIAL Off }
      if $did($dname,749).state == 1 { w.glob Invision SNoticeCapt On } | else { w.glob Invision SNoticeCapt Off }
      if $did($dname,762).state == 1 { w.set Filtering BlockXDCC On } | else { w.set Filtering BlockXDCC Off }
      if $did($dname,763).state == 1 { w.set Invision RegainNick On } | else { w.set Invision RegainNick Off }
      if $did($dname,764).state == 1 { w.set Invision AutoGhost On } | else { w.set Invision AutoGhost Off }
      if $did($dname,168).state == 1 { w.set Invision GhostCmd Recover } | else { w.set Invision GhostCmd Ghost }
      if $did($dname,701).state == 1 { w.set Messenger Status On } | else { w.set Messenger Status Off }
      if $did($dname,702).state == 1 { w.set Invision msgHistory On } | else { w.set Invision msgHistory Off }
      if $did($dname,703).state == 1 { w.set Invision BoldData On } | else { w.set Invision BoldData Off }
      if $eval($did($dname,989).text,1) != $null { w.set Invision NickTagFormat $eval($did($dname,989).text,1) } | else { d.set Invision NickTagFormat }
      if $did($dname,655).state == 1 { w.set Invision FXPnoscan On } | else { w.set Invision FXPnoscan Off }
      if $did($dname,166).state == 1 { w.set Invision ForceDalnet On } | else { w.set Invision ForceDalnet Off }
      if $did($dname,594).state == 1 { w.set Invision SeenTrack All } | else { w.set Invision SeenTrack Friends }
      if $did($dname,596).state == 1 { w.set Invision SeenMsg Msg } | else { w.set Invision SeenMsg Notice }
      if $did($dname,652).text != $null { w.set Invision HalfOpsList $did($dname,652).text } | else { d.set Invision HalfOpsList }
      if $did($dname,651).state == 1 { w.set Invision ForceHalfOps On } | else { w.set Invision ForceHalfOps Off }
      if $did($dname,592).state == 1 { w.set Messenger Mode Join } | else { w.set Messenger Mode Text }
      if $did($dname,58).lines != 0 { dls $dname 58 w.set Personal.Info HomeChannel } | else { d.set Personal.Info HomeChannel }
      if ($did($dname,28).state == 1) { w.glob Invision LagBarGraphic On } | else { w.glob Invision LagBarGraphic Off }
      if ($did($dname,541).state == 1) { w.set Invision VisuFix On } | else { w.set Invision VisuFix Off }
      if ($did($dname,542).state == 1) { w.set Invision BlockFS On } | else { w.set Invision BlockFS Off }
      if ($did($dname,543).state == 1) { w.set Invision BlockFTP On } | else { w.set Invision BlockFTP Off }
      if ($did($dname,544).state == 1) { w.set Invision BlockTrig On } | else { w.set Invision BlockTrig Off }
      if ($did($dname,752).state == 1) { w.glob Invision ScriptGuard On } | else { w.glob Invision ScriptGuard Off }
      if ($did($dname,753).state == 1) { w.glob Invision ScriptCheck On } | else { w.glob Invision ScriptCheck Off }
      if ($did($dname,754).state == 1) { w.set Invision LogCTCP On } | else { w.set Invision LogCTCP Off }
      if ($did($dname,755).state == 1) { w.set Invision BlockCTCP2 On } | else { w.set Invision BlockCTCP2 Off }
      if ($did($dname,760).state == 1) { w.set Invision AutoGets On } | else { w.set Invision AutoGets Off }
      if ($did($dname,761).state == 1) { w.set Invision SpamFilter On } | else { w.set Invision SpamFilter Off }
      if ($did($dname,756).state == 1) { w.set Invision BlockMSG On } | else { w.set Invision BlockMSG Off }
      if ($did($dname,781).state == 1) { w.set Invision BlockMSG2 On } | else { w.set Invision BlockMSG2 Off }
      if ($did($dname,757).state == 1) { w.set Invision BlockCTCP On } | else { w.set Invision BlockCTCP Off }
      if ($did($dname,758).state == 1) { w.set Invision BlockDCC On } | else { w.set Invision BlockDCC Off }
      if ($did($dname,759).state == 1) { w.set Invision BlockNOTICE On } | else { w.set Invision BlockNOTICE Off }
      if ($did($dname,851).state == 1) { w.set Invision Stealth On } | else { w.set Invision Stealth Off }
      if ($did($dname,871).state == 1) { w.mirc Invision mp3btn On } | else { w.mirc Invision mp3btn Off }
      if ($did($dname,852).state == 1) { w.glob Titlebar Socks On } | else { w.glob Titlebar Socks Off }
      if ($did($dname,853).state == 1) { w.glob Titlebar Bots On } | else { w.glob Titlebar Bots Off }
      if ($did($dname,565).state == 1) { w.set Invision isoWhois On } | else { w.set Invision isoWhois Off }
      if ($did($dname,566).state == 1) { w.set Invision BlockSLOT On } | else { w.set Invision BlockSLOT Off }
      if ($did($dname,661).state == 1) { w.glob Invision PortsIso On } | else { w.glob Invision PortsIso Off }
      if ($did($dname,861).state == 1) { w.glob Invision mp3ExtInfo Active } | else { w.glob Invision mp3ExtInfo Status }
      if ($did($dname,732).state == 1) { w.glob Invision Winamp On | w.glob Invision amip Off }
      elseif ($did($dname,733).state == 1) { w.glob Invision amip On | w.glob Invision Winamp Off }
      else { w.glob Invision Winamp Off | w.glob Invision amip Off }
      if ($did($dname,624).state == 1) { w.glob Invision SizeOn On } | else { w.glob Invision SizeOn Off }
      if ($did($dname,563).state == 1) { w.glob Invision AutoUpdate On } | else { w.glob Invision AutoUpdate Off }
      if ($did($dname,57).state == 1) { w.set Invision LearnKeys On } | else { w.set Invision LearnKeys Off }
      if ($did($dname,561).state == 1) { w.set Fserve DMC On } | else { w.set Fserve DMC Off }
      if ($did($dname,562).state == 1) { w.set Invision NoticePrompt On } | else { w.set Invision NoticePrompt Off }
      if ($did($dname,560).state == 1) { w.set Invision ChanScan On } | else { w.set Invision ChanScan Off }
      w.set Invision WWtime $isset($did($dname,539).text,60)
      w.glob Invision BotKeepTime $isset($did($dname,602).text,60)
      w.glob Invision BotConnTO $isset($did($dname,612).text,60)
      w.glob Invision TempDCCtime $isset($did($dname,622).text,60)
      if $did($dname,571).text != $null { w.glob Invision TS $did($dname,571).text } | else { d.glob Invision TS }
      w.glob Invision WinampDir $isset($did($dname,585).text,C:\Program Files\Winamp\Plugins\)
      if ($did($dname,12).state == 1) && ($did($dname,88).state != 1) { w.glob Nick.Colors Colors On } | else { w.glob Nick.Colors Colors Off }
      if ($did($dname,88).state == 1) { w.glob Nick.Colors ForceUL On } | else { w.glob Nick.Colors ForceUL Off }
      w.glob Nick.Colors Color.0 $gettok($did($dname,31,1).seltext,1,32)
      w.glob Nick.Colors Color.1 $gettok($did($dname,14,1).seltext,1,32)
      w.glob Nick.Colors Color.2 $gettok($did($dname,16,1).seltext,1,32)
      w.glob Nick.Colors Color.3 $gettok($did($dname,18,1).seltext,1,32)
      w.glob Nick.Colors Color.4 $gettok($did($dname,20,1).seltext,1,32)
      w.glob Nick.Colors Color.13 $gettok($did($dname,1331,1).seltext,1,32)
      w.glob Nick.Colors Color.14 $gettok($did($dname,1314,1).seltext,1,32)
      w.glob Nick.Colors Color.15 $gettok($did($dname,1316,1).seltext,1,32)
      w.glob Nick.Colors Color.5 $gettok($did($dname,1200,$did($dname,1200).sel).text,1,32)
      w.glob Nick.Colors Color.6 $gettok($did($dname,1201,$did($dname,1201).sel).text,1,32)
      w.glob Nick.Colors Color.7 $gettok($did($dname,1202,$did($dname,1202).sel).text,1,32)
      w.glob Nick.Colors Color.8 $gettok($did($dname,1203,$did($dname,1203).sel).text,1,32)
      w.glob Nick.Colors Color.9 $gettok($did($dname,1204,$did($dname,1204).sel).text,1,32)
      w.glob Nick.Colors Color.10 $gettok($did($dname,1205,$did($dname,1205).sel).text,1,32)
      w.glob Nick.Colors Color.11 $gettok($did($dname,1206,$did($dname,1206).sel).text,1,32)
      w.glob Nick.Colors Color.12 $gettok($did($dname,1207,$did($dname,1207).sel).text,1,32)
      w.set Colors SpeechClr $gettok($did($dname,14,$did($dname,24).sel).text,1,32)
      if ($did($dname,100).state == 1) { w.set Colors Colors On } | else { w.set Colors Colors Off }
      if ($did($dname,23).state == 1) { w.set Colors Speech On } | else { w.set Colors Speech Off }
      w.set Colors Color.1 $gettok($did($dname,102,$did($dname,102).sel).text,1,32)
      w.set Colors Color.2 $gettok($did($dname,102,$did($dname,104).sel).text,1,32)
      csaveset $did($dname,321).seltext
      if ($did($dname,327).state == 1) { w.set ChanOps LogDefense On } | else { w.set ChanOps LogDefense Off }
      if ($did($dname,765).state == 1) { w.glob Invision PortChk On } | else { w.glob Invision PortChk Off }
      if ($did($dname,771).state == 1) { w.glob Invision PortRng1 On } | else { w.glob Invision PortRng1 Off }
      if ($did($dname,772).state == 1) { w.glob Invision PortRng2 On } | else { w.glob Invision PortRng2 Off }
      if ($did($dname,773).state == 1) { w.glob Invision PortRng3 On } | else { w.glob Invision PortRng3 Off }
      if ($did($dname,774).state == 1) { w.glob Invision PortRng4 On } | else { w.glob Invision PortRng4 Off }
      if ($did($dname,775).state == 1) { w.glob Invision PortRng5 On } | else { w.glob Invision PortRng5 Off }
      if ($did($dname,626).state == 1) { w.glob Invision RateFixOn On } | else { w.glob Invision RateFixOn Off }
      if ($did($dname,830).state == 1) { w.set Invision JmpOnSplit On } | else { w.set Invision JmpOnSplit Off }
      if ($did($dname,831).state == 1) { w.set Invision PagerAlways On } | else { w.set Invision PagerAlways Off }
      if ($did($dname,832).state == 1) { w.set Invision Seen On } | else { w.set Invision Seen Off }
      if ($did($dname,810).state == 1) { w.set Auto.Pinger Status On } | else { w.set Auto.Pinger Status Off }
      if ($did($dname,811).state == 1) { w.set Nick.Alert Status On } | else { w.set Nick.Alert Status Off }
      if ($did($dname,1445).state == 1) { w.set Nick.Alert Log On } | else { w.set Nick.Alert Log Off }
      if ($did($dname,812).state == 1) { w.set Nick.Complete Status On } | else { w.set Nick.Complete Status Off }
      if ($did($dname,813).state == 1) { w.set Invision IsoAds On } | else { w.set Invision IsoAds Off }
      if ($did($dname,814).state == 1) { w.set Invision IsoAdsOT On } | else { w.set Invision IsoAdsOT Off }
      if ($did($dname,850).state == 1) { w.set Services Update On } | else { w.set Services Update Off }
      if ($did($dname,815).state == 1) { w.set Invision Gainops On } | else { w.set Invision Gainops Off }
      if ($did($dname,816).state == 1) { w.set Invision Decrypt On } | else { w.set Invision Decrypt Off }
      if ($did($dname,700).state == 1) { w.set Invision Fxp On } | else { w.set Invision Fxp Off }
      if ($did($dname,818).state == 1) { w.set Invision FserveAI On } | else { w.set Invision FserveAI Off }
      if ($did($dname,822).state == 1) { w.set Invision KeepNick On | if $server != $null { .timerKeep_Nick $+ $iNetwork 0 10 Keep_Nick } } | else { w.set Invision KeepNick Off | .timerKeep_Nick $+ $iNetwork off }      
      if ($did($dname,25).state == 1) { w.glob Lag.Checker Status On } | else { w.glob Lag.Checker Status Off }
      w.glob Lag.Checker Delay $vnum($did($dname,27).text,15)
      if ($r.glob(Lag.Checker,Status) == On) && ($r.glob(Lag.Checker,Delay) isnum 1-500) { .timerLag -io 0 $iif($r.glob(Lag.Checker,Delay) != $null,$r.glob(Lag.Checker,Delay),5) .scid -at1 .lagtime. $!+ $!ticks }
      elseif ($timer(Lag)) { .timerLag Off }
      w.set Personal.Info Nick $isset($did($dname,821).text,n/a)
      var %iCrypt = $checkkey($did($dname,86).text)
      w.set Invision CryptKey %iCrypt
      did -ra $dname 86 %iCrypt
      dialog -v InvisMain
      if ($did($dname,80).state == 1) { w.glob Titlebar Lag On } | else { w.glob Titlebar Lag Off }
      if ($did($dname,81).state == 1) { w.glob Titlebar ChanStats On } | else { w.glob Titlebar ChanStats Off }
      if ($did($dname,82).state == 1) { w.glob Titlebar Server On } | else { w.glob Titlebar Server Off }
      if ($did($dname,83).state == 1) { w.glob Titlebar Status On } | else { w.glob Titlebar Status Off }
      if ($did($dname,84).state == 1) { w.glob Titlebar Time On } | else { w.glob Titlebar Time Off }
      if ($did($dname,895).state == 1) { w.glob Titlebar Nick On } | else { w.glob Titlebar Nick Off }
      if ($did($dname,894).state == 1) { w.glob Titlebar Idle On } | else { w.glob Titlebar Idle Off }
      if ($did($dname,480).state == 1) { w.glob Titlebar Invision On } | else { w.glob Titlebar Invision Off }
      if ($did($dname,482).state == 1) { w.glob Titlebar Fserve On } | else { w.glob Titlebar Fserve Off }
      if ($did($dname,483).state == 1) { w.glob Titlebar mp3inplay On } | else { w.glob Titlebar mp3inplay Off }

      if ($did($dname,211).state == 1) { w.set mFlood CTCPStatus On } | else { w.set mFlood CTCPStatus Off }
      w.set mFlood CTCPDelay $iif($did($dname,213).text isnum 1-3,$did($dname,213).text,1)
      w.set mFlood CTCPLines $vnum($did($dname,215).text,7)
      w.set mFlood CTCPIgnoreTime $vnum($did($dname,217).text,20)
      if ($did($dname,221).state == 1) { w.set mFlood InviteStatus On } | else { w.set mFlood  InviteStatus Off }
      w.set mFlood  InviteDelay $iif($did($dname,223).text isnum 1-3,$did($dname,223).text,1)
      w.set mFlood  InviteLines $vnum($did($dname,225).text,7)
      w.set mFlood  InviteIgnoreTime $vnum($did($dname,227).text,20)
      if ($did($dname,231).state == 1) { w.set mFlood NoticeStatus On } | else { w.set mFlood  NoticeStatus Off }
      w.set mFlood NoticeDelay $iif($did($dname,233).text isnum 1-3,$did($dname,233).text,1)
      w.set mFlood NoticeLines $vnum($did($dname,235).text,9)
      w.set mFlood NoticeIgnoreTime $vnum($did($dname,237).text,20)
      if ($did($dname,241).state == 1) { w.set mFlood TextStatus On } | else { w.set mFlood  TextStatus Off }
      w.set mFlood TextDelay $iif($did($dname,243).text isnum 1-3,$did($dname,243).text,1)
      w.set mFlood TextLines $vnum($did($dname,245).text,20)
      w.set mFlood TextIgnoreTime $vnum($did($dname,247).text,20)
      if ($did($dname,251).state == 1) { w.set mFlood JOINStatus On } | else { w.set mFlood JOINStatus Off }
      w.set mFlood JOINDelay $iif($did($dname,253).text isnum 1-3,$did($dname,253).text,1)
      w.set mFlood JOINLines $vnum($did($dname,255).text,9)
      w.set mFlood JOINIgnoreTime $vnum($did($dname,257).text,20)
      if ($did($dname,261).state == 1) { w.set mFlood NickStatus On } | else { w.set mFlood NickStatus Off }
      w.set mFlood NickDelay $iif($did($dname,263).text isnum 1-3,$did($dname,263).text,1)
      w.set mFlood NickLines $vnum($did($dname,265).text,7)
      w.set mFlood NickIgnoreTime $vnum($did($dname,267).text,20)
      if ($did($dname,290).state == 1) { w.set mFlood LogHalt On } | else { w.set mFlood LogHalt Off }
      w.set mFlood LogHaltTime $vnum($did($dname,292).text,20)

      if ($did($dname,2111).state == 1) { w.set Flood CTCPStatus On } | else { w.set Flood CTCPStatus Off }
      w.set Flood CTCPDelay $iif($did($dname,2113).text isnum 1-3,$did($dname,2113).text,1)
      w.set Flood CTCPLines $vnum($did($dname,2115).text,4)
      w.set Flood CTCPIgnoreTime $vnum($did($dname,2117).text,60)
      if ($did($dname,2118).state == 1) { w.set Flood CTCPNotify On } | else { w.set Flood CTCPNotify Off }
      if ($did($dname,2211).state == 1) { w.set Flood InviteStatus On } | else { w.set Flood  InviteStatus Off }
      w.set Flood  InviteDelay $iif($did($dname,2213).text isnum 1-3,$did($dname,2213).text,1)
      w.set Flood  InviteLines $vnum($did($dname,2215).text,4)
      w.set Flood  InviteIgnoreTime $vnum($did($dname,2217).text,60)
      if ($did($dname,2218).state == 1) { w.set Flood InviteNotify On } | else { w.set Flood InviteNotify Off }
      if ($did($dname,2311).state == 1) { w.set Flood NoticeStatus On } | else { w.set Flood  NoticeStatus Off }
      w.set Flood NoticeDelay $iif($did($dname,2313).text isnum 1-3,$did($dname,2313).text,1)
      w.set Flood NoticeLines $vnum($did($dname,2315).text,4)
      w.set Flood NoticeIgnoreTime $vnum($did($dname,2317).text,60)
      if ($did($dname,2318).state == 1) { w.set Flood NoticeNotify On } | else { w.set Flood NoticeNotify Off }
      if ($did($dname,2411).state == 1) { w.set Flood TextStatus On } | else { w.set Flood  TextStatus Off }
      w.set Flood TextDelay $iif($did($dname,2413).text isnum 1-3,$did($dname,2413).text,1)
      w.set Flood TextLines $vnum($did($dname,2415).text,4)
      w.set Flood TextIgnoreTime $vnum($did($dname,2417).text,60)
      if ($did($dname,2418).state == 1) { w.set Flood TextNotify On } | else { w.set Flood TextNotify Off }
      if ($did($dname,2511).state == 1) { w.set Flood DCCStatus On } | else { w.set Flood DCCStatus Off }
      w.set Flood DCCDelay $iif($did($dname,2513).text isnum 1-3,$did($dname,2513).text,1)
      w.set Flood DCCLines $vnum($did($dname,2515).text,4)
      w.set Flood DCCIgnoreTime $vnum($did($dname,2517).text,60)
      if ($did($dname,2518).state == 1) { w.set Flood DCCNotify On } | else { w.set Flood DCCNotify Off }
      if ($did($dname,2611).state == 1) { w.set Flood FserveStatus On } | else { w.set Flood FserveStatus Off }
      w.set Flood FserveDelay $iif($did($dname,2613).text isnum 1-3,$did($dname,2613).text,2)
      w.set Flood FserveLines $vnum($did($dname,2615).text,4)
      w.set Flood FserveIgnoreTime $vnum($did($dname,2617).text,60)
      if ($did($dname,2618).state == 1) { w.set Flood FserveNotify On } | else { w.set Flood FserveNotify Off }

      w.set Auto.Id Nick.1 $iif($did($dname,142).text == $null,n/a,$did($dname,142).text)
      w.set Auto.Id Pass.1 $iif($did($dname,143).text == $null,n/a,$did($dname,143).text)
      w.set Auto.Id Nick.2 $iif($did($dname,144).text == $null,n/a,$did($dname,144).text)
      w.set Auto.Id Pass.2 $iif($did($dname,145).text == $null,n/a,$did($dname,145).text)
      w.set Auto.Id Nick.3 $iif($did($dname,146).text == $null,n/a,$did($dname,146).text)
      w.set Auto.Id Pass.3 $iif($did($dname,147).text == $null,n/a,$did($dname,147).text)
      w.set Auto.Id Nick.4 $iif($did($dname,148).text == $null,n/a,$did($dname,148).text)
      w.set Auto.Id Pass.4 $iif($did($dname,149).text == $null,n/a,$did($dname,149).text)
      w.set Auto.Id Nick.5 $iif($did($dname,150).text == $null,n/a,$did($dname,150).text)
      w.set Auto.Id Pass.5 $iif($did($dname,151).text == $null,n/a,$did($dname,151).text)
      if ($did($dname,152).state == 1) { w.set Auto.Id Status On } | else { w.set Auto.Id Status Off }
      if (($chmodeLTR == k) && ($did($dname,404).state == 1)) { chmodeSAVE [ $did($dname,321).seltext +k [ $+ [ $did($dname,407).text ] ] ] }
      dls $dname 171 w.set Trusted.Nicks Nicknames
      dls $dname 767 w.glob Invision ScriptList
      if ($did($dname,180).state == 1) { w.set Auto.Greet Status On } | else { w.set Auto.Greet Status Off }
      if ($did($dname,183).state == 1) || ($did($dname,182).lines == 0) { w.set Auto.Greet Channels All }
      else { dls $dname 182 w.set Auto.Greet Channels }
      dls $dname 321 w.cf ChanOps Channels 
      w.glob Invision DefBan $did($dname,532).text | set %DefBan $did($dname,532).text
      if $r.mirc(Invision,mp3btn) == On { testmp3 } | else { teststop }
      if ($did($dname,819).state == 1) { w.set Invision AlwaysHome On | AlwaysHomeOn | JoinHomes } | else { w.set Invision AlwaysHome Off | AlwaysHomeOff }
      tbar
      USDstat
      chmodeEnforce
      pladjsetup
      if $r.glob(Invision,TS) != $null { .timestamp -fe $r.glob(Invision,TS) | .timestamp on } | else { .timestamp off }
      if $r.glob(Nick.Colors,ForceUL) == On { UserListCLR } | else  { if $r.glob(Nick.Colors,Colors) == On { NickListCLR } }
      saveallsettings | SaveAllGlobals
    }
  }
}
