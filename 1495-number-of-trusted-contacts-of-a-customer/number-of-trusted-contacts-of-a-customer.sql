WITH CTE AS (
    SELECT i.invoice_id, 
        c.customer_name, 
        i.price, 
        c.customer_id 
    FROM Invoices i 
    LEFT JOIN Customers c 
    ON i.user_id = c.customer_id)

SELECT CTE.invoice_id, 
    CTE.customer_name, 
    CTE.price, 
    COUNT(contact_name) AS contacts_cnt, 
    COUNT(CASE
     WHEN contact_name IN (SELECT customer_name FROM Customers) THEN 1 
     ELSE NULL 
     END) AS trusted_contacts_cnt 
    FROM CTE 
    LEFT JOIN Contacts c 
    ON CTE.customer_id = c.user_id 
    GROUP BY invoice_id 
    ORDER BY invoice_id;