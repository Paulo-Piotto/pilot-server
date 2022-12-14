import client from "../database.js";

async function create(newStore) {
   const result = await client.stores.create({
     data: {
      name: newStore.name
     }
   });
}

async function find(storeName) {
   const result = await client.stores.findMany({
      where: {
        name: {
         contains: storeName
        },
      },
    })
   return result;
}

async function findAll() {
   const result = await client.stores.findMany()
   return result;
}

export { create, find, findAll };