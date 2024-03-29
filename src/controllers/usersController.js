import * as usersService from "../services/usersService.js";

async function registerNewUser(req, res) {
  const newUserData = req.body;

  const createdNewUser = await usersService.createNewUser(newUserData);
  return res.status(201).json(createdNewUser);
}

async function logUser(req, res) {
  const userCredentials = req.body;

  const userToken = await usersService.logUser(userCredentials);
  return res.json({ token: userToken });
}

async function getALlSystemUsersData(req, res) {
  const allUsersDataFound = await usersService.getAllUsersData();
  return res.send(allUsersDataFound);
}

async function updateUser(req, res) {
  const updatedUser = await usersService.updateUserData(req.body);
  return res.status(200).json(updatedUser);
}

export { registerNewUser, logUser, getALlSystemUsersData, updateUser };
