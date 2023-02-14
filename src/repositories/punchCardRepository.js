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
        where: {
            employees_worked_days: {
                some: {
                    date: {
                        gte: filter.date?.from ?? new Date("1970").toISOString(),
                        lte: filter.date?.to ?? new Date().toISOString()
                    }
                }
            }
        },
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

async function gerPunchCardsByEmployees(filter) {
    function whereClauseFactory() {
        let dateFilter = { date: {} }
        let clientFilter = {}

        if(filter.client) clientFilter = {
            clients: { name: filter.client },
        }
        if(filter.date?.from) dateFilter.date.gte = filter.date.from
        if(filter.date?.to) dateFilter.date.lte = filter.date.to

        return {
            where: {
                employees_worked_days: {
                    some: { ...dateFilter, ...clientFilter }
                }
            }
        }
    }

    const punchCardByEmployees = await client.employees.findMany({
        ...(whereClauseFactory()),
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
    gerPunchCardsByEmployees
}