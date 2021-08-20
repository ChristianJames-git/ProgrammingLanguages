/* 
   p1a calculates and outputs the months it takes to pay off a loan based on user inputted loan amount, annual interest rate, and monthly payments
   07 September 2020
   p1a
   CS320
   Christian James
*/
#include <stdio.h>
#include <stdlib.h>

void printId();
void getLoanFactors(double *loanAmt, double *intRate, double *payment);
int getMonths(double loanAmt, double intRate, double payment, double *totalInt);

int main() {
    double loanAmt, intRate, payment, totalInt;
    int months;
    printId();
    getLoanFactors(&loanAmt, &intRate, &payment);
    printf("$%7.2lf Loan amount\n", loanAmt);
    printf("%8.2lf Annual interest rate\n", intRate);
    printf("$%7.2lf Monthly payment\n", payment);
    printf("\n LoanAmt  Month TotalInt\n");
    months = getMonths(loanAmt, intRate, payment, &totalInt);
    printf("\n%d months to pay off loan\n", months);
    printf("$%.2lf total interest paid\n", totalInt);
    return 0;
}

void printId() {
    printf("\nProgram #1, cssc2633, Christian James\n\n");
}

void getLoanFactors(double *loanAmt, double *intRate, double *payment) {
    scanf("%lf", loanAmt);
    scanf("%lf", intRate);
    scanf("%lf", payment);
}

int getMonths(double loanAmt, double intRate, double payment, double *totalInt) {
    int months = 1;
    double monthlyIntRate = intRate/12;
    double sumInt = 0;
    double tempInt;
    while (loanAmt > 0) {
        tempInt = loanAmt * monthlyIntRate;
        sumInt = sumInt + tempInt;
        loanAmt = loanAmt + tempInt - payment;
        printf("%8.2lf  %5d %8.2lf\n", loanAmt, months, sumInt);
        months = months + 1;
    }
    *totalInt = sumInt;
    months -= 1;
    return months;
}