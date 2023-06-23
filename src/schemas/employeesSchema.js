import Joi from "joi";

const employeeSchema = Joi.object({
  name: Joi.string().required(),
  wage: Joi.number().required(),
  startDate: Joi.date().required(),
  fullname: Joi.string().min(0),
  address: Joi.string().min(0),
  contact: Joi.string().min(0),
  document: Joi.string().min(0),
  pix: Joi.string().min(0),
  obs: Joi.string().min(0),
  author: Joi.string().required(),
});

const employeeUpdateSchema = Joi.object({
  name: Joi.string().required(),
  wage: Joi.number().required(),
  startDate: Joi.date().required(),
  fullname: Joi.string().min(0),
  address: Joi.string().min(0),
  contact: Joi.string().min(0),
  document: Joi.string().min(0),
  pix: Joi.string().min(0),
  obs: Joi.string().min(0),
  author: Joi.string().required(),
  id: Joi.number().min(1).required(),
});

export { employeeSchema, employeeUpdateSchema };
