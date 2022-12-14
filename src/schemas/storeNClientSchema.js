import Joi from "joi";

const storeNClientSchema =Joi.object({
    name: Joi.string().required()
})

export default storeNClientSchema;