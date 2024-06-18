CREATE TABLE BadDriverData (
    State VARCHAR(50),
    DriversInFatalCollisionsPerBillionMile FLOAT,
    PercentageOfDriversInvolvedWhoWereSpeeding FLOAT,
    PercentageOfDriversInvolvedWhoWereDrunk FLOAT,
    PercentageOfDriversWhoWereNotDistracted FLOAT,
    PercentageOfDriversInvolvedWhoDidNotHavePreviousAccident FLOAT,
    CarInsurancePremiums FLOAT,
    LossesIncurredByInsuranceCompaniesPerInsuredDriver FLOAT
);
INSERT INTO BadDriverData (State, DriversInFatalCollisionsPerBillionMile, PercentageOfDriversInvolvedWhoWereSpeeding, PercentageOfDriversInvolvedWhoWereDrunk, PercentageOfDriversWhoWereNotDistracted, PercentageOfDriversInvolvedWhoDidNotHavePreviousAccident, CarInsurancePremiums, LossesIncurredByInsuranceCompaniesPerInsuredDriver)
VALUES
    ('Alabama', 18.8, 39, 30, 96, 80, 784.55, 145.08),
    ('Alaska', 18.1, 41, 25, 90, 94, 1053.48, 133.93),
    ('Arizona', 18.6, 35, 28, 84, 96, 899.47, 110.35),
    ('Arkansas', 22.4, 18, 26, 94, 95, 827.34, 142.39),
    ('California', 12, 35, 28, 91, 89, 878.41, 165.63),
    ('Colorado', 13.6, 37, 28, 79, 95, 835.5, 139.91),
    ('Connecticut', 10.8, 46, 36, 87, 82, 1068.73, 167.02),
    ('Delaware', 16.2, 38, 30, 87, 99, 1137.87, 151.48),
    ('District of Columbia', 5.9, 34, 27, 100, 100, 1273.89, 136.05),
    ('Florida', 17.9, 21, 29, 92, 94, 1160.13, 144.18),
    ('Georgia', 15.6, 19, 25, 95, 93, 913.15, 142.8),
    ('Hawaii', 17.5, 54, 41, 82, 87, 861.18, 120.92),
    ('Idaho', 15.3, 36, 29, 85, 98, 641.96, 82.75),
    ('Illinois', 12.8, 36, 34, 94, 96, 803.11, 139.15),
    ('Indiana', 14.5, 25, 29, 95, 95, 710.46, 108.92),
    ('Iowa', 15.7, 17, 25, 97, 87, 649.06, 114.47),
    ('Kansas', 17.8, 27, 24, 77, 85, 780.45, 133.8),
    ('Kentucky', 21.4, 19, 23, 78, 76, 872.51, 137.13),
    ('Louisiana', 20.5, 35, 33, 73, 98, 1281.55, 194.78),
    ('Maine', 15.1, 38, 30, 87, 84, 661.88, 96.57),
    ('Maryland', 12.5, 34, 32, 71, 99, 1048.78, 192.7),
    ('Massachusetts', 8.2, 23, 35, 87, 80, 1011.14, 135.63),
    ('Michigan', 14.1, 24, 28, 95, 77, 1110.61, 152.26),
    ('Minnesota', 9.6, 23, 29, 88, 88, 777.18, 133.35),
    ('Mississippi', 17.6, 15, 31, 10, 100, 896.07, 155.77),
    ('Missouri', 16.1, 43, 34, 92, 84, 790.32, 144.45),
    ('Montana', 21.4, 39, 44, 84, 85, 816.21, 85.15),
    ('Nebraska', 14.9, 13, 35, 93, 90, 732.28, 114.82),
    ('Nevada', 14.7, 37, 32, 95, 99, 1029.87, 138.71),
    ('New Hampshire', 11.6, 35, 30, 87, 83, 746.54, 120.21),
    ('New Jersey', 11.2, 16, 28, 86, 78, 1301.52, 159.85),
    ('New Mexico', 18.4, 19, 27, 67, 98, 869.85, 120.75),
    ('New York', 12.3, 32, 29, 88, 80, 1234.31, 150.01),
    ('North Carolina', 16.8, 39, 31, 94, 81, 708.24, 127.82) ;

