export async function test( req, res, next, schema ) {
      const { error } = schema.validate(req.body);

      if (error) {
        const { message } = error.details[0];
        throw { type: "unprocessable_entity", message };
      }
      next();
}