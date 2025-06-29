// calculate_statistics_test.js
const { mean, median, mode, calc_stat_from_input } = require('./calc_statistics.js');

// Test cases for each function
const data1 = [1, 2, 3, 4, 5];
const data2 = [3, 3, 3, 3, 3, 2, 2, 2, 4];
const input1 = "mean(1, 2, 3, 4, 5)";
const input2 = "median(1, 2, 3, 4, 5)";
const input3 = "mode(3, 3, 3, 3, 3, 2, 2, 2, 4)";

// Testing individual functions
console.log('Mean:', mean(data1));  // Expected Output: 3
console.log('Median:', median(data1));  // Expected Output: 3
console.log('Mode:', mode(data2));  // Expected Output: [3]
console.log('Maximum:', maximum(data1));  // Expected Output: 5
console.log('Smallest:', find_smallest(data1));  // Expected Output: 1

// Testing the calc_stat_from_input function
console.log(calc_stat_from_input(input1));  // Expected Output: 3
console.log(calc_stat_from_input(input2));  // Expected Output: 3
console.log(calc_stat_from_input(input3));  // Expected Output: [3]
console.log(calc_stat_from_input("invalid input"));  // Expected Output: Invalid input format!
