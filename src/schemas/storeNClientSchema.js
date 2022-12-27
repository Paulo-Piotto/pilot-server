import Joi from "joi";

const storeNClientSchema =Joi.object({
    name: Joi.string().required()
})

const updateStoreNClientSchema = Joi.object({
    id: Joi.number().min(1).required(),
    name: Joi.string().min(3).required(),
})

export  { storeNClientSchema, updateStoreNClientSchema};