COPY call_center
FROM '/Users/nickfeichtel/Desktop/Portfolio_Projects/call_center_project/call_center.csv'
DELIMITER ',' CSV HEADER;
/*
\copy call_center FROM '/Users/nickfeichtel/Desktop/Portfolio_Projects/call_center_project/call_center.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');
*/