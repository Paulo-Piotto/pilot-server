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
  return result;
}

async function deleteClient(deleteSettings) {
  const doesntExists = await clientsRepository.findById(Number(deleteSettings.id));
  if(!doesntExists){
    throw { type: "not_found", message: "This client doesn't exists" };
  }
  const result = await clientsRepository.deleteClient(Number(deleteSettings.id));
  return result;
}

async function update(updateData) {
  const doesntExists = await clientsRepository.findById(Number(updateData.id));
  if(!doesntExists){
    throw { type: "not_found", message: "This client doesn't exists" };
  }
  const result = await clientsRepository.update(updateData);
  return result;
}

export { create, find, findAll, deleteClient, update };