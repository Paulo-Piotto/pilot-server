import * as usersRepository from "../repositories/usersRepository.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

async function createNewUser(newUser) {
    const saltRounds = +process.env.BCRYPT_SALT;
    const hashedPassword = bcrypt.hash(newUser.password, saltRounds);

    const alreadyRegisteredEmail = await usersRepository.findAlreadyRegisteredEmail(newUser.email);
    if(alreadyRegisteredEmail) throw { type: "conflict", message: "This email is already registered" };

    const createdUser = await usersRepository.create({...newUser, password: await hashedPassword});
    return createdUser;
}

async function logUser(credentials) {
    const registeredUser = await usersRepository.findAlreadyRegisteredEmail(credentials.email);
    if(!registeredUser) throw { type: "unauthorized", message: "This email is not registered" }

    const verifyPassword = await bcrypt.compare(credentials.password, registeredUser.password);
    if(!verifyPassword) throw { type: "unauthorized", message: "The credentials provided does not match" }

    console.log("USER FOUND: ")
    console.log(registeredUser)

    const jwtData = {
        name: registeredUser.name,
        email: registeredUser.email,
        roleId: registeredUser.role_id
    }

    const userToken = jwt.sign(jwtData, process.env.SERVER_SECRET);
    return userToken;
}

export {
    createNewUser,
    logUser
}