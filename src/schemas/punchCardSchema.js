import Joi from "joi";

export const registerPunchCard = Joi.object({
    employeeId: Joi.number().required(),
    clientId: Joi.number().required(),
    date: Joi.date().max("now")
})

