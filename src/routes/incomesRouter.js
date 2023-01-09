import { Router } from "express";
import * as incomesController from "../controllers/incomesController.js"
import * as schemaValidationMiddleware from '../middlewares/schemaValidationMiddleware.js';
import incomesSchema from "../schemas/incomesSchema.js";

const incomesRouter = Router();
const PATH = "/incomes";

incomesRouter.post(`${PATH}`,
  (req, res, next) => schemaValidationMiddleware.test(req, res, next, incomesSchema),
  incomesController.post
);

incomesRouter.get(`${PATH}`, 
  incomesController.find
);

incomesRouter.delete(`${PATH}`, 
  incomesController.deleteIncome
);

export default incomesRouter;