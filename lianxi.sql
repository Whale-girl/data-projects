
/*
SHOW DATABASES;

USE xunlian;

SHOW TABLES;

SELECT * FROM shuang11;

SELECT * FROM orders;

SELECT * FROM order_items;
*/
/*
#第三题
SELECT
  *
FROM users
WHERE city IN (SELECT city FROM users GROUP BY city HAVING COUNT(*) > 1);

#第四题
SELECT
  *
FROM users
WHERE reg_date > (SELECT reg_date FROM users WHERE username = 'Alice');

#第五题
SELECT
  *
FROM users
WHERE LENGTH(username) > (SELECT AVG(LENGTH(username)) FROM users);

#第六题
SELECT
  *
FROM users
WHERE reg_date > (SELECT MAX(reg_date) FROM users where city = '北京');

#第七题
SELECT
  *
FROM users
WHERE reg_date > (SELECT MAX(reg_date) FROM users where city = '上海') AND city != '北京';

#第八题
SELECT
  *
FROM users
WHERE reg_date BETWEEN (SELECT AVG(reg_date) - INTERVAL 3 DAY FROM users) AND (SELECT AVG(reg_date) + interval 3 DAY FROM users);
#第九题
SELECT
  *
FROM
  users
WHERE
  username NOT LIKE '%a%'
  AND reg_date < (SELECT MAX(reg_date) FROM users WHERE username LIKE '%a%');

#第十题
SELECT
  *
FROM users
WHERE city = (SELECT city FROM users GROUP BY city ORDER BY COUNT(*) ASC LIMIT 1);
*/

/*
#第二次子查询练习

#第一题
SELECT
  *
FROM users
WHERE user_id IN (SELECT DISTINCT user_id FROM orders);

#第二题
SELECT
  *
FROM users
WHERE user_id NOT IN (SELECT DISTINCT user_id FROM orders);

#第三题
SELECT 
  *
FROM users
WHERE user_id = (SELECT user_id FROM orders ORDER BY total_amount ASC LIMIT 1);

#第四题
SELECT
 *
FROM users
WHERE user_id IN (
SELECT
  user_id
FROM orders
WHERE  total_amount > (SELECT AVG( total_amount) FROM orders));

#第五题
SELECT
  *
FROM users
WHERE user_id IN (
SELECT
  user_id
FROM orders
WHERE order_id IN (
SELECT
  order_id
FROM order_items
WHERE product_name = '充电宝'));

#第六题
SELECT
  *
FROM users
where user_id IN (
SELECT
  user_id
FROM );
*/

/*
#第一题
SELECT
  o.order_id,u.username,o.total_amount
FROM
  orders o
  INNER JOIN users u ON o.user_id = u.user_id;
  
#第二题
SELECT
  u.username,o.order_date
FROM users u
LEFT JOIN orders o ON o.user_id = u.user_id;

#第三题
SELECT
  u.username,o.total_amount
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id
ORDER BY o.total_amount DESC LIMIT 3;

#第四题
SELECT
  u.username,SUM(o.total_amount) AS '总金额'
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
GROUP BY u.username
ORDER BY '总金额' DESC;

#第五题
SELECT DISTINCT
  u.username
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
WHERE u.user_id IN (SELECT
  user_id
FROM orders
GROUP BY user_id
HAVING COUNT(*) > 1);

#第六题
SELECT
  u.username,o.order_id,o.total_amount
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
WHERE city = '北京';

#第七题
SELECT
  u.username,o.order_date,o.total_amount
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
WHERE reg_date < '2026-03-01';

#第八题
SELECT
  u.city,SUM(total_amount)
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
GROUP BY u.city
ORDER BY SUM(total_amount) ASC;

#第九题
SELECT
  u.username,o.order_date
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.order_date IS NULL;

#第十题
SELECT
  u.username,AVG(o.total_amount) AS '平均订单金额'
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
GROUP BY u.username
HAVING AVG(o.total_amount) > 100;
*/

