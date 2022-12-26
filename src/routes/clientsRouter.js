import { Router } from "express";
import * as clientsController from '../controllers/clientsController.js'
import * as schemaValidationMiddleware from '../middlewares/schemaValidationMiddleware.js'
import {storeNClientSchema, updateStoreNClientSchema} from "../schemas/storeNClientSchema.js";

const clientsRouter = Router();
const PATH = "/clients";

clientsRouter.post(`${PATH}`,
  (req, res, next) => schemaValidationMiddleware.test(req, res, next, storeNClientSchema),
  clientsController.post
);

clientsRouter.get(`${PATH}`,
  clientsController.find
);

clientsRouter.delete(`${PATH}`,
  clientsController.deleteClient
);

clientsRouter.put(`${PATH}`,
  (req, res, next) => schemaValidationMiddleware.test(req, res, next, updateStoreNClientSchema),
  clientsController.update
);

export default clientsRouter;