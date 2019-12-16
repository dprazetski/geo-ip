SET SERVEROUTPUT ON
DECLARE
  tempor VARCHAR2(32);
  active VARCHAR2(32);
  tempor_count NUMBER := 0;
  active_count NUMBER := 0;
BEGIN
  SELECT LOWER(table_name)
    INTO tempor
    FROM all_synonyms
   WHERE owner = 'GEOIP'
     AND synonym_name = 'GEOIP_CITYISPORG_FOR_LOAD';
  SELECT LOWER(table_name)
    INTO active
    FROM all_synonyms
   WHERE owner = 'GEOIP'
     AND synonym_name = 'GEOIP_CITYISPORG';
  SELECT COUNT(1)
    INTO tempor_count
    FROM geoip_cityisporg_for_load;
  SELECT COUNT(1)
    INTO active_count
    FROM geoip_cityisporg;
  IF (active_count - tempor_count) / active_count * 100 <= 5 THEN
    EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM geoip_cityisporg FOR '||tempor;
    EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM geoip_cityisporg_for_load FOR '||active;
    dbms_output.put_line('Synonyms have been switched successfully! The active table now is '||tempor);
  ELSE
    dbms_output.put_line('Synonyms were not switched... Too little data');
  END IF;
END;
/
EXIT;

