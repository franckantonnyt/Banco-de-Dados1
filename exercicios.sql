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
from Funcionario, Projeto
where Funcionario.idDepto = Projeto.idDepto and nomeFunc='Frank T. Santos';
-- 5 - Selecione o nome dos funcionários que trabalham em projetos controlados pelo departamento
-- de nome ‘ Construção’.
select nomeFunc
from Funcionario, Departamento
where Funcionario.idDepto = Departamento.idDepto and nomeDepto='Construçao';
-- 6 - Selecione o  nome  dos funcionários  supervisionados pelo funcionário  de nome ‘Frank  T.
-- Santos’.
select nomeFunc 
from Funcionario
where idSuperv > all
	(select idFunc 
	from Funcionario
	where nomeFunc='Frank T.Santos');