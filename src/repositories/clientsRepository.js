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

export { create, find, findAll, findById, deleteClient, update };