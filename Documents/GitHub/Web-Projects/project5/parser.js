import { sine, cosine, tangent } from './calc_trig.js';
import { absolute, factorial, percentage, log, squareRoot, cubeRoot, exponent, is_prime }  from './calc_math.js';
import { dec_to_binary, dec_to_octal, dec_to_hex, F_to_C } from './calc_conversions.js';
import { mean, median, mode, maximum, find_smallest} from './calc_statistics.js';

// parses through the tokenized tokens
class Parser {

    advance(tokens) {
        const current_token = tokens.shift();
        return current_token;
    }
    
    parse_expr(tokens) {
        let result = this.parse_term(tokens);

        while (tokens[0] === '+' || tokens[0] === '-') {
            if (tokens[0] === '+') {
                this.advance(tokens);
                result += this.parse_term(tokens);
            } else if (tokens[0] === '-') {
                this.advance(tokens);
                result -= this.parse_term(tokens);
            }
        }

        return result;
    }
    
    parse_term(tokens) {
        let result = this.parse_factor(tokens);

        while (tokens[0] === '*' || tokens[0] === '/' || tokens[0] === '%') {
            if (tokens[0] === '*') {
                this.advance(tokens);
                result *= this.parse_factor(tokens);
            } else if (tokens[0] === '/') {
                this.advance(tokens);
                let divisor = this.parse_factor(tokens);

                if (divisor != 0) {
                    result = result * 1.0 / divisor;
                } else {
                    console.log("Cannot divide by 0");
                    return NaN;
                }

            } else if (tokens[0] === '%') {
                this.advance(tokens);
                let divisor = this.parse_factor(tokens);

                if (divisor != 0) {
                    result = result % divisor;
                } else {
                    console.log("Cannot divide by 0");
                }
            
            }
        }

        return result;
    }
    
    parse_factor(tokens) {
        if (tokens[0] === '(') {
            this.advance(tokens);
            let result = this.parse_expr(tokens);
            this.advance(tokens);
            return result;
    } else if (tokens[0] === '√' || tokens[0] === '∛' || tokens[0] === 'sin' || tokens[0] === 'cos' || tokens[0] === 'tan') {
        return this.parse_function(tokens);
    } else if (tokens[0] === 'log' || tokens[0] === 'exponent' || tokens[0] === 'percentage' || tokens[0] === 'temp' || tokens[0] === 'factorial' || tokens[0] === 'is_prime') {
        return this.parse_function(tokens);
    } else if (tokens[0] === 'odds' || tokens[0] === 'evens' || tokens[0] === 'squares' || tokens[0] === 'primes') {
        return this.parse_function(tokens);
    } else if (tokens[0] === 'absolute' || tokens[0] === 'to_binary' || tokens[0] === 'to_octal' || tokens[0] === 'to_hex' || tokens[0] === 'is_prime') {
        return this.parse_function(tokens);
    } else if (tokens[0] === 'π') {
        this.advance(tokens);
        return Math.PI;
    } else if (tokens[0] === 'mean' || tokens[0] === 'median' || tokens[0] === 'mode' || tokens[0] === 'min' || tokens[0] === 'max') {
        return this.parse_function(tokens);
    } else {
        return this.parse_digit_seq(tokens);
    }
}
    
    parse_function(tokens) {
        let func = tokens[0];

        this.advance(tokens);

        let argument = null;

        if (tokens[0] === '(') {
            this.advance(tokens);

            let arr = [];
            
            let base = this.parse_expr(tokens);
            arr.push(base);
            console.log("Parsing function:", func, "with base:", base);

            while (tokens[0] != ')') {
                if (tokens[0] === ',') {
                    if (func === 'mean' || func === 'median' || func === 'mode' || func === 'max' || func === 'min') {
                        this.advance(tokens);
                        let next_val = this.parse_expr(tokens);
                        arr.push(next_val);
                    } else {
                        this.advance(tokens);
                        argument = this.parse_expr(tokens);
                        console.log("Parsing function:", func, "with base:", base, "and argument:", argument);
                    }
                }
            }

            this.advance(tokens); // drop ')'

            // if (tokens[0] === ',') {
            //     this.advance(tokens);
            //     argument = this.parse_expr(tokens);
            //     console.log("Parsing function:", func, "with base:", base, "and argument:", argument);
            // }

            // if (tokens[0] === ')') {
            //     this.advance(tokens);
            // } 

            switch(func) {
                case 'sin':
                    return sine(base);
                case 'cos':
                    return cosine(base);
                case 'tan':
                    return tangent(base);
                case '√':
                    return squareRoot(base);
                case '∛':
                    return cubeRoot(base);
                case 'temp':
                    return F_to_C(base);
                case 'absolute':
                    return absolute(base);
                //case 'primes':
                    //return generate_primes(base);
                case 'factorial':
                    return factorial(base);
                case 'to_binary':
                    return dec_to_binary(base);
                case 'to_octal':
                    return dec_to_octal(base);
                case 'is_prime':
                    return is_prime(base);
                case 'mean':
                    return mean(arr);
                case 'median':
                    return median(arr);
                case 'max':
                    return maximum(arr);
                case 'min':
                    return find_smallest(arr);
                case 'mode':
                    return mode(arr);
                case 'to_hex':
                    return dec_to_hex(base);
                case 'log': 
                    // Ensure base and argument are valid for log calculation
                    if (base <= 0 || base == 1 || argument <= 0) {
                        console.log("Base and argument must be positive, and base cannot be 1 for log function");
                        break;
                    } else {
                        return log(base, argument); // Use custom log function
                    }
                case 'exponent':
                    return exponent(base, argument); // Use custom exponent function
                //case 'is_prime':
                    //return is_prime(base);
                case 'percentage':
                    return percentage(base, argument); // Use custom percentage function
                //case 'odds':
                    //return generate_odd_numbers(base, argument);
                //case 'evens':
                    //return generate_even_numbers(base, argument);
                //case'squares':
                    //return generate_squares(base, argument);
                //case 'isPrime':
                    //return is_prime(base);
                default: 
                    console.log('unknown function')
                    break;
            }
        }
    }

    parse_digit_seq(tokens) {
        let negative = false;
        if (tokens[0] === 'neg') {
            negative = true;
            this.advance(tokens);
        }

        let result = 0;

        if (tokens[0].includes('.')) {
            result = parseFloat(tokens[0]);
        } else {
            result = parseInt(tokens[0]);
        }

        this.advance(tokens);

        if (negative) {
            result = result * -1;
        }

        return result;
    }

}

export default Parser;

