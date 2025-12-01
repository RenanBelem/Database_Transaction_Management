drop database if exists Taverna;
CREATE DATABASE Taverna;
USE Taverna;

Create table cliente

(
    idcliente int,
    nomeCliente varchar(100),
   datanascCliente date,
   consumo int,
   primary key(idcliente)
);
insert into cliente values (1, "josé", "1999-08-11", 300);
insert into cliente values (2, "amaury", "1992-12-21", 419);
insert into cliente values (3, "jonas", "1996-06-30", 521);
insert into cliente values (4, "kleber", "1999-10-19", 128);
insert into cliente values (5, "valquiria", "1962-03-30", 264);
insert into cliente values (6, "fabiana", "1989-02-22", 190);

Create table cargo

(
    idcargo int,
    nomeCargo varchar(100),
    primary key(idcargo)
);
insert into cargo values (1, "gerente");
insert into cargo values (2, "barman");
insert into cargo values (3, "limpeza");
insert into cargo values (4, "garçom");
insert into cargo values (5, "recepção");

Create table funcionario

(
    idfunc int,
    nomeFunc varchar(100),
   datanascFunc date,
   salario int,
   fkidcargo int,
   primary key(idfunc),
   foreign key(fkidcargo) references cargo(idcargo)
);
insert into funcionario values (1, "abreu da silva neves", "1987-09-23", 3200, 1);
insert into funcionario values (2, "carlos drumond", "1912-08-13", 1800, 2);
insert into funcionario values (3, "neymar junior", "1987-02-24", 2000, 3);
insert into funcionario values (4, "karl marx", "1867-11-13", 2000, 4);
insert into funcionario values (5, "juscelino kubischek", "1932-12-08", 1800, 5);

Create table fornecedor

(
    idforn int,
    nomeForn varchar(100),
   precoForn int,
   produto varchar(100),
   primary key(idforn)
);
insert into fornecedor values (1, "jaqueline", 50, "arroz");
insert into fornecedor values (2, "josé", 120, "skol");
insert into fornecedor values (3, "marcio", 355, "valquiria");
insert into fornecedor values (4, "amaury", 250, "bife");
insert into fornecedor values (5, "legolas", 60, "feijão");

Create table bebida

(
	idbebida int,
    nomeBebida varchar(100),
    teor int,
   tipo varchar(100),
   raridade varchar(100),
   precoBebida int,
   primary key (idbebida)
);
insert into bebida values (1, "skol", 12, "cerveja", "comum", 6);
insert into bebida values (2, "askov", 35, "vodka", "comum", 18);
insert into bebida values (3, "itaipava", 14, "cerveja", "comum", 6);
insert into bebida values (4, "red label", 38, "uísque", "comum", 35);
insert into bebida values (5, "valquiria", 39, "hidromel", "rara", 30);
insert into bebida values (6, "imperio", 13, "cerveja", "rara", 8);

Create table comida

(
    idcomida int,
    nomeComida varchar(100),
   qntd int,
   precoComida int,
   primary key (idcomida)
);
insert into comida values (1, "bife", 32, 20);
insert into comida values (2, "arroz", 20, 5);
insert into comida values (3, "feijão", 25, 6);
insert into comida values (4, "empadão", 12, 15);
insert into comida values (5, "coxinha", 10, 7);

Create table qdmissoes

(
	idcontrato int,
    tipoQd varchar(100),
    contratante varchar(100),
   recompensa int,
   contratado varchar(100),
   primary key(idcontrato)
);
insert into qdmissoes values(1, "limpeza de terreno", "aluizio chulapa", 50, "carlos de jesus");
insert into qdmissoes values(2, "limpeza de terreno", "karl marx", 60, "carlos de jesus");
insert into qdmissoes values(3, "cobrança de dívida", "josé", 100, "sarrafiore");
insert into qdmissoes values(4, "entrega de procurado", "aluizio chulapa", 80, "josé");

Create table quarto

(
    num int,
    precoQuarto int,
   suite boolean,
   fkidfunc int,
   primary key(num),
   foreign key(fkidfunc) references funcionario(idfunc)
);
insert into quarto values(1, 30, true, 3);
insert into quarto values(2, 35, true, 3);
insert into quarto values(3, 20, false, 3);
insert into quarto values(4, 20, false, 3);
insert into quarto values(5, 25, false, 3);

Create table hospedagem

(
	idhosp int,
    duracao int,
    fkidcliente int,
    fknum int,
    primary key(idhosp),
    foreign key(fkidcliente) references cliente(idcliente),
    foreign key(fknum) references quarto(num)
);
insert into hospedagem values(1, 3, 1, 1);
insert into hospedagem values(2, 5, 2, 3);
insert into hospedagem values(3, 2, 1, 1);


Create table vendeFornBebida

(
    idfornB int,
    fkidforn int,
    fkidbebida int,
    primary key(idfornB),
    foreign key (fkidforn) references fornecedor(idforn),
    foreign key (fkidbebida) references bebida(idbebida)
);
insert into vendeFornBebida values(1, 1, 1);

