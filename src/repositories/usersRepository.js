import client from "../database.js";

async function create(newUser) {
    const { roleName, name, email, password } = newUser;
    console.log(newUser)
    const createdUser = await client.users.create({
        data: {
            name,
            email,
            password,
            role: {
                connect: { name: roleName }
            }
        }
    });

    return createdUser;
}

async function findAlreadyRegisteredEmail(userEmail) {
    const foundUser = await client.users.findUnique({
        where: { email: userEmail },
        include: { role:  true }
    })

    return foundUser;
}

export {
    create,
    findAlreadyRegisteredEmail
}