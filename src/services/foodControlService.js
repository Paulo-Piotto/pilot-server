import * as foodControlRepository from "../repositories/foodControlRepository.js";
import * as employeesRepository from "../repositories/employeesRepository.js"

async function create(newFood){
  const exists = await employeesRepository.findById(
    Number(newFood.employee)
  );
  if (!exists) {
    throw { type: "not_found", message: "Esse funcionário não existe" };
  }
  const result = await foodControlRepository.create(newFood);
  return result;
}

async function getEmployeesFood(filterObject) {
  const employeesFood = await foodControlRepository.find(
    filterObject
  );
  return employeesFood;
}

async function update(updateFood){
  const exists = await foodControlRepository.findById(updateFood);
  const employeeExists = await employeesRepository.findById(
    Number(updateFood.employee)
  );
  if (!exists) {
    throw { type: "not_found", message: "Esse pedido não existe" };
  }
  if (!employeeExists) {
    throw { type: "not_found", message: "Esse funcionário não existe" };
  }
  const result = await foodControlRepository.update(updateFood);
  return result;
}

async function deleteFood(deleteSettings){
  deleteSettings.id = Number(deleteSettings.id);
  const exists = await foodControlRepository.findById(deleteSettings);
  if (!exists) {
    throw { type: "not_found", message: "Esse pedido não existe" };
  }
  const result = await foodControlRepository.deleteFood(deleteSettings);
  return result;
}

export { getEmployeesFood, create, update, deleteFood }