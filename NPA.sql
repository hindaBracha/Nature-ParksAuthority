create database NPA--Nature and Parks Authority
USE NPA
create table matmon(--מנוי מטמון
codeManuy int identity(1,1)PRIMARY KEY,
manuyType varchar(20) not null ,
priceM int not null,
long int not null
)
create table SiteTypes(--סוגי אתרים
SiteTypeCode int identity(1,1) PRIMARY KEY,
SiteTypeName varchar(20) not null unique
)
create table menuim(--מנוייים
groupName varchar(20) not null,
groupCode int PRIMARY KEY,
long int  not null,
codeManuy int  not null,
phone varchar(10) not null,
adress varchar(20) not null,
numMembars int not null,
SignedBy int references menuim,
constraint fk_codeManuy foreign key(codeManuy)references matmon(codeManuy)
)
create table sites(--אתרים
siteName varchar(20) unique not null,
codeSite int identity(100,1) PRIMARY KEY,
fromeAge int not null,
toAge int not null,
SiteTypeCode int references SiteTypes not null,
Price int ,
PriceM int ,
constraint check_toAgeFromeAge check(toAge>fromeAge)
)
create table visitingHoursS(--שעות פתיחה קיץ
codeHour int identity(1,1) PRIMARY KEY,
codeSite int  references sites not null,
--codeTypeHour int references TypeHours not null,
openingTime time ,
closingTime time ,
isopen bit,
remark varchar(30)
)
create table visitingHoursW(--שעות פתיחה חורף
codeHour int identity(1,1) PRIMARY KEY,
codeSite int  references sites not null,
--codeTypeHour int references TypeHours not null,
openingTime time,
closingTime time,
isopen bit,
remark varchar(30)
)
create table visits(
codeVisit int identity(1,1) PRIMARY KEY,
codeSite int references sites not null,
date date not null,
numMembars int,
groupCode int references menuim
)







