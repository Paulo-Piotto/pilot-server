import client from "../database.js";

async function create(newEmployee) {
  await client.employees.create({
    data: {
      name: newEmployee.name,
      wage: newEmployee.wage,
      start_day: newEmployee.startDate,
      author: newEmployee.author,
    },
  });
}

async function find(employeeName) {
  const result = await client.employees.findMany({
    orderBy: [
      {
        name: "asc",
      },
    ],
    where: {
      name: {
        contains: employeeName,
        mode: "insensitive",
      },
    },
  });
  return result;
}

async function findAll() {
  const result = await client.employees.findMany({
    orderBy: [
      {
        name: "asc",
      },
    ],
  });
  return result;
}

async function findById(id) {
  const result = await client.employees.findUnique({
    where: {
      id: id,
    },
  });
  return result;
}

async function deleteEmployee(id) {
  const result = await client.employees.delete({
    where: {
      id: id,
    },
  });
  return result;
}

export { create, find, findAll, findById, deleteEmployee };
