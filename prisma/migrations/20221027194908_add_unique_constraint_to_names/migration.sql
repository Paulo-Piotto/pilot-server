/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `clients` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `employees` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[name]` on the table `stores` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "clients_name_key" ON "clients"("name");

-- CreateIndex
CREATE UNIQUE INDEX "employees_name_key" ON "employees"("name");

-- CreateIndex
CREATE UNIQUE INDEX "stores_name_key" ON "stores"("name");
