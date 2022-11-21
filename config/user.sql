INSERT INTO public.users (password, email, fullname, username) VALUES ('adminpwd', 'admin@gmail.com', 'admin123', 'admin');
UPDATE table public.users set roles = array_append(roles, 'admin') where username = 'admin';
INSERT INTO public.users (password, email, fullname, username, business) VALUES ('user1pwd', 'user1@gmail.com', 'user111111', 'user1', 'Student');
INSERT INTO public.manager (manager_id, manager_name) VALUES (1, 'Sophia2');
INSERT INTO public.region (region_id, region_name, manager_id) VALUES (1, 'Pittsburgh', 1);
INSERT INTO public.store (store_id, store_name, region_id) VALUES (1, 'Target', 1);
INSERT INTO public.salesperson (sp_id, store_id, sp_name) VALUES (1, 1, 'Anj');