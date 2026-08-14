CREATE TABLE stores (
    store_id VARCHAR(50) PRIMARY KEY,
    store_name VARCHAR(255),
    category_large_id VARCHAR(20),
    category_large_name VARCHAR(100),
    category_medium_id VARCHAR(20),
    category_medium_name VARCHAR(100),
    category_small_id VARCHAR(20),
    category_small_name VARCHAR(100),
    industry_code VARCHAR(20),
    industry_name VARCHAR(150),
    province_code VARCHAR(20),
    province_name VARCHAR(50),
    region_name VARCHAR(100) NOT NULL,
    admin_dong_code VARCHAR(20),
    admin_dong_name VARCHAR(100),
    legal_dong_code VARCHAR(20),
    legal_dong_name VARCHAR(100),
    lot_address VARCHAR(255),
    road_address VARCHAR(255),
    postal_code VARCHAR(10),
    longitude DECIMAL(10, 7),
    latitude DECIMAL(10, 7)
);

CREATE TABLE population (
    region_name VARCHAR(100) PRIMARY KEY,
    total_population INT NOT NULL,
    year_population INT NOT NULL
);

ALTER TABLE population
CHANGE year_population young_population INT NOT NULL;