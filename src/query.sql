SELECT * 
FROM population 
LIMIT 10;

SELECT region_name 
FROM stores
GROUP BY region_name
ORDER BY COUNT(*) DESC
LIMIT 10;

SELECT s.region_name, 
    COUNT(*) AS store_count,
    p.total_population, 
    p.young_population
FROM stores AS s
JOIN population AS p ON s.region_name = p.region_name
GROUP BY s.region_name;

SELECT DISTINCT category_small_name
FROM stores
WHERE category_small_name LIKE '%헬스%'
    OR category_small_name LIKE '%PC%'
    OR category_small_name LIKE '%카페%';

SELECT category_small_name, region_name, COUNT(*) AS store_count
FROM stores
WHERE category_small_name IN (
    '헬스장', 'PC방', '카페'
    )
GROUP BY category_small_name, region_name
ORDER BY category_small_name, store_count DESC;


--청년 비율
young_ratio = young_population / total_population

--업소 밀도 업소수 / 전체인구 * 10000

-- 가설1 지역별 청년비율 및 업종별 청년 1만명당 업소밀도
SELECT p.region_name,
    p.young_population / p.total_population * 100 AS '청년비율',
    COUNT(*) / p.young_population * 10000 AS '청년 1만명당 업소수'
FROM stores AS s
JOIN population AS p
ON s.region_name = p.region_name
WHERE s.category_small_name = '카페'
GROUP BY p.region_name, p.young_population, p.total_population;

SELECT p.region_name,
    p.young_population / p.total_population * 100 AS '청년비율',
    COUNT(*) / p.young_population * 10000 AS '청년 1만명당 업소수'
FROM stores AS s
JOIN population AS p
ON s.region_name = p.region_name
WHERE s.category_small_name = 'PC방'
GROUP BY p.region_name, p.young_population, p.total_population;

SELECT p.region_name,
    p.young_population / p.total_population * 100 AS '청년비율',
    COUNT(*) / p.young_population * 10000 AS '청년 1만명당 업소수'
FROM stores AS s
JOIN population AS p
ON s.region_name = p.region_name
WHERE s.category_small_name = '헬스장'
GROUP BY p.region_name, p.young_population, p.total_population;

-- 가설1
SELECT 
    p.region_name,
    p.young_population / p.total_population * 100 AS '청년비율',
    COUNT(*) / p.young_population * 10000 AS '업소밀도'
FROM stores AS s
JOIN population AS p
ON s.region_name = p.region_name
WHERE s.category_small_name IN (
    '헬스장', 'PC방', '카페'
)
GROUP BY p.region_name, p.young_population, p.total_population;

-- 가설2

SELECT s.category_small_name AS '업종', 
    p.region_name,
    p.young_population / p.total_population * 100 AS '청년비율',
    COUNT(*) / p.young_population * 10000 AS '청년 1만명당 업소수'
FROM stores AS s
JOIN population AS p
ON s.region_name = p.region_name
WHERE s.category_small_name IN (
    '헬스장', 'PC방', '카페'
)
GROUP BY s.category_small_name, p.region_name, p.young_population, p.total_population;

-- 가설3
SELECT  
    p.region_name,
    COUNT(*) AS store_count,
    ROUND(
        COUNT(*) / p.young_population * 10000, 2
    ) AS young_store_density
FROM stores AS s
JOIN population AS p
ON s.region_name = p.region_name
WHERE s.category_small_name IN (
    '헬스장', 'PC방', '카페'
)
GROUP BY p.region_name, p.young_population
ORDER BY store_count DESC;

-- 가설4
SELECT s.category_small_name AS category, 
    p.region_name,
    ROUND(
    p.young_population / p.total_population * 100, 2
    ) AS young_ratio,
    COUNT(*) AS store_count,
    ROUND(
        COUNT(*) / p.young_population * 10000, 2
    ) AS young_store_density
FROM stores AS s
JOIN population AS p
ON s.region_name = p.region_name
WHERE s.category_small_name IN (
    '헬스장', 'PC방', '카페'
)
GROUP BY s.category_small_name, p.region_name, p.young_population, p.total_population;