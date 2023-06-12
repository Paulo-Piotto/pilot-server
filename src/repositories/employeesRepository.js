import client from "../database.js";

async function create(newEmployee) {
  await client.employees.create({
    data: {
      name: newEmployee.name,
      wage: newEmployee.wage,
      start_day: newEmployee.startDate,
      contact: newEmployee.contact,
      document: newEmployee.document,
      address: newEmployee.address,
      pix: newEmployee.pix,
      obs: newEmployee.obs,
      author: newEmployee.author,
    },
  });
}

async function find(employeeName) {
  const result = await client.employees.findMany({
    include: {
      employees_worked_days: true,
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

async function update(employeeData) {
  await client.employees.update({
    data: {
      name: employeeData.name,
      wage: employeeData.wage,
      start_day: employeeData.startDate,
      contact: employeeData.contact,
      document: employeeData.document,
      address: employeeData.address,
      pix: employeeData.pix,
      obs: employeeData.obs,
      author: employeeData.author,
    },
    where: {
      id: employeeData.id,
    },
  });
}

export { create, find, findAll, findById, deleteEmployee, update };
