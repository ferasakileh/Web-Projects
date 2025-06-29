const tokenizer = require('./tokenizer.js');
const tokenize = new tokenizer();

const input = "5 + sin(π)";
console.log(tokenize.tokenize(input));