import client from "../database.js";

async function create(newClient) {
   const result = await client.clients.create({
     data: {
      name: newClient.name,
      author: newClient.author
     }
   });
}

async function find(searchSettings) {
   const result = await client.clients.findMany({
      select: {
      id: true,
      name: true,
      author: true,
      isArchived: true,
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
      where: {
        name: {
         contains: searchSettings.name,
         mode: 'insensitive',
        },
        OR: [
          {
            isArchived: false,
          },
          {
            isArchived: Boolean(searchSettings.includeArchived)
          }
        ]
      },
    })
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
      name: updateData.name,
      author: updateData.author,
      isArchived: updateData.isArchived || false
    }
  })
  return updateClient;
}

async function getBalance(searchSettings) {
  const result = await client.clients.findMany({
    select: {
      id: true,
      name: true,
      author: true,
      isArchived: true,
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
    where: {
      isArchived: false,
    }
  })
  return result;
}

export { create, find, findById, deleteClient, update, getBalance };