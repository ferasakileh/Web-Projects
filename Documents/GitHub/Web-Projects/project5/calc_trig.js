// Trig functions
export function sine(angle) {
    return Math.sin(angle);
}

export function cosine(angle) {
    return Math.cos(angle);
}

export function tangent(angle) {
    return Math.tan(angle);
}

const degs_90 = Math.PI/2;
const degs_180 = Math.PI;  
const degs_270 = 3*Math.PI/2; 
const degs_360 = 2*Math.PI; 
const degs_0 = 0; 

console.log(`PI/4: ${Math.PI/4}`); 
console.log(`PI: ${Math.PI}`); 
 
console.log(`cosine of ${degs_90}: ${sine(degs_90)}`); 
console.log(`cosine of ${degs_180}: ${sine(degs_180)}`); 
console.log(`cosine of ${degs_270}: ${sine(degs_270)}`); 
console.log(`cosine of ${degs_360}: ${sine(degs_360)}`); 
console.log(`cosine of ${degs_0}: ${sine(degs_0)}`);
 
console.log(`sine of ${degs_90}: ${sine(degs_90)}`); 
console.log(`sine of ${degs_180}: ${sine(degs_180)}`); 
console.log(`sine of ${degs_270}: ${sine(degs_270)}`); 
console.log(`sine of ${degs_360}: ${sine(degs_360)}`); 
console.log(`sine of ${degs_0}: ${sine(degs_0)}`);

console.log(`tangent of ${degs_90}: ${tangent(degs_90)}`); 
console.log(`tangent of ${degs_180}: ${tangent(degs_180)}`); 
console.log(`tangent of ${degs_270}: ${tangent(degs_270)}`); 
console.log(`tangent of ${degs_360}: ${tangent(degs_360)}`); 
console.log(`tangent of ${degs_0}: ${tangent(degs_0)}`); 

