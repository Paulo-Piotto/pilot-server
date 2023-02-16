import client from "../database.js";

async function getAllPunchCardsData() {
    const punchCardData = await client.employees_worked_days.findMany({
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

export {
    getAllPunchCardsData,
    getPunchCardsByClients,
    getPunchCardsByEmployees
}