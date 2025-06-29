const input_validator = require('./input_validator.js');
const inputvalidator = new input_validator();

const tokenizer = require('./tokenizer.js');
const tokenizerA = new tokenizer();


const parser = require('./parser.js');
const parserA = new parser();


const function_evaluator = require('./function_evaluator.js');
const evaluator = new function_evaluator();

// keeps a string for the input
let inputString = "";
const display = document.getElementById("display");

// change display based on if the user is inputting or if the program is displaying a calculation
function addToDisplay(value) {

    // if clear button is pressed
    if (value === "clear") {
        display.textContent = "CLEAR";
        inputString = ""; 
    } else if (value === "=") { // if equal button is pressed
        if (inputvalidator.is_input_valid(inputString)) {
            let tokens = tokenizerA.tokenize(inputString);
            console.log("Tokens:", tokens); // Debugging output
            let parsedTokens = parserA.parse_expr(tokens);
            console.log("Parsed tokens:", parsedTokens); // Debugging output
            let result = evaluator.evaluate(parsedTokens);
            display.textContent = result.toString();
            inputString = ""; // Clear the inputString after displaying result
        } else {
            display.textContent = "Error";
            inputString = ""; // Clear the inputString after displaying error
        }
    } else if (value == "neg") { // if negative button is pressed
        display.textContent += "-";
        inputString += "neg";
    } else {
        inputString += value; // Append the current value to the input string
        display.textContent = inputString;
    }
    
}

// Setting up the event listener for button press
document.querySelectorAll("button").forEach(button => {
    button.addEventListener("click", () => {
        addToDisplay(button.value); // Pass the button's value to addToDisplay
    });
});

