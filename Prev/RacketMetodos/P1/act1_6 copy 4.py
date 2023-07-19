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

# subtractionCaseVar = r"[+|\-|\*|\/|(|\s]-((([a-zA-Z_]\w*))|(\-?(\d)+(\.)(\d)+)|(\-?(\d)+))"
# subtractionCaseVar = r"(^|[+|\-|\*|\/|(|\s])-([a-zA-Z_]\w*)"
# subtractionCaseFloat = r"(^|[+|\-|\*|\/|(|\s])-((\s)*\-?(\d)+(\.)(\d)+)"
# subtractionCaseInt = r"(^|[+|\-|\*|\/|(|\s])-((\-?(\d)+))"


variables_ = r"(\s)*([a-zA-Z_]\w*)"
float_ = r"(\s)*\-?(\d)+(\.)(\d)+" 
integer_ = r"(\s)*\-?(\d)+"

def tonkenize(sample):
    expression = []
    print("Analyzing: " + sample)
    if (re.match(comment,sample)):
        expression = ['comment']
        print('got type comment')
        expression = tonkenize(re.split(comment,sample)[1]) + expression
        return expression
    elif(re.match(Snotation,sample)):
        expression = ['real']
        return ['real']
    elif (re.match(assignment,sample)):
        expression = ['assignment']
        print('got type assignment')
        expression = tonkenize(re.split(assignment,sample)[1]) + expression
        expression = expression + tonkenize(re.split(assignment,sample)[2])
    elif (re.match(openP,sample)):
        test = False
        for a in re.findall(openP,sample):
                for b in a:
                    if (test):
                        expression = expression + ['openParenthesis']
                    test = True
                    expression = expression + tonkenize(re.split(openP,b)[0])
                test = False
        return expression
    elif (re.match(closeP,sample)):
        test = False
        for a in re.findall(closeP,sample):
                for b in a:
                    if (test):
                        expression = expression + ['closeParenthesis']
                    test = True
                    expression = expression + tonkenize(re.split(closeP,b)[0])
                test = False
        return expression
    elif(re.match(exponent,sample)):
        test = False
        for a in re.findall(exponent,sample):
                for b in a:
                    if (test):
                        expression = expression + ['exponent']
                    test = True
                    expression = expression + tonkenize(re.split(exponent,b)[0])
                test = False
        return expression
    elif(re.match(multiplication,sample)):
        test = False
        for a in re.findall(multiplication,sample):
                for b in a:
                    if (test):
                        expression = expression + ['multiplication']
                    test = True
                    expression = expression + tonkenize(re.split(multiplication,b)[0])
                test = False
        return expression
    elif(re.match(division,sample)):
        test = False
        for a in re.findall(division,sample):
                for b in a:
                    if (test):
                        expression = expression + ['division']
                    test = True
                    expression = expression + tonkenize(re.split(division,b)[0])
                test = False
        return expression
    elif(re.match(addition,sample)):
        test = False
        for a in re.findall(addition,sample):
                for b in a:
                    if (test):
                        expression = expression + ['addition']
                    test = True
                    expression = expression + tonkenize(re.split(addition,b)[0])
                test = False
        return expression
    elif (re.match(variables_,sample)):
        test = False
        for a in re.findall(variables_,sample):
                for b in a:
                    if (test):
                        expression = expression + ['variable']
                    test = True
                    expression = expression + tonkenize(re.split(variables_,b)[0])
                test = False
        return expression
    elif (re.match(float_,sample)):
        test = False
        for a in re.findall(float_,sample):
                for b in a:
                    if (test):
                        expression = expression + ['float']
                    test = True
                    expression = expression + tonkenize(re.split(float_,b)[0])
                test = False
        return expression
    elif (re.match(integer_,sample)):
        test = False
        for a in re.findall(integer_,sample):
                for b in a:
                    if (test):
                        expression = expression + ['integer']
                    test = True
                    expression = expression + tonkenize(re.split(integer_,b)[0])
                test = False
        return expression
    elif(re.match(subtraction,sample)):
        test = False
        print("got subtratcion type")
        for a in re.findall(subtraction,sample):
            print(a)    
            for b in a:
                if (test):
                    expression = expression + ['subtraction']
                test = True
                expression = expression + tonkenize(re.split(subtraction,b)[0])
            test = False
        return expression
    else:
        print('got no type')
    return expression


text = f.readlines()
for line in text:
    print("\n")
    solution.append(tonkenize(line))

for each_ in solution:
    print(each_)
