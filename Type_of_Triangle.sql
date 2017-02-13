select case when not (A+B > C AND B+C > A AND C+A > B) then 'Not A Triangle'
       else (case when A=B AND B=C then 'Equilateral'
                  when A=B or B=C or C=A THEN 'Isosceles'
                  else 'Scalene' end) end
from triangles 
