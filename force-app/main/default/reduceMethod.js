const items = [
    { name: 'TV' },
    { name: 'AC', price: '40000' },
    { name: 'Car', price: '120000' },
    { name: 'Laptop', price: '100000' },
    { name: 'Mobile', price: '50000' }
]

const total = items.reduce((currentTotal, { name, price = '0'}) => {
    return currentTotal + parseInt(price)
}, 0)

console.log(total);