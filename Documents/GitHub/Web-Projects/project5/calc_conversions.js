// Functions involving conversions
export function dec_to_binary (val) {
    return (val >>> 0).toString(2);
}

export function dec_to_octal (val) {
    return(val >>> 0).toString(8);
}

export function dec_to_hex (val) {
    return (val >>> 0).toString(16);
}

export function F_to_C (temp_F) {
    return ((temp_F - 32) * 5) / 9;
}

// Testing the functions

const test1 = 2; 
const test2 = 14;
const test3 = 35;

console.log(`Binary of ${test1}: ${dec_to_binary(test1)}`); // Expected: "10"
console.log(`Binary of ${test2}: ${dec_to_binary(test2)}`); // Expected: "1110"

console.log(`Octal of ${test1}: ${dec_to_octal(test1)}`);   // Expected: "2"
console.log(`Octal of ${test2}: ${dec_to_octal(test2)}`);   // Expected: "16"

console.log(`Hexadecimal of ${test1}: ${dec_to_hex(test1)}`); // Expected: "2"
console.log(`Hexadecimal of ${test2}: ${dec_to_hex(test2)}`); // Expected: "e"

console.log(`${test3}°F is equal to ${F_to_C(test3).toFixed(2)}°C`); // Expected: "0.00°C"
