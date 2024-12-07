use bank_analysis_project;


/*Q1 year wise loan ammount stat*/
select year(issue_d) as Year,concat(format(sum(loan_amnt)/100000,0)," M")as Loan_Amount from finance_1
group by year
order by Year desc;

/*Q2  Grade and Sub-grade wise revol_bal*/
select f1.grade As Grade,f1.sub_grade as Sub_Grade,concat(format(sum(f2.revol_bal)/100000,2)," M") as Revol_Bal  from finance_1 as f1 inner join finance_2 as f2
on f1.id =f2.id
group by Grade,sub_grade
order by Grade ;



/*Q3 Total payment for verified vs total payment for unverified*/
select distinct(f1.verification_status) as Verification_Status,concat(format(sum(f2.total_pymnt)/100000,2),' M') as Total_Payment from finance_1 as f1 inner join finance_2 as f2
on f1.id =f2.id
group by f1.verification_status
limit 2;

/*Q4 State wise and month wise loan status*/
select addr_state as States, loan_status,Concat(format(count(loan_status)/1000,2),' K')as Count from finance_1
group by states,loan_status
order  by loan_status desc , count  desc;


select monthname(issue_d)as Months,loan_status,Concat(format(count(loan_status)/1000,2),' K')as Count from finance_1
group by months,loan_status
order  by loan_status desc,count desc;

/*Q.5 Home ownership vs last payment date stat*/
select f1.home_ownership as home_ownership ,f2.last_pymnt_d as last_pymnt_d, 
concat(round(sum(f2.last_pymnt_amnt)/1000,2),' K')as total_pymnt from finance_1 as f1 inner join finance_2 as f2 on f1.id=f2.id
group by home_ownership,last_pymnt_d
order by last_pymnt_d desc ,home_ownership desc;
