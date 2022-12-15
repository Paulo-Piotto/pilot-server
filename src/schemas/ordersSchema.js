import Joi from "joi";

const ordersSchema =Joi.object({
    invoice: Joi.string().required(),
    date: Joi.date().required(),
    store: Joi.number().required(),
    client: Joi.number().required(),
    value: Joi.number().required(),
    negotiated: Joi.number(),
    cash: Joi.number().required(),
    financed: Joi.number().required(),
})

export default ordersSchema;