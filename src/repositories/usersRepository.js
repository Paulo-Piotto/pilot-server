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

async function getUserRoleByUserId(userId) {
    const userRole = await client.users.findUnique({
        where: { id: userId },
        select: {
            role: true
        }
    })

    return userRole.role.name
}

async function getAllUsersData() {
    const allUsersData = await client.users.findMany({
        include: {
            role: {
                select: { name: true }
            }
        }
    })
    return allUsersData;
}

async function updateUserByUserId(newUserData) {
    const { id, name, role, email } = newUserData;
    const updatedUser = await client.users.update({
        where: { id },
        data: {
            name,
            email,
            role: {
                connect: { name: role }
            }
        },
        include: {
            role: {
                select: { name: true }
            }
        }
    })
    return updatedUser;
}

export {
    create,
    findAlreadyRegisteredEmail,
    getUserRoleByUserId,
    getAllUsersData,
    updateUserByUserId
}