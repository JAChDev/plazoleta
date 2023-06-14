à

sC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\DomainModule.cs
	namespace

 	
PlazoletaService


 
.

 
Domain

 !
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
<  !
RestaurantServices! 3
>3 4
(4 5
)5 6
.6 7
As7 9
<9 :
IRestaurantService: L
>L M
(M N
)N O
.O P$
InstancePerLifetimeScopeP h
(h i
)i j
;j k
builder 
. 
RegisterType  
<  !
AuthService! ,
>, -
(- .
). /
./ 0
As0 2
<2 3
IAuthService3 ?
>? @
(@ A
)A B
.B C$
InstancePerLifetimeScopeC [
([ \
)\ ]
;] ^
} 	
} 
} º
{C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\DTO\ModifyProductDTO.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
DTO" %
{ 
public		 

class		 
ModifyProductDTO		 !
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ß

sC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\DTO\OrderDTO.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
DTO" %
{		 
public

 

class

 
OrderDTO

 
{ 
[ 	
Key	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 

id_Cliente 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Fecha 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
Estado 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
id_Chef 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
id_Restaurante !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ∫
zC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\DTO\OrderProductDTO.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
DTO" %
{ 
public		 

class		 
OrderProductDTO		  
{

 
public 
int 
	id_Pedido 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
id_Plato 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Cantidad 
{ 
get !
;! "
set# &
;& '
}( )
} 
} º
uC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\DTO\ProductDTO.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
DTO" %
{ 
public		 

class		 

ProductDTO		 
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
id_categoria 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Precio 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
id_restaurante !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 

url_imagen  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} °
xC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\DTO\RestaurantDTO.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
DTO" %
{		 
public

 

class

 
RestaurantDTO

 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
	Direccion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
id_propietario !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Telefono 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
UrlLogo 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Nit 
{ 
get 
;  
set! $
;$ %
}& '
} 
} ¿
}C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Entities\ModifyProduct.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
Entities" *
{		 
public

 

class

 
ModifyProduct

 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ˛	
uC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Entities\Order.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
Entities" *
{ 
public		 

class		 
Order		 
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 

id_Cliente 
{ 
get  #
;# $
set% (
;( )
}* +
public 
DateTime 
Fecha 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Estado 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
id_Chef 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
id_Restaurante !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} æ
|C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Entities\OrderProduct.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
Entities" *
{ 
public		 

class		 
OrderProduct		 
{

 
public 
int 
	id_Pedido 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
id_Plato 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Cantidad 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ¿
wC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Entities\Product.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
Entities" *
{		 
public

 

class

 
Product

 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
id_categoria 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Descripcion !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Precio 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
id_restaurante !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 

url_imagen  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} •
zC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Entities\Restaurant.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
Entities" *
{ 
public		 

class		 

Restaurant		 
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
	Direccion 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
id_propietario !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Telefono 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
UrlLogo 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Nit 
{ 
get 
;  
set! $
;$ %
}& '
} 
} «
~C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Interfaces\IAuthService.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "

Interfaces" ,
{		 
public

 

	interface

 
IAuthService

 !
{ 
public 
Task 
< 
bool 
> 
ValidateToken '
(' (
string( .
token/ 4
)4 5
;5 6
public 
Task 
< 
IEnumerable 
<  
string  &
>& '
>' (
GetRoles) 1
(1 2
string2 8
Id9 ;
); <
;< =
public %
TokenValidationParameters ((
GetTokenValidationParameters) E
(E F
)F G
;G H
} 
} ˚
ÇC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Interfaces\IMySQLRepository.cs
	namespace

 	
PlazoletaService


 
.

 
Domain

 !
.

! "

Interfaces

" ,
{ 
public 

	interface 
IMySQLRepository %
{ 

DbResponse 
CreateRestaurant #
(# $
RestaurantDTO$ 1
restaurantDTO2 ?
)? @
;@ A

DbResponse 
CreateProduct  
(  !

ProductDTO! +

productDTO, 6
)6 7
;7 8

DbResponse 
UpdateProduct  
(  !
ModifyProductDTO! 1

productDTO2 <
)< =
;= >
RestaurantDTO "
GetRestaurantByOwnerId ,
(, -
int- 0
id1 3
)3 4
;4 5

ProductDTO 
GetProductById !
(! "
int" %
id& (
)( )
;) *

DbResponse 
ActivateProduct "
(" #
int# &
	productId' 0
)0 1
;1 2
List 
< 
RestaurantDTO 
> 
GetRestaurants *
(* +
int+ .

pageNumber/ 9
,9 :
int; >
pageSize? G
)G H
;H I
List 
< 

ProductDTO 
> #
GetProductsByRestaurant 0
(0 1
int1 4
restaurantId5 A
,A B
intC F

pageNumberG Q
,Q R
intS V
pageSizeW _
)_ `
;` a

DbResponse 
CreateOrder 
( 
OrderDTO '
order( -
)- .
;. /

DbResponse 
AddOrderProduct "
(" #
OrderProductDTO# 2
orderProduct3 ?
)? @
;@ A
List 
< 
OrderDTO 
> 
GetOrdersWithFilter *
(* +
int+ .
id/ 1
,1 2
string3 9
filter: @
,@ A
intB E

pageNumberF P
,P Q
intR U
pageSizeV ^
)^ _
;_ `
} 
} ˚
ÑC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Interfaces\IRestaurantService.cs
	namespace		 	
PlazoletaService		
 
.		 
Domain		 !
.		! "

Interfaces		" ,
{

 
public 

	interface 
IRestaurantService '
{ 
public 
GeneralResponse 
CreateRestaurant /
(/ 0

Restaurant0 :

restaurant; E
)E F
;F G
public 
GeneralResponse 
CreateProduct ,
(, -
Product- 4
product5 <
)< =
;= >
public 
GeneralResponse 
UpdateProduct ,
(, -
ModifyProduct- :
product; B
,B C
intD G
idH J
)J K
;K L
public 
GeneralResponse 
ActivateProduct .
(. /
int/ 2
id3 5
,5 6
int7 :
ownerId; B
)B C
;C D
public 
List 
< 
object 
> 
GetRestaurants *
(* +
int+ .

pageNumber/ 9
,9 :
int; >
pageSize? G
)G H
;H I
public 
List 
< 
Product 
> #
GetProductsByRestaurant 4
(4 5
int5 8
restaurantId9 E
,E F
intG J

pageNumberK U
,U V
intW Z
pageSize[ c
)c d
;d e
public 
GeneralResponse 
CreateOrder *
(* +
Order+ 0
order1 6
)6 7
;7 8
public 
GeneralResponse 
AddOrderProduct .
(. /
OrderProduct/ ;
orderProduct< H
)H I
;I J
public 
List 
< 
Order 
> 
GetOrdersWithFilter .
(. /
int/ 2
id3 5
,5 6
string7 =
filter> D
,D E
intF I

pageNumberJ T
,T U
intV Y
pageSizeZ b
)b c
;c d
} 
} ¥
uC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\MappingProfile.cs
	namespace

 	
PlazoletaService


 
.

 
Domain

 !
{ 
public 

class 
MappingProfile 
:  
Profile  '
{ 
public 
MappingProfile 
( 
) 
{  !
	CreateMap 
< 

Restaurant  
,  !
RestaurantDTO" /
>/ 0
(0 1
)1 2
;2 3
	CreateMap 
< 
RestaurantDTO #
,# $

Restaurant% /
>/ 0
(0 1
)1 2
;2 3
	CreateMap 
< 
ModifyProductDTO &
,& '
ModifyProduct( 5
>5 6
(6 7
)7 8
;8 9
	CreateMap 
< 
ModifyProduct #
,# $
ModifyProductDTO% 5
>5 6
(6 7
)7 8
;8 9
	CreateMap 
< 
Product 
, 

ProductDTO )
>) *
(* +
)+ ,
;, -
	CreateMap 
< 

ProductDTO  
,  !
Product" )
>) *
(* +
)+ ,
;, -
	CreateMap 
< 
Order 
, 
OrderDTO %
>% &
(& '
)' (
;( )
	CreateMap 
< 
OrderDTO 
, 
Order  %
>% &
(& '
)' (
;( )
	CreateMap 
< 
OrderProduct "
," #
OrderProductDTO$ 3
>3 4
(4 5
)5 6
;6 7
	CreateMap 
< 
OrderProductDTO %
,% &
OrderProduct' 3
>3 4
(4 5
)5 6
;6 7
} 	
} 
} §
{C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Responses\DbResponse.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
	Responses" +
{ 
public		 

class		 

DbResponse		 
{

 
public 
bool 
Success 
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
get  #
;# $
set% (
;( )
}* +
} 
} ¿
ÄC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Responses\GeneralResponse.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
	Responses" +
{		 
public

 

class

 
GeneralResponse

  
{ 
public 
HttpStatusCode 

StatusCode (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} î&
|C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Servicios\AuthService.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
	Servicios" +
{ 
public 

class 
AuthService 
: 
IAuthService +
{ 
private 
readonly 
IConfiguration '
_config( /
;/ 0
public 
AuthService 
( 
IConfiguration )
config* 0
)0 1
{ 	
_config 
= 
config 
; 
} 	
public 
Task 
< 
IEnumerable 
<  
string  &
>& '
>' (
GetRoles) 1
(1 2
string2 8
Id9 ;
); <
{ 	
throw 
new #
NotImplementedException -
(- .
). /
;/ 0
} 	
public %
TokenValidationParameters ((
GetTokenValidationParameters) E
(E F
)F G
{ 	
byte 
[ 
] 
secretKeyBytes !
=" #
Encoding$ ,
., -
UTF8- 1
.1 2
GetBytes2 :
(: ;
_config; B
.B C

GetSectionC M
(M N
$strN U
)U V
.V W
ValueW \
)\ ]
;] ^
var  
validationParameters $
=% &
new' *%
TokenValidationParameters+ D
{ $
ValidateIssuerSigningKey   (
=  ) *
true  + /
,  / 0
IssuerSigningKey!!  
=!!! "
new!!# & 
SymmetricSecurityKey!!' ;
(!!; <
secretKeyBytes!!< J
)!!J K
,!!K L
ValidateIssuer"" 
=""  
false""! &
,""& '
ValidateAudience##  
=##! "
false### (
,##( )
ValidateLifetime$$  
=$$! "
false$$# (
}%% 
;%% 
return&&  
validationParameters&& '
;&&' (
}'' 	
public)) 
Task)) 
<)) 
bool)) 
>)) 
ValidateToken)) '
())' (
string))( .
token))/ 4
)))4 5
{** 	
try++ 
{,, 
var-- 
tokenHandler--  
=--! "
new--# &#
JwtSecurityTokenHandler--' >
(--> ?
)--? @
;--@ A
byte.. 
[.. 
].. 
secretKeyBytes.. %
=..& '
Encoding..( 0
...0 1
UTF8..1 5
...5 6
GetBytes..6 >
(..> ?
_config..? F
...F G

GetSection..G Q
(..Q R
$str..R Y
)..Y Z
...Z [
Value..[ `
)..` a
;..a b
var//  
validationParameters// (
=//) *
new//+ .%
TokenValidationParameters/// H
{00 $
ValidateIssuerSigningKey11 ,
=11- .
true11/ 3
,113 4
IssuerSigningKey22 $
=22% &
new22' * 
SymmetricSecurityKey22+ ?
(22? @
secretKeyBytes22@ N
)22N O
,22O P
ValidateIssuer33 "
=33# $
false33% *
,33* +
ValidateAudience44 $
=44% &
false44' ,
,44, -
ValidateLifetime55 $
=55% &
false55' ,
}66 
;66 
var77 
	principal77 
=77 
tokenHandler77  ,
.77, -
ValidateToken77- :
(77: ;
token77; @
,77@ A 
validationParameters77B V
,77V W
out77X [
_77\ ]
)77] ^
;77^ _
if88 
(88 
	principal88 
.88 
Identity88 &
is88' )
not88* -
ClaimsIdentity88. <
identity88= E
||88F H
!88I J
identity88J R
.88R S
IsAuthenticated88S b
)88b c
return99 
Task99 
.99  

FromResult99  *
(99* +
false99+ 0
)990 1
;991 2
return>> 
Task>> 
.>> 

FromResult>> &
(>>& '
true>>' +
)>>+ ,
;>>, -
}?? 
catch@@ 
(@@ 
	Exception@@ 
)@@ 
{AA 
returnBB 
TaskBB 
.BB 

FromResultBB &
(BB& '
falseBB' ,
)BB, -
;BB- .
}CC 
}DD 	
}EE 
}FF ÷ü
ÉC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\Plazoleta.Domain\Servicios\RestaurantServices.cs
	namespace 	
PlazoletaService
 
. 
Domain !
.! "
	Servicios" +
{ 
public 

class 
RestaurantServices #
:$ %
IRestaurantService& 8
{ 
private 
readonly 
IMySQLRepository )
_mysqlRepository* :
;: ;
private 
readonly 
IMapper  
_mapper! (
;( )
public 
RestaurantServices !
(! "
IMySQLRepository" 2
mysqlRepository3 B
,B C
IMapperD K
mapperL R
)R S
{ 	
_mysqlRepository 
= 
mysqlRepository .
;. /
_mapper 
= 
mapper 
; 
} 	
public 
GeneralResponse 
CreateProduct ,
(, -
Product- 4
product5 <
)< =
{ 	
try 
{ 

ProductDTO 

productDTO %
=& '
_mapper( /
./ 0
Map0 3
<3 4

ProductDTO4 >
>> ?
(? @
product@ G
)G H
;H I

DbResponse 
createProduct (
=) *
_mysqlRepository+ ;
.; <
CreateProduct< I
(I J

productDTOJ T
)T U
;U V
if 
( 
createProduct !
.! "
Success" )
)) *
{   
return!! 
new!! 
GeneralResponse!! .
{!!/ 0

StatusCode!!1 ;
=!!< =
HttpStatusCode!!> L
.!!L M
OK!!M O
,!!O P
Description!!Q \
=!!] ^
$str!!_ z
}!!{ |
;!!| }
}"" 
else## 
{$$ 
return%% 
new%% 
GeneralResponse%% .
{%%/ 0

StatusCode%%1 ;
=%%< =
HttpStatusCode%%> L
.%%L M

BadRequest%%M W
,%%W X
Description%%Y d
=%%e f
$str%%g |
}%%} ~
;%%~ 
}&& 
}'' 
catch(( 
((( 
	Exception(( 
ex(( 
)((  
{)) 
return** 
new** 
GeneralResponse** *
{**+ ,

StatusCode**- 7
=**8 9
HttpStatusCode**: H
.**H I

BadRequest**I S
,**S T
Description**U `
=**a b
ex**c e
.**e f
Message**f m
}**n o
;**o p
}++ 
},, 	
public.. 
GeneralResponse.. 
CreateRestaurant.. /
(../ 0

Restaurant..0 :

restaurant..; E
)..E F
{// 	
try00 
{11 
RestaurantDTO22 
restaurantDTO22 +
=22, -
_mapper22. 5
.225 6
Map226 9
<229 :
RestaurantDTO22: G
>22G H
(22H I

restaurant22I S
)22S T
;22T U

DbResponse33 
createRestaurant33 +
=33, -
_mysqlRepository33. >
.33> ?
CreateRestaurant33? O
(33O P
restaurantDTO33P ]
)33] ^
;33^ _
if44 
(44 
createRestaurant44 $
.44$ %
Success44% ,
)44, -
{55 
return66 
new66 
GeneralResponse66 .
{66/ 0

StatusCode661 ;
=66< =
HttpStatusCode66> L
.66L M
OK66M O
,66O P
Description66Q \
=66] ^
$str	66_ Ä
}
66Å Ç
;
66Ç É
}77 
else88 
{99 
return:: 
new:: 
GeneralResponse:: .
{::/ 0

StatusCode::1 ;
=::< =
HttpStatusCode::> L
.::L M

BadRequest::M W
,::W X
Description::Y d
=::e f
$str	::g Ç
}
::É Ñ
;
::Ñ Ö
};; 
}<< 
catch== 
(== 
	Exception== 
ex== 
)==  
{>> 
return?? 
new?? 
GeneralResponse?? *
{??+ ,

StatusCode??- 7
=??8 9
HttpStatusCode??: H
.??H I

BadRequest??I S
,??S T
Description??U `
=??a b
ex??c e
.??e f
Message??f m
}??n o
;??o p
}@@ 
}AA 	
publicCC 
GeneralResponseCC 
UpdateProductCC ,
(CC, -
ModifyProductCC- :
productCC; B
,CCB C
intCCD G
idCCH J
)CCJ K
{DD 	
tryEE 
{FF 

ProductDTOGG 

getProductGG %
=GG& '
_mysqlRepositoryGG( 8
.GG8 9
GetProductByIdGG9 G
(GGG H
productGGH O
.GGO P
IdGGP R
)GGR S
;GGS T
RestaurantDTOHH 
getRestaurantHH +
=HH, -
_mysqlRepositoryHH. >
.HH> ?"
GetRestaurantByOwnerIdHH? U
(HHU V
idHHV X
)HHX Y
;HHY Z
ifJJ 
(JJ 

getProductJJ 
!=JJ !
nullJJ" &
&&JJ' )
getRestaurantJJ* 7
!=JJ8 :
nullJJ; ?
)JJ? @
{KK 
ifLL 
(LL 

getProductLL "
.LL" #
id_restauranteLL# 1
!=LL2 4
getRestaurantLL5 B
.LLB C
IdLLC E
)LLE F
{MM 
returnNN 
newNN "
GeneralResponseNN# 2
{NN3 4

StatusCodeNN5 ?
=NN@ A
HttpStatusCodeNNB P
.NNP Q

BadRequestNNQ [
,NN[ \
DescriptionNN] h
=NNi j
$str	NNk ï
}
NNñ ó
;
NNó ò
}OO 
}PP 
elseQQ 
{RR 
returnSS 
newSS 
GeneralResponseSS .
{SS/ 0

StatusCodeSS1 ;
=SS< =
HttpStatusCodeSS> L
.SSL M

BadRequestSSM W
,SSW X
DescriptionSSY d
=SSe f
$str	SSg å
}
SSç é
;
SSé è
}TT 
ModifyProductDTOVV  

productDTOVV! +
=VV, -
_mapperVV. 5
.VV5 6
MapVV6 9
<VV9 :
ModifyProductDTOVV: J
>VVJ K
(VVK L
productVVL S
)VVS T
;VVT U

DbResponseWW 
updateProductWW (
=WW) *
_mysqlRepositoryWW+ ;
.WW; <
UpdateProductWW< I
(WWI J

productDTOWWJ T
)WWT U
;WWU V
ifXX 
(XX 
updateProductXX !
.XX! "
SuccessXX" )
)XX) *
{YY 
returnZZ 
newZZ 
GeneralResponseZZ .
{ZZ/ 0

StatusCodeZZ1 ;
=ZZ< =
HttpStatusCodeZZ> L
.ZZL M
OKZZM O
,ZZO P
DescriptionZZQ \
=ZZ] ^
$strZZ_ ~
}	ZZ Ä
;
ZZÄ Å
}[[ 
else\\ 
{]] 
return^^ 
new^^ 
GeneralResponse^^ .
{^^/ 0

StatusCode^^1 ;
=^^< =
HttpStatusCode^^> L
.^^L M

BadRequest^^M W
,^^W X
Description^^Y d
=^^e f
$str	^^g Ñ
}
^^Ö Ü
;
^^Ü á
}__ 
}`` 
catchaa 
(aa 
	Exceptionaa 
exaa 
)aa  
{bb 
returncc 
newcc 
GeneralResponsecc *
{cc+ ,

StatusCodecc- 7
=cc8 9
HttpStatusCodecc: H
.ccH I

BadRequestccI S
,ccS T
DescriptionccU `
=cca b
exccc e
.cce f
Messageccf m
}ccn o
;cco p
}dd 
}ee 	
publicgg 
GeneralResponsegg 
ActivateProductgg .
(gg. /
intgg/ 2
idgg3 5
,gg5 6
intgg7 :
ownerIdgg; B
)ggB C
{hh 	
tryii 
{jj 

ProductDTOkk 

getProductkk %
=kk& '
_mysqlRepositorykk( 8
.kk8 9
GetProductByIdkk9 G
(kkG H
idkkH J
)kkJ K
;kkK L
RestaurantDTOll 
getRestaurantll +
=ll, -
_mysqlRepositoryll. >
.ll> ?"
GetRestaurantByOwnerIdll? U
(llU V
ownerIdllV ]
)ll] ^
;ll^ _
ifnn 
(nn 

getProductnn 
!=nn !
nullnn" &
&&nn' )
getRestaurantnn* 7
!=nn8 :
nullnn; ?
)nn? @
{oo 
ifpp 
(pp 

getProductpp "
.pp" #
id_restaurantepp# 1
!=pp2 4
getRestaurantpp5 B
.ppB C
IdppC E
)ppE F
{qq 
returnrr 
newrr "
GeneralResponserr# 2
{rr3 4

StatusCoderr5 ?
=rr@ A
HttpStatusCoderrB P
.rrP Q

BadRequestrrQ [
,rr[ \
Descriptionrr] h
=rri j
$str	rrk ï
}
rrñ ó
;
rró ò
}ss 
}tt 
elseuu 
{vv 
returnww 
newww 
GeneralResponseww .
{ww/ 0

StatusCodeww1 ;
=ww< =
HttpStatusCodeww> L
.wwL M

BadRequestwwM W
,wwW X
DescriptionwwY d
=wwe f
$str	wwg å
}
wwç é
;
wwé è
}xx 

DbResponsezz 
activateProductzz *
=zz+ ,
_mysqlRepositoryzz- =
.zz= >
ActivateProductzz> M
(zzM N
idzzN P
)zzP Q
;zzQ R
if{{ 
({{ 
activateProduct{{ #
.{{# $
Success{{$ +
){{+ ,
{|| 
return}} 
new}} 
GeneralResponse}} .
{}}/ 0

StatusCode}}1 ;
=}}< =
HttpStatusCode}}> L
.}}L M
OK}}M O
,}}O P
Description}}Q \
=}}] ^
activateProduct}}_ n
.}}n o
Message}}o v
}}}w x
;}}x y
}~~ 
else 
{
ÄÄ 
return
ÅÅ 
new
ÅÅ 
GeneralResponse
ÅÅ .
{
ÅÅ/ 0

StatusCode
ÅÅ1 ;
=
ÅÅ< =
HttpStatusCode
ÅÅ> L
.
ÅÅL M

BadRequest
ÅÅM W
,
ÅÅW X
Description
ÅÅY d
=
ÅÅe f
$strÅÅg ä
}ÅÅã å
;ÅÅå ç
}
ÇÇ 
}
ÉÉ 
catch
ÑÑ 
(
ÑÑ 
	Exception
ÑÑ 
ex
ÑÑ 
)
ÑÑ  
{
ÖÖ 
return
ÜÜ 
new
ÜÜ 
GeneralResponse
ÜÜ *
{
ÜÜ+ ,

StatusCode
ÜÜ- 7
=
ÜÜ8 9
HttpStatusCode
ÜÜ: H
.
ÜÜH I

BadRequest
ÜÜI S
,
ÜÜS T
Description
ÜÜU `
=
ÜÜa b
ex
ÜÜc e
.
ÜÜe f
Message
ÜÜf m
}
ÜÜn o
;
ÜÜo p
}
áá 
}
àà 	
public
ää 
List
ää 
<
ää 
object
ää 
>
ää 
GetRestaurants
ää *
(
ää* +
int
ää+ .

pageNumber
ää/ 9
,
ää9 :
int
ää; >
pageSize
ää? G
)
ääG H
{
ãã 	
try
åå 
{
çç 
List
éé 
<
éé 

Restaurant
éé 
>
éé  
restaurants
éé! ,
=
éé- .
_mapper
éé/ 6
.
éé6 7
Map
éé7 :
<
éé: ;
List
éé; ?
<
éé? @

Restaurant
éé@ J
>
ééJ K
>
ééK L
(
ééL M
_mysqlRepository
ééM ]
.
éé] ^
GetRestaurants
éé^ l
(
éél m

pageNumber
éém w
,
ééw x
pageSizeééy Å
)ééÅ Ç
)ééÇ É
;ééÉ Ñ
var
èè 
result
èè 
=
èè 
new
èè  
List
èè! %
<
èè% &
object
èè& ,
>
èè, -
(
èè- .
)
èè. /
;
èè/ 0
foreach
êê 
(
êê 

Restaurant
êê "

restaurant
êê# -
in
êê. 0
restaurants
êê1 <
)
êê< =
{
ëë 
result
íí 
.
íí 
Add
íí 
(
íí 
new
íí "
{
íí# $
Nombre
íí$ *
=
íí+ ,

restaurant
íí- 7
.
íí7 8
Nombre
íí8 >
,
íí> ?
UrlLogo
íí@ G
=
ííG H

restaurant
ííH R
.
ííR S
UrlLogo
ííS Z
}
ííZ [
)
íí[ \
;
íí\ ]
}
ìì 
return
îî 
result
îî 
;
îî 
}
ïï 
catch
ññ 
{
óó 
return
òò 
null
òò 
;
òò 
}
ôô 
}
öö 	
public
úú 
List
úú 
<
úú 
Product
úú 
>
úú %
GetProductsByRestaurant
úú 4
(
úú4 5
int
úú5 8
restaurantId
úú9 E
,
úúE F
int
úúG J

pageNumber
úúK U
,
úúU V
int
úúW Z
pageSize
úú[ c
)
úúc d
{
ùù 	
try
ûû 
{
üü 
List
†† 
<
†† 
Product
†† 
>
†† 
products
†† &
=
††' (
_mapper
††) 0
.
††0 1
Map
††1 4
<
††4 5
List
††5 9
<
††9 :
Product
††: A
>
††A B
>
††B C
(
††C D
_mysqlRepository
††D T
.
††T U%
GetProductsByRestaurant
††U l
(
††l m
restaurantId
††m y
,
††y z

pageNumber††{ Ö
,††Ö Ü
pageSize††á è
)††è ê
)††ê ë
;††ë í
return
°° 
products
°° 
;
°°  
}
¢¢ 
catch
££ 
{
§§ 
return
•• 
null
•• 
;
•• 
}
¶¶ 
}
ßß 	
public
©© 
GeneralResponse
©© 
CreateOrder
©© *
(
©©* +
Order
©©+ 0
order
©©1 6
)
©©6 7
{
™™ 	
try
´´ 
{
¨¨ 
OrderDTO
≠≠ 
orderDTO
≠≠ !
=
≠≠" #
_mapper
≠≠$ +
.
≠≠+ ,
Map
≠≠, /
<
≠≠/ 0
OrderDTO
≠≠0 8
>
≠≠8 9
(
≠≠9 :
order
≠≠: ?
)
≠≠? @
;
≠≠@ A
orderDTO
ÆÆ 
.
ÆÆ 
Fecha
ÆÆ 
=
ÆÆ  
order
ÆÆ! &
.
ÆÆ& '
Fecha
ÆÆ' ,
.
ÆÆ, -
ToString
ÆÆ- 5
(
ÆÆ5 6
$str
ÆÆ6 B
)
ÆÆB C
;
ÆÆC D

DbResponse
ØØ 
createOrder
ØØ &
=
ØØ' (
_mysqlRepository
ØØ) 9
.
ØØ9 :
CreateOrder
ØØ: E
(
ØØE F
orderDTO
ØØF N
)
ØØN O
;
ØØO P
if
∞∞ 
(
∞∞ 
createOrder
∞∞ 
.
∞∞  
Success
∞∞  '
)
∞∞' (
{
±± 
return
≤≤ 
new
≤≤ 
GeneralResponse
≤≤ .
{
≤≤/ 0

StatusCode
≤≤1 ;
=
≤≤< =
HttpStatusCode
≤≤> L
.
≤≤L M
OK
≤≤M O
,
≤≤O P
Description
≤≤Q \
=
≤≤] ^
createOrder
≤≤_ j
.
≤≤j k
Message
≤≤k r
}
≤≤s t
;
≤≤t u
}
≥≥ 
else
¥¥ 
{
µµ 
return
∂∂ 
new
∂∂ 
GeneralResponse
∂∂ .
{
∂∂/ 0

StatusCode
∂∂1 ;
=
∂∂< =
HttpStatusCode
∂∂> L
.
∂∂L M

BadRequest
∂∂M W
,
∂∂W X
Description
∂∂Y d
=
∂∂e f
createOrder
∂∂g r
.
∂∂r s
Message
∂∂s z
}
∂∂{ |
;
∂∂| }
}
∑∑ 
}
∏∏ 
catch
ππ 
(
ππ 
	Exception
ππ 
ex
ππ 
)
ππ  
{
∫∫ 
return
ªª 
new
ªª 
GeneralResponse
ªª *
{
ªª+ ,

StatusCode
ªª- 7
=
ªª7 8
HttpStatusCode
ªª8 F
.
ªªF G

BadRequest
ªªG Q
,
ªªQ R
Description
ªªS ^
=
ªª^ _
ex
ªª_ a
.
ªªa b
Message
ªªb i
}
ªªj k
;
ªªk l
}
ºº 
}
ΩΩ 	
public
øø 
GeneralResponse
øø 
AddOrderProduct
øø .
(
øø. /
OrderProduct
øø/ ;
orderProduct
øø< H
)
øøH I
{
¿¿ 	
try
¡¡ 
{
¬¬ 
OrderProductDTO
√√ 
order
√√  %
=
√√& '
_mapper
√√( /
.
√√/ 0
Map
√√0 3
<
√√3 4
OrderProductDTO
√√4 C
>
√√C D
(
√√D E
orderProduct
√√E Q
)
√√Q R
;
√√R S

DbResponse
ƒƒ 
addProductOrder
ƒƒ *
=
ƒƒ+ ,
_mysqlRepository
ƒƒ- =
.
ƒƒ= >
AddOrderProduct
ƒƒ> M
(
ƒƒM N
order
ƒƒN S
)
ƒƒS T
;
ƒƒT U
if
≈≈ 
(
≈≈ 
addProductOrder
≈≈ #
.
≈≈# $
Success
≈≈$ +
)
≈≈+ ,
{
∆∆ 
return
«« 
new
«« 
GeneralResponse
«« .
{
««/ 0

StatusCode
««1 ;
=
««< =
HttpStatusCode
««> L
.
««L M
OK
««M O
,
««O P
Description
««Q \
=
««] ^
addProductOrder
««_ n
.
««n o
Message
««o v
}
««w x
;
««x y
}
»» 
else
…… 
{
   
return
ÀÀ 
new
ÀÀ 
GeneralResponse
ÀÀ .
{
ÀÀ/ 0

StatusCode
ÀÀ1 ;
=
ÀÀ< =
HttpStatusCode
ÀÀ> L
.
ÀÀL M

BadRequest
ÀÀM W
,
ÀÀW X
Description
ÀÀY d
=
ÀÀe f
addProductOrder
ÀÀg v
.
ÀÀv w
Message
ÀÀw ~
}ÀÀ Ä
;ÀÀÄ Å
}
ÃÃ 
}
ÕÕ 
catch
ŒŒ 
(
ŒŒ 
	Exception
ŒŒ 
ex
ŒŒ 
)
ŒŒ 
{
œœ 
return
–– 
new
–– 
GeneralResponse
–– *
{
––+ ,

StatusCode
––- 7
=
––8 9
HttpStatusCode
––: H
.
––H I

BadRequest
––I S
,
––S T
Description
––U `
=
––a b
ex
––c e
.
––e f
Message
––f m
}
––n o
;
––o p
}
—— 
}
““ 	
public
‘‘ 
List
‘‘ 
<
‘‘ 
Order
‘‘ 
>
‘‘ !
GetOrdersWithFilter
‘‘ .
(
‘‘. /
int
‘‘/ 2
id
‘‘3 5
,
‘‘5 6
string
‘‘7 =
filter
‘‘> D
,
‘‘D E
int
‘‘F I

pageNumber
‘‘J T
,
‘‘T U
int
‘‘V Y
pageSize
‘‘Z b
)
‘‘b c
{
’’ 	
try
÷÷ 
{
◊◊ 
List
ÿÿ 
<
ÿÿ 
Order
ÿÿ 
>
ÿÿ 
orders
ÿÿ "
=
ÿÿ# $
_mapper
ÿÿ% ,
.
ÿÿ, -
Map
ÿÿ- 0
<
ÿÿ0 1
List
ÿÿ1 5
<
ÿÿ5 6
Order
ÿÿ6 ;
>
ÿÿ; <
>
ÿÿ< =
(
ÿÿ= >
_mysqlRepository
ÿÿ> N
.
ÿÿN O!
GetOrdersWithFilter
ÿÿO b
(
ÿÿb c
id
ÿÿc e
,
ÿÿe f
filter
ÿÿg m
,
ÿÿm n

pageNumber
ÿÿo y
,
ÿÿy z
pageSizeÿÿ{ É
)ÿÿÉ Ñ
)ÿÿÑ Ö
;ÿÿÖ Ü
return
ŸŸ 
orders
ŸŸ 
;
ŸŸ 
}
⁄⁄ 
catch
€€ 
{
‹‹ 
return
›› 
null
›› 
;
›› 
}
ﬁﬁ 
}
ﬂﬂ 	
}
‡‡ 
}·· 