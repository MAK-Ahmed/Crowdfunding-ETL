-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

Select cf_id, backers_count 
FROM campaign
where outcome = 'live'
Order by backers_count DESC

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.

Select cf_id, count (backer_id)
from backers
Group by cf_id
Order by count DESC

-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
Select 
c.first_name,
c.last_name,
c.email,
(cm.goal - cm.pledged) as Remaining_Goal_Amount
INTO email_contacts_remaining_goal_amount
FROM contacts as C
JOIN campaign as CM on C.contact_id = CM.contact_id
where cm.outcome = 'live'


-- Check the table
Select * 
From email_contacts_remaining_goal_amount
order by Remaining_goal_Amount DESC

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
Select 
b.email,
b.first_name,
b.last_name,
b.cf_id,
c.company_name,
c.description,
c.end_date,
(c.goal - c.pledged) as Left_of_Goal
INTO email_backers_remaining_goal_amount
FROM backers as b
JOIN campaign as c on b.cf_id=c.cf_id
where c.outcome = 'live'
Order by b.last_name, first_name

-- Check the table

Select * 
From email_backers_remaining_goal_amount
