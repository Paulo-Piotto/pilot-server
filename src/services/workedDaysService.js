import * as workedDaysRepository from "../repositories/workedDaysRepository.js";
import {
  sumEmployeeWorkedDays,
  expenseCalculate,
  totalExpenseCalculate,
} from "./utils/sumWorkedDays.js";

async function getNonNullsWorkedDays(filterObject) {
  const workedDays = await workedDaysRepository.getNonNullsWorkedDays(
    filterObject
  );
  return workedDays;
}

async function getWorkingdDays(filterObject) {
  const workingDays = await workedDaysRepository.getWorkingDays(filterObject);
  return workingDays;
}

async function getWorkedDaysByClient(filterObject) {
  const workedDays = await workedDaysRepository.getWorkedDaysByClient(
    filterObject
  );
  const filteredData = sumEmployeeWorkedDays(workedDays);
  const workingDays = await workedDaysRepository.getWorkingDays(filterObject);
  const dataWithWorkersExpense = expenseCalculate(filteredData, workingDays);

  return totalExpenseCalculate(dataWithWorkersExpense);
}

export { getNonNullsWorkedDays, getWorkingdDays, getWorkedDaysByClient };
