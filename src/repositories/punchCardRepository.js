import client from "../database.js";

async function getAllPunchCardsData() {
    const punchCardData = await client.employees_worked_days.findMany({
        orderBy: [{ date: "desc" }],
        select: {
            id: true, 
            date: true,
            clients: {
                select: {
                    id: true,
                    name: true
                }
            },
            employees: {
                select: {
                    id: true,
                    name: true,
                    wage: true
                }
            }
        }
    })
    return punchCardData;
}

async function getPunchCardsByClients(filter) {
    const punchCardsByClients = await client.clients.findMany({
        ...filter,
        orderBy: [{ name: "asc" }],
        select: {
            id: true,
            name: true,
            _count: {
                select: {
                    employees_worked_days: true // Sum of all workers worked days
                }
            }
        }
    })
    return punchCardsByClients;z
}

async function getPunchCardsByEmployees(filter) {
    const punchCardByEmployees = await client.employees.findMany({
        ...filter,
        select: {
            id: true,
            name: true,
            wage: true,
            start_day: true,
            employees_worked_days: {
                orderBy: [{ date: "desc" }],
                select: {
                    id: true,
                    date: true,
                    clients: {
                        select: {
                            id: true,
                            name: true,
                        },
                    }
                }
            }
        }
    })
    return punchCardByEmployees;
}

async function getEmptyPunchCardsByEmployees() {
    const emptyPunchCards = await client.employees.findMany({
        where: {
            employees_worked_days: {
                none: {}
            }
        }
    })
    return emptyPunchCards;
}

async function createPunch(punchData) {
    const { employeeId, clientId, date } = punchData

    const createdPunch = await client.employees_worked_days.create({
        data: {
            employee_id: employeeId,
            client_id: clientId,
            date
        }
    })

    return createdPunch;
}

async function deletePunch(punchId) {
    const deletedPunch = await client.employees_worked_days.delete({
        where: { id: Number(punchId) }
    })
    return deletedPunch;
}

async function massPunchDelete(massActionConfig) {
    const deletedPunchs = await client.employees_worked_days.deleteMany({
        where: {
            AND: [
                {client_id: Number(massActionConfig.clientId)},
                {employee_id: { in: massActionConfig.selectedEmployeesIds.map(id => Number(id))}},
                {date: { lte: massActionConfig.dateRange[1].toISOString(), gte: massActionConfig.dateRange[0].toISOString() }}
            ]
        }
    })
    return deletedPunchs;
}

async function getEmployeesWithDateAlreadyRegistered(dateReference, employeesId) {
    const employeesWithoutPunchsRegistered = await client.employees_worked_days.findMany({
        select: {
            employee_id: true,
        },
        where: {
            AND: [
                {employee_id: { in: employeesId },},
                {date: { equals: dateReference }},
            ]
        }
    })
    const hashTable = {};
    for(const data of employeesWithoutPunchsRegistered) hashTable[data.employee_id] = true;
    return hashTable;
}

async function massPunchRegistration(punchDataArray) {
    const createdPunchs = await client.employees_worked_days.createMany({
        data: punchDataArray
    })
    return createdPunchs;
}

export {
    getAllPunchCardsData,
    getPunchCardsByClients,
    getPunchCardsByEmployees,
    createPunch,
    deletePunch,
    massPunchDelete,
    massPunchRegistration,
    getEmptyPunchCardsByEmployees,
    getEmployeesWithDateAlreadyRegistered
}