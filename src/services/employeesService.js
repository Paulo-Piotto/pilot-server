import * as employeesRepository from "../repositories/employeesRepository.js";

async function create(newEmployee) {
  const alreadyExists = await employeesRepository.find(newEmployee.name);
  if (alreadyExists[0]) {
    throw { type: "conflict", message: "Esse funcionário já foi cadastrado" };
  }
  const result = await employeesRepository.create(newEmployee);
  return result;
}

async function find(employeeName) {
  const result = await employeesRepository.find(employeeName);
  return result;
}

async function findAll() {
  const result = await employeesRepository.findAll();
  return result;
}

async function deleteEmployee(deleteSettings) {
  const doesntExists = await employeesRepository.findById(
    Number(deleteSettings.id)
  );
  if (!doesntExists) {
    throw { type: "not_found", message: "Esse funcionário não existe" };
  }
  const result = await employeesRepository.deleteEmployee(
    Number(deleteSettings.id)
  );
  return result;
}

async function update(employeeData) {
  const doesntExists = await employeesRepository.findById(
    Number(employeeData.id)
  );
  if (!doesntExists) {
    throw { type: "not_found", message: "Esse funcionário não existe" };
  }
  const result = await employeesRepository.update(employeeData);
  return result;
}

export { create, find, findAll, deleteEmployee, update };
