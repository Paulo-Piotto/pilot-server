import client from "../database.js";

async function create(loanData) {
  const result = await client.loans.create({
    data: {
      date: loanData.date,
      employee_id: loanData.client,
      value: loanData.value,
      obs: loanData.obs,
      author: loanData.author,
    },
  });
  console.log("entrou");
  return result;
}

async function find(searchSettings) {
  const result = await client.loans.findMany({
    orderBy: [
      {
        date: "desc",
      },
    ],
    select: {
      id: true,
      date: true,
      employees: true,
      value: true,
      obs: true,
      author: true,
      deleted: true,
    },
    where: {
      date: {
        gte: searchSettings.date.from,
        lte: searchSettings.date.to,
      },
      client_id: searchSettings.employee,
      employees: {
        isArchived: false,
      },
      deleted: null,
    },
  });
  return result;
}

async function findById(id) {
  const result = await client.loans.findUnique({
    where: {
      id: id,
    },
  });
  return result;
}

async function deleteLoan(id) {
  const result = await client.loans.update({
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
  const result = await client.loans.update({
    where: {
      id: updateData.id,
    },
    data: {
      date: updateData.date,
      employee_id: updateData.employee,
      value: updateData.value,
      obs: updateData.obs,
      author: updateData.author,
    },
  });
  return updateOrder;
}

async function deleteMany(deleteSettings) {
  const result = await client.loans.updateMany({
    where: {
      id: { in: deleteSettings },
    },
    data: {
      deleted: new Date(Date.now()).toISOString(),
    },
  });
  return result;
}

export { create, find, deleteLoan, findById, update, deleteMany };
