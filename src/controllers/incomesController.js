import * as incomesService from "../services/incomesService.js"

async function post(req, res) {
  const result = await incomesService.create(req.body);
  return res.status(201).send(result);
}

async function find(req, res){
  const searchSettings = req.query;

  const result = await incomesService.find(searchSettings);
  return res.status(200).send(result);
}

async function deleteIncome(req, res){
  const deleteSettings = req.query;

  if(!deleteSettings.id){
    throw { type: "unprocessable_entity", message: "ID is missing" };
  }

  const result = await incomesService.deleteIncome(deleteSettings);
  return res.status(200).send(result);
}

export { post, find, deleteIncome };