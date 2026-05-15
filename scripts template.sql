SELECT 
    neighbourhood_cleansed,
    CONCAT('$', FORMAT(avg(price_2), 2)) as avg_price
FROM airbnb_listings
GROUP BY neighbourhood_cleansed
ORDER BY avg(price_2) DESC
limit 5;

select
    neighbourhood_group_cleansed,
    count(*) as total_listings_per_borough ,
    CONCAT(ROUND((COUNT(*) / (SELECT COUNT(*) FROM airbnb_listings)) * 100, 2), '%') as percentage_listings_per_borough
from
    airbnb_listings
group by
    neighbourhood_group_cleansed
 order by
   total_listings_per_borough desc
    ;
    


SELECT 
    bathrooms_text,
    CASE
        WHEN bathrooms_text LIKE '%half%' THEN 0.5
        WHEN bathrooms_text IS NULL THEN NULL
        ELSE CAST(bathrooms_text AS DECIMAL(10,1))
    END as bathrooms_numeric
FROM airbnb_listings
group by
	bathrooms_text
order by
	bathrooms_numeric
;

update airbnb_listings
set bathrooms = (CASE
        WHEN bathrooms_text LIKE '%half%' THEN 0.5
        WHEN bathrooms_text IS NULL THEN NULL
        ELSE CAST(bathrooms_text AS DECIMAL(10,1))
    END)
;


SELECT 
    case 
        WHEN bedrooms = 1 THEN 'Number of bedrooms = 1'
        WHEN bedrooms = 2 THEN 'Number of bedrooms = 2'
        WHEN bedrooms = 3 THEN 'Number of bedrooms = 3'
        WHEN bedrooms = 4 THEN 'Number of bedrooms = 4'
        WHEN bedrooms >= 5 THEN 'Number of bedrooms = 5 or high'
	end as bedrooms_grouped,
    CONCAT('$', FORMAT(avg(price_2), 2)) as avg_price
FROM airbnb_listings
WHERE bedrooms IS NOT NULL AND price_2 IS NOT NULL
GROUP BY bedrooms_grouped
ORDER BY bedrooms_grouped;

SELECT 
    case 
        WHEN beds = 1 THEN 'Number of beds = 1'
        WHEN beds = 2 THEN 'Number of beds = 2'
        WHEN beds = 3 THEN 'Number of beds = 3'
        WHEN beds = 4 THEN 'Number of beds = 4'
        WHEN beds >= 5 THEN 'Number of beds = 5 or high'
	end as beds_grouped,
    CONCAT('$', FORMAT(avg(price_2), 2)) as avg_price
FROM airbnb_listings
WHERE beds IS NOT NULL AND price_2 IS NOT NULL
GROUP BY beds_grouped
ORDER BY beds_grouped;

SELECT 
    case 
		WHEN bathrooms < 1 THEN 'Number of Bathrooms = 0 or 0.5'
        WHEN bathrooms >= 1 AND bathrooms < 2 THEN 'Number of Bathrooms = 1 or 1.5'
		WHEN bathrooms >= 2 AND bathrooms < 3 THEN 'Number of Bathrooms = 2 or 2.5'
		WHEN bathrooms >= 3 AND bathrooms < 4 THEN 'Number of Bathrooms = 3 or 3.5'
		WHEN bathrooms >= 4 AND bathrooms < 5 THEN 'Number of Bathrooms = 4 or 4.5'
        WHEN bathrooms >= 5 THEN 'Number of Bathrooms = 5 or high'
	end as bathrooms_grouped,
    CONCAT('$', FORMAT(avg(price_2), 2)) as avg_price
FROM airbnb_listings
WHERE bathrooms IS NOT NULL AND price_2 IS NOT NULL
GROUP BY bathrooms_grouped
ORDER BY bathrooms_grouped;

SELECT 
    case 
		WHEN review_scores_rating < 1 THEN 'Review Scores Rating < 1'
        WHEN review_scores_rating >= 1 AND review_scores_rating < 2 THEN 'Review Scores Rating between 1 and 2'
		WHEN review_scores_rating >= 2 AND review_scores_rating < 3 THEN 'Review Scores Rating between 2 and 3'
		WHEN review_scores_rating >= 3 AND review_scores_rating < 4 THEN 'Review Scores Rating between 3 and 4'
		WHEN review_scores_rating >= 4 <= 5 THEN 'Review Scores Rating high than 4'
	end as review_scores_rating_grouped,
#    COUNT(*) as listings,
    CONCAT('$', FORMAT(avg(price_2), 2)) as avg_price
FROM airbnb_listings
WHERE review_scores_rating IS NOT NULL AND price_2 IS NOT NULL
GROUP BY review_scores_rating_grouped
ORDER BY review_scores_rating_grouped;



SELECT 
case 
		WHEN number_of_reviews >= 0 AND number_of_reviews < 400 THEN 'Between 0 and 400'
        WHEN number_of_reviews >= 400 AND number_of_reviews < 800 THEN 'Between 400 and 800'
		WHEN number_of_reviews >= 800 AND number_of_reviews < 1200 THEN 'Between 800 and 1200'
		WHEN number_of_reviews >= 1200 THEN 'More than 1200'        
