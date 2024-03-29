import { Router } from "express";
import * as punchCardController from "../controllers/punchCardController.js";
import * as PunchCardSchemas from "../schemas/punchCardSchema.js";
import permissionsVerifierMiddleware from "../middlewares/permissionsVerifierMiddleware.js";
import * as schemaValidationMiddleware from "../middlewares/schemaValidationMiddleware.js";
import filterAvailableDates from "../middlewares/punchRegistrationDateValidator.js";

const punchCardRouter = Router();
const PATH = "/frequency"

punchCardRouter.use((req, res, next) => permissionsVerifierMiddleware(req, res, next, "admin"))

punchCardRouter.get(PATH, punchCardController.getPunchCards)
punchCardRouter.get(`${PATH}/clients`, punchCardController.getPunchCardsByClients)
punchCardRouter.get(`${PATH}/employees`, punchCardController.getPunchCardsByEmployees)
punchCardRouter.get(`${PATH}/empty`, punchCardController.getEmptyPunchCards)

punchCardRouter.delete(`${PATH}/:id`, punchCardController.removePunch)

punchCardRouter.post(
    PATH,
    (req, res, next) => schemaValidationMiddleware.test(req, res, next, PunchCardSchemas.registerPunchCard),
    punchCardController.registerNewPunch)

punchCardRouter.post(
    `${PATH}/massaction`,
    (req, res, next) => schemaValidationMiddleware.test(req, res, next, PunchCardSchemas.massActionConfig),
    (req, res, next) => filterAvailableDates(req, res, next),
    punchCardController.performMassAction
)

export default punchCardRouter;