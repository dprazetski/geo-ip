DECLARE
  tempor VARCHAR2(32);
  active VARCHAR2(32);
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
  EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM geoip_cityisporg FOR '||tempor;
  EXECUTE IMMEDIATE 'CREATE OR REPLACE SYNONYM geoip_cityisporg_for_load FOR '||active;
END;
/
EXIT;
