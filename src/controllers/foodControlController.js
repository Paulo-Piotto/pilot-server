import * as foodControlService from "../services/foodControlService.js";
import { filterObjectFactory } from "./punchCardController.js";

async function create(req, res) {
  const newFood = req.body;
  const result = await foodControlService.create(newFood);
  return res.send(result);
}

async function massCreate(req, res) {
  const order = req.body;
  const processedOrder = await foodControlService.createMany(order);
  return res.send(processedOrder);
}

async function getEmployeesFood(req, res) {
  const filterObject = filterObjectFactory(req.query);
  const employeesFood = await foodControlService.getEmployeesFood(filterObject);
  return res.send(employeesFood);
}

async function update(req, res) {
  const updateFood = req.body;
  const result = await foodControlService.update(updateFood);
  return res.send(result);
}

async function deleteFood(req, res) {
  const deleteSettings = req.query;

  if (!deleteSettings.id) {
    throw { type: "unprocessable_entity", message: "ID não encontrado" };
  }

  const result = await foodControlService.deleteFood(deleteSettings);
  return res.send(result);
}

export { getEmployeesFood, create, update, deleteFood, massCreate };
