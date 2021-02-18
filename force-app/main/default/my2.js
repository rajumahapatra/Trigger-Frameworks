const aplhabet = ['A', 'B', 'C', 'D', 'E']
const numbers = ['1', '2', '3', '4', '5']

const newArray = [...aplhabet, ...numbers]
const newArray1 = aplhabet.concat(numbers)

const [a, , c, ...rest] = aplhabet
console.log(a);
console.log(c);
console.log(rest);
console.log(newArray);
console.log(newArray1);