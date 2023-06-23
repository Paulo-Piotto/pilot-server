export async function test( req, res, next ) {
  const { authorization } = req.headers;
  const token = authorization?.replace("Bearer ", "");

  if (!token) {
    throw { type: "unauthorized", message: "Formato de token inválido" };
  }

  next();
}