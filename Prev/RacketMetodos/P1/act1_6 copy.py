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
    if (re.match(comment,sample)):
        expression = ['comment']
        print(sample + '||comment')
        expression = tonkenize(re.split(comment,sample)[1]) + expression
        
    elif(re.match(Snotation,sample)):
        print(sample + '||real')
        expression = ['real']
        return ['real']
    elif (re.match(assignment,sample)):
        expression = ['assignment']
        print(sample + '= ||assignment')
        expression = tonkenize(re.split(assignment,sample)[1]) + expression
        expression = expression + tonkenize(re.split(assignment,sample)[2])
    elif (re.match(openP,sample)):
        test = False
        for a in re.findall(openP,sample):
                for b in a:
                    if (test):
                        expression = expression + ['openParenthesis']
                        print(sample + '||openParenthesis')
                    test = True
                    expression = expression + tonkenize(re.split(openP,b)[0])
                test = False
        
    elif (re.match(closeP,sample)):
        test = False
        for a in re.findall(closeP,sample):
                for b in a:
                    if (test):
                        expression = expression + ['closeParenthesis']
                        print(sample + '||closeParenthesis')
                    test = True
                    expression = expression + tonkenize(re.split(closeP,b)[0])
                test = False
        
    elif(re.match(exponent,sample)):
        test = False
        for a in re.findall(exponent,sample):
                for b in a:
                    if (test):
                        expression = expression + ['exponent']
                        print(sample + '||exponent')
                    test = True
                    expression = expression + tonkenize(re.split(exponent,b)[0])
                test = False
        
    elif(re.match(multiplication,sample)):
        test = False
        for a in re.findall(multiplication,sample):
                for b in a:
                    if (test):
                        expression = expression + ['multiplication']
                        print(sample + '||multiplication')
                    test = True
                    expression = expression + tonkenize(re.split(multiplication,b)[0])
                test = False
        
    elif(re.match(division,sample)):
        test = False
        for a in re.findall(division,sample):
                for b in a:
                    if (test):
                        expression = expression + ['division']
                        print(sample + '||division')
                    test = True
                    expression = expression + tonkenize(re.split(division,b)[0])
                test = False
    elif(re.match(addition,sample)):
        test = False
        for a in re.findall(addition,sample):
                for b in a:
                    if (test):
                        expression = expression + ['addition']
                        print(sample + '||addition')
                    test = True
                    expression = expression + tonkenize(re.split(addition,b)[0])
                test = False
    elif(re.match(subtraction,sample)):
        test = False
        for a in re.findall(subtraction,sample):
            for b in a:
                if (test):
                    expression = expression + ['subtraction']
                    print(sample + '||subtraction')
                test = True
                expression = expression + tonkenize(re.split(subtraction,b)[0])
            test = False
    elif (re.match(variables_,sample)):
        print(sample + '||variable')
        return ['variable']
    elif (re.match(float_,sample)):
        print(sample + '||float')
        return ['float']
    elif (re.match(integer_,sample)):
        print(sample + '||integer')
        return ['integer']
    return expression


text = f.readlines()
for line in text:
    print("\n")
    solution.append(tonkenize(line))

    print("\n")
for each_ in solution:
    print(each_)
