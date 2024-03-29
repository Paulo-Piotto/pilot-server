import Joi from "joi";

const incomesSchema =Joi.object({
    name: Joi.string().required(),
    date: Joi.date().required(),
    client: Joi.number().required(),
    value: Joi.number().required(),
    author: Joi.string().required(),
})

export default incomesSchema;