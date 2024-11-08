select pais, count(idcliente)
from cliente
group by pais;

select detalle.idpedido, sum(precio*unidades) as importe
from detalle inner join pedido
on pedido.idpedido = detalle.idpedido
group by idpedido;

