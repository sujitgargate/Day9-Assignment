#!/bin/bash -x
isPartTime=1;
isFullTime=2;
maxHrsInMonth=10;
empRatePerHour=30;
totalEmpHrs=0;

numberOfWorkingDays=20;
totalWorkingDays=0;
function getEmpWage()
{
	local empWage=$1;
	empHours=$(( $empWage * $empRatePerHour ))
	echo $(($empHours))
}

function getWorkingHours()
{
	local empCheck=$1
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
echo $empHours
}
while [[ $totalEmpHrs -lt $maxHrsInMonth && 
				$totalWorkingDays -lt $numberOfWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	empHours="$(getWorkingHours $empCheck)"
	totalEmpHrs=$(( $totalEmpHrs + $empHours ))
	dailyWage[$totalWorkingDays]=$(getEmpWage $empHours)
done
totalSalary=$(($totalEmpHrs * $empRatePerHour))
echo ${dailyWage[@]}
