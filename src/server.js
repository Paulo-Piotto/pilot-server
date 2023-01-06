import app from "./app.js";
import dotenv from "dotenv";

dotenv.config();
const port = process.env.PORT || 5000;

void function verifyDotenvConfiguration() {
    if(!process.env.BCRYPT_SALT) throw { type: "internal_server_error", message: "Server's missing essential configuration" }
}();

app.listen(port, () => {
  console.log(`Listening to port ${port}`);
});