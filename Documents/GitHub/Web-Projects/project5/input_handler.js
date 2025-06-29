// imports all necessary functions for input handling

import input_validator from './input_validator.js';
const inputvalidator = new input_validator();

import Tokenizer from './tokenizer.js';
const tokenizerA = new Tokenizer();

import Parser from './parser.js';
const parserA = new Parser();

import CalcGenerators from './calc_generators.js';
const generators = new CalcGenerators();

//for help button popup
const myPopup = document.getElementById('myPopup');
const closePopup = document.getElementById('closePopup');

// Event listener for the close button
closePopup.addEventListener("click", function () {
    myPopup.classList.remove("show");
});


// keeps a string for the input
let inputString = "";

// gets the display element
const display = document.getElementById("display");

// function to prompt user for a range and validate the input
function getRangeFromUser() {
    const min = prompt("Enter the minimum value:");
    const max = prompt("Enter the maximum value:");

    // makes sure min and max are integers and min is less than max
    if (!isNaN(min) && !isNaN(max) && parseInt(min) <= parseInt(max)) {
        return [parseInt(min), parseInt(max)];
    } else {
        alert("Invalid range. Please enter valid integers and make sure min<max");
        return null;
    }
}

// function to add values to the display and keep track of the input string
function addToDisplay(value) {

    // check if button pressed is a generator function
    if (value === "evens(") {
        const range = getRangeFromUser();
        if (range) generators.generate_even_numbers(range[0], range[1]);
    } else if (value === "odds(") {
        const range = getRangeFromUser();
        if (range) generators.generate_odd_numbers(range[0], range[1]);
    } else if (value === "primes(") {
        const max = prompt("Enter the maximum value:");
        if (!isNaN(max)) generators.generate_primes(parseInt(max));
        else alert("Invalid input. Please enter a valid integer.");
    } else if (value === "squares(") {
        const range = getRangeFromUser();
        if (range) generators.generate_squares(range[0], range[1]);
    } else if (value === "fibonacci(") {
        const max = prompt("Enter the maximum length of the Fibonacci sequence:");
        if (!isNaN(max)) generators.fibonacci(parseInt(max));
        else alert("Invalid input. Please enter a valid integer.");
    }else if (value === "clear") {
        display.textContent = "";
        inputString = ""; // clear input string
    } else if (value === "=") {
        // checks if input is valid
        if (inputvalidator.is_input_valid(inputString) === true) {
            // tokenize the input string
            console.log("Input String: ", inputString);

            let tokens = tokenizerA.tokenize(inputString);
            console.log("Tokens:", tokens); // debuggggghhhh
            console.log("Token array length:", tokens.length);  // Should print 4

            // parse the tokens
            let parsedTokens = parserA.parse_expr(tokens);
            console.log("Parsed tokens:", parsedTokens); // debuggggghhhh

            //display result to screen
            display.textContent = parsedTokens.toString();

            //set input string to the result
            inputString = parsedTokens.toString();
            
        } else {
            display.textContent = "Error, please try a different expression.";
            inputString = ""; // clear input string
        }
    } else if (value === "help") {
       //display.textContent = "Enter a valid expression and press '=' to evaluate it. Press 'clear' to clear the display.";
        myPopup.classList.add("show");
        inputString = ""; // clear input string
    } else {
        // add the current value to the input string
        inputString += value; 
        display.textContent = inputString; // display the input string
    }
    
}


document.querySelectorAll("button").forEach(button => {
    button.addEventListener("click", () => {
        // passes button values to addToDisplay function
        addToDisplay(button.value); 
    });
});

