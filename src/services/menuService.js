import * as menuRepository from "../repositories/menuRepository.js";

async function getAll() {
  const result = await menuRepository.getAll();
  return result;
}

export { getAll };
