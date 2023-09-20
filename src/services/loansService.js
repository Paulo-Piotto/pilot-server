import * as loansRepository from "../repositories/loansRepository.js";

async function create(loanData) {
  const result = await loansRepository.create(loanData);
  return result;
}

export { create };
