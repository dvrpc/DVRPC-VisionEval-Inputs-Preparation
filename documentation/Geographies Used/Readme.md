# Geographies Used for DVRPC VisionEval Implementation
VisionEval uses several levels of geography which are generally described in the following way:

>- A `region` defines the entire area covered by the VisionEval analyses
>- `Azones` are large areas such as cities, counties, or Census Public Use Microdata Areas (PUMAs)
>- `Bzones` are subdivisions of Azones that represent neighborhoods, Census tracts or block groups, or other relatively homogenous areas
>- Metropolitan areas (`Marea`) are defined as groups of Azones that define them

But there is flexibility in choosing what geography level is used for every geography except for `region`. The decision making on this will requires decision making on 
1. level of effort we want to pursue--especially in initial iterations of the model
2. what data is available at a geographic level (although a value only found for a higher geography can essentially be repeated in each record of a lower geography, if you want to assume it has an even distribution for all subgeographies)
3. consideration of geographies that our advantageous for model outputs (although raw values can be aggregated to larger geographies not present in the model if a nested geography is selected)
4. higher geographies need to be able to nest or largely overlap enough to set a relationship of which child geography belongs to which parent geo.

## Azones
`Azones` can be the entire region, county, or PUMA. For DVRPC's region of 351 municipalities and 18 planning districts in Philadelphia, the MCD/PhillyCPA geographies would likely be too small for many sources. In the longer term, an unused `Czone` in the VisionEval model could conceivably be used for MCD/CPA reporting but would likely need bzones to be zones to nest well with MCD/CPA. 

`Region` or `county` would likely be the easiest for data gathering. Regional would require county aggregations to create, so really county could be best as it would allow smaller, more relevant outputs for model analysis and our partners' consumption.

`PUMAs` would allow subcounty reporting, though it may not be a subcounty geography folks are well acquainted with. Data quality should still be fairly good quality. Data availability may be more challenging.

### **Decision: Azone = PUMA** (for now)

## Bzones
`Bzones` have often been presented as block groups, but tracts are possible, and some agencies are using their travel model travel analysis zones (TAZs). The `Bzone` choice is perhaps most important.

Tracts will likely improve data quality for demographic attributes from the American Communities Survey (ACS). However, if we're using UrbanSim base and horizon year inputs, this is less of a concern, and we can aggregate block outputs to tract, block group, or TAZ. 

At DVRPC, TAZs would nest better with higher geographies that we may want to report results at, like municipality or CPA. It remains to be seen whether these would be used in DVRPC products, however, as we may not want to give too much specificity or false precision on scenario impacts to particular locations. Perhaps the best arguement for TAZ `Bzones` is for model validation. We could make more direct comparrisons to travel model outputs. We still may not want to compare or do validations at such small geographies, but use aggregations of model districts (CPA/TAD), or county for this use--the geographies the travel model itself is more likely to be validated at. Perhaps the strongest reason not to use TAZ is that the geography is unique to our agency and data sources like the Census Transportation Planning Products (CTPP) have plans to retire use of these unique geographies for data reporting. Our TAZs are not too familiar outside our agency--even with many of our partners--and may also be difficult to acquire all required sources by.

Block groups may be a good geography. They won't nest with muncipal/district boundaries but might be close enought to most and may be more familiar to those outside the agency. It remains to be seen how available all the data is by this geo, but others have done it. If `Azones` are counties, there's not issue with this nesting to that. If they are `PUMAs`, nesting needs to be investigated, but likely will work.

### **Decision: Bzone = block group** (for now. easier for SLD data)

## Marea
`Marea` could be region for simplicity sake. Alternatives would include Urbanized Area and state-based subregions. Since `Marea` is used for transit inputs such as the fule used by various fleets, it may make sense to report these by the transit provider geographies (PA Counties for SEPTA and NJ Counties for NJ Transit and PATCO). This would be easier than trying to estimate a regional average and more accurate, that is if the fleets differ substantially.

Note we may want to line up Marea if that offers any compatibility with Impacts 2050
### **Decision: Marea = state subregion** (for now)