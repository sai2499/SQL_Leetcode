-- Write your PostgreSQL query statement below
select
    metals.symbol as metal,
    nonmetals.symbol as nonmetal
from Elements metals 
join Elements nonmetals
    on metals.type = 'Metal' and nonmetals.type = 'Nonmetal'