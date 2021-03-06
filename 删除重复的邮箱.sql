-- 编写一个 SQL 查询，来删除 Person 表中所有重复的电子邮箱，重复的邮箱里只保留 Id 最小 的那个。

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- | 3  | john@example.com |
-- +----+------------------+
-- Id 是这个表的主键。
-- 例如，在运行你的查询语句之后，上面的 Person 表应返回以下几行:

-- +----+------------------+
-- | Id | Email            |
-- +----+------------------+
-- | 1  | john@example.com |
-- | 2  | bob@example.com  |
-- +----+------------------+
--  

-- 提示：

-- 执行 SQL 之后，输出是整个 Person 表。
-- 使用 delete 语句。

-- 来源：力扣（LeetCode）
-- 链接：https://leetcode-cn.com/problems/delete-duplicate-emails
-- 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。


-- 思路：没思路 不会。。看了题解是用到了自连接  连接自己 然后 在从p1里挑出
-- 与p2 Email相同 但是p1.id>p2.id, p1里id=1的 只能找到id相同的 所以不会删除
-- p1里id=2的 也只能找到一条记录 不会存在p1.id>p2.id 所以不会删除
-- p1里id=3的 可以找到p2里id=1的 所以p1里id=3的会被删除

delete p1 from Person p1,Person p2 where p1.Email=p2.Email and p1.id>p2.id