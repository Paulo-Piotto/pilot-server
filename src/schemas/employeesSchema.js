import Joi from "joi";

const employeeSchema =Joi.object({
    name: Joi.string().required(),
    wage: Joi.number().required(),
    startDate: Joi.date().required(),
    author: Joi.string().required(),
})

export default employeeSchema;