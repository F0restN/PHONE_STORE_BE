const pool = require('../config')

const getOrderSumDB = async () => {
    const { rows: ordersum } = await pool.query(
        "SELECT sum(total) from orders",
        []
    );
    return ordersum[0];
};

const getProductSumPriceDB = async () => {
    const { rows: productSumPrice } = await pool.query(
        "SELECT order_item.product_id ,quantity * price from orders_item natural join products GROUP BY order_item.product_id",
        []
    );
    return productSumPrice[0];
};
const getTopCateDB = async () => {
    const { rows: topCate } = await pool.query(
        "SELECT products.category ,sum(quantity) from products natural join order_item GROUP BY products.category",
        []
    );
    return topCate[0];
};
const { rows: getSalesbyRegionDB } = async () => {
    const salesByRegion = await pool.query(
        "SELECT store.region_id, sum(quantity) from order_item inner join products on order_item.product_id = products.product_id inner join store on products.store_id = store.store_id GROUP By store.region_id",
        []
    );
    return getSalesbyRegionDB[0];
}
const getSalesbyBusinessDB = async () => {
    const { rows: salesByRegion } = await pool.query(
        "SELECT business, sum(total) from orders NATURAL JOIN users GROUP BY business",
        []
    );
    return salesByRegion[0]
}

module.exports = {
    getOrderSumDB,
    getProductSumPriceDB,
    getSalesbyBusinessDB,
    getSalesbyRegionDB,
    getTopCateDB
}