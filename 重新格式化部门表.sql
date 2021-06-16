-- 部门表 Department：

-- +---------------+---------+
-- | Column Name   | Type    |
-- +---------------+---------+
-- | id            | int     |
-- | revenue       | int     |
-- | month         | varchar |
-- +---------------+---------+
-- (id, month) 是表的联合主键。
-- 这个表格有关于每个部门每月收入的信息。
-- 月份（month）可以取下列值 ["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"]。
--  

-- 编写一个 SQL 查询来重新格式化表，使得新的表中有一个部门 id 列和一些对应 每个月 的收入（revenue）列。

-- 查询结果格式如下面的示例所示：

-- Department 表：
-- +------+---------+-------+
-- | id   | revenue | month |
-- +------+---------+-------+
-- | 1    | 8000    | Jan   |
-- | 2    | 9000    | Jan   |
-- | 3    | 10000   | Feb   |
-- | 1    | 7000    | Feb   |
-- | 1    | 6000    | Mar   |
-- +------+---------+-------+

-- 查询得到的结果表：
-- +------+-------------+-------------+-------------+-----+-------------+
-- | id   | Jan_Revenue | Feb_Revenue | Mar_Revenue | ... | Dec_Revenue |
-- +------+-------------+-------------+-------------+-----+-------------+
-- | 1    | 8000        | 7000        | 6000        | ... | null        |
-- | 2    | 9000        | null        | null        | ... | null        |
-- | 3    | null        | 10000       | null        | ... | null        |
-- +------+-------------+-------------+-------------+-----+-------------+

-- 注意，结果表有 13 列 (1个部门 id 列 + 12个月份的收入列)。

-- 来源：力扣（LeetCode）
-- 链接：https://leetcode-cn.com/problems/reformat-department-table
-- 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。



-- 思路:本来想的是 是不是有什么办法可以简化 不用每次把12个月的列都select出来，id和month是联合主键这个
-- 刚开始没有注意 这边id不是主键 id其实类似于部门的编号 所以id和month联合主键 其实代表一个部门一个月只有
-- 一条记录 首先根据id，group下,就需要对 revenue和month进行聚合处理 id为1 只能有1个记录，使用case when  then  else  end 语句
-- 如果month == jan 就使用它的revenue 作为 Jan_Revenue 否则则使用null值 因为这边只会有一个值 所以使用sum,max,min等聚合函数都可


select d.id as id,
    min(CASE month WHEN 'Jan' then revenue else null end)   as 'Jan_Revenue',
    min(CASE month WHEN 'Feb' then revenue else null end)   as 'Feb_Revenue',
    min(CASE month  WHEN 'Mar' then revenue else null end)   as 'Mar_Revenue',
    min( CASE month WHEN 'Apr' then revenue else null end)   as 'Apr_Revenue',
    min( CASE month WHEN 'May' then revenue else null end)   as 'May_Revenue',
    min( CASE month WHEN 'Jun' then revenue else null end)   as 'Jun_Revenue',
    min( CASE month WHEN 'Jul' then revenue else null end)   as 'Jul_Revenue',
    min( CASE month WHEN 'Aug' then revenue else null end)   as 'Aug_Revenue',
    min( CASE month WHEN 'Sep' then revenue else null end)   as 'Sep_Revenue',
    min( CASE month WHEN 'Oct' then revenue else null end)   as 'Oct_Revenue',
    min( CASE month WHEN 'Nov' then revenue else null end)   as 'Nov_Revenue',
    min( CASE month WHEN 'Dec' then revenue else null end)   as 'Dec_Revenue'
 from Department d
 group by d.id

