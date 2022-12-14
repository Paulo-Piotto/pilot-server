import * as clientsRepository from '../repositories/clientsRepository.js';

async function create(newClient) {
  const alreadyExists = await clientsRepository.find(newClient.name);
  if(alreadyExists[0]){
    throw { type: "conflict", message: "This client already exists" };
  }
  const result = await clientsRepository.create(newClient);
  return result;
}

async function find(clientName) {
  const result = await clientsRepository.find(clientName);
  if (!result[0]) {
    throw { type: "not_found", message: "client not found" };
  }
  return result;
}

async function findAll() {
  const result = await clientsRepository.findAll();
  if (!result[0]) {
    throw { type: "not_found", message: "no records found" };
  }
  return result;
}

export { create, find, findAll };