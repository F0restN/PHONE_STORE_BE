const fs = require('fs')
const path = require('path')

let data = []
const managers = ['Sophia1', 'Sophia2', 'Anj', 'Drake', 'Bob']
const regions = ['Pittsburgh', 'New York', 'Philadelphia', 'Charlotte', 'Washington D.C.']
const salespeople = ['salesA', 'salesB', 'salesC']
const products = [
    { category: 'iPhone', name: 'iPhone', price: Math.random, description: 'awesome ios phone', image_url: 'https://www.apple.com/newsroom/images/product/iphone/standard/Apple-iPhone-14-iPhone-14-Plus-2up-purple-220907_inline.jpg.large.jpg' },
    { category: 'Android', name: 'Android', price: Math.random, description: 'awesome andro phone', image_url: 'https://pisces.bbystatic.com/image2/BestBuy_US/images/products/6519/6519930_sd.jpg' }
]
// manager
for (var i = 0; i < managers.length; i++) {
    data.push(`INSERT INTO public.manager (manager_id, manager_name) VALUES (${i + 1}, '${managers.at(i)}');`)
}
for (var i = 0; i < regions.length; i++) {
    data.push(`INSERT INTO public.region (region_id, region_name, manager_id) VALUES (${i + 1}, '${regions.at(i)}', ${i+1});`)
}
for (var i = 0; i < regions.length; i++) {
    for (var j = 1; j < 4; j++) {
        data.push(`INSERT INTO public.store (store_id, store_name, region_id) VALUES (${3 * (i) + j}, '${regions.at(i).substring(0, 3)} store ${j}', ${i+1});`)
    }
}

salespeople.forEach((val, idx) => {
    data.push(`INSERT INTO public.salesperson (sp_id, store_id, sp_name) VALUES (${idx+1}, ${idx+1}, '${val}');`)
})
for (var i = 1; i <= 100; i += 2) {
    products.forEach((val, idx) => {
        data.push(`INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (${i}, '${val.category}','${val.name} ${i + idx}', ${Math.round(val.price() * 100000) / 100}, '${val.description}', '${val.image_url}', ${Math.floor(Math.random() * 300) + 100}, ${Math.floor(Math.random() * 15) + 1});`)
    })
}
var file = fs.createWriteStream(`${path.join(__dirname, 'data.sql')}`,{flags:"as"})
Promise
data.forEach((val) => {file.write(val+"\n")})
file?.close()
// exports.datafactory = function () {
//     return fs.readFileSync(path.join(__dirname, "data.sql")).toString()
// }