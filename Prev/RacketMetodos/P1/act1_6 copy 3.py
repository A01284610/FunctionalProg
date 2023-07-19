import regex as re
filename = "./input.txt"
f = open(filename,"r")

def tonkenize(sample):
    # regular expression pattern to match mathematical operations
    pattern = r'\d+(\.\d+)?(?:[eE][-+]?\d+)?|[a-zA-Z_]\w*|[\+\-\*\/(\)\^]'

    # tokenize the expression using regular expressions
    tokens = re.findall(pattern, sample)

    # process the tokens to distinguish between subtractions and negative numbers
    processed_tokens = []
    for i, token in enumerate(tokens):
        if token == '-':
            # check if '-' is a subtraction or a negative number
            if i == 0 or tokens[i-1] in '+-*/(':
                processed_tokens.append('-1')
                processed_tokens.append('*')
            else:
                processed_tokens.append('-')
        else:
            processed_tokens.append(token)

    print(processed_tokens)



text = f.readlines()
for line in text:
    tonkenize(line)