end as Grouped_Number_of_Reviews,
    CONCAT('$', FORMAT(avg(price_2), 2)) as Average_Price
FROM
    airbnb_listings
WHERE number_of_reviews IS NOT NULL AND price_2 IS NOT NULL
GROUP BY Grouped_Number_of_Reviews
ORDER BY Grouped_Number_of_Reviews asc;

SELECT 
    room_type,
#    COUNT(*) as listings,
    CONCAT('$', FORMAT(avg(price_2), 2)) as avg_price
FROM
    airbnb_listings
WHERE room_type IS NOT NULL AND price_2 IS NOT NULL
GROUP BY room_type
ORDER BY avg(price_2) asc;


SELECT 
case
	when property_type like '%private room%' then 'Property_Type = Private Room'
    when property_type like '%shared room%' then 'Property_Type = Shared Room' 
    when property_type like '%entire%' then 'Property_Type = Entire' 
    else 'Property_Type = Other'
    end as property_type_grouped,
    CONCAT('$', FORMAT(avg(price_2), 2)) as avg_price
FROM
    airbnb_listings
WHERE property_type IS NOT NULL AND price_2 IS NOT NULL
GROUP BY property_type_grouped
ORDER BY property_type_grouped;

SELECT 
    neighbourhood_group_cleansed,
#    COUNT(*) as listings,
    CONCAT('$', FORMAT(avg(price_2), 2)) as avg_price
FROM
    airbnb_listings
WHERE neighbourhood_group_cleansed IS NOT NULL AND price_2 IS NOT NULL
GROUP BY neighbourhood_group_cleansed
ORDER BY avg(price_2) asc;


SELECT 
    SUM(CASE WHEN price_2 IS NULL THEN 1 ELSE 0 END) AS price_2_NullCount,
    SUM(CASE WHEN Beds IS NULL THEN 1 ELSE 0 END) AS Beds_NullCount,
    SUM(CASE WHEN Bedrooms  IS NULL THEN 1 ELSE 0 END) AS Bedrooms_NullCount,
    SUM(CASE WHEN Bathrooms  IS NULL THEN 1 ELSE 0 END) AS Bathrooms_NullCount,
    SUM(CASE WHEN review_scores_rating IS NULL THEN 1 ELSE 0 END) AS review_scores_rating_NullCount,
    SUM(CASE WHEN number_of_reviews IS NULL THEN 1 ELSE 0 END) AS number_of_reviews_NullCount,
    SUM(CASE WHEN room_type  IS NULL THEN 1 ELSE 0 END) AS room_type_NullCount,
    SUM(CASE WHEN property_type  IS NULL THEN 1 ELSE 0 END) AS property_type_NullCount,
    SUM(CASE WHEN neighbourhood_group_cleansed  IS NULL THEN 1 ELSE 0 END) AS neighbourhood_group_cleansed_NullCount
FROM
    airbnb_listings;

SELECT 
    case
		when price_2 >=0 and price_2<200 then 'price < 200'
		when price_2 >=200 and price_2<400 then 'price between 200 and 400'
		when price_2 >=400 and price_2<600 then 'price between 400 and 600'
		when price_2 >=600 and price_2<800 then 'price between 600 and 800'
		when price_2 >=800 then 'price high than 800'
	end as price_2_group,
	COUNT(*) AS listings
FROM
    airbnb_listings
WHERE price_2 IS NOT NULL
GROUP BY price_2_group
ORDER BY price_2_group ASC;

SELECT MIN(price_2), MAX(price_2), AVG(price_2)
FROM airbnb_listings
WHERE price_2 IS NOT NULL;

SELECT 
    case 
        WHEN beds = 1 THEN 'Number of beds = 1'
        WHEN beds = 2 THEN 'Number of beds = 2'
        WHEN beds = 3 THEN 'Number of beds = 3'
        WHEN beds = 4 THEN 'Number of beds = 4'
        WHEN beds >= 5 THEN 'Number of beds = 5 or high'
	end as beds_grouped,
    CONCAT('$', FORMAT(max(price_2), 2)) as max_price,
    CONCAT('$', FORMAT(min(price_2), 2)) as min_price,
    CONCAT('$', FORMAT(avg(price_2), 2)) as mavg_price
FROM airbnb_listings
WHERE beds IS NOT NULL AND price_2 IS NOT NULL
GROUP BY beds_grouped
ORDER BY beds_grouped;




