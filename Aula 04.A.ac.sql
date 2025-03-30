-- Aula 04.A.ac
  
--Questão 01: Crie uma relação a partir da união das tabelas student e takes.

-- Comando para unir as tabelas Student e Takes de forma a exibir todos os alunos que estudaram em uma data específica (outono de 2009)
SELECT * FROM student JOIN takes ON student.id = takes.id WHERE takes.year = 2009 and takes.semester = 'Fall';


/* Questão 2: Contar a quantidade de cursos realizados pelos alunos do departamento de Civil Eng.
Ordenar de maneira descendente a quantidade de cursos associada aos alunos.*/
SELECT student.ID, student.name, COUNT(takes.course_id) AS Qtde_Cursos
FROM student 
JOIN takes ON student.ID = takes.ID
WHERE student.dept_name = 'Civil Eng.'
GROUP BY student.id, student.name 
ORDER BY Qtde_Cursos DESC;

-- Questão 3: Criar uma view chamada 'civil_eng_students' a partir da relação construída na Questão 2.

CREATE VIEW civil_eng_students AS
SELECT student.ID, student.name, COUNT(takes.course_id) AS total_cursos
FROM student
JOIN takes ON student.ID = takes.ID
WHERE student.dept_name = 'Civil Eng.'
GROUP BY student.ID, student.name;
-- o SQL padrão não permite utilizar ORDER BY dentro de uma VIEW, então tive que remover






