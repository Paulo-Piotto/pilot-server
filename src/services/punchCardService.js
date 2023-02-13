import * as punchCardRepository from "../repositories/punchCardRepository.js"

async function getPunchCardData() {
    const requests = await Promise.all([
       punchCardRepository.getPunchCardsGoupedBy("employee"),
       punchCardRepository.getPunchCardsGoupedBy("client"),
       punchCardRepository.getPunchCardsGoupedBy("date"),
    ])

    return {
        employee: requests[0],
        client: requests[1],
        date: requests[2]
    }
}

export {
    getPunchCardData
}