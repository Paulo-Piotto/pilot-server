import client from "../database.js";

async function getAll() {
  const result = await client.menu.findMany({
    select: {
      id: true,
      name: true,
      sub: true,
      description: true,
      value: true,
      img: true,
    },
  });
  return result;
}

export { getAll };
