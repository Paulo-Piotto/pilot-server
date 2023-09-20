import { Router } from "express";
import storesRouter from "./storesRouter.js";
import clientsRouter from "./clientsRouter.js";
import employeesRouter from "./employeesRouter.js";
import ordersRouter from "./ordersRouter.js";
import usersRouter from "./usersRouter.js";
import incomesRouter from "./incomesRouter.js";
import punchCardRouter from "./punchCardRouter.js";
import workedDaysRouter from "./workedDaysRouter.js";
import foodControlRouter from "./foodControlRouter.js";
import menuRouter from "./menuRouter.js";
import loansRouter from "./loansRouter.js";

const router = Router();

router.use(storesRouter);
router.use(clientsRouter);
router.use(employeesRouter);
router.use(ordersRouter);
router.use(usersRouter);
router.use(incomesRouter);
router.use(punchCardRouter);
router.use(workedDaysRouter);
router.use(foodControlRouter);
router.use(menuRouter);
router.use(loansRouter);

export default router;
