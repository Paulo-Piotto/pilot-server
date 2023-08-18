import * as menuService from "../services/menuService.js";

async function getAll(req, res) {
  const result = await menuService.getAll();
  return res.status(200).send(result);
}

export { getAll };
