# Create a Session Bar Chart

## Description

Table: Sessions

+---------------------+---------+<br/>
| Column Name         | Type    |<br/>
+---------------------+---------+<br/>
| session_id          | int     |<br/>
| duration            | int     |<br/>
+---------------------+---------+<br/>
session_id is the primary key for this table.
duration is the time in seconds that a user has visited the application.
 

You want to know how long a user visits your application. You decided to create bins of "[0-5>", "[5-10>", "[10-15>" and "15 minutes or more" and count the number of sessions on it.

Write an SQL query to report the (bin, total) in any order.

The query result format is in the following example.

Sessions table:

+-------------+---------------+<br/>
| session_id  | duration      |<br/>
+-------------+---------------+<br/>
| 1           | 30            |<br/>
| 2           | 199           |<br/>
| 3           | 299           |<br/>
| 4           | 580           |<br/>
| 5           | 1000          |<br/>
+-------------+---------------+<br/>

Result table:

+--------------+--------------+<br/>
| bin          | total        |<br/>
+--------------+--------------+<br/>
| [0-5>        | 3            |<br/>
| [5-10>       | 1            |<br/>
| [10-15>      | 0            |<br/>
| 15 or more   | 1            |<br/>
+--------------+--------------+<br/>

For session_id 1, 2 and 3 have a duration greater or equal than 0 minutes and less than 5 minutes.
For session_id 4 has a duration greater or equal than 5 minutes and less than 10 minutes.
There are no session with a duration greater or equial than 10 minutes and less than 15 minutes.
For session_id 5 has a duration greater or equal than 15 minutes.

[Click here to review the tables in right format](https://leetcode.com/problems/create-a-session-bar-chart/)

## Psuedo code (My Approach)

1. Convert duration from secs to mins <br/>
duration/60
2. Apply case statement to get the different bins based on the condition <br/>
SELECT CASE WHEN duration/60 >= 0 AND duration/60 <= 5 <br/>
                            THEN '[0-5>'<br/>
                            WHEN duration/60 >= 5 AND duration/60 <= 10<br/>
                            THEN '[5-10>'<br/>
                            WHEN duration/60 >= 10 AND duration/60 <= 15<br/>
                            THEN '[10-15>'<br/>
                            ELSE '15 or more'<br/>
                        END AS bin<br/>
3. On grouping the bins, we get the count of session ids<br/>
count(session_id) as total<br/>
group by bin<br/>



## Efficient solution