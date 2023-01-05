import * as usersRepository from "../repositories/usersRepository.js";

async function createNewUser(newUser) {
    const alreadyRegisteredEmail = await usersRepository.findAlreadyRegisteredEmail(newUser.email);
    if(alreadyRegisteredEmail.length) throw { type: "conflict", message: "This email is already registered" }

    const createdUser = await usersRepository.create(newUser);
    return createdUser;
}

export {
    createNewUser
}