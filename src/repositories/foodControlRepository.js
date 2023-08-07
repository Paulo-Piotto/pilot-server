import client from "../database.js";

async function create(newFood) {
  const result = await client.employees_food.create({
    data: {
      employee_id: newFood.employee,
      date: newFood.date,
      type: newFood.type,
      value: newFood.value,
      author: newFood.author,
    },
  });
  return result;
}

async function createMany(orderArray) {
  const result = await client.employees_food.createMany({
    data: orderArray,
  });
  return result;
}

async function find(filter) {
  const employeesFood = await client.employees_food.findMany({
    orderBy: [{ date: "desc" }],
    select: {
      id: true,
      type: true,
      value: true,
      date: true,
      author: true,
      employees: {
        select: {
          id: true,
          name: true,
        },
      },
    },
    where: {
      employees: {
        name: {
          contains: filter.employee,
          mode: "insensitive",
        },
      },
      date: {
        gte: filter.date.from,
        lte: filter.date.to,
      },
    },
  });
  return employeesFood;
}

async function findById(filter) {
  const employeesFood = await client.employees_food.findMany({
    where: {
      id: filter.id,
    },
  });
  return employeesFood;
}

async function update(updateFood) {
  const result = await client.employees_food.update({
    where: {
      id: updateFood.id,
    },
    data: {
      employee_id: updateFood.employee,
      date: updateFood.date,
      type: updateFood.type,
      value: updateFood.value,
      author: updateFood.author,
    },
  });
  return result;
}

async function deleteFood(deleteSettings) {
  const result = await client.employees_food.delete({
    where: {
      id: deleteSettings.id,
    },
  });
  return result;
}

export { find, create, createMany, update, deleteFood, findById };
