import Joi from "joi";

const orderSearchSchema = Joi.object({
  initialDate: Joi.string(),
  endDate: Joi.string(),
  client: Joi.string(),
  store: Joi.string(),
  order: Joi.string().min(0),
});

export default orderSearchSchema;
