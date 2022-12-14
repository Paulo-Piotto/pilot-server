import * as clientsService from "../services/clientsService.js"

async function post(req, res) {
  const result = await clientsService.create(req.body);
  return res.status(201).send(result);
}

async function find(req, res) {
  const name = req.query.name
  if(name){
    const result = await clientsService.find(name);
    return res.status(200).send(result);
  }
  const result = await clientsService.findAll();
  return res.status(200).send(result);
}

export { post, find };