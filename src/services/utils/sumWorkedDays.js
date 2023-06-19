function sumEmployeeWorkedDays(freqArray) {
  const result = [];

  for (let i = 0; i < freqArray.length; i++) {
    const arrayId = freqArray[i].id;
    const lastResult = result[result.length - 1];
    if (result.length === 0 || arrayId !== lastResult.id) {
      result.push({
        id: freqArray[i].id,
        name: freqArray[i].name,
        accountable: freqArray[i].accountable,
        contact: freqArray[i].contact,
        document: freqArray[i].document,
        address: freqArray[i].address,
        project_number: freqArray[i].project_number,
        author: freqArray[i].author,
        isArchived: freqArray[i].isArchived,
        incomes: freqArray[i].incomes,
        orders: freqArray[i].orders,
        employeesDays: [],
      });
    }
    for (let j = 0; j < freqArray[i].employees_worked_days.length; j++) {
      const lastEmployeeData =
        result[i].employeesDays[result[i].employeesDays.length - 1];
      const actualEmployee = freqArray[i].employees_worked_days[j].employees;
      if (result[i].employeesDays.length === 0) {
        result[i].employeesDays.push({
          id: freqArray[i].employees_worked_days[0].employees.id,
          name: freqArray[i].employees_worked_days[0].employees.name,
          wage: freqArray[i].employees_worked_days[0].employees.wage,
          count: 1,
        });
      } else if (lastEmployeeData.id === actualEmployee.id) {
        lastEmployeeData.count++;
      } else if (lastEmployeeData.id !== actualEmployee.id) {
        result[i].employeesDays.push({
          id: freqArray[i].employees_worked_days[j].employees.id,
          name: freqArray[i].employees_worked_days[j].employees.name,
          wage: freqArray[i].employees_worked_days[j].employees.wage,
          count: 1,
        });
      }
    }
  }
  return result;
}

function expenseCalculate(daysCountArray, workingDays) {
  if (workingDays.length > 0) {
    const daysCount = workingDays.length;
    const difference = monthsDifference(
      workingDays[0].date,
      workingDays[workingDays.length - 1].date
    );
    const avgWorkingDays = daysCount / difference;
    const result = [...daysCountArray];
    for (let i = 0; i < result.length; i++) {
      for (let j = 0; j < result[i].employeesDays.length; j++) {
        const currentEmployee = result[i].employeesDays[j];
        let expense =
          (currentEmployee.wage * currentEmployee.count) / avgWorkingDays;
        currentEmployee.expense = Number(expense.toFixed(0));
      }
    }
    return result;
  } else {
    const result = [...daysCountArray];
    for (let i = 0; i < result.length; i++) {
      for (let j = 0; j < result[i].employeesDays.length; j++) {
        const currentEmployee = result[i].employeesDays[j];
        currentEmployee.expense = 0;
      }
    }
    return result;
  }
}

function totalExpenseCalculate(daysCountArray) {
  const result = [...daysCountArray];
  for (let i = 0; i < result.length; i++) {
    let totalExpense = 0;
    for (let j = 0; j < result[i].employeesDays.length; j++) {
      totalExpense += result[i].employeesDays[j].expense;
    }
    result[i].totalExpense = totalExpense;
  }
  return result;
}

function monthsDifference(date1, date2) {
  const monthsDiff = date2.getMonth() - date1.getMonth();
  const yearsDiff = date2.getFullYear() - date1.getFullYear();

  return monthsDiff + yearsDiff * 12;
}

export { sumEmployeeWorkedDays, expenseCalculate, totalExpenseCalculate };
