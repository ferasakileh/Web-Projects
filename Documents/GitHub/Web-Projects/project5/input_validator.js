const TOKEN_PATTERN = /\d*\.\d+|\d+|[\+\-\*\/\%]|\(|\)|√|∛|log|,|sin|cos|tan|exponent|percentage|factorial|temp|odds|evens|squares|mean|mode|median|fine_smallest|primes|is_prime|neg|π/g;
// checks input for valid syntex
class InputValidator {

    // main valid checker
    is_input_valid(s) {
        return this.valid_operators(s) && this.parentheses_balanced(s);
    }

    // check for () syntax
    parentheses_balanced(s) {
        const stack = [];
        for(const char of s) {
            if(char === '(') {
            stack.push(char);
        } else if (char === ')') {
            if(stack.length === 0 || stack.pop() !== '(') {
                return false;
            }
        }
    }
    return stack.length === 0;
}
    
    // check for operator syntax
    valid_operators(s) {
        const tokens = s.match(TOKEN_PATTERN) || [];

        console.log("Tokens:", tokens);

        if (tokens.length === 0) return false;
        if (/[\+\-\*\/\%\)]|[ \t]/.test(tokens[0])) return false;
        if (/[\+\-\*\/\%\(]|[ \t,]/.test(tokens[tokens.length - 1])) return false;

        for(let i = 0; i < tokens.length - 1; i++) {
            const prev = tokens[i];
            const curr = tokens[i+1];
            console.log("Checcking tokens:", prev, curr);

            if (/[\+\-\*\/\%]/.test(prev) && /[\+\-\*\/\%]/.test(curr)) {
                console.log("Consecutive operators:", prev, curr);
                return false;
            }
            
            if (prev === '(' && /[\+\-\*\/\%]/.test(curr)) {
                console.log("Operator after '(':", prev, curr);
                return false;
            }
    
            if (curr === ')' && /[\+\-\*\/\%]/.test(prev)) {
                console.log("Operator before ')':", prev, curr);
                return false;
            }
    
            if (/\d*\.\d+|\d+/.test(prev) && /[(|√|∛|log|sin|cos|tan|exponent|percentage|factorial|temp|odds|evens|mean|squares|primes|is_prime|π]/.test(curr)) {
                console.log("Digit before '(' or function:", prev, curr);
                return false;
            }
    
            if (prev === ')' && /\d*\.\d+|\d+/.test(curr)) {
                console.log("Digit after ')':", prev, curr);
                return false;
            }
    
            if (/sin|cos|tan|log|percentage|factorial|temp|absolute|is_prime|exponent|odds|mean|evens|is_prime|squares|primes|√|∛/.test(prev) && curr !== '(') {
                console.log("Function without '(':", prev, curr);
                return false;
            }
    
            if (['percentage', 'exponent', 'absolute', 'odds', 'evens', 'squares'].includes(prev) && (curr !== '(' || !s.includes(','))) {
                console.log("Invalid structure for:", prev, curr);
                return false;
            }
        }
    return true;
    }

}

export default InputValidator;