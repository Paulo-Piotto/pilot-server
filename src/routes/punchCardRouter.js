import { Router } from "express";
import * as punchCardController from "../controllers/punchCardController.js";

const punchCardRouter = Router();
const PATH = "/frequency"

punchCardRouter.get(PATH, punchCardController.getPunchCards)

export default punchCardRouter;