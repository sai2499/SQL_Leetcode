CREATE OR REPLACE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT)
RETURNS TABLE (user_id INT) AS $$
BEGIN
  RETURN QUERY (
      -- Write your PostgreSQL query statement below.
     SELECT DISTINCT p.user_id FROM Purchases p
    WHERE p.amount >= minAmount AND p.time_stamp BETWEEN startDate AND endDate
  );
END;
$$ LANGUAGE plpgsql;