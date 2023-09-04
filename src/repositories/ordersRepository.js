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
      obs: newOrder.obs,
      author: newOrder.author,
    },
  });

  return result;
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
      obs: true,
      author: true,
      deleted: true,
    },
    where: {
      invoice: {
        contains: orderInvoice,
        mode: "insensitive",
      },
      deleted: null,
    },
  });
  return result;
}

async function findBySameInvoice(orderInvoice) {
  const result = await client.orders.findFirst({
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
      obs: true,
      author: true,
      deleted: true,
    },
    where: {
      invoice: {
        equals: orderInvoice,
        mode: "insensitive",
      },
      deleted: null,
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
      obs: true,
      author: true,
      deleted: true,
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
      deleted: null,
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
  const result = await client.orders.update({
    where: {
      id: id,
    },
    data: {
      deleted: new Date(Date.now()).toISOString(),
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
      obs: updateData.obs,
      author: updateData.author,
    },
  });
  return updateOrder;
}

async function deleteMany(deleteSettings) {
  const result = await client.orders.updateMany({
    where: {
      id: { in: deleteSettings },
    },
    data: {
      deleted: new Date(Date.now()).toISOString(),
    },
  });
  return result;
}

export {
  create,
  findByInvoice,
  find,
  deleteOrder,
  findById,
  update,
  deleteMany,
  findBySameInvoice,
};
