
-- use 100dayssql;
-- -- create table icc_world_cup_1
-- -- (
-- -- Team_1 Varchar(20),
-- -- Team_2 Varchar(20),
-- -- Winner Varchar(20)
-- -- );
-- INSERT INTO icc_world_cup_1 values('India','SL','India');
-- INSERT INTO icc_world_cup_1 values('SL','Aus','Aus');
-- INSERT INTO icc_world_cup_1 values('SA','Eng','Eng');
-- INSERT INTO icc_world_cup_1 values('Eng','NZ','NZ');
-- INSERT INTO icc_world_cup_1 values('Aus','India','India');



select * from icc_world_cup_1; 

select Team_name , count(1) as no_of_matches_played , sum(win_flag) as matches_won , count(1)-sum(win_flag) as loss_matches   from ( 
select Team_1 as Team_name ,case when Team_1 = Winner then 1 else 0 end as win_flag  from icc_world_cup_1 
union all
select Team_2  as Team_name ,case when Team_2=Winner then 1 else 0 end as win_flag from icc_world_cup_1 
)  A  
group by Team_name order by matches_won desc;


select team_name , count(True) as matches_played from (
select Team_1 as Team_name ,case when Team_1 = Winner then 1 else 0 end as win_flag  from icc_world_cup_1 
union all
select Team_2  as Team_name ,case when Team_2=Winner then 1 else 0 end as win_flag from icc_world_cup_1 ) A
group by team_name
;






