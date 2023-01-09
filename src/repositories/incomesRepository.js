import client from "../database.js";

async function create(newIncome) {
   const result = await client.incomes.create({
     data: {
      name: newIncome.name,
      date: newIncome.date,
      client_id: newIncome.client,
      value: newIncome.value,
     }
   });
}

async function findByName(IncomeName) {
    const result = await client.incomes.findMany({
       where: {
         name: {
          contains: IncomeName,
          mode: 'insensitive',
         },
       },
     })
    return result;
 }

async function find(searchSettings) {
  const result = await client.incomes.findMany({
    orderBy: [
      {
        date: 'desc',
      }
    ],
    select: {
      id: true,
      name: true,
      date: true,
      clients: true,
      value: true,
    },
    where: {
      date: {
        gte: searchSettings.initialDate,
        lte: searchSettings.endDate,
      },
      client_id: {
        gte: searchSettings.clientMin,
        lte: searchSettings.clientMax,
      }
    }
  })
  return result;
}

async function findById(id) {
  const result = await client.incomes.findUnique({
     where: {
       id: id,
     },
   })
  return result;
}

async function deleteIncome(id){
  const result = await client.incomes.delete({
    where: {
      id: id,
    },
  })
  return result;
}

 export { 
    create, findByName, find, deleteIncome, findById
 }