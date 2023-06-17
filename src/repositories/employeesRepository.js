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
    include: {
        employees_worked_days: true
    },
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
    let result;
    if(typeof id === "number") {
        result = await client.employees.findUnique({
          where: {
            id: id,
          },
        });
    } else {
        result = await client.employees.find({
            where: {
              id: {
                in: id,
              },
            },
          });
    }
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
