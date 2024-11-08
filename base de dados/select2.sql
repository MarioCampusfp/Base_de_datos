select cia, cargo, ciudad, pais from cliente where ciudad ="buenos aires";
select cia, contacto, cargo, ciudad, pais from cliente where ciudad in ("buenos aires","campinas","caracas");
select * from producto where idcategoria=1 and precio>=10 and precio<=50;
select * from cliente where idcliente="BLONP";
select * from producto where stock=0;