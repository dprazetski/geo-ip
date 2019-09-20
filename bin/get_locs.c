// to build: gcc -g -o get_locs get_locs.c -lnsl
// to build: gcc -g -o get_locs get_locs.c -lsocket -lnsl
#include <stdio.h>
#include <string.h>
#include <stddef.h>
#include <stdlib.h>

#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

/*
 LOCID       NOT NULL NUMBER
 COUNTRY              VARCHAR2(50)
 REGION               VARCHAR2(50)
 CITY                 VARCHAR2(50)
 POSTALCODE           VARCHAR2(20)
 LATITUDE             VARCHAR2(20)
 LONGITUDE            VARCHAR2(20)
 METROCODE            NUMBER
 AREACODE             NUMBER
*/

typedef struct locdata {
 char locid[10];
 char country[51];
 char region[51];
 char city[51];
 char postalcode[21];
 char latitude[21];
 char longitude[20];
 char metrocode[10];
 char areacode[10];
} LOCDATA;

// LMC Feb 7, 2011 #define MAX_LOCS 400000
#define MAX_LOCS 1500000
LOCDATA locs[MAX_LOCS+1];

main(int argc, char **argv)
{
     char string[1000];
     char tstring[1000];
     const char delimiters[] = "|";
     char *t1, *t2, *t3, *t4, *t5, *cp, *t6, *t7, *t8, *t9;
     char tok1[100];
     char tok2[100];
     char tok3[100];
     char tok4[100];
     char tok5[100];
     char tok6[100];
     char tok7[100];
     char tok8[100];
     char tok9[100];
     char locid[10];
     char country[51];
     char region[51];
     char city[51];
     char postalcode[21];
     char latitude[21];
     char longitude[20];
     char metrocode[10];
     char areacode[10];
     char sip[20];
     char eip[20];
     FILE *ipfp, *locfp, *outfp;
     long long_address = 0L;
     struct in_addr start_addr, end_addr;
     char *start_dot_ip = NULL;
     char *end_dot_ip = NULL;
     long idx=0L, ctr=0L;

        if (argc != 4) {
                printf ("Usage: %s location.out tmp_ip_data.out ip_data.out\n", argv[0]);
                exit(-1);
        }

  printf("argv[1]=%s\n", argv[1]);

  if (!(locfp = fopen(argv[1],"r"))) {
    printf("Unable to open %s\n", argv[1]);
    exit(-1);
  }
  if (!(ipfp = fopen(argv[2],"r"))) {
    printf("Unable to open %s\n", argv[2]);
    exit(-1);
  }
  if (!(outfp = fopen(argv[3],"w"))) {
    printf("Unable to open %s\n", argv[3]);
    exit(-1);
  }
  while( fgets(tstring, 1000, locfp) != NULL)
  {
    ctr++;
    memset(&tok1[0], 0, 100);
    memset(&tok2[0], 0, 100);
    memset(&tok3[0], 0, 100);
    memset(&tok4[0], 0, 100);
    memset(&tok5[0], 0, 100);
    strcpy(string, tstring);
    t1 = (char *) strtok (string, delimiters);
    strcpy(locid, t1);
    idx=atol(locid);
    if (idx >= MAX_LOCS) {
      printf("too many locations (%d) > %d.  Ignoring ...\n", ctr, MAX_LOCS);
      continue;
    }
    if ((idx & 50000) == 0) {
      printf(".");
    }
    //printf("idx=%ld\n", idx);
    strcpy(locs[idx].locid, locid);
    t2 = (char *) strtok (NULL, delimiters);
    strcpy(locs[idx].country, t2);
    t3 = (char *) strtok (NULL, delimiters);
    strcpy(locs[idx].region, t3);
    t4 = (char *) strtok (NULL, delimiters);
    strcpy(locs[idx].city, t4);
    t5 = (char *) strtok (NULL, delimiters);
    strcpy(locs[idx].postalcode, t5);
    t6 = (char *) strtok (NULL, delimiters);
    strcpy(locs[idx].latitude, t6);
    t7 = (char *) strtok (NULL, delimiters);
    strcpy(locs[idx].longitude, t7);
    t8 = (char *) strtok (NULL, delimiters);
    strcpy(locs[idx].metrocode, t8);
    t9 = (char *) strtok (NULL, delimiters);
    strcpy(locs[idx].areacode, t9);
  }
  printf("\n\nread in %ld locations\n", ctr);
  fclose(locfp);

  while( fgets(tstring, 1000, ipfp) != NULL)
  {
    memset(&tok1[0], 0, 100);
    memset(&tok2[0], 0, 100);
    memset(&tok3[0], 0, 100);
    memset(&tok4[0], 0, 100);
    memset(&tok5[0], 0, 100);
    memset(&sip[0], 0, 20);
    memset(&eip[0], 0, 20);
    strcpy(string, tstring);
    t1 = t2 = t3 = t4 = t5 = NULL;
    t1 = (char *) strtok (string, delimiters);
    strcpy(tok1, t1);
    t2 = (char *) strtok (NULL, delimiters);
    strcpy(tok2, t2);
    t3 = (char *) strtok (NULL, delimiters);
    if (*t3 != '\0') strcpy(tok3, t3);
    t4 = (char *) strtok (NULL, delimiters);
    if (*t4 != '\0') strcpy(tok4, t4);
    t5 = (char *) strtok (NULL, delimiters);
    if (*t5 != '\0') strcpy(tok5, t5);
    start_addr.s_addr = atol(tok1);
    start_dot_ip = inet_ntoa(start_addr);
    strcpy(sip, start_dot_ip);
    end_addr.s_addr = atol(tok2);
    end_dot_ip = inet_ntoa(end_addr);
    strcpy(eip, end_dot_ip);
    if (strcmp(tok4, "NULL") == 0) tok4[0] = '\0';
    if (strcmp(tok5, "NULL") == 0) tok5[0] = '\0';
    idx=atol(tok3);
    fprintf(outfp,"%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|\n", sip, tok1, eip, tok2,
    (strcmp(locs[idx].locid, "NULL") == 0) ? "" : locs[idx].locid,
    (strcmp(locs[idx].country, "NULL") == 0) ? "" : locs[idx].country,
    (strcmp(locs[idx].region, "NULL") == 0) ? "" : locs[idx].region,
    (strcmp(locs[idx].city,  "NULL") == 0) ? "" : locs[idx].city,
    (strcmp(locs[idx].postalcode,  "NULL") == 0) ? "" : locs[idx].postalcode,
    (strcmp(locs[idx].latitude,  "NULL") == 0) ? "" : locs[idx].latitude,
    (strcmp(locs[idx].longitude,  "NULL") == 0) ? "" : locs[idx].longitude,
    (strcmp(locs[idx].metrocode,  "NULL") == 0) ? "" : locs[idx].metrocode,
    (strcmp(locs[idx].areacode,  "NULL") == 0) ? "" : locs[idx].areacode,
    tok4,tok5);
    //free(cp);
  }
  fclose(ipfp);
  fclose(outfp);
}
