import client from "../database.js";

async function create(newClient) {
  const result = await client.clients.create({
    data: {
      name: newClient.name,
      author: newClient.author,
    },
  });
}

async function find(filterObject) {
  const result = await client.clients.findMany({
    select: {
      id: true,
      name: true,
      author: true,
      isArchived: true,
      orders: {
        where: {
          date: {
            gte: filterObject.date.from,
            lte: filterObject.date.to,
          },
        },
      },
      incomes: {
        where: {
          date: {
            gte: filterObject.date.from,
            lte: filterObject.date.to,
          },
        },
      },
      employees_worked_days: {
        orderBy: [{ employee_id: "asc" }],
        select: {
          date: true,
          employees: {
            select: {
              id: true,
              name: true,
              wage: true,
            },
          },
        },
        where: {
          date: {
            gte: filterObject.date.from,
            lte: filterObject.date.to,
          },
        },
      },
    },
    where: {
      name: {
        contains: filterObject.client,
        mode: "insensitive",
      },
      OR: [
        {
          isArchived: false,
        },
        {
          isArchived: Boolean(filterObject.includeArchived),
        },
      ],
    },
  });
  return result;
}

async function findById(id) {
  const result = await client.clients.findUnique({
    where: {
      id: id,
    },
  });
  return result;
}

async function deleteClient(id) {
  const result = await client.clients.delete({
    where: {
      id: id,
    },
  });
  return result;
}

async function update(updateData) {
  const updateClient = await client.clients.update({
    where: {
      id: updateData.id,
    },
    data: {
      name: updateData.name,
      author: updateData.author,
      isArchived: updateData.isArchived || false,
    },
  });
  return updateClient;
}

async function getBalance(filterObject) {
  const result = await client.clients.findMany({
    select: {
      id: true,
      name: true,
      author: true,
      isArchived: true,
      orders: {
        where: {
          date: {
            gte: filterObject.date.from,
            lte: filterObject.date.to,
          },
        },
      },
      incomes: {
        where: {
          date: {
            gte: filterObject.date.from,
            lte: filterObject.date.to,
          },
        },
      },
      employees_worked_days: {
        orderBy: [{ employee_id: "asc" }],
        select: {
          date: true,
          employees: {
            select: {
              id: true,
              name: true,
              wage: true,
            },
          },
        },
        where: {
          date: {
            gte: filterObject.date.from,
            lte: filterObject.date.to,
          },
        },
      },
    },
    where: {
      isArchived: false,
    },
  });
  return result;
}

export { create, find, findById, deleteClient, update, getBalance };
