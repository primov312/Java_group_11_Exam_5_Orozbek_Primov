#1.       Сколько и каких товаров доставлено на указанный склад за указанный период дат.
select products.product, given.qty from given join products on given.product_id = products.id 
WHERE given.action_date>='2022-04-01 00:00:00' and given.action_date<='2022-05-01 23:59:59' and given.sklad_id = 1 order by products.product;
#2 Сколько и каких товаров забрали (списали) с указанного склада за указанный период дат.
select products.product, took.qty from took join products on took.product_id = products.id 
WHERE took.action_date>='2022-01-01 00:00:00' and took.action_date<='2022-03-01 23:59:59' and took.sklad_id = 2 order by products.product;
#3.       Какое количество товаров и каких категорий доставлено на указанный склад за указанный период дат.
select categories.category, sum(given.qty) from given join products on given.product_id = products.id join categories on products.category_id = categories.id
WHERE given.action_date>='2022-04-01 00:00:00' and given.action_date<='2022-05-01 23:59:59' and given.sklad_id = 2 group by categories.category order by categories.category;
#4.       Какое количество и каких брендов товаров доставлено на указанный склад за указанный период дат
SELECT brands.brand, SUM(given.qty) as qty from given  join products on given.product_id = products.id
left join brands on products.brand_id = brands.id group by brands.brand order by brands.brand;
#5.       Количественные остатки товаров на выбранном складе на указанную дату.
select products.product, sum(soderjimoe_skladov.qty) from soderjimoe_skladov join products on soderjimoe_skladov.product_id = products.id
 where soderjimoe_skladov.action_date<='2022-01-01 23:59:59' and soderjimoe_skladov.sklad_id = 2 group by products.product order by products.product;
#6    Сколько и каких товаров поставил на все склады указанный контрагент за указанный период дат.
select products.product, sum(given.qty) from given join products on given.product_id = products.id 
where given.action_date>='2022-04-01 00:00:00' and given.action_date<='2022-07-01 23:59:59' and given.contragent_id = 2 group by products.product order by products.product;
#7  Сколько и каких товаров поставил указанный контрагент на выбранный склад за указанный период дат.
select products.product, sum(given.qty) from given join products on given.product_id = products.id 
where given.action_date>='2022-04-01 00:00:00' and given.action_date<='2022-07-01 23:59:59' and given.contragent_id = 2 and given.sklad_id = 2 group by products.product
 order by products.product;
#8.       Сколько и каких товаров выдано указанному контрагенту с выбранного склада за указанный период дат.
select products.product, sum(took.qty) from took join products on took.product_id = products.id 
where took.action_date>='2022-01-01 00:00:00' and took.action_date<='2022-03-01 23:59:59' and took.contragent_id = 1 and took.sklad_id = 1 group by products.product
 order by products.product;
 #9.       Какие контрагенты и в каком количестве поставили указанный товар на все склады за указанный период дат
 select contragent.supplier, sum(given.qty)  as количество from given join contragent on given.contragent_id = contragent.id 
 where given.action_date>='2022-01-01 00:00:00' and given.action_date<='2022-12-01 23:59:59' group by contragent.supplier order by количество desc;
#10.   Каким контрагентам и в каком количестве был выдан указанный товар со всех складов за указанный период дат.
 select contragent.supplier, sum(took.qty)  as количество from took join contragent on took.contragent_id = contragent.id 
 where took.action_date>='2022-01-01 00:00:00' and took.action_date<='2022-12-01 23:59:59' group by contragent.supplier order by количество desc;
 #11.   Сколько и каких товаров поступило на указанный склад с других складов за указанный период дат.
 select products.product, given.qty from given join products on given.product_id = products.id 
 where given.sklad_id = 1 and given.action_date>='2022-01-01 00:00:00' and given.action_date<='2022-5-01 23:59:59' 
 group by products.product order by products.product;
 #12.   Сколько и каких товаров передано с указанного склада на другие склады за указанный период дат
  select products.product, took.qty from took join products on took.product_id = products.id 
 where took.sklad_id = 2 and took.action_date>='2022-01-01 00:00:00' and took.action_date<='2022-5-01 23:59:59' 
 group by products.product order by products.product;
 