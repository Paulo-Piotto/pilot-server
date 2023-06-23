import * as usersRepository from "../repositories/usersRepository.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

async function createNewUser(newUser) {
    const saltRounds = +process.env.BCRYPT_SALT;
    const hashedPassword = bcrypt.hash(newUser.password, saltRounds);

    const alreadyRegisteredEmail = await usersRepository.findAlreadyRegisteredEmail(newUser.email);
    if(alreadyRegisteredEmail) throw { type: "conflict", message: "Esse email já foi registrado" };

    const createdUser = await usersRepository.create({...newUser, password: await hashedPassword});
    delete createdUser.password;
    return createdUser;
}

async function logUser(credentials) {
    const registeredUser = await usersRepository.findAlreadyRegisteredEmail(credentials.email);
    if(!registeredUser) throw { type: "unauthorized", message: "Esse email não está registrado" }

    const verifyPassword = await bcrypt.compare(credentials.password, registeredUser.password);
    if(!verifyPassword) throw { type: "unauthorized", message: "As credenciais estão incorretas" }

    const jwtData = {
        name: registeredUser.name,
        email: registeredUser.email,
        role: registeredUser.role.name,
        id: registeredUser.id
    }

    const userToken = jwt.sign(jwtData, process.env.SERVER_SECRET);
    return userToken;
}

async function getAllUsersData() {
    const allUsersData = await usersRepository.getAllUsersData();
    const filteredAllUsersData = allUsersData.map(userData => {
        delete userData["role_id"]
        delete userData["password"]
        return {
            ...userData,
            role: userData.role.name
        }
    })

    return filteredAllUsersData;
}

async function updateUserData(newUserData) {
    const updatedUserData = await usersRepository.updateUserByUserId(newUserData);
    if(!updatedUserData) throw { type: "not_found", message: "Esse usuário não existe" }

    delete updatedUserData["role_id"]
    delete updatedUserData["password"]
    return {
        ...updatedUserData,
        role: updatedUserData.role.name
    }
}

export {
    createNewUser,
    logUser,
    getAllUsersData,
    updateUserData
}