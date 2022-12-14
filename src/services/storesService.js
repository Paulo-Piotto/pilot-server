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

export { create, find, findAll };