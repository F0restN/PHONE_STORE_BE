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
            let result = await getSalesbyBusinessDB();
            result = result.map((val) => {
                return { ...val, sum: Number(val?.sum) }
            })
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
            let result = await getTopCateDB();
            result = result.map((val) => {
                return { ...val, sum: Number(val?.sum) }
            })
            return result;
        } catch (error) {
            throw new ErrorHandler(error.statusCode, error.message);
        }
    }
    salesbyRegion = async () => {
        try {
            let result = await getSalesbyRegionDB()
            result = result.map((val) => {
                return { ...val, sum: Number(val?.sum) }
            })
            return result
        } catch (error) {
            throw new ErrorHandler(error.statusCode, error.message);
        }
    }
}

module.exports = new AggregationService();
