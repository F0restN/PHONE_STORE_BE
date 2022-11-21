INSERT INTO public.manager (manager_id, manager_name) VALUES (1, 'Sophia2');
INSERT INTO public.region (region_id, region_name, manager_id) VALUES (1, 'Pittsburgh', 1);
INSERT INTO public.store (store_id, store_name, region_id) VALUES (1, 'Target', 1);
INSERT INTO public.salesperson (sp_id, store_id, sp_name) VALUES (1, 1, 'Anj');