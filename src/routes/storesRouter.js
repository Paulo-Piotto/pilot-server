import { Router } from "express";
import * as storesController from "../controllers/storesController.js";
import * as schemaValidationMiddleware from '../middlewares/schemaValidationMiddleware.js'
import storeNClientSchema from "../schemas/storeNClientSchema.js";

const storeRouter = Router();
const PATH = "/stores";

storeRouter.post(`${PATH}`,
  (req, res, next) => schemaValidationMiddleware.test(req, res, next, storeNClientSchema),
  storesController.post
);

storeRouter.get(`${PATH}`,
  storesController.find
);

storeRouter.delete(`${PATH}`,
  storesController.deleteStore
);

export default storeRouter;