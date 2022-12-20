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

async function deleteEmployee(deleteSettings) {
  const doesntExists = await employeesRepository.findById(Number(deleteSettings.id));
  if(!doesntExists){
    throw { type: "not_found", message: "This employee doesn't exists" };
  }
  const result = await employeesRepository.deleteEmployee(Number(deleteSettings.id));
  return result;
}

export { create, find, findAll, deleteEmployee };