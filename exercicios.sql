-- Lista de Exercicios --
-- 1 - Selecione o endereço e o salario do funcionário de nome ‘Luciana S. Santos
select endereco, salario
from Funcionario
where nomeFunc='Luciana S. Santos';
-- 2 - Selecione o nome e o salário dos funcionários que nasceram  entre os anos de 1960 e 1969,
-- inclusive, do sexo feminino e que ganham menos de 1000.
select nomeFunc, salario
from Funcionario
where dataNasc between '1960/01/01' and '1969/12/31' and sexo='F' and salario < 1000;
-- 3 - Selecione o nome dos dependentes do funcionário de nome ‘João B. Silva
select nomeDep
from Funcionario, Dependente
where Funcionario.idFunc = Dependente.idFunc and nomeFunc='João B. Silva';
-- 4 - Selecione o nome dos projetos que o funcionário de nome ‘Frank T. Santos’ trabalha
select nomeProj
from Funcionario F, Trabalha T,Projeto P
where nomeFunc='Frank T. Santos' and F.idFunc = T.idFunc and T.idProj = P.idProj;
-- 5 - Selecione o nome dos funcionários que trabalham em projetos controlados pelo departamento
-- de nome ‘ Construção’.
select nomeFunc
from Funcionario F, Trabalha T, Projeto P, Departamento D
where nomeDepto='Construçao' and P.idDepto = D.idDepto and T.idProj = P.idProj and F.idFunc = T.idFunc;
-- 6 - Selecione o  nome  dos funcionários  supervisionados pelo funcionário  de nome ‘Frank  T.
-- Santos’.
select A.nomeFunc
from Funcionario F, Funcionario A
where F.nomeFunc='Frank T. Santos' and F.idFunc = A.idSuperv;
-- 7 - Selecione o nome e endereço dos funcionários que não tem nenhum dependente.
select nomeFunc
from Funcionario
where idFunc not in
	(select idFunc
  from Dependente);
-- 8 - Selecione o nome dos funcionários que trabalham no departamento de nome ‘Pesquisa’ ou que
-- trabalham no projeto de nome ‘N. Benefícios’.
select nomeFunc
from Funcionario, Departamento
where nomeDepto = 'Pesquisa' and Departamento.idDepto = Funcionario.idDepto
union
select nomeFunc
from Funcionario F, Trabalha T, Projeto P
where nomeProj = 'N. Benefícios' and T.idProj = P.idProj and F.idFunc = T.idFunc;
-- 9 - Selecione   o   nome   dos   funcionários   que   trabalham   em   algum   projeto   controlado   pelo
-- departamento cujo gerente é o funcionário de nome ‘Júnia B. Mendes’.
select nomeFunc
from Funcionario F, Trabalha T, Projeto P, Departamento D
where nomeFunc = 'Júnia B. Mendes' and P.idDepto = D.idDepto and T.idProj = P.idProj and F.idFunc = T.idFunc;
-- 10 - Selecione o nome dos funcionários que trabalham em todos os projetos controlados pelo
-- departamento cujo gerente é o funcionário de nome ‘Júnia B. Mendes’.

-- 11 Selecione o nome dos funcionários e o nome de seus dependentes. Deve incluir o nome dos
-- funcionários sem dependentes
select nomeFunc, nomeDep
from Funcionario F LEFT OUTER JOIN Dependente D ON (F.idFunc = D.idFunc);
-- 12 - Selecione a quantidade de funcionários que trabalham no departamento que controla o projeto
-- de nome ‘ProdZ’.
select count(*) 
from Funcionario F, Trabalha T, Projeto P
where nomeProj = 'ProdZ' and T.idProj = P.idProj and F.idFunc = T.idFunc;
-- 13 - Selecione o nome dos funcionários e a quantidade de projetos que cada um trabalha mais de 10
-- horas.
select F.idFunc, nomeFunc, count(*)
from Funcionario F, Trabalha T, Projeto P
where numHoras > 10.00 and T.idProj = P.idProj and F.idFunc = T.idFunc
group by F.idFunc, nomeFunc;
