import Joi from "joi";

const register = Joi.object({
    name: Joi.string().required(),
    roleName: Joi.string().min(1).required(),
    email: Joi.string().email({ tlds: { allow: false } }).required(),
    password: Joi.string().required(),
    passwordConfirmation: Joi.string().required()
})

const loginCredentials = Joi.object({
    email: Joi.string().required(),
    password: Joi.string().min(4).required()
})

const updateUserData = Joi.object({
    id: Joi.number().required(),
    name: Joi.string().min(4).required(),
    email: Joi.string().email({ tlds: { allow: false } }).required(),
    role: Joi.string().required()
})

export {
    loginCredentials,
    register,
    updateUserData
}