Create table vendeFornComida

(
    idfornC int,
    fkidforn int,
    fkidcomida int,
    primary key(idfornC),
    foreign key (fkidforn) references fornecedor(idforn),
    foreign key (fkidcomida) references comida(idcomida)
);
insert into vendeFornComida values(1, 1, 1);

Create table vendeFuncBebida

(
	idfuncB int,
    fkidfunc int,
    fkidbebida int,
    primary key(idfuncb),
    foreign key (fkidfunc) references fornecedor(idforn),
    foreign key (fkidbebida) references bebida(idbebida)
);
insert into vendeFuncBebida values(1, 4, 1);
insert into vendeFuncBebida values(2, 2, 4);
insert into vendeFuncBebida values(3, 4, 3);
insert into vendeFuncBebida values(4, 2, 1);
insert into vendeFuncBebida values(5, 2, 1);
insert into vendeFuncBebida values(6, 4, 2);
insert into vendeFuncBebida values(7, 4, 2);
insert into vendeFuncBebida values(8, 4, 3);

Create table vendeFuncComida

(
    idfuncC int,
    fkidfunc int,
    fkidcomida int,
    primary key(idfuncC),
    foreign key (fkidfunc) references funcionario(idfunc),
    foreign key (fkidcomida) references comida(idcomida)
);
insert into vendeFuncComida values(1, 1, 1);

Create table compraClienteBebida

(
    idclienteB int,
    fkidcliente int,
    fkidbebida int,
    primary key(idclienteB),
    foreign key (fkidcliente) references cliente(idcliente),
    foreign key (fkidbebida) references bebida(idbebida)
);
insert into compraClienteBebida values(1, 1, 1);
insert into compraClienteBebida values(2, 1, 1);
insert into compraClienteBebida values(3, 2, 1);
insert into compraClienteBebida values(4, 3, 1);
insert into compraClienteBebida values(5, 4, 1);
insert into compraClienteBebida values(6, 6, 2);
insert into compraClienteBebida values(7, 5, 3);

Create table compraClienteComida

(
	idclienteC int,
	fkidcliente int,
    fkidcomida int,
    primary key(idclienteC),
    foreign key (fkidcliente) references cliente(idcliente),
    foreign key (fkidcomida) references comida(idcomida)
);
insert into compraClienteComida values(1, 1, 1);
insert into compraClienteComida values(2, 1, 2);
insert into compraClienteComida values(3, 1, 1);
insert into compraClienteComida values(4, 1, 4);
insert into compraClienteComida values(5, 2, 1);
insert into compraClienteComida values(6, 2, 1);
insert into compraClienteComida values(7, 2, 1);
insert into compraClienteComida values(8, 3, 2);
insert into compraClienteComida values(9, 3, 1);
insert into compraClienteComida values(10, 3, 4);
insert into compraClienteComida values(11, 4, 5);
insert into compraClienteComida values(12, 5, 1);
insert into compraClienteComida values(13, 5, 3);
insert into compraClienteComida values(14, 5, 3);
insert into compraClienteComida values(15, 1, 4);
insert into compraClienteComida values(16, 4, 5);
insert into compraClienteComida values(17, 4, 5);

Create table atendimento

(
    idatend int,
    fkidfunc int,
    fkidcliente int,
    primary key(idatend),
    foreign key (fkidfunc) references funcionario(idfunc),
    foreign key (fkidcliente) references cliente(idcliente)
);
insert into atendimento values(1, 1, 1);
insert into atendimento values(2, 2, 4);
insert into atendimento values(3, 2, 3);
insert into atendimento values(4, 4, 4);
insert into atendimento values(5, 1, 2);
insert into atendimento values(6, 5, 2);
insert into atendimento values(7, 3, 5);
insert into atendimento values(8, 3, 1);
insert into atendimento values(9, 3, 1);
insert into atendimento values(10, 2, 3);
insert into atendimento values(11, 5, 5);
insert into atendimento values(12, 4, 2);
insert into atendimento values(13, 4, 2);
insert into atendimento values(14, 1, 1);
insert into atendimento values(15, 2, 4);

create table contrata

(
	idregistro int,
    fkidcliente int,
    fkidcontrato int,
    primary key(idregistro),
    foreign key (fkidcliente) references cliente(idcliente),
    foreign key (fkidcontrato) references qdmissoes(idcontrato)
);

#Informações a serem extraídas:

#Quais são os clientes que mais compram bife?
select nomeCliente as "Cliente", count(*) as "Vezes que compraram bifes"
from cliente, comida, compraClienteComida
where nomeComida = "bife" and idcliente=fkidcliente
group by nomeCliente
order by count(*) desc;

#Quanto é o preço médio das bebidas raras?
Select avg(precoBebida) as "Preço médio das bebidas raras"
from bebida
where raridade = "rara"; 

#Qual o preço médio das bebidas?
Select avg(precoBebida) as "Preço médio das bebidas"
from bebida;

