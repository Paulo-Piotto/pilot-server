import Joi from "joi";

const storeNClientSchema =Joi.object({
    name: Joi.string().required(),
    author: Joi.string().required()
})

const updateStoreNClientSchema = Joi.object({
    id: Joi.number().min(1).required(),
    name: Joi.string().min(3).required(),
    author: Joi.string().required(),
})

export  { storeNClientSchema, updateStoreNClientSchema};