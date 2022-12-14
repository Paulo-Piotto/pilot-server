import * as employeesRepository from '../repositories/employeesRepository.js'

async function create(newEmployee) {
  const alreadyExists = await employeesRepository.find(newEmployee.name);
  if(alreadyExists[0]){
    throw { type: "conflict", message: "This employee already exists" };
  }
  const result = await employeesRepository.create(newEmployee);
  return result;
}

async function find(employeeName) {
  const result = await employeesRepository.find(employeeName);
  if (!result[0]) {
    throw { type: "not_found", message: "employee not found" };
  }
  return result;
}

async function findAll() {
  const result = await employeesRepository.findAll();
  if (!result[0]) {
    throw { type: "not_found", message: "no records found" };
  }
  return result;
}

export { create, find, findAll };