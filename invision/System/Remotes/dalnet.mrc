; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
; §§
; §§                                       INVISION VERSION 3.x Script for mIRC 7.0 By cRYOa
; §§                                       FILE: dalnet.mrc
; §§                                       DATE: 3-20-10
; §§                                       DESCRIPTION: 
; §§
; §§                                       DO NOT ADD OR CHANGE ANYTHING IN THIS FILE
; §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§
Menu MenuBar,Status {
  -
  $iif(($isDalnet || ($r.set(Invision,ForceDalnet) == On)),-------- Services --------)
  .$iif(($isDalnet || ($r.set(Invision,ForceDalnet) == On)),NickServ)
  ..Register: %Nserv [ $+ [ $iNetwork ] ] register $$?*="Enter Password" $$?*="Enter email address"
  ..Set
  ...PassWd: %Nserv [ $+ [ $iNetwork ] ] PASSWD $$?*="Enter New Password"
  ...Kill
  ....On: %Nserv [ $+ [ $iNetwork ] ] SET KILL ON
  ....Off: %Nserv [ $+ [ $iNetwork ] ] SET KILL OFF
  ...URL: %Nserv [ $+ [ $iNetwork ] ] URL $$?="Enter your URL"
  ...NoMemo
  ....On: %Nserv [ $+ [ $iNetwork ] ] SET NOMEMO ON
  ....Off: %Nserv [ $+ [ $iNetwork ] ] SET NOMEMO OFF
  ...NoOp
  ....On: %Nserv [ $+ [ $iNetwork ] ] SET NOOP ON
  ....Off: %Nserv [ $+ [ $iNetwork ] ] SET NOOP OFF
  ..Access
  ...Add: %Nserv [ $+ [ $iNetwork ] ] ACCESS ADD $$?="Enter Mask to Add"
  ...Del: %Nserv [ $+ [ $iNetwork ] ] ACCESS DEL $$?="Enter Mask/Num to Del"
  ...List: %Nserv [ $+ [ $iNetwork ] ] ACCESS LIST
  ..Identify:ident
  ..Recover: %Nserv [ $+ [ $iNetwork ] ] RECOVER $$?="Enter NickName" $?*="Enter Password"
  ..Ghost: %Nserv [ $+ [ $iNetwork ] ] GHOST $$?="Enter NickName" $?*="Enter Password"
  ..Drop: %Nserv [ $+ [ $iNetwork ] ] DROP
  ..Release: %Nserv [ $+ [ $iNetwork ] ] RELEASE $$?="Enter NickName" $?*="Enter Password"
  ..Info: %Nserv [ $+ [ $iNetwork ] ] INFO $$?="Enter NickName"
  ..ACC: %Nserv [ $+ [ $iNetwork ] ] ACC $$?="Enter NickName"
  ..-
  ..HELP: %Nserv [ $+ [ $iNetwork ] ] HELP
  .$iif(($isDalnet || ($r.set(Invision,ForceDalnet) == On)),ChanServ)
  ..Register: %Cserv [ $+ [ $iNetwork ] ] REGISTER #$$?="Enter Channel" $$?*="Enter Password" $$?="Enter Description"
  ..Set
  ...Founder: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" FOUNDER $$?="Enter New Founder"
  ...Passwd: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" PASSWD $$?*="Enter New Password"
  ...Desc: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" DESC $$?="Enter Description"
  ...Mlock: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" MLOCK $$?="Enter Modes (+tn)"
  ...OPguard
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" OPGUARD ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" OPGUARD OFF
  ...KeepTopic
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" KEEPTOPIC ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" KEEPTOPIC OFF
  ...URL: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" URL $$?="Enter URL"
  ...Ident
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" IDENT ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" IDENT OFF
  ...Restrict
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" RESTRICT ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" RESTRICT OFF
  ...TopicLock
  ....Founder: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" TOPICLOCK FOUNDER
  ....SOP:: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" TOPICLOCK SOP
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" TOPICLOCK OFF
  ...LeaveOps
  ....On:: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" LEAVEOPS ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" LEAVEOPS OFF
  ...UnSecure
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" UNSECURE ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" UNSECURE OFF
  ...Private
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" PRIVATE ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" PRIVATE OFF
  ...Memo
  ....None: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" MEMO NONE
  ....AOP: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" MEMO AOP
  ....SOP: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" MEMO SOP
  ....Founder: %Cserv [ $+ [ $iNetwork ] ] SET #$$?="Enter Channel" MEMO FOUNDER
  ..SOP
  ...Add: %Cserv [ $+ [ $iNetwork ] ] SOP #$$?="Enter Channel" ADD $$?="Enter Nick/Mask"
  ...Del: %Cserv [ $+ [ $iNetwork ] ] SOP #$$?="Enter Channel" DEL $$?="Enter Nick/Mask/Num"
  ...List: %Cserv [ $+ [ $iNetwork ] ] SOP #$$?="Enter Channel" LIST $$?="Enter Pattern"
  ..AOP
  ...Add: %Cserv [ $+ [ $iNetwork ] ] AOP #$$?="Enter Channel" ADD $$?="Enter Nick/Mask"
  ...Del: %Cserv [ $+ [ $iNetwork ] ] AOP #$$?="Enter Channel" DEL $$?="Enter Nick/Mask/Num"
  ...List: %Cserv [ $+ [ $iNetwork ] ] AOP #$$?="Enter Channel" LIST $$?="Enter Pattern"
  ..Auto-Kick
  ...Add: %Cserv [ $+ [ $iNetwork ] ] AKICK #$$?="Enter Channel" ADD $$?="Enter Nick/Mask" $$?="Enter Reason"
  ...Del: %Cserv [ $+ [ $iNetwork ] ] AKICK #$$?="Enter Channel" DEL $$?="Enter Nick/Mask/Num"
  ...List: %Cserv [ $+ [ $iNetwork ] ] AKICK #$$?="Enter Channel" LIST $$?="Enter Pattern"
  ..Drop: %Cserv [ $+ [ $iNetwork ] ] DROP #$$?="Enter Channel"
  ..Identify: %Cserv [ $+ [ $iNetwork ] ] Identify #$$?="Enter Channel" $$?*="Enter Password"
  ..Access: %Cserv [ $+ [ $iNetwork ] ] ACCESS #$$?="Enter Channel" $$?="Enter NickName"
  ..Op: %Cserv [ $+ [ $iNetwork ] ] OP #$$?="Enter Channel" $$?="Enter NickName"
  ..DeOp: %Cserv [ $+ [ $iNetwork ] ] DEOP #$$?="Enter Channel" $$?="Enter NickName"
  ..Info: %Cserv [ $+ [ $iNetwork ] ] INFO #$$?="Enter Channel"
  ..Invite: %Cserv [ $+ [ $iNetwork ] ] INVITE #$$?="Enter Channel" $$?="Enter NickName"
  ..MKick: %Cserv [ $+ [ $iNetwork ] ] MKICK #$$?="Enter Channel"
  ..MDeOp: %Cserv [ $+ [ $iNetwork ] ] MDEOP #$$?="Enter Channel"
  ..UnBan: %Cserv [ $+ [ $iNetwork ] ] UNBAN #$$?="Enter Channel" $$?="Enter me -or- all"
  ..Count: %Cserv [ $+ [ $iNetwork ] ] COUNT #$$?="Enter Channel"
  ..Why: %Cserv [ $+ [ $iNetwork ] ] WHY #$$?="Enter Channel" $$?="Enter NickName"
  ..-
  ..HELP: %Cserv [ $+ [ $iNetwork ] ] HELP
  .$iif(($isDalnet || ($r.set(Invision,ForceDalnet) == On)),MemoServ)
  ..Channel
  ...Send: %Mserv [ $+ [ $iNetwork ] ] SEND #$$?="Enter Channel" $$?="Enter Message"
  ...SendSOP: %Mserv [ $+ [ $iNetwork ] ] SENDSOP #$$?="Enter Channel" $$?="Enter Message"
  ...Read: %Mserv [ $+ [ $iNetwork ] ] READ #$$?="Enter Channel" $$?="Enter Num/All"
  ...List: %Mserv [ $+ [ $iNetwork ] ] LIST #$$?="Enter Channel"
  ...Del: %Mserv [ $+ [ $iNetwork ] ] DEL #$$?="Enter Channel" $$?="Enter Num/All"
  ..-
  ..Send: %Mserv [ $+ [ $iNetwork ] ] SEND $$?="Enter NickName" $$?="Enter Message"
  ..List: %Mserv [ $+ [ $iNetwork ] ] LIST
  ..Read: %Mserv [ $+ [ $iNetwork ] ] READ $$?="Enter Num/All"
  ..Forward Messages
  ...Start Forwarding:{ var %dum = $?="Registered Nick to Forward to:" |  %Mserv [ $+ [ $iNetwork ] ] FORWARD %dum $$?="Password for [ %dum ] " }
  ...Stop Forwarding:{  %Mserv [ $+ [ $iNetwork ] ] FORWARD - }
  ..Del: %Mserv [ $+ [ $iNetwork ] ] DEL $$?="Enter Num/All"
  ..Undel: %Mserv [ $+ [ $iNetwork ] ] UNDEL $$?="Enter Num"
  ..Purge: %Mserv [ $+ [ $iNetwork ] ] PURGE
  ..News:  %Mserv [ $+ [ $iNetwork ] ] NEWS
  ..-
  ..HELP: %Mserv [ $+ [ $iNetwork ] ] HELP
  .$iif(($hasDCCallow || ($r.set(Invision,ForceDalnet) == On)),DCCallow)
  ..Help:{ dccallow help }
  ..List:{ dccallow list }
  ..Add:{ .dccallow $$?="Add who?" }
  ..Remove
  ...$chr(35) $+ 1:{ dccallow -1 }
  ...$chr(35) $+ 2:{ dccallow -2 }
  ...$chr(35) $+ 3:{ dccallow -3 }
  ...$chr(35) $+ 4:{ dccallow -4 }
  ...$chr(35) $+ 5:{ dccallow -5 }
  ..Clear All:{ var %xvar = 1 | :start | dccallow -1 | inc %xvar 1 | if %xvar < 5 { goto start } }
  .-
  .$iif(o isin $usermode,IRCop)
  ..MemoServ
  ...OperSend: %Mserv [ $+ [ $iNetwork ] ] OPERSEND $$?="Enter Oper Memo"
  ..Oper Notices
  ...Global:.notice $ $+ $$?="Enter Server Mask (*.net)" $$?="Enter Global Message"
  ...Globops:.Globops $$?="Enter GlobOps Message"
  ...Locops:.Locops $$?="Enter LocOps Message"
  ...ChatOps:.ChatOps $$?="Enter ChatOp Message"
  ...HelpOp:.HelpOp $$?="Enter HelpOp Message"
  ...Wallops:.Wallops $$?="Enter Wallops Message"
  ..Kills/Bans
  ...Kill:.kill $$?="Enter NickName To Kill" $$?="Enter Reason"
  ...Kline
  ....Add:.kline $$?="Enter Address To Kline" $$?="Enter Reason"
  ....Del:.unkline $$?="Enter Address To UnKline"
  ....List:stats k
  ..Server
  ...Connect
  ....Normal:.CONNECT $$?="Enter Server to Connect to" $$?="Enter Port"
  ....Remote:.CONNECT $$?="Enter Server Connecting" $$?="Enter Port" $$?="Enter Server to Connect to"
  ...Squit:.SQUIT $$?="Server To Squit"
  ...Rehash:.REHASH
}
Menu Channel {
  -
  $iif(($isDalnet || ($r.set(Invision,ForceDalnet) == On)), ----- Services -----)
  .$iif(($isDalnet || ($r.set(Invision,ForceDalnet) == On)),NickServ)
  ..Register: %Nserv [ $+ [ $iNetwork ] ] register $$?*="Enter Password" $$?="Enter email address"
  ..Set
  ...PassWd: %Nserv [ $+ [ $iNetwork ] ] PASSWD $$?*="Enter New Password"
  ...Kill
  ....On: %Nserv [ $+ [ $iNetwork ] ] SET KILL ON
  ....Off: %Nserv [ $+ [ $iNetwork ] ] SET KILL OFF
  ...URL: %Nserv [ $+ [ $iNetwork ] ] URL $$?="Enter your URL"
  ...NoMemo
  ....On: %Nserv [ $+ [ $iNetwork ] ] SET NOMEMO ON
  ....Off: %Nserv [ $+ [ $iNetwork ] ] SET NOMEMO OFF
  ...NoOp
  ....On: %Nserv [ $+ [ $iNetwork ] ] SET NOOP ON
  ....Off: %Nserv [ $+ [ $iNetwork ] ] SET NOOP OFF
  ..Access
  ...Add: %Nserv [ $+ [ $iNetwork ] ] ACCESS ADD $$?="Enter Mask to Add"
  ...Del: %Nserv [ $+ [ $iNetwork ] ] ACCESS DEL $$?="Enter Mask/Num to Del"
  ...List: %Nserv [ $+ [ $iNetwork ] ] ACCESS LIST
  ..Identify:ident
  ..Recover: %Nserv [ $+ [ $iNetwork ] ] RECOVER $$?="Enter NickName" $?*="Enter Password"
  ..Ghost: %Nserv [ $+ [ $iNetwork ] ] GHOST $$?="Enter NickName" $?*="Enter Password"
  ..Drop: %Nserv [ $+ [ $iNetwork ] ] DROP
  ..Release: RELEASE %Nserv [ $+ [ $iNetwork ] ] $$?="Enter NickName" $?*="Enter Password"
  ..Info: %Nserv [ $+ [ $iNetwork ] ] INFO $$?="Enter NickName"
  ..ACC: %Nserv [ $+ [ $iNetwork ] ] ACC $$?="Enter NickName"
  ..-
  ..HELP: %Nserv [ $+ [ $iNetwork ] ] HELP
  .$iif(($isDalnet || ($r.set(Invision,ForceDalnet) == On)),ChanServ)
  ..Register: %Cserv [ $+ [ $iNetwork ] ] REGISTER $chan $$?*="Enter Password" $$?="Enter Description"
  ..Set
  ...Founder: %Cserv [ $+ [ $iNetwork ] ] SET $chan FOUNDER $$?="Enter New Founder"
  ...Passwd: %Cserv [ $+ [ $iNetwork ] ] SET $chan PASSWD $$?*="Enter New Password"
  ...Desc: %Cserv [ $+ [ $iNetwork ] ] SET $chan DESC $$?="Enter Description"
  ...Mlock: %Cserv [ $+ [ $iNetwork ] ] SET $chan MLOCK $$?="Enter Modes (+tn)"
  ...OPguard
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET $chan OPGUARD ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET $chan OPGUARD OFF
  ...KeepTopic
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET $chan KEEPTOPIC ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET $chan KEEPTOPIC OFF
  ...URL: %Cserv [ $+ [ $iNetwork ] ] SET $chan URL $$?="Enter URL"
  ...Ident
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET $chan IDENT ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET $chan IDENT OFF
  ...Restrict
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET $chan RESTRICT ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET $chan RESTRICT OFF
  ...TopicLock
  ....Founder: %Cserv [ $+ [ $iNetwork ] ] SET $chan TOPICLOCK FOUNDER
  ....SOP:: %Cserv [ $+ [ $iNetwork ] ] SET $chan TOPICLOCK SOP
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET $chan TOPICLOCK OFF
  ...LeaveOps
  ....On:: %Cserv [ $+ [ $iNetwork ] ] SET $chan LEAVEOPS ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET $chan LEAVEOPS OFF
  ...UnSecure
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET $chan UNSECURE ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET $chan UNSECURE OFF
  ...Private
  ....On: %Cserv [ $+ [ $iNetwork ] ] SET $chan PRIVATE ON
  ....Off: %Cserv [ $+ [ $iNetwork ] ] SET $chan PRIVATE OFF
  ...Memo
  ....None: %Cserv [ $+ [ $iNetwork ] ] SET $chan MEMO NONE
  ....AOP: %Cserv [ $+ [ $iNetwork ] ] SET $chan MEMO AOP
  ....SOP: %Cserv [ $+ [ $iNetwork ] ] SET $chan MEMO SOP
  ....Founder: %Cserv [ $+ [ $iNetwork ] ] SET $chan MEMO FOUNDER
  ..SOP
  ...Add: %Cserv [ $+ [ $iNetwork ] ] SOP $chan ADD $$?="Enter Nick/Mask"
  ...Del: %Cserv [ $+ [ $iNetwork ] ] SOP $chan DEL $$?="Enter Nick/Mask/Num"
  ...List: %Cserv [ $+ [ $iNetwork ] ] SOP $chan LIST $$?="Enter Pattern"
  ..AOP
  ...Add: %Cserv [ $+ [ $iNetwork ] ] AOP $chan ADD $$?="Enter Nick/Mask"
  ...Del: %Cserv [ $+ [ $iNetwork ] ] AOP $chan DEL $$?="Enter Nick/Mask/Num"
  ...List: %Cserv [ $+ [ $iNetwork ] ] AOP $chan LIST $$?="Enter Pattern"
  ..Auto-Kick
  ...Add: %Cserv [ $+ [ $iNetwork ] ] AKICK $chan ADD $$?="Enter Nick/Mask" $$?="Enter Reason"
  ...Del: %Cserv [ $+ [ $iNetwork ] ] AKICK $chan DEL $$?="Enter Nick/Mask/Num"
  ...List: %Cserv [ $+ [ $iNetwork ] ] AKICK $chan LIST $$?="Enter Pattern"
  ..Drop: %Cserv [ $+ [ $iNetwork ] ] DROP $chan
  ..Identify: %Cserv [ $+ [ $iNetwork ] ] Identify $chan $$?*="Enter Password"
  ..Access: %Cserv [ $+ [ $iNetwork ] ] ACCESS $chan $$?="Enter NickName"
  ..Op: %Cserv [ $+ [ $iNetwork ] ] OP $chan $$?="Enter NickName"
  ..DeOp: %Cserv [ $+ [ $iNetwork ] ] DEOP $chan $$?="Enter NickName"
  ..Info: %Cserv [ $+ [ $iNetwork ] ] INFO $chan
  ..Invite: %Cserv [ $+ [ $iNetwork ] ] INVITE $chan $$?="Enter NickName"
  ..MKick: %Cserv [ $+ [ $iNetwork ] ] MKICK $chan
  ..MDeOp: %Cserv [ $+ [ $iNetwork ] ] MDEOP $chan
  ..UnBan: %Cserv [ $+ [ $iNetwork ] ] UNBAN $chan $$?="Enter me -or- all"
  ..Count: %Cserv [ $+ [ $iNetwork ] ] COUNT $chan
  ..Why: %Cserv [ $+ [ $iNetwork ] ] WHY $chan $$?="Enter NickName"
  ..-
  ..HELP: %Cserv [ $+ [ $iNetwork ] ] HELP
  .$iif(($isDalnet || ($r.set(Invision,ForceDalnet) == On)),MemoServ)
  ..Channel
  ...Send: %Mserv [ $+ [ $iNetwork ] ] SEND $chan $$?="Enter Message"
  ...SendSOP: %Mserv [ $+ [ $iNetwork ] ] SENDSOP $chan $$?="Enter Message"
  ...Read: %Mserv [ $+ [ $iNetwork ] ] READ $chan $$?="Enter Num"
  ...List: %Mserv [ $+ [ $iNetwork ] ] LIST $chan
  ...Del: %Mserv [ $+ [ $iNetwork ] ] DEL $chan $$?="Enter Num/all"
  ..-
  ..Send: %Mserv [ $+ [ $iNetwork ] ] SEND $$?="Enter NickName" $$?="Enter Message"
  ..List: %Mserv [ $+ [ $iNetwork ] ] LIST
  ..Read: %Mserv [ $+ [ $iNetwork ] ] READ $$?="Enter Num"
  ..Forward Messages
  ...Start Forwarding:{ var %dum = $?="Registered Nick to Forward to:" |  %Mserv [ $+ [ $iNetwork ] ] FORWARD %dum $$?="Password for [ %dum ] " }
  ...Stop Forwarding:{  %Mserv [ $+ [ $iNetwork ] ] FORWARD - }
  ..Del: %Mserv [ $+ [ $iNetwork ] ] DEL $$?="Enter Num/all"
  ..Undel: %Mserv [ $+ [ $iNetwork ] ] UNDEL $$?="Enter Num"
  ..Purge: %Mserv [ $+ [ $iNetwork ] ] PURGE
  ..News: %Mserv [ $+ [ $iNetwork ] ] NEWS
  ..-
  ..HELP: %Mserv [ $+ [ $iNetwork ] ] HELP
  .$iif(($hasDCCallow || ($r.set(Invision,ForceDalnet) == On)),DCCallow)
  ..Help:{ dccallow help }
  ..List:{ dccallow list }
  ..Add:{ .dccallow + $+ $$?="Add who?" }
  ..Remove:{ .idccremove $$?="Remove who?" }
  ..Clear All:{ var %xvar = 1 | :start | dccallow -1 | inc %xvar 1 | if %xvar < 5 { goto start } }
  .-
  .$iif(o isin $usermode,IRCop)
  ..MemoServ
  ...OperSend: %Mserv [ $+ [ $iNetwork ] ] OPERSEND $$?="Enter Oper Memo"
  ..Oper Notices
  ...Global:.notice $ $+ $$?="Enter Server Mask (*.net)" $$?="Enter Global Message"
  ...Globops:.Globops $$?="Enter GlobOps Message"
  ...Locops:.Locops $$?="Enter LocOps Message"
  ...ChatOps:.ChatOps $$?="Enter ChatOp Message"
  ...HelpOp:.HelpOp $$?="Enter HelpOp Message"
  ...Wallops:.Wallops $$?="Enter Wallops Message"
  ..Kills/Bans
  ...Kill:.kill $$?="Enter NickName To Kill" $$?="Enter Reason"
  ...Kline
  ....Add:.kline $$?="Enter Address To Kline" $$?="Enter Reason"
  ....Del:.unkline $$?="Enter Address To UnKline"
  ....List:stats k
  ..Server
  ...Connect
  ....Normal:.CONNECT $$?="Enter Server to Connect to" $$?="Enter Port"
  ....Remote:.CONNECT $$?="Enter Server Connecting" $$?="Enter Port" $$?="Enter Server to Connect to"
  ...Squit:.SQUIT $$?="Server To Squit"
  ...Rehash:.REHASH
}
Menu NickList {
  -
  $iif(($isDalnet || ($r.set(Invision,ForceDalnet) == On)),ChanServ)
  .SOP
  ..Add: %Cserv [ $+ [ $iNetwork ] ] SOP $chan ADD $$1
  ..Del: %Cserv [ $+ [ $iNetwork ] ] SOP $chan DEL $$1
  ..List: %Cserv [ $+ [ $iNetwork ] ] SOP $chan LIST
  .AOP
  ..Add: %Cserv [ $+ [ $iNetwork ] ] AOP $chan ADD $$1
  ..Del: %Cserv [ $+ [ $iNetwork ] ] AOP $chan DEL $$1
  ..List: %Cserv [ $+ [ $iNetwork ] ] AOP $chan LIST
  .AKick
  ..Add: %Cserv [ $+ [ $iNetwork ] ] AKICK $chan ADD $$1 $$?="Enter Reason"
  ..Del: %Cserv [ $+ [ $iNetwork ] ] AKICK $chan DEL $$1
  ..List: %Cserv [ $+ [ $iNetwork ] ] AKICK $chan LIST
  .Ops
  ..Give: %Cserv [ $+ [ $iNetwork ] ] op $chan $$1
  ..Take: %Cserv [ $+ [ $iNetwork ] ] deop $chan $$1
  .Access
  ..Add
  ...Auto-Admin $1 (Level 10): %Cserv [ $+ [ $iNetwork ] ] access $chan add $$1 10
  ...Auto-Op $1 (Level 5): %Cserv [ $+ [ $iNetwork ] ] access $chan add $$1 5
  ...Auto-Voice $1 (Level 3): %Cserv [ $+ [ $iNetwork ] ] access $chan add $$1 3
  ...Prevent $1 from getting ops (Level -1): %Cserv [ $+ [ $iNetwork ] ] access $chan add $$1 -1
  ...Set $1 to another level: %Cserv [ $+ [ $iNetwork ] ] access $chan add $$1 $$?="Select Access Level"
  ..Del
  ...Remove Access Level(s) for $1: %Cserv [ $+ [ $iNetwork ] ] access $chan del $$1
  ..List: %Cserv [ $+ [ $iNetwork ] ] access $chan list
  ..Clear List: %Cserv [ $+ [ $iNetwork ] ] access $chan clear
  $iif(($hasDCCallow || ($r.set(Invision,ForceDalnet) == On)),DCCallow $1):{ .dccallow + $+ $$1 }
  $iif(($hasDCCallow || ($r.set(Invision,ForceDalnet) == On)),Remove from DCCallow):{ .idccremove $$1 }
}
