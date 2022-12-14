import Joi from "joi";

const employeeSchema =Joi.object({
    name: Joi.string().required(),
    wage: Joi.number().required(),
    startDate: Joi.date().less('now').required(),
})

export default employeeSchema;