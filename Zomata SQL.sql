CREATE DATABASE ZOMATO_ANALYSIS;
USE ZOMATO_ANALYSIS;
select * from zomato_csv;
create table sheet1 (restaurantid int,restaurantname varchar(255),country_code varchar(10),city varchar(255),address varchar(255),Locality varchar(255) 
,LocalityVerbose varchar(250) ,Longitude float ,Latitude float ,Cuisines varchar(255) ,Currency varchar(255) ,Has_Table_booking varchar(255) 
,Has_Online_delivery varchar(255) ,Is_delivering_now varchar(255) ,Switch_to_order_menu varchar(255) ,Price_range varchar(255), Votes varchar(255) 
,Average_Cost_for_two varchar(255) ,Rating varchar(255) ,Datekey_Opening varchar(255));
select * from zomato;

alter table zomato_csv1
modify column price_range char(25);
load data infile 'D:\\Data anlyst course\\Excler Project\\Zomato analys\\zomato.csv'
into table zomato
fields terminated by ','
ignore 1 lines;

create database project;
use project;

select count(*) from zomata where has_Online_delivery="YES";
select *from zomato_csv;
select count(restaurantid) from zomato_csv;

select Quarter,count(*) from zomata group by quarter;




select * from zomata;
select Rating,count(*) Rangegrouping from zomata group by Rating;
                         
						
select Rating,count(*) from zomata where Rating=2;


select has_table_booking as Booking, 
CONCAT(ROUND(COUNT(restaurantID) / (SELECT COUNT(restaurantId) FROM zomata) * 100, 0), '%') as Percentage 
from zomata group by has_table_booking;



select count(RestaurantID) from Zomata;
select * from currency;
select *from country;

describe zomata;
alter table zomata modify RestaurantID int primary key;

alter table zomata add foreign key (CountryID) references country(CountryID);

select * from zomata;
alter table zomata rename column CountryCode to CountryID;
                         
select * from  currencyable;

alter table currency rename column AverageCostinDolloar to Dolloar; 
select * from currencytable;
select *from currency;


select Has_Table_booking,count(*) as Count_Of_Restaurants,concat(round(count(*)/(select count(RestaurantId) from Zomata)*100,0),'%') as Percentage  from Zomata group by Has_Table_booking;

select *from zomata;
alter table zomata add constraint   foreign key (CountryID) references country(CountryID);
alter table country add constraint Pk_code primary key (CountryID);
alter table zomata add constraint Fk_code foreign key (CountryID) references country(CountryID);

select C.Countryname,Z.city,count(RestaurantID) from country as C join zomata as Z on C.CountryID=Z.CountryID group by C.Countryname,Z.city;

select city, count(*) from zomata where city="New Delhi" & "Goa" group by city;
select * from Zomata;
/*------------------------------------------------------------------------------------------*/
/*3.Find the Numbers of Resturants based on City and Country*/

/*--------------------------------------------------------------------------------------------*/
/*4.Numbers of Resturants opening based on Year , Quarter , Month*/
select Year,Quarter,Month, count(*) as TotalRestaurants from zomata group by Year,quarter,Month;
/*5. Count of Resturants based on Average Ratings*/

select Ratingrange,count(*) as CountOFRestaurants,concat(round(count(*)/(select count(RestaurantID) from Currency)*100,1),"%") as Percentage from Currency group by Ratingrange order by Ratingrange asc;
/*6. Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets*/
select BucketPrice,count(*) as Count_Of_Restaurants,concat(round(count(*)/(select count(*) from currency)*100,1),"%") as Percentage from Currency group by BucketPrice order by BucketPrice asc;
/*7.Percentage of Resturants based on "Has_Table_booking"*/
select Has_Table_booking,concat(round(count(*)/(SELECT COUNT(restaurantId) FROM zomata) * 100,0), '%') as Percentage from zomata group by Has_Table_booking;
/*8.Percentage of Resturants based on "Has_Online_delivery"*/
select Has_Online_delivery,Concat(round(count(*)/(select count(RestaurantID) from Zomata)*100,0),"%") as Percentage from zomata group by Has_Online_delivery;
/*9. Develop Charts based on Cusines, City, Ratings*/

select *from zomata;

select Average_cost_for_two from zomata order by Average_cost_for_two desc;



