%dw 2.0
output application/csv
---
(payload flatMap ((item, index) -> 
    (item.Skills default []) ++ (item.Courses default []) map (
{
    "S.No": index,
    "Name": item.Name,
    "Role": item.Role,
    "Company": item.Company,
    "Location": item.Location,
    "Skill": $.Skill,
    "SkillExp": $.SkillExp,
    "Course": $.Course,
    "CourseExp": $.CourseExp
    }
 
    )
   
))  map ((item, index) -> 
    item  update {
        case ."S.No" -> index+1
    }
)





//here to transform the nested Array of objects into the csv format we write output "application/csv".we use  flatmap in that flatmap we can use (default []).default to a new value when left part is null then we use map and map the required values in map we could add "index+1" it means it will write index for every field.