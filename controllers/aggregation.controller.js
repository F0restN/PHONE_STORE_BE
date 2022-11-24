const pool = require("../config");
const aggregationService = require("../services/aggregation.service");

const orderSum = async (req, res) => {
    const rlt = await aggregationService.orderSum();
    res.status(200).json(rlt)
}
const productSumPrice = async (req, res) => {
    const rlt = await aggregationService.productSumPrice();
    res.status(200).json(rlt)
}

const salesByBusiness = async (req, res) => {
    const rlt = await aggregationService.salesByBusiness();
    res.status(200).json(rlt)
}

const salesbyRegion = async (req, res) => {
    const rlt = await aggregationService.salesbyRegion()
    res.status(200).json(rlt)
}

const topCate = async (req, res) => {
    const rlt = await aggregationService.topCate()
    res.status(200).json(rlt)
}

module.exports = {
    orderSum,
    productSumPrice,
    salesByBusiness,
    salesbyRegion,
    topCate
};
