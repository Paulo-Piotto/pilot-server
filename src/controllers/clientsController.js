import * as clientsService from "../services/clientsService.js";
import { filterObjectFactory } from "./punchCardController.js";

async function post(req, res) {
  const result = await clientsService.create(req.body);
  return res.status(201).send(result);
}

async function find(req, res) {
  const filterObject = filterObjectFactory(req.query);

  const result = await clientsService.find(filterObject);
  return res.status(200).send(result);
}

async function deleteClient(req, res) {
  const deleteSettings = req.query;

  if (!deleteSettings.id) {
    throw { type: "unprocessable_entity", message: "ID is missing" };
  }

  const result = await clientsService.deleteClient(deleteSettings);
  return res.status(200).send(result);
}

async function update(req, res) {
  const updateData = req.body;
  const result = await clientsService.update(updateData);
  return res.status(200).send(result);
}

async function getBalance(req, res) {
  const filterObject = filterObjectFactory(req.query);
  const result = await clientsService.getBalance(filterObject);
  return res.status(200).send(result);
}

export { post, find, deleteClient, update, getBalance };
