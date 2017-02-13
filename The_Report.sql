select case when grade > 7 then name else null end, grade, marks from (
select name, marks, case when marks >= 0 and marks <= 9 then 1
else (
    case when marks >= 10 and marks <= 19 then 2
    else (
        case when marks >=20 and marks <= 29 then 3
        else (
            case when marks >=30 and marks <= 39 then 4
            else (
                case when marks >=40 and marks <= 49 then 5
                else (
                    case when marks >=50 and marks <= 59 then 6
                    else (
                        case when marks >=60 and marks <= 69 then 7
                        else (
                            case when marks >=70 and marks <= 79 then 8
                            else (
                                case when marks >=80 and marks <= 89 then 9 else 10 end) end) end) end) end) end) end) end) end as grade from Students) as source order by grade desc, name, marks asc
