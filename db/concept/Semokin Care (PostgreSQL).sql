CREATE TABLE "Users" (
  "user_id" varchar PRIMARY KEY,
  "username" varchar,
  "password" varchar,
  "email" varchar,
  "full_name" varchar,
  "phone_number" varchar,
  "address" text,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Products" (
  "product_id" varchar PRIMARY KEY,
  "name" varchar,
  "description" text,
  "price" money,
  "stock" integer,
  "category_id" varchar,
  "brand_id" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Categories" (
  "category_id" varchar PRIMARY KEY,
  "name" varchar,
  "description" text,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Brands" (
  "brand_id" varchar PRIMARY KEY,
  "name" varchar,
  "description" text,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Orders" (
  "order_id" varchar PRIMARY KEY,
  "user_id" varchar,
  "order_data" timestamp,
  "status" varchar,
  "total_amount" money,
  "shipping_address" text,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "OrderItems" (
  "order_item_id" varchar PRIMARY KEY,
  "order_id" varchar,
  "product_id" varchar,
  "quantity" integer,
  "price" money,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Reviews" (
  "review_id" varchar PRIMARY KEY,
  "product_id" varchar,
  "user_id" varchar,
  "rating" float,
  "comment" text,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Cart" (
  "cart_id" varchar PRIMARY KEY,
  "user_id" varchar,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "CartItems" (
  "cart_item_id" varchar PRIMARY KEY,
  "cart_id" varchar,
  "product_id" varchar,
  "quantity" integer,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "Payments" (
  "payment" varchar PRIMARY KEY,
  "order_id" varchar,
  "amount" money,
  "payment_method" varchar,
  "payment_status" varchar,
  "payment_date" timestamp,
  "created_at" timestamp,
  "updated_at" timestamp
);

COMMENT ON COLUMN "Products"."category_id" IS 'foreign key to Categories table';

COMMENT ON COLUMN "Products"."brand_id" IS 'foreign key to Brands table';

COMMENT ON COLUMN "Orders"."user_id" IS 'foreign key to Users table';

COMMENT ON COLUMN "Orders"."status" IS 'Pending, Shipped, Delivered, Cancelled';

COMMENT ON COLUMN "OrderItems"."order_id" IS 'foreign key to Orders table';

COMMENT ON COLUMN "OrderItems"."product_id" IS 'foreign key to Products table';

COMMENT ON COLUMN "Reviews"."product_id" IS 'foreign key to Products table';

COMMENT ON COLUMN "Reviews"."user_id" IS 'foreign key to Users table';

COMMENT ON COLUMN "Reviews"."rating" IS '1.0 - 5.0';

COMMENT ON COLUMN "Cart"."user_id" IS 'foreign key to Users table';

COMMENT ON COLUMN "CartItems"."cart_id" IS 'foreign key to Cart table';

COMMENT ON COLUMN "CartItems"."product_id" IS 'foreign key to Products table';

COMMENT ON COLUMN "Payments"."order_id" IS 'foreign key to Orders table';

COMMENT ON COLUMN "Payments"."payment_method" IS 'Credit Card, PayPal, etc.';

COMMENT ON COLUMN "Payments"."payment_status" IS 'Pending, Completed, Failed';

ALTER TABLE "Orders" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id");

ALTER TABLE "OrderItems" ADD FOREIGN KEY ("order_id") REFERENCES "Orders" ("order_id");

ALTER TABLE "OrderItems" ADD FOREIGN KEY ("product_id") REFERENCES "Products" ("product_id");

ALTER TABLE "Products" ADD FOREIGN KEY ("category_id") REFERENCES "Categories" ("category_id");

ALTER TABLE "Products" ADD FOREIGN KEY ("brand_id") REFERENCES "Brands" ("brand_id");

ALTER TABLE "Reviews" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id");

ALTER TABLE "Reviews" ADD FOREIGN KEY ("product_id") REFERENCES "Products" ("product_id");

ALTER TABLE "Cart" ADD FOREIGN KEY ("user_id") REFERENCES "Users" ("user_id");

ALTER TABLE "CartItems" ADD FOREIGN KEY ("cart_id") REFERENCES "Cart" ("cart_id");

ALTER TABLE "CartItems" ADD FOREIGN KEY ("product_id") REFERENCES "Products" ("product_id");

ALTER TABLE "Payments" ADD FOREIGN KEY ("order_id") REFERENCES "Orders" ("order_id");
