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
    return punchCardsByClients;
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

export {
    getAllPunchCardsData,
    getPunchCardsByClients,
    getPunchCardsByEmployees,
    createPunch,
    deletePunch
}