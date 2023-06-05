import * as employeesService from '../services/employeesService.js';

async function post(req, res) {
  const result = await employeesService.create(req.body);
  return res.status(201).send(result);
}

async function find(req, res) {
  const name = req.query.name
  const result = await employeesService.find(name);
  return res.status(200).send(result);
}

async function deleteEmployee(req, res){
  const deleteSettings = req.query;

  if(!deleteSettings.id){
    throw { type: "unprocessable_entity", message: "ID is missing" };
  }

  const result = await employeesService.deleteEmployee(deleteSettings);
  return res.status(200).send(result);
}

export { post, find, deleteEmployee };