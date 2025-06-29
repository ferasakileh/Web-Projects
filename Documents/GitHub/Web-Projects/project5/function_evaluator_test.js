const function_evaluator = require('./function_evaluator.js');
const evaluator = new function_evaluator();

// Example usage
const result1 = evaluator.evaluate('sin', Math.PI / 2);
console.log(result1);  // Expected output for sin(PI / 2) is 1

const result2 = evaluator.evaluate('factorial', 5);
console.log(result2); // Expected output for factorial(5) is 120

const result3 = evaluator.evaluate('to_binary', 10);
console.log(result3); // Expected output for decimal 10 in binary is '1010'
