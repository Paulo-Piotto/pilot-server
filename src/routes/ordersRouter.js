import { Router } from "express";
import * as ordersController from "../controllers/ordersController.js"
import * as schemaValidationMiddleware from '../middlewares/schemaValidationMiddleware.js';
import ordersSchema from "../schemas/ordersSchema.js";

const ordersRouter = Router();
const PATH = "/orders";

ordersRouter.post(`${PATH}`,
  (req, res, next) => schemaValidationMiddleware.test(req, res, next, ordersSchema),
  ordersController.post
);

ordersRouter.get(`${PATH}`,
ordersController.findAll
);

export default ordersRouter;