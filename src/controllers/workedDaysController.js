import * as workedDaysService from "../services/workedDaysService.js";
import { filterObjectFactory } from "./punchCardController.js";

async function getNonNullsWorkedDays(req, res) {
  const filterObject = filterObjectFactory(req.query);
  const workedDays = await workedDaysService.getNonNullsWorkedDays(
    filterObject
  );
  return res.send(workedDays);
}

async function getWorkingDays(req, res) {
  const filterObject = filterObjectFactory(req.query);
  const workingDays = await workedDaysService.getWorkingdDays(filterObject);
  return res.send(workingDays);
}

async function getWorkedDaysByClient(req, res) {
  const filterObject = filterObjectFactory(req.query);
  const workedDays = await workedDaysService.getWorkedDaysByClient(
    filterObject
  );
  return res.send(workedDays);
}

export { getNonNullsWorkedDays, getWorkingDays, getWorkedDaysByClient };
