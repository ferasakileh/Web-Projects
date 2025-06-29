// finds mean
export function mean(data) {
    let sum = (a,b) => a + b;
    let len = data.length;

    if (len == 0) {
        return null;
    }
    
    let sumdata = data.reduce(sum);
    
    return (sumdata / len);
}

// comparator function
export function compareNumbers(a,b) {
    return a - b;
}

// find median
export function median(data) {
    let len = data.length;
    if (len == 0) {
        return null;
    }
    let datasorted = data.sort(compareNumbers);
    if (len % 2 == 0) {
        return (datasorted[len/2 - 1] + datasorted[len/2]) / 2;
    } else {
        return (datasorted[len/2 - 1]);
    }
}

// finds max in data set
export function maximum(data) {
    let max = data[0]

    for (let i = 1; i < data.length; i++) {
        if (data[i] > max) {
            max = data[i];
        }
    }
    return max;
}

// finds smallest in data set
export function find_smallest(data) {
    let min = data[0]

    for (let i = 1; i < data.length; i++) {
        if (data[i] < min) {
            min = data[i];
        }
    }
    return min;
}

// finds mode
export function mode(data) {
    const frequencyMap = {};
    data.forEach(element => {
        frequencyMap[element] = (frequencyMap[element] || 0) + 1;
    });

    let modes = [];
    let maxFreq = 0;

    for (const num in frequencyMap) {
        let freq = frequencyMap[num];
        if (freq > maxFreq) {
            maxFreq = freq;
            modes = [parseFloat(num)];
        } else if (freq === maxFreq) {
            modes.push(parseFloat(num));
        }
    }

    return modes;
}

const data = [4,6];
console.log(mean(data));
console.log(mean([4,6]));