SELECT 
    'Bedrooms' as column_name, 
    SUM(CASE WHEN bedrooms IS NULL THEN 1 ELSE 0 END) as missing_count,
    CONCAT(ROUND((SUM(CASE WHEN bedrooms IS NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100, 0), '%') as Missing_Percentage_of_Total  
FROM airbnb_listings
UNION ALL
SELECT 'Beds', 
    SUM(CASE WHEN beds IS NULL THEN 1 ELSE 0 END),
    CONCAT(ROUND((SUM(CASE WHEN beds IS NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100, 0), '%') as percentage  
FROM airbnb_listings
UNION ALL
SELECT 'Bathrooms', 
    SUM(CASE WHEN bathrooms IS NULL THEN 1 ELSE 0 END),
    CONCAT(ROUND((SUM(CASE WHEN bathrooms IS NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100, 0), '%') as percentage  
FROM airbnb_listings
UNION ALL
SELECT 'Number of Reviews', 
    SUM(CASE WHEN number_of_reviews IS NULL THEN 1 ELSE 0 END),
    CONCAT(ROUND((SUM(CASE WHEN number_of_reviews IS NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100, 0), '%') as percentage  
FROM airbnb_listings
UNION ALL
SELECT 'Room Type', 
    SUM(CASE WHEN room_type IS NULL THEN 1 ELSE 0 END),
    CONCAT(ROUND((SUM(CASE WHEN room_type IS NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100, 0), '%') as percentage  
FROM airbnb_listings
UNION ALL
SELECT 'Neighbourhood (original)', 
    SUM(CASE WHEN neighbourhood IS NULL THEN 1 ELSE 0 END),  
    CONCAT(ROUND((SUM(CASE WHEN neighbourhood IS NULL THEN 1 ELSE 0 END) / COUNT(*)) * 100, 0), '%') as percentage       
FROM airbnb_listings
ORDER BY missing_count DESC;

SELECT 
    neighbourhood_cleansed,
    ROUND(AVG(price_2), 2) as avg_price
FROM airbnb_listings
WHERE neighbourhood_cleansed IS NOT NULL AND price_2 IS NOT NULL
GROUP BY neighbourhood_cleansed
ORDER BY avg_price DESC
LIMIT 5;

SELECT 
    neighbourhood_group_cleansed as borough,
    COUNT(*) as total_listings,
    CONCAT(ROUND((COUNT(*) / (SELECT COUNT(*) FROM airbnb_listings)) * 100, 0), '%') as percentage   
FROM airbnb_listings
GROUP BY neighbourhood_group_cleansed
ORDER BY total_listings DESC;

SELECT 
    case 
        WHEN bedrooms = 1 THEN '1'
        WHEN bedrooms = 2 THEN '2'
        WHEN bedrooms = 3 THEN '3'
        WHEN bedrooms = 4 THEN '4'
        WHEN bedrooms >= 5 THEN '5 or high'
	end as Number_of_Bedrooms,
    CONCAT('$', FORMAT(avg(price_2), 2)) as Average_Price
FROM airbnb_listings
WHERE bedrooms IS NOT NULL AND price_2 IS NOT NULL
GROUP BY Number_of_Bedrooms
ORDER BY Number_of_Bedrooms;

SELECT 
    case 
        WHEN bedrooms = 1 THEN 'Number of bedrooms = 1'
        WHEN bedrooms = 2 THEN 'Number of bedrooms = 2'
        WHEN bedrooms = 3 THEN 'Number of bedrooms = 3'
        WHEN bedrooms = 4 THEN 'Number of bedrooms = 4'
        WHEN bedrooms >= 5 THEN 'Number of bedrooms = 5 or high'
	end as bedrooms_grouped,
    CONCAT('$', FORMAT(avg(price_2), 2)) as Average_Price
FROM airbnb_listings
WHERE bedrooms IS NOT NULL AND price_2 IS NOT NULL
GROUP BY bedrooms_grouped
ORDER BY bedrooms_grouped;

SELECT 
    case 
		WHEN bathrooms < 1 THEN '0 or 0.5'
        WHEN bathrooms >= 1 AND bathrooms < 2 THEN '1 or 1.5'
		WHEN bathrooms >= 2 AND bathrooms < 3 THEN '2 or 2.5'
		WHEN bathrooms >= 3 AND bathrooms < 4 THEN '3 or 3.5'
		WHEN bathrooms >= 4 AND bathrooms < 5 THEN '4 or 4.5'
        WHEN bathrooms >= 5 THEN '5 or high'
	end as Number_of_Bathrooms,
    CONCAT('$', FORMAT(avg(price_2), 2)) as Average_Price
FROM airbnb_listings
WHERE bathrooms IS NOT NULL AND price_2 IS NOT NULL
GROUP BY Number_of_Bathrooms
ORDER BY Number_of_Bathrooms;

SELECT 
    case 
        WHEN beds = 1 THEN '1'
        WHEN beds = 2 THEN '2'
        WHEN beds = 3 THEN '3'
        WHEN beds = 4 THEN '4'
        WHEN beds >= 5 THEN '5 or high'
	end as Number_of_Beds,
    CONCAT('$', FORMAT(avg(price_2), 2)) as Average_Price
FROM airbnb_listings
WHERE beds IS NOT NULL AND price_2 IS NOT NULL
GROUP BY Number_of_Beds
ORDER BY Number_of_Beds;


SELECT 
    room_type,
    CONCAT('$', FORMAT(avg(price_2), 2)) as Average_Price
FROM
    airbnb_listings
WHERE room_type IS NOT NULL AND price_2 IS NOT NULL
GROUP BY room_type
ORDER BY avg(price_2) asc;


SELECT ROUND(AVG(price_2), 2) as city_avg_price
   FROM airbnb_listings
   WHERE price_2 IS NOT NULL;

