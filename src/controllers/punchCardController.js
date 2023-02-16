import * as punchCardService from "../services/punchCardService.js";

function filterObjectFactory(query) {
    const { from, to, client } = query;
    return {
        client,
        date: {
            from,
            to,
        }
    }
}

async function getPunchCards(req, res) {
    const punchCardsData = await punchCardService.getPunchCardsData();
    return res.send(punchCardsData)
}

async function getPunchCardsByClients(req, res) {
    const filterObject = filterObjectFactory(req.query)
    const punchCardsByClients = await punchCardService.getPunchCardsByClients(filterObject);
    return res.send(punchCardsByClients);
}

async function getPunchCardsByEmployees(req, res) {
    const filterObject = filterObjectFactory(req.query)
    const punchCardsByEmployees = await punchCardService.getPunchCardsByEmployees(filterObject)
    return res.send(punchCardsByEmployees)
}

export {
    getPunchCards,
    getPunchCardsByEmployees,
    getPunchCardsByClients
}