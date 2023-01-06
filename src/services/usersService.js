import * as usersRepository from "../repositories/usersRepository.js";
import bcrypt from "bcrypt";

async function createNewUser(newUser) {
    const saltRounds = +process.env.BCRYPT_SALT;
    const hashedPassword = bcrypt.hash(newUser.password, saltRounds);

    const alreadyRegisteredEmail = await usersRepository.findAlreadyRegisteredEmail(newUser.email);
    if(alreadyRegisteredEmail.length) throw { type: "conflict", message: "This email is already registered" };

    const createdUser = await usersRepository.create({...newUser, password: await hashedPassword});
    return createdUser;
}

export {
    createNewUser
}   