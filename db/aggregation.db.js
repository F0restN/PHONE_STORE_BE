const pool = require('../config')

const getOrderSum = async ({ productId, userId }) => {
    const ordersum = await pool.query(
        "SELECT sum(total) from orders"
    );
    return {
        ordersum: ordersum
    };
};

// const getOrderSum = async ({ productId, userId }) => {
//     const ordersum = await pool.query(
//         "SELECT sum(total) from orders, order_item GROUP BY order_item.product_id where order"
//     );
//     return {
//         ordersum: ordersum
//     };
// };