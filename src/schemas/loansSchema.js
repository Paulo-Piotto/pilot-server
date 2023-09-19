import Joi from "joi";

const loanSchema = Joi.object({
  date: Joi.date().required(),
  employee: Joi.number().required(),
  value: Joi.number().required(),
  obs: Joi.string().min(0),
  author: Joi.string().required(),
});

const updateLoanSchema = Joi.object({
  id: Joi.number().required(),
  date: Joi.date().required(),
  employee: Joi.number().required(),
  value: Joi.number().required(),
  obs: Joi.string().min(0),
  author: Joi.string().required(),
});

const deleteManySchema = Joi.object({
  deleteSettings: Joi.array().items(Joi.number().min(1)),
});

export { loanSchema, updateLoanSchema, deleteManySchema };
