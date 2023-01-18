import client from "../database.js";

async function create(newUser) {
    const { roleId: role_id, name, email, password } = newUser;

    const createdUser = await client.users.create({
        data: {
            role_id,
            name,
            email,
            password
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