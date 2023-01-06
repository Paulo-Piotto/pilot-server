import Joi from "joi";

const register = Joi.object({
    name: Joi.string().required(),
    roleId: Joi.number().integer().min(1).required(),
    email: Joi.string().email({ tlds: { allow: false } }).required(),
    password: Joi.string().required()
})

const loginCredentials = Joi.object({
    email: Joi.string().required(),
    password: Joi.string().required()
})

export {
    loginCredentials,
    register
}