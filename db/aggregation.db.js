const pool = require('../config')

const getOrderSumDB = async () => {
    const { rows: ordersum } = await pool.query(
        "SELECT sum(amount) from orders",
        []
    );
    return ordersum[0];
};

const getProductSumPriceDB = async () => {
    const { rows: productSumPrice } = await pool.query(
        "SELECT name , sum(quantity * price) from order_item left join products on order_item.product_id = products.product_id GROUP BY products.name",
        []
    );
    return productSumPrice;
};
const getTopCateDB = async () => {
    const { rows: topCate } = await pool.query(
        "SELECT products.category ,sum(quantity) from order_item left join products on order_item.product_id = products.product_id GROUP BY products.category",
        []
    );
    return topCate;
};
const getSalesbyRegionDB = async () => {
    const { rows: salesByRegion }= await pool.query(
        "SELECT store.region_id, sum(quantity) from order_item left join products on order_item.product_id = products.product_id left join store on products.store_id = store.store_id GROUP By store.region_id",
        []
    );
    return salesByRegion;
}
const getSalesbyBusinessDB = async () => {
    const { rows: salesByRegion } = await pool.query(
        "SELECT business, sum(total) from orders NATURAL JOIN users GROUP BY business",
        []
    );
    return salesByRegion
}

module.exports = {
    getOrderSumDB,
    getProductSumPriceDB,
    getSalesbyBusinessDB,
    getSalesbyRegionDB,
    getTopCateDB
}