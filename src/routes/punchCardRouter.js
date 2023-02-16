import { Router } from "express";
import * as punchCardController from "../controllers/punchCardController.js";

const punchCardRouter = Router();
const PATH = "/frequency"

punchCardRouter.get(PATH, punchCardController.getPunchCards)
punchCardRouter.get(`${PATH}/clients`, punchCardController.getPunchCardsByClients)
punchCardRouter.get(`${PATH}/employees`, punchCardController.getPunchCardsByEmployees)

export default punchCardRouter;