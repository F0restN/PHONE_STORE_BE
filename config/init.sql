CREATE TABLE public.cart
(
    id SERIAL NOT NULL,
    user_id integer UNIQUE NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.cart_item
(
    id SERIAL NOT NULL,
    cart_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (id),
    UNIQUE (cart_id, product_id)
);

CREATE TABLE public.order_item
(
    id SERIAL NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE public.orders
(
    order_id SERIAL NOT NULL,
    user_id integer NOT NULL,
    status character varying(20) NOT NULL,
    date timestamp without time zone DEFAULT CURRENT_DATE NOT NULL,
    amount real,
    total integer,
    ref character varying(100),
    payment_method character varying(100),
    PRIMARY KEY (order_id)
);
-- ### Added store table ######################
CREATE TABLE public.store
(
	store_id integer NOT NULL,
    store_name character varying(100) NOT NULL,
    region_id integer,
    PRIMARY KEY (store_id)
);

CREATE TYPE "category_type" AS ENUM (
  'Android',
  'iPhone'
);

-- ### Added category and store_id ##########################
CREATE TABLE public.products
(
    product_id SERIAL NOT NULL,
    category category_type,
    name character varying(50) NOT NULL,
    price real NOT NULL,
    description text NOT NULL,
    image_url character varying,
    inventory integer CHECK (inventory>=0),
    store_id integer,
    PRIMARY KEY (product_id)
);



-- ################### REGION TABLE #######################
CREATE TABLE public.region
(
region_id integer NOT NULL,
region_name character varying(100),
manager_id integer,
PRIMARY KEY(region_id)
);

-- ################### Manager TABLE #######################
CREATE TABLE public.manager
(
manager_id integer NOT NULL,
manager_name character varying(100),
PRIMARY KEY(manager_id)
);


-- ################### Salesperson TABLE #######################
CREATE TABLE public.salesperson
(
sp_id integer NOT NULL,
sp_name character varying(100),
store_id integer,
PRIMARY KEY(sp_id)
);


CREATE TABLE public."resetTokens"
(
    id SERIAL NOT NULL,
    email character varying NOT NULL,
    token character varying NOT NULL,
    used boolean DEFAULT false NOT NULL,
    expiration timestamp without time zone,
    PRIMARY KEY (id)
);

CREATE TABLE public.reviews
(
    user_id integer NOT NULL,
    content text NOT NULL,
    rating integer NOT NULL,
    product_id integer NOT NULL,
    date date NOT NULL,
    id integer NOT NULL,
    PRIMARY KEY (user_id, product_id)
);

CREATE TYPE "business_type" AS ENUM (
  'Student',
  'Retailer',
  'IT'
);

-- ## Added business as ENUM
CREATE TABLE public.users
(
    user_id SERIAL NOT NULL,
    pwd character varying(200),
    email character varying(100) UNIQUE NOT NULL,
    fullname character varying(100) NOT NULL,
    username character varying(50) UNIQUE NOT NULL,
    roles character varying(10)[] DEFAULT '{customer}'::character varying[] NOT NULL,
    address character varying(200),
    city character varying(100),
    state character varying(100),
    country character varying(100),
    business business_type,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);


-- Ref:"customer"."user_id" < "cart"."user_id"
ALTER TABLE public.cart
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (user_id)
    ON DELETE SET NULL
    NOT VALID;

-- Ref:"cart"."id" < "cart_item"."cart_id"
ALTER TABLE public.cart_item
    ADD FOREIGN KEY (cart_id)
    REFERENCES public.cart (id)
    ON DELETE CASCADE
    NOT VALID;

-- Ref:"products"."product_id" < "cart_item"."product_id"
ALTER TABLE public.cart_item
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (product_id)
    ON DELETE SET NULL
    NOT VALID;

-- Ref:"orders"."order_id" < "order_item"."order_id"
ALTER TABLE public.order_item
    ADD FOREIGN KEY (order_id)
    REFERENCES public.orders (order_id)
    ON DELETE CASCADE
    NOT VALID;

-- Ref:"products"."product_id" < "order_item"."product_id"
ALTER TABLE public.order_item
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (product_id)
    ON DELETE SET NULL
    NOT VALID;

-- Ref:"customer"."user_id" < "orders"."user_id"
ALTER TABLE public.orders
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (user_id)
    ON DELETE CASCADE
    NOT VALID;

-- Ref:"products"."product_id" < "reviews"."product_id"
ALTER TABLE public.reviews
    ADD FOREIGN KEY (product_id)
    REFERENCES public.products (product_id)
    ON DELETE SET NULL
    NOT VALID;

-- Ref:"customer"."user_id" < "reviews"."user_id"
ALTER TABLE public.reviews
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (user_id)
    ON DELETE SET NULL
    NOT VALID;
-- Ref:"store"."store_id" < "products"."store_id"
ALTER TABLE public.products
    ADD FOREIGN KEY (store_id)
    REFERENCES public.store (store_id)
    ON DELETE SET NULL
    NOT VALID;
-- Ref:"region"."region_id" < "store"."region_id"
ALTER TABLE public.store
    ADD FOREIGN KEY (region_id)
    REFERENCES public.region (region_id)
    ON DELETE SET NULL
    NOT VALID;
-- Ref:"manager"."manager_id" < "region"."manager_id"
ALTER TABLE public.region
    ADD FOREIGN KEY (manager_id)
    REFERENCES public.manager (manager_id)
    ON DELETE SET NULL
    NOT VALID;

-- Ref:"store"."store_id" < "salesperson"."store_id"
ALTER TABLE public.salesperson
    ADD FOREIGN KEY (store_id)
    REFERENCES public.store (store_id)
    ON DELETE SET NULL
    NOT VALID;

CREATE UNIQUE INDEX users_unique_lower_email_idx
    ON public.users (lower(email));

CREATE UNIQUE INDEX users_unique_lower_username_idx
    ON public.users (lower(username));

INSERT INTO public.manager (manager_id, manager_name) VALUES (1, 'Sophia2');
INSERT INTO public.region (region_id, region_name, manager_id) VALUES (1, 'Pittsburgh', 1);
INSERT INTO public.store (store_id, store_name, region_id) VALUES (1, 'Target', 1);
INSERT INTO public.salesperson (sp_id, store_id, sp_name) VALUES (1, 1, 'Anj');
INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (1, 'iPhone','iPhone 14', 956.97, 'Swiss cheese is a mild cow''s milk cheese with a firmer texture than baby Swiss. The flavor is light, sweet, and nutty. Swiss cheese is distinguished by its luster, pale yellow color, and large holes (called eyes) caused by carbon dioxide released during the maturation process.', 'https://www.apple.com/newsroom/images/product/iphone/standard/Apple-iPhone-14-iPhone-14-Plus-2up-purple-220907_inline.jpg.large.jpg', 0,1);
INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (2, 'iPhone','iPhone 14 pro', 759.19, 'Pears are rich in essential antioxidants, plant compounds, and dietary fiber. They pack all of these nutrients in a fat free, cholesterol free, 100 calorie package.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-pro-model-unselect-gallery-2-202209_GEO_US?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660753617560 ', 0,1);
INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (3, 'Android','Google Pixel 7 pro', 979.29, 'A small, round, yeast-leavened sourdough bread that is commonly sliced horizontally, toasted, and buttered. In North America and Australia, it is commonly eaten for breakfast, often with sweet or savory toppings such as fruit jam or honey, or eggs, sausage, bacon, or cheese.', 'https://www.cnet.com/a/img/resize/8f3309175fdd17307e2d684455d0d30cdb699dd4/hub/2022/10/11/1976fdac-2da2-461a-bf0a-d1ddb8e3ef90/pixel-7-pro-watch-lanxon-promo-14.jpg?auto=webp&fit=crop&height=362&width=644', 0,1);
INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (4, 'Android','Samsung galaxy s22 ultra', 669.45, 'Wasabi paste is spicy and pungent in flavour and is most commonly served with sushi and sashimi.', 'https://www.dpreview.com/files/p/articles/4617565053/samsung-galaxy-s22-ultra-lineup.jpeg ', 0, 1);