import Joi from "joi";

const ordersSchema = Joi.object({
  invoice: Joi.string().required(),
  date: Joi.date().required(),
  store: Joi.number().required(),
  client: Joi.number().required(),
  value: Joi.number().required(),
  negotiated: Joi.any(),
  cash: Joi.number().required(),
  financed: Joi.number().required(),
  obs: Joi.string().min(0),
  author: Joi.string().required(),
});

const updateOrdersSchema = Joi.object({
  id: Joi.number().required(),
  invoice: Joi.string().required(),
  date: Joi.date().required(),
  store: Joi.number().required(),
  client: Joi.number().required(),
  value: Joi.number().required(),
  negotiated: Joi.any(),
  cash: Joi.number().required(),
  financed: Joi.number().required(),
  obs: Joi.string().min(0),
  author: Joi.string().required(),
});

const deleteManySchema = Joi.object({
  deleteSettings: Joi.array().items(Joi.number().min(1)),
});

export { ordersSchema, updateOrdersSchema, deleteManySchema };