/*
#join练习
#第一题
SELECT
  o.order_id,u.username,u.city
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
ORDER BY total_amount DESC;

#第二题
SELECT
  u.username,SUM(o.total_amount)
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
GROUP BY u.username
HAVING SUM(o.total_amount) > 100;

#第三题
SELECT
  u.username,o.order_date AS 'latest_order_date'
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
ORDER BY o.order_date ASC LIMIT 1;

#第四题
SELECT
  u.city,COUNT(*) AS 'order_count'
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
GROUP BY u.city;

#第五题
SELECT
  u.username,o.order_date,o.total_amount
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
WHERE u.reg_date < '2025-03-01';

#第六题
SELECT
  u.username,COUNT(*) AS '下单数'
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
GROUP BY u.username
ORDER BY COUNT(*) DESC LIMIT 1;

#第七题
SELECT
  u.city,SUM(o.total_amount)
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
GROUP BY u.city
HAVING u.city = '北京';

#第八题
SELECT
  u.username,ROUND(AVG(o.total_amount),2) AS 'avg_amount'
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
GROUP BY u.username
HAVING avg_amount < 100;

#第九题
SELECT
  u.username,o.order_date,o.total_amount
FROM users u
INNER JOIN orders o ON u.user_id = o.user_id
WHERE o.order_date BETWEEN '2026-02-01' AND '2026-02-28';

#第十题
SELECT
  u.username,o.order_date
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
WHERE o.order_date IS NULL;
*/

#第一次模拟实战（练习表：guanggao）
SHOW DATABASES;

USE xunlian;

SHOW TABLES;

SELECT * FROM shuang11;

/*
#第一题
SELECT
  *
FROM guanggao
WHERE 产品类型 = '数码'
ORDER BY 销售收益 DESC LIMIT 5;

#第二题
SELECT
  渠道,
  SUM(广告花费) AS '总广告花费',
  SUM(销售收益) AS '总销售收益'
FROM guanggao
GROUP BY 渠道
ORDER BY SUM(销售收益) DESC;

#第三道题
SELECT
  广告ID,
  产品类型,
  渠道,
  ROI
FROM guanggao
WHERE ROI > 5 AND 点击量 > 5000;
/*
#第四道题
SELECT
  产品类型,
  ROUND(AVG(ROI),2) AS '平均ROI'
FROM guanggao
GROUP BY 产品类
HAVING AVG(ROI) > 4;

#第五题
SELECT
  广告ID,
  ROI
FROM guanggao
WHERE 投放天数 >= 14 AND 渠道 = '搜索引擎'
ORDER BY ROI DESC LIMIT 3;

#第六题
SELECT
  渠道,
  COUNT(广告ID) AS '广告数量',
  ROUND(AVG(点击量),2) AS '平均点击量',
  ROUND(AVG(ROI),2) AS '平均ROI'
FROM guanggao
GROUP BY 渠道
ORDER BY 平均ROI ASC;

#第七题
SELECT
  广告ID,
  产品类型,
  销售收益
FROM guanggao
WHERE 销售收益 > (SELECT AVG(销售收益) FROM guanggao);


#第八题
SELECT
  广告ID,
  产品类型,
  ROI
FROM guanggao
WHERE ROI IN (
SELECT
  max_roi
FROM (SELECT
  产品类型,
  MAX(ROI) AS 'max_roi'
FROM guanggao
GROUP BY 产品类型) AS guangao2);

#第九题
SELECT
  COUNT(*)
FROM guanggao
WHERE 点击量 > 6000 AND 广告花费 < 5000 AND ROI > 5;

#第十题
SELECT 投放天数, AVG(ROI) AS '平均ROI'
FROM guanggao
GROUP BY 投放天数
ORDER BY 投放天数 ASC;
*/

