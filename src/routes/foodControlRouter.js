import { Router } from "express";
import * as foodControlController from "../controllers/foodControlController.js";
import permissionsVerifierMiddleware from "../middlewares/permissionsVerifierMiddleware.js";
import * as schemaValidationMiddleware from "../middlewares/schemaValidationMiddleware.js";
import {
  foodSchema,
  updateFoodSchema,
  cartSchema,
} from "../schemas/foodSchema.js";

const foodControlRouter = Router();
const PATH = "/employeesFood";

foodControlRouter.use((req, res, next) =>
  permissionsVerifierMiddleware(req, res, next, "basic")
);

foodControlRouter.post(
  `${PATH}`,
  (req, res, next) =>
    schemaValidationMiddleware.test(req, res, next, foodSchema),
  foodControlController.create
);
foodControlRouter.post(
  `${PATH}/cart`,
  (req, res, next) =>
    schemaValidationMiddleware.test(req, res, next, cartSchema),
  foodControlController.massCreate
);
foodControlRouter.get(PATH, foodControlController.getEmployeesFood);
foodControlRouter.put(
  `${PATH}`,
  (req, res, next) =>
    schemaValidationMiddleware.test(req, res, next, updateFoodSchema),
  foodControlController.update
);
foodControlRouter.delete(PATH, foodControlController.deleteFood);

export default foodControlRouter;
