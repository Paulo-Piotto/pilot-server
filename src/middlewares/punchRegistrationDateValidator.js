import { getEmployeesWithDateAlreadyRegistered } from "../repositories/punchCardRepository.js";

// receive an array of employees ids and returns another array with the ones that have no presence in that date
export default async function filterAvailableDates(req, res, next) {
    if(!req.body.isPresence) return;

    const employeesIds = typeof req.body.selectedEmployeesIds === "object" ? req.body.selectedEmployeesIds : [req.body.selectedEmployeesIds];
    const referenceDate = req.body.date;

    const newEmployeesIds = []
    const hashTableAlreadyRegisteredEmployeePunch = await getEmployeesWithDateAlreadyRegistered(referenceDate, employeesIds)

    for(const id of employeesIds) {
        if(hashTableAlreadyRegisteredEmployeePunch[id]) continue;
        newEmployeesIds.push(id);
    }
    req.filteredValidEmployeesIds = newEmployeesIds;

    return next();
}