#Quais clientes possuem contrato no quadro de avisos?
Select nomeCliente as "Cliente", count(*) as "Número de contratos no quadro de avisos"
from cliente, qdmissoes
where nomeCliente = contratante or nomeCliente = contratado;

#Quantos salários são maiores do que 3000 reais?
Select nomeFunc as "Funcionário", salario as "Salários maiores do que R$3000,00"
from funcionario
where salario > 3000;

#Quais clientes consomem mensalmente mais de 200 reais?
Select nomeCliente as "Cliente", consumo as "Clientes que mensalmente consomem mais de R$200,00"
from cliente
where consumo > 200;

#Quanto é a recompensa média do quadro de missões?
select avg(recompensa) as "Recompensa média"
from qdmissoes;

#Quais os tipos de contrato no quadro de missões que são maioria?
select tipoQd as "Tipo de contrato", count(*) as "Quantidade no quadro"
from qdmissoes
GROUP BY tipoQd
ORDER BY count(*) desc;

#Qual é a bebida mais servida?
select nomeBebida as "Bebida", count(*) as "Vezes que foi servida"
from bebida, compraClienteBebida
group by idclienteB
order by count(*)
limit 1;

#Qual o preço médio das suítes?
select avg(precoQuarto) as "Preço médio das suítes"
from quarto
where suite = true;

#Qual é a comida mais cara?
select nomeComida as "Comida mais cara", precoComida as "Preço"
from comida
order by precoComida desc
limit 1;

#Existem fornecedores que também são clientes? Quais?
select nomeForn as "Fornecedores que também são clientes"
from fornecedor, cliente
where nomeForn = nomeCliente;

#Quais fornecedores custam mais de 500 reais?
select nomeForn as "Fornecedores que custam mais de R$500,00"
from fornecedor
where precoForn > 500;

#Qual a média de duração das hospedagens?
select avg(duracao) as "Média de duração das hospedagens em dias"
from hospedagem;

#Qual o funcionário que mais vende bebidas?
select nomeFunc as "Funcionário que mais vende bebidas", count(fkidfunc) as "Nº de bebidas vendidas"
from funcionario, vendeFuncBebida
where idfunc = fkidfunc
group by fkidfunc
order by count(fkidfunc) desc
limit 1;

#Existe o nome de algum cliente que coincida com o nome de alguma bebida?
Select nomeCliente as "Nome de clientes que também são nomes de bebidas"
from cliente, bebida
where nomeCliente = nomeBebida;

#Qual a média de teor alcoólico das bebidas?
select avg(teor) as "Média de teor alcoólico das bebidas (%)"
from bebida;

#Qual é o cliente mais velho da taverna?
select nomeCliente as "Cliente mais velho", YEAR(CURDATE())-YEAR(datanascCliente)-IF(MONTH(CURDATE())*32+DAY(CURDATE())<MONTH(datanascCliente)*32+DAY(datanascCliente),1,0) as "Idade"
from cliente
order by YEAR(CURDATE())-YEAR(datanascCliente)-
IF(MONTH(CURDATE())*32+DAY(CURDATE())<MONTH(datanascCliente)*32+DAY(datanascCliente),1,0) desc
limit 1;

#Quantos quartos são mais caros que 30 reais?
select num as "Número dos quartos mais caros que 30 reais"
from quarto
where precoQuarto > 30;

#Qual o preço médio das comidas?
select avg(precoComida) as "Preço médio das comidas"
from comida;

#Quais clientes compram bebida e não compram comida?
select nomeCliente as "Clientes que compram bebida e não compram comida"
from cliente, compraClienteBebida
where fkidcliente = idcliente and nomeCliente
not in (select nomeCliente from cliente, compraClienteComida where fkidcliente = idcliente);

#Qual o nome dos funcionários que atenderam o josé?
#PC
select nomeFunc as "Nome dos funcionários que atenderam José (PC)"
from cliente, funcionario, atendimento
where nomeCliente = "josé" and idcliente = fkidcliente and fkidfunc = idfunc;
#Junção
select nomeFunc as "Nome dos funcionários que atenderam José (Junção)"
from atendimento 
inner join cliente on idcliente = fkidcliente
inner join funcionario on fkidfunc = idfunc
where nomeCliente = "josé";

#TRANSAÇÕES

#aumento de 5% no preço do bife, começa a transação com o begin, 
#update e escolha da tabela a ser alterada, set para modificar determinada informação e where o filtro, 
#commit encerra e salva a transação
begin;
update comida 
set precoComida = precoComida + (precoComida/100 * 5)
where idcomida = 1;
commit;

#preço novo
select precoComida as "Preço do bife após transação"
from comida
where idcomida = 1;

#diminuição de preço dos quartos em 10%, começa a transação com o begin, 
#update e escolha da tabela a ser alterada, set para modificar determinada informação e where o filtro, 
#commit encerra e salva a transação
begin;
update quarto set precoQuarto = precoQuarto + (precoQuarto/100 * 10)
where num !=0 ;
commit;

#preço novo
select num as "Número do quarto", precoQuarto as "Preço dos quartos após transação"
from quarto
order by num;