import Joi from "joi";

const usersSchema = Joi.object({
    name: Joi.string().required(),
    roleId: Joi.number().integer().min(1).required(),
    email: Joi.string().email({ tlds: { allow: false } }).required()
})

export default usersSchema;