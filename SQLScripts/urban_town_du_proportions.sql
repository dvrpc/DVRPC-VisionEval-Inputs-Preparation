

create table transform.urban_du_counts as (
	select
	baf.block_id,
	baf."year",
	SUM(sf_count) AS urbansf,
	SUM(mf_count) as urbanmf,
	SUM(gq_count) as urbangq
	FROM "transform".block_attributes_2019final2 baf 
	WHERE baf.lutype = 'Urban'
	group by baf.bzone_id, baf."year" 
)

create table transform.town_du_counts as (
	select
	baf.block_id,
	baf."year",
	SUM(sf_count) AS townsf,
	SUM(mf_count) as townmf,
	SUM(gq_count) as towngq
	FROM "transform".block_attributes_2019final baf 
	WHERE baf.lutype = 'Town'
	group by baf.bzone_id, baf."year" 
)

create table staging.bzone_urban_town_du_proportions as (
select 
	bdu.geo,
	bdu."year",
	bdu.sfdu,
	bdu.mfdu,
	bdu.gqdu,
    case 
        when bdu.sfdu = 0
            then null
        else tdc.townsf/ bdu.sfdu 
        end PropTownSFDU,
    case 
    	when bdu.mfdu = 0
    		then null
    	else tdc.townsf/bdu.mfdu 
    	end PropTownMFDU,
    case 
    	when bdu.gqdu = 0
    		then null
    	else tdc.towngq/bdu.gqdu 
    	end PropTownGQDU
from staging.bzone_dwelling_units bdu
join "transform".town_du_counts tdc on bdu.geo = tdc.bzone_id
)

UPDATE staging.bzone_urban_town_du_proportions 
set proptowngqdu = 0
WHERE proptowngqdu IS NULL;
