import { Router } from "express";
import storesRouter from "./storesRouter.js";
import clientsRouter from "./clientsRouter.js";
import employeesRouter from "./employeesRouter.js";
import ordersRouter from "./ordersRouter.js";
import incomesRouter from "./incomesRouter.js";


const router = Router();

router.use(storesRouter);
router.use(clientsRouter);
router.use(employeesRouter);
router.use(ordersRouter);
router.use(incomesRouter);

export default router;