/*
#子查询练习（引用表guanggao）
#第一题
SELECT
  广告ID,
  产品类型,
  ROI
FROM guanggao
WHERE ROI > (SELECT AVG(ROI) FROM guanggao);

#第二题
SELECT
  广告ID,
  产品类型,
  销售收益
FROM guanggao
WHERE 销售收益 > (SELECT AVG(销售收益) FROM guanggao WHERE 产品类型 = '数码');

#第三题
 SELECT
  广告ID,
  产品类型,
  销售收益
FROM guanggao
WHERE 产品类型 = '食品' AND (SELECT AVG(点击量) FROM guanggao WHERE 产品类型 = '服装');

#第四题
SELECT
  广告ID,
  产品类型,
  渠道,
  ROI
FROM guanggao
WHERE ROI = (SELECT MAX(ROI) FROM guanggao);

#第五题
SELECT
  广告ID,
  投放天数,
  渠道
FROM guanggao
WHERE 投放天数 > (SELECT AVG(投放天数) FROM guanggao WHERE 渠道 = '微信');

#第六题
SELECT
  广告ID,
  产品类型,
  渠道,
  ROI
FROM guanggao
WHERE 广告花费 < (SELECT MIN(广告花费) FROM guanggao WHERE 产品类型 = '数码');

#第七题
SELECT
  广告ID,
  产品类型,
  销售收益
FROM guanggao
WHERE 销售收益 > ANY (SELECT 销售收益 FROM guanggao WHERE 产品类型 = '服装');

#第八题
SELECT
  广告ID,
  点击量
FROM guanggao
WHERE 点击量 > (SELECT AVG(点击量) FROM guanggao WHERE 产品类型 = '家居') AND 产品类型 = '数码';

#第九题
SELECT
  广告ID,
  渠道,
  ROI
FROM guanggao
WHERE 渠道 = '抖音' AND ROI > (SELECT AVG(ROI) FROM guanggao WHERE 渠道 = '微信');

#第十题
SELECT
  广告ID,
  产品类型,
  广告花费,
  ROI
FROM guanggao
WHERE 广告花费 < (SELECT ROI FROM guanggao WHERE 产品类型 = '食品');
*/

