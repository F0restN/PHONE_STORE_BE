INSERT INTO public.users (user_id, pwd, email, fullname, username, roles) VALUES (1, "adminpwd", "admin@gmail.com", "admin123", "admin", '{admin}');
INSERT INTO public.manager (manager_id, manager_name) VALUES (1, "Sophia2");
INSERT INTO public.region (region_id, region, manager_id, region_id) VALUES(1, "Pittsburgh", 1, 1);
INSERT INTO public.salesperson (salesperson_id, store_id, name) VALUES (1, 1, "Anj");
INSERT INTO public.store (store_id, store_name, region_id) VALUES (1, "Target", 1);