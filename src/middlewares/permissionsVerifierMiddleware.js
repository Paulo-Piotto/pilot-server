import Config from "../app.config.js";
import jwt from "jsonwebtoken";
import { getUserRoleByUserId } from "../repositories/usersRepository.js";

export default async function permissionsVerifierMiddleware(req, res, next, levelOfPermission) {
    const userToken = req.headers.authorization?.split(" ")[1]
    if(!userToken) throw { type: "unauthorized", message: "Token não identificado" }
    
    let decodedUserData;
    try { decodedUserData = jwt.verify(userToken, process.env.SERVER_SECRET) }
    catch(error) { throw { type: "unauthorized", message: "token inválido" }}

    const verifiedUserRole = await getUserRoleByUserId(decodedUserData.id)
    if(Config.rolesLevel[verifiedUserRole] < Config.rolesLevel[levelOfPermission]) throw {
        type: "unauthorized",
        message: "Você não tem autorização para acessar essa rota"
    }

    return next();
}