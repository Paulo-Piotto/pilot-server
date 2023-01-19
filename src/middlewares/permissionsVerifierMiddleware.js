import Config from "../app.config.js";
import jwt from "jsonwebtoken";
import { getUserRoleById } from "../repositories/usersRepository.js";

export default async function permissionsVerifierMiddleware(req, res, next, levelOfPermission) {
    const userToken = req.headers.authorization?.split(" ")[1]
    if(!userToken) throw { type: "unauthorized", message: "Token is required in headers authorization" }
    
    let decodedUserData;
    try { decodedUserData = jwt.verify(userToken, process.env.SERVER_SECRET) }
    catch(error) { throw { type: "unauthorized", message: "Could not authenticate incoming user token" }}

    const verifiedUserRole = await getUserRoleById(decodedUserData.id)

    if(Config[verifiedUserRole] < Config[levelOfPermission]) throw {
        type: "unauthorized",
        message: "You have not enough privileges to access this resource"
    }

    console.log("middleware going next")
    return next();
}