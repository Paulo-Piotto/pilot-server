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
         contains: storeName,
         mode: 'insensitive',
        },
      },
    })
   return result;
}

async function findAll() {
   const result = await client.stores.findMany()
   return result;
}

async function findById(id) {
   const result = await client.stores.findUnique({
      where: {
        id: id,
      },
    })
   return result;
 }
 
 async function deleteStore(id){
   const result = await client.stores.delete({
     where: {
       id: id,
     },
   })
   return result;
 }

 async function update(updateData){
  const updateStore = await client.stores.update({
    where: {
      id: updateData.id,
    },
    data: {
      name: updateData.name
    }
  })
  return updateStore;
}

export { create, find, findAll, findById, deleteStore, update };