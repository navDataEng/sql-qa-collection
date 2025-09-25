-- Question: Calculating Available Seats on Flights
-- https://www.dataexpert.io/question/available-seats-per-flight


WITH seats_purchased AS (
    SELECT 
        flight_id,
        COUNT(seat_no) AS purchased
    FROM playground.purchases
    GROUP BY flight_id
)
SELECT 
    f.flight_id,
    CASE 
        WHEN s.purchased IS NOT NULL 
             THEN p.number_of_seats - s.purchased
        ELSE p.number_of_seats
    END AS free_seats
FROM playground.flights f
LEFT JOIN seats_purchased s 
       ON f.flight_id = s.flight_id
LEFT JOIN playground.planes p 
       ON f.plane_id = p.plane_id
ORDER BY f.flight_id;
