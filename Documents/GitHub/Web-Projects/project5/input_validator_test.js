const input_validator = require('./input_validator.js');
const inputvalidator = new input_validator();

const valid_test = "(3 + 5) * 7";
console.log("Valid input:", inputvalidator.is_input_valid(valid_test));

const invalid_test = "3 ++ 5 * (7 - )";  // Invalid: Consecutive operators and unbalanced parentheses
console.log("Valid input:", inputvalidator.is_input_valid(invalid_test));