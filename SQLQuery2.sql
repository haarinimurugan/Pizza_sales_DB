-- daily trand for total orders

select DATENAME(dw,order_date) as order_day, count(distinct order_id) as Total_orders
from pizza_sales 
group by DATENAME(dw,order_date)

-- monthly trand for total orders

select DATENAME(Month,order_date) as Month_Name , count(distinct(order_id)) as Orders_total from pizza_sales
group by DATENAME(Month,order_date)
order by Orders_total desc;

-- percentage of sales by pizza caregroy

select pizza_category,sum(total_price) as Total_sales, 
sum(total_price) * 100 / (select sum(total_price) from pizza_sales where month(order_date)=1) Total_sales_percentage from pizza_sales
where month(order_date) = 1
group by pizza_category;

-- percentage of sales by pizza size

select pizza_category,sum(total_price) as Total_sales, 
sum(total_price) * 100 / (select sum(total_price) from pizza_sales where datepart(quarter,order_date)=1) as PCT from pizza_sales
where datepart(quarter,order_date)=1
group by pizza_category
order by PCT desc;

-- find top 5 max sales

select top 5 pizza_name, sum(total_price) as Total_Revenue  from pizza_sales
group by pizza_name
order by Total_Revenue desc;

-- find bottom 5 5 max sales

select top 5 pizza_name, sum(total_price) as Total_Revenue  from pizza_sales
group by pizza_name
order by Total_Revenue desc;







