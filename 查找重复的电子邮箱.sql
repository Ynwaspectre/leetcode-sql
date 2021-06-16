-- 
-- 编写一个 SQL 查询，查找 Person 表中所有重复的电子邮箱。

-- 示例：

-- +----+---------+
-- | Id | Email   |
-- +----+---------+
-- | 1  | a@b.com |
-- | 2  | c@d.com |
-- | 3  | a@b.com |
-- +----+---------+
-- 根据以上输入，你的查询应返回以下结果：

-- +---------+
-- | Email   |
-- +---------+
-- | a@b.com |
-- +---------+
-- 说明：所有电子邮箱都是小写字母。

-- 来源：力扣（LeetCode）
-- 链接：https://leetcode-cn.com/problems/duplicate-emails
-- 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
--


-- 思路:先计算出一个每个Email数量的临时表，需要group by 一下 如下:
-- 然后从表里拿出数量大于1的 即为重复的Email
-- +----+---------+
-- | Email | num   |
-- +----+---------+
-- | a@b.com  | 2 |
-- | c@d.com  | 1 |
-- +----+---------+


-- 临时表
SELECT
	Email 
FROM
	( SELECT Email, count( Email ) AS num FROM Person GROUP BY Email ) temp    
WHERE
	num >1



-- 直接大于1
select email from Person group by Email having count(Email)>1