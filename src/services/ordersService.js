import * as ordersRepository from "../repositories/ordersRepository.js"
import orderSearchSchema from "../schemas/orderSearchSchema.js";

async function create(newOrder) {
  const alreadyExists = await ordersRepository.findByInvoice(newOrder.invoice);
  if(alreadyExists[0]){
    throw { type: "conflict", message: "This order already exists" };
  }
  const result = await ordersRepository.create(newOrder);
  return result;
}


async function findAll() {
  const result = await ordersRepository.findAll();
  return result;
}

async function find(searchSettings) {
  const { error } = orderSearchSchema.validate(searchSettings);

  if(error){
    const { message } = error.details[0];
    throw { type: "unprocessable_entity", message };
  }

  if(searchSettings.store && searchSettings.store !== '0'){
    searchSettings.storeMin = Number(searchSettings.store);
    searchSettings.storeMax = Number(searchSettings.store);
  }else{
    searchSettings.storeMin = 0;
    searchSettings.storeMax = 10000000;
  }

  if(searchSettings.client && searchSettings.client !== '0'){
    searchSettings.clientMin = Number(searchSettings.client);
    searchSettings.clientMax = Number(searchSettings.client);
  }else{
    searchSettings.clientMin = 0;
    searchSettings.clientMax = 10000000;
  }

  const result = await ordersRepository.find(searchSettings);
  if (!result[0]) {
    throw { type: "not_found", message: "no records found" };
  }
  return result;
}

async function deleteOrder(deleteSettings) {
  const doesntExists = await ordersRepository.findById(Number(deleteSettings.id));
  if(!doesntExists){
    throw { type: "not_found", message: "This order doesn't exists" };
  }
  const result = await ordersRepository.deleteOrder(Number(deleteSettings.id));
  return result;
}

export { create, findAll, find, deleteOrder };

