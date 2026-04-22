-- Databricks notebook source
create or refresh streaming table st_first as
select * from (workspace.default.customers_raw)

-- COMMAND ----------

create or replace materialized view agg_customer
as 
select
count(c_custkey) as Numbers , c_nationkey
from live.st_first
group by c_nationkey;
