CREATE OR REPLACE FUNCTION getUserIDs(startDate DATE, endDate DATE, minAmount INT) RETURNS INT AS $$
BEGIN
  RETURN (
	select count(DISTINCT user_id) as user_cnt
    from Purchases
    where TO_CHAR(time_stamp, 'yyyy-mm-dd HH24:MI:SS') BETWEEN TO_CHAR(startDate, 'yyyy-mm-dd HH24:MI:SS') AND
    TO_CHAR(endDate, 'yyyy-mm-dd HH24:MI:SS')
    AND amount >= minAmount
  );
END;
$$ LANGUAGE plpgsql;



