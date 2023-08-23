import Joi from "joi";

const foodSchema = Joi.object({
  type: Joi.string().required(),
  date: Joi.date().required(),
  employee: Joi.number().required(),
  value: Joi.number().required(),
  author: Joi.string().required(),
});

const cartSchema = Joi.object({
  date: Joi.date().required(),
  author: Joi.string().required(),
  cart: Joi.array().items(
    Joi.object({
      employee: Joi.object({
        id: Joi.number().required(),
        name: Joi.string().required(),
      }),
      location: Joi.object({
        id: Joi.number().required(),
        name: Joi.string().required(),
        address: Joi.string().required(),
      }),
      item: {
        id: Joi.number(),
        name: Joi.string().required(),
        value: Joi.number().required(),
        sub: Joi.string().min(0),
        description: Joi.string().min(0),
        img: Joi.string().min(0),
        variation: Joi.string().min(0),
      },
    })
  ),
});

const updateFoodSchema = Joi.object({
  id: Joi.number().required(),
  type: Joi.string().required(),
  date: Joi.date().required(),
  employee: Joi.number().required(),
  value: Joi.number().required(),
  author: Joi.string().required(),
});

export { foodSchema, updateFoodSchema, cartSchema };
