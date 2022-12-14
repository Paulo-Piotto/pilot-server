import { Router } from "express";
import storesRouter from "./storesRouter.js";
import clientsRouter from "./clientsRouter.js";
import employeesRouter from "./employeesRouter.js";


const router = Router();

router.use(storesRouter);
router.use(clientsRouter);
router.use(employeesRouter);

export default router;