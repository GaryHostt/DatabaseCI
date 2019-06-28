

--------------------------------------------------------
--  Script to generate ALL DDLs
--------------------------------------------------------

SELECT DBMS_METADATA.GET_DDL('TABLE', TABLE_NAME) FROM USER_TABLES;

-----for one table/item: follow below syntax
---select dbms_metadata.get_ddl('TABLE', 'YOUR_TABLE_NAME')
---from dual;
-----
SELECT DBMS_METADATA.GET_DDL('INDEX', INDEX_NAME) FROM USER_INDEXES WHERE INDEX_TYPE ='NORMAL';
SELECT DBMS_METADATA.GET_DDL('VIEW', VIEW_NAME) FROM USER_VIEWS;
SELECT QUERY FROM USER_MVIEWS;
SELECT DBMS_METADATA.GET_DDL('FUNCTION', OBJECT_NAME) FROM USER_PROCEDURES WHERE OBJECT_TYPE = 'FUNCTION';
SELECT OBJECT_TYPE, OBJECT_NAME,DBMS_METADATA.GET_DDL(OBJECT_TYPE, OBJECT_NAME, OWNER)
  FROM ALL_OBJECTS 
  WHERE (OWNER = 'XYZ') AND OBJECT_TYPE NOT IN('LOB','MATERIALIZED VIEW', 'TABLE PARTITION') ORDER BY OBJECT_TYPE, OBJECT_NAME;

  --------------------------------------------------------
--  Script to generate all single DDLs
--------------------------------------------------------
SELECT DBMS_METADATA.GET_DDL('TABLE', 'HUBEVENTCHECKIN') FROM USER_TABLES;
SELECT DBMS_METADATA.GET_DDL('TABLE', 'HUBEVENTS') FROM USER_TABLES;
SELECT DBMS_METADATA.GET_DDL('TABLE', 'HUBHUBSTERS') FROM USER_TABLES;
SELECT DBMS_METADATA.GET_DDL('TABLE', 'HUBMANAGERS') FROM USER_TABLES;
SELECT DBMS_METADATA.GET_DDL('TABLE', 'HUBPILLARS') FROM USER_TABLES;
SELECT DBMS_METADATA.GET_DDL('TABLE', 'HUBROLES') FROM USER_TABLES;
SELECT DBMS_METADATA.GET_DDL('TABLE', 'HUBROOMS') FROM USER_TABLES;

