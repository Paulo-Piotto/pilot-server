import { Router } from "express";
import * as menuController from "../controllers/menuController.js";
import permissionsVerifierMiddleware from "../middlewares/permissionsVerifierMiddleware.js";

const menuRouter = Router();
const PATH = "/menu";

menuRouter.use((req, res, next) =>
  permissionsVerifierMiddleware(req, res, next, "basic")
);

menuRouter.get(PATH, menuController.getAll);

export default menuRouter;
