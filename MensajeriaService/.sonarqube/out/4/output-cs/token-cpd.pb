¡
|C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\MensajeriaService\MensajeriaService.Domain\DomainModule.cs
	namespace

 	
MensajeriaService


 
.

 
Domain

 "
{ 
public 

class 
DomainModule 
: 
Module $
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
<  !
MessageService! /
>/ 0
(0 1
)1 2
.2 3
As3 5
<5 6
IMessageService6 E
>E F
(F G
)G H
.H I$
InstancePerLifetimeScopeI a
(a b
)b c
;c d
} 	
} 
} ¯
„C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\MensajeriaService\MensajeriaService.Domain\Entities\MessageData.cs
	namespace 	
MensajeriaService
 
. 
Domain "
." #
Entities# +
{ 
public		 

class		 
MessageData		 
{

 
public 
string 
Phone 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Message 
{ 
get! $
;$ %
set& )
;) *
}+ ,
} 
} ü
ŠC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\MensajeriaService\MensajeriaService.Domain\Interfaces\IMessageService.cs
	namespace 	
MensajeriaService
 
. 
Domain "
." #

Interfaces# -
{		 
public

 

	interface

 
IMessageService

 $
{ 
Task 
< 
bool 
> 
SendSMS 
( 
MessageData &
messageData' 2
)2 3
;3 4
Task 
< 
bool 
> 
SendWhatsapp 
(  
MessageData  +
messageData, 7
)7 8
;8 9
} 
} ø
ˆC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\MensajeriaService\MensajeriaService.Domain\Interfaces\IMessagingApi.cs
	namespace 	
MensajeriaService
 
. 
Domain "
." #

Interfaces# -
{		 
public

 

	interface

 
IMessagingApi

 "
{ 
Task 
< 
bool 
> 
SendSMS 
( 
MessageData &
messageData' 2
)2 3
;3 4
Task 
< 
bool 
> 
SendWhatsapp 
(  
MessageData  +
messageData, 7
)7 8
;8 9
} 
} ±
‡C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\MensajeriaService\MensajeriaService.Domain\Services\MessageService.cs
	namespace		 	
MensajeriaService		
 
.		 
Domain		 "
.		" #
Services		# +
{

 
public 

class 
MessageService 
:  !
IMessageService" 1
{ 
private 
readonly 
IMessagingApi &
_messagingApi' 4
;4 5
public 
MessageService 
( 
IMessagingApi +
messagingApi, 8
)8 9
{ 	
_messagingApi 
= 
messagingApi (
;( )
} 	
public 
Task 
< 
bool 
> 
SendSMS !
(! "
MessageData" -
messageData. 9
)9 :
{ 	
try 
{ 
var 
sendSmsMessage "
=# $
_messagingApi% 2
.2 3
SendSMS3 :
(: ;
messageData; F
)F G
;G H
return 
sendSmsMessage %
;% &
} 
catch 
{ 
return 
Task 
. 

FromResult &
(& '
false' ,
), -
;- .
} 
} 	
public   
Task   
<   
bool   
>   
SendWhatsapp   &
(  & '
MessageData  ' 2
messageData  3 >
)  > ?
{!! 	
try"" 
{## 
var$$ 
sendWhatsappMessage$$ '
=$$( )
_messagingApi$$* 7
.$$7 8
SendWhatsapp$$8 D
($$D E
messageData$$E P
)$$P Q
;$$Q R
return%% 
sendWhatsappMessage%% *
;%%* +
}&& 
catch'' 
{(( 
return)) 
Task)) 
.)) 

FromResult)) &
())& '
false))' ,
))), -
;))- .
}** 
}++ 	
},, 
}-- 