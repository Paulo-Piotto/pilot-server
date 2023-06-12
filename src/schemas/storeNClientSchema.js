import Joi from "joi";

const storeNClientSchema = Joi.object({
  name: Joi.string().required(),
  author: Joi.string().required(),
  accountable: Joi.string().min(0),
  address: Joi.string().min(0),
  contact: Joi.string().min(0),
  document: Joi.string().min(0),
  projectNumber: Joi.string().min(0),
});

const updateStoreNClientSchema = Joi.object({
  id: Joi.number().min(1).required(),
  name: Joi.string().min(3).required(),
  author: Joi.string().required(),
  accountable: Joi.string().min(0),
  address: Joi.string().min(0),
  contact: Joi.string().min(0),
  document: Joi.string().min(0),
  projectNumber: Joi.string().min(0),
  isArchived: Joi.boolean(),
});

export { storeNClientSchema, updateStoreNClientSchema };
