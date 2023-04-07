CREATE TABLE Friends (
    PersonID INT NOT NULL,
    FriendID INT NOT NULL,
    PRIMARY KEY (PersonID, FriendID)
);
INSERT INTO Friends (PersonID, FriendID) VALUES
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 5),
    (4, 2),
    (4, 3),
    (4, 5);
CREATE TABLE People (
    PersonID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Score INT NOT NULL,
    PRIMARY KEY (PersonID)
);
INSERT INTO People (PersonID, Name, Email, Score) VALUES
    (1, 'Alice', 'alice2018@hotmail.com', 88),
    (2, 'Bob', 'bob2018@hotmail.com', 11),
    (3, 'Davis', 'davis2018@hotmail.com', 27),
    (4, 'Tara', 'tara2018@hotmail.com', 45),
    (5, 'John', 'john2018@hotmail.com', 63);


	select * from friends
	select * from people

	-- write a query to find personID, Name, number of friends ,sum of marks of person who have friends with total score greater than 100

		with cte as 
		(
	select a.PersonID,count(b.personid) as total_friends,sum(b.score) as friend_score from friends a
	join people b on a.FriendID = b.PersonID
	group by a.PersonID
	having sum(b.score) > 100)

	select c.*, f.name from cte c
	join people f 
	on c.Personid = f.PersonID


	--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	CREATE table activity
(
user_id varchar(20),
event_name varchar(20),
event_date date,
country varchar(20)
);
delete from activity;
insert into activity values (1,'app-installed','2022-01-01','India')
,(1,'app-purchase','2022-01-02','India')
,(2,'app-installed','2022-01-01','USA')
,(3,'app-installed','2022-01-01','USA')
,(3,'app-purchase','2022-01-03','USA')
,(4,'app-installed','2022-01-03','India')
,(4,'app-purchase','2022-01-03','India')
,(5,'app-installed','2022-01-03','SL')
,(5,'app-purchase','2022-01-03','SL')
,(6,'app-installed','2022-01-04','Pakistan')
,(6,'app-purchase','2022-01-04','Pakistan');

select * from activity

--- find active users 
select event_date, count(distinct user_id) as active_users from activity
where event_name = 'app-purchase' or event_name = 'app-installed'
group by event_date


-- find the total active users each week 
select DATEPART(week,event_date) as week_num, count(distinct user_id) from activity
group by   DATEPART(week,event_date)


-- date wise total number of user who purchase same day they insalled the app


with cte as (
select user_id,event_date,case when event_name = 'app-installed' then event_date end as  installed,
case when event_name = 'app-purchase' then event_date end as  purchase
from activity)

select event_date,sum(column1) as total_user from 

(select event_date,case when installed = lead(purchase) over(partition by user_id order by purchase) then 1 else 0 end as column1 from cte) as t

group by event_date

-- percentage of paid users in india,USA and any other country should be tagged as others country percentage_users

select * from activity




with cte as (
select case when country = 'India' or country = 'USA' then country else 'other' end as country,sum(case when event_name = 'app-purchase' then 1 end) as total_paid_user from activity
group by case when country = 'India' or country = 'USA' then country else 'other' end)

select country, cast(1.0*total_paid_user/(select sum(total_paid_user) from cte)*100 as float) as per from cte


