CREATE TABLE "orders"(
    "id" SERIAL,
    "invoice" TEXT NOT NULL,
    "date" TIMESTAMP NOT NULL,
    "store_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "value" INTEGER NOT NULL,
    "value_negotiated" INTEGER NOT NULL,
    "value_cash" INTEGER NOT NULL,
    "value_financed" INTEGER NOT NULL
);
ALTER TABLE
    "orders" ADD PRIMARY KEY("id");
CREATE TABLE "stores"(
    "id" SERIAL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "stores" ADD PRIMARY KEY("id");
CREATE TABLE "clients"(
    "id" SERIAL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "clients" ADD PRIMARY KEY("id");
CREATE TABLE "employees"(
    "id" SERIAL,
    "name" TEXT NOT NULL,
    "wage" INTEGER NOT NULL,
    "start_day" TIMESTAMP NOT NULL
);
ALTER TABLE
    "employees" ADD PRIMARY KEY("id");
CREATE TABLE "employees_worked_days"(
    "id" SERIAL,
    "employee_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "date" TIMESTAMP NOT NULL
);
ALTER TABLE
    "employees_worked_days" ADD PRIMARY KEY("id");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_client_id_foreign" FOREIGN KEY("client_id") REFERENCES "clients"("id");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_store_id_foreign" FOREIGN KEY("store_id") REFERENCES "stores"("id");
ALTER TABLE
    "employees_worked_days" ADD CONSTRAINT "employees_worked_days_employee_id_foreign" FOREIGN KEY("employee_id") REFERENCES "employees"("id");
ALTER TABLE
    "employees_worked_days" ADD CONSTRAINT "employees_worked_days_client_id_foreign" FOREIGN KEY("client_id") REFERENCES "clients"("id");


    