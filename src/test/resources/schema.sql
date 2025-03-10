-- H2 DB の初期化
-- drop table and view 
DROP VIEW  IF EXISTS education.V_ADDRESS;
DROP TABLE IF EXISTS education.M_PREFECTURE;
DROP TABLE IF EXISTS education.M_CITY;

--create table M_PREFECTURE
CREATE TABLE education.M_PREFECTURE( 
    PREFECTURE_CD CHAR (2) PRIMARY KEY
    , NAME VARCHAR (255) NOT NULL
    , NAME_KANA VARCHAR (255) NOT NULL
); 

--create table M_CITY
CREATE TABLE education.M_CITY( 
    CITY_CD CHAR (5) PRIMARY KEY
    , NAME VARCHAR (255) NOT NULL
    , NAME_KANA VARCHAR (255) NOT NULL
); 

--create view V_ADDRESS
CREATE VIEW education.V_ADDRESS AS ( 
    SELECT
        PREFECTURE_CD
        , M_PREFECTURE.NAME AS PREFECTURE_NAME
        , M_PREFECTURE.NAME_KANA AS PREFECTURE_NAME_KANA
        , CITY_CD
        , M_CITY.NAME AS CITY_NAME
        , M_CITY.NAME_KANA AS CITY_NAME_KANA 
    FROM
        education.M_PREFECTURE 
        LEFT JOIN education.M_CITY 
            ON M_PREFECTURE.PREFECTURE_CD = SUBSTR(M_CITY.CITY_CD, 1, 2)
);

