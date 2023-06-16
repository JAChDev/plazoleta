—"
ãC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\PlazoletaService\Authorization\JwtAuthorizationFilter.cs
	namespace 	
PlazoletaService
 
. 
WebApi !
.! "
Authorization" /
{ 
public		 

class		 "
JwtAuthorizationFilter		 '
:		' ( 
IAuthorizationFilter		( <
{

 
private 
readonly 
string 
_role  %
;% &
public "
JwtAuthorizationFilter %
(% &
string& ,
role- 1
)1 2
{ 	
_role 
= 
role 
; 
} 	
public 
void 
OnAuthorization #
(# $&
AuthorizationFilterContext$ >
context? F
)F G
{ 	
var 
authService 
= 
context %
.% &
HttpContext& 1
.1 2
RequestServices2 A
.A B
GetRequiredServiceB T
<T U
IAuthServiceU a
>a b
(b c
)c d
;d e
var 
token 
= 
context 
.  
HttpContext  +
.+ ,
Request, 3
.3 4
Headers4 ;
[; <
$str< K
]K L
.L M
FirstOrDefaultM [
([ \
)\ ]
?] ^
.^ _
Split_ d
(d e
$stre h
)h i
.i j
Lastj n
(n o
)o p
;p q
if 
( 
! 
string 
. 
IsNullOrEmpty %
(% &
token& +
)+ ,
), -
{ 
try 
{ 
var 
tokenHandler $
=% &
new' *#
JwtSecurityTokenHandler+ B
(B C
)C D
;D E
var %
tokenValidationParameters 1
=2 3
authService4 ?
.? @(
GetTokenValidationParameters@ \
(\ ]
)] ^
;^ _
ClaimsPrincipal #
	principal$ -
=. /
tokenHandler0 <
.< =
ValidateToken= J
(J K
tokenK P
,P Q%
tokenValidationParametersR k
,k l
outm p
_q r
)r s
;s t
context!! 
.!! 
HttpContext!! '
.!!' (
User!!( ,
=!!- .
	principal!!/ 8
;!!8 9
var$$ 
roles$$ 
=$$ 
	principal$$  )
.$$) *
FindAll$$* 1
($$1 2

ClaimTypes$$2 <
.$$< =
Role$$= A
)$$A B
.$$B C
Select$$C I
($$I J
c$$J K
=>$$L N
c$$O P
.$$P Q
Value$$Q V
)$$V W
.$$W X
ToList$$X ^
($$^ _
)$$_ `
;$$` a
foreach&& 
(&& 
var&&  
role&&! %
in&&& (
roles&&) .
)&&. /
{'' 
if(( 
((( 
_role((  
!=((! #
null(($ (
)((( )
{)) 
if** 
(**  
role**  $
==**% '
_role**( -
)**- .
{**/ 0
return**1 7
;**7 8
}**9 :
else++  
{++! "
context++# *
.++* +
Result+++ 1
=++2 3
new++4 7
ForbidResult++8 D
(++D E
)++E F
;++F G
}++H I
},, 
else-- 
{.. 
return// "
;//" #
}00 
}22 
}33 
catch44 
(44 
	Exception44  
)44  !
{55 
context66 
.66 
Result66 "
=66# $
new66% (
UnauthorizedResult66) ;
(66; <
)66< =
;66= >
}77 
}88 
else99 
{:: 
context;; 
.;; 
Result;; 
=;;  
new;;! $
UnauthorizedResult;;% 7
(;;7 8
);;8 9
;;;9 :
}<< 
}== 	
}>> 
}?? Æó
ÜC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\PlazoletaService\Controllers\PlazoletaController.cs
	namespace 	
PlazoletaService
 
. 
WebApi !
.! "
Controllers" -
{ 
[ 
ApiController 
] 
[ 
Route 

(
 
$str 
) 
] 
public 

class 
PlazoletaController $
:$ %
ControllerBase% 3
{ 
private 
readonly 
IRestaurantService +
_restaurantService, >
;> ?
public 
PlazoletaController "
(" #
IRestaurantService# 5
restaurantService6 G
)G H
{ 	
_restaurantService 
=  
restaurantService! 2
;2 3
} 	
[ 	

TypeFilter	 
( 
typeof 
( "
JwtAuthorizationFilter 1
)1 2
,2 3
	Arguments4 =
=> ?
new@ C
objectD J
[J K
]K L
{M N
$strO R
}S T
)T U
]U V
[ 	
HttpPost	 
( 
$str %
)% &
]& '
public 
IActionResult 
CreateRestaurant -
(- .
RestaurantModel. =
restaurantModel> M
)M N
{ 	

Restaurant 

restaurant !
=" #
new$ '

Restaurant( 2
(2 3
)3 4
;4 5

restaurant 
. 
Nombre 
= 
restaurantModel  /
./ 0
Nombre0 6
;6 7

restaurant 
. 
	Direccion  
=! "
restaurantModel# 2
.2 3
	Direccion3 <
;< =

restaurant 
. 
id_propietario %
=& '
restaurantModel( 7
.7 8
id_propietario8 F
;F G

restaurant   
.   
Telefono   
=    !
restaurantModel  " 1
.  1 2
Telefono  2 :
;  : ;

restaurant!! 
.!! 
UrlLogo!! 
=!!  
restaurantModel!!! 0
.!!0 1
UrlLogo!!1 8
;!!8 9

restaurant"" 
."" 
Nit"" 
="" 
restaurantModel"" ,
."", -
Nit""- 0
;""0 1
GeneralResponse## 
response## $
=##% &
_restaurantService##' 9
.##9 :
CreateRestaurant##: J
(##J K

restaurant##K U
)##U V
;##V W
return%% 
response%% 
.%% 

StatusCode%% &
==%%' )
HttpStatusCode%%* 8
.%%8 9
OK%%9 ;
?%%< =
Ok%%> @
(%%@ A
response%%A I
)%%I J
:%%K L

BadRequest%%M W
(%%W X
response%%X `
)%%` a
;%%a b
}&& 	
[(( 	

TypeFilter((	 
((( 
typeof(( 
((( "
JwtAuthorizationFilter(( 1
)((1 2
,((2 3
	Arguments((4 =
=((> ?
new((@ C
object((D J
[((J K
]((K L
{((M N
$str((O R
}((S T
)((T U
]((U V
[)) 	
HttpPost))	 
()) 
$str)) &
)))& '
]))' (
public** 
IActionResult** 
CreateProduct** *
(*** +
ProductModel**+ 7
productModel**8 D
)**D E
{++ 	
Product,, 
product,, 
=,, 
new,, !
Product,," )
(,,) *
),,* +
;,,+ ,
product-- 
.-- 
Nombre-- 
=-- 
productModel-- )
.--) *
Nombre--* 0
;--0 1
product.. 
... 
id_categoria..  
=..! "
productModel..# /
.../ 0
id_categoria..0 <
;..< =
product// 
.// 
Descripcion// 
=//  !
productModel//" .
.//. /
Descripcion/// :
;//: ;
product00 
.00 
Precio00 
=00 
productModel00 )
.00) *
Precio00* 0
;000 1
product11 
.11 
id_restaurante11 "
=11# $
productModel11% 1
.111 2
id_restaurante112 @
;11@ A
product22 
.22 

url_imagen22 
=22  
productModel22! -
.22- .

url_imagen22. 8
;228 9
product33 
.33 
Activo33 
=33 
productModel33 )
.33) *
Activo33* 0
;330 1
GeneralResponse44 
response44 $
=44% &
_restaurantService44' 9
.449 :
CreateProduct44: G
(44G H
product44H O
)44O P
;44P Q
return66 
response66 
.66 

StatusCode66 &
==66' )
HttpStatusCode66* 8
.668 9
OK669 ;
?66< =
Ok66> @
(66@ A
response66A I
)66I J
:66K L

BadRequest66M W
(66W X
response66X `
)66` a
;66a b
}77 	
[99 	

TypeFilter99	 
(99 
typeof99 
(99 "
JwtAuthorizationFilter99 1
)991 2
,992 3
	Arguments994 =
=99> ?
new99@ C
object99D J
[99J K
]99K L
{99M N
$str99O R
}99S T
)99T U
]99U V
[:: 	
HttpPut::	 
(:: 
$str:: ,
)::, -
]::- .
public;; 
IActionResult;; 
UpdateProduct;; *
(;;* +
ModifyProductModel;;+ =
productModel;;> J
);;J K
{<< 	
var== 
idClaim== 
=== 
HttpContext== %
.==% &
User==& *
.==* +
FindAll==+ 2
(==2 3

ClaimTypes==3 =
.=== >
Name==> B
)==B C
.==C D
Select==D J
(==J K
c==K L
=>==M O
c==P Q
.==Q R
Value==R W
)==W X
.==X Y
ToList==Y _
(==_ `
)==` a
;==a b
ModifyProduct?? 
product?? !
=??" #
new??$ '
ModifyProduct??( 5
(??5 6
)??6 7
;??7 8
product@@ 
.@@ 
Id@@ 
=@@ 
productModel@@ %
.@@% &
Id@@& (
;@@( )
productAA 
.AA 
NombreAA 
=AA 
productModelAA )
.AA) *
NombreAA* 0
;AA0 1
productBB 
.BB 
DescripcionBB 
=BB  !
productModelBB" .
.BB. /
DescripcionBB/ :
;BB: ;
GeneralResponseCC 
responseCC $
=CC% &
_restaurantServiceCC' 9
.CC9 :
UpdateProductCC: G
(CCG H
productCCH O
,CCO P
ConvertCCQ X
.CCX Y
ToInt32CCY `
(CC` a
idClaimCCa h
[CCh i
$numCCi j
]CCj k
)CCk l
)CCl m
;CCm n
returnEE 
responseEE 
.EE 

StatusCodeEE &
==EE' )
HttpStatusCodeEE* 8
.EE8 9
OKEE9 ;
?EE< =
OkEE> @
(EE@ A
responseEEA I
)EEI J
:EEK L

BadRequestEEM W
(EEW X
responseEEX `
)EE` a
;EEa b
}FF 	
[HH 	

TypeFilterHH	 
(HH 
typeofHH 
(HH "
JwtAuthorizationFilterHH 1
)HH1 2
,HH2 3
	ArgumentsHH4 =
=HH> ?
newHH@ C
objectHHD J
[HHJ K
]HHK L
{HHM N
$strHHO R
}HHS T
)HHT U
]HHU V
[II 	
HttpGetII	 
(II 
$strII 5
)II5 6
]II6 7
publicJJ 
IActionResultJJ 
ProductStatusJJ *
(JJ* +
stringJJ+ 1
idJJ2 4
)JJ4 5
{KK 	
varLL 
idClaimLL 
=LL 
HttpContextLL %
.LL% &
UserLL& *
.LL* +
FindAllLL+ 2
(LL2 3

ClaimTypesLL3 =
.LL= >
NameLL> B
)LLB C
.LLC D
SelectLLD J
(LLJ K
cLLK L
=>LLM O
cLLP Q
.LLQ R
ValueLLR W
)LLW X
.LLX Y
ToListLLY _
(LL_ `
)LL` a
;LLa b
GeneralResponseNN 
responseNN $
=NN% &
_restaurantServiceNN' 9
.NN9 :
ActivateProductNN: I
(NNI J
ConvertNNJ Q
.NNQ R
ToInt32NNR Y
(NNY Z
idNNZ \
)NN\ ]
,NN] ^
ConvertNN_ f
.NNf g
ToInt32NNg n
(NNn o
idClaimNNo v
[NNv w
$numNNw x
]NNx y
)NNy z
)NNz {
;NN{ |
returnPP 
responsePP 
.PP 

StatusCodePP &
==PP' )
HttpStatusCodePP* 8
.PP8 9
OKPP9 ;
?PP< =
OkPP> @
(PP@ A
responsePPA I
)PPI J
:PPK L

BadRequestPPM W
(PPW X
responsePPX `
)PP` a
;PPa b
}QQ 	
[SS 	

TypeFilterSS	 
(SS 
typeofSS 
(SS "
JwtAuthorizationFilterSS 1
)SS1 2
,SS2 3
	ArgumentsSS4 =
=SS> ?
newSS@ C
objectSSD J
[SSJ K
]SSK L
{SSM N
$strSSO R
}SSS T
)SST U
]SSU V
[TT 	
HttpGetTT	 
(TT 
$strTT %
)TT% &
]TT& '
publicUU 
IActionResultUU 
GetRestaurantsUU +
(UU+ ,
intUU, /

pageNumberUU0 :
,UU: ;
intUU< ?
pageSizeUU@ H
)UUH I
{VV 	
varWW 
responseWW 
=WW 
_restaurantServiceWW -
.WW- .
GetRestaurantsWW. <
(WW< =

pageNumberWW= G
,WWG H
pageSizeWWI Q
)WWQ R
;WWR S
ifXX 
(XX 
responseXX 
!=XX 
nullXX  
)XX  !
{YY 
returnZZ 
OkZZ 
(ZZ 
responseZZ "
)ZZ" #
;ZZ# $
}[[ 
else\\ 
{]] 
return^^ 

BadRequest^^ !
(^^! "
new^^" %
GeneralResponse^^& 5
{^^6 7

StatusCode^^8 B
=^^C D
HttpStatusCode^^E S
.^^S T

BadRequest^^T ^
,^^^ _
Description^^` k
=^^l m
$str	^^n ë
}
^^í ì
)
^^ì î
;
^^î ï
}__ 
}`` 	
[aa 	

TypeFilteraa	 
(aa 
typeofaa 
(aa "
JwtAuthorizationFilteraa 1
)aa1 2
,aa2 3
	Argumentsaa4 =
=aa> ?
newaa@ C
objectaaD J
[aaJ K
]aaK L
{aaM N
$straaO R
}aaS T
)aaT U
]aaU V
[bb 	
HttpGetbb	 
(bb 
$strbb )
)bb) *
]bb* +
publiccc 
IActionResultcc #
GetProductsByRestaurantcc 4
(cc4 5
intcc5 8
idRescc9 >
,cc> ?
intcc@ C

pageNumberccD N
,ccN O
intccP S
pageSizeccT \
)cc\ ]
{dd 	
varee 
responseee 
=ee 
_restaurantServiceee -
.ee- .#
GetProductsByRestaurantee. E
(eeE F
idReseeF K
,eeK L

pageNumbereeM W
,eeW X
pageSizeeeY a
)eea b
;eeb c
ifff 
(ff 
responseff 
!=ff 
nullff  
)ff  !
{gg 
returnhh 
Okhh 
(hh 
responsehh "
)hh" #
;hh# $
}ii 
elsejj 
{kk 
returnll 

BadRequestll !
(ll! "
newll" %
GeneralResponsell& 5
{ll6 7

StatusCodell8 B
=llC D
HttpStatusCodellE S
.llS T

BadRequestllT ^
,ll^ _
Descriptionll` k
=lll m
$str	lln ë
}
llí ì
)
llì î
;
llî ï
}mm 
}nn 	
[pp 	

TypeFilterpp	 
(pp 
typeofpp 
(pp "
JwtAuthorizationFilterpp 1
)pp1 2
,pp2 3
	Argumentspp4 =
=pp> ?
newpp@ C
objectppD J
[ppJ K
]ppK L
{ppM N
$strppO R
}ppS T
)ppT U
]ppU V
[qq 	
HttpPostqq	 
(qq 
$strqq +
)qq+ ,
]qq, -
publicrr 
IActionResultrr 
CreateOrderrr (
(rr( )

OrderModelrr) 3

orderModelrr4 >
)rr> ?
{ss 	
Ordertt 
ordertt 
=tt 
newtt 
Ordertt #
(tt# $
)tt$ %
;tt% &
orderuu 
.uu 

Id_Clienteuu 
=uu 

orderModeluu )
.uu) *

Id_Clienteuu* 4
;uu4 5
ordervv 
.vv 
Fechavv 
=vv 

orderModelvv $
.vv$ %
Fechavv% *
;vv* +
orderww 
.ww 
Estadoww 
=ww 

orderModelww %
.ww% &
Estadoww& ,
;ww, -
orderxx 
.xx 
Id_Chefxx 
=xx 

orderModelxx &
.xx& '
Id_Chefxx' .
;xx. /
orderyy 
.yy 
id_Restauranteyy  
=yy! "

orderModelyy# -
.yy- .
id_Restauranteyy. <
;yy< =
GeneralResponse{{ 
response{{ $
={{% &
_restaurantService{{' 9
.{{9 :
CreateOrder{{: E
({{E F
order{{F K
){{K L
;{{L M
return|| 
response|| 
.|| 

StatusCode|| &
==||' )
HttpStatusCode||* 8
.||8 9
OK||9 ;
?||< =
Ok||> @
(||@ A
response||A I
)||I J
:||K L

BadRequest||M W
(||W X
response||X `
)||` a
;||a b
}~~ 	
[
ÄÄ 	

TypeFilter
ÄÄ	 
(
ÄÄ 
typeof
ÄÄ 
(
ÄÄ $
JwtAuthorizationFilter
ÄÄ 1
)
ÄÄ1 2
,
ÄÄ2 3
	Arguments
ÄÄ4 =
=
ÄÄ> ?
new
ÄÄ@ C
object
ÄÄD J
[
ÄÄJ K
]
ÄÄK L
{
ÄÄM N
$str
ÄÄO R
}
ÄÄS T
)
ÄÄT U
]
ÄÄU V
[
ÅÅ 	
HttpPost
ÅÅ	 
(
ÅÅ 
$str
ÅÅ (
)
ÅÅ( )
]
ÅÅ) *
public
ÇÇ 
IActionResult
ÇÇ 
AddProductOrder
ÇÇ ,
(
ÇÇ, -
OrderProductModel
ÇÇ- >

orderModel
ÇÇ? I
)
ÇÇI J
{
ÉÉ 	
OrderProduct
ÑÑ 
order
ÑÑ 
=
ÑÑ  
new
ÑÑ! $
OrderProduct
ÑÑ% 1
(
ÑÑ1 2
)
ÑÑ2 3
;
ÑÑ3 4
order
ÖÖ 
.
ÖÖ 
id_Plato
ÖÖ 
=
ÖÖ 

orderModel
ÖÖ '
.
ÖÖ' (
id_Plato
ÖÖ( 0
;
ÖÖ0 1
order
ÜÜ 
.
ÜÜ 
	id_Pedido
ÜÜ 
=
ÜÜ 

orderModel
ÜÜ (
.
ÜÜ( )
	id_Pedido
ÜÜ) 2
;
ÜÜ2 3
order
áá 
.
áá 
Cantidad
áá 
=
áá 

orderModel
áá '
.
áá' (
Cantidad
áá( 0
;
áá0 1
GeneralResponse
ââ 
response
ââ $
=
ââ% & 
_restaurantService
ââ' 9
.
ââ9 :
AddOrderProduct
ââ: I
(
ââI J
order
ââJ O
)
ââO P
;
ââP Q
return
ää 
response
ää 
.
ää 

StatusCode
ää &
==
ää' )
HttpStatusCode
ää* 8
.
ää8 9
OK
ää9 ;
?
ää< =
Ok
ää> @
(
ää@ A
response
ääA I
)
ääI J
:
ääK L

BadRequest
ääM W
(
ääW X
response
ääX `
)
ää` a
;
ääa b
}
åå 	
[
éé 	

TypeFilter
éé	 
(
éé 
typeof
éé 
(
éé $
JwtAuthorizationFilter
éé 1
)
éé1 2
,
éé2 3
	Arguments
éé4 =
=
éé> ?
new
éé@ C
object
ééD J
[
ééJ K
]
ééK L
{
ééM N
$str
ééO R
}
ééS T
)
ééT U
]
ééU V
[
èè 	
HttpGet
èè	 
(
èè 
$str
èè '
)
èè' (
]
èè( )
public
êê 
IActionResult
êê "
GetOrderByRestaurant
êê 1
(
êê1 2
int
êê2 5
idRestaurant
êê6 B
,
êêB C
string
êêD J
Status
êêK Q
,
êêQ R
int
êêS V

pageNumber
êêW a
,
êêa b
int
êêc f
pageSize
êêg o
)
êêo p
{
ëë 	
var
íí 
response
íí 
=
íí  
_restaurantService
íí -
.
íí- .!
GetOrdersWithFilter
íí. A
(
ííA B
idRestaurant
ííB N
,
ííN O
Status
ííP V
,
ííV W

pageNumber
ííX b
,
ííb c
pageSize
ííd l
)
ííl m
;
íím n
if
ìì 
(
ìì 
response
ìì 
==
ìì 
null
ìì  
)
ìì  !
{
îî 
return
ïï 

BadRequest
ïï !
(
ïï! "
new
ïï" %
GeneralResponse
ïï& 5
{
ïï6 7

StatusCode
ïï8 B
=
ïïC D
HttpStatusCode
ïïE S
.
ïïS T

BadRequest
ïïT ^
,
ïï^ _
Description
ïï` k
=
ïïl m
$strïïn å
}ïïç é
)ïïé è
;ïïè ê
}
ññ 
else
ññ 
{
óó 
return
òò 
Ok
òò 
(
òò 
response
òò "
)
òò" #
;
òò# $
}
ôô 
}
öö 	
[
úú 	
HttpGet
úú	 
(
úú 
$str
úú 
)
úú 
]
úú 
public
ùù 
IActionResult
ùù 

HealtCheck
ùù '
(
ùù' (
)
ùù( )
{
ûû 	
return
üü 
Ok
üü 
(
üü 
)
üü 
;
üü 
}
†† 	
}
°° 
}¢¢ Å
ÄC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\PlazoletaService\Models\ModifyProductModel.cs
	namespace 	
PlazoletaService
 
. 
WebApi !
.! "
Models" (
{ 
public 

class 
ModifyProductModel #
{ 
[ 	
Required	 
] 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[		 	
Required			 
]		 
public

 
string

 
?

 
Nombre

 
{

 
get

  #
;

# $
set

% (
;

( )
}

* +
[ 	
Required	 
] 
public 
string 
? 
Descripcion "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ñ
xC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\PlazoletaService\Models\OrderModel.cs
	namespace 	
PlazoletaService
 
. 
WebApi !
.! "
Models" (
{ 
public 

class 

OrderModel 
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
[		 	
Required			 
]		 
[

 	
NotNull

	 
]

 
public 
int 

Id_Cliente 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
[ 	
NotNull	 
] 
public 
DateTime 
Fecha 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
[ 	
NotNull	 
] 
public 
string 
? 
Estado 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
[ 	
NotNull	 
] 
public 
int 
Id_Chef 
{ 
get  
;  !
set" %
;% &
}' (
[ 	
Required	 
] 
[ 	
NotNull	 
] 
public 
int 
id_Restaurante !
{" #
get$ '
;' (
set) ,
;, -
}. /
} 
} ƒ
C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\PlazoletaService\Models\OrderProductModel.cs
	namespace 	
PlazoletaService
 
. 
WebApi !
.! "
Models" (
{ 
public 

class 
OrderProductModel "
{ 
public 
int 
	id_Pedido 
{ 
get "
;" #
set$ '
;' (
}) *
public 
int 
id_Plato 
{ 
get !
;! "
set# &
;& '
}( )
public 
int 
Cantidad 
{ 
get !
;! "
set# &
;& '
}( )
} 
}		 í
zC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\PlazoletaService\Models\ProductModel.cs
	namespace 	
PlazoletaService
 
. 
WebApi !
.! "
Models" (
{ 
public 

class 
ProductModel 
{ 
[ 	
Required	 
] 
public 
string 
? 
Nombre 
{ 
get  #
;# $
set% (
;( )
}* +
[		 	
Required			 
]		 
public

 
int

 
id_categoria

 
{

  !
get

" %
;

% &
set

' *
;

* +
}

, -
[ 	
Required	 
] 
public 
string 
? 
Descripcion "
{# $
get% (
;( )
set* -
;- .
}/ 0
[ 	
Required	 
] 
[ 	
RegularExpression	 
( 
$str (
,( )
ErrorMessage* 6
=7 8
$str9 ^
)^ _
]_ `
public 
string 
? 
Precio 
{ 
get  #
;# $
set% (
;( )
}* +
[ 	
Required	 
] 
public 
int 
id_restaurante !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
public 
string 
? 

url_imagen !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
public 
bool 
Activo 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ©
}C:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\PlazoletaService\Models\RestaurantModel.cs
	namespace 	
PlazoletaService
 
. 
WebApi !
.! "
Models" (
{ 
public 

class 
RestaurantModel  
{ 
[ 	
Required	 
] 
[ 	
RegularExpression	 
( 
$str /
,/ 0
ErrorMessage1 =
=> ?
$str@ ~
)~ 
]	 Ä
public		 
string		 
?		 
Nombre		 
{		 
get		  #
;		# $
set		% (
;		( )
}		* +
[

 	
Required

	 
]

 
public 
string 
? 
	Direccion  
{! "
get# &
;& '
set( +
;+ ,
}- .
[ 	
Required	 
] 
public 
int 
id_propietario !
{" #
get$ '
;' (
set) ,
;, -
}. /
[ 	
Required	 
] 
[ 	
StringLength	 
( 
$num 
) 
] 
[ 	
RegularExpression	 
( 
$str '
,' (
ErrorMessage) 5
=6 7
$str8 v
)v w
]w x
public 
string 
? 
Telefono 
{  !
get" %
;% &
set' *
;* +
}, -
[ 	
Required	 
] 
public 
string 
? 
UrlLogo 
{  
get! $
;$ %
set& )
;) *
}+ ,
[ 	
Required	 
] 
[ 	
RegularExpression	 
( 
$str &
,& '
ErrorMessage( 4
=5 6
$str7 P
)P Q
]Q R
public 
string 
? 
Nit 
{ 
get  
;  !
set" %
;% &
}' (
} 
} ı*
nC:\Users\jonatan.amado_pragma\Documents\Repositorios\AppPlazoleta\PlazoletaService\PlazoletaService\Program.cs
var 
builder 
= 
WebApplication 
. 
CreateBuilder *
(* +
args+ /
)/ 0
;0 1
builder 
. 
Services 
. 
AddControllers 
(  
)  !
;! "
var 
configuration 
= 
builder 
. 
Services $
.$ % 
BuildServiceProvider% 9
(9 :
): ;
.; <
CreateScope< G
(G H
)H I
.I J
ServiceProviderJ Y
.Y Z
GetRequiredServiceZ l
<l m
IConfigurationm {
>{ |
(| }
)} ~
;~ 
builder 
. 
Services 
. 
AddAuthentication "
(" #
JwtBearerDefaults# 4
.4 5 
AuthenticationScheme5 I
)I J
. 
AddJwtBearer 
( 
options 
=> 
{ 
options 
. %
TokenValidationParameters )
=* +
new, /%
TokenValidationParameters0 I
{ 	$
ValidateIssuerSigningKey $
=% &
true' +
,+ ,
IssuerSigningKey 
= 
new " 
SymmetricSecurityKey# 7
(7 8
Encoding8 @
.@ A
UTF8A E
.E F
GetBytesF N
(N O
configurationO \
.\ ]

GetSection] g
(g h
$strh o
)o p
.p q
Valueq v
)v w
)w x
,x y
ValidateIssuer 
= 
true !
,! "
ValidateAudience 
= 
false $
,$ %
ValidateLifetime 
= 
false $
}   	
;  	 

}!! 
)!! 
;!! 
builder## 
.## 
Host## 
.## %
UseServiceProviderFactory## &
(##& '
new##' *)
AutofacServiceProviderFactory##+ H
(##H I
)##I J
)##J K
.$$ 
ConfigureContainer$$ 
<$$ 
ContainerBuilder$$ (
>$$( )
($$) *
builder$$* 1
=>$$2 4
{%% 
builder&& 
.&& 
RegisterModule&& 
(&& 
new&& "
DomainModule&&# /
(&&/ 0
)&&0 1
)&&1 2
;&&2 3
builder'' 
.'' 
RegisterModule'' 
('' 
new'' " 
InfrastructureModule''# 7
(''7 8
)''8 9
)''9 :
;'': ;
}(( 
)(( 
;(( 
var,, 
mapperConfig,, 
=,, 
new,, 
MapperConfiguration,, *
(,,* +
cfg,,+ .
=>,,/ 1
{-- 
cfg.. 
... 

AddProfile.. 
<.. 
MappingProfile.. !
>..! "
(.." #
)..# $
;..$ %
}// 
)// 
;// 
IMapper11 
mapper11 
=11 
mapperConfig11 
.11 
CreateMapper11 *
(11* +
)11+ ,
;11, -
builder33 
.33 
Services33 
.33 
AddDbContext33 
<33 
SQLDbContext33 *
>33* +
(33+ ,
options33, 3
=>334 6
options337 >
.33> ?
UseMySQL33? G
(33G H
configuration33H U
.33U V
GetConnectionString33V i
(33i j
$str33j }
)33} ~
)33~ 
)	33 Ä
;
33Ä Å
builder44 
.44 
Services44 
.44 
AddSingleton44 
(44 
mapper44 $
)44$ %
;44% &
builder55 
.55 
Services55 
.55 #
AddEndpointsApiExplorer55 (
(55( )
)55) *
;55* +
builder66 
.66 
Services66 
.66 
AddSwaggerGen66 
(66 
)66  
;66  !
var88 
app88 
=88 	
builder88
 
.88 
Build88 
(88 
)88 
;88 
if;; 
(;; 
app;; 
.;; 
Environment;; 
.;; 
IsDevelopment;; !
(;;! "
);;" #
);;# $
{<< 
app== 
.== 

UseSwagger== 
(== 
)== 
;== 
app>> 
.>> 
UseSwaggerUI>> 
(>> 
)>> 
;>> 
}?? 
appAA 
.AA 
UseHttpsRedirectionAA 
(AA 
)AA 
;AA 
appCC 
.CC 
UseAuthenticationCC 
(CC 
)CC 
;CC 
appEE 
.EE 
UseAuthorizationEE 
(EE 
)EE 
;EE 
appGG 
.GG 
MapControllersGG 
(GG 
)GG 
;GG 
appII 
.II 
RunII 
(II 
)II 	
;II	 
