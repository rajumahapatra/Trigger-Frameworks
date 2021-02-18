function getAbsuluteValue(number) {
    if (number == null) return
    if (number >= 0) return number.toString()
    return `(${Math.abs(number)})`
}

console.log(getAbsuluteValue(undefined));
console.log(getAbsuluteValue(-5));
console.log(getAbsuluteValue(5));
console.log(getAbsuluteValue(0));
console.log(typeof getAbsuluteValue());