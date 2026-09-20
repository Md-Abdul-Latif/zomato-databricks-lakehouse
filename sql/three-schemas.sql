CREATE SCHEMA IF NOT EXISTS workspace.zomato_bronze
COMMENT 'Bronze layer - raw Zomato source data';

CREATE SCHEMA IF NOT EXISTS workspace.zomato_silver
COMMENT 'Silver layer - cleaned and validated Zomato data';

CREATE SCHEMA IF NOT EXISTS workspace.zomato_gold
COMMENT 'Gold layer - business-ready Zomato analytics';
