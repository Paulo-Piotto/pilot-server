import * as punchCardRepository from "../repositories/punchCardRepository.js"

async function getPunchCardData() {
    const punchCardsData = await punchCardRepository.gerPunchCardsByEmployees({})
    return punchCardsData
}

export {
    getPunchCardData
}