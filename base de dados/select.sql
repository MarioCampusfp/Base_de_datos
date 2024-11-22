select cia, contacto, cargo, pais from cliente;
select * from cliente;
select nombre, medida, precio, stock, precio*stock as recaudacion from producto;
select cia, pais from cliente;
select distinct pais from cliente order by pais;
select cia, contacto, cargo, pais from cliente order by contacto;
select cia, contacto, cargo, pais from cliente order by cargo desc, contacto asc;
select nombre, medida, precio, stock, precio*stock as recaudacion from producto
where precio > 100;
select nombre, medida, precio, stock, precio*stock as recaudacion from producto where stock%2=1;
select nombre, medida, precio, stock, precio*stock as recaudacion from producto where pais <> "españa";
select * from producto where precio>=50 and precio<=100;
select * from cliente where cia>="c" and cia<="j" order by cia;
