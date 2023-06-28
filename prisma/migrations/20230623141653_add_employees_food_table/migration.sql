-- CreateTable
CREATE TABLE "employees_food" (
    "id" SERIAL NOT NULL,
    "employee_id" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "employees_food_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "employees_food" ADD CONSTRAINT "employees_food_employee_id_foreign" FOREIGN KEY ("employee_id") REFERENCES "employees"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
