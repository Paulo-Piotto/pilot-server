import * as clientsService from "../services/clientsService.js"

async function post(req, res) {
  const result = await clientsService.create(req.body);
  return res.status(201).send(result);
}

async function find(req, res) {
  const searchSettings = req.query
  if(searchSettings.name || searchSettings.initialDate && searchSettings.endDate){
    const result = await clientsService.find(searchSettings);
    return res.status(200).send(result);
  }
  const result = await clientsService.find({name: ''});
  return res.status(200).send(result);
}

async function deleteClient(req, res){
  const deleteSettings = req.query;

  if(!deleteSettings.id){
    throw { type: "unprocessable_entity", message: "ID is missing" };
  }

  const result = await clientsService.deleteClient(deleteSettings);
  return res.status(200).send(result);
}

async function update(req, res){
  const updateData = req.body;
  const result = await clientsService.update(updateData);
  return res.status(200).send(result);
}

async function getBalance(req, res){
  const searchSettings = req.query;
  const result = await clientsService.getBalance(searchSettings);
  return res.status(200).send(result);
}

export { post, find, deleteClient, update, getBalance };