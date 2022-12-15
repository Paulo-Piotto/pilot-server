import * as ordersRepository from "../repositories/ordersRepository.js"

async function create(newOrder) {
  const alreadyExists = await ordersRepository.find(newOrder.invoice);
  if(alreadyExists[0]){
    throw { type: "conflict", message: "This order already exists" };
  }
  const result = await ordersRepository.create(newOrder);
  return result;
}


async function findAll() {
  const result = await ordersRepository.findAll();
  if (!result[0]) {
    throw { type: "not_found", message: "no records found" };
  }
  return result;
}

export { create, findAll };

