import client from "../database.js";

async function create(newClient) {
   const result = await client.clients.create({
     data: {
      name: newClient.name
     }
   });
}

async function find(clientName) {
   const result = await client.clients.findMany({
      where: {
        name: {
         contains: clientName,
         mode: 'insensitive',
        },
      },
    })
   return result;
}

async function findAll() {
   const result = await client.clients.findMany()
   return result;
}

async function findById(id) {
   const result = await client.clients.findUnique({
      where: {
        id: id,
      },
    })
   return result;
 }
 
 async function deleteClient(id){
   const result = await client.clients.delete({
     where: {
       id: id,
     },
   })
   return result;
 }

 async function update(updateData){
  const updateClient = await client.clients.update({
    where: {
      id: updateData.id,
    },
    data: {
      name: updateData.name
    }
  })
  return updateClient;
}

async function getBalance(searchSettings) {
  const result = await client.clients.findMany({
    select: {
      id: true,
      name: true,
      orders: {
        where: {
          date: {
            gte: searchSettings.initialDate,
            lte: searchSettings.endDate,
          }
        }
      },
      incomes: {
        where: {
          date: {
            gte: searchSettings.initialDate,
            lte: searchSettings.endDate,
          }
        }
      },
    },
  })
  return result;
}

export { create, find, findAll, findById, deleteClient, update, getBalance };