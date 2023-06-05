import { Router } from "express";
import storesRouter from "./storesRouter.js";
import clientsRouter from "./clientsRouter.js";
import employeesRouter from "./employeesRouter.js";
import ordersRouter from "./ordersRouter.js";
import usersRouter from "./usersRouter.js";
import incomesRouter from "./incomesRouter.js";
import punchCardRouter from "./punchCardRouter.js";
import workedDaysRouter from "./workedDaysRouter.js";

const router = Router();

router.use(storesRouter);
router.use(clientsRouter);
router.use(employeesRouter);
router.use(ordersRouter);
router.use(usersRouter);
router.use(incomesRouter);
router.use(punchCardRouter);
router.use(workedDaysRouter);

export default router;
