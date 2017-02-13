SELECT 
      MAX(CASE WHEN Occupation = 'Doctor' THEN name ELSE NULL END) as [Doctor],
      MAX(CASE WHEN Occupation = 'Professor' THEN name ELSE NULL END) as [Professor],
      MAX(CASE WHEN Occupation = 'Singer' THEN name ELSE NULL END) as [Singer],
      MAX(CASE WHEN Occupation = 'Actor' THEN name ELSE NULL END) as [Actor] 
FROM (
select occupation, name, row_number() over (partition by occupation order by name) as RowNumber from occupations
) as sourcetable 
GROUP BY RowNumber