--------------------------------------------------------
--  DDL for Table HUBEVENTCHECKIN
--------------------------------------------------------

  CREATE TABLE "ADMIN"."HUBEVENTCHECKIN" 
   (	"EVENTID" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"HUBSTERID" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
	"EMAIL" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;

--------------------------------------------------------
--  DDL for Table HUBEVENTS
--------------------------------------------------------

  CREATE TABLE "ADMIN"."HUBEVENTS" 
   (  "EVENTID" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
  "TITLE" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
  "DATEOFEVENT" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
  "INSIDEOROUTSIDE" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;

--------------------------------------------------------
--  DDL for Table HUBHUBSTERS
--------------------------------------------------------

  CREATE TABLE "ADMIN"."HUBHUBSTERS" 
   (  "HUBSTERID" NUMBER(38,0), 
  "FIRSTNAME" VARCHAR2(26 BYTE) COLLATE "USING_NLS_COMP", 
  "LASTNAME" VARCHAR2(26 BYTE) COLLATE "USING_NLS_COMP", 
  "PILLARID" NUMBER(38,0), 
  "MANAGERID" NUMBER(38,0), 
  "SEAT" NUMBER(38,0), 
  "PHONE" NUMBER(38,0), 
  "EMAIL" VARCHAR2(500 BYTE) COLLATE "USING_NLS_COMP", 
  "NEIGHBORHOOD" VARCHAR2(26 BYTE) COLLATE "USING_NLS_COMP", 
  "BIRTHDAY" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
  "ORACLEEVENTOPT" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
  "OUTSIDEEVENTOPT" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
  "HOMETOWN" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
  "PICTURE" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Trigger HUBHUBSTERS_TRG1
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADMIN"."HUBHUBSTERS_TRG1" 
BEFORE INSERT ON HUBHUBSTERS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.HUBSTERID IS NULL THEN
      SELECT HUBHUBSTERS_SEQ1.NEXTVAL INTO :NEW.HUBSTERID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ADMIN"."HUBHUBSTERS_TRG1" ENABLE;
--------------------------------------------------------
--  DDL for Trigger HUBHUBSTERS_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADMIN"."HUBHUBSTERS_TRG" 
BEFORE INSERT ON HUBHUBSTERS 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    NULL;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ADMIN"."HUBHUBSTERS_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table HUBHUBSTERS
--------------------------------------------------------

  ALTER TABLE "ADMIN"."HUBHUBSTERS" MODIFY ("HUBSTERID" NOT NULL ENABLE);

--------------------------------------------------------
--  DDL for Table HUBMANAGERS
--------------------------------------------------------

  CREATE TABLE "ADMIN"."HUBMANAGERS" 
   (  "MANAGERID" NUMBER(38,0), 
  "FIRSTNAME" VARCHAR2(26 BYTE) COLLATE "USING_NLS_COMP", 
  "LASTNAME" VARCHAR2(26 BYTE) COLLATE "USING_NLS_COMP", 
  "OFFICE" NUMBER(38,0), 
  "PHONE" VARCHAR2(26 BYTE) COLLATE "USING_NLS_COMP", 
  "EMAIL" VARCHAR2(26 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;

--------------------------------------------------------
--  DDL for Table HUBPILLARS
--------------------------------------------------------

  CREATE TABLE "ADMIN"."HUBPILLARS" 
   (  "PILLARID" NUMBER(38,0) DEFAULT "ADMIN"."HUBPILLARS_SEQUENCE"."NEXTVAL", 
  "PILLARNAME" VARCHAR2(255 BYTE) COLLATE "USING_NLS_COMP", 
  "MANAGERID" NUMBER(38,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Index HUBPILLARS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADMIN"."HUBPILLARS_PK" ON "ADMIN"."HUBPILLARS" ("PILLARID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
--------------------------------------------------------
--  DDL for Trigger PILLARS_ON_INSERTS
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER "ADMIN"."PILLARS_ON_INSERTS" 
  BEFORE INSERT ON HUBPILLARS
  FOR EACH ROW
BEGIN
  SELECT HUBPILLARS_sequence.nextval
  INTO :new.pillarid
  FROM dual;
END;
/
ALTER TRIGGER "ADMIN"."PILLARS_ON_INSERTS" ENABLE;
--------------------------------------------------------
--  Constraints for Table HUBPILLARS
--------------------------------------------------------

  ALTER TABLE "ADMIN"."HUBPILLARS" MODIFY ("PILLARID" NOT NULL ENABLE);
  ALTER TABLE "ADMIN"."HUBPILLARS" ADD CONSTRAINT "HUBPILLARS_PK" PRIMARY KEY ("PILLARID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA"  ENABLE;

--------------------------------------------------------
--  DDL for Table HUBROOMS
--------------------------------------------------------

  CREATE TABLE "ADMIN"."HUBROOMS" 
   (  "HUBROOMNUMBER" NUMBER(*,0), 
  "CAPACITY" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;

--------------------------------------------------------
--  DDL for Procedure CREATEEVENT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."CREATEEVENT" (
    p_EventID in HUBEvents.EventID%type default null 
,p_Title in HUBEvents.Title%type default null
,p_DateOfEvent in HUBEvents.DateOfEvent%type default null
,p_InsideOrOutside in HUBEvents.InsideOrOutside%type default null

) IS
BEGIN
    INSERT INTO HUBEVENTS ("EVENTID", "TITLE", "DATEOFEVENT", "INSIDEOROUTSIDE")
    VALUES (p_EventID, p_Title, p_DateOfEvent, p_InsideOrOutside);

    Commit;

End;

/

--------------------------------------------------------
--  DDL for Procedure EVENTCHECKIN
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."EVENTCHECKIN" (
    p_EventID in HUBEventCheckin.EventID%type default null 
,p_Email in HUBEventCheckin.Email%type default null

) IS
BEGIN
    INSERT INTO HUBEVENTCHECKIN ("EVENTID", "EMAIL")
    VALUES (p_EventID, p_Email);

    Commit;

End;

/

--------------------------------------------------------
--  DDL for Procedure INSERTHUBSTER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."INSERTHUBSTER" (
    p_FirstName in HUBHUBSTERS.FIRSTNAME%type default null 
,p_LastName in HUBHUBSTERS.LASTNAME%type default null
,p_PillarID in HUBHUBSTERS.PILLARID%type default null 
,p_ManagerID in HUBHUBSTERS.MANAGERID%type default null 
,p_Seat in HUBHUBSTERS.SEAT%type default null 
,p_Phone in HUBHUBSTERS.PHONE%type default null 
,p_Neighborhood in HUBHUBSTERS.NEIGHBORHOOD%type default null 
,p_Birthday in HUBHUBSTERS.BIRTHDAY%type default null 
,p_Email in HUBHUBSTERS.EMAIL%type default null
,p_OracleEventOpt in HUBHUBSTERS.ORACLEEVENTOPT%type default null
,p_OutsideEventOpt in HUBHUBSTERS.OUTSIDEEVENTOPT%type default null
,p_hometown in HUBHUBSTERS.HOMETOWN%type default null
,p_picture in HUBHUBSTERS.PICTURE%type default null
) IS
BEGIN
    INSERT INTO HUBHUBSTERS ("FIRSTNAME", "LASTNAME", "PILLARID", "MANAGERID", "SEAT", "PHONE", "NEIGHBORHOOD", "BIRTHDAY", "EMAIL", "ORACLEEVENTOPT","OUTSIDEEVENTOPT", "HOMETOWN", "PICTURE")
    VALUES (p_FirstName, p_LastName, p_PillarID, p_ManagerID, p_Seat, p_Phone, p_Neighborhood, p_Birthday, p_Email,p_OracleEventOpt, p_OutsideEventOpt, p_hometown, p_picture);

    Commit;

End;

/

--------------------------------------------------------
--  DDL for Procedure INSERTPILLAR
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."INSERTPILLAR" (
    p_MANAGERID in HUBPILLARS.MANAGERID%type default null 
,p_PILLARNAME in HUBPILLARS.PILLARNAME%type default null
) IS
BEGIN
    INSERT INTO HUBPILLARS ("MANAGERID","PILLARNAME")
    VALUES (p_ManagerID, p_PillarName);

    Commit;

End;

/

--------------------------------------------------------
--  DDL for Procedure UPDATEHUBSTER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."UPDATEHUBSTER" (
p_HubsterID in HUBHUBSTERS.HUBSTERID%type
,p_FirstName in HUBHUBSTERS.FIRSTNAME%type default null 
,p_LastName in HUBHUBSTERS.LASTNAME%type default null
,p_PillarID in HUBHUBSTERS.PILLARID%type default null 
,p_ManagerID in HUBHUBSTERS.MANAGERID%type default null 
,p_Seat in HUBHUBSTERS.SEAT%type default null 
,p_Phone in HUBHUBSTERS.PHONE%type default null 
,p_Neighborhood in HUBHUBSTERS.NEIGHBORHOOD%type default null 
,p_Birthday in HUBHUBSTERS.BIRTHDAY%type default null 
,p_Email in HUBHUBSTERS.EMAIL%type default null 
,p_OracleEventOpt in HUBHUBSTERS.ORACLEEVENTOPT%type default null
,p_OutsideEventOpt in HUBHUBSTERS.OUTSIDEEVENTOPT%type default null
,p_hometown in HUBHUBSTERS.HOMETOWN%type default null
,p_picture in HUBHUBSTERS.PICTURE%type default null
) IS
BEGIN
    UPDATE HUBHUBSTERS set
    FIRSTNAME = CASE WHEN p_FirstName is null then Firstname else p_FirstName END,
    LASTNAME = CASE WHEN p_LastName is null then LastName else p_LastName END,
    PillarID = CASE WHEN p_PillarID is null then PillarID else p_PillarID END,
    ManagerID = CASE WHEN p_ManagerID is null then ManagerID else p_ManagerID END,
    Seat = CASE WHEN p_Seat is null then Seat else p_Seat END,
    Phone = CASE WHEN p_Phone is null then Phone else p_Phone END,
    Neighborhood = CASE WHEN p_Neighborhood is null then Neighborhood else p_Neighborhood END,
    Email = CASE WHEN p_Email is null then Email else p_Email END,
    Birthday = CASE WHEN p_Birthday is null then Birthday else p_Birthday END,
    OracleEventOpt = CASE WHEN p_OracleEventOpt is null then OracleEventOpt else p_OracleEventOpt END,
    OutsideEventOpt = CASE WHEN p_OutsideEventOpt is null then OutsideEventOpt else p_OutsideEventOpt END,
    hometown = CASE WHEN p_hometown is null then HOMETOWN else p_hometown END,
    picture = CASE WHEN p_picture is null then picture else p_picture END
    where HUBSTERID = p_HubsterID;
    Commit;
End;

/

--------------------------------------------------------
--  DDL for Procedure UPDATEMANAGER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "ADMIN"."UPDATEMANAGER" (
p_FirstName in HUBMANAGERS.FIRSTNAME%type default null 
,p_LastName in HUBMANAGERS.LASTNAME%type default null
,p_ManagerID in HUBMANAGERS.MANAGERID%type default null 
,p_Office in HUBMANAGERS.OFFICE%type default null 
,p_Phone in HUBMANAGERS.PHONE%type default null 
,p_Email in HUBMANAGERS.EMAIL%type default null 
) IS
BEGIN
    UPDATE HUBMANAGERS set
    FIRSTNAME = CASE WHEN p_FirstName is null then Firstname else p_FirstName END,
    LASTNAME = CASE WHEN p_LastName is null then LastName else p_LastName END,
    ManagerID = CASE WHEN p_ManagerID is null then ManagerID else p_ManagerID END,
    Office = CASE WHEN p_Office is null then Office else p_Office END,
    Phone = CASE WHEN p_Phone is null then Phone else p_Phone END,
    Email = CASE WHEN p_Email is null then Email else p_Email END
    where MANAGERID = p_ManagerID;
    Commit;
End;

/
