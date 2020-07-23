1. Nazwy oraz liczba poszczególnych dla typów użytkowników, rosnąco po liczbie:

SELECT roles.name, COUNT(*) AS count
FROM roles
         LEFT JOIN users ON id_role = roles.id
GROUP BY roles.name
ORDER BY count;



4. Nazwa klasy oraz liczba studentów przypisanych do niej, malejąco po liczbie studentów, tylko dla klas w których jest przynajmniej jeden student:

SELECT classrooms.name, COUNT(*) AS count
FROM classrooms
         LEFT JOIN user_classrooms uc on classrooms.id = uc.classroom_id
         LEFT JOIN users u on uc.user_id = u.id
WHERE classroom_id is not null
  AND id_role = 1
GROUP BY classrooms.name
ORDER BY count DESC;



7. Status questu, liczba questów o takim statusie, % z całkowitej liczby questów w zadanej kolejności:

SELECT status, count, count * 100 / sum || '%' as percent_of_all
from (SELECT 'Finished' AS status, count(*) as count
      FROM quests
               LEFT JOIN user_quests uc on uc.quest_id = quests.id
      WHERE uc.accepted = TRUE

      UNION
      SELECT 'Uncompleted' AS status, count(*) as count
      FROM quests
               LEFT JOIN user_quests uc on uc.quest_id = quests.id
      WHERE uc.accepted = FALSE

      UNION
      SELECT 'Never started' AS status, count(*) as count
      FROM quests
               LEFT JOIN user_quests uc on uc.quest_id = quests.id
      WHERE uc.accepted is null) as a,
     (SELECT count(*) as sum
      FROM quests
               LEFT JOIN user_quests uc
                         on uc.quest_id = quests.id) as b
group by status, count, sum
ORDER BY case status
             when 'Finished' then 1
             when 'Uncompleted' then 2
             when 'Never started' then 3
             else 4
             end;



10. Nazwisko i imię studenta oraz liczba ukończonych questów - top 5 studentów, w kolejności od studenta z największą liczbą ukończonych questów a następnie w kolejności alfabetycznej:

select distinct surname || ' ' || u.name as student, count(*) as quests_done
from quests q
         left join user_quests uq on q.id = uq.quest_id
         left join users u on uq.user_id = u.id
where accepted = true
group by u.name, surname
order by quests_done desc, student
limit 5;



13. Nazwisko i imię studenta oraz liczba zakupionych artefaktów - top 5 studentów, którzy kupili najwięcej artefaktów:

select student, sum(artifacts_bought) as bought_items
from (select surname || ' ' || u.name as student, count(*) as artifacts_bought
      from items i
               left join user_items ui on i.id = ui.item_id
               left join users u on ui.user_id = u.id
      where u.name is not null
      group by u.name, u.surname

      union all
      select u.name || ' ' || surname as student, count(*) as artifacts_bought
      from students_shopping ss
               left join users u on ss.user_id = u.id
               left join group_shopping gs on shopping_id = gs.id
      where gs.is_paid = true
      group by u.name, u.surname) as sabsab
group by student
order by bought_items desc
limit 5;

