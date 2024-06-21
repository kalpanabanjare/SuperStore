USE superstore;

select * from superstore.superstoredata;

-- check data is impoeted properly in table or not
select * from superstoredata;

-- Check frist 5 row in data
select * from superstoredata limit 5;

-- Total sales and profit each year
SELECT 
    YEAR(OrderDate) AS year,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM superstoredata
GROUP BY YEAR(OrderDate)
ORDER BY YEAR(OrderDate) ASC;

SELECT DISTINCT YEAR(OrderDate) AS year FROM superstoredata;

-- TOTAL PROFIT AND TOTAL SALES PER QUATTER
select year(OrderDate) as year,
case
	when month(OrderDate) in (1,2,3) then 'Q!'
	when month(OrderDate) in (4,5,6) then 'Q2'
	when month(OrderDate) in (7,8,9) then 'Q3'
    else 'Q4'
end as quater,
sum(Sales) as total_sales,
sum(Profit) as total_profit
from superstoredata
group by year, quater
order by year, quater;
    
-- what region genrate highest sale and profit
select Region, sum(sales) as total_sales, sum(Profit) as total_profit
from superstoredata
group by Region
order by total_profit desc;

select Region, round((sum(Profit) / sum(Sales)) * 100,2) as profit_margin
from superstoredata
group by Region
order by profit_margin desc;

-- what state and city brings in the highest sales and profit
select State, sum(Sales) as total_sales, sum(Profit) as total_profit, round((sum(Profit) / sum(Sales)) * 100,2) as profit_margin
from superstoredata
group by State
order by total_profit desc
limit 10;

-- bottom 10 state
select State, sum(Sales) as total_sales, sum(Profit) as total_profit, round((sum(Profit) / sum(Sales)) * 100,2) as profit_margin
from superstoredata
group by State
order by total_profit asc
limit 10;

-- top 10 cities 
select City, sum(Sales) as total_sales, sum(Profit) as total_profit, round((sum(Profit) / sum(Sales)) * 100,2) as profit_margin
from superstoredata
group by City
order by total_profit desc
limit 10;

-- bottom 10 cities 
select City, sum(Sales) as total_sales, sum(Profit) as total_profit, round((sum(Profit) / sum(Sales)) * 100,2) as profit_margin
from superstoredata
group by City
order by total_profit asc
limit 10;

-- relationship between discount and sales and total discount par category
select Discount, avg(Sales) as avg_sale
from superstoredata
group by Discount
order by Discount;

-- total discount par product category 
select Category, sum(Discount) as total_discount
from superstoredata
group by Category
order by total_discount desc; 

select Category, SubCategory, sum(Discount) as total_discount
from superstoredata
group by Category, SubCategory
order by total_discount desc; 

-- which catagory generate higest sales and profit in each region and state
select Category, sum(Sales) as total_sale, sum(Profit) as total_profit, round((sum(Profit) / sum(Sales)) * 100, 2) as total_margin
from superstoredata
group by Category
order by total_profit desc;

select Region, Category, sum(Sales) as total_sale, sum(Profit) as total_profit
from superstoredata
group by Region, Category
order by total_profit desc;

-- higest total sales and total profit
select State, Category, sum(Sales) as total_sale, sum(Profit) as total_profit
from superstoredata
group by State, Category
order by total_profit desc;

select State, Category, sum(Sales) as total_sale, sum(Profit) as total_profit
from superstoredata
group by State, Category
order by total_profit asc;

-- which subcatagory generate higest sales and profit in each region and state
select SubCategory, sum(Sales) as total_sale, sum(Profit) as total_profit, round((sum(Profit) / sum(Sales)) * 100, 2) as total_margin
from superstoredata
group by SubCategory
order by total_profit desc;

select Region, SubCategory, sum(Sales) as total_sale, sum(Profit) as total_profit
from superstoredata
group by Region, SubCategory
order by total_profit desc;

select Region, SubCategory, sum(Sales) as total_sale, sum(Profit) as total_profit
from superstoredata
group by Region, SubCategory
order by total_profit asc;

select State, SubCategory, sum(Sales) as total_sale, sum(Profit) as total_profit
from superstoredata
group by State, SubCategory
order by total_profit desc;

select State, SubCategory, sum(Sales) as total_sale, sum(Profit) as total_profit
from superstoredata
group by State, SubCategory
order by total_profit asc;

-- what are the names of the product that are most and least profitable to us 
select ProductName, sum(Sales) as total_sales, sum(Profit) as total_profit
from superstoredata
group by ProductName
order by total_profit desc;

select ProductName, sum(Sales) as total_sales, sum(Profit) as total_profit
from superstoredata
group by ProductName
order by total_profit asc;

-- what segment make most profit and sales
select Segment, sum(Sales) as total_sales, sum(Profit) as total_profit
from superstoredata
group by Segment
order by total_profit desc;

-- how many coustomer do we have in total how much per region and state
select count(distinct CustomerID) as total_customer
from superstoredata;

select Region, count(distinct CustomerID) as total_customer
from superstoredata 
group by Region
order by total_customer desc;

select State, count(distinct CustomerID) as total_customer
from superstoredata 
group by State
order by total_customer desc;

-- customer reward program
select CustomerID, sum(Sales) as total_sale, sum(Profit) as total_profit
from superstoredata
group by CustomerID
order by total_profit desc
limit 15;

-- avrage shopping time per class in total
select round(avg(ShipDate - OrderDate), 1) as avg_shoping_time
from  superstoredata;

select ShipMode, round(avg(ShipDate - OrderDate), 1) as avg_shoping_time
from  superstoredata
group by ShipMode
order by avg_shoping_time;


