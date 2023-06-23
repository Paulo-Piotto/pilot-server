import * as clientsRepository from "../repositories/clientsRepository.js";
import * as workedDaysRepository from "../repositories/workedDaysRepository.js";
import {
  sumEmployeeWorkedDays,
  expenseCalculate,
  totalExpenseCalculate,
} from "./utils/sumWorkedDays.js";

async function create(newClient) {
  const client = {
    client: newClient.name,
    author: newClient.author,
    date: {
      from: undefined,
      to: undefined,
    },
  };
  const alreadyExists = await clientsRepository.find(client);
  if (alreadyExists[0]) {
    throw { type: "conflict", message: "Essa obra já foi cadastrada" };
  }
  const result = await clientsRepository.create(newClient);
  return result;
}

async function find(filterObject) {
  filterObject.includeArchived === "false"
    ? (filterObject.includeArchived = false)
    : (filterObject.includeArchived = true);
  const result = await clientsRepository.find(filterObject);
  if (!result[0]) {
    throw { type: "not_found", message: "Obra não encontrada" };
  }
  const filteredData = sumEmployeeWorkedDays(result);
  const workingDays = await workedDaysRepository.getWorkingDays(filterObject);
  const dataWithWorkersExpense = expenseCalculate(filteredData, workingDays);
  return totalExpenseCalculate(dataWithWorkersExpense);
}

async function deleteClient(deleteSettings) {
  const doesntExists = await clientsRepository.findById(
    Number(deleteSettings.id)
  );
  if (!doesntExists) {
    throw { type: "not_found", message: "Essa obra não existe" };
  }
  const result = await clientsRepository.deleteClient(
    Number(deleteSettings.id)
  );
  return result;
}

async function update(updateData) {
  const doesntExists = await clientsRepository.findById(Number(updateData.id));
  if (!doesntExists) {
    throw { type: "not_found", message: "Essa obra não existe" };
  }
  const result = await clientsRepository.update(updateData);
  return result;
}

async function getBalance(filterObject) {
  const result = await clientsRepository.getBalance(filterObject);
  const filteredData = sumEmployeeWorkedDays(result);
  const workingDays = await workedDaysRepository.getWorkingDays(filterObject);
  const dataWithWorkersExpense = expenseCalculate(filteredData, workingDays);
  return totalExpenseCalculate(dataWithWorkersExpense);
}

export { create, find, deleteClient, update, getBalance };
