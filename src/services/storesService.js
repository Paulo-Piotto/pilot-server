import * as storesRepository from "../repositories/storesRepository.js";

async function create(newStore) {
  const alreadyExists = await storesRepository.find(newStore.name);
  if(alreadyExists[0]){
    throw { type: "conflict", message: "This store already exists" };
  }
  const result = await storesRepository.create(newStore);
  return result;
}

async function find(storeName) {
  const result = await storesRepository.find(storeName);
  if (!result[0]) {
    throw { type: "not_found", message: "store not found" };
  }
  return result;
}

async function findAll() {
  const result = await storesRepository.findAll();
  if (!result[0]) {
    throw { type: "not_found", message: "no records found" };
  }
  return result;
}

async function deleteStore(deleteSettings) {
  const doesntExists = await storesRepository.findById(Number(deleteSettings.id));
  if(!doesntExists){
    throw { type: "not_found", message: "This store doesn't exists" };
  }
  const result = await storesRepository.deleteStore(Number(deleteSettings.id));
  return result;
}

async function update(updateData) {
  const doesntExists = await storesRepository.findById(Number(updateData.id));
  if(!doesntExists){
    throw { type: "not_found", message: "This client doesn't exists" };
  }
  const result = await storesRepository.update(updateData);
  return result;
}

export { create, find, findAll, deleteStore, update };