import * as loansService from "../services/loansService.js";

async function post(req, res) {
  const result = await loansService.create(req.body);
  return res.status(201).send(result);
}

export { post };
