import Joi from "joi";

const orderSearchSchema =Joi.object({
    initialDate: Joi.string().required(),
    endDate: Joi.string().required(),
    client: Joi.string(),
    store: Joi.string(),
})

export default orderSearchSchema;