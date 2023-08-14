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
      author: newOrder.author,
    },
  });
}

async function findByInvoice(orderInvoice) {
  const result = await client.orders.findMany({
    orderBy: [
      {
        date: "desc",
      },
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
      author: true,
    },
    where: {
      invoice: {
        contains: orderInvoice,
        mode: "insensitive",
      },
    },
  });
  return result;
}

async function find(searchSettings) {
  const result = await client.orders.findMany({
    orderBy: [
      {
        date: "desc",
      },
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
      author: true,
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
      },
      clients: {
        isArchived: false,
      },
    },
  });
  return result;
}

async function findById(id) {
  const result = await client.orders.findUnique({
    where: {
      id: id,
    },
  });
  return result;
}

async function deleteOrder(id) {
  const result = await client.orders.delete({
    where: {
      id: id,
    },
  });
  return result;
}

async function update(updateData) {
  const updateOrder = await client.orders.update({
    where: {
      id: updateData.id,
    },
    data: {
      invoice: updateData.invoice,
      date: updateData.date,
      store_id: updateData.store,
      client_id: updateData.client,
      value: updateData.value,
      value_negotiated: updateData.negotiated,
      value_cash: updateData.cash,
      value_financed: updateData.financed,
      author: updateData.author,
    },
  });
  return updateOrder;
}

export { create, findByInvoice, find, deleteOrder, findById, update };
