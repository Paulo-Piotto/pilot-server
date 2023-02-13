import * as punchCardService from "../services/punchCardService.js";

async function getPunchCards(req, res) {
    const punchCardsData = await punchCardService.getPunchCardData();
    return res.send(punchCardsData)
}

export {
    getPunchCards
}