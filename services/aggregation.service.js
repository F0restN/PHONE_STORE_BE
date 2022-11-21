const {
    getOrderSumDB,
    getProductSumPriceDB,
    getSalesbyBusinessDB,
    getSalesbyRegionDB,
    getTopCateDB
} = require("../db/aggregation.db");
const { ErrorHandler } = require("../helpers/error");

class AggregationService {

    orderSum = async () => {
        try {
            return await getOrderSumDB();
        } catch (error) {
            throw new ErrorHandler(error.statusCode, error.message);
        }
    };

    productSumPrice = async () => {

        try {
            return await getProductSumPriceDB();
        } catch (error) {
            throw new ErrorHandler(error.statusCode, error.message);
        }
    };

    salesByBusiness = async () => {
        try {
            const result = await getSalesbyBusinessDB();
            if (!result) {
                throw new ErrorHandler(404, "Order does not exist");
            }
            return result;
        } catch (error) {
            throw new ErrorHandler(error.statusCode, error.message);
        }
    };
    topCate = async () => {
        try {
            return await getTopCateDB()
        } catch (error) {
            throw new ErrorHandler(error.statusCode, error.message);
        }
    }
    salesbyRegion = async () => {
        try {
            return await getSalesbyRegionDB()
        } catch (error) {
            throw new ErrorHandler(error.statusCode, error.message);
        }
    }
}

module.exports = new AggregationService();
