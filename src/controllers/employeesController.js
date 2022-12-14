import * as employeesService from '../services/employeesService.js';

async function post(req, res) {
  const result = await employeesService.create(req.body);
  return res.status(201).send(result);
}

async function find(req, res) {
  const name = req.query.name
  if(name){
    const result = await employeesService.find(name);
    return res.status(200).send(result);
  }
  const result = await employeesService.findAll();
  return res.status(200).send(result);
}

export { post, find };