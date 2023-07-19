
# Para implementar esto con digitos se puediar hacer otro par de expresiones como se hizo para la resta y división
# pero ahora en el [if token == "("] se puede validar si es un dato de tipo digito
# Solo se tiene que tomar en cuenta que el digito puede ser mas grande que un token singular,
# asi que se pueden revisar consecutivamente cuantos datos de tipo digitos hay
# Si es que hay algun decimal también se pudiera saber si es tipo float.

#	Codigo para la gramatica de expresiones vista en clase
#	en version no-ambigua 

#	F –> ( E ) | id		
#	E -> R E'
#	E' -> + R E' | epsilon
#	R -> G R'
#	R' -> - G R' | epsilon
#	G -> T G'
#	G' -> / T G' | epsilon
#	T –> F T' 				
#	T' –> * F T' | epsilon


def sigToken():
	global i
	i = i + 1
	print("current token es ", linea[i])
	return linea[i]

def showError(expected, token):
	print("ERROR: esperaba ", expected, ", recibio ", token)

#	Factores: simbolo no-terminal F
#	F –> ( E ) | id			
def es_F():
	global token
	global last
	last = "( or id"

	if token == "(":							#	veremos si es (E)
		print("\t( ok")
		token = sigToken()						
		
		es_E() 									#  veremos si es E
		
		last = ")"									
		if token == ")":							
			print("\t) ok")
			token = sigToken()
			
		else:
			showError("\t)", token)
		
	elif token == "id":
		print("\tid ok")
		token = sigToken()
	else:
		showError("(E) or id", token)
		

#	Expresiones: simbolo no-terminal E
#	E -> T E'
def es_E():
	global token
	es_R()
	es_Eprime()

#	E' -> + T E' | epsilon
def es_Eprime():
	global token
	global last
	last = "operador"
	if token == "+":
		print("\t+ ok" )
		token = sigToken()		
		
		es_R()
		es_Eprime()
	# si no es +, no habra mas recursion

#	Expresiones: simbolo no-terminal R
#	R -> G R'
#	R' -> - G R' | epsilon
def es_R():
	global token
	es_G()
	es_Rprime()

def es_Rprime():
	global token
	global last
	last = "operador"
	if token == "-":
		print("\t- ok" )
		token = sigToken()		
		
		es_G()
		es_Rprime()
	# si no es -, no habra mas recursion
	
#	Expresiones: simbolo no-terminal G
#	G -> T G'
#	G' -> / T G' | epsilon
def es_G():
	global token
	es_T()
	es_Gprime()

def es_Gprime():
	global token
	global last
	last = "operador"
	if token == "/":
		print("\t/ ok" )
		token = sigToken()		
		
		es_T()
		es_Gprime()
	# si no es /, no habra mas recursion

#	Terminos: simbolo no-terminal T
# T –> F T' 				
# T' –> * F T' | epsilon	
def es_T(): 
	global token
	es_F()
	es_Tprime()
			

def es_Tprime():
	global token
	global last
	last = "operador"
	if token == "*":
		print ("\t* ok")
		token = sigToken()
		
		es_F()
		es_Tprime()
	#	si no es *, no habra mas recursion


#	cada linea tiene un vacio al final, para evitar desbordar
lineas = [	["id", "+", "(", "id", "*", "id", ")", ""] ,
 			["id", "+", "id", ""] , 
 			["id", "*", "id", ""],
 			["(","id",")", "+", "(", "id", "*", "id",")", "" ],
 			["id", "-", "id", "*", "id", ""],
 			["id", "/", "id", "*", "id", ""],
			["id", "/", "id", "+", "id", ""],
 			["id", "*", "id", "id", ""],			
 			["id", "id", ""],						
 			["(", "id", ")", "+", "(", "id", ")", ""],
			["(", "(", "id", ")", ")", "+", "(", "id", ")", ""],
			["(", "id", ")", ")", "+", "(", "id", ")", ""],
			["(", "(", "id", ")", "+", "(", "id", ")", ""]

 		]

lex = ["+", "-", "/", "*", "(", ")", "id", ""]	# estos son los simbolos terminales, i.e., lexemas validos

for linea in lineas: 
	print("\n",linea)

	i = -1
	token = sigToken()
	
	es_E()					#	Revisa si la linea es una expresion valida

	if token == "":			#	si consumio toda la linea, esta bien
		print("OKS\n")
	else:
		showError(last, token)
		print("NOPE\n")



