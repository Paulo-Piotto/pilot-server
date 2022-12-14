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
         contains: clientName
        },
      },
    })
   return result;
}

async function findAll() {
   const result = await client.clients.findMany()
   return result;
}

export { create, find, findAll };