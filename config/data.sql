INSERT INTO public.manager (manager_id, manager_name) VALUES (1, 'Sophia2');
INSERT INTO public.manager (manager_id, manager_name) VALUES (2, 'Sophia1');
INSERT INTO public.manager (manager_id, manager_name) VALUES (3, 'Daddy Bob');

INSERT INTO public.region (region_id, region_name, manager_id) VALUES (1, 'Pittsburgh', 1);
INSERT INTO public.region (region_id, region_name, manager_id) VALUES (2, 'Taipei', 2);
INSERT INTO public.region (region_id, region_name, manager_id) VALUES (3,'Seatle', 3);


INSERT INTO public.store (store_id, store_name, region_id) VALUES (1, 'Target', 1);
INSERT INTO public.store (store_id, store_name, region_id) VALUES (2, 'Best Buy', 2);
INSERT INTO public.store (store_id, store_name, region_id) VALUES (3, 'Walmart', 3);

INSERT INTO public.salesperson (sp_id, store_id, sp_name) VALUES (1, 1, 'Anj');
INSERT INTO public.salesperson (sp_id, store_id, sp_name) VALUES (2, 2, 'Bob');
INSERT INTO public.salesperson (sp_id, store_id, sp_name) VALUES (3, 3, 'Drake');
INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (1, 'iPhone','iPhone 14', 800, 'The iPhone 14 display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 6.06 inches diagonally ', 'https://www.apple.com/newsroom/images/product/iphone/standard/Apple-iPhone-14-iPhone-14-Plus-2up-purple-220907_inline.jpg.large.jpg', 10,1);

INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (2, 'iPhone','iPhone 14 pro', 1100, 'Pears are rich in essential antioxidants, plant compounds, and dietary fiber. They pack all of these nutrients in a fat free, cholesterol free, 100 calorie package.', 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-pro-finish-select-202209-6-1inch-silver?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1663703840488', 10, 1);

INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (3, 'Android','Google Pixel 7 pro', 700, 'The Pixel 7 Pro comes with 6.7-inch OLED display with 120Hz refresh rate and Google Tensor G2 processor. Specs also include 5000mAh battery, Triple Camera setup', 'https://www.cnet.com/a/img/resize/8f3309175fdd17307e2d684455d0d30cdb699dd4/hub/2022/10/11/1976fdac-2da2-461a-bf0a-d1ddb8e3ef90/pixel-7-pro-watch-lanxon-promo-14.jpg?auto=webp&fit=crop&height=362&width=644', 10,2);

INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (4, 'Android','Google Pixel 7', 500, 'The Pixel 7 comes with 6-inch LCD display with 90Hz refresh rate and Google Tensor G1 processor. Specs also include 4000mAh battery, Triple Camera setup', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuoxXNGQNb-l039CQxWOgnYdMW3oAOkJJklw&usqp=CAU', 10,2);


INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (5, 'Android','Samsung galaxy s22 ultra', 1200, 'he Samsung Galaxy S22 Ultra is the headliner of the S22 series. Its the first S series phone to include Samsungs S Pen. Specifications are top-notch including 6.8-inch Dynamic AMOLED display with 120Hz refresh rate, Snapdragon 8 Gen 1 processor', 'https://www.dpreview.com/files/p/articles/4617565053/samsung-galaxy-s22-ultra-lineup.jpeg ', 10, 3);

INSERT INTO public.products (product_id, category, name, price, description, image_url, inventory, store_id) VALUES (6, 'Android','Samsung galaxy s22', 900, 'he Samsung Galaxy S22 is the newest of the S22 series.Specifications are top-notch including 6.2-inch Dynamic AMOLED display with 120Hz refresh rate, Snapdragon 8 Gen 1 processor', 'https://media.cnn.com/api/v1/images/stellar/prod/220223142400-galaxy-s22-plus-lead.jpg?q=h_2085,w_3706,x_0,y_0', 10, 3);
