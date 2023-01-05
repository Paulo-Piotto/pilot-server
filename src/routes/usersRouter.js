import { Router } from "express";
import * as schemaValidationMiddleware from '../middlewares/schemaValidationMiddleware.js';
import usersSchema from "../schemas/usersSchema.js";
import * as usersController from "../controllers/usersController.js";

const usersRouter = Router();
const PATH = "/users";

usersRouter.post(PATH,
    (req, res, next) => schemaValidationMiddleware.test(req, res, next, usersSchema),
    usersController.registerNewUser
)

export default usersRouter;