import Joi from "joi";

export const registerPunchCard = Joi.object({
    employeeId: Joi.number().required(),
    clientId: Joi.number().required(),
    date: Joi.date().max("now")
})

export const filterWorkedDaysObject = Joi.object({
    client: Joi.string(),
    from: Joi.string(),
    to: Joi.string()
})

export const massActionConfig = Joi.object({
    isPresence: Joi.boolean().required(),
    clientId: Joi.number().required(),
    selectedEmployeesIds: Joi.array().required()
})