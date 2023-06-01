import { Router } from "express";
import * as workedDaysController from "../controllers/workedDaysController.js";
import * as PunchCardSchemas from "../schemas/punchCardSchema.js";
import permissionsVerifierMiddleware from "../middlewares/permissionsVerifierMiddleware.js";
import * as schemaValidationMiddleware from "../middlewares/schemaValidationMiddleware.js";

const workedDaysRouter = Router();
const PATH = "/workedDays";

workedDaysRouter.use((req, res, next) =>
  permissionsVerifierMiddleware(req, res, next, "admin")
);

workedDaysRouter.get(PATH, workedDaysController.getNonNullsWorkedDays);
workedDaysRouter.get(
  `${PATH}/workingDays`,
  workedDaysController.getWorkingDays
);

export default workedDaysRouter;
