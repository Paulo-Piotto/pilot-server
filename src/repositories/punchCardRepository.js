import client from "../database.js";

const config = {
    employee: "employee_id",
    client: "client_id",
    date: "date"
}

async function getPunchCardsGoupedBy(groupedBy) {
    if(!config[groupedBy]) throw { type: "unprocessable_entity", message: `Could not group punchcard by: ${groupedBy}` }
    const punchCardsByUsers = await client.employees_worked_days.groupBy({
        by: [ config[groupedBy] ],
    })
    return punchCardsByUsers;
}

export {
    getPunchCardsGoupedBy
}