-- CreateTable
CREATE TABLE "clients" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "clients_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employees" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "wage" INTEGER NOT NULL,
    "start_day" TIMESTAMP(6) NOT NULL DEFAULT '2022-10-27 15:01:58.567307'::timestamp without time zone,

    CONSTRAINT "employees_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "employees_worked_days" (
    "id" SERIAL NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "date" TIMESTAMP(6) NOT NULL DEFAULT '2022-10-27 15:01:58.591651'::timestamp without time zone,

    CONSTRAINT "employees_worked_days_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "orders" (
    "id" SERIAL NOT NULL,
    "invoice" TEXT NOT NULL,
    "date" TIMESTAMP(6) NOT NULL DEFAULT '2022-10-27 15:01:58.416457'::timestamp without time zone,
    "store_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "value" INTEGER NOT NULL,
    "value_negotiated" INTEGER NOT NULL,
    "value_cash" INTEGER NOT NULL,
    "value_financed" INTEGER NOT NULL,

    CONSTRAINT "orders_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "stores" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "stores_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "employees_worked_days" ADD CONSTRAINT "employees_worked_days_client_id_foreign" FOREIGN KEY ("client_id") REFERENCES "clients"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "employees_worked_days" ADD CONSTRAINT "employees_worked_days_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "employees"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_client_id_foreign" FOREIGN KEY ("client_id") REFERENCES "clients"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "orders" ADD CONSTRAINT "orders_store_id_foreign" FOREIGN KEY ("store_id") REFERENCES "stores"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
