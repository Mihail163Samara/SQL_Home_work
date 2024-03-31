/* Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 Данная промежуточная аттестация оценивается по системе "зачет" / "не зачет" "Зачет" ставится, если слушатель успешно выполнил 1 или 2 задачи "Незачет" ставится, если слушатель успешно выполнил 0 задач
Критерии оценивания:
1 - слушатель верно создал функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
2 - слушатель выведили только четные числа от 1 до 10.

Работа сдается через гит. В качестве решения загрепите ссылку на удаленный репозиторий с решением. Файл с решением должен иметь расширение .sql
*/


DELIMITER $$

CREATE PROCEDURE even_numbers(n INT)
BEGIN
    SET @i := 2;
    SET @result := '';
    WHILE @i <= n DO
        SET @result = CONCAT(@result, ' ', @i);
        SET @i = @i + 2;
    END WHILE;

    IF n % 2 = 0 THEN
        SET @result = CONCAT(@result, ' ', n);
    END IF;

    SELECT TRIM(LEADING ' ' FROM @result);
END $$

DELIMITER ;

CALL even_numbers(100);


DELIMITER $$

CREATE PROCEDURE find_days(n INT)
BEGIN
    DECLARE result VARCHAR(50);
    
    SET @days := FLOOR(n / 86400);
    SET @remained_seconds := n % 86400;
    SET @hours := FLOOR(@remained_seconds / 3600);
    SET @remained_seconds := @remained_seconds % 3600;
    SET @minutes := FLOOR(@remained_seconds / 60);
    SET @remained_seconds := @remained_seconds % 60;
    
    SET result = CONCAT(
        IFNULL(CONCAT(@days, ' days '), ''),
        IFNULL(CONCAT(@hours, ' hours '), ''),
        IFNULL(CONCAT(@minutes, ' minutes '), ''),
        IFNULL(CONCAT(@remained_seconds, ' seconds '), '')
    );
    
    SELECT TRIM(TRAILING ' ' FROM result);
END$$

DELIMITER ;

CALL find_days(7989200);