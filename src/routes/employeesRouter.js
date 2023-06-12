import { Router } from "express";
import * as employeesController from "../controllers/employeesController.js";
import * as schemaValidationMiddleware from "../middlewares/schemaValidationMiddleware.js";
import {
  employeeSchema,
  employeeUpdateSchema,
} from "../schemas/employeesSchema.js";

const employeesRouter = Router();
const PATH = "/employees";

employeesRouter.post(
  `${PATH}`,
  (req, res, next) =>
    schemaValidationMiddleware.test(req, res, next, employeeSchema),
  employeesController.post
);

employeesRouter.put(
  `${PATH}`,
  (req, res, next) =>
    schemaValidationMiddleware.test(req, res, next, employeeUpdateSchema),
  employeesController.update
);

employeesRouter.get(`${PATH}`, employeesController.find);

employeesRouter.delete(`${PATH}`, employeesController.deleteEmployee);

export default employeesRouter;
