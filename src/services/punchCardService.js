import * as punchCardRepository from "../repositories/punchCardRepository.js";
import { findById as findClientById } from "../repositories/clientsRepository.js";
import { findById as findEmployeeById } from "../repositories/employeesRepository.js";

function filterFactory(filter) {
  let dateFilter = { date: {} };
  let clientFilter = {};

  if (filter.client) clientFilter = { clients: { name: filter.client } };

  if (filter.date.from) dateFilter.date.gte = new Date(filter.date.from);
  else dateFilter.date.gte = new Date("1970").toISOString();

  if (filter.date.to) dateFilter.date.lte = new Date(filter.date.to);
  else dateFilter.date.lte = new Date().toISOString();

  return {
    where: {
      employees_worked_days: {
        some: { ...dateFilter, ...clientFilter },
      },
      isArchived: false,
    },
  };
}

async function getPunchCardsData() {
  const punchCardsData = await punchCardRepository.getAllPunchCardsData();
  return punchCardsData;
}

async function getPunchCardsByEmployees(filterObject) {
  const punchCardsByEmployees =
    await punchCardRepository.getPunchCardsByEmployees(
      filterFactory(filterObject)
    );
  return punchCardsByEmployees;
}

async function getPunchCardsByClients(filterObject) {
  const filterObjectWithoutClientParam = filterFactory(filterObject);
  delete filterObjectWithoutClientParam.where.employees_worked_days.some
    .clients;

  const punchCardsByClients = await punchCardRepository.getPunchCardsByClients(
    filterObjectWithoutClientParam
  );

  return punchCardsByClients.map((byClient) => ({
    id: byClient.id,
    name: byClient.name,
    workedDaysAmount: byClient["_count"].employees_worked_days,
  }));
}

async function registerPunch(punchData) {
  const { clientId, employeeId } = punchData;

  const [registeredClient, registeredEmployee] = await Promise.all([
    findClientById(clientId),
    findEmployeeById(employeeId),
  ]);
  if (!registeredClient || !registeredEmployee)
    throw {
      type: "unprocessable_entity",
      message: "Cliente ou funcionário desconhecidos",
    };

  const registeredPunch = await punchCardRepository.createPunch(punchData);
  return registeredPunch;
}

async function deletePunch(punchId) {
  const deletedPunch = await punchCardRepository.deletePunch(punchId);
  return deletedPunch;
}

async function getEmployeesWithEmptyPunchCard() {
  const emptyPunchs = await punchCardRepository.getEmptyPunchCardsByEmployees();
  return emptyPunchs.map((punchData) => ({
    ...punchData,
    employees_worked_days: [],
  }));
}

async function massAction(massActionConfig) {
  const massData = massActionConfig.filteredValidEmployeesIds.map((employeeId) => ({
    employee_id: Number(employeeId),
    client_id: Number(massActionConfig.clientId),
    date: new Date(massActionConfig.date).toISOString(),
  }));

  if (massActionConfig.isPresence) {
    const createdPunchs = await punchCardRepository.massPunchRegistration(
      massData
    );
    return createdPunchs;
  }

  const dateRangeFrom = new Date(massActionConfig.date);
  dateRangeFrom.setHours(0, 0, 0);

  const dateRangeTo = new Date(dateRangeFrom);
  dateRangeTo.setHours(23, 59, 59);

  massActionConfig.dateRange = [dateRangeFrom, dateRangeTo];
  const deletedPunchs = await punchCardRepository.massPunchDelete(
    massActionConfig
  );

  return deletedPunchs;
}

export {
  getPunchCardsData,
  getPunchCardsByEmployees,
  getPunchCardsByClients,
  registerPunch,
  deletePunch,
  massAction,
  getEmployeesWithEmptyPunchCard,
};
