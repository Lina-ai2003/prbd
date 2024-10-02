SELECT 
    `director`.`dirname`, `director`.`facult`
FROM
    `univer008_Lina`.`director`
WHERE
    `director`.`facult` = 'ФТП';
    
    SELECT 
    `director`.`dirname`, `director`.`facult`, `employee`.`empname`
FROM
    `director`, `employee`
WHERE
    `employee`.`director_#director` = `director`.`#director` and `director`.`facult` = "ИФМИТО";
    
    SELECT 
    distinct  `student`.`studname` as "имя студента",`student`.`group_#gr` as "группа", `vedomost`.`mark` as "оценка",`subject`.`sabjname` as "предмет"
FROM
 `student`,`vedomost`, `subject`
WHERE
 `vedomost`.`mark` = "5" and `student`.`group_#gr` = "001" and `subject`.`sabjname` = "химия" and `vedomost`.`student_#stud` = `student`.`#stud`=`subject`.`sabjname`;
 
 
    