/*
#qudao_cost和guanggao进行join练习
SELECT * FROM qudao_cost;

#第一题
SELECT
  g.广告ID,
  g.产品类型,
  g.渠道,
  g.销售收益,
  q.负责人
FROM guanggao g
INNER JOIN qudao_cost q ON g.渠道 = q.渠道;

#第二题
SELECT
  g.广告ID,
  g.ROI,
  q.折扣率
FROM guanggao g
INNER JOIN qudao_cost q ON g.渠道 = q.渠道;

#第三题
SELECT
  g.渠道,
  SUM(g.广告花费) AS '广告总花费',
  SUM(g.销售收益) AS '总销售收益',
  q.固定成本,
  q.季度目标
FROM guanggao g
INNER JOIN qudao_cost q ON g.渠道 = q.渠道
GROUP BY g.渠道;

#第四题
SELECT
  g.渠道,
  ROUND(AVG(g.ROI),2) AS '平均ROI',
  q.负责人
FROM guanggao g
INNER JOIN qudao_cost q ON g.渠道 = q.渠道
GROUP BY g.渠道
HAVING AVG(g.ROI) > 3;

#第五题
SELECT
  g.广告ID,
  g.产品类型,
  g.销售收益,
  q.季度目标
FROM
  guanggao g
  INNER JOIN qudao_cost q ON g.渠道 = q.渠道
WHERE
  g.销售收益 > q.季度目标 * 10000;
  
#第六题
SELECT
  q.负责人,
  SUM(g.销售收益) AS '总收益',
  SUM(g.广告花费) AS '总花费'
FROM guanggao g
INNER JOIN qudao_cost q ON g.渠道 = q.渠道
GROUP BY q.负责人;

#第七题
SELECT
  g.广告ID,
  g.销售收益,
  q.折扣率
FROM guanggao g
INNER JOIN qudao_cost q ON g.渠道 = q.渠道
WHERE g.渠道 = '抖音' AND  销售收益 > (SELECT AVG(销售收益) FROM guanggao);

#第八题
SELECT
  ROUND(g.广告花费 * q.折扣率,2) AS '实际成本',
  g.广告ID,
  g.产品类型
FROM guanggao g
INNER JOIN qudao_cost q ON g.渠道 = q.渠道
ORDER BY 实际成本 DESC;

#第九题
SELECT
  g.渠道,
  COUNT(*)
FROM guanggao g
INNER JOIN qudao_cost q ON g.渠道 = q.渠道
WHERE g.销售收益 > q.季度目标 * 10000
GROUP BY g.渠道;

SELECT
  *
FROM
  guanggao g
  INNER JOIN qudao_cost q ON g.渠道 = q.渠道
WHERE
  销售收益 IN (
  SELECT
    max_销售收益
  FROM (SELECT
  g.渠道,
  MAX(销售收益) AS 'max_销售收益'
FROM guanggao g
INNER JOIN qudao_cost q ON g.渠道 = q.渠道
GROUP BY g.渠道) AS 表二);
*/
/*
#双11模拟实战
#第一题
SELECT
  title,
  price,
  sale_count
FROM shuang11
WHERE title LIKE '%雅诗兰黛%' AND price > 500
ORDER BY price DESC;

#第二题
SELECT
  店名,
  COUNT(*) AS '商品数'
FROM shuang11
GROUP BY 店名
ORDER BY 商品数 DESC;

#第三题
SELECT
  title,
  sale_count,
  店名
FROM shuang11
ORDER BY sale_count DESC LIMIT 5;

#第四题
SELECT
  店名,
  ROUND(AVG(comment_count),0) AS '平均评论数'
FROM shuang11
GROUP BY 店名
HAVING 平均评论数 > 500;

#第五题
SELECT
  title,
  price,
  sale_count
FROM shuang11
WHERE price BETWEEN 100 AND 300 AND sale_count > 10000;

#第六题
SELECT
  title,
  price,
  店名
FROM shuang11
WHERE title LIKE '%小棕瓶%';

#第七题
SELECT
  update_time,
  SUM(sale_count) AS '销量总和',
  SUM(comment_count) AS '评论数量之和'
FROM shuang11
WHERE 店名 = '雅诗兰黛' AND update_time IN ('2022-11-10', '2022-11-11')
GROUP BY update_time;
/*
#第八题
SELECT
  店名,
  title,
  sale_count
FROM shuang11 a
WHERE sale_count = (SELECT MAX(sale_count) FROM shuang11 b WHERE b.店名 = a.店名);
*/
/*
#第九题
USE xunlian;
SELECT
  title,
  price,
  店名
FROM
  shuang11 s1
WHERE
  price > (SELECT AVG(price) FROM shuang11 s2 WHERE s2.店名 = s1.店名);
*/
/*
#相关子查询练习（shuang11）
#第一题
SELECT
  title,
  price,
  店名
FROM shuang11
WHERE price > (SELECT AVG(price) FROM shuang11);

#第二题
SELECT
  title,
  sale_count,
  店名
FROM shuang11
WHERE sale_count > (SELECT AVG(sale_count) FROM shuang11 WHERE 店名 = '雅诗兰黛');

#第三题
SELECT
  title,
  comment_count,
  店名
FROM shuang11
WHERE comment_count > ANY (SELECT comment_count FROM shuang11 WHERE 店名 = '自然堂');

#第四题
SELECT
  *
FROM shuang11 a
WHERE 店名 IN (
SELECT
  店名
FROM shuang11
GROUP BY 店名
HAVING COUNT(*) > 1);

#第五题
USE xunlian;
SELECT
  *
FROM shuang11
WHERE price IN (SELECT price FROM shuang11 WHERE title LIKE '%雅诗兰黛小棕瓶眼霜%' LIMIT 1) AND title NOT LIKE '%雅诗兰黛小棕瓶眼霜%';

#第六题
SELECT
  DISTINCT 店名
FROM shuang11 s1
WHERE EXISTS (
SELECT
  1
FROM shuang11 s2
WHERE s2.店名 = s1.店名 AND s2.price > 1000);

#第七题
SELECT
  title,
  price,
  店名
FROM shuang11 a
WHERE price > (SELECT AVG(price) FROM shuang11 b WHERE b.店名 = a.店名);

#第八题
SELECT
  title,
  sale_count,
  店名
FROM shuang11
WHERE sale_count < ALL (SELECT sale_count FROM shuang11 WHERE 店名 = '玉兰油');

#第九题
SELECT
  DISTINCT 店名
FROM shuang11
WHERE 店名 IN (SELECT 店名 FROM shuang11 WHERE comment_count = 0);

#第十题
USE xunlian;
SELECT
  title,
  price,
  店名
FROM shuang11
WHERE price > ALL (select MAX(price) FROM shuang11 WHERE 店名 = '资生堂');
*/
#模拟测试
#第一题
SELECT
  title,
  price,
  sale_count
