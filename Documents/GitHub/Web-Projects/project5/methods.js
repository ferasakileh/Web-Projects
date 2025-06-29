// Include necessary files
import { absolute, factorial, percentage, log,squareRoot, cubeRoot, exponent, is_prime } from './calc_math.js';
import { sine, cosine, tangent } from './calc_trig.js';
import CalcGenerators from './calc_generators.js';
import { mean, compareNumbers, median, maximum, find_smallest, mode } from './calc_statistics.js';
import { dec_to_binary, dec_to_octal, dec_to_hex, F_to_C} from './calc_conversions.js';

// Exporting all functions and classes as a single object
export {
  absolute,
  factorial,
  percentage,
  log,
  squareRoot,
  cubeRoot,
  exponent,
  sine,
  cosine,
  tangent,
  CalcGenerators,
  mean,
  compareNumbers,
  median,
  maximum,
  find_smallest,
  mode,
  dec_to_binary,
  dec_to_octal,
  dec_to_hex,
  F_to_C,
  is_prime
};