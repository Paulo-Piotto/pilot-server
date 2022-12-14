import { Router } from "express";
import * as employeesController from '../controllers/employeesController.js';
import * as schemaValidationMiddleware from '../middlewares/schemaValidationMiddleware.js';
import employeeSchema from "../schemas/employeesSchema.js";

const employeesRouter = Router();
const PATH = "/employees";

employeesRouter.post(`${PATH}`,
  (req, res, next) => schemaValidationMiddleware.test(req, res, next, employeeSchema),
  employeesController.post
);

employeesRouter.get(`${PATH}`,
employeesController.find
);

export default employeesRouter;