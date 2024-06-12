BEGIN

-- Drop the table if it already exists
DROP TABLE IF EXISTS PATIENT.INFO;

CREATE TABLE PATIENT.INFO (
        PNumber DEC(9,0) NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1000, INCREMENT BY 1),
        PLastName CHAR(20) CCSID 37 NOT NULL DEFAULT '' ,
        PFirstName CHAR(20) CCSID 37 NOT NULL DEFAULT '' ,
        PMiddleName CHAR(20) CCSID 37 NOT NULL DEFAULT '' ,
        PAddress1 CHAR(30) CCSID 37 NOT NULL DEFAULT '' ,
        PAddress2 CHAR(30) CCSID 37 NOT NULL DEFAULT '' ,
        PCity CHAR(20) CCSID 37 NOT NULL DEFAULT '' ,
        PCountry CHAR(3) CCSID 37 NOT NULL DEFAULT '' ,
        PState CHAR(2) CCSID 37 NOT NULL DEFAULT '' ,
        PZip CHAR(9) CCSID 37 NOT NULL DEFAULT '' ,
        PPhone CHAR(10) CCSID 37 NOT NULL DEFAULT '' ,
        PPhoneType CHAR(1) CCSID 37 NOT NULL DEFAULT '' ,
        PPhoneExt CHAR(5) CCSID 37 NOT NULL DEFAULT '' ,
        PSocialNumber DECIMAL(9, 0) NOT NULL DEFAULT 0 UNIQUE,
        PEthinicity CHAR(15) CCSID 37 NOT NULL DEFAULT '' ,
        PGender CHAR(1) CCSID 37 NOT NULL DEFAULT '' ,
        PInsurance1 CHAR(2) CCSID 37 NOT NULL DEFAULT '' ,
        PInsurance2 CHAR(2) CCSID 37 NOT NULL DEFAULT '' ,
        PInsurance3 CHAR(2) CCSID 37 NOT NULL DEFAULT '' ,
        PInsurance4 CHAR(2) CCSID 37 NOT NULL DEFAULT '' ,
        PMartialStatus CHAR(1) CCSID 37 NOT NULL DEFAULT '' ,
        PSpouseName CHAR(45) CCSID 37 NOT NULL DEFAULT '' ,
        PDateofBirth CHAR(10) NOT NULL,
        CONSTRAINT PATIENT.KEYS PRIMARY KEY( PNumber,PSocialNumber ) )

        RCDFMT INFO;

LABEL ON TABLE PATIENT.INFO
        IS 'Patient Master File';

LABEL ON COLUMN PATIENT.INFO
( PNumber IS 'PATIENT NUMBER' ,
        PLastName IS 'LAST NAME' ,
        PFirstName IS 'FIRST NAME' ,
        PMiddleName IS 'MIDDLE NAME' ,
        PAddress1 IS 'ADDRESS LINE 1' ,
        PAddress2 IS 'ADDRESS LINE 2' ,
        PCity  IS 'CITY' ,
        PCountry  IS 'COUNTRY CODE' ,
        PState  IS 'STATE' ,
        PZip  IS 'ZIP CODE' ,
        PPhone  IS 'PHONE NUMBER' ,
        PPhoneType  IS 'PHONE TYPE' ,
        PPhoneExt  IS 'TELEPHONE           EXTENSION NO' ,
        PSocialNumber  IS 'SOCIAL SECURITY NO' ,
        PEthinicity  IS 'ETHNIC' ,
        PGender  IS 'GENDER' ,
        PInsurance1  IS 'INSURANCE COVERAGE H' ,
        PInsurance2  IS 'INSURANCE COVERAGE L' ,
        PInsurance3  IS 'INSURANCE COVERAGE S' ,
        PInsurance4  IS 'INSURANCE COVERAGE X' ,
        PMartialStatus  IS 'MARITAL STATUS' ,
        PSpouseName IS 'SPOUSE NAME' ,
        PDateofBirth  IS 'BIRTH DATE' );

LABEL ON COLUMN PATIENT.INFO
( PNumber TEXT IS 'PATIENT NUMBER' ,
        PLastName TEXT IS 'LAST NAME' ,
        PFirstName TEXT IS 'FIRST NAME' ,
        PMiddleName TEXT IS 'MIDDLE NAME' ,
        PAddress1 TEXT IS 'ADDRESS LINE 1' ,
        PAddress2 TEXT IS 'ADDRESS LINE 2' ,
        PCity  TEXT IS 'CITY' ,
        PCountry  TEXT IS 'COUNTRY CODE' ,
        PState  TEXT IS 'STATE' ,
        PZip  TEXT IS 'ZIP CODE' ,
        PPhone  TEXT IS 'PHONE NUMBER' ,
        PPhoneType  TEXT IS 'PHONE TYPE' ,
        PPhoneExt  TEXT IS 'TELEPHONE EXTENSION NO' ,
        PSocialNumber  TEXT IS 'SOCIAL SECURITY NO' ,
        PEthinicity  TEXT IS 'ETHNIC' ,
        PGender  TEXT IS 'GENDER' ,
        PInsurance1  TEXT IS 'INSURANCE COVERAGE H' ,
        PInsurance2  TEXT IS 'INSURANCE COVERAGE L' ,
        PInsurance3  TEXT IS 'INSURANCE COVERAGE S' ,
        PInsurance4  TEXT IS 'INSURANCE COVERAGE X' ,
        PMartialStatus  TEXT IS 'MARITAL STATUS' ,
        PSpouseName  TEXT IS 'SPOUSE NAME' ,
    PDateofBirth  TEXT IS 'BIRTH DATE'  ) ;

ALTER TABLE PATIENT.INFO
        ADD CONSTRAINT PATIENT.SOCIAL
        CHECK( PSocialNumber >= '000000000' AND PSocialNumber <= '999999999' );

GRANT DELETE , INSERT , SELECT , UPDATE
ON PATIENT.INFO TO PUBLIC ;

GRANT ALTER , DELETE , INDEX , INSERT , REFERENCES , SELECT , UPDATE
ON PATIENT.INFO TO CECUSER WITH GRANT OPTION ;

insert into patient.info values(DEFAULT,'Doe','John','Ham','1234 North Road','','Las Vegas','USA','NV',89105,8889991234,'W',234,111224444,'White','M','UH','','','','M','Jane Doe','1975-08-01');
insert into patient.info values(DEFAULT,'Doe','Jane','Cindy','1234 North Road','','Las Vegas','USA','NV',89105,8889995648,'W',234,145225844,'White','W','UH','','','','M','John Doe','1977-09-01');
insert into patient.info values(DEFAULT,'Song','John','Tim','684 North Shore','','Las Vegas','USA','NV',89105,5786985251,'W',412,333226666,'White','M','UH','','','','','','1985-08-01');
insert into patient.info values(DEFAULT,'Legg','Peter','','123 One Way','','Las Vegas','USA','NV',89105,5786985251,'W',412,432242466,'White','M','UH','','','','','','1995-08-01');

END;
