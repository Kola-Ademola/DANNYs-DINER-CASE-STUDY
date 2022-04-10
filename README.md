# DANNYs-DINER-CASE-STUDY
So I decided to join the Data With Danny's #8WeekSQLChallenge DANNY's DINER CASE STUDY. 
It was challenging and still a whole new learning process as I still discovered more about SQL functions and even got a better understanding of the queries I used.  
I'm happy to drop this here and its open to critics and review as I'm still learning and trying to improve my skills daily.  
Also a big THANKS to Danny Ma for this project/Case Study.


## Introduction
Danny seriously loves Japanese food so in the beginning of 2021, he decides to embark upon a risky venture and opens up a cute little restaurant that sells his 3 favourite foods: sushi, curry and ramen.

Danny’s Diner is in need of your assistance to help the restaurant stay afloat - the restaurant has captured some very basic data from their few months of operation but have no idea how to use their data to help them run the business.

## Problem Statement
Danny wants to use the data to answer a few simple questions about his customers, especially about their visiting patterns, how much money they’ve spent and also which menu items are their favourite. Having this deeper connection with his customers will help him deliver a better and more personalised experience for his loyal customers.

He plans on using these insights to help him decide whether he should expand the existing customer loyalty program - additionally he needs help to generate some basic datasets so his team can easily inspect the data without needing to use SQL.

Danny has provided you with a sample of his overall customer data due to privacy issues - but he hopes that these examples are enough for you to write fully functioning SQL queries to help him answer his questions!

Danny has shared with you 3 key datasets for this case study:

* sales
* menu
* members

### Example Datasets
All datasets exist within the "dannys_diner" database schema - be sure to include this reference within your SQL scripts as you start exploring the data and answering the case study questions.



### Table 1: sales
The sales table captures all customer_id level purchases with an corresponding order_date and product_id information for when and what menu items were ordered.

### Table 2: menu
The menu table maps the product_id to the actual product_name and price of each menu item.

### Table 3: members
The final members table captures the join_date when a customer_id joined the beta


# Case Study Questions
### Each of the following case study questions can be answered using a single SQL statement:

* What is the total amount each customer spent at the restaurant?
* How many days has each customer visited the restaurant?
* What was the first item from the menu purchased by each customer?
* What is the most purchased item on the menu and how many times was it purchased by all customers?
* Which item was the most popular for each customer?
* Which item was purchased first by the customer after they became a member?
* Which item was purchased just before the customer became a member?
* What is the total items and amount spent for each member before they became a member?
* If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
* In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?

## Bonus Questions
Join All The Things
The following questions are related creating basic data tables that Danny and his team can use to quickly derive insights without needing to join the underlying tables using SQL.

Recreate the following table output using the available data:
The table should show if a customer is a eember or not at the time of purchase

## Rank All The Things
Danny also requires further information about the ranking of customer products, but he purposely does not need the ranking for non-member purchases so he expects null ranking values for the records when customers are not yet part of the loyalty program.
