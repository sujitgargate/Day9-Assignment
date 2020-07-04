#!/bin/bash -x
isPartTime=1;
isFullTime=2;
maxHrsInMonth=10;
empRatePerHour=30;

numberOfWorkingDays=20;
totalEmpHrs=0;
totalWorkingDays=20;

while [[ $totalEmpHrs -lt $maxHrsInMonth && $totalWorkingDays -lt $numberOfWorkingDays ]]
do
((totalWorkingDays++))
empCheck=$((RANDOM%3))
case $empCheck in
        $isFullTime)
                empHours=8
                ;;
        $isPartTime)
                empHours=4
                ;;
        *)
                empHours=0
                ;;
esac
totalEmpHrs=$(($totalEmpHrs*$empRatePerHour))
done
totalSalary=$(($totalEmpHrs * $empRatePerHour))

