#!/bin/bash -x
employeeCheck=$((RANDOM%3));
empRatePerHour=20;
isFullTime=2;
isPartTime=1;
for (counter)
case $employeeCheck in 
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
salary=$(($empHours*$empRatePerHour))
echo $salary