FROM shuang11
WHERE price > 200 AND sale_count > 10000;

#第二题
SELECT
  店名,
  COUNT(*) AS '商品数'
FROM shuang11
GROUP BY 店名
ORDER BY 商品数 ASC;

#第三题
SELECT
  title,
  sale_count,
  店名
FROM shuang11
ORDER BY sale_count DESC LIMIT 3;

#第四题
SELECT
  title,
  price,
  店名
FROM shuang11
WHERE title LIKE '%精华%';

#第五题
SELECT
  DISTINCT 店名,
  comment_count,
  title
FROM shuang11
WHERE comment_count = 0;

#第六题
SELECT
  店名,
  ROUND(AVG(price),0) AS '平均价格'
FROM shuang11
GROUP BY 店名
HAVING 平均价格 > 200;

#第七题
SELECT
  SUM(sale_count) AS '总销量',
  SUM(comment_count) AS '总评论数'
FROM shuang11
WHERE update_time BETWEEN '2022/11/10' AND '2022/11/11';

/*
#第八题
SELECT
  price,
  COUNT(*)
FROM shuang11
WHERE price #在这里加CASE WHEN? 然后加一堆字符串划分区间？
#(接下来的不会了)
*/
/*
#第九题
SELECT
  sale_count,
  price,
  title
FROM shuang11 a
WHERE sale_count IN (SELECT MAX(sale_count) FROM shuang11 b WHERE b.店名 = a.店名);

#第十题
SELECT
  title,
  sale_count,
  price
FROM shuang11 q
WHERE price > (SELECT AVG(price) FROM shuang11 d WHERE d.店名 = q.店名);
*/

#第十一题
SELECT
  title,
  price,
  店名
FROM shuang11
WHERE price > (SELECT AVG(price) FROM shuang11);

#第十二题
SELECT
  title,
  sale_count,
  店名
FROM shuang11
WHERE sale_count > (SELECT AVG(sale_count) FROM shuang11 WHERE 店名 = '自然堂');

#第十三题
SELECT
  title,
  店名,
  comment_count
FROM shuang11
WHERE comment_count > (SELECT MIN(comment_count) FROM shuang11 WHERE 店名 = '悦诗风吟');

#第十四题
SELECT
  DISTINCT 店名
FROM shuang11 a2
WHERE EXISTS (SELECT 1 FROM shuang11 b2 WHERE b2.店名 = a2.店名 AND price > 1000);

#第十五题
SELECT
  *
FROM shuang11
WHERE 店名 IN (
SELECT
  店名
FROM (
SELECT
  店名,
  COUNT(*) AS '商品数'
FROM shuang11
GROUP BY 店名
HAVING 商品数 > 1) AS tible1);

#第十六题
SELECT
  *
FROM (SELECT
  title,
  sale_count,
  店名
FROM shuang11
ORDER BY sale_count DESC LIMIT 10) AS tible2
WHERE sale_count BETWEEN 1810000 AND 1830000;
#(由于我不知道如何使用偏移量，所以我通过将子查询作为表＋between函数实现了对特定排名进行切片)

#第十七题
SELECT
  *
FROM shuang11 a3
WHERE price = (SELECT MAX(price) FROM shuang11 b3 WHERE b3.店名 = a3.店名) AND price > (SELECT AVG(price) FROM shuang11 b3 WHERE b3.店名 = a3.店名) * 1.5;

#第十八题
SELECT
  店名,
  COUNT(*) AS '商品数量'
FROM shuang11
WHERE sale_count > 50000 AND comment_count > 5000
GROUP BY 店名
HAVING 商品数量 > 2;

#第十九题
#(还是老样子，我不懂用窗口函数，我干脆用子查询作为表＋between函数，尝试实现一下。,这题先空着)

#第二十题
USE xunlian
SELECT
  店名,
  title,
  sale_count
FROM shuang11 a4
WHERE sale_count > (SELECT AVG(sale_count) FROM shuang11 b4 WHERE b4.店名 = a4.店名) * 2
ORDER BY sale_count DESC;

