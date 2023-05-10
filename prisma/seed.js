import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

async function roleSeeder() {
    console.log("> Initiating roles seed...")
    function findNonRegisteredRoles(roleNames, dbData) {
        let nonRegisteredRoles = [...roleNames];
        for(const dbRole of dbData) {
            nonRegisteredRoles = nonRegisteredRoles.filter(roleName => roleName !== dbRole.name )
        }
        return nonRegisteredRoles;
    }

    const newRoleData = [
        "new" ,
        "basic",
        "root",
        "admin",
    ]

    const existentRoles = await prisma.roles.findMany({});
    const notRegisteredRoles = findNonRegisteredRoles(newRoleData, existentRoles)

    if(notRegisteredRoles.length) {
        console.log(">> Creating Roles... ")
        const seedRoleTypes = await prisma.roles.createMany({
            data: notRegisteredRoles.map(role => ({name: role}))
        })

        console.log(">>CREATED: ")
        console.log("")
        console.log(seedRoleTypes)
    } else console.log(">> Roles already registered, skiping this step...")
}

async function employeeSeeder() {
    console.log("> Initiating employees seed...")
    const existentEmployees = await prisma.employees.findMany({});
    if(existentEmployees.length) {
        console.log(">> There are employees already registered, skiping...")
        return existentEmployees;
    }
    
    const createdEmployees = await prisma.employees.createMany({
        data: [
            {
                name: "Marcos Fonseca",
                wage: 1253,
                start_day: new Date(),
                author: "Yohan Lopes"
            },
            {
                name: "Steve Magal",
                wage: 2353,
                start_day: new Date(),
                author: "Yohan Lopes"
            }
        ]        
    })
    console.log(">> CREATED EMPLOYEES: ")
    console.log("")
    console.log(createdEmployees)
    return createdEmployees;
}

async function clientsSeeder() {
    console.log("> Initiating clients seed...")
    const existentClients = await prisma.clients.findMany({});
    if(existentClients.length) {
        console.log(">> There are clients already registered, skiping...")
        return existentClients;
    }

    const createdClients = await prisma.clients.createMany({
        data: [
            {
                name: "Fonseca Material de Construção",
                author: "Yohan Lopes"
            },
            {
                name: "Inca Cimentos",
                author: "Yohan Lopes"
            }
        ]        
    })
    console.log(">> CREATED CLIENTS: ")
    console.log("")
    console.log(createdClients)
    return createdClients;
}

async function employeesWorkedDaysSeeder(registeredEmployees, registeredClients) {
    await prisma.employees_worked_days.createMany({
        data: [
            {
                employee_id: registeredEmployees[0].id,
                client_id: registeredClients[0].id
            },
            {
                employee_id: registeredEmployees[1].id,
                client_id: registeredClients[1].id
            }
        ]
    })
}

async function main() {
    await roleSeeder();
    const [ employeesSeed, clientsSeed ] = await Promise.all([ employeeSeeder(), clientsSeeder() ])
    await employeesWorkedDaysSeeder(employeesSeed, clientsSeed)
}
main()
    .then(async () => { await prisma.$disconnect() })
    .catch(async e => {
        console.error(e)
        await prisma.$disconnect()
    })