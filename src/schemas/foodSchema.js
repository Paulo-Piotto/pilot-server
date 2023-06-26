import Joi from "joi";

const foodSchema =Joi.object({
    type: Joi.string().required(),
    date: Joi.date().required(),
    employee: Joi.number().required(),
    value: Joi.number().required(),
    author: Joi.string().required(),
})

const updateFoodSchema =Joi.object({
  id: Joi.number().required(),
  type: Joi.string().required(),
  date: Joi.date().required(),
  employee: Joi.number().required(),
  value: Joi.number().required(),
  author: Joi.string().required(),
})

export { foodSchema, updateFoodSchema };