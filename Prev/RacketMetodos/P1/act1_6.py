import regex as re
filename = "./input.txt"
f = open(filename,"r")
solution = []

comment = r"(([^\/\&]|\s)*)(\/\/[^\/\/]*)"

assignment = r"([a-zA-Z_]\w*)\s*=\s*(.+)"

Snotation = r"(\s)*(\d+(\.(\d)+){0,1}((E-|E\+)(\d)+))"

openP = r"([^\(]*)\(([^\(]*)"
closeP = r"([^\)]*)\)([^\)]*)"

multiplication = r"([^\*]*)\*([^\*]*)"
division = r"([^\/]*)\/([^\/]*)"
addition = r"([^\+]*)\+([^\+]*)"
subtraction = r"([^\-]*)\-([^\-]*)"
exponent = r"([^\^]*)\^([^\^]*)"


variables_ = r"(\s)*([a-zA-Z_]\w*)"
float_ = r"(\s)*-?(\d)+(\.)(\d)+" 
integer_ = r"(\s)*-?(\d)*"

def tonkenize(sample):
    expression = []
    print("Analyzing: " + sample)
    if (re.match(comment,sample)):
        expression = ['comment']
        expression = tonkenize(re.split(comment,sample)[1]) + expression
        return expression
    elif(re.match(Snotation,sample)):
        expression = ['real']
        return ['real']
    elif (re.match(assignment,sample)):
        expression = ['assignment']
        expression = tonkenize(re.split(assignment,sample)[1]) + expression
        expression = expression + tonkenize(re.split(assignment,sample)[2])
    elif (re.match(openP,sample)):
        expression = ['open parenthesis']
        expression = tonkenize(re.split(openP,sample)[1]) + expression
        expression = expression + tonkenize(re.split(openP,sample)[2])
    elif (re.match(closeP,sample)):
        expression = ['close parenthesis']
        expression = tonkenize(re.split(closeP,sample)[1]) + expression
        expression = expression + tonkenize(re.split(closeP,sample)[2])
    elif(re.match(exponent,sample)):
        expression = ['exponent']
        expression = tonkenize(re.split(exponent,sample)[1]) + expression
        expression = expression + tonkenize(re.split(exponent,sample)[2])
    elif(re.match(multiplication,sample)):
        expression = ['multiplication']
        expression = tonkenize(re.split(multiplication,sample)[1]) + expression
        expression = expression + tonkenize(re.split(multiplication,sample)[2])
    elif(re.match(division,sample)):
        expression = ['division']
        expression = tonkenize(re.split(division,sample)[1]) + expression
        expression = expression + tonkenize(re.split(division,sample)[2])
    elif(re.match(addition,sample)):
        expression = ['addition']
        expression = tonkenize(re.split(addition,sample)[1]) + expression
        expression = expression + tonkenize(re.split(addition,sample)[2])
    elif(re.match(subtraction,sample)):
        expression = ['subtraction']
        expression = tonkenize(re.split(subtraction,sample)[1]) + expression
        expression = expression + tonkenize(re.split(subtraction,sample)[2])
        return expression
    elif (re.match(variables_,sample)):
        return ['variable']
    elif (re.match(float_,sample)):
        return ['float']
    elif (re.match(integer_,sample)):
        return ['integer']
    return expression


text = f.readlines()
for line in text:
    print("\n")
    solution.append(tonkenize(line))

for each_ in solution:
    print(each_)
