# Students and Examinations

## Description

Table: Students

+---------------+---------+<br/>
| Column Name   | Type    |<br/>
+---------------+---------+<br/>
| student_id    | int     |<br/>
| student_name  | varchar |<br/>
+---------------+---------+<br/>
student_id is the primary key for this table. <br/>
Each row of this table contains the ID and the name of one student in the school. <br/>
 

Table: Subjects

+--------------+---------+<br/>
| Column Name  | Type    |<br/>
+--------------+---------+<br/>
| subject_name | varchar |<br/>
+--------------+---------+<br/>
subject_name is the primary key for this table.<br/>
Each row of this table contains the name of one subject in the school. <br/>
 

Table: Examinations

+--------------+---------+<br/>
| Column Name  | Type    |<br/>
+--------------+---------+<br/>
| student_id   | int     |<br/>
| subject_name | varchar |<br/>
+--------------+---------+<br/>
There is no primary key for this table. It may contain duplicates.<br/>
Each student from the Students table takes every course from Subjects table. <br/>
Each row of this table indicates that a student with ID student_id attended the exam of subject_name.<br/>
 

Write an SQL query to find the number of times each student attended each exam.

Order the result table by student_id and subject_name.

The query result format is in the following example:

Students table:
+------------+--------------+<br/>
| student_id | student_name |<br/>
+------------+--------------+<br/>
| 1          | Alice        |<br/>
| 2          | Bob          |<br/>
| 13         | John         |<br/>
| 6          | Alex         |<br/>
+------------+--------------+<br/>

Subjects table: <br/>
+--------------+<br/>
| subject_name |<br/>
+--------------+<br/>
| Math         |<br/>
| Physics      |<br/>
| Programming  |<br/>
+--------------+<br/>
Examinations table:<br/>
+------------+--------------+<br/>
| student_id | subject_name |<br/>
+------------+--------------+<br/>
| 1          | Math         |<br/>
| 1          | Physics      |<br/>
| 1          | Programming  |<br/>
| 2          | Programming  |<br/>
| 1          | Physics      |<br/>
| 1          | Math         |<br/>
| 13         | Math         |<br/>
| 13         | Programming  |<br/>
| 13         | Physics      |<br/>
| 2          | Math         |<br/>
| 1          | Math         |<br/>
+------------+--------------+<br/>
Result table:<br/>
+------------+--------------+--------------+----------------+<br/>
| student_id | student_name | subject_name | attended_exams |<br/>
+------------+--------------+--------------+----------------+<br/>
| 1          | Alice        | Math         | 3              |<br/>
| 1          | Alice        | Physics      | 2              |<br/>
| 1          | Alice        | Programming  | 1              |<br/>
| 2          | Bob          | Math         | 1              |<br/>
| 2          | Bob          | Physics      | 0              |<br/>
| 2          | Bob          | Programming  | 1              |<br/>
| 6          | Alex         | Math         | 0              |<br/>
| 6          | Alex         | Physics      | 0              |<br/>
| 6          | Alex         | Programming  | 0              |<br/>
| 13         | John         | Math         | 1              |<br/>
| 13         | John         | Physics      | 1              |<br/>
| 13         | John         | Programming  | 1              |<br/>
+------------+--------------+--------------+----------------+<br/>
The result table should contain all students and all subjects.<br/>
Alice attended Math exam 3 times, Physics exam 2 times and Programming exam 1 time.<br/>
Bob attended Math exam 1 time, Programming exam 1 time and didn't attend the Physics exam.<br/>
Alex didn't attend any exam.<br/>
John attended Math exam 1 time, Physics exam 1 time and Programming exam 1 time.


[Click here to review the tables in right format](https://leetcode.com/problems/students-and-examinations/)

## Psuedo code (My Approach)

1. Get the records of every student who is attending each exam  with cross join <br/>
2. Now select those with left join from examination table <br/>
3. Group by student id and subject name to get count of attended exams. <br/>

