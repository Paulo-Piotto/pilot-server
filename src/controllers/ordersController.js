import * as ordersService from "../services/ordersService.js";

async function post(req, res) {
  const result = await ordersService.create(req.body);
  return res.status(201).send(result);
}

async function find(req, res) {
  const searchSettings = req.query;

  const result = await ordersService.find(searchSettings);
  return res.status(200).send(result);
}

async function deleteOrder(req, res) {
  const deleteSettings = req.query;

  if (!deleteSettings.id) {
    throw { type: "unprocessable_entity", message: "ID is missing" };
  }

  const result = await ordersService.deleteOrder(deleteSettings);
  return res.status(200).send(result);
}

async function update(req, res) {
  const result = await ordersService.update(req.body);
  return res.status(201).send(result);
}

export { post, find, deleteOrder, update };
