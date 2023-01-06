import * as usersService from "../services/usersService.js";

async function registerNewUser(req, res) {
    const newUserData = req.body;

    const createdNewUser = await usersService.createNewUser(newUserData);
    return res.json(createdNewUser);
}

async function logUser(req, res) {
    const userCredentials = req.body;

    const userToken = await usersService.logUser(userCredentials);
    return res.send(userToken);
}

export {
    registerNewUser,
    logUser
}