select * from BadDriverData ;
--find the top 5 states with the highest number of drivers involved in fatal collisions per billion mile --
SELECT State, DriversInFatalCollisionsPerBillionMile FROM BadDriverData ORDER BY DriversInFatalCollisionsPerBillionMile DESC LIMIT 5;

-- the average % of drivers involved in fatal collisions who were speeding across all states --
SELECT AVG(PercentageOfDriversInvolvedWhoWereSpeeding) AS 'Average Percentage of Speeding Drivers'
FROM BadDriverData;

--The state with the lowest % of drivers who were not distracted during fatal collisions --
SELECT State, PercentageOfDriversWhoWereNotDistracted FROM BadDriverData ORDER BY PercentageOfDriversWhoWereNotDistracted ASC
LIMIT 1;

--the average car isnurance premium across all states --
SELECT AVG(CarInsurancePremiums) AS Averagepremium FROM BadDriverData;

--the top 4 states with the highest loss incurred by insurance companies --
SELECT State, LossesIncurredByInsuranceCompaniesPerInsuredDriver
FROM BadDriverData
ORDER BY LossesIncurredByInsuranceCompaniesPerInsuredDriver DESC
LIMIT 4;

--the states where car insurance premium are above 1000 dollars--
SELECT State, CarInsurancePremiums FROM BadDriverData WHERE CarInsurancePremiums > 1000 ; 

--update the car insurance premium for newyork to 1500 dollars --
UPDATE BadDriverData
SET CarInsurancePremiums = 1500
WHERE State = 'New York';

--calculate the standard deviation of the % of drivers involved in fatal collisions who were not distracted --
SELECT STDDEV (PercentageOfDriversWhoWereNotDistracted) AS Standarddeviation 
FROM BadDriverData;

--top 4 states with the highest difference between the % of drivers involve in fatal collisions who were not distracted & the % of drivers who didnot have any previous accidents--
SELECT State,
       PercentageOfDriversWhoWereNotDistracted,
       PercentageOfDriversInvolvedWhoDidNotHavePreviousAccident,
       ABS(PercentageOfDriversWhoWereNotDistracted - PercentageOfDriversInvolvedWhoDidNotHavePreviousAccident) AS Percentagedifference 
FROM BadDriverData
ORDER BY ABS(PercentageOfDriversWhoWereNotDistracted - PercentageOfDriversInvolvedWhoDidNotHavePreviousAccident) DESC
LIMIT 4;

--calculate the correlation between the car insurance premium & the loses incurred by insurance companies --
SELECT CORR(CarInsurancePremiums, LossesIncurredByInsuranceCompaniesPerInsuredDriver) AS Correlation
FROM BadDriverData;

--the states with % of drivers involved in fatal collisions who were not distracted > 70% & a % of drivers who didnot have previous accidents >80 %--
SELECT State
FROM BadDriverData
WHERE PercentageOfDriversWhoWereNotDistracted > 70
  AND PercentageOfDriversInvolvedWhoDidNotHavePreviousAccident > 80;


--the top 4 states with the highest ratio of drivers involved in fatal collisions to the % of drivers involved who were not distracted and order them by the ratio in descending order --
SELECT  State, DriversInFatalCollisionsPerBillionMile / PercentageOfDriversWhoWereNotDistracted AS Ratio, DriversInFatalCollisionsPerBillionMile,PercentageOfDriversWhoWereNotDistracted
FROM BadDriverData
ORDER BY DriversInFatalCollisionsPerBillionMile / PercentageOfDriversWhoWereNotDistracted DESC
LIMIT 4;


    
















-- 



