//
//  ArticleListViewModel.swift
//  ProjectLibraryApp
//
//  Created by Ivan Aguiar on 29/09/2022.
//

import Foundation

struct articles {
    public static let articles2021 = [
        Article(
            tittle: "Winter sea ice pack likely thinnest on record",
            details: """
            Paper-thin when it first freezes, sea ice thickens over time, making ice age a proxy for ice thickness. Arctic sea ice that has survived multiple summers is often two or more meters thick. Its greater thickness (and therefore volume), combined with its lower salt content, makes old ice more likely to survive the summer melt season than new ice.
            According to the 2021 Arctic Report Card, old ice in the Arctic Ocean has plummeted to a tiny fraction of what it once was. These maps compare sea ice age in the Arctic Ocean around the time of the winter maximum. Ice that is at least four years old is white. Younger ice appears in darker shades of blue. In March 1985 (left), ice at least four years old stretches over a substantial portion of the ocean surface, practically dominating the ice pack. In March 2021 (right), ice at least four years old is largely confined to a thin strip north of the Canadian Archipelago.
            Sea ice age is estimated from satellite monitoring of sea ice motion, and the record goes back nearly 40 years. Over the past decade or so, new satellite sensors have also been measuring ice volume. After combining data from both satellite products over the previous three years, authors of the Arctic Report Card: Update for 2021 found that the 2020–2021 winter likely had the thinnest sea ice on record.
            """,
            reference: "Meier, W.N., Perovich, D., Farrell, S., Haas, C., Hendricks, S., Petty, A., Webster, M., Divine, D., Gerland, S., Kaleschke, L., Ricker, R., Steer, A., Tian-Kunze, X., Tschudi, M., Wood, K. 2021. Sea ice. Arctic Report Card: Update for 2021.",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/2021-arctic-report-card-winter-sea-ice-pack-likely-thinnest-record")!,
            imageName: "ARC2021_SeaIceAge_1985_vs_2021_2000px",
            publishedDate: "DECEMBER 13, 2021"
        ),
        Article(
            tittle: "Strong greening trend continues across Arctic tundra",
            details: """
            Encircling the Arctic Ocean, Arctic tundra is a cold-adapted ecosystem of low-profile plants making the most of short, cool summers. Since the early 1980s, satellites have detected an increase in tundra vegetation productivity, a phenomenon known as “the greening of the Arctic.” According to NOAA’s 2021 Arctic Report Card, the strong Arctic-wide greening trend continues, with 2021 bringing another summer with high summer-peak greenness.
            This map shows where tundra productivity has increased (green) or decreased (brown) over the past two decades according to NASA satellite data. Overall, the Arctic is greening, with especially strong trends in Canada east of Hudson Bay and in Russia’s Far East. A few areas appear to be declining in productivity. The Russian coast inland of the East Siberian Sea is the most obvious.
            Satellite-based “greenness” is an index (NDVI) that compares how much visible and near-infrared light a landscape reflects. Vegetation strongly absorbs visible light, but strongly reflects near-infrared light.  This combined reflection—low visible, high near-infrared—is a signature of vegetation density and leafiness that’s visible from space. Satellite observations going back to the early 1980s show without a doubt that tundra is greening across most of the North American and Eurasian Arctic. The five highest summer-peak greenness values of the long-term satellite record have all occurred within the last decade.
            But what does “greening” mean on the ground? Arctic scientists have reported that a significant part of the satellite greening trend is driven by the “shrubification” of the tundra. In many areas, tundra shrubs are becoming larger and denser. They are also colonizing areas of newly thawed permafrost and other landscape disturbances.  While these trends are widespread, they aren’t universal. Satellites have also observed localized “browning” events associated with extreme weather, and physical landscape disturbances such as tundra fire and flooding of landscape patches affected by permafrost thaw.
            """,
            reference: "Frost, G.V., Macander, M.J., Bhatt, U.S., Berner, L.T., Bjerke, J.W., Epstein, H.E., Forbes, B.C., Goetz, S.J., Lara, M.J., Park, T., Phoenix, G.K., Serbin, S.P., Tømmervik, H., Walker, D.A., Yang, D. 2021. Tundra greenness. Arctic Report Card: Update for 2021.",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/2021-arctic-report-card-strong-greening-trend-continues-across-arctic")!,
            imageName: "Arctic-Report-Card-2021_tundra-greenness_2000px",
            publishedDate: "DECEMBER 14, 2021"
        ),
        Article(
            tittle: "Greenland ice loss below average in 2021 despite late-season melt spike",
            details: """
            According to Arctic Report Card: Update for 2021, the Greenland Ice Sheet lost a total of 85±16 billion metric tons of ice mass between September 1, 2020 and August 31, 2021, based on observations from the GRACE-FO satellite. The loss was substantially less than the 2002–2021 average of 264±12 gigatons of ice per year. The smaller ice losses came despite several extensive melt events that occurred unusually late in the summer.
            This map shows how the 2021 melt season compared to the 1981–2010 average. Areas with a longer-than-average melt season are orange and red, and areas with a shorter-than-average melt season are blue. The darker the color, the greater the difference from average. Extensive areas of much longer-than-average melt season occurred along the ice sheet perimeter in eastern Greenland. Even areas in the interior of the island—where the elevation is highest—had slightly more melt days than average.
            Typically, the Greenland melt season peaks in mid-July, with less than 40 percent of the ice sheet affected. But on July 19, 2021, surface melt occurred across 43 percent of the ice sheet. On July 28, 54 percent of the ice sheet showed surface melting. On August 14, melt occurred across 53 percent of the ice sheet. The August melt event reached the ice sheet’s highest elevation (nearly 2 miles above sea level), and it was accompanied by rain—the first time that’s been observed at the National Science Foundation’s Summit Station.
            The August 14 event was unprecedented: it was the latest in the year that satellites had ever observed melt on more than half of the ice sheet’s surface. It was also only the second time on record that surface melt affected more than half of the ice sheet twice in a single melt season.
            """,
            reference: "Moon, T.A., Tedesco, M., Box, J.E., Cappelen, J., Fausto, R.S., Fettweis, X., Korsgaard, N., Loomis, B.D., Mankoff, K.D., Mote, T.L., Wehrlé, A., Winton, Ø.A. 2021. Greenland Ice Sheet. Arctic Report Card: Update for 2021.",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/2021-arctic-report-card-greenland-ice-loss-below-average-2021-despite")!,
            imageName: "Arctic-Report-Card-2021_Greenland-ice-sheet-melt_1600",
            publishedDate: "DECEMBER 14, 2021"),
        Article(
            tittle: "Arctic had seventh-warmest year on record",
            details: """
            The Arctic Report Card: Update for 2021 describes Arctic conditions over October 2020–September 2021. (The annual monitoring year in the Arctic splits the calendar year to avoid splitting the cold season). During that time, near-surface air temperatures across the Arctic land areas were the seventh-highest on record since 1900. Surface air temperature anomalies were 2°F (1.1°C) above the 1981-2010 average.
            This map shows near-surface temperatures for October 2020–September 2021 compared to the 1981–2010 average. (The map is based on ERA5 Reanalysis, 925-millibar pressure-level data from the Copernicus Climate Change website.) Areas with warmer-than-average temperatures are orange and red, and areas with colder-than-average temperatures are blue. Despite some slightly below-average temperatures in parts of Eurasia, North America, and the North Atlantic Ocean, warm temperatures predominate. Temperatures are particularly high over the central Arctic, the Laptev Sea, and the periphery of Greenland.
            The graph shows temperatures over land areas north of 60°N (red line) compared to the global average (dark gray line). Temperatures have risen across the globe since 1900, but since the year 2000, Arctic temperatures have risen at least twice the global average. This “Arctic amplification” results from multiple mechanisms that enhance warming at high latitudes, including the loss of ice and snow, which reduces the Arctic’s ability to reflect incoming sunlight.
            According to the Arctic Report Card authors, October–December 2020 terrestrial temperatures were the highest on record for that time of year across the Arctic as a whole and the Asian Arctic. On June 30, 2021, the temperature at Fort Smith, Northwest Territories, Canada, soared to 103.8°F (39.9°C)—a temperature that could have broken records at much lower latitudes. On August 14, 2021, above-freezing temperatures at the summit of the Greenland Ice Sheet prompted several hours of rainfall.
            """,
            reference: "Ballinger, T.J., Overland, J.E., Wang, M., Bhatt, U.S., Brettschneider, B., Hanna, E., Hanssen-Bauer, I., Kim, S.-J., Thoman, R.L., Walsh, J.E. 2021. Surface air temperature. Arctic Report Card: Update for 2020.",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/2021-arctic-report-card-arctic-had-seventh-warmest-year-record")!,
            imageName: "Arctic-Report-Card-2021_surface-temperatures_map_graph_2000px",
            publishedDate: "DECEMBER 13, 2021"),
        Article(
            tittle: "New maps of annual average temperature and precipitation from the U.S. Climate Normals",
            details: """
            Earlier this spring, NOAA released the 1991-2020 U.S. Climate Normals—the new official baseline for describing average U.S. climate. Climate.gov produced a collection of maps showing how what counts as “normal” temperature and precipitation for the United States has changed over the past century. Now we’ve doubled back to make maps not of change, but simply the new annual average temperature and precipitation across the contiguous United States.
            These maps show annual average temperature and precipitation for the Lower 48 U.S. states based on observations collected at thousands of U.S. weather stations from 1991–2021. (Normals are available for individual weather stations in Alaska and Hawaii.) On the temperature map (top), places where the annual average temperature is around 50 degrees Fahrenheit are white. Colder areas are blue. Warmer areas are orange and red. On the precipitation map (bottom), the wettest parts of the country, where the annual average precipitation is close to 80 inches a year or more, are dark blue. The driest parts of the country are light green. (“Binned” versions of these maps are also available for download below the main image.)
            The contiguous United States has a big range of climates and microclimates. The southernmost parts of Florida, Texas, California, and Arizona all have annual average temperatures of at least 70 degrees, but very different rainfall amounts: 10 inches or less in the Southwest versus more than 50 inches in Florida. Parts of the Dakotas are as dry as New Mexico on an annual average basis, and yet at first glance, they don’t seem nearly so arid, in part because they are also much cooler.
            Everywhere they occur, mountains—even just isolated ridges and plateaus—are wetter than their surrounding lowlands. The contrast is most extreme in Washington and Oregon, where the Coast and Cascade Ranges in the west are up to 8 times wetter than parts of the Columbia River Plateau to the east. Less dramatic contrasts outline the local ranges of the Appalachian Mountains that run North to South in the East: New Hampshire’s White Mountains, West Virginia’s Alleghenies, and the Great Smokey Mountains at the intersection of North Carolina, South Carolina, and Georgia.
            To find station data or see how the 1991-2020 Normals compare to the 1981-2010 Normals, visit the U.S. Climate Normals page at the National Centers for Environmental Information.
            To build your own U.S. maps, visit the NOAA Northeast Regional Climate Center’s Gridded Normals Mapper. (Chose the “Region” radio button and then “CONUS” from the dropdown menu.)
            To see how the Normals have changed over the twentieth century, see our story Climate change and the U.S. Normals.
            """,
            reference: "",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/new-maps-annual-average-temperature-and-precipitation-us-climate")!,
            imageName: "Normals_Temperature_Annual_1991-2020_binned_2800x2181",
            publishedDate: "OCTOBER 11, 2021"),
        Article(
            tittle: "Even small additional increases in greenhouse gases will make decades-long “megadroughts” in the Southwest more common",
            details: """
            At the dawn of the 21st century, drought descended on southwestern North America. Two decades later, the drought continues. Recent NOAA-funded research found that even small additional increases in greenhouse gas emissions will make such decades-long “megadroughts” more common. But limiting greenhouse gas emissions will reduce the intensity of megadrought by reducing the risk of the most intense single-year droughts that occur within the longer period.
            These maps show projected changes soil moisture—one way to measure drought—across the Southwest by the late 21st century (2071–2100) depending on how many greenhouse gases people produce in coming decades. In these maps, wetter conditions are blue-green; drier conditions are brown. Summer soil moisture is likely to decline in the future, even in a world where greenhouse gas emissions are kept fairly low (left). But the drying impact is far less severe than in a future in which greenhouse gas emissions are much higher (right).
            To project future conditions, the scientists chose two drought events from the historical record—the megadrought that began in 2000 and the extreme single-year drought of 2002—and used them as test cases for what droughts like those might look like in a future, warmer climate. Even in the model experiments with the lowest future greenhouse gas emissions, the risk of 21-year soil moisture deficits as bad as or worse than the current drought was roughly 50 percent.
            But that doesn’t mean there’s no benefit to reducing how many greenhouse gases we emit. The researchers also found that reducing greenhouse gas emissions will significantly lower the risk of extremely dry single-year droughts within a longer megadrought. If we can reduce the occurrence of intense, single-year droughts, it will reduce the overall intensity of megadroughts. That will give us a better chance to adapt to the drier conditions we may not be able to avoid.
            """,
            reference: "Cook, B. I., Mankin, J. S., Williams, A. P., Marvel, K. D., Smerdon, J. E., Liu, H. (2021). Uncertainties, Limits, and Benefits of Climate Change Mitigation for Soil Moisture Drought in Southwestern North America. Earth’s Future, 9(9). https://doi.org/10.1029/2021ef002014. NOAA Climate Program Office. (2021, September 8). Study: Dry future likely unavoidable for Southwest, but reducing greenhouse gases can still help. Accessed September 18, 2021.",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/even-small-additional-increases-greenhouse-gases-will-make-decades")!,
            imageName: "FI_soilmoisture_SW_20210921_labels_1400",
            publishedDate: "SEPTEMBER 27, 2021"),
        Article(
            tittle: "May 2021 tied for sixth-warmest May on record",
            details: """
            According to the latest monthly global climate summary from NOAA's National Centers for Environmental Information (NCEI), May 2021 was among the top-ten warmest Mays on record:
            The May 2021 global surface temperature was 1.46°F (0.81°C) above the 20th-century average of 58.6°F (14.8°C), tying with 2018 as the sixth-warmest May in the 142-year record. May 2021 marked the 45th consecutive May and the 437th consecutive month with temperatures, at least nominally, above the 20th-century average.
            Temperatures were much above average across parts of northern, western and southeastern Asia, Africa, northern South America and across parts of the Pacific, Atlantic, and the Indian Oceans. Temperatures were cooler than average across parts of North America, the eastern Pacific Ocean, central Europe, central Asia and India.
            Regionally, Asia had its second-warmest May on record, behind May 2020. Africa had its sixth-warmest May on record. Meanwhile, Europe and North America had their coolest May since 2004 and 2011, respectively.
            This map shows how temperatures in May 2021 compared to the 1981-2010 average across the globe. Places that were up to 9 degrees Fahrenheit warmer than average are darkest red, and places that were up to 9 degrees cooler than average are deep blue. Places where temperature was near average are white. The gray areas over the poles indicate places where there are no ground-based observations.
            Below the map is a graph of the May global temperature each year since 1880 compared to the 20th-century average. The globe as a whole hasn't experienced a cooler-than-average (blue bars) May since 1976. According to NCEI's Climate at a Glance tool, May temperatures have increased by 0.08˚Celsius (0.14˚Fahrenheit) over the period of observations.
            For more May climate information, see the May 2021 State of the Climate summary from NCEI.
            """,
            reference: "",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/may-2021-tied-sixth-warmest-may-record")!,
            imageName: "Global_May2021tempanom_map_graph_large",
            publishedDate: "JUNE 15, 2021"),
        Article(
            tittle: "Which mountain snowpacks are most vulnerable to global warming?",
            details: """
            As Earth heats up thanks to human-caused climate change, scientists expect that winter snowpacks will melt increasingly earlier in the spring. According to a new NOAA-funded study, these impacts are already underway, but global warming isn’t impacting every region equally. While snowpack in some regions has been relatively unaffected, snowpack in other regions is melting nearly a month earlier than usual.
            Based on observed snowpack and temperature data from 1982-2018, this map shows how one degree Celsius of warming advances snowpack disappearance date—the number of days earlier in the spring when all the winter snow has melted. Darker shades of gray and pink show more vulnerable regions, where one degree of warming is causing snowpack to disappear as much as 27 days earlier.
            According to model results, overall, coastal (low elevation) and southern regions are more vulnerable than northern interior regions. In the United States, the snowpack disappearance dates in southern Alaska, the Cascades, Sierra Nevadas, across the lower Midwest, and along parts of the Appalachians are changing more rapidly than in regions like the Rocky Mountains and Upper Midwest. Globally, parts of the coastal Arctic, the European Alps, and lower regions of the Himalayas have been more affected, while snowpack in the northern interiors of Europe and Asia, including the central region of Russia, is disappearing just 3 days earlier.
            To understand the differences, we need to look at how temperature changes throughout the year. Snowpack in regions with smaller swings in temperature between winter and summer is more vulnerable to warming than snowpack in regions with greater seasonal temperature differences. In coastal regions, for instance, the ocean acts as a big thermal regulator, making winters warmer, keeping summers cooler, and reducing the annual temperature range. The ocean’s influence means fewer days with wintertime temperatures at or below freezing (32°F or 0°C) for snow to fall and accumulate, compared to inland areas at the same latitude.
            So in coastal regions like the Cascades, just one degree of warming can cause a dramatic reduction in the number of days below freezing and bring a much earlier start to spring and snowmelt. However, northern interior regions see bigger temperature swings between winter and summer, with more days annually at or below freezing for snowfall. In these regions, one degree of warming causes a smaller decrease in below-freezing days and a smaller shift in snowpack disappearance date.
            In many parts of the world, mountain snowpack is a critical natural reservoir. Much of the global population, including millions of people in the western United States, depend on water stored in snowpack for drinking water, irrigation, and hydroelectric power. Snow disappearing nearly a full month earlier radically alters surface water availability, with substantial impacts for people, ecosystems, and agriculture.
            """,
            reference: "",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/which-mountain-snowpacks-are-most-vulnerable-global-warming")!,
            imageName: "vulnerable_mountain_snowpack_2021_large",
            publishedDate: "MARCH 22, 2021"),
        Article(
            tittle: "February 2021 wraps up Northern Hemisphere's eighth-warmest winter on record",
            details: """
            Despite well below average temperatures across parts of North America and Russia in February 2021, the global average surface temperature for the month was 1.17°F (0.65°C) warmer the 20th-century average of 53.9°F (12.1°C) according to NOAA’s National Centers for Environmental Information (NCEI). It was the 16th-warmest February in the 142-year record. The overall warmth was no surprise: Earth hasn’t had a colder-than-average February since 1976.
            The animated gif shows the monthly average temperature for December 2020, January 2021, and February 2021 compared to the 1981-2010 average. Places that were warmer than average are red, and places that were cooler than average are blue.
            Overall, the Northern Hemisphere winter (December 2020–February 2021) was also warm. Average temperatures were 1.33°F (0.74°C) above the 20th-century average, making it the 8th-warmest Northern Hemisphere winter season on record for the globe. The planet hasn’t experienced a Northern Hemisphere winter that was colder than average in 45 years.
            Several areas were record-warm over December-January, including the eastern Mediterranean, the Atlantic off the U.S. Northeast, and the western tropical Pacific. No areas were record cold, but a few areas ranked as much colder than average: a swath of the eastern Pacific south of the equator, two isolated spots in Northern Russia, and a single spot in the North Atlantic Ocean southwest of Iceland.
            To read more about the February and winter climate summaries, visit NCEI's State of the Climate reports page.
            """,
            reference: "",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/february-2021-wraps-northern-hemispheres-eighth-warmest-winter-record")!,
            imageName: "global_temp_anom_2020Dec-2021Feb_620_stacked3",
            publishedDate: "MARCH 17, 2021"),
        Article(
            tittle: "When it comes to U.S. climate, what’s normal is about to change",
            details: """
            Every decade, member nations of the World Meteorological Organization release an updated version of their country’s climate normals—a statistically smoothed, carefully quality-controlled, 30-year average of recent climate conditions. NOAA climate experts at the National Centers for Environmental Information are currently working on the new U.S. Climate Normals, which span 1991-2020. The new data are planned for release in May 2021.
            These images are a sneak peak at how the new normals for winter temperature (top) and precipitation (bottom) are different from the current normals, which cover 1981-2010. Consistent with the long-term warming trend, winter is warmer across most of the contiguous United States, but the amount of warming ranges from nearly 0.0 (light pink) to 1.5 degrees (darker pink) Fahrenheit depending on the location. There are even a few small areas of the Northern Plains where the normal winter temperature for 1991-2020 is slightly cooler than the 1981-2010 normal (light blue).
            There’s a lot more variation in the changes in winter precipitation, which includes both rain and snow. The map shows the percent difference in normal winter precipitation in the new normal versus the old normals. The Northern Plains and Upper Midwest have seen the biggest percent increases in normal winter precipitation, while the biggest percent decreases occurred in the Southwest and Southern Plains, including Colorado’s Eastern Plains. (In absolute terms, these changes are equivalent to only fractions of an inch of liquid water because these locations are normally quite dry during the winter.)
            Climate normals provide the baseline for comparing U.S weather and climate to the recent past, providing context for decisions in multiple economic sectors, including agriculture, energy production, and construction. Among the new information NCEI experts are working on is a secondary set of normals that cover just the last 15 years—useful for applications that need a normal closer to today.  Read more about the ongoing work on the new climate normals at the NCEI website.
            """,
            reference: "",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/when-it-comes-us-climate-whats-normal-about-change")!,
            imageName: "winter_normals_differences_620",
            publishedDate: "MARCH 10, 2021"),
        Article(
            tittle: "NOAA-sponsored research shows that mobile sensors are a low-cost, effective way for U.S. cities to map their carbon dioxide emissions",
            details: """
            More than a dozen U.S. states, close to 150 cities, and more than a thousand U.S. businesses have adopted plans to dramatically reduce their planet-warming carbon dioxide emissions. That means cities across the country are asking the same question: what’s the cheapest way to map and measure carbon dioxide emissions? New NOAA-funded research led by Derek Mallia, Logan Mitchell, and John Lin from the University of Utah demonstrated the usefulness of one approach. The team found that deploying mobile sensors on an electrified light rail train, instead of installing stationary sensors, can drastically improve cities’ understanding of their carbon dioxide emissions.
            In the past, tradition has called for deploying multiple research-grade, costly sensors in different parts of the city. But the first pair of maps illustrates the expanded upwind sampling area, or footprint, that can be mapped by a single carbon dioxide instrument mounted on a light rail train car (right side), compared to the upwind footprint for four stationary instruments at fixed locations (left). Mobile sensors attached to a light rail train car allowed researchers greater insight into the Salt Lake Valley region, including important carbon dioxide sources such as Interstates 15 and 80, downtown Salt Lake City, power plants, and oil refineries. Not only did mobile sensors produce better results than stationary sensors, but they did so at a fraction of the cost. The authors estimate that a single sensor deployed on a light rail public transit platform could gather the same information on carbon dioxide emissions as 30 stationary sensors, saving the city $1.2 million dollars.
            Creating urban emission inventories like Salt Lake City’s requires a multitude of data streams to be blended in a model. Each data set has its own source of uncertainty. For example, researchers can measure the emissions from the tail pipe of a car, but to estimate emissions from all cars in a city requires knowing (1) how many cars are in a city, (2) knowing when and where these cars are being driven, (3) the age of the vehicle fleet, (4) the types of vehicles, and more. Ideally, real-world observations allow researchers to place upper or lower limits on what they don’t know. The maps show that mobile sensors significantly reduced the uncertainty in model estimates of the city’s emissions—cutting it in half in some places in the Salt Lake Valley.
            The Salt Lake Valley’s natural boundaries around Salt Lake City make it ideal for studying urban carbon emissions, and analogous urban areas exist. The only condition for selecting a light rail system is that the trains must be electrical and run above ground; otherwise, the train’s own emissions could skew the results. For instance, future studies could examine Denver, Colorado, another urban region with public light rail. Future research could also apply this study framework to air pollutants such as PM2.5—the tiny soot and aerosol particles that are especially dangerous to human health. The research might also encourage cities without light rail to seriously consider other options for mobile sensor deployment.
            This research was funded by NOAA’s Climate Program Office through its Atmospheric Chemistry, Carbon Cycle, and Climate (AC4) program.
            """,
            reference: "",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/noaa-sponsored-research-shows-mobile-sensors-are-low-cost-effective")!,
            imageName: "LightRailCO2_footprints_620",
            publishedDate: "FEBRUARY 2, 2021"),
        Article(
            tittle: "Month-by-month recap of 2020's global temperature patterns",
            details: """
            Averaged across land and ocean, the 2020 surface temperature was 1.76° F (0.98° Celsius) warmer than the twentieth-century average and 2.14˚F (1.19˚C) warmer than the pre-industrial period (1880-1900). According to the 2020 climate highlights released today by the National Centers for Environmental Information (NCEI), this makes 2020 the second-warmest year in NOAAs temperature record, which extends back to 1880.
            This animation shows maps of monthly temperatures for January–December 2020 compared to the 1981–2010 average, with areas that were warmer than average in red and areas that were cooler than average in blue. The final frame of the animation shows the overall average for the year.  Note that the temperature range on the monthly maps is broader than the range for the annual average (plus or minus 9 degrees versus plus or minus 5 degrees).
            The big temperature story of the first half of the year was the extreme warmth over Europe and Russia. The extreme heat began losing its grip over Europe in late spring, but persisted in Russia, through May. Despite a moderately strong La Niña event that cooled a wide swath of the tropical Pacific Ocean in the second half of the year, 2020 came just 0.04˚ Fahrenheit (0.02˚Celsius) shy of tying 2016 for warmest year on record. Average temperature over land areas was record warm.
            The full list of 2020 global climate highlights are available from NCEI.
            """,
            reference: "",
            url: URL(string: "https://www.climate.gov/news-features/featured-images/month-month-recap-2020s-global-temperature-patterns")!,
            imageName: "GlobalTempAnomRecap2020_animation_620",
            publishedDate: "JANUARY 14, 2021")
    ]
}
