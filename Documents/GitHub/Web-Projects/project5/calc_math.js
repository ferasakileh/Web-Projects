
// Find the absolute value of a given number
export function absolute(a) {
    let result = a;
    if (a < 0) {
        result = -a;
    }
    return result;
}

// Returns the factorial of a non-negative integer n
export function factorial(n) {
    if (n < 0) return NaN;
    let result = 1;
    for (let i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

// Calculates what percentage 'a' is of 'b'
export function percentage(a, b) {
    if (b === 0) return NaN;
    return (a * 1.0) / b * 100;
}

// Calculate the logarithm of a number with a specified base
export function log(base, a) {
    return Math.log(a) / Math.log(base);
}

// Calculate the square root of a number
export function squareRoot(num) {
    if (num < 0) return NaN;
    return Math.sqrt(num);
}

// Calculate the cube root of a number
export function cubeRoot(num) {
    return Math.cbrt(num);
}

// Calculate the exponent given a base and power
export function exponent(a, b) {
    if (a === 0 && b === 0) return 1;
    if (b < 0) return 1.0 / this.exponent(a, -b);
    let result = 1;
    for (let i = 0; i < b; i++) {
        result *= a;
    }
    return result;
}

// Determine if num is a prime number
// @param num [Integer] The number to check if it is a prime number
// @return [Boolean] True if num is a prime number, False otherwise
export function is_prime(num) {
    let result = "TRUE";
    if (num <= 1) {
        result = "FALSE";
    }
    for (let i = 2; i <= Math.sqrt(num); i++) {
        if (num % i === 0) {
            result = "FALSE";
        }
    }
    return result
}

console.log(is_prime(3));
console.log(absolute(-5));         // 5
console.log(factorial(5));         // 120
console.log(percentage(25, 100));  // 25
console.log(log(10, 100));         // 2
console.log(squareRoot(16));       // 4
console.log(cubeRoot(8));          // 2
console.log(exponent(2, 3));       // 8