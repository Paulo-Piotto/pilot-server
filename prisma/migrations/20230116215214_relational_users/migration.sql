-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_role_id_foreign";

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_role_id_fkey" FOREIGN KEY ("role_id") REFERENCES "roles"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
