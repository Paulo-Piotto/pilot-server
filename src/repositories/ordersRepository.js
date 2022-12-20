import client from "../database.js";

async function create(newOrder) {

   const result = await client.orders.create({
     data: {
      invoice: newOrder.invoice,
      date: newOrder.date,
      store_id: newOrder.store,
      client_id: newOrder.client,
      value: newOrder.value,
      value_negotiated: newOrder.negotiated,
      value_cash: newOrder.cash,
      value_financed: newOrder.financed,
     }
   });
}


async function findAll() {
    const result = await client.orders.findMany({
      orderBy: [
        {
          date: 'desc',
        }
      ],
        select: {
            id: true,
            invoice: true,
            date: true,
            stores: true,
            clients: true,
            value: true,
            value_financed: true,
            value_cash: true,
            value_negotiated: true,

        },
    })
    return result;
}

async function findByInvoice(orderInvoice) {
    const result = await client.orders.findMany({
       where: {
         invoice: {
          contains: orderInvoice,
          mode: 'insensitive',
         },
       },
     })
    return result;
 }

async function find(searchSettings) {
  const result = await client.orders.findMany({
    orderBy: [
      {
        date: 'desc',
      }
    ],
    select: {
      id: true,
      invoice: true,
      date: true,
      stores: true,
      clients: true,
      value: true,
      value_financed: true,
      value_cash: true,
      value_negotiated: true,
    },
    where: {
      date: {
        gte: searchSettings.initialDate,
        lte: searchSettings.endDate,
      },
      store_id: {
        gte: searchSettings.storeMin,
        lte: searchSettings.storeMax,
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
  const result = await client.orders.findUnique({
     where: {
       id: id,
     },
   })
  return result;
}

async function deleteOrder(id){
  const result = await client.orders.delete({
    where: {
      id: id,
    },
  })
  return result;
}

 export { 
    create, findAll, findByInvoice, find, deleteOrder, findById
 }