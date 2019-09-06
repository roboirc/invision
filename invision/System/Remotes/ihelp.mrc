; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: ihelp.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: Active Help Text
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
alias DCCHelp {
  if $dialog(DCCmanager).title != $null {
    var %tab = $dialog(DCCManager).tab
    if ( %tab == 5 ) {
      if ( ( $1 isnum 32-208 ) && ( $2 isnum 56-64 ) ) {
        did -ra DCCManager 410 Automatic Requeue of Failed Sends, when enabled, will requeue a dcc send that has failed. When a DCC Send Fails it will go on to send the next queue (if one exists), and put the failed transfer back on top of the queue in slot 1. This gives the person that was trying to receive the file a bit of time to free up bandwidth or do whatever to improve their chances of success the next time. The Max Retries is just that, the maximum times it will try again to send it. 
      }
      elseif ( ( $1 isnum 32-208 ) && ( $2 isnum 76-84 ) ) {
        did -ra DCCManager 410 Minimum DCC Send Speed is the minimum cps speed a send can drop to before it is considered too slow and is automatically halted. This doesn't mean a person doing well over the min cps speed that suddenly pauses for a few seconds due to internet congestion will be immediately halted. The person must drop below the min cps for some time before the send is halted.  You can set this to 0 to disable it. 
      }
      elseif ( ( $1 isnum 32-208 ) && ( $2 isnum 96-104 ) ) {
        did -ra DCCManager 410 Minimum CPS Check Delay is the time in seconds that it will routinely take a look at how fast the current send are going and ensures they are above the minimum set if it is. These samples are averaged out as to avoid making haste decisions in cutting off a send due to temporary lag conditions.
      }
      elseif ( ( $1 isnum 32-219 ) && ( $2 isnum 116-128 ) ) {
        did -ra DCCManager 410 Auto /dccallow is for Dalnet and any other network that requires you to do a /dccallow <nick> before you can DCC them. This has been implemented by the network(s) for the protection of you and others.
      }
      elseif ( ( $1 isnum 32-219 ) && ( $2 isnum 133-145 ) ) {
       did -ra DCCManager 410 Priority Queue lets you have two isolated queues. One (Standard) for normal users and a second queue for those that meet the criteria you selected. This can be one of 3 settings. Elite only, Fellow Ops or higher, or Friends or higher. When a qualifying user queues a file their queues will be redirected to the priority queue. This queue takes priority over the standard queue and has send preference.
      }
      elseif ( ( $1 isnum 32-219 ) && ( $2 isnum 150-163 ) ) {
        did -ra DCCManager 410 SmartSends is a feature that adjust the amount of Max Sends Total on-the-fly in order to ensure maximum queue flow while maintaining the TSB (Total Server Bandwidth) set. If for example you set a TSB of 60kbs and a MST (Max Sends Total) at 2 then the first send would be sent with a limit of 30kbs. The second send would go out also with a 30kbs limit. If however one of the send was only moving at say 10kbs and SmartSends is enabled, then a third send would be sent with a limit set at 20kbs (the remaining bandwidth available).
      }
      elseif ( ( $1 isnum 32-219 ) && ( $2 isnum 173-182 ) ) {
        did -ra DCCManager 410 DCC Server Logging, when enabled, will keep a text log file of all DCC sends, Fails, Gets, and Fserve Actions which can be viewed by going to the Invision Menu on the menu bar and choosing Invision Tools > System Logs
      }
      elseif ( ( $1 isnum 32-219 ) && ( $2 isnum 193-202 ) ) {
        did -ra DCCManager 410 Isolate DCC Notices will capture DCC Sends, Gets, and Fails to a separate window which, when first created, is minimized on the switchbar. This can be a nice history if you are running a Fserve.  Displaying "dots" will display a red or green dot for success or fail at the beginning of each line in the DCC_Info window making it easier to quickly see how often your sends/receives fail or are successful.
      }
      elseif ( ( $1 isnum 32-219 ) && ( $2 isnum 214-223 ) ) {
        did -ra DCCManager 410 DCC Watch, when enabled, will ensure that those that are receiving files from you stay in a common channel as you or a channel you have specified in the DCC Watch Channels box. If the user leaves the channel due to a quit they have a few minutes to come back before their sends are killed. This is to allow for normal netsplits.
      }
      elseif ( ( $1 isnum 32-219 ) && ( $2 isnum 235-244 ) ) {
        did -ra DCCManager 410 DCC Daily Limit, when enabled, will limit the amount in bytes that each user can download from your File Server per day. The 24 hour time span is started when the user first receives a file from you. 24 hours from this the accumulated bytes from files downloaded will be erased for that user and the process will start over again. This option is to allow those that want to stop people from being leech pigs. =)
      }
      elseif ( ( $1 isnum 32-219 ) && ( $2 isnum 256-265 ) ) {
        did -ra DCCManager 410 DCC Reverse Init is used when you are behind a network firewall (school, business, not personal software) and need to use the CTCP passive protocol and the DCC Server on the remote connections machine in order to establish connection. The mIRC default port is 59 but this usually is blocked on most firewalls so the Invision Default is 6060 but you can change it to what works for you. When this is enabled DCC sends will be delayed approx. 20 seconds while a notice is sent to the receiver instructing them on the setting of their DCC server in order to receive.
      }
      elseif ( ( $1 isnum 32-169 ) && ( $2 isnum 286-303 ) ) {
        did -ra DCCManager 410 PDCC is a setting to help speed up transfers. This is the amount of packets it will send ahead before needing an acknowledgement from the previous ones. Generally you want this set on.
      }
      elseif ( ( $1 isnum 32-149 ) && ( $2 isnum 311-321 ) ) {
        did -ra DCCManager 410 FastSends is a transfer option that will speed up your transfers. You will most likely never want this turned off. By default, this setting is enabled.
      }
      elseif ( ( $1 isnum 29-249 ) && ( $2 isnum 326-345 ) ) {
        did -ra DCCManager 410 DCC Per Send Bandwidth is a bandwidth cap you can set for each DCC sent. If you for example set this to 10000 then each send will be limited to a max speed of 10kbs. If you you had a this set to 20000 and a max sends total set to 3 then you would have virtually set the Total Server Bandwidth to 60kbs. This setting will superceed the Total Server Bandwidth Setting. To Disable this and use the TSB setting or no bandwidth limiting at all set this to 0.
      }
      elseif ( ( $1 isnum 29-249 ) && ( $2 isnum 348-366 ) ) {
        did -ra DCCManager 410 Total Server Bandwidth is only in use if set to something higher then 1000 (1kbs) and DCC Send Bandwidth is disabled (set to 0). When these conditions are met TSB will govern how much bandwidth is used by your servers. If you set Max Total Sends to say 3 and you have TSB set at 60000 then each send will be given a speed cap of 20kbs (3 x 20kbs = 60kbs). This allows you to change the amount of Max Total Sends without worrying about refiguring what the new 'per send' speed should be and having to reset that as well.
      }
      elseif ( ( $1 isnum 248-315 ) && ( $2 isnum 271-388 ) ) {
        did -ra DCCManager 410 Packet Size is an important setting. If you have it set too low (512) the transfer speed will suffer. If you have it set too high and you have a lot of packet loss then you will also experience reduced transfer speeds. Usually a setting of 2048 or 4096 is optimal.
      }
      elseif ( ( $1 isnum 351-586 ) && ( $2 isnum 322-396 ) ) {
        did -ra DCCManager 410 Priority Queue Level is the where you can set minimal level needed for that person's queues to be placed in the Priority Queue when active. If for example you were to set it to Friends then anyone in your user lists that was a friend or higher would be placed in the the Priority Queue.  Using Voice, Half-Op, or Op and Higher settings will set the priority queue based on channel levels, rather than User List levels.
      }
      elseif ( ( $1 isnum 351-586 ) && ( $2 isnum 42-311 ) ) {
        did -ra DCCManager 410 DCC Watch Channels: Here you can set specific channels that users must be in in order to receive files from you. If they should leave and not be present in at least one of the channels thier sends will be canceled with no requeuing. 
      }
      ;else {
      ;  did -ra DCCManager 410 $1 $2
      ;}
    }
  }
}

alias MainHelp {
  if $dialog(InvisMain).title != $null {
    var %tab = $dialog(InvisMain).tab
    if %tab == 1 {
      if $1 > 20 && $1 < 104 {
        if $2 > 92 && $2 < 100 {
          did -ra InvisMain 1502 Titlebar > Lag Meter : When enabled will add the lag meter to the titlebar. If graphical is enabled in the Lag Meter setting above then it will be a graphical representation of the amount of lag with each bar representing approximately 0.1 seconds.
          halt
        }
        elseif $2 > 112 && $2 < 120 {
          did -ra InvisMain 1502 Titlebar > Active Chan Stats : When enabled will cause the user's stats for the active channel to appear in the Titlebar. The stats will be the amount of Ops, Halfops, Voices, and Regular users in that channel.
          halt
        }
        elseif $2 > 130 && $2 < 138 {
          did -ra InvisMain 1502 Titlebar > Open Socks : When enabled will display the current amount of open sockets in use by mIRC scripts (not mIRC itself). This is good when you want to see exactly what is happening socket-wise.
          halt
        }
        elseif $2 > 145 && $2 < 154 {
          did -ra InvisMain 1502 Titlebar > Invision Name : When enabled will add the Invision Name to the beginning of the titlebar. This is the original Invision display method but has been made optional to allow more room for other options and user preferences.
          halt
        }
      }
      if $1 > 140 && $1 < 224 {
        if $2 > 92 && $2 < 100 {
          did -ra InvisMain 1502 Titlebar > Server Name : When enabled will add the name of the server to which you are currently connected, along with the port.
          halt
        }
        elseif $2 > 112 && $2 < 120 {
          did -ra InvisMain 1502 Titlebar > Away Status : When enabled will display your current /away status in the titlebar.
          halt
        }
        elseif $2 > 130 && $2 < 138 {
          did -ra InvisMain 1502 Titlebar > Idle Time : When enabled will display the amount of time you have been idle once you have exceeded 5 minutes. Anything below 5 minutes won't be displayed.
          halt
        }
        elseif $2 > 145 && $2 < 154 {
          did -ra InvisMain 1502 Titlebar > Sends/Queues : When enabled will display the current Sends and Queues pending globally. You will see nothing when there are no sends/queues.
          halt
        }
      }
      if $1 > 260 && $1 < 338 {
        if $2 > 92 && $2 < 100 {
          did -ra InvisMain 1502 Titlebar > Current Time : When enabled will add the current time to the titlebar.
          halt
        }
        elseif $2 > 112 && $2 < 120 {
          did -ra InvisMain 1502 Titlebar > Nick + Modes : When enabled will display your current nickname and any modes you have set in the titlebar.
          halt
        }
        elseif $2 > 130 && $2 < 138 {
          did -ra InvisMain 1502 Titlebar > Linked Bots : When enabled will display the total amount of active DCC links you have to bots using the bot command via DCC menu options (not manually made DCC chat sessions to bots). 
          halt
        }
        elseif $2 > 145 && $2 < 154 {
          did -ra InvisMain 1502 Titlebar > mp3 in play : This will cause "Artist - Title" of the currently playing mp3 to be displayed, if there is one.
          halt
        }
      }
      if $1 > 20 && $1 < 160 {
        if $2 > 184 && $2 < 192 {
          did -ra InvisMain 1502 Stealth Mode, when enabled, will suppress the Invision logo from being displayed in any outgoing displays and will also block all CTCP version replies except for the mIRC Client reply itself. Only you will see the Invision logo on your end for things like script messages and so on.
          halt
        }
        if $2 > 202 && $2 < 214 {
          did -ra InvisMain 1502 Enabling this will force the extended mp3 info like bitrate, filesize, id3tag info and so on to appear in the Active Window rather then the Status window by default.
          halt
        }
        if $2 > 224 && $2 < 233 {
          did -ra InvisMain 1502 Channel Scan, when enabled, will cause you to scan those that join channels that you are currently on. It then proceeds to attach a list of the channels visible to you to that person's nick. It will display any other channels you can see (besides the one he just joined) following the join message in the channel. You can also see these channels when you right click in the nick. You can also use this when doing a common channel scan.
          halt
        }
        if $2 > 242 && $2 < 254 {
          did -ra InvisMain 1502 Auto Notice Reply Prompt, when enabled, will automatically put a /notice <nick of person who noticed you> in the editbox of the active window when someone notices you a message. It will not auto prompt on Fserve Ad Notices nor DCC notices.
          halt
        }
        if $2 > 264 && $2 < 272 {
          did -ra InvisMain 1502 Isolated Info Responses, when enabled, will cause all info replies like /whois, /dns, etc. to be directed to a isolated window rather then appear in the active window itself. Note that when you mass info query more then one nick at a time the isolated window will open up anyway even if this is disabled. To see an example highlight a few nicks in the nicklist of a channel and then right click and choose 411 > Whois. You will see a new window form with the results being added as they are received.
          halt
        }
      }
      if $1 > 180 && $1 < 340 {
        if $2 > 202 && $2 < 214 {
          did -ra InvisMain 1502 Display mp3 Buttons, when enabled, will add Play Controls to the right of the toolbar. Click the Play Arrow button to select a single mp3 to play, or hold the CTRL key while clicking the Play Arrow Button to select a mp3 Directory to randomly play from. 
          halt
        }
        if $2 > 224 && $2 < 233 {
          did -ra InvisMain 1502 Fast Index Method, when enabled, will use an external process when building File Index Caches for the File Server and mp3 Server. In most cases you will want to have this enabled but in some cases the mp3 Server will build faster with it disabled. If you plan to run a mp3 Server its best to try both methods. If for some reason it is not building index files for you try this disabled.
          halt
        }
        if $2 > 242 && $2 < 254 {
          did -ra InvisMain 1502 Auto Updates, when enabled, will check for new versions of Invision when you connect to an IRC server. If a newer version exists you will be prompted with an option to update. You will also receive any news updates there might be which may be bug notices etc. If you are running through a proxy server this will not work and you will have to download any updates via the website and manually install them.
          halt
        }
        if $2 > 264 && $2 < 272 {
          did -ra InvisMain 1502 Part channels to regain nick is a feature which will cause you to part channels you are in which may be preventing you from successfully changing your nick. 
          halt
        }
      }
      if $1 > 20 && $1 < 129 {
        if $2 > 299 && $2 < 310 {
          did -ra InvisMain 1502 Enable Messenger: This feature allows Invision to check for messages you have queued in the User List Manager for people that are not online at the time but you want to get a message to them ASAP. You can set it to send the message either when they are seen joining a channel you're on or wait until they are seen saying something in a channel you're in by selecting the mode on the ADV tab. Disabling this can reduce script lag.
          halt
        }
        if $2 > 321 && $2 < 331 {
          did -ra InvisMain 1502 Enabling !Seen will track the last time it saw people who are a friend or higher in your user lists (changeable in Main Settings > ADV). In turn, people can do a !Seen <nick> in channel to inquire about people who qualify. The !seen reply is sent to the person via /notice in order to avoid flooding the channel.
          halt
        }
        if $2 > 340 && $2 < 350 {
          did -ra InvisMain 1502 Auto !ping Reply will auto ping those that use the !ping request in a common channel with you. 
          halt
        }
        if $2 > 358 && $2 < 368 {
          did -ra InvisMain 1502 Nick Alert, when enabled, will echo any line of text said in a channel window that is currently not in focus to the window that is. So if you are on two channels like #one and #two and #one is minimized and someone in #one says "Hi <your nick>" it would show that in #two including what channel it was said in.  Use the Log option to log the nick alert window.
          halt
        }
        if $2 > 379 && $2 < 389 {
          did -ra InvisMain 1502 Dclk Nick Repond will cause a /> prompt to appear in the text box of a channel when you double-click on someone's nick. The cursor will be set right after this prompt for you to type in what you want to say to that person. When entered you will see what you said preceeded by a nick tag for that person. This is good practice in busy channels where you want to be clear to whom you are responding. When enabled you can at any time hold the CTRL key down while double-clicking on a nick to get the standard query window for that person instead.
          halt
        }
      }
      if $1 > 140 && $1 < 250 {
        if $2 > 299 && $2 < 310 {
          did -ra InvisMain 1502 msg history revive: This will cause the last so many lines of a private message conversation to be added to a private message window that is opened. So if you were having a private chat in a message window and you closed it, the previous dialog lines would show up when they messaged you again. This should only be effective for that day.
          halt
        }
        if $2 > 321 && $2 < 331 {
          did -ra InvisMain 1502 Pager Always On will allow people to CTCP PAGE you at any time rather than just when you are in away mode.
          halt
        }
        if $2 > 340 && $2 < 350 {
          did -ra InvisMain 1502 Capture Notice Ads will force File Server Ads sent to you via notice when you do a !list to appear in a separate window, as well as extract the triggers from all the ads and put them in the right side box of that window where you can just double click on them to say them in the channel or send them via CTCP if they are the CTCP type. This can save a lot of typing and/or copying and pasting. Doing a !list in the channel will automatically close any existing Serve Ad Window for that channel and open a new one.
          halt
        }
        if $2 > 358 && $2 < 368 {
          did -ra InvisMain 1502 Capture Text Ads will force File Server Ads seen in the channels to a separate window, as well as extract the triggers from all the ads and put them in the right side box of that window where you can just double click on them to say them in the channel or send them via CTCP if they are the CTCP type. Ads will be updated as they appear each time rather then simply adding to the window repeats. There maybe cases where at times it can't erase the previous ads and therefore near dupes may appear. This should be rare though.
          halt
        }
        if $2 > 379 && $2 < 389 {
          did -ra InvisMain 1502 Gain Ops will try and gain ops in any channel where you are the only person in the channel and you don't have ops. It will cause you to quickly part and rejoin the channel in an attempt to gain op status. You may want to disable this on some networks where it might be more annoying than good.
          halt
        }
      }
      if $1 > 257 && $1 < 396 {
        if $2 > 299 && $2 < 310 {
          did -ra InvisMain 1502 Data in Bold: This will cause the data in the brackets shown in Fserve ads and other things like system info etc. to appear in bold typeface.
          halt
        }
        if $2 > 321 && $2 < 331 {
          did -ra InvisMain 1502 Leave weak side of splits will cause you to change servers within the same network in the event there should be a netsplit and you are left on the weak side of that split.
          halt
        }
        if $2 > 340 && $2 < 350 {
          did -ra InvisMain 1502 File Server Explorer is a dialog that will popup in place of the common DCC Chat window when accessing File Servers. This interface is generally considered a much easier way to browse and retrieve files from a Fserve much like that of Windows File Explorer. In the event it is not opening for an fserve try right clicking on the channel window to get the menu then choose Force Fserve Explorer and then enter the trigger. This may be needed for those running File Servers on older versions of mIRC. This can be toggled via F6.
          halt
        }
        if $2 > 358 && $2 < 368 {
          did -ra InvisMain 1502 Visufix, when enabled, will alter colors used in channels in order for you to see them better. If for example someone says something in black text and you have black background, Visufix will alter the color to something readable but still close to the original color (in this case, the text would be changed from black to grey). This can be toggle via the F4 key.  mIRC has this built in, but will change the color to your default text color instead of a color close to the original.
          halt
        }
        if $2 > 379 && $2 < 389 {
          did -ra InvisMain 1502 File Server Anti-Idle will attempt to keep you from idling out and getting disconnected from a Fserve Session. This refers to when you get the "Closing Idle Connection in blah blah seconds" notice. It does not prevent you from getting terminated due to Anti-Camp.
          halt
        }
      }
      if $1 > 9 && $1 < 277 && $2 > 39 && $2 < 73 {
        did -ra InvisMain 1502 The Lag Monitor Section is where you can enable lag monitoring and change how it is reported. By checking the graphical box your Lag Meter will be in the form of a Bar in the titlebar (when enabled in titlebar section as well). If graphical is disabled then you will get a numerical display in the titlebar. The interval is how often it checks the lag and updates the display. 
        halt
      }
      if $1 > 418 && $1 < 586 && $2 > 285 && $2 < 398 {
        did -ra InvisMain 1502 The Home Channel(s) Section is where you can set channels you want to maintain presence in. When enabled it will work to make sure you are always in those channels. When you have the Learn Keys option enabled it will automatically update the key for any channel in the list when the key is changed. To enter a channel that needs a key simply include the key following the channel. e.g.: "#somechannel thekey". This is great if they happen to change the channel key while you are away and then later you drop connection and try to come back.
        halt
      }
      if $1 > 352 && $1 < 586 && $2 > 148 && $2 < 278 {
        did -ra InvisMain 1502 The Auto Greet Section is where you can enable and set which channels (if not all) that you want to auto-greet people when you see them join. You can set a unique greet message for anyone by right clicking on their nick and choosing User Lists > Auto Greet > Add. It will then prompt you for a greeting message for that user.
        halt
      }
      if $1 > 352 && $1 < 586 && $2 > 79 && $2 < 142 {
        did -ra InvisMain 1502 The Encrypt/Decrypt Section is where you can enable and set the key (don't use the default key!) used for encrypting and decrypting text. You will not be able to decrypt text from Invision 3.2 or older or mIRC 6.35 or older due to mIRC changing to Unicode.  To encrypt text, you can use /' <text> or /e <text>.  Decrypting is done automatically if the Auto Decrypt box is checked.  No decryption will occur if your key doesn't match the sender's key.  Warning: This is not strong encryption.  If you need strong encryption, use something like FiSH instead.
        halt
      }
      if $1 > 283 && $1 < 586 && $2 > 41 && $2 < 74 {
        did -ra InvisMain 1502 Nick Section is where you should set your common nickname used. If you elect to enable the Maintain Nick feature it will always work to keep that nick (except if you have an away nick set and are away). In the event you ping out and reconnect to the server and your ghost is still there using your nick, it will regain the nick as soon as it drops. Note that anytime you do a /nick <newnick> command it will change the nick in this section to that nick.   
        halt
      }
      if $2 > 400 && $2 < 430 {
        did -ra InvisMain 1502 Here you have 3 choices for how mp3s are played back. First (from left to right) is the built in mIRC method which uses /splay. Second is the Original Invision Winamp method which uses a supplied DLL to utilize the Winamp engine but not the GUI of Winamp. This method is limited to Winamp versions pre 3.xx. Third is the new AMIP plugin support which you can download a plugin from http://amip.tools-for.net for either new or old versions of Winamp. This method is best if you want to use Winamp as it allows you to use the GUI of Winamp and/or Invision. 
        halt
      }

    }
    elseif %tab == 2 {
      if $1 > 20 && $1 < 138 && $2 > 178 && $2 < 210 {
        did -ra InvisMain 1502 When enabled, this will make the colored bar in the Invision logo match your secondary script color for a smoother look.
        halt
      }
      if $1 > 20 && $1 < 138 && $2 > 211 && $2 < 250 {
        did -ra InvisMain 1502 Selecting a background color will make all text displayed by the script appear using a background color of white or black.  This can allow you to make sure that your text is visible no matter what color background other users are using in chat.
        halt
      }
      if $1 > 10 && $1 < 585 && $2 > 283 && $2 < 417 {
        did -ra InvisMain 1502 Force User Lists Scheme will color nicks in the channel nicklists according to how they rank in your user lists. Although this is a very nice feature to use it is some what demanding of the CPU. This will often lead to 'freezing' or pausing at times if used on machines of lower CPU speeds or even just heavily occupied channels. If you enable this and experience periodical freezing you should consider disabling it. 
        halt
      }
      if $1 > 10 && $1 < 455 && $2 > 40 && $2 < 147 {
        did -ra InvisMain 1502 Enable Nick Colors, when enabled, will apply colors to the nicknames in the channel nicklist according to channel status. Set the colors you want in the appropriate boxes.
        halt
      }
      if $1 > 455 && $1 < 586 && $2 > 40 && $2 < 147 {
        did -ra InvisMain 1502 Speech Color, when enabled, will automatically color your text outgoing to channels or queries. This is not the same as the 'Own Text Color' setting in mIRC's color settings, in that the text with this option will appear in this color to everyone and not just you.
        halt
      }
      if $1 > 10 && $1 < 360 && $2 > 161 && $2 < 185 {
        did -ra InvisMain 1502 Select two colors used by the script. Usually you make the Primary the darker of the two but of course you can do whatever you like.
        halt
      }
      if $1 > 360 && $1 < 586 && $2 > 161 && $2 < 270 {
        did -ra InvisMain 1502 Use Logo Color Theme, when enabled, will change the text color of the Invision logo to the selected color theme.  This only changes the text color.  The bar color is changed with the "Logo Color matches Secondary Color" option to the left.  You can also enable the Reverse Selected Theme option to change the color order of the theme.  Note that Stealth Mode needs to be off in order to see the logo.  The Preview option lets you preview how it will look.
        halt
      }
    }
    elseif %tab == 3 {
      did -ra InvisMain 1502 Here you can select which Invision sound events you would like to hear for the stated events. You will notice that the sounds used here in Invision are not the common sound effects found in most scripts but prerecorded artificial speech. I did this simply because I hate having to remember what sound means what. Especially those events that don't happen often enough. I figure this way it just flat out tells you what the heck is going on.
    }
    else if %tab == 4 {
      if $1 > 20 && $1 < 273 {
        if $2 > 58 && $2 < 70 {
          did -ra InvisMain 1502 Block /MSG from those not in a mutual channel, when enabled, will block all messages sent to you from those that are not in at least one channel with you. Those in your friends/fellow ops/elite user lists will not be blocked by this. This is a good feature to prevent a lot of spam (besides the spam filter itself) since a lot of spammers use bots outside the channel to send the spam message to avoid being caught.
          halt
        }
        if $2 > 78 && $2 < 90 {
          did -ra InvisMain 1502 Block /MSG from those not in in your friends/fellow ops/elite user lists will block all messages from those not in one of these groups. This is great for the unsocial iRCer =)
          halt
        }
        if $2 > 98 && $2 < 110 {
          did -ra InvisMain 1502 Block /CTCP from those not in in your friends/fellow ops/elite user lists will block all /CTCPs from those not in one of these groups. This can add protection but also will block Incoming Server triggers if you are running the Fserve or mp3 Server with /CTCP triggers. This can also get you kicked off some IRC networks where the server /CTCP VERSIONs you on connect.
          halt
        }
        if $2 > 118 && $2 < 130 {
          did -ra InvisMain 1502 Block /CTCP from those not in a mutual channel, when enabled, will block all /CTCPs sent to you from those that are not in at least one channel with you. Those in your friends/fellow ops/elite user lists will not be blocked by this. This can also get you kicked off some IRC networks where the server /CTCP VERSIONs you on connect.
          halt
        }
        if $2 > 138 && $2 < 150 {
          did -ra InvisMain 1502 Block File Server Ads, when enabled, will filter out and File Server Ads that are displayed in the channel(s). It will not filter out ads sent to you via /notice when you do a !list
          halt
        }
        if $2 > 158 && $2 < 170 {
          did -ra InvisMain 1502 Block Triggers will screen out common triggers said in the channel(s) you are on. This is basically any trigger that is preceeded by a !, @, etc.
          halt
        }
        if $2 > 178 && $2 < 190 {
          did -ra InvisMain 1502 Spam Filter, when enabled, will block most spam messages sent to you. The messages are automatically blocked and a short message will appear in the active window stating spam was blocked and by whom. It will also send a message back to the user informing them that their /msg was in fact blocked and then go on to insult their mother.
          halt
        }
      }
      if $1 > 298 && $1 < 561 {
        if $2 > 58 && $2 < 70 {
          did -ra InvisMain 1502 Block /CTCP mp3/SLOT, when enabled, will block the common /CTCP SLOT or /CTCP mp3 requests you may encounter in a lot of channels.
          halt
        }
        if $2 > 78 && $2 < 90 {
          did -ra InvisMain 1502 Block DCC Auto Gets from those not permitted. This will block incoming DCC Sends from those that you have not given either Temp DCC Permission or that have the DCC Permissions Flag set in the User Lists Manager under Default Template. To grant someone temporary DCC Permission right click on their nick and then DCC > Grant Temp DCC. The Temporary DCC permission will last 1 hour by default.
          halt
        }
        if $2 > 98 && $2 < 110 {
          did -ra InvisMain 1502 Block DCC Chats from those not friend or higher. This will block all incoming DCC Chat requests from anyone that is not at least a friend in the user lists.
          halt
        }
        if $2 > 118 && $2 < 130 {
          did -ra InvisMain 1502 Block /Notices from those not in channel will block all notices that are from anyone that is not in at least one common channel with you.
          halt
        }
        if $2 > 138 && $2 < 150 {
          did -ra InvisMain 1502 Block FTP Ads will screen out any FTP Ads it detects said in the channel(s) you are on.
          halt
        }
        if $2 > 158 && $2 < 170 {
          did -ra InvisMain 1502 Block XDCC Ads will screen out any XDCC Ads it detects said in the channel(s) you are on the best it can.
          halt
        }
        if $2 > 178 && $2 < 190 {
          did -ra InvisMain 1502 This will cause all server notices sent to be captured to an isolated window rather then to the status and/or active window. This is a GLOBAL setting and affects all networks.
          halt
        }
      }
      if ( $2 isnum 275-294 && $1 isnum 219-360 ) {
        did -ra InvisMain 1502 Enable Network Services for servers that support network services, e.g. NickServ and ChanServ.
      }
      elseif ( $2 isnum 297-316 && $1 isnum 219-340 ) {
        did -ra InvisMain 1502 Auto-Identify will automatically identify yourself to NickServ when NickServ requests identification.  The nick/passwords entered here will be used for NickServ identification/ghosting only.
      }
      elseif ( $2 isnum 323-383 && $1 isnum 219-340 ) {
        did -ra InvisMain 1502 When AutoGhost is enabled and you connect to a server when your primary nick is taken (either by another user or a stale connection keeping the nick in use), a GHOST or RECOVER command will automatically be sent to NickServ to regain your nick.
      }
      elseif ( $2 isnum 275-294 && $1 isnum 396-575 ) {
        did -ra InvisMain 1502 Enable Auto Load Dalnet Menus will add NickServ/ChanServ/MemoServ/DCCallow to various menus, allowing quick and easy access to network services.
      }
      ;if $2 > 260 && $1 > 210 {
      elseif ( $2 > 302 && $1 > 350 ) {
        did -ra InvisMain 1502 You can enter your nicknames and the passwords for the nicks here which will automatically be sent to NickServ when requested.
      }
      elseif ( $2 > 260 && $1 < 210 ) {
        did -ra InvisMain 1502 The trusted nicknames are the names of bots like NickServ, ChanServ, X, W, etc.  These nicknames won't trigger your personal flood protection.
      }
    }
    elseif %tab == 6 {
    }
    elseif %tab == 7 {
      if $1 > 10 && $1 < 584 && $2 > 58 && $2 < 160 {
        did -ra InvisMain 1502 The Mass Flood Protection system will help prevent you from being flooded off the network. Here you can set the amount of lines in a set amount of time in which to consider it a flood. The default setting for Text Flood would be 20 lines in 1 second. Now if you are experiencing lag and net splits you will most likely encounter false triggers. The difference between this and User Flood Protection is that this counts all lines as though from a single source. This can try and protect you from joint flood attacks, say from a bot pack.
        Halt
      }
      elseif $1 > 10 && $1 < 584 && $2 > 166 && $2 < 293 {
        did -ra InvisMain 1502 The User Flood Protection system will help prevent you from being flooded off the network. Here you can set the amount of lines in a set amount of time in which to consider it a flood. The default setting for Text Flood would be 10 lines in 3 seconds. Now if you are experiencing lag and net splits you will most likely encounter false triggers as well since it will appear from your end that a person might have just said 12 lines all at once when in fact they said them over 30 seconds, but you were lagged and didn't get them one at a time.
        Halt
      }
      if $1 > 165 && $1 < 296 && $2 > 308 && $2 < 417 {
        did -ra InvisMain 1502 Immune Scripts are those scripts that you know are loaded and you know they are ok to run. By default all the native Invision Scripts are loaded in here. Any Scripts loaded through the Addon Manager will also be automatically added to here as well. Any Script not in here will cause a Warning to appear in the active window at script startup. This can be a very valuable security feature as a lot of hackers (and wannabe hackers) like to add their own scripts to your iRC, and this will alert you immediately at startup if there is an unknown Script loaded.
        Halt
      }
      if $1 > 465 && $1 < 575 && $2 > 308 && $2 < 467 {
        did -ra InvisMain 1502 Scanned Ports Section is where you can set which ports you want scanned at startup. By Default only Common Ports are enabled as these are usually enough for most people. If you are running a good Virus/Trojan Scanner and keep it updated you shouldn't need to worry about this. Note that windows commonly assigns ports 1024 and up to currently running winsock apps so it's not uncommon to see ports in this range in use most times.
        Halt
      }
      if $1 > 20 && $1 < 163 {
        if $2 > 320 && $2 < 332 {
          did -ra InvisMain 1502 ScriptGuard, when enabled, will scan all scripts loaded at startup and report a warning for any scripts found loaded that are not in the immune lists. To add a script to the immune list click the "+" button above the list and navigate to the script.
          Halt
        }
        if $2 > 340 && $2 < 352 {
          did -ra InvisMain 1502 ScriptCheck, when enabled, will scan all scripts loaded at startup and report any native scripts that have been altered or corrupted from original release. This is also a good security measure to protect you from anyone that might have gained access to your system then added a few of there own lines to a native script page. Note that if you make any changes to any of the script pages they will come up as corrupted or altered in the startup scan.
          Halt
        }
        if $2 > 360 && $2 < 372 {
          did -ra InvisMain 1502 PortCheck, when enabled, will scan selected local ports (your own system) to see which ports are in use. This can be useful if you suspect something might be using a port or listening that you don't want. If you run an up-to-date virus & trojan scanner I wouldn't be too alarmed about anything you see in here. See Scanned Ports help for more info.
          Halt
        }
        if $2 > 380 && $2 < 392 {
          did -ra InvisMain 1502 Log All CTCPs is a good option as it will keep a record of all CTCPs that are sent to you. In the event something unexplained should happen you could look here to see if anyone sent you a /CTCP here. You can also see DCC actions here as well. To view this log look in the Invision Menu in the menubar under Invision Tools > System Logs. 
          Halt
        }
        if $2 > 400 && $2 < 412 {
          did -ra InvisMain 1502 Log All Defense option will record any Channel Ops actions you take to a log file so you can see anything you did in the event you were away or whatever and missed it. So if say you kicked someone for trading in the channel you could see it in here. To view this log look in the Invision Menu in the menubar under Invision Tools > System Logs. 
          Halt
        }
      }
      if $1 > 295 && $1 < 452 {
        if $2 > 308 && $2 < 417 {
          did -ra InvisMain 1502 Use Isolated Report Window, when enabled, will cause a separate window to be used for the PortScan results. This method is considerably better in that it will try to provide any commonly known uses for each port detected in use as opposed to the standard in active window report that will simply just list the port numbers themselves.
        }
      }
    }
    elseif %tab == 8 {
      if $1 > 20 && $1 < 250 {
        if $2 > 53 && $2 < 65 {
          did -ra InvisMain 1502 Protect Ops, when enabled, will take action against anyone not in the User Lists as a bot or higher that takes action on someone who is. So if say someone kicks a recognized Fellow Op out of the channel you would kick them from the channel and automatically send an invite to the protected op for that channel. It will also send a message to both parties explaining why you did what you did.
          halt
        }
        if $2 > 73 && $2 < 85 {
          did -ra InvisMain 1502 Allow /CTCP OPME. This feature, when enabled, will allow those users that have the flag for it in the users lists and that have set a password on you to gain ops in the channel via this command. This option has to be enabled for the channel (not default) and every user that you want to have this ability must have the channel entry in the user list manager along with the Remote Ops flag set for the channel. They also must set a password on your system.
          halt
        }
        if $2 > 93 && $2 < 105 {
          did -ra InvisMain 1502 Deop on Server Ops. This will deop anyone opped in the channel that is not at least a bot in your User Lists.
          halt
        }
        if $2 > 135 && $2 < 147 {
          did -ra InvisMain 1502 Kick on Flood will kick anyone not in your User Lists that text floods the channel. In the event a flood is detected the user is kicked from the channel.
          halt
        }
        if $2 > 155 && $2 < 167 {
          did -ra InvisMain 1502 Kick on trades, when enabled, will work to enforce no trading in the channel. It will trigger on such words as *trade*, *reward*, etc. The system will track users and start off by just kicking and warning them until the set amount is reached and from then on will kick and ban the offender upon violation. By default the warning count setting is set to 3. So after 3 warnings the offender from that point on will be banned on offense. These accumulations are clear at script start up. 
          halt
        }
        if $2 > 175 && $2 < 187 {
          did -ra InvisMain 1502 Banning of Domain, when enabled, will cause a domain ban to be set in the event that multiple joins in the number set from those of a common domain are made over the time frame occur. This is usually the case when someone attempts to join a bunch of clones and/or bots in an effort to takeover or simply flood a channel and/or individual. 
          halt
        }
      }
      if $1 > 270 && $1 < 545 {
        if $2 > 53 && $2 < 65 {
          did -ra InvisMain 1502 Bitch Mode, when enabled, will govern op status in the channel. Anyone opped in the channel that is not in your list as at least a bot or higher and has that channel listed in their User Lists Manager profile will automatically be deopped. Only those recognized and qualified will be allowed to remain opped. This feature would naturally require you to maintain an up-to-date User List of at least Bots and Fellow Ops.
          halt
        }
        if $2 > 73 && $2 < 85 {
          did -ra InvisMain 1502 Deop on Mass Deops, when enabled, will deop/kick and op that starts mass deopping or kicking people in the channel that is not recognized as a bot or higher in the User Lists. Those recognized will be not be affected.
          halt
        }
        if $2 > 93 && $2 < 105 {
          did -ra InvisMain 1502 Allow Op All Fellow Ops option, when enabled, will add the "Op all Fellow Ops" Option to the nicklist popup menu, which allows you to op all recognized Bots or higher that are not already opped in one simple click.
          halt
        }
        if $2 > 135 && $2 < 147 {
          did -ra InvisMain 1502 Ban on Flood adds banning action to the Kick on Flood option. 
          halt
        }
        if $2 > 155 && $2 < 167 {
          did -ra InvisMain 1502 Kick and Bban on Nick Flood. This will cause anyone that is not a recognized friend or higher that changes their nick more then 3 times in a short amount of time to be kicked and banned.
          halt
        }
        if $2 > 175 && $2 < 187 {
          did -ra InvisMain 1502 Banning of Domain, when enabled, will cause a domain ban to be set in the event that multiple joins in the number set from those of a common domain are made over the time frame occur. This is usually the case when someone attempt to join a bunch of clones and/or bots in an effort to takeover or simply flood a channel and/or individual. 
          halt
        }
      }

      if $1 > 260 && $1 < 545 {
        if $2 > 218 && $2 < 230 {
          did -ra InvisMain 1502 Wallop Explanation of Actions, when enabled, will send a notice to all the other ops about what defensive action you took and why. 
          halt
        }
        if $2 > 238 && $2 < 250 {
          did -ra InvisMain 1502 Learn New Channel Keys - With this enabled you will auto adapt to new keys set by those in your User Lists as a bot or higher for that channel. So if you are enforcing the +k key to something and a recognized bot or Fellow Op changes the key then you will now enforce that key. If a bot/fellow op does a -k and doesnt set a new key then you will enforce -k until you or another bot/fellow op sets one. I recommend you use this and keep your User Lists up-to-date if you plan to enforce +k.
          halt
        }
        if $2 > 258 && $2 < 292 {
          did -ra InvisMain 1502 Allow Remote Control - This will allow others that know your channel ops password to turn on and off individual features of channel defense in the event that you are /away. Only those in your Fellow Ops list that have the remote control flag set in the User List Manager can access this, even if they know the password. To see a list of commands a Fellow Op can do a /CTCP <yournick> HELP to you and get a list of all the commands and syntax.  
          halt
        }
        if $2 > 302 && $2 < 338 { 
          did -ra InvisMain 1502 Maintain Channel Occupancy - This will maintain the limit (+l) of the channel. You can specify the interval to how often it adjusts the limit as well as by how much.
          halt
        }
        if $2 > 342 && $2 < 376 {
          did -ra InvisMain 1502 Moderate and Lockdown under multi-floods - In the event that there are a lot of actions being taken such as kicks and bans by not just you but other ops this will react by temporarily locking down the channel. During this time the channel is made invite only, moderated, secret, and so on. The topic is changed to what is happening. After the time you specify is up it will restore all previous modes and the topic. You can specify the amount of time for lockdown and the sensitivity as well. I recommend you keep lockdown times to around 1 or 2 minutes.
          halt
        }
      }
      if $2 > 380 && $2 < 392 {
        if $1 > 270 && $1 < 387 {
          did -ra InvisMain 1502 This will let you +v (voice) people automatically when they run an Fserve Ad.
          halt
        }
        if $1 > 397 && $1 < 498 {
          did -ra InvisMain 1502 This will let you +v (voice) people automatically when they run an FTP Ad.
          halt
        }
      }
      if $2 > 402 && $2 < 414 {
        if $1 > 270 && $1 < 397 {
          did -ra InvisMain 1502 This will let you +v (voice) people automatically when they run an XDCC Ad.
          halt
        }
        if $1 > 397 && $1 < 498 {
          did -ra InvisMain 1502 This will let you +v (voice) people automatically when they run an mp3 Ad.
          halt
        }
      }
      if $1 > 9 && $1 < 242 && $2 > 200 && $2 < 274 {
        did -ra InvisMain 1502 Channel Modes - Here you can choose which channel modes you wish to enforce or not enforce. You can set them either + or - or click the UNSET button to not enforce it either way. Select the mode in the list and then click either + or - for that mode. IMPORTANT! MAKE SURE YOU HAVE THE CORRECT CHANNEL selected in the channel list below or you will be setting the mode as default or possible the wrong channel. WHEN SETTING +K enter the KEYNAME FIRST then click +. if you click + first you can always enter the keyname and just click on + again to set it.
        halt
      }
      if $1 > 9 && $1 < 242 && $2 > 280 && $2 < 395 {
        did -ra InvisMain 1502 Channels Affected - Here you can choose which channels you wish to enforce or not enforce. All settings on this tab are unique for each channel in the list. Select the channel FIRST before making any other changes. IMPORTANT! you may need to reselect the channel in the list after clicking the APPLY button. 
        halt
      }
    }
    elseif %tab == 9 {
      if $1 > 9 && $1 < 298 && $2 > 34 && $2 < 183 {
        did -ra InvisMain 1502 Time Stamp - This section should be self-explanatory by what it says in the box. This affects the timestamps for most of the script functions.
        halt
      }
      if $1 > 9 && $1 < 298 && $2 > 185 && $2 < 213 {
        did -ra InvisMain 1502 Update IAL on Channel Join: This being enabled has been the normal operation for all prior Invision releases before 2.0 Build 2020. Some people reported having problems connecting to large channels though due to this operation, so it is now user optional. Although numerous alterations have been made to make this operation not necessary, you might want to try enabling it if you are experiencing undesirable performance of other features.
        halt
      }
      if $1 > 310 && $1 < 585 && $2 > 34 && $2 < 213 {
        did -ra InvisMain 1502 Using global settings for all networks will prevent having different settings on every network.  Normally, you'll want this disabled.  Converting bitrate and bytes lets you view the numbers using either bytes and cps or  Kb/s and KB/MB/GB.  Normally, these should be enabled.  The rest should be self-explanatory.
        halt
      }
      if $1 > 9 && $1 < 585 && $2 > 219 && $2 < 257 {
        did -ra InvisMain 1502 Winamp Directory - This should be set to your Winamp Plugin directory if you plan to use Winamp support for mp3 playback. If it is not set correctly then it won't play.
        halt
      }
      if $1 > 9 && $1 < 204 && $2 > 257 && $2 < 315 {
        did -ra InvisMain 1502 Messenger Mode - This is where you can set how the messenger mode will attempt to deliver your messages you have sent through the User List Manager. If set to Join mode then it will /msg them about the message waiting when then join the channel. If set to Text mode (preferred) then it will notify them when they say something in the channel. It will only notify them once every 2 hours, not repeatedly every time they say something. Same for join mode.
        halt
      }
      if $1 > 9 && $1 < 204 && $2 > 321 && $2 < 373 {
        did -ra InvisMain 1502 !Seen Tracking - Here you can set who you want the Seen Engine to track. Friends or higher will track just those in your user lists as a friend or higher. Everyone is just that.. EVERYONE.  If you are in a lot of large channels and the channels are very active you may not want to use this mode.
        halt
      }
      if $1 > 9 && $1 < 204 && $2 > 376 && $2 < 420 {
        did -ra InvisMain 1502 !Seen Messaging lets you decide where you want results to appear when other users trigger your !Seen. $crlf $+ Note that "Channel Msg" will only message the channel if there is an exact match (to prevent channel flooding/spam).  /notice will always be used when there are multiple results.
        halt
      }
      if $1 > 217 && $1 < 585 && $2 > 257 && $2 < 315 {
        did -ra InvisMain 1502 HalfOp Support - This is where you can set networks in which full halfop support will be enabled. To add the current network you are on the box that has the Current Network name has to be something other then unknown. Unknown networks cannot be added. If you are on a network that you are sure supports halfops but shows up as unknown you can check the force box to enable it.
        halt
      }
      if $1 > 227 && $1 < 480 && $2 > 333 && $2 < 348 {
        did -ra InvisMain 1502 Do not scan local drives is an option you can set which will prevent the scanning for local drives when the File Server Explorer initiates upon connecting to an Fserve. This may be necessary in some cases where you have networked or detachable drives which make the explorer stall for long periods and in some cases timing out the Fserve Connection..
        halt
      }
      if $1 > 220 && $1 < 586 && $2 > 349 && $2 < 369 {
        did -ra InvisMain 1502 Nick tag is where you can customize the Invision nick tag used when you either do a nick: in the edit box or when you have DblClk Respond enable and then double click on a nick giving you the tag response prompt "/>" in the editbox. Use "nick" where you want the nick to appear in the tag and if you want to use a comma character you need to use $chr(44) instead. An example would be " $+ nick $+  $+ $chr(44)" without the quotes. This would produce a nick tag with the nick in Bold followed by a comma. The block character for bold is Ctrl + B.
        halt
      }
      ;  did -ra InvisMain 1502 $1 $2
    }
    elseif %tab == 1995 {
      if $1 > 10 && $1 < 250 && $2 > 40 && $2 < 70 {
        did -ra InvisMain 1502 The default ban type will be used throughout Invision for any bans that are automatically set except nick change flood bans.
      }
      elseif $1 > 10 && $1 < 250 && $2 > 70 && $2 < 180 {
        did -ra InvisMain 1502 Traytips allow you to have a tip pop up in your system tray whenever one of the events occur.  This can be very useful when mIRC is minimized, but you want to know when someone says something to you (only available in mIRC 6.3 or newer).  These act the same way as mIRC's new tray tips (Alt-O > Display > Options > Tips).
      }
      elseif $1 > 10 && $1 < 250 && $2 > 180 && $2 < 265 {
        did -ra InvisMain 1502 Choose where notices sent to you will appear.  If you choose the first option, all notices to you will show up in that network's status window.  The second option makes all notices appear in your active window, even if you are on a different network from the notice.  The third option shows the notice in all channels that you have in common with the person who noticed you (this was the way Invision worked previously).
      }
      elseif $1 > 260 && $1 < 580 && $2 > 70 && $2 < 265 {
        did -ra InvisMain 1502 Choose what networks to connect to when starting Invision.  You will connect to the networks in the order shown.
      }
      elseif $1 > 260 && $1 < 580 && $2 > 290 && $2 < 325 {
        did -ra InvisMain 1502 The @DCC_Info window that can be enable in DCC Setup, allows you to keep a record of your uploads/downloads.  Enabling the date stamp will separate the uploads/downloads by date to make it easier to monitor when the uploads/downloads occur.  It will display a date line before the first upload/download each day.  You can adjust the date stamp as needed.  For example, you could change it to dd/mm/yyyy or add colors or bold.  Type /help $eval($asctime,0) to see how else you can format the date.  You can also indent the date stamp by X amount of spaces.
      }
      elseif $1 > 260 && $1 < 580 && $2 > 330 && $2 < 385 {
        did -ra InvisMain 1502 Enabling the links for "Open File" and/or "Open Location" will add that text to the end of all Successfully received lines in @DCC_Info.  You can then double click that text to open either the file or location.  You can also choose to disable the warning when opening files.
      }
      elseif $1 > 10 && $1 < 250 && $2 > 290 && $2 < 305 {
        did -ra InvisMain 1502  By default, when someone joins a channel you are in, Invision will check the IAL to determine if the person is a clone of another nick in the channel, and display it at the end of the "nick has joined" line.  This option allows that feature to be disabled.
      }
      elseif $1 > 10 && $1 < 250 && $2 > 310 && $2 < 325 {
        did -ra InvisMain 1502  Invision can automatically replace the $chr(35) sign with the current channel name.  This option lets you choose whether or not Invision automatically replaces it or leaves it as-is.  Note that you can still type # and hit TAB to replace it with the channel name even if this option is unchecked.
      }
      elseif $1 > 10 && $1 < 250 && $2 > 330 && $2 < 345 {
        did -ra InvisMain 1502  The DCC Speed Monitor is a display on the right side of the toolbar that shows the current upload and download speeds in mIRC.
      }
      elseif $1 > 10 && $1 < 250 && $2 > 350 && $2 < 365 {
        did -ra InvisMain 1502  The Time and Date can be displayed on the toolbar using this option.  Clicking either the date or time will allow you to change between multiple formats so you can use the format you are most familiar with.
      }
      elseif ( ( $did(InvisMain,2051).visible ) && ( $1 > 10 ) && ( $1 < 250 ) && ( $2 > 370 ) && ( $2 < 385 ) ) {
        did -ra InvisMain 1502 This View Logs setting works in conjunction with mIRC's splitting of log files (the "Date filenames" setting).  When both are enabled and the right-click View Logs feature is used, it will load all log files for the channel/nick.  This can be useful for searching for something when you are not sure on what day it occurred.  Note that if you have a large amount of log files, this may cause mIRC to briefly freeze when opening the logs, as it has to open and read from each file.
      }
    }
  }
}
alias AwayHelp {
  if $dialog(AwayMgr).title != $null {
    var %tab = $dialog(AwayMgr).tab
    if %tab == 1 {
      if $1 > 20 && $1 < 297 && $2 > 40 && $2 < 98 {
        did -ra AwayMgr 1502 The Away Nick, if one is set, will be used when you are in /away mode. When you come back out of away mode it will revert back to what it was before, provided the nick is available. A common practice would be something like cRYOa_AFK for someone who normally went by cRYOa.
        halt
      }
      if $1 > 311 && $1 < 580 && $2 > 46 && $2 < 280 {
        did -ra AwayMgr 1502 The Active Channels section is where you can set which if not all channels you want the away system to be (or not to be) active in. If you set the channel mode to "include" mode then all channels specified will be active to the away system. This includes things like the Auto Away Messages to the channel(s). If you choose "Exclude" mode then it will function just the opposite in that all channels specified will not be active and they will not be sent any away type messages. This is good for channels that appreciate you informing them of your away status at any time.
        halt
      }
      if $1 > 312 && $1 < 438 && $2 > 287 && $2 < 343 {
        did -ra AwayMgr 1502 Away Message is where you can enable a repeating timed away message informing the channel(s) that you are currently away as well as how long you have been away and whether or not your pager is on.
        halt
      }
      if $1 > 451 && $1 < 580 && $2 > 287 && $2 < 343 {
        did -ra AwayMgr 1502 Auto Away, when enabled, will automatically put you in away mode when you have been idle the amount of time you have set. 
        halt
      }
      if $1 > 20 && $1 < 580 && $2 > 350 && $2 < 393 {
        did -ra AwayMgr 1502 Personal Auto Away Message, when enabled, will use the message you enter here instead of the default "<Nick> is AFK" Message. For example you might want to put something more personal such as "passed out again" or something more to your liking. =)
        halt
      }
      if $1 > 25 && $1 < 200 {
        if $2 > 123 && $2 < 135 {
          did -ra AwayMgr 1502 Messages to a single Window when away will cause messages sent to you to be sent to the single message window rather then a separate window like normal. If you normally use the Single Message Window option in mIRC Options anyway then this doesn't really matter since they would go there anyway. This just allows you to channel them there only when you're /away.
          halt
        }
        if $2 > 143 && $2 < 155 {
          did -ra AwayMgr 1502 Deop in channels when away will cause you to automatically deop yourself in all channels you are opped in when you enter away mode.
          halt
        }
        if $2 > 163 && $2 < 175 {
          did -ra AwayMgr 1502 Auto Reply, when enabled, will send your away message in the event someone private messages you or tries to DCC you. 
          halt
        }
        if $2 > 183 && $2 < 195 {
          did -ra AwayMgr 1502 Turn on Pager & Logger will do just that. It will turn on the pager if not already on and log pages sent to you while you are away.
          halt
        }
        if $2 > 203 && $2 < 215 {
          did -ra AwayMgr 1502 Auto Refuse DCC Chats will refuse any DCC chats that people try and initiate while you are in away mode.
          halt
        }
        if $2 > 223 && $2 < 235 {
          did -ra AwayMgr 1502 Display Away Message on Nick Use. This will cause the Away Message to be annouced in the event someone uses your nick in a channel you are on. The Away Message will only be displayed in the channel it was said on. It will only announce the away message at most once every 3 minutes, so if someone is using your nick repeatedly it will not spam the channel to death.
          halt
        }
        if $2 > 243 && $2 < 255 {
          did -ra AwayMgr 1502 A tooltip will appear in your tray whenever you receive a private message while you are /away.
          halt
        }
        if $2 > 263 && $2 < 275 {
          did -ra AwayMgr 1502 A tooltip will appear in your tray whenever you receive a page while you are /away.  Note that the Pager needs to be turned on to receive a Page.
          halt
        }
      }
    }
    if %tab == 2 {
      did -ra AwayMgr 1502 Here you can create your own custom away messages. The description is what will appear in your Set Away Menus. The Message is what will be the actual away message set.
    }
  }
}
