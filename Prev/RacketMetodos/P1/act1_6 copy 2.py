import regex as re
filename = "./input.txt"
f = open(filename,"r")
solution = []

variables_ = r"(\s)*([a-zA-Z_]\w*)"
float_ = r"(\s)*\-?(\d)+(\.)(\d)+" 
integer_ = r"(\s)*\-?(\d)+"
openP = r"\("
closeP = r"\)"
comment = r"(([^\/\&]|\s)*)(\/\/[^\/\/]*)"
Snotation = r"(\s)*(\d+(\.(\d)+){0,1}((E-|E\+)(\d)+))"
multiplication = r"([^\*]*)\*([^\*]*)"
division = r"([^\/]*)\/([^\/]*)"
addition = r"([^\+]*)\+([^\+]*)"
subtraction = r"([^\-]*)\-([^\-]*)"
exponent = r"([^\^]*)\^([^\^]*)"



expressions = [comment, variables_,float_,integer_,openP,closeP,Snotation,multiplication,division,addition,subtraction,exponent]
expressionsLabels = ['comment', 'variable','float','integer','open parenthesis','close parenthesis','real','multiplication','division','addition','subtraction','exponent']


def tonkenize(sample):
    pattern = r'\d+(\.\d+)?(?:[eE][-+]?\d+)?|[a-zA-Z_]\w*|[\+\-\*/\(\)]'

    # tokenize the expression using regular expressions
    tokens = re.findall(pattern, sample)

    # process the tokens to distinguish between subtractions and negative numbers
    commented = False
    processed_tokens = []
    print(tokens)
    for i, token in enumerate(tokens):
        processed_tokens.append(token)
        # if commented:
        #     processed_tokens.pop
        # else:
        #     for j in range(len(expressions)):
        #         if (re.match(expressions[j],token)):
        #             processed_tokens.pop()
        #             processed_tokens.append(expressionsLabels[j])
        #             if (j == 0):
        #                 commented = True
    return processed_tokens



text = f.readlines()
for line in text:
    print("\n")
    solution.append(tonkenize(line))

for each_ in solution:
    print(each_)
