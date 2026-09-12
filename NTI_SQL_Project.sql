USE retail_sales;

-----------------------------------
select * from customer;
select * from product;
select * from stores;
select * from transactions;
--------------------------
--Query 1 
--Use Cases:
--Calculate customer age and tenure.

select CustomerID,FirstName +' '+LastName as full_name,
DATEDIFF(YEAR,BirthDate,GETDATE()) as age,
joinDate,
DATEDIFF(YEAR,joinDate,getdate()) as tenure_years
from customer;
---------------------------------
--Query 2
--Analyse sales by gender, city, or customer loyalty.

select c.Gender,count(t.TransactionID) as total_transaction
,round(sum(t.Quantity*pr.UnitPrice* (1-t.Discount)),2) as total_sales
from customer as c join transactions as t
on c.CustomerID=t.CustomerID
join product as pr
on pr.ProductID=t.ProductID
group by c.Gender
order by total_sales;
--------------------------------
--Query 3

select c.City,count(t.TransactionID) as total_transaction
,round(sum(t.Quantity*pr.UnitPrice* (1-t.Discount)),2) as total_sales
from customer as c join transactions as t
on c.CustomerID=t.CustomerID
join product as pr
on pr.ProductID=t.ProductID
group by c.City
order by total_sales;
--------------------------------
--Query 4
--Use Cases:
--Calculate profit per unit.
select ProductName,
round(t.Quantity * pr.UnitPrice * (1 - t.Discount)- t.Quantity * pr.CostPrice, 2) AS total_profit
from product as pr 
join transactions as t
on pr.ProductID=t.ProductID;
---------------------------------------------------
--Query 5
--Compare sales and total_profit across categories.

select Category,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount)),2) as total_sales
,round(sum(t.Quantity*pr.CostPrice),2) as total_cost,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount))-sum(t.Quantity*pr.CostPrice),2) as total_profit
from product as pr join transactions as t
on pr.ProductID=t.ProductID
group by category
order by total_profit desc;
-------------------------------------------------------
--Query 6
--Identify top-performing products.

select top 10 ProductName,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount))-sum(t.Quantity*pr.CostPrice),2) as total_profit
from product as pr join transactions as t
on pr.ProductID=t.ProductID
group by ProductName
order by total_profit desc;
-------------------------------
--Query 7
--Use Cases:
--Compare store sales and performance.

select StoreName,count(t.TransactionID) as num_transaction,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount)),2) as total_sales,
round (sum(t.Quantity * (pr.UnitPrice * (1-t.Discount) - pr.CostPrice)),2) as total_profit
from stores sr  join transactions as t
on sr.StoreID=t.StoreID
join product as pr
on pr.ProductID=t.ProductID
group by StoreName
order by total_sales desc;
-----------------------
--Query 8
--Analyse regional trends.

select Region,count(t.TransactionID) as num_transaction,
count(distinct sr.StoreID) as total_stores ,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount)),2) as total_sales,
round(avg(t.Quantity*pr.UnitPrice*(1-t.Discount)),2) as average_sales
from stores sr  join transactions as t
on sr.StoreID=t.StoreID
join product as pr
on pr.ProductID=t.ProductID
group by Region
order by total_sales desc;
--------------------------
--Query 9
--Identify top and underperforming stores.

select  top 1 sr.StoreID,sr.StoreName,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount)),2) as total_sales
from stores sr  join transactions as t
on sr.StoreID=t.StoreID
join product as pr
on pr.ProductID=t.ProductID
group by sr.StoreID,sr.StoreName
order by total_sales  asc/*desc*/;
---------------------------------------------
--Query 10
--Use Cases:
--Calculate total sales and profit.

select t.PaymentMethod,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount)),2) as total_sales
,round(sum(t.Quantity*pr.CostPrice),2) as total_cost,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount))-sum(t.Quantity*pr.CostPrice),2) as total_profit
from product as pr join transactions as t
on pr.ProductID=t.ProductID
group by t.PaymentMethod
order by total_profit desc;
-----------------------------------
--Query 11
--Track sales over time (monthly, yearly).

select YEAR(t.Date) as year,MONTH(t.Date) as month,count(t.TransactionID) as num_transaction,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount)),2) as total_sales
from transactions as t
join product as pr
on pr.ProductID=t.ProductID 
group by YEAR(t.Date) ,MONTH(t.Date)
order by  year asc ,month asc;
-----------------------------
--Query 12
--Analyse customer purchase behaviour.

select  c.CustomerID,c.FirstName+' '+c.LastName as fullname,
count(t.TransactionID) as total_transaction,
SUM(t.Quantity) as total_quantity,
round(sum(t.Quantity*pr.UnitPrice*(1-t.discount)),2) as total_spent,
round(avg(t.Quantity*pr.UnitPrice*(1-t.discount)),2) as average_spent
from customer as c join transactions as t
on c.CustomerID=t.CustomerID
join product as pr
on pr.ProductID=t.ProductID
group by c.CustomerID,c.FirstName,c.LastName
order by total_spent desc;
------------------------------
--Query 13
--What is the average order value and customer lifetime value?

select c.CustomerID,c.FirstName+' '+c.LastName as full_name,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount)) / count(t.TransactionID),2) as averageordervalue,
round(sum(t.Quantity*pr.UnitPrice*(1-t.Discount)),2) AS CustomerLifetimeValue
from customer as c join transactions as t
on c.CustomerID=t.CustomerID
join product as pr
on pr.ProductID=t.ProductID
group by c.CustomerID,c.FirstName,c.LastName
order by CustomerLifetimeValue desc;