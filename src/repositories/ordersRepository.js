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

async function find(orderInvoice) {
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

 export { 
    create, findAll, find
 }