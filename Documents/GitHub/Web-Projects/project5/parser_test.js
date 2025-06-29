const parser = require('./parser.js');
const parserA = new parser();

const a = ['a', 'b', 'c', 'd'];

console.log(parserA.advance(a));
console.log(a);

tokens_ex = ['5', '-', '5', '+', 'cos', '(','5', ')'];
tokens_2 = ['7', '*', '(', '3', '+', '9', ')', '-', '2', '/', '2']; // should = 83

tokens_3 = ['mean', '(', '3', ',', '9', ')'];
console.log(parserA.parse_expr(tokens_ex));
console.log(parserA.parse_expr(tokens_2));
console.log(parserA.parse_expr(tokens_3));