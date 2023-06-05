import * as workedDaysRepository from "../repositories/workedDaysRepository.js";

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

export { getNonNullsWorkedDays, getWorkingdDays };
