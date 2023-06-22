æ
åC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\MensajeriaService\MensajeriaService.Infrastructure\InfrastructureModule.cs
	namespace

 	
MensajeriaService


 
.

 
Infrastructure

 *
{ 
public 

class  
InfrastructureModule %
:% &
Module& ,
{ 
	protected 
override 
void 
Load  $
($ %
ContainerBuilder% 5
builder6 =
)= >
{ 	
builder 
. 
RegisterType  
<  !
MessagingApi! -
>- .
(. /
)/ 0
.0 1
As1 3
<3 4
IMessagingApi4 A
>A B
(B C
)C D
.D E$
InstancePerLifetimeScopeE ]
(] ^
)^ _
;_ `
} 	
} 
} Ö 
êC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\MensajeriaService\MensajeriaService.Infrastructure\WhatsappApi\MessagingApi.cs
	namespace 	
MensajeriaService
 
. 
Infrastructure *
.* +
WhatsappApi+ 6
{ 
public 

class 
MessagingApi 
: 
IMessagingApi  -
{ 
private 
readonly 
IConfiguration '
_configuration( 6
;6 7
public 
MessagingApi 
( 
IConfiguration *
configuration+ 8
)8 9
{ 	
_configuration 
= 
configuration *
;* +
var 

accountSid 
= 
_configuration +
[+ ,
$str, 8
]8 9
;9 :
var 
	authToken 
= 
_configuration *
[* +
$str+ 9
]9 :
;: ;
TwilioClient 
. 
Init 
( 

accountSid (
,( )
	authToken* 3
)3 4
;4 5
} 	
public 
async 
Task 
< 
bool 
> 
SendSMS  '
(' (
MessageData( 3
messageData4 ?
)? @
{ 	
try 
{ 
var   
fromPhoneNumber   #
=  $ %
_configuration  & 4
[  4 5
$str  5 D
]  D E
;  E F
var"" 

smsMessage"" 
=""  
await""! &
MessageResource""' 6
.""6 7
CreateAsync""7 B
(""B C
body## 
:## 
messageData## %
.##% &
Message##& -
,##- .
from$$ 
:$$ 
new$$ 
Twilio$$ $
.$$$ %
Types$$% *
.$$* +
PhoneNumber$$+ 6
($$6 7
fromPhoneNumber$$7 F
)$$F G
,$$G H
to%% 
:%% 
new%% 
Twilio%% "
.%%" #
Types%%# (
.%%( )
PhoneNumber%%) 4
(%%4 5
messageData%%5 @
.%%@ A
Phone%%A F
)%%F G
)&& 
;&& 
return(( 

smsMessage(( !
!=((" $
null((% )
;(() *
})) 
catch** 
(** 
	Exception** 
ex** 
)**  
{++ 
return,, 
false,, 
;,, 
}-- 
}.. 	
public00 
async00 
Task00 
<00 
bool00 
>00 
SendWhatsapp00  ,
(00, -
MessageData00- 8
messageData009 D
)00D E
{11 	
try22 
{33 
var44 
fromPhoneNumber44 #
=44$ %
_configuration44& 4
[444 5
$str445 D
]44D E
;44E F
var66 
whatsappMessage66 #
=66$ %
await66& +
MessageResource66, ;
.66; <
CreateAsync66< G
(66G H
body77 
:77 
messageData77 %
.77% &
Message77& -
,77- .
from88 
:88 
new88 
PhoneNumber88 )
(88) *
$str88* 5
+886 7
fromPhoneNumber888 G
)88G H
,88H I
to99 
:99 
new99 
PhoneNumber99 '
(99' (
$str99( 3
+994 5
messageData996 A
.99A B
Phone99B G
)99G H
):: 
;:: 
return<< 
whatsappMessage<< &
!=<<' )
null<<* .
;<<. /
}== 
catch>> 
(>> 
	Exception>> 
ex>> 
)>>  
{?? 
returnAA 
falseAA 
;AA 
}BB 
}CC 	
}DD 
}EE 