import { Router } from "express";
import * as punchCardController from "../controllers/punchCardController.js";
import * as PunchCardSchemas from "../schemas/punchCardSchema.js";
import permissionsVerifierMiddleware from "../middlewares/permissionsVerifierMiddleware.js";
import * as schemaValidationMiddleware from "../middlewares/schemaValidationMiddleware.js";

const punchCardRouter = Router();
const PATH = "/frequency"

punchCardRouter.use((req, res, next) => permissionsVerifierMiddleware(req, res, next, "admin"))

punchCardRouter.get(PATH, punchCardController.getPunchCards)
punchCardRouter.get(`${PATH}/clients`, punchCardController.getPunchCardsByClients)
punchCardRouter.get(`${PATH}/employees`, punchCardController.getPunchCardsByEmployees)

punchCardRouter.post(
    PATH,
    (req, res, next) => schemaValidationMiddleware.test(req, res, next, PunchCardSchemas.registerPunchCard),
    punchCardController.registerNewPunch)

punchCardRouter.delete(`${PATH}/:id`, punchCardController.removePunch)

export default punchCardRouter;