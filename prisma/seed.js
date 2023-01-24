import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()
async function main() {
    const seedRoleTypes = await prisma.roles.createMany({
        data: [
            { name: "new" },
            { name: "basic" },
            { name: "root" },
            { name: "admin" }
        ]
    })
    console.log("CREATED: ")
    console.log("")
    console.log(seedRoleTypes)
}
main()
    .then(async () => { await prisma.$disconnect() })
    .catch(async e => {
        console.error(e)
        await prisma.$disconnect()
    })