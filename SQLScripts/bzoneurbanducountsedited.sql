

create table transform.urban_du_counts as (
	select
	baw.bzone_id,
	baw."year",
	SUM(sf_count) AS urbansf,
	SUM(mf_count) as urbanmf,
	SUM(gq_count) as urbangq
	FROM "transform".block_attributes_2019_withgq baw
	WHERE baw.lutype = 'Urban'
	group by baw.bzone_id, baw."year" 
)

create table transform.urban_du_counts_dwelling_units as (
SELECT
	bdu.geo,
	bdu.year,
	urbansf,
	urbanmf,
	urbangq,
	case 
        when udc.sfdu = 0
            then null
        else udc.urbansf/udc.sfdu 
        end PropUrbanSFDU,
    case 
    	when udc.mfdu = 0
    		then null
    	else udc.urbanmf/udc.mfdu 
    	end PropUrbanMFDU,
    case 
    	when bdu.gqdu = 0
    		then null
    	else udc.urbangq/udc.gqdu 
    	end PropUrbanGQDU
FROM
	"staging".bzone_dwelling_units bdu 
full JOIN "transform".urban_du_counts udc ON udc.bzone_id = bdu.geo 
);


create table transform.town_du_counts as (
	select
	baw.bzone_id,
	baw."year",
	SUM(sf_count) AS townsf,
	SUM(mf_count) as townmf,
	SUM(gq_count) as towngq
	FROM "transform".block_attributes_2019_withgq baw 
	WHERE baw.lutype = 'Town'
	group by baw.bzone_id, baw."year" 
)

create table transform.town_du_counts_dwelling_units as (
SELECT
	bdu.geo,
	bdu.year,
	townsf,
	townmf,
	towngq,
	bdu.sfdu,
	bdu.mfdu,
	gqdu,
	case 
        when bdu.sfdu = 0
            then null
        else tdc.townsf/bdu.sfdu 
        end PropTownSFDU,
    case 
    	when bdu.mfdu = 0
    		then null
    	else tdc.townmf/bdu.mfdu 
    	end PropTownMFDU,
    case 
    	when bdu.gqdu = 0
    		then null
    	else tdc.towngq/bdu.gqdu 
    	end PropTownGQDU
FROM
	"staging".bzone_dwelling_units bdu 
inner JOIN "transform".town_du_counts tdc ON tdc.bzone_id = bdu.geo
);

create table staging.bzone_urban_town_du_proportions as (
select 
	bdu.geo,
	bdu."year",
	bdu.sfdu,
	bdu.mfdu,
	bdu.gqdu,
    case 
        when tdc.sfdu = 0
            then null
        else tdc.townsf/ tdc.sfdu 
        end PropTownSFDU,
    case 
    	when tdc.mfdu = 0
    		then null
    	else tdc.townmf/tdc.mfdu 
    	end PropTownMFDU,
    case 
    	when tdc.gqdu = 0
    		then null
    	else tdc.towngq/tdc.gqdu 
    	end PropTownGQDU,
    case 
        when udc.sfdu = 0
            then null
        else udc.urbansf/ udc.sfdu 
        end PropUrbanSFDU,
    case 
    	when udc.mfdu = 0
    		then null
    	else udc.urbanmf/udc.mfdu 
    	end PropUrbanMFDU,
    case 
    	when bdu.gqdu = 0
    		then null
    	else udc.urbangq/udc.gqdu 
    	end PropUrbanGQDU
from staging.bzone_dwelling_units bdu
join "transform".town_du_counts_dwelling_units tdc on bdu.geo = tdc.geo 
join "transform".urban_du_counts_dwelling_units udc on bdu.geo = udc.geo
)


UPDATE staging.bzone_urban_town_du_proportions 
set proptowngqdu = 0
WHERE proptowngqdu IS NULL;
