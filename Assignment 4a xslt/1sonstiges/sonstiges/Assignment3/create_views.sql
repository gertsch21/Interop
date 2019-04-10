--interop
--printer und shopping item haben jeweils xml spalten



--Yield at least 30 rows 
--Involve at least 3 tables (each query has to involve at least 3 tables) 
--Return at least 7 result columns (each query has to return at least 7 result columns) 

--welche printer wurden durch einen artist benoetigt
create or replace view test1 as 
	select a.first_name, a.last_name, p.endproduct_name, pr.printer_id, pr.printer_info
	from artist a 
		inner join plan p on a.artist_id = p.artist_id
		inner join printer pr on pr.printer_id = p.printer_id;

--welche printer hat ein mitarbeiter benoetigt
create or replace view worker_drucker_gebrauch as 
	select distinct w.first_name, w.last_name, pr.printer_id
	from plan p 
		inner join printer pr on p.printer_id = pr.printer_id
		inner join worker w on w.svnr = p.worker_svnr;
	

--welche produkte werden in einem warehouse benoetigt
create or replace view warehouse_shopping_items as 
	select wa.warehouse_id, wa.name, worker.svnr, worker.first_name, worker.last_name, si.item_info
	from warehouse wa 
		inner join worker w on wa.warehouse_id = w.warehouse_id
		inner join shopping_item si on w.svnr = si.worker_svnr
	where 
		not si.is_finished;
	

select xmlelement(name worker, xmlforest(xmlelement(name first_name, first_name), xmlelement(name last_name, last_name)))






sonstiges


--plan als xml
drop view if exists plan_as_xml;
create or replace view plan_as_xml as 
select 
	plan_id, 
	worker_svnr,
	xmlelement(name plan, xmlattributes(plan_id as id, status as status, creation_date as creation_date),
		xmlelement(name endproduct_name, endproduct_name),
		xmlelement(name printer, 
			(Select printer_info from printer where printer.printer_id = plan.printer_id)
		)
	) as plan_xml
from plan;


drop view if exists worker_as_xml;
create or replace view worker_as_xml as
select 
	xmlelement(name worker, xmlattributes(svnr as svnr),
		xmlelement(name Workername, first_name || ' ' || last_name),
		xmlelement(name uniqueFeature, unique_feature),
		xmlelement(name plans, 
			(select xmlagg(plan_xml)
				from plan_as_xml where worker_svnr = w.svnr
			)
		)
	) as myxml
from worker w inner join plan p on p.worker_svnr = w.svnr  order by w.svnr; -- limit 100;

select xmlagg(myxml)  from worker_as_xml;





select * from worker;
select 
	
	xmlelement(name worker, xmlattributes(svnr as svnr, entry_date as entrydate, unique_feature as unique_feature),
		xmlelement(name firstname, first_name),
		xmlelement(name lastname, last_name),
		xmlelement(name nickname, nickname),		
		xmlelement(name plans, xmlattributes(plan_id as id),
				(select xmlagg(
					
					)
					from plan_as_xml where worker_svnr = w.svnr
				)
		)
	) as myxml
from worker w inner join plan p on p.worker_svnr = w.svnr  order by w.svnr;




