-- AlterTable
ALTER TABLE "employees" ALTER COLUMN "start_day" DROP DEFAULT;

-- AlterTable
ALTER TABLE "employees_worked_days" ALTER COLUMN "date" SET DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "orders" ALTER COLUMN "date" DROP DEFAULT;
