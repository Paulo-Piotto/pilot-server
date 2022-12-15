import client from "../database.js";

async function create(newEmployee) {
   const currentDate = new Date().toISOString();
   const result = await client.employees.create({
     data: {
      name: newEmployee.name,
      wage: newEmployee.wage,
      start_day: currentDate
     }
   });
}

async function find(employeeName) {
   const result = await client.employees.findMany({
      orderBy: [
         {
            name: 'asc'
         }
      ],
      where: {
        name: {
         contains: employeeName,
         mode: 'insensitive',
        },
      },
    })
   return result;
}

async function findAll() {
   const result = await client.employees.findMany({
      orderBy: [
         {
            name: 'asc'
         }
      ]
   })
   return result;
}

export { create, find, findAll };