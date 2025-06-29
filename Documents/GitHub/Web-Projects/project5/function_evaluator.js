import * as Methods from './methods.js';
const PI = Math.PI;

class FunctionEvaluator {
    
    // initialize
    initialize(func, base, arg = null) {
        this.function = func;
        base = base;
        this.argument = arg;
    }

    // evaluate function and its arguments
    evaluate(func, base, arg = null) {
        switch (func) {
            case 'mean':
                return Methods.mean(base);
            case 'median':
                return Methods.median(base);
            case 'maximum':
                return Methods.maximum(base);
            case 'find_smallest':
                return Methods.find_smallest(base);
            case 'mode':
                return Methods.mode(base);
            case 'to_binary':
                return Methods.dec_to_binary(base);
            case 'to_octal':
                return Methods.dec_to_octal(base);
            case 'to_hex':
                return Methods.dec_to_hex(base);
            case 'sin':
                return Methods.sine(base);
            case 'cos':
                return Methods.cosine(base);
            case 'tan':
                return Methods.tangent(base);
            case '√':
                return Methods.squareRoot(base);
            case '∛':
                return Methods.cubeRoot(base);
            case 'temp':
                return Methods.F_to_C(base);
            case 'absolute':
                return Methods.absolute(base);
            case 'primes':
                return Methods.generate_prime_numbers(base);
            case 'factorial':
                return Methods.factorial(base);
            case 'log':
            // Ensure base and argument are valid for log calculation
            if(base <= 0 || base == 1 || this.argument <= 0) {
                throw new Error("Base and argument must be positive, and base cannot be 1 for log function")
            }
            return Methods.log(base);
            case 'exponent':
                return Methods.exponent(base, this.argument);
            case 'percentage':
                return Methods.percentage(base);
            case 'odds':
                return Methods.generate_odd_numbers(base);
            case 'evens':
                return Methods.generate_even_numbers(base);
            case 'squares':
                return Methods.generate_squares(base);
            case 'is_prime':
                return Methods.is_prime(base);
            default:
                throw new Error (`Unknown function`);
        }   
    }
}

export default FunctionEvaluator;
