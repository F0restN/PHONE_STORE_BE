const router = require('express').Router();
const {
    orderSum,
    productSumPrice,
    salesByBusiness,
    salesbyRegion,
    topCate
} = require("../controllers/aggregation.controller")

router.route("/orderSum").get(orderSum);
router.route("/productSumPrice").get(productSumPrice);
router.route("/salesByBusiness").get(salesByBusiness);
router.route("/salesbyRegion").get(salesbyRegion);
router.route("/topCate").get(topCate);

module.exports = router