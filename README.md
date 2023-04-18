# wireless sensor networks database management
 A software system will be developed to manage the wireless sensor networks. This system will allow users
to perform the followings: defining sensors, defining routers which consist of one or more sensors, defining
coordinators which consist of one or more routers, and defining wireless sensor networks which consist of
one or more coordinators. A sensor can measure more than one value. One of the most important
responsibilities of the system is to store sensor measurements instantly within the database. Wireless sensor
networks are established with the aim of measuring data in different domains such as agriculture, livestock,
smart home, smart city etc. The router and coordinator devices are located in a certain address that is in a
combination of country, city, county, and districts.
In addition to the explanations above, the following requirements have been determined in this
system. Design and create the most appropriate database to meet these requirements with T-SQL codes.
Requirements:
1. The following information should be stored about the sensors:
a. Name
b. Definition
2. The following data regarding sensor measurement types should be stored in the system.
a. Name
b. Abbreviation
3. The following data should be stored regarding the definitions of sensor measurements:
a. Which sensor does it belong to?
b. Which sensor type it belongs to
c. Data type of measurement
4. The following data regarding sensor measurements should be stored in the system:
a. Which sensor does it belong to?
b. Which router does it belong to
c. Measurement type
d. The value of the measurement
e. The date and time of the measurement
5. The following data regarding routers should be stored in the system:
a. Name
b. Description
c. Country
d. City
e. County
f. District
g. The latitude
h. The longitude
i. Which coordinator does it belong to?
j. The sensors that the router has
6. The following data regarding the coordinators should be stored in the system:
a. Name
b. Description
c. Country
d. City
e. County
f. District
g. The latitude
h. The longitude
7. The following data regarding wireless sensor networks should be stored in the system.
a. Name
b. Description
c. Domain (Agriculture, livestock, smart home, smart city etc.)
d. Status(Active/Passive)
e. Created date and time
f. The coordinators that wireless sensor network has
WARNINGS
1. Only the requirements are given in the list above. Not every requirement corresponds to a table. You are
expected to examine and analyze the requirements well and create the most appropriate table or tables.
2. Please create the needed constraints for each column in the table.
