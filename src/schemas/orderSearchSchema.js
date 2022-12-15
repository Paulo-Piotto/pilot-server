import Joi from "joi";

const orderSearchSchema =Joi.object({
    initialDate: Joi.date().required(),
    endDate: Joi.date().required(),
    client: Joi.string(),
    store: Joi.string(),
})

export default orderSearchSchema;