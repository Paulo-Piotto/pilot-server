import * as ordersService from "../services/ordersService.js";

async function post(req, res) {
  const result = await ordersService.create(req.body);
  return res.status(201).send(result);
}

async function find(req, res) {
  const searchSettings = req.query;
  let result = false;
  if (!searchSettings.order || searchSettings.order === "undefined") {
    result = await ordersService.find(searchSettings);
  } else {
    result = await ordersService.findOrder(searchSettings);
  }
  return res.status(200).send(result);
}

async function deleteOrder(req, res) {
  const deleteSettings = req.query;

  if (!deleteSettings.id) {
    throw { type: "unprocessable_entity", message: "ID não encontrado" };
  }

  const result = await ordersService.deleteOrder(deleteSettings);
  return res.status(200).send(result);
}

async function deleteMany(req, res) {
  const { deleteSettings } = req.body;
  const result = await ordersService.deleteMany(deleteSettings);
  return res.status(200).send(result);
}

async function update(req, res) {
  const result = await ordersService.update(req.body);
  return res.status(201).send(result);
}

export { post, find, deleteOrder, update, deleteMany };
