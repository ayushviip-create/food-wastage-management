#1. HOW MANY PROVIDERS ARE THERE IN EACH CITY ?
SELECT City, COUNT(*) AS Total_Providers
FROM providers
GROUP BY City
ORDER BY Total_Providers DESC;

#2.  HOW MANY RECEIVERS ARE THERE IN EACH CITY ?
SELECT City, COUNT(*) AS Total_Receivers
FROM receivers
GROUP BY City
ORDER BY Total_Receivers DESC;

#3. Provider type contributing the most food
SELECT Provider_Type,
SUM(Quantity) AS Total_Quantity
FROM food_listings
GROUP BY Provider_Type
ORDER BY Total_Quantity DESC;

#4. contact details of providers in a specific city
SELECT Name, Contact, City
FROM providers
WHERE City = 'New David';

#5. Receivers who claimed the most food?
SELECT r.Name,
COUNT(c.Claim_ID) AS Total_Claims
FROM receivers r
JOIN claims c
ON r.Receiver_ID = c.Receiver_ID
GROUP BY r.Name
ORDER BY Total_Claims DESC;

#6. Total quantity of food available?
SELECT SUM(Quantity) AS Total_Food_Available
FROM food_listings;

#7. City with highest food listings.
SELECT Location,
COUNT(*) AS Total_Listings
FROM food_listings
GROUP BY Location
ORDER BY Total_Listings DESC;

#8. most commonly food available type.
SELECT Food_Type,
COUNT(*) AS Total
FROM food_listings
GROUP BY Food_Type
ORDER BY Total DESC;

#9. no. of claims made for each food item. 
SELECT f.Food_Name,
COUNT(c.Claim_ID) AS Total_Claims
FROM food_listings f
LEFT JOIN claims c
ON f.Food_ID = c.Food_ID
GROUP BY f.Food_Name
ORDER BY Total_Claims DESC;

#10. providers with highest successful claims. 
SELECT p.Name,
COUNT(c.Claim_ID) AS Successful_Claims
FROM providers p
JOIN food_listings f
ON p.Provider_ID = f.Provider_ID
JOIN claims c
ON f.Food_ID = c.Food_ID
WHERE c.Status = 'Completed'
GROUP BY p.Name
ORDER BY Successful_Claims DESC;

#11. Average quantity claimed per receiver. 
SELECT r.Name,
AVG(f.Quantity) AS Avg_Quantity
FROM receivers r
JOIN claims c
ON r.Receiver_ID = c.Receiver_ID
JOIN food_listings f
ON c.Food_ID = f.Food_ID
GROUP BY r.Name
ORDER BY Avg_Quantity DESC;

#12. Most claimed meal type. 
SELECT f.Meal_Type,
COUNT(c.Claim_ID) AS Total_Claims
FROM food_listings f
JOIN claims c
ON f.Food_ID = c.Food_ID
GROUP BY f.Meal_Type
ORDER BY Total_Claims DESC;

#13. Total food donated by each providers. 
SELECT p.Name,
SUM(f.Quantity) AS Total_Donated
FROM providers p
JOIN food_listings f
ON p.Provider_ID = f.Provider_ID
GROUP BY p.Name
ORDER BY Total_Donated DESC;

#14. Food items nearing expiring. 
SELECT Food_ID,
       Food_Name,
       Expiry_Date,
       Quantity
FROM food_listings
ORDER BY Expiry_Date;

#15. Top 10 Providers by total Quantity Donated. 
SELECT p.Name,
SUM(f.Quantity) AS Total_Donation
FROM providers p
JOIN food_listings f
ON p.Provider_ID = f.Provider_ID
GROUP BY p.Name
ORDER BY Total_Donation DESC
LIMIT 10;