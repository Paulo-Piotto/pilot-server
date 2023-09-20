import { Router } from "express";
import * as loansController from "../controllers/loansController.js";
import * as schemaValidationMiddleware from "../middlewares/schemaValidationMiddleware.js";
import {
  loanSchema,
  updateLoanSchema,
  deleteManySchema,
} from "../schemas/loansSchema.js";

const loansRouter = Router();
const PATH = "/loans";

loansRouter.post(
  `${PATH}`,
  (req, res, next) =>
    schemaValidationMiddleware.test(req, res, next, loanSchema),
  loansController.post
);

export default loansRouter;
