import client from "../database.js";

async function getNonNullsWorkedDays(filter) {
  const NonNullsWorkedDays = await client.employees.findMany({
    orderBy: [{ name: "asc" }],
    select: {
      id: true,
      name: true,
      wage: true,
      start_day: true,
      author: true,
      employees_worked_days: {
        orderBy: [{ date: "desc" }],
        select: {
          id: true,
          date: true,
          clients: {
            select: {
              id: true,
              name: true,
            },
          },
        },
        where: {
          date: {
            gte: filter.date.from,
            lte: filter.date.to,
          },
          clients: {
            name: filter.client,
          },
        },
      },
    },
    where: {
      employees_worked_days: {
        some: {
          clients: {
            name: filter.client,
          },
          date: {
            gte: filter.date.from,
            lte: filter.date.to,
          },
        },
      },
      name: {
        contains: filter.employee,
        mode: "insensitive",
      },
    },
  });
  return NonNullsWorkedDays;
}

async function getWorkingDays(filter) {
  const workingDays = await client.employees_worked_days.findMany({
    orderBy: [{ date: "asc" }],
    select: {
      date: true,
    },
    where: {
      date: {
        gte: filter.date.from,
        lte: filter.date.to,
      },
    },
    distinct: ["date"],
  });
  return workingDays;
}

async function getWorkedDaysByClient(filter) {
  const clientData = await client.clients.findMany({
    select: {
      id: true,
      name: true,
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
            gte: filter.date.from,
            lte: filter.date.to,
          },
        },
      },
    },
  });

  return clientData;
}

export { getNonNullsWorkedDays, getWorkingDays, getWorkedDaysByClient };
