CREATE TABLE store (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	address VARCHAR(255),
	zip VARCHAR(255)
);

CREATE TABLE "user" (
	id SERIAL PRIMARY KEY,
	email VARCHAR(255),
	year_of_birth INT,
	household_size INT,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE receipt (
	id SERIAL PRIMARY KEY,
	user_id INT NOT NULL,
	CONSTRAINT fk_user
		FOREIGN KEY(user_id)
			REFERENCES "user"(id),
	store_id INT NOT NULL,
	CONSTRAINT fk_store
		FOREIGN KEY(store_id)
			REFERENCES store(id),
	purchase_date TIMESTAMP NOT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE category(
	id SERIAL PRIMARY KEY,
	"name" varchar(255),
	is_grocery bool
);

CREATE TABLE product(
	id SERIAL PRIMARY KEY,
	ean VARCHAR(255),
	"name" VARCHAR(255),
	category_id INT NOT NULL,
	CONSTRAINT fk_category
		FOREIGN KEY(category_id)
			REFERENCES category(id)
);

CREATE TABLE receipt_line(
	id SERIAL PRIMARY KEY,
	receipt_id INT NOT NULL,
	CONSTRAINT fk_receipt
		FOREIGN KEY(receipt_id)
			REFERENCES receipt(id),
	product_id INT NOT NULL,
	CONSTRAINT fk_product
		FOREIGN KEY(product_id)
			REFERENCES product(id),
	"count" NUMERIC NOT NULL,
	price NUMERIC NOT NULL,
	discount NUMERIC
);