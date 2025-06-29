// Various generator functions
class CalcGenerators {

    // function to download generated text files automatically
    downloadFile(filename, content) {
        const blob = new Blob([content], { type: 'text/plain' });
        const link = document.createElement('a');
        link.href = URL.createObjectURL(blob);
        link.download = filename;

        // automatically download
        document.body.appendChild(link);
        link.click();

        // clean up by removing the link from the DOM after the click
        document.body.removeChild(link);

        console.log(`File ${filename} generated and downloaded automatically.`);

    }

    // Function that generate odd numbers within a specified range and saves to a file
    // @param min [Integer] The lower limit to which the even numbers are generated from
    // @param max [Integer] The upper limit to which the even numbers are generated to
    generate_even_numbers(min, max) {
        min = parseInt(min, 10);
        max = parseInt(max, 10);
        const even_numbers = [];

        for (let i = min; i <= max; i++) {
            if (i % 2 === 0) {
                even_numbers.push(i);
            }
        }

        // Download even numbers as a file
        this.downloadFile('even_numbers.txt', even_numbers.join('\n'));

        console.log("Even numbers between ", min, " and ", max, ":", even_numbers);

        return even_numbers;
    }

    // Test function for generate_even_numbers
    test_generate_even_numbers() {
        this.generate_even_numbers(1, 10);
        this.generate_even_numbers(10, 20);
        this.generate_even_numbers(21, 30);
    }
    
    // Function that generate odd numbers within a specified range and saves to a file
    // @param min [Integer] The lower limit to which the odd numbers are generated from
    // @param max [Integer] The upper limit to which the odd numbers are generated to
    generate_odd_numbers(min, max) {
        min = parseInt(min, 10);
        max = parseInt(max, 10);
        const odd_numbers = [];

        for (let i = min; i <= max; i++) {
            if (i % 2 !== 0) {
                odd_numbers.push(i);
            }
        }
        // Download odd numbers as a file
        this.downloadFile('odd_numbers.txt', odd_numbers.join('\n'));

        console.log("Odd numbers between ", min, " and ", max, ":", odd_numbers);

    }

    // Test function for generate_odd_numbers
    test_generate_odd_numbers() {
        this.generate_odd_numbers(1, 10);
        this.generate_odd_numbers(10, 20);
        this.generate_odd_numbers(21, 30);
    }

    // Function that generate squares within a specified range and saves to a file
    // @param min [Integer] The lower limit to which the squares are generated from
    // @param max [Integer] The upper limit to which the squares are generated to
    generate_squares(min, max) {
        min = parseInt(min, 10);
    max = parseInt(max, 10);
    const array = [];

    // Create an array of numbers from min to max
    for (let i = min; i <= max; i++) {
        array.push(i);
    }

    // Map to squares
    const squares = array.map(num => num ** 2);

    // Download squares as a file
    this.downloadFile('squares.txt', squares.join('\n'));

    console.log("Squares between ", min, " and ", max, ":", squares);

}

    // Test function for generate_squares
    test_generate_squares() {
        this.generate_squares(1, 10);
        this.generate_squares(10, 20);
        this.generate_squares(21, 30);
    }

    // Generate all prime numbers less than a given number and save them to a file
    // @param max_num [Integer] The upper limit to which the prime numbers are generated to
    // @return [Array<Integer>] The generated prime numbers
    generate_primes(max_num) {
        max_num = parseInt(max_num, 10);
        const primes = [];

        for (let i = 2; i < max_num; i++) {
            let isPrime = true;
            for (let j = 2; j < i; j++) {
                if (i % j === 0) {
                    isPrime = false;
                    break;
                }
            }
            if (isPrime) {
                primes.push(i);
            }
        }

        // Download prime numbers as a file
        this.downloadFile('primes.txt', primes.join('\n'));

        console.log("Prime numbers less than ", max_num, ":", primes);

        return primes;
    }

    // Test function for generate_primes
    test_generate_primes() {
        this.generate_primes(10);
        this.generate_primes(20);
        this.generate_primes(30);
    }

    // Generate Fibonacci sequence up to a given number and save them to a file
    // @param max_num [Integer] The upper limit to which the Fibonacci sequence is generated to
    // @return [Array<Integer>] The generated Fibonacci sequence
    fibonacci(max_num) {
        max_num = parseInt(max_num, 10);
        const fibonacci = [0, 1];

        for (let i = 2; i < max_num; i++) {
            fibonacci[i] = fibonacci[i - 1] + fibonacci[i - 2];
        }

        // Download Fibonacci sequence as a file
        this.downloadFile('fibonacci.txt', fibonacci.join('\n'));

        console.log("Fibonacci sequence up to ", max_num, ":", fibonacci);

        return fibonacci;
    }

    // Test function for fibonacci
    test_fibonacci() {
        this.fibonacci(10);
        this.fibonacci(20);
        this.fibonacci(30);
    }

    // Test function for is_prime
    test_is_prime() {
        console.log("Is 2 a prime number? ", this.is_prime(2));
        console.log("Is 3 a prime number? ", this.is_prime(3));
        console.log("Is 4 a prime number? ", this.is_prime(4));
        console.log("Is 5 a prime number? ", this.is_prime(5));
        console.log("Is 6 a prime number? ", this.is_prime(6));
        console.log("Is 7 a prime number? ", this.is_prime(7));
        console.log("Is 8 a prime number? ", this.is_prime(8));
        console.log("Is 9 a prime number? ", this.is_prime(9));
        console.log("Is 10 a prime number? ", this.is_prime(10));
    }

}

// Exporting the CalcGenerators class
export default CalcGenerators;

