import * as punchCardService from "../services/punchCardService.js";

function filterObjectFactory(query) {
  const { from, to, client, employee, includeArchived, type } = query;
  return {
    includeArchived,
    employee,
    type,
    client,
    date: {
      from,
      to,
    },
  };
}

async function getPunchCards(req, res) {
  const punchCardsData = await punchCardService.getPunchCardsData();
  return res.send(punchCardsData);
}

async function getPunchCardsByClients(req, res) {
  const filterObject = filterObjectFactory(req.query);
  const punchCardsByClients = await punchCardService.getPunchCardsByClients(
    filterObject
  );
  return res.send(punchCardsByClients);
}

async function getPunchCardsByEmployees(req, res) {
  const filterObject = filterObjectFactory(req.query);
  const punchCardsByEmployees = await punchCardService.getPunchCardsByEmployees(
    filterObject
  );
  return res.send(punchCardsByEmployees);
}

async function registerNewPunch(req, res) {
  const newPunchData = req.body;
  const registeredPunch = await punchCardService.registerPunch(newPunchData);
  return res.status(201).send(registeredPunch);
}

async function removePunch(req, res) {
  const { id: punchId } = req.params;
  const removedPunch = await punchCardService.deletePunch(punchId);
  return res.status(200).send(removedPunch);
}

async function performMassAction(req, res) {
  const { body } = req;
  const performedMassAction = await punchCardService.massAction({
    ...body,
    filteredValidEmployeesIds: req.filteredValidEmployeesIds
    });
  return res.status(200).send(performedMassAction);
}

async function getEmptyPunchCards(req, res) {
  const emptyPunchs = await punchCardService.getEmployeesWithEmptyPunchCard();
  return res.status(200).send(emptyPunchs);
}

export {
  getPunchCards,
  getPunchCardsByEmployees,
  getPunchCardsByClients,
  registerNewPunch,
  removePunch,
  performMassAction,
  getEmptyPunchCards,
  filterObjectFactory,
};
