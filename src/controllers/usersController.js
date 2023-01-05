import * as usersService from "../services/usersService.js";

async function registerNewUser(req, res) {
    const newUserData = req.body;

    const createdNewUser = await usersService.createNewUser(newUserData);
    return res.json(createdNewUser);
}

export {
    registerNewUser
}
