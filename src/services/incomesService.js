import * as incomesRepository from "../repositories/incomesRepository.js"

async function create(newIncome) {
  const alreadyExists = await incomesRepository.findByName(newIncome.name);
  if(alreadyExists[0]){
    throw { type: "conflict", message: "This order already exists" };
  }
  const result = await incomesRepository.create(newIncome);
  return result;
}

async function find(searchSettings) {
    if(searchSettings.client && searchSettings.client !== '0'){
        searchSettings.clientMin = Number(searchSettings.client);
        searchSettings.clientMax = Number(searchSettings.client);
  }else{
    searchSettings.clientMin = 0;
    searchSettings.clientMax = 10000000;
  }

  const result = await incomesRepository.find(searchSettings);
  return result;
}

async function deleteIncome(deleteSettings) {
  const doesntExists = await incomesRepository.findById(Number(deleteSettings.id));
  if(!doesntExists){
    throw { type: "not_found", message: "This order doesn't exists" };
  }
  const result = await incomesRepository.deleteIncome(Number(deleteSettings.id));
  return result;
}

export { create, find, deleteIncome };

