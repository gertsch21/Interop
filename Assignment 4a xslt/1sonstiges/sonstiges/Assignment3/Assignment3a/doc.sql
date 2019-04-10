--Query1
--worker->warehouse->printer
--as sql result
select w.svnr, w.entry_date, w.unique_feature, w.first_name, w.last_name, w.nickname, ware.warehouse_id, ware.warehouse_name, p.printer_id, p.printer_info, p.extruder_type, p.price
	from worker w 
		inner join warehouse ware on w.warehouse_id=ware.warehouse_id 
		left join printer p on ware.warehouse_id = p.warehouse_id
	order by w.svnr, p.printer_id limit 100;

--as sqlxml result
select xmlelement(name root, (
	select xmlagg(xml) from (
		select xmlelement(name worker, xmlattributes(svnr as svnr, entry_date as entrydate, unique_feature),
			xmlforest(first_name as firstname,last_name as lastname, nickname),		
			xmlelement(name warehouse_zugeordnet, xmlattributes(ware.warehouse_id as warehouse_id),
				xmlelement(name warehousename, ware.warehouse_name),
				xmlelement(name printers, (
					select xmlagg(
						xmlelement(name printer, xmlattributes(printer_id as printer_id),
								printer_info, --the xml column
								xmlforest(extruder_type, price)
						)
					) from printer where printer.warehouse_id = ware.warehouse_id ) 
				)
			)
		) as xml from worker w inner join warehouse ware on w.warehouse_id=ware.warehouse_id  order by w.svnr limit 100
	) as tab
));



--Query2
--warehouse->printer->plans
--as sql result
select ware.warehouse_id, ware.warehouse_name, p.printer_id, p.printer_info, p.extruder_type, p.price, plan.plan_id, plan.status, plan.priority, plan.endproduct_name, plan.basic_instruction
	from warehouse ware 
		left join printer p on ware.warehouse_id = p.warehouse_id
		left join plan on p.printer_id = plan.printer_id and printer_warehouse_id = p.warehouse_id
	where ware.warehouse_id<100 
	order by ware.warehouse_id, p.printer_id, plan.plan_id ;

--as sqlxml result
select xmlelement(name root, (
	select xmlagg(xml) from (
		select xmlelement(name warehouse, xmlattributes(ware.warehouse_id as warehouse_id, ware.country as country),
			xmlforest(ware.warehouse_name as warehousename, ware.gla, ware.vkfl),
			xmlelement(name printers, (
				select xmlagg(
					xmlelement(name printer, xmlattributes(printer_id as printer_id),
						printer_info, --the xml column
						xmlforest(extruder_type as extruder_type, price),
						xmlelement(name printed_plans, (
							select xmlagg(
								xmlelement(name plan, xmlattributes(plan_id as plan_id, status, priority),
									xmlforest(plan.endproduct_name, plan.basic_instruction)
								)
							) from plan where plan.printer_id = printer.printer_id and plan.printer_warehouse_id = printer.warehouse_id
						))
					)
				) from printer where printer.warehouse_id = ware.warehouse_id)		
			)
		) as xml from warehouse ware where ware.warehouse_id<100 order by ware.warehouse_id
	) as tab
));


--Query3
--artist->plan->worker
--as sql result
select a.artist_id, a.first_name, a.last_name, plan.plan_id, plan.status, plan.priority, plan.endproduct_name, plan.basic_instruction, w.svnr, w.first_name, w.last_name
	from artist a 
		left join plan on a.artist_id = plan.artist_id
		left join worker w on plan.worker_svnr = w.svnr
	where a.artist_id<100
	order by a.artist_id, plan.plan_id, w.svnr;

--as sqlxml result
select xmlelement(name root, (
	select xmlagg(xml) from (
		select xmlelement(name artist, xmlattributes(artist.artist_id as artist_id),
			xmlforest(artist.first_name, last_name),
			xmlelement(name plans, (
				select xmlagg(
					xmlelement(name plan, xmlattributes(plan_id as plan_id, status, priority),
						xmlforest(plan.endproduct_name, plan.basic_instruction),
						(select xmlelement(name involved_worker, xmlattributes(svnr as svnr, entry_date as entrydate, unique_feature),
							xmlforest(worker.first_name, worker.last_name)

						)from worker where worker.svnr = plan.worker_svnr
						)
					)
				) from plan where plan.artist_id = artist.artist_id)		
			)
		) as xml from artist where artist_id<100 order by artist.artist_id
	) as tab
));


--Query4
--worker->plans,shopping_item
--as sql result
select w.svnr, w.entry_date, w.unique_feature, w.first_name, w.last_name, w.nickname, plan.plan_id, plan.status, plan.priority, plan.endproduct_name, s.item_id, s.is_finished, s.item_info, s.due_date, s.list_entry_date
	from worker w
		left join plan on w.svnr = plan.worker_svnr 
		left join shopping_item s on s.worker_svnr = w.svnr
	order by w.svnr, plan.plan_id, s.item_id limit 100;

--as sqlxml result
select xmlelement(name root, (
	select xmlagg(xml) from (
		select xmlelement(name worker, 
			xmlattributes(svnr as svnr, entry_date as entrydate, unique_feature as unique_feature),
			xmlforest(
				first_name as first_name,
				last_name as last_name,
				nickname as nickname),		
			xmlelement(name plans, (
				select xmlagg(
					xmlelement(name plan, xmlattributes(plan_id as plan_id, status, priority),
						xmlelement(name endproduct_name, plan.endproduct_name)
					)
				)from plan where plan.worker_svnr = worker.svnr)
			),
			xmlelement(name shopping_items, (
				select xmlagg(
					xmlelement(name item, 
						xmlattributes(item_id as item_id, is_finished as is_finished),
						item_info, --the xml column
						xmlforest(
							due_date as due_date,
							list_entry_date as list_entry_date
						)
					)
				) from shopping_item where shopping_item.worker_svnr = worker.svnr)	
			)
		
		) as xml from worker order by worker.svnr limit 100
	) as tab
));