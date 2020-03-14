# Citi Bike Analysis Jersey City

This presentation covers 6 areas over 8 story-tabs (=dashboards).

1. Overall Facts
2. Growth analysis by year by Gender and Unidentified (all non-prescription customers)
3. Growth analysis by month by Gender 
4. Station Analyis - popularity map 
5. Station Analysis - TOP/BOTTOM-10 charts
6. Day analysis - statistics by the hour
7. Age Analysis
8. Bike Analysis


## 1. Overall Facts

To get the analysis started, let begin with high level data:
The number of trip per year (2016 - 2019)
The average trip distance per year (2016-2019)
The average trip time per year (2016-2019)

**The number of trips have grown year over year**. A slightly deeper level break down by gender reveals the most growth (in number of trips) came from male as well as female subscribers. Or so it appears. We will investigate further. Also **the average trip distance and time** has come done considerably for both men and other customers but remained steady for female riders. Non-subscription customers (tourists?) on average bike much further (~2.5 miles vs ~1 mile) and longer (40 min vs ~ 10min).

## 2. Growth analysis by year by Gender and Unidentified (all non-prescription customers) - 2019 vs 2016

Subscibed members provide Citi Bike with their year of birth and gender. Therefor this is one group of customers and all (most) others are listed under 'Customer' with a gender of undefined. More about age on tab 7.

When comparing 2019 data to 2016 data the following conclusions can be drawn
* These graphs confirm that in absolute numbers, males make up the lion's share of the growth (109k vs 41k), but surprisingly, when expressed in percentages it is actually **group of females** that grows fastest (**83% vs 62%**). This indicates that a targeted campaign to draw more female subscribers has worked!!
* Since the total of Subscribed customers far exceeds irregular customers, the next phenomenon isn't directly clear, but in the 2 years that Citi Bike has started renting bikes to non-subscribers, it has proven to be a success with **25%** growth 2019 vs 2018. 

## 3. Growth analysis by month by Gender 

The next slide is similar to the previous growth by year analysis, but here we see growth per month for the past 4 years (2016-2019) as well as a % share of growth between 2019 and 2016 of all customers (both subscribers and non subscibers).
**Most relative growth** occured in January and February, the winter months. **Most absolute growth** happend in the month of July.

## 4. Station Analyis - popularity map 

All trips originate in Jersey City. Grove St. PATH is by far the most popular place. It is situated right in the center of the city. When looking where all these trips wind up, the map is much more spread out. Looking closely you will find that quite a few people even make it accross to the water to Manhattan and drop their bikes at a bike station there. 
**Grove St. Path** again is the most popular return station, but almost 12000 more bikes get returned here than that have leave as starting point.

## 5. Station Analysis - TOP/BOTTOM-10 charts

The bar charts confirm what could be seen on the map already, Grove St. Path is be far the most popular start- and endpoint. It also shows that **people venture out more throughtout the day**, as the other popular 10 start stations, all have fewer bikes return at the end of the day. Grove St. Path is the exception.

Jackson Square closes the ranks on popularity. With just 1000 trips leaving and even less returning, that averages under 3 bikes a day.

## 6. Day analysis - statistics by the hour

2019 rental data plotted by hours of the day, immediately shows a spike during morning and evening rush our (8am and 5-6pm). However, when split by subscribers and non-subscribers, **the peak shifts**. For subscribers, peak times still hold (including a small uptick during lunch), but it's obvious other customers prefer to bike throughout the day. They are probably tourists. 

## 7. Age Analysis	

The age analysis is interesting. Is shows us on the left a split by renter type (subscriber or other customer) and on the right a split by gender.
The conclusion that can be drawn, is that in 2016 when the age of a non-subscriber wasn't know (most of the time this is the case), the system left the birthdate empty (database makes it default to 0). **By 2019 the default birth date was 1969**. Causing a extraordinary number of people aged 53 to appear in the charts. Simply retricting the charts to leave out 'Unidentified' genders or renter type 'Customer' will circumvent this. It would be great if this information could somehow be gathered.

Two more obvervations. **Customers (non-subscription) are mostly under the age of 40!**
Some really old people exist in the system. Most of them are subscribers, so that may be some thing that can be fixed during renewal of membership (check id). 
**Rental peaks between the age of 31-34**.

## 8. Bike Analysis

Without maintenance, it's hard to indicate when a bike needs servicing. The number of bikes has been declining. 
In 2019 there were 609 of them. Almost half off the number 2 years prior. The average bike had 730 miles spent on them. Almost tripled from 2 years prior. So there are fewer bikes, but **there are being used much more efficiently**

Bike 26170 had the max total of 3,138 miles on it!
