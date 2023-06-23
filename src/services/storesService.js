import * as storesRepository from "../repositories/storesRepository.js";

async function create(newStore) {
  const alreadyExists = await storesRepository.find(newStore.name);
  if(alreadyExists[0]){
    throw { type: "conflict", message: "Esse fornecedor já foi cadastrado" };
  }
  const result = await storesRepository.create(newStore);
  return result;
}

async function find(storeName) {
  const result = await storesRepository.find(storeName);
  if (!result[0]) {
    throw { type: "not_found", message: "Fornecedor não encontrado" };
  }
  return result;
}

async function findAll() {
  const result = await storesRepository.findAll();
  return result;
}

async function deleteStore(deleteSettings) {
  const doesntExists = await storesRepository.findById(Number(deleteSettings.id));
  if(!doesntExists){
    throw { type: "not_found", message: "Esse fornecedor não existe" };
  }
  const result = await storesRepository.deleteStore(Number(deleteSettings.id));
  return result;
}

async function update(updateData) {
  const doesntExists = await storesRepository.findById(Number(updateData.id));
  if(!doesntExists){
    throw { type: "not_found", message: "Esse fornecedor não existe" };
  }
  const result = await storesRepository.update(updateData);
  return result;
}

export { create, find, findAll, deleteStore, update };