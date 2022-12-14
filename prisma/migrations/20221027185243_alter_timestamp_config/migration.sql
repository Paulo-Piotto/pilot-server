-- AlterTable
ALTER TABLE "employees" ALTER COLUMN "start_day" SET DATA TYPE TIMESTAMP(3);

-- AlterTable
ALTER TABLE "employees_worked_days" ALTER COLUMN "date" SET DATA TYPE TIMESTAMP(3);

-- AlterTable
ALTER TABLE "orders" ALTER COLUMN "date" SET DATA TYPE TIMESTAMP(3);
