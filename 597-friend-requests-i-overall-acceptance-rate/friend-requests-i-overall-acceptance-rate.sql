SELECT 
  ROUND(COALESCE(
    (SELECT COUNT(*) FROM (SELECT DISTINCT requester_id, accepter_id FROM requestaccepted) AS subquery1) * 1.0 /
    NULLIF(
      (SELECT COUNT(*) FROM (SELECT DISTINCT sender_id, send_to_id FROM friendrequest) AS subquery2), 0
    ), 
    0.00
  ), 2) AS accept_rate;