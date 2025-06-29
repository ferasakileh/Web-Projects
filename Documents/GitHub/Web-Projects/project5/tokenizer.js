// takes input and turns them into tokens to be parsed
class Tokenizer {

    tokenize(input) {
        const TOKEN_PATTERNA = /\d*\.\d+|\d+|[\+\-\*\/\%]|\(|\)|√|∛|log|,|sin|cos|tan|exponent|percentage|to_binary|to_octal|to_hex|factorial|temp|odds|evens|squares|primes|mean|mode|median|max|min|is_prime|neg|π/g;   
        return input.match(TOKEN_PATTERNA) || [];
    }
}

export default Tokenizer;