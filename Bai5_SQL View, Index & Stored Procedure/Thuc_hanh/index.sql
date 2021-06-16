use classicmodels;
ALTER TABLE customers ADD INDEX idx_customerName(customerName);
explain SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
explain SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';
ALTER TABLE customers DROP INDEX idx_full_name;