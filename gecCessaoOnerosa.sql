--==============================================================
-- DBMS name:      IBM DB2 Version 11 for z/OS
-- Created on:     20/11/2025 12:45:59
--==============================================================


drop view GEC.GECVW351_MOVIMENTO;

create lob tablespace GEC1L328
IN GECDB001
    USING STOGROUP SGDDB201
    PRIQTY 9600 SECQTY 9600
    ERASE  NO
    GBPCACHE CHANGED
    NOT LOGGED
    DSSIZE 4 G
    BUFFERPOOL BP10
    LOCKSIZE LOB
    LOCKMAX 1
    CLOSE YES
    DEFINE YES;

create tablespace GECTS328
  IN GECDB001
    USING STOGROUP SGDGEC00
    PRIQTY 4800 SECQTY 4800
    ERASE  NO
    FREEPAGE 0 PCTFREE 0 
    GBPCACHE CHANGED
    TRACKMOD YES
    MAXPARTITIONS 2
    LOGGED
    DSSIZE 4 G
    SEGSIZE 32
    BUFFERPOOL BP10
    LOCKSIZE ANY
    LOCKMAX SYSTEM
    CLOSE YES
    COMPRESS NO
    CCSID      EBCDIC
    DEFINE YES
    MAXROWS 255;

--==============================================================
-- User: APC
--==============================================================
--==============================================================
-- User: GEC
--==============================================================
--==============================================================
-- User: ICO
--==============================================================
--==============================================================
-- Table: APCTB712_MOVIMENTO
--==============================================================
create table APC.APCTB712_MOVIMENTO (
   NU_PARTICAO          SMALLINT              
      not null,
   NU_SISTEMA           SMALLINT              
      not null,
   NU_PRODUTO           SMALLINT              
      not null,
   NU_UNIDADE_CNCSA     SMALLINT              
      not null,
   NU_CONTRATO          CHAR(20)              
      not null,
   AA_MOVIMENTO         SMALLINT              
      not null,
   MM_MOVIMENTO         SMALLINT              
      not null,
   IC_PESSOA            CHAR(1),
   NU_CPF_CNPJ          DECIMAL(14,0),
   DT_PROX_VCTO         DATE,
   IC_CONTAMINA         CHAR(1),
   IC_GARANTIA_REAL     CHAR(1),
   IC_GARANTIA_EXCEP    CHAR(1),
   IC_INTER_BC          CHAR(1),
   IC_INTER_BC_VEN      CHAR(1),
   IC_INTER_BC_VIN      CHAR(1),
   IC_INTER_PREJ        CHAR(1),
   IC_INTER_PROVIS      CHAR(1),
   IC_BLINDAGEM         CHAR(1),
   NU_GRUPO_PROVIS      SMALLINT,
   NU_TP_SIT_CONT_ANT   SMALLINT,
   NU_TP_EVENTO_BC      SMALLINT,
   NU_TP_EVENTO_PREJ    SMALLINT,
   NU_EVENTO_BC         INTEGER,
   NU_EVENTO_BC_VEN     INTEGER,
   NU_EVENTO_BC_VIN     INTEGER,
   NU_EVENTO_PREJ       INTEGER,
   NU_EVENTO_PROVIS     INTEGER,
   NU_TPO_DSMPO_OPRCO   SMALLINT               default 0,
   NU_ENTIDADE_CONTAB   SMALLINT,
   NU_FAIXA_VR          SMALLINT,
   NU_MODALIDADE        SMALLINT,
   NU_SUB_MODALIDADE    SMALLINT,
   TX_EFETIVA_ANUAL     DECIMAL(11,7),
   PZ_REMANESCENTE_DD   INTEGER               
      not null,
   PZ_ATRASO_DD         INTEGER               
      not null,
   CO_AVALIACAO_CLI     DECIMAL(10,0),
   DT_CONC_CLIENTE      DATE,
   SG_CONC_CLIENTE      CHAR(3),
   NU_SIT_CONC_CLIENTE  SMALLINT,
   CO_AVALIACAO         DECIMAL(10,0)         
      not null,
   DT_CONC_AVAL         DATE,
   SG_CONC_AVAL         CHAR(3),
   NU_SIT_CONC_AVAL     SMALLINT,
   SG_CONC_AVAL_ANT     CHAR(3),
   SG_CONC_PROV_ANT     CHAR(3),
   SG_CONC_CONTRATO     CHAR(3),
   SG_CONC_CONTAMINADO  CHAR(3),
   SG_CONC_ARRASTO      CHAR(3),
   SG_CONC_PROVIS       CHAR(3),
   VR_DIVIDA_VENCIDA    DECIMAL(15,2)         
      not null,
   VR_DIVIDA_VINCENDA   DECIMAL(15,2)         
      not null,
   VR_PRESTACAO         DECIMAL(15,2)         
      not null,
   VR_BASE_CALCULO      DECIMAL(15,2),
   VR_PROVISIONADO      DECIMAL(15,2),
   VR_PROVISAO_ANT      DECIMAL(15,2),
   VR_BASE_CP           DECIMAL(15,2),
   VR_BASE_LP           DECIMAL(15,2),
   VR_PROVISAO_CP       DECIMAL(15,2),
   VR_PROVISAO_LP       DECIMAL(15,2),
   CO_USERID            CHAR(7),
   NU_TP_SIT_CONTRATO   SMALLINT,
   IC_CLIENTE           CHAR(1),
   IC_TRANSF_COMPE      CHAR(1),
   IC_DIVIDA            CHAR(1),
   IC_PESSOA_CNGLO      SMALLINT,
   NU_CNPJ_CNGLO        DECIMAL(14,0),
   SG_CONCEITO_CNGLO    CHAR(3),
   DT_AVALIACAO_CNGLO   DATE,
   VR_SALDO_DEVEDOR     DECIMAL(15,2),
   NU_TIPO_CONTRATO     SMALLINT,
   NU_EVENTO_REVERSAO   INTEGER,
   VR_PROVISAO          DECIMAL(15,2),
   VR_REVERSAO          DECIMAL(15,2),
   IC_CONGLOMERADO      CHAR(1),
   VR_RENDA_VENCIDA     DECIMAL(15,2)         
      not null default 0,
   VR_RENDA_VINCENDA    DECIMAL(15,2)         
      not null default 0,
   CO_AVALIACAO_CONGLOMERADO DECIMAL(10,0),
   NU_REGRA_PREJUIZO    SMALLINT,
   NU_PORTE_CLIENTE     SMALLINT,
   NU_CARACTERISTICA_PRINCIPAL SMALLINT,
   NU_CETIP             SMALLINT,
   VR_RESIDUAL          DECIMAL(17,2),
   DT_PRIMEIRA_PRSTO_NAO_PGA DATE,
   SG_CONCEITO_CLIENTE_PURO CHAR(3),
   IC_TOMADOR_PROCESSO_JUDICIAL CHAR(1),
   CO_ATIVO_PROBLEMATICO DECIMAL(10,0),
   SG_CONCEITO_CLIENTE_RISCO CHAR(3),
   IC_CONTAMINACAO_PRTCE_CNGLO DECIMAL(1,0),
   constraint APCPK712 primary key (NU_PARTICAO, NU_SISTEMA, NU_PRODUTO,
 NU_UNIDADE_CNCSA, NU_CONTRATO)  
);

--==============================================================
-- Index: APC1I712
--==============================================================
create unique index APC.APC1I712 on APC.APCTB712_MOVIMENTO (
   NU_PARTICAO          DESC,
   NU_SISTEMA           DESC,
   NU_PRODUTO           DESC,
   NU_UNIDADE_CNCSA     DESC,
   NU_CONTRATO          DESC
);

--==============================================================
-- Index: APC2I712
--==============================================================
create index APC.APC2I712 on APC.APCTB712_MOVIMENTO (
   NU_SISTEMA           DESC,
   NU_PRODUTO           DESC,
   NU_UNIDADE_CNCSA     DESC,
   NU_CONTRATO          DESC,
   SG_CONC_CONTRATO     DESC
);

--==============================================================
-- Index: APC3I712
--==============================================================
create index APC.APC3I712 on APC.APCTB712_MOVIMENTO (
   NU_PARTICAO          ASC,
   IC_PESSOA            DESC,
   NU_CPF_CNPJ          DESC
);

--==============================================================
-- Index: APC4I712
--==============================================================
create index APC.APC4I712 on APC.APCTB712_MOVIMENTO (
   NU_PARTICAO          DESC,
   NU_ENTIDADE_CONTAB   DESC,
   NU_SISTEMA           DESC
);

--==============================================================
-- Table: GECTB328_ARQVO_ENVDO_DSFZMNTO
--==============================================================
create table GEC.GECTB328_ARQVO_ENVDO_DSFZMNTO (
   NU_ARQUIVO_ENVDO_DSFZMNTO DECIMAL(7)            
      not null,
   NU_CESSAO_CREDITO_DESFEITO INTEGER               
      not null,
   DE_CONTEUDO_ARQVO_DSFZMNTO CLOB(1000000000)      
      not null,
   DT_ARQUIVO_ANEXADO   DATE                  
      not null,
   constraint GECPK328 primary key (NU_ARQUIVO_ENVDO_DSFZMNTO, 
NU_CESSAO_CREDITO_DESFEITO)  
)
 in GECDB003.GECTS328;

CREATE AUXILIARY TABLE GEC.GECTB328_LOB_1            
  IN GECDB003.GEC1L328                               
  STORES GEC.GECTB328_ARQVO_ENVDO_DSFZMNTO           
       COLUMN DE_CONTEUDO_ARQVO_DSFZMNTO PART 1;     

CREATE UNIQUE INDEX GEC.GEC1X328                
  ON GEC.GECTB328_LOB_1                         
  PADDED                                        
  USING STOGROUP SGDDB201                       
  PRIQTY 48000 SECQTY 48000                     
  ERASE  NO                                     
  FREEPAGE 0 PCTFREE 0                          
  GBPCACHE CHANGED                              
  COMPRESS NO                                   
  BUFFERPOOL BP11                               
  CLOSE NO                                      
  COPY YES                                      
  DEFINE YES                                    
  PIECESIZE 4 G;                                

label on table GEC.GECTB328_ARQVO_ENVDO_DSFZMNTO is 
'ARQUIVO_ENVIADO_DESFAZIMENTO';
label on column 
GEC.GECTB328_ARQVO_ENVDO_DSFZMNTO.NU_ARQUIVO_ENVDO_DSFZMNTO is 
'NU_ARQUIVO_ENVIADO_DESFAZIMENTO';
label on column 
GEC.GECTB328_ARQVO_ENVDO_DSFZMNTO.DE_CONTEUDO_ARQVO_DSFZMNTO is 
'DE_CONTEUDO_ARQUIVO_ENVIADO_DESFAZIMENTO';
--==============================================================
-- Index: GEC1I328
--==============================================================
create unique index GEC.GEC1I328 on GEC.GECTB328_ARQVO_ENVDO_DSFZMNTO (

   NU_ARQUIVO_ENVDO_DSFZMNTO ASC,
   NU_CESSAO_CREDITO_DESFEITO ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480      
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    CLUSTER                    
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB340_EVENTO_CESSAO
--==============================================================
create table GEC.GECTB340_EVENTO_CESSAO (
   NU_EVENTO_CESSAO     DECIMAL(18)           
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       no cache
           no cycle
       maxvalue 999999999999999999
       minvalue 1
      ),
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_ETAPA_BASE_ELEGIVEL DECIMAL(3,0)          
      not null,
   NU_TIPO_EVENTO_CESSAO SMALLINT,
   DT_EVENTO_CESSAO     TIMESTAMP             
      not null,
   CO_MATRICULA_USUARIO CHAR(8)               
      not null,
   constraint GECPK340 primary key (NU_EVENTO_CESSAO)  
)
 in GECDB003.GECTS340;

label on table GEC.GECTB340_EVENTO_CESSAO is 'EVENTO_CESSAO';

--==============================================================
-- Index: GEC1I340
--==============================================================
create unique index GEC.GEC1I340 on GEC.GECTB340_EVENTO_CESSAO (
   NU_EVENTO_CESSAO     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Index: GEC2I340
--==============================================================
create index GEC.GEC2I340 on GEC.GECTB340_EVENTO_CESSAO (
   NU_BASE_ELEGIVEL     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Index: GEC3I340
--==============================================================
create index GEC.GEC3I340 on GEC.GECTB340_EVENTO_CESSAO (
   NU_BASE_ELEGIVEL     ASC,
   NU_ETAPA_BASE_ELEGIVEL ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB341_TIPO_EVENTO_CESSAO
--==============================================================
create table GEC.GECTB341_TIPO_EVENTO_CESSAO (
   NU_TIPO_EVENTO_CESSAO SMALLINT              
      not null,
   DE_TIPO_EVENTO_CESSAO VARCHAR(30)           
      not null,
   IC_TIPO_EVENTO_CESSAO SMALLINT              
      not null default 1
         constraint GEC1C341 check (IC_TIPO_EVENTO_CESSAO in (1,2,3,4,
5)),
   constraint GECPK341 primary key (NU_TIPO_EVENTO_CESSAO)  
)
 in GECDB003.GECTS341;

label on table GEC.GECTB341_TIPO_EVENTO_CESSAO is 'TIPO_EVENTO_CESSAO';


--==============================================================
-- Index: GEC1I341
--==============================================================
create unique index GEC.GEC1I341 on GEC.GECTB341_TIPO_EVENTO_CESSAO (
   NU_TIPO_EVENTO_CESSAO ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB342_EVENTO_CESSAO_FILTRO
--==============================================================
create table GEC.GECTB342_EVENTO_CESSAO_FILTRO (
   NU_EVENTO_CESSAO     DECIMAL(18)           
      not null,
   QT_CONTRATO_EXCLUIDO INTEGER               
      not null,
   VR_TOTAL_EXCLUIDO    DECIMAL(17,2)         
      not null,
   QT_CONTRATO_ATIVO    INTEGER               
      not null,
   VR_TOTAL_ATIVO       DECIMAL(17,2)         
      not null,
   constraint GECPK342 primary key (NU_EVENTO_CESSAO)  
)
 in GECDB003.GECTS342;

label on table GEC.GECTB342_EVENTO_CESSAO_FILTRO is 
'EVENTO_CESSAO_FILTRO';

--==============================================================
-- Index: GEC1I342
--==============================================================
create unique index GEC.GEC1I342 on GEC.GECTB342_EVENTO_CESSAO_FILTRO (

   NU_EVENTO_CESSAO     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB343_CRDTO_EXCLUIDO_EVENTO
--==============================================================
create table GEC.GECTB343_CRDTO_EXCLUIDO_EVENTO (
   NU_EVENTO_CESSAO     DECIMAL(18)           
      not null,
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   IC_EXCLUSAO_CONFIRMADA CHAR(1)               
      not null with default 'S'
         constraint GEC1C343 check (IC_EXCLUSAO_CONFIRMADA in ('P','S',
'N')),
   NU_SITUACAO_EXCLUSAO_CREDITO SMALLINT,
   constraint GECPK343 primary key (NU_EVENTO_CESSAO, NU_BASE_ELEGIVEL, 
NU_CREDITO)  
)
 in GECDB003.GECTS343;

label on table GEC.GECTB343_CRDTO_EXCLUIDO_EVENTO is 
'CREDITO_EXCLUIDO_EVENTO';

--==============================================================
-- Index: GEC1I343
--==============================================================
create unique index GEC.GEC1I343 on GEC.GECTB343_CRDTO_EXCLUIDO_EVENTO (

   NU_EVENTO_CESSAO     ASC,
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Index: GEC2I343
--==============================================================
create index GEC.GEC2I343 on GEC.GECTB343_CRDTO_EXCLUIDO_EVENTO (
   NU_EVENTO_CESSAO     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Index: GEC3I343
--==============================================================
create index GEC.GEC3I343 on GEC.GECTB343_CRDTO_EXCLUIDO_EVENTO (
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB344_EVENTO_ANEXAR_DCMTO
--==============================================================
create table GEC.GECTB344_EVENTO_ANEXAR_DCMTO (
   NU_EVENTO_CESSAO     DECIMAL(18)           
      not null,
   NU_TIPO_DOCUMENTO    SMALLINT              
      not null,
   NO_ARQVO_DOCUMENTO   VARCHAR(100)          
      not null,
   CO_ENDERECO_REPOSITORIO VARCHAR(100)          
      not null,
   constraint GECPK344 primary key (NU_EVENTO_CESSAO)  
)
 in GECDB003.GECTS344;

label on table GEC.GECTB344_EVENTO_ANEXAR_DCMTO is 
'EVENTO_CESSAO_ANEXAR_DOCUMENTO';
label on column GEC.GECTB344_EVENTO_ANEXAR_DCMTO.NO_ARQVO_DOCUMENTO is 
'NO_ARQUIVO_DOCUMENTO';
--==============================================================
-- Index: GEC1I344
--==============================================================
create unique index GEC.GEC1I344 on GEC.GECTB344_EVENTO_ANEXAR_DCMTO (
   NU_EVENTO_CESSAO     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB345_EVENTO_CESSAO_PRCFO
--==============================================================
create table GEC.GECTB345_EVENTO_CESSAO_PRCFO (
   NU_EVENTO_CESSAO     DECIMAL(18)           
      not null,
   NU_CNPJ_PROPONENTE   DECIMAL(14,0)         
      not null,
   IC_TIPO_OPERACAO     CHAR(1)               
      not null with default 'C'
         constraint GEC1C345 check (IC_TIPO_OPERACAO in ('C','E')),
   QT_CONTRATO_PRECIFICADO INTEGER               
      not null,
   NU_CESSAO_CREDITO    DECIMAL(7,0)          
      not null,
   PC_PROPOSTA_CESSAO   DECIMAL(17,14)        
      not null,
   VR_PROPOSTA_CESSAO   DECIMAL(17,2)         
      not null,
   constraint GECPK345 primary key (NU_EVENTO_CESSAO)  
)
 in GECDB003.GECTS345;

label on table GEC.GECTB345_EVENTO_CESSAO_PRCFO is 
'EVENTO_CESSAO_PRECIFICACAO';

--==============================================================
-- Index: GEC1I345
--==============================================================
create unique index GEC.GEC1I345 on GEC.GECTB345_EVENTO_CESSAO_PRCFO (
   NU_EVENTO_CESSAO     DESC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB346_CONTRATO_CREDITO
--==============================================================
create table GEC.GECTB346_CONTRATO_CREDITO (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   CO_CONTRATO_CREDITO  CHAR(20)              
      not null,
   NU_TIPO_CONTRATO     SMALLINT              
      not null,
   NU_TIPO_CONDICAO_CONTRATO SMALLINT              
      not null,
   NU_MODALIDADE_CONTRATO SMALLINT              
      not null,
   NU_TIPO_INDEXADOR_CONTRATO SMALLINT              
      not null,
   NU_TIPO_COBRANCA_CONTRATO SMALLINT              
      not null,
   NU_TIPO_SITUACAO     DECIMAL(3,0)          
      not null,
   NU_SITUACAO          DECIMAL(3,0)          
      not null,
   DT_CONCESSAO_CREDITO DATE                  
      not null,
   VR_CONTRATADO_OPERACAO DECIMAL(15,2)         
      not null,
   VR_SALDO_DEVEDOR     DECIMAL(15,2)         
      not null,
   QT_PARCELA_CONTRATADA SMALLINT              
      not null,
   QT_PARCELA_ABERTO    SMALLINT              
      not null,
   PC_INDEXADOR_CONTRATO DECIMAL(15,7)         
      not null,
   PC_TAXA_EFETIVA_ANUAL DECIMAL(11,7)         
      not null,
   NU_CONTA_CREDITO     DECIMAL(12),
   constraint GECPK346 primary key (NU_BASE_ELEGIVEL, NU_CREDITO)  
)
 in GECDB003.GECTS346;

label on table GEC.GECTB346_CONTRATO_CREDITO is 'CONTRATO_CREDITO';

--==============================================================
-- Index: GEC1I346
--==============================================================
create unique index GEC.GEC1I346 on GEC.GECTB346_CONTRATO_CREDITO (
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Index: GEC2I346
--==============================================================
create index GEC.GEC2I346 on GEC.GECTB346_CONTRATO_CREDITO (
   CO_CONTRATO_CREDITO  ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Index: GEC3I346
--==============================================================
create index GEC.GEC3I346 on GEC.GECTB346_CONTRATO_CREDITO (
   NU_TIPO_CONDICAO_CONTRATO ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB347_GARANTIA_CTRTO_CRDTO
--==============================================================
create table GEC.GECTB347_GARANTIA_CTRTO_CRDTO (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_TIPO_GARANTIA     SMALLINT              
      not null,
   NU_GARANTIA          SMALLINT              
      not null,
   NU_PRIORIDADE_LIQUIDEZ SMALLINT              
      not null,
   VR_GARANTIA          DECIMAL(15,2),
   PC_GARANTIA_CREDITO  DECIMAL(8,5),
   constraint GECPK347 primary key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_GARANTIA, NU_TIPO_GARANTIA)  
)
 in GECDB003.GECTS347;

label on table GEC.GECTB347_GARANTIA_CTRTO_CRDTO is 
'GARANTIA_CONTRATO_CREDITO';

--==============================================================
-- Index: GEC1I347
--==============================================================
create unique index GEC.GEC1I347 on GEC.GECTB347_GARANTIA_CTRTO_CRDTO (

   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC,
   NU_GARANTIA          ASC,
   NU_TIPO_GARANTIA     ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB348_GARANTIA_FIADOR
--==============================================================
create table GEC.GECTB348_GARANTIA_FIADOR (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_TIPO_GARANTIA     SMALLINT              
      not null,
   NU_GARANTIA          SMALLINT              
      not null,
   IC_TIPO_PESSOA_FIADOR CHAR(1)               
      not null with default 'F'
         constraint GEC1C348 check (IC_TIPO_PESSOA_FIADOR in ('F','J')),

   NU_CPF_CNPJ_FIADOR   DECIMAL(14)           
      not null,
   CO_CPF_CNPJ_FIADOR   CHAR(14)              
      not null with default,
   constraint GECPK348 primary key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_GARANTIA, NU_TIPO_GARANTIA)  
)
 in GECDB003.GECTS348;

label on table GEC.GECTB348_GARANTIA_FIADOR is 'GARANTIA_FIADOR';

--==============================================================
-- Index: GEC1I348
--==============================================================
create unique index GEC.GEC1I348 on GEC.GECTB348_GARANTIA_FIADOR (
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC,
   NU_GARANTIA          ASC,
   NU_TIPO_GARANTIA     ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB349_EVENTO_PRCFO_SUBLOTE
--==============================================================
create table GEC.GECTB349_EVENTO_PRCFO_SUBLOTE (
   NU_EVENTO_CESSAO     DECIMAL(18)           
      not null,
   NU_SUBLOTE_CESSAO    INTEGER               
      not null,
   constraint GECPK349 primary key (NU_EVENTO_CESSAO, NU_SUBLOTE_CESSAO)
  
)
 in GECDB003.GECTS349;

label on table GEC.GECTB349_EVENTO_PRCFO_SUBLOTE is 
'EVENTO_PRECIFICACAO_SUBLOTE';

--==============================================================
-- Index: GEC1I349
--==============================================================
create unique index GEC.GEC1I349 on GEC.GECTB349_EVENTO_PRCFO_SUBLOTE (

   NU_EVENTO_CESSAO     ASC,
   NU_SUBLOTE_CESSAO    ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB365_TIPO_CONTRATO
--==============================================================
create table GEC.GECTB365_TIPO_CONTRATO (
   NU_TIPO_CONTRATO     SMALLINT              
      not null,
   DE_TIPO_CONTRATO     VARCHAR(50)           
      not null,
   constraint GECPK365 primary key (NU_TIPO_CONTRATO)  
)
 in GECDB003.GECTS365;

label on table GEC.GECTB365_TIPO_CONTRATO is 'TIPO_CONTRATO';

--==============================================================
-- Index: GEC1I365
--==============================================================
create unique index GEC.GEC1I365 on GEC.GECTB365_TIPO_CONTRATO (
   NU_TIPO_CONTRATO     ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB366_TIPO_CONDICAO_CTRTO
--==============================================================
create table GEC.GECTB366_TIPO_CONDICAO_CTRTO (
   NU_TIPO_CONDICAO_CONTRATO SMALLINT              
      not null,
   DE_TIPO_CONDICAO_CONTRATO VARCHAR(100)          
      not null,
   constraint GECPK366 primary key (NU_TIPO_CONDICAO_CONTRATO)  
)
 in GECDB003.GECTS366;

label on table GEC.GECTB366_TIPO_CONDICAO_CTRTO is 
'TIPO_CONDICAO_CONTRATO';

--==============================================================
-- Index: GEC1I366
--==============================================================
create unique index GEC.GEC1I366 on GEC.GECTB366_TIPO_CONDICAO_CTRTO (
   NU_TIPO_CONDICAO_CONTRATO ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB367_MODALIDADE_CONTRATO
--==============================================================
create table GEC.GECTB367_MODALIDADE_CONTRATO (
   NU_MODALIDADE_CONTRATO SMALLINT              
      not null,
   DE_MODALIDADE_CONTRATO VARCHAR(200)          
      not null,
   constraint GECPK367 primary key (NU_MODALIDADE_CONTRATO)  
)
 in GECDB003.GECTS367;

label on table GEC.GECTB367_MODALIDADE_CONTRATO is 'MODALIDADE_CONTRATO'
;

--==============================================================
-- Index: GEC1I367
--==============================================================
create unique index GEC.GEC1I367 on GEC.GECTB367_MODALIDADE_CONTRATO (
   NU_MODALIDADE_CONTRATO ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB368_TIPO_INDEXADOR_CTRTO
--==============================================================
create table GEC.GECTB368_TIPO_INDEXADOR_CTRTO (
   NU_TIPO_INDEXADOR_CONTRATO SMALLINT              
      not null,
   DE_TIPO_INDEXADOR_CTRTO VARCHAR(100)          
      not null,
   constraint GECPK368 primary key (NU_TIPO_INDEXADOR_CONTRATO)  
)
 in GECDB003.GECTS368;

label on table GEC.GECTB368_TIPO_INDEXADOR_CTRTO is 
'TIPO_INDEXADOR_CONTRATO';
label on column 
GEC.GECTB368_TIPO_INDEXADOR_CTRTO.DE_TIPO_INDEXADOR_CTRTO is 
'DE_TIPO_INDEXADOR_CONTRATO';
--==============================================================
-- Index: GEC1I368
--==============================================================
create unique index GEC.GEC1I368 on GEC.GECTB368_TIPO_INDEXADOR_CTRTO (

   NU_TIPO_INDEXADOR_CONTRATO ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB369_TIPO_COBRANCA_CTRTO
--==============================================================
create table GEC.GECTB369_TIPO_COBRANCA_CTRTO (
   NU_TIPO_COBRANCA_CONTRATO SMALLINT              
      not null,
   DE_TIPO_COBRANCA_CONTRATO VARCHAR(100)          
      not null,
   constraint GECPK369 primary key (NU_TIPO_COBRANCA_CONTRATO)  
)
 in GECDB003.GECTS369;

label on table GEC.GECTB369_TIPO_COBRANCA_CTRTO is 
'TIPO_COBRANCA_CONTRATO';

--==============================================================
-- Index: GEC1I369
--==============================================================
create unique index GEC.GEC1I369 on GEC.GECTB369_TIPO_COBRANCA_CTRTO (
   NU_TIPO_COBRANCA_CONTRATO ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB370_TIPO_GARANTIA
--==============================================================
create table GEC.GECTB370_TIPO_GARANTIA (
   NU_TIPO_GARANTIA     SMALLINT              
      not null,
   DE_TIPO_GARANTIA     VARCHAR(200)          
      not null,
   constraint GECPK370 primary key (NU_TIPO_GARANTIA)  
)
 in GECDB003.GECTS370;

label on table GEC.GECTB370_TIPO_GARANTIA is 'TIPO_GARANTIA';

--==============================================================
-- Index: GEC1I370
--==============================================================
create unique index GEC.GEC1I370 on GEC.GECTB370_TIPO_GARANTIA (
   NU_TIPO_GARANTIA     ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 0 PCTFREE 0   
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB371_FAIXA_VARIAVEL
--==============================================================
create table GEC.GECTB371_FAIXA_VARIAVEL (
   NU_FAIXA_VARIAVEL    SMALLINT              
      not null,
   IC_TIPO_PESSOA       CHAR(1)               
      not null
         constraint GEC1C371 check (IC_TIPO_PESSOA in ('F','J')),
   QT_DIA_MINIMO_ATRASO INTEGER               
      not null,
   QT_DIA_MAXIMO_ATRASO INTEGER               
      not null,
   VR_MINIMO_ATRASO     DECIMAL(17,2)         
      not null,
   VR_MAXIMO_ATRASO     DECIMAL(17,2)         
      not null,
   constraint GECPK371 primary key (NU_FAIXA_VARIAVEL)  
)
 in GECDB003.GECTS371;

label on table GEC.GECTB371_FAIXA_VARIAVEL is 'FAIXA_VARIAVEL';

--==============================================================
-- Index: GEC1I371
--==============================================================
create unique index GEC.GEC1I371 on GEC.GECTB371_FAIXA_VARIAVEL (
   NU_FAIXA_VARIAVEL    ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 5 PCTFREE 10
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Index: GEC2I371
--==============================================================
create index GEC.GEC2I371 on GEC.GECTB371_FAIXA_VARIAVEL (
   IC_TIPO_PESSOA       ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 5 PCTFREE 10
GBPCACHE CHANGED       
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB372_SITUACAO_ESPECIAL
--==============================================================
create table GEC.GECTB372_SITUACAO_ESPECIAL (
   NU_SITUACAO_ESPECIAL SMALLINT              
      not null,
   DE_SITUACAO_ESPECIAL VARCHAR(100)          
      not null,
   IC_IMPEDIMENTO_EXECUCAO CHAR(1)               
      not null with default 'S'
         constraint GEC1C372 check (IC_IMPEDIMENTO_EXECUCAO in ('S','N'
)),
   IC_IMPEDIMENTO_CAMPANHA CHAR(1)               
      not null with default 'S'
         constraint GEC2C372 check (IC_IMPEDIMENTO_CAMPANHA in ('S','N'
)),
   IC_IMPEDIMENTO_BOLETO CHAR(1)               
      not null with default 'S'
         constraint GEC3C372 check (IC_IMPEDIMENTO_BOLETO in ('S','N')),

   IC_IMPEDIMENTO_COBRANCA CHAR(1)               
      not null with default 'S'
         constraint GEC4C372 check (IC_IMPEDIMENTO_COBRANCA in ('S','N'
)),
   IC_IMPEDIMENTO_BOLETO_LOTE CHAR(1)               
      not null with default 'S'
         constraint GEC5C372 check (IC_IMPEDIMENTO_BOLETO_LOTE in ('S',
'N')),
   IC_IMPEDIMENTO_NOTIFICACAO CHAR(1)               
      not null with default 'S'
         constraint GEC6C372 check (IC_IMPEDIMENTO_NOTIFICACAO in ('S',
'N')),
   IC_IMPEDIMENTO_LIQUIDACAO CHAR(1)               
      not null with default 'S'
         constraint GEC7C372 check (IC_IMPEDIMENTO_LIQUIDACAO in ('S',
'N')),
   IC_IMPEDIMENTO_RENEGOCIACAO CHAR(1)               
      not null with default 'S'
         constraint GEC8C372 check (IC_IMPEDIMENTO_RENEGOCIACAO in ('S',
'N')),
   IC_IMPEDIMENTO_PERMITIDA CHAR(1)               
      not null with default 'S'
         constraint GEC9C372 check (IC_IMPEDIMENTO_PERMITIDA in ('S','N'
)),
   IC_IMPEDIMENTO_BOLETO_PGMTO CHAR(1)               
      not null with default 'S'
         constraint GECAC372 check (IC_IMPEDIMENTO_BOLETO_PGMTO in ('S',
'N')),
   constraint GECPK372 primary key (NU_SITUACAO_ESPECIAL)  
)
 in GECDB003.GECTS372;

label on table GEC.GECTB372_SITUACAO_ESPECIAL is 'SITUACAO_ESPECIAL';
label on column 
GEC.GECTB372_SITUACAO_ESPECIAL.IC_IMPEDIMENTO_BOLETO_PGMTO is 
'IC_IMPEDIMENTO_BOLETO_PAGAMENTO';
--==============================================================
-- Index: GEC1I372
--==============================================================
create unique index GEC.GEC1I372 on GEC.GECTB372_SITUACAO_ESPECIAL (
   NU_SITUACAO_ESPECIAL ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 5 PCTFREE 10
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB374_CREDITO_ENVIO_ARQUIVO
--==============================================================
create table GEC.GECTB374_CREDITO_ENVIO_ARQUIVO (
   NU_ENVIO_ARQUIVO     INTEGER               
      not null,
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_TIPO_SITUACAO     DECIMAL(3,0)          
      not null with default 13,
   NU_SITUACAO          DECIMAL(3,0)          
      not null with default 1,
   constraint GECPK374 primary key (NU_ENVIO_ARQUIVO, NU_BASE_ELEGIVEL, 
NU_CREDITO)  
)
 in GECDB003.GECTS374;

label on table GEC.GECTB374_CREDITO_ENVIO_ARQUIVO is 
'CREDITO_ENVIO_ARQUIVO';

--==============================================================
-- Index: GEC1I374
--==============================================================
create unique index GEC.GEC1I374 on GEC.GECTB374_CREDITO_ENVIO_ARQUIVO (

   NU_ENVIO_ARQUIVO     ASC,
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 48 SECQTY 48
    ERASE  YES                 
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB375_TIPO_FILTRO
--==============================================================
create table GEC.GECTB375_TIPO_FILTRO (
   CO_TIPO_FILTRO       CHAR(1)               
      not null,
   DE_TIPO_FILTRO       VARCHAR(50)           
      not null,
   constraint GECPK375 primary key (CO_TIPO_FILTRO)  
)
 in GECDB003.GECTS375;

label on table GEC.GECTB375_TIPO_FILTRO is 'TIPO_FILTRO';

--==============================================================
-- Index: GEC1I375
--==============================================================
create unique index GEC.GEC1I375 on GEC.GECTB375_TIPO_FILTRO (
   CO_TIPO_FILTRO       ASC
)
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48    
ERASE  YES             
FREEPAGE 5 PCTFREE 10
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 32G;

--==============================================================
-- Table: GECTB376_TIPO_MENSAGEM
--==============================================================
create table GEC.GECTB376_TIPO_MENSAGEM (
   NU_TIPO_MENSAGEM     SMALLINT              
      not null,
   DE_TIPO_MENSAGEM     VARCHAR(30)           
      not null,
   constraint GECPK376 primary key (NU_TIPO_MENSAGEM)  
)
 in GECDB003.GECTS376;

label on table GEC.GECTB376_TIPO_MENSAGEM is 'TIPO_MENSAGEM';

--==============================================================
-- Index: GEC1I376
--==============================================================
create unique index GEC.GEC1I376 on GEC.GECTB376_TIPO_MENSAGEM (
   NU_TIPO_MENSAGEM     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB377_CADASTRO_EMAIL
--==============================================================
create table GEC.GECTB377_CADASTRO_EMAIL (
   NU_ETAPA_CESSAO      DECIMAL(2,0)          
      not null,
   NU_TIPO_MENSAGEM     SMALLINT              
      not null,
   CO_NIVEL_SIGILO      CHAR(2)               
      not null,
   IC_SITUACAO_CADASTRO CHAR(1)               
      not null with default 'A'
         constraint GEC1C377 check (IC_SITUACAO_CADASTRO in ('A','I')),

   CO_EMAIL_REMETENTE   VARCHAR(300)          
      not null,
   CO_EMAIL_DESTINATARIO VARCHAR(300)          
      not null,
   CO_EMAIL_DSTRO_COPIA VARCHAR(300),
   DE_CONTEUDO_MENSAGEM VARCHAR(2000)         
      not null,
   constraint GECPK377 primary key (NU_ETAPA_CESSAO, NU_TIPO_MENSAGEM)  

)
 in GECDB003.GECTS377;

label on table GEC.GECTB377_CADASTRO_EMAIL is 'CADASTRO_EMAIL';
label on column GEC.GECTB377_CADASTRO_EMAIL.CO_EMAIL_DSTRO_COPIA is 
'CO_EMAIL_DESTINATARIO_COPIA';
--==============================================================
-- Index: GEC1I377
--==============================================================
create unique index GEC.GEC1I377 on GEC.GECTB377_CADASTRO_EMAIL (
   NU_ETAPA_CESSAO      ASC,
   NU_TIPO_MENSAGEM     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Index: GEC2I377
--==============================================================
create index GEC.GEC2I377 on GEC.GECTB377_CADASTRO_EMAIL (
   NU_ETAPA_CESSAO      ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Index: GEC3I377
--==============================================================
create index GEC.GEC3I377 on GEC.GECTB377_CADASTRO_EMAIL (
   NU_TIPO_MENSAGEM     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB378_ENVIO_EMAIL
--==============================================================
create table GEC.GECTB378_ENVIO_EMAIL (
   NU_ENVIO_EMAIL       INTEGER               
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       no cache
           no cycle
       maxvalue 999999999
       minvalue 1
      ),
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_ETAPA_BASE_ELEGIVEL DECIMAL(3,0)          
      not null,
   NU_ETAPA_CESSAO      DECIMAL(2,0)          
      not null,
   NU_TIPO_MENSAGEM     SMALLINT              
      not null,
   IC_SUCESSO_ENVIO     CHAR(1)               
      not null with default 'S'
         constraint GEC1C378 check (IC_SUCESSO_ENVIO in ('S','N')),
   TS_ENVIO_EMAIL       TIMESTAMP             
      not null,
   CO_NIVEL_SIGILO      CHAR(2)               
      not null,
   CO_EMAIL_REMETENTE   VARCHAR(300)          
      not null,
   CO_EMAIL_DESTINATARIO VARCHAR(300)          
      not null,
   CO_EMAIL_DSTRO_COPIA VARCHAR(300),
   DE_CONTEUDO_MENSAGEM VARCHAR(2000)         
      not null,
   QT_TENTATIVA_ENVIO   SMALLINT              
      not null with default 1,
   DE_ERRO_ENVIO        VARCHAR(3000),
   constraint GECPK378 primary key (NU_ENVIO_EMAIL)  
)
 in GECDB003.GECTS378;

label on table GEC.GECTB378_ENVIO_EMAIL is 'ENVIO_EMAIL';
label on column GEC.GECTB378_ENVIO_EMAIL.CO_EMAIL_DSTRO_COPIA is 
'CO_EMAIL_DESTINATARIO_COPIA';
--==============================================================
-- Index: GEC1I378
--==============================================================
create unique index GEC.GEC1I378 on GEC.GECTB378_ENVIO_EMAIL (
   NU_ENVIO_EMAIL       ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Index: GEC2I378
--==============================================================
create index GEC.GEC2I378 on GEC.GECTB378_ENVIO_EMAIL (
   NU_BASE_ELEGIVEL     ASC,
   NU_ETAPA_BASE_ELEGIVEL ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Index: GEC3I378
--==============================================================
create index GEC.GEC3I378 on GEC.GECTB378_ENVIO_EMAIL (
   NU_ETAPA_CESSAO      ASC,
   NU_TIPO_MENSAGEM     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Index: GEC4I378
--==============================================================
create index GEC.GEC4I378 on GEC.GECTB378_ENVIO_EMAIL (
   NU_BASE_ELEGIVEL     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Index: GEC5I378
--==============================================================
create index GEC.GEC5I378 on GEC.GECTB378_ENVIO_EMAIL (
   TS_ENVIO_EMAIL       ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB379_NIVEL_SIGILO
--==============================================================
create table GEC.GECTB379_NIVEL_SIGILO (
   CO_NIVEL_SIGILO      CHAR(2)               
      not null,
   DE_NIVEL_SIGILO      VARCHAR(30)           
      not null,
   constraint GECPK379 primary key (CO_NIVEL_SIGILO)  
)
 in GECDB003.GECTS379;

label on table GEC.GECTB379_NIVEL_SIGILO is 'NIVEL_SIGILO';

--==============================================================
-- Index: GEC1I379
--==============================================================
create unique index GEC.GEC1I379 on GEC.GECTB379_NIVEL_SIGILO (
   CO_NIVEL_SIGILO      ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB380_ARQUIVO_CESSAO
--==============================================================
create table GEC.GECTB380_ARQUIVO_CESSAO (
   NU_ARQUIVO_CESSAO    INTEGER               
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 2147483647
       minvalue 1
      ),
   NU_TIPO_SITUACAO     DECIMAL(3,0)          
      not null,
   NU_SITUACAO          DECIMAL(3,0)          
      not null,
   NU_BASE_ELEGIVEL     DECIMAL(7,0),
   DE_CONTEUDO_ARQUIVO_CESSAO CLOB(1000000000)      
      not null,
   NO_ARQUIVO_CESSAO    VARCHAR(50)           
      not null,
   TS_CARGA_ARQUIVO     TIMESTAMP             
      not null,
   NU_TIPO_BASE_ELEGIVEL SMALLINT,
   constraint GECPK380 primary key (NU_ARQUIVO_CESSAO)  
)
 in GECDB003.GECTS380;

create auxiliary table GEC.GECTB380_LOB_1 in GECDB003.GEC1L380 
   stores GEC.GECTB380_ARQUIVO_CESSAO column DE_CONTEUDO_ARQUIVO_CESSAO 

part 1;

CREATE UNIQUE INDEX GEC.GEC1X380                
  ON GEC.GECTB380_LOB_1                         
  PADDED                                        
  USING STOGROUP SGDDB201                       
  PRIQTY 48000 SECQTY 48000                     
  ERASE  NO                                     
  FREEPAGE 0 PCTFREE 0                          
  GBPCACHE CHANGED                              
  COMPRESS NO                                   
  BUFFERPOOL BP11                               
  CLOSE NO                                      
  COPY YES                                      
  DEFINE YES                                    
  PIECESIZE 4 G; 

label on table GEC.GECTB380_ARQUIVO_CESSAO is 'ARQUIVO_CESSAO';

--==============================================================
-- Index: GEC1I380
--==============================================================
create unique index GEC.GEC1I380 on GEC.GECTB380_ARQUIVO_CESSAO (
   NU_ARQUIVO_CESSAO    ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5
gbpcache changed
bufferpool BP11
close yes
copy no;

--==============================================================
-- Table: GECTB381_TIPO_BASE_ELEGIVEL
--==============================================================
create table GEC.GECTB381_TIPO_BASE_ELEGIVEL (
   NU_TIPO_BASE_ELEGIVEL SMALLINT              
      not null,
   DE_TIPO_BASE_ELEGIVEL VARCHAR(50)           
      not null,
   constraint GECPK381 primary key (NU_TIPO_BASE_ELEGIVEL)  
)
 in GECDB003.GECTS381;

label on table GEC.GECTB381_TIPO_BASE_ELEGIVEL is 'TIPO_BASE_ELEGIVEL';


--==============================================================
-- Index: GEC1I381
--==============================================================
create unique index GEC.GEC1I381 on GEC.GECTB381_TIPO_BASE_ELEGIVEL (
   NU_TIPO_BASE_ELEGIVEL ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5
gbpcache changed
bufferpool BP11
close yes
copy no;

--==============================================================
-- Table: GECTB382_CNTLE_PRCNO_ARQVO_BSE
--==============================================================
create table GEC.GECTB382_CNTLE_PRCNO_ARQVO_BSE (
   NU_ARQUIVO_BASE_ELEGIVEL DECIMAL(7,0)          
      not null,
   NU_TIPO_PRCNO_ARQVO_BSE SMALLINT              
      not null,
   IC_SITUACAO_PRCNO_ARQVO CHAR(1)               
      not null with default 'P'
         constraint GEC1C382 check (IC_SITUACAO_PRCNO_ARQVO in ('P','E',
'C')),
   TS_SITUACAO_PRCNO_ARQVO TIMESTAMP             
      not null,
   constraint GECPK382 primary key (NU_ARQUIVO_BASE_ELEGIVEL, 
NU_TIPO_PRCNO_ARQVO_BSE)  
)
 in GECDB003.GECTS382;

label on table GEC.GECTB382_CNTLE_PRCNO_ARQVO_BSE is 
'CONTROLE_PROCESSAMENTO_ARQUIVO_BASE_ELEGIVEL';
label on column 
GEC.GECTB382_CNTLE_PRCNO_ARQVO_BSE.NU_TIPO_PRCNO_ARQVO_BSE is 
'NU_TIPO_PROCESSAMENTO_ARQUIVO_BASE_ELEGIVEL';
label on column 
GEC.GECTB382_CNTLE_PRCNO_ARQVO_BSE.IC_SITUACAO_PRCNO_ARQVO is 
'IC_SITUACAO_PROCESSAMENTO_ARQUIVO_ELEGIVEL';
label on column 
GEC.GECTB382_CNTLE_PRCNO_ARQVO_BSE.TS_SITUACAO_PRCNO_ARQVO is 
'TS_SITUACAO_PROCESSAMENTO_ARQUIVO_ELEGIVEL';
--==============================================================
-- Index: GEC1I382
--==============================================================
create unique index GEC.GEC1I382 on GEC.GECTB382_CNTLE_PRCNO_ARQVO_BSE (

   NU_ARQUIVO_BASE_ELEGIVEL ASC,
   NU_TIPO_PRCNO_ARQVO_BSE ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5
gbpcache changed
bufferpool BP11
close yes
copy no;

--==============================================================
-- Table: GECTB383_TIPO_PRCNO_ARQVO_BSE
--==============================================================
create table GEC.GECTB383_TIPO_PRCNO_ARQVO_BSE (
   NU_TIPO_PRCNO_ARQVO_BSE SMALLINT              
      not null,
   DE_TIPO_PRCNO_ARQVO_BSE VARCHAR(50)           
      not null,
   constraint GECPK383 primary key (NU_TIPO_PRCNO_ARQVO_BSE)  
)
 in GECDB003.GECTS383;

label on table GEC.GECTB383_TIPO_PRCNO_ARQVO_BSE is 
'TIPO_PROCESSAMENTO_ARQUIVO_BASE_ELEGIVEL';
label on column 
GEC.GECTB383_TIPO_PRCNO_ARQVO_BSE.NU_TIPO_PRCNO_ARQVO_BSE is 
'NU_TIPO_PROCESSAMENTO_ARQUIVO_BASE_ELEGIVEL';
label on column 
GEC.GECTB383_TIPO_PRCNO_ARQVO_BSE.DE_TIPO_PRCNO_ARQVO_BSE is 
'DE_TIPO_PROCESSAMENTO_ARQUIVO_BASE_ELEGIVEL';
--==============================================================
-- Index: GEC1I383
--==============================================================
create unique index GEC.GEC1I383 on GEC.GECTB383_TIPO_PRCNO_ARQVO_BSE (

   NU_TIPO_PRCNO_ARQVO_BSE ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB384_PRCSO_ARQUIVO_CESSAO
--==============================================================
create table GEC.GECTB384_PRCSO_ARQUIVO_CESSAO (
   NU_ARQUIVO_CESSAO    INTEGER               
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 2147483647
       minvalue 1
      ),
   NU_PRCSO_EXEC_ROTINA DECIMAL(3),
   NU_EXECUCAO_ROTINA   DECIMAL(10),
   constraint GECPK384 primary key (NU_ARQUIVO_CESSAO)  
)
 in GECDB003.GECTS384;

label on table GEC.GECTB384_PRCSO_ARQUIVO_CESSAO is 
'PROCESSAMENTO_ARQUIVO_CESSAO';
label on column GEC.GECTB384_PRCSO_ARQUIVO_CESSAO.NU_PRCSO_EXEC_ROTINA 
is 'NU_PROCESSO_EXECUCAO_ROTINA';
--==============================================================
-- Index: GEC1I384
--==============================================================
create unique index GEC.GEC1I384 on GEC.GECTB384_PRCSO_ARQUIVO_CESSAO (

   NU_ARQUIVO_CESSAO    ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5
gbpcache changed
bufferpool BP11
close yes
copy no;

--==============================================================
-- Table: GECTB385_BOLETO_RECEBIMENTO
--==============================================================
create table GEC.GECTB385_BOLETO_RECEBIMENTO (
   NU_CESSAO_CREDITO    DECIMAL(7,0)          
      not null,
   NU_NOSSO_NUMERO      DECIMAL(18,0)         
      not null,
   NU_TIPO_SITUACAO     DECIMAL(3,0)          
      not null,
   NU_SITUACAO          DECIMAL(3,0)          
      not null,
   CO_LINHA_DIGITAVEL   CHAR(48)              
      not null,
   DT_VENCIMENTO_BOLETO DATE                  
      not null,
   TS_EMISSAO_BOLETO    TIMESTAMP             
      not null,
   VR_BOLETO            DECIMAL(17, 2)        
      not null,
   TS_PAGAMENTO_BOLETO  TIMESTAMP,
   IC_ENVIO_BOLETO_CONTABIL CHAR(1)               
      not null with default 'N'
         constraint GEC1C385 check (IC_ENVIO_BOLETO_CONTABIL in ('S','N'
)),
   NU_BASE_ELEGIVEL_CREDITO_CSO DECIMAL(7,0)          
      not null,
   constraint GECPK385 primary key (NU_CESSAO_CREDITO, NU_NOSSO_NUMERO) 
 
)
 in GECDB003.GECTS385;

label on table GEC.GECTB385_BOLETO_RECEBIMENTO is 'BOLETO_RECEBIMENTO';

label on column 
GEC.GECTB385_BOLETO_RECEBIMENTO.NU_BASE_ELEGIVEL_CREDITO_CSO is 
'NU_BASE_ELEGIVEL_CREDITO_CESSAO';
--==============================================================
-- Index: GEC1I385
--==============================================================
create unique index GEC.GEC1I385 on GEC.GECTB385_BOLETO_RECEBIMENTO (
   NU_CESSAO_CREDITO    ASC,
   NU_NOSSO_NUMERO      ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 10 PCTFREE 10    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I385
--==============================================================
create index GEC.GEC2I385 on GEC.GECTB385_BOLETO_RECEBIMENTO (
   NU_TIPO_SITUACAO     ASC,
   NU_SITUACAO          ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 10 PCTFREE 10    
GBPCACHE CHANGED        
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Index: GEC3I385
--==============================================================
create index GEC.GEC3I385 on GEC.GECTB385_BOLETO_RECEBIMENTO (
   NU_BASE_ELEGIVEL_CREDITO_CSO ASC
)
using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5
gbpcache changed
bufferpool BP11
close yes
copy no;

--==============================================================
-- Table: GECTB386_ANEXO_BOLETO
--==============================================================
create table GEC.GECTB386_ANEXO_BOLETO (
   NU_CESSAO_CREDITO    DECIMAL(7,0)          
      not null,
   NU_NOSSO_NUMERO      DECIMAL(18,0)         
      not null,
   NU_DOCUMENTO_CREDITO Decimal(11)           
      not null,
   constraint GECPK386 primary key (NU_CESSAO_CREDITO, NU_NOSSO_NUMERO, 
NU_DOCUMENTO_CREDITO)  
)
 in GECDB003.GECTS386;

label on table GEC.GECTB386_ANEXO_BOLETO is 'ANEXO_BOLETO';

--==============================================================
-- Index: GEC1I386
--==============================================================
create unique index GEC.GEC1I386 on GEC.GECTB386_ANEXO_BOLETO (
   NU_CESSAO_CREDITO    ASC,
   NU_NOSSO_NUMERO      ASC,
   NU_DOCUMENTO_CREDITO ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 10 PCTFREE 10    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I386
--==============================================================
create index GEC.GEC2I386 on GEC.GECTB386_ANEXO_BOLETO (
   NU_DOCUMENTO_CREDITO ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 10 PCTFREE 10    
GBPCACHE CHANGED        
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB387_ROTEIRO_CONTABIL
--==============================================================
create table GEC.GECTB387_ROTEIRO_CONTABIL (
   NU_ROTEIRO_CONTABIL  SMALLINT              
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 32767
       minvalue 1
      ),
   NU_SISTEMA_ORIGEM_CREDITO SMALLINT              
      not null,
   NU_EVENTO_CONTABIL   INTEGER               
      not null,
   NU_TIPO_EVENTO_CONTABIL SMALLINT              
      not null with default 1,
   IC_POSSUI_ESTORNO    CHAR(1)               
      not null with default 'S'
         constraint GEC2C387 check (IC_POSSUI_ESTORNO in ('S','N')),
   DT_INICIO_VIGENCIA   DATE                  
      not null,
   DT_FIM_VIGENCIA      DATE,
   constraint GECPK387 primary key (NU_ROTEIRO_CONTABIL)  
)
 in GECDB003.GECTS387;

label on table GEC.GECTB387_ROTEIRO_CONTABIL is 'ROTEIRO_CONTABIL';

--==============================================================
-- Index: GEC1I387
--==============================================================
create unique index GEC.GEC1I387 on GEC.GECTB387_ROTEIRO_CONTABIL (
   NU_ROTEIRO_CONTABIL  ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 10 PCTFREE 10    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I387
--==============================================================
create index GEC.GEC2I387 on GEC.GECTB387_ROTEIRO_CONTABIL (
   NU_EVENTO_CONTABIL   ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 10 PCTFREE 10    
GBPCACHE CHANGED        
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB388_LANCAMENTO_CONTABIL
--==============================================================
create table GEC.GECTB388_LANCAMENTO_CONTABIL (
   NU_LANCAMENTO_CONTABIL INTEGER               
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 2147483647
       minvalue 1
      ),
   NU_ROTEIRO_CONTABIL  SMALLINT              
      not null,
   NU_TIPO_SITUACAO     DECIMAL(3,0)          
      not null,
   NU_SITUACAO_LNCTO_CNTBL DECIMAL(3,0)          
      not null,
   DT_LANCAMENTO_CONTABIL DATE                  
      not null,
   NU_PRODUTO_CREDITO   DECIMAL(4, 0)         
      not null,
   NU_AGENCIA_DETENTORA DECIMAL(4, 0)         
      not null,
   QT_CONTRATO_LNCMO_CONTABIL INTEGER               
      not null,
   VR_TOTAL_LANCAMENTO_CONTABIL DECIMAL(17, 2)        
      not null,
   TS_PAGAMENTO_DEVOLUCAO_CSNRA TIMESTAMP,
   constraint GECPK388 primary key (NU_LANCAMENTO_CONTABIL)  
)
 in GECDB003.GECTS388;

label on table GEC.GECTB388_LANCAMENTO_CONTABIL is 'LANCAMENTO_CONTABIL'
;
label on column GEC.GECTB388_LANCAMENTO_CONTABIL.NU_SITUACAO_LNCTO_CNTBL
 is 'NU_SITUACAO_LANCAMENTO_CONTABIL';
label on column 
GEC.GECTB388_LANCAMENTO_CONTABIL.QT_CONTRATO_LNCMO_CONTABIL is 
'QT_CONTRATO_LANCAMENTO_CONTABIL';
label on column 
GEC.GECTB388_LANCAMENTO_CONTABIL.TS_PAGAMENTO_DEVOLUCAO_CSNRA is 
'TS_PAGAMENTO_DEVOLUCAO_CESSIONARIA';
--==============================================================
-- Index: GEC1I388
--==============================================================
create unique index GEC.GEC1I388 on GEC.GECTB388_LANCAMENTO_CONTABIL (
   NU_LANCAMENTO_CONTABIL ASC
)
USING STOGROUP SGDDB201
PRIQTY 48 SECQTY 48    
ERASE  NO              
FREEPAGE 10 PCTFREE 10 
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 2 G;

--==============================================================
-- Index: GEC2I388
--==============================================================
create index GEC.GEC2I388 on GEC.GECTB388_LANCAMENTO_CONTABIL (
   DT_LANCAMENTO_CONTABIL ASC
)
USING STOGROUP SGDDB201
PRIQTY 48 SECQTY 48    
ERASE  NO              
FREEPAGE 10 PCTFREE 10 
GBPCACHE CHANGED       
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I388
--==============================================================
create index GEC.GEC3I388 on GEC.GECTB388_LANCAMENTO_CONTABIL (
   NU_PRODUTO_CREDITO   ASC,
   NU_AGENCIA_DETENTORA ASC
)
USING STOGROUP SGDDB201
PRIQTY 48 SECQTY 48    
ERASE  NO              
FREEPAGE 10 PCTFREE 10 
GBPCACHE CHANGED       
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 2 G;

--==============================================================
-- Index: GEC4I388
--==============================================================
create index GEC.GEC4I388 on GEC.GECTB388_LANCAMENTO_CONTABIL (
   NU_ROTEIRO_CONTABIL  ASC
)
USING STOGROUP SGDDB201
PRIQTY 48 SECQTY 48    
ERASE  NO              
FREEPAGE 10 PCTFREE 10 
GBPCACHE CHANGED       
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 2 G;

--==============================================================
-- Table: GECTB389_LNCTO_CNTBL_CSO_CRDTO
--==============================================================
create table GEC.GECTB389_LNCTO_CNTBL_CSO_CRDTO (
   NU_LANCAMENTO_CONTABIL INTEGER               
      not null,
   NU_CESSAO_CREDITO    DECIMAL(7,0)          
      not null,
   constraint GECPK389 primary key (NU_CESSAO_CREDITO, 
NU_LANCAMENTO_CONTABIL)  
)
 in GECDB003.GECTS389;

label on table GEC.GECTB389_LNCTO_CNTBL_CSO_CRDTO is 
'LANCAMENTO_CONTABIL_CESSAO_CREDITO';

--==============================================================
-- Index: GEC1I389
--==============================================================
create unique index GEC.GEC1I389 on GEC.GECTB389_LNCTO_CNTBL_CSO_CRDTO (

   NU_CESSAO_CREDITO    ASC,
   NU_LANCAMENTO_CONTABIL ASC
)
USING STOGROUP SGDDB201
PRIQTY 48 SECQTY 48    
ERASE  NO              
FREEPAGE 10 PCTFREE 10 
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 2 G;

--==============================================================
-- Index: GEC2I389
--==============================================================
create index GEC.GEC2I389 on GEC.GECTB389_LNCTO_CNTBL_CSO_CRDTO (
   NU_CESSAO_CREDITO    ASC
)
USING STOGROUP SGDDB201
PRIQTY 48 SECQTY 48    
ERASE  NO              
FREEPAGE 10 PCTFREE 10 
GBPCACHE CHANGED       
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I389
--==============================================================
create index GEC.GEC3I389 on GEC.GECTB389_LNCTO_CNTBL_CSO_CRDTO (
   NU_LANCAMENTO_CONTABIL ASC
)
USING STOGROUP SGDDB201
PRIQTY 48 SECQTY 48    
ERASE  NO              
FREEPAGE 10 PCTFREE 10 
GBPCACHE CHANGED       
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 2 G;

--==============================================================
-- Table: GECTB390_PGMNO_DVLCO_CSO_CRDTO
--==============================================================
create table GEC.GECTB390_PGMNO_DVLCO_CSO_CRDTO (
   NU_DOCUMENTO_CREDITO Decimal(11)           
      not null,
   NU_LANCAMENTO_CONTABIL INTEGER               
      not null,
   constraint GECPK390 primary key (NU_DOCUMENTO_CREDITO, 
NU_LANCAMENTO_CONTABIL)  
)
 in GECDB003.GECTS390;

label on table GEC.GECTB390_PGMNO_DVLCO_CSO_CRDTO is 
'PAGAMENTO_DEVOLUCAO_CESSAO_CREDITO';

--==============================================================
-- Index: GEC1I390
--==============================================================
create unique index GEC.GEC1I390 on GEC.GECTB390_PGMNO_DVLCO_CSO_CRDTO (

   NU_DOCUMENTO_CREDITO ASC,
   NU_LANCAMENTO_CONTABIL ASC
)
USING STOGROUP SGDDB201
PRIQTY 48 SECQTY 48    
ERASE  NO              
FREEPAGE 10 PCTFREE 10 
GBPCACHE CHANGED       
CLUSTER                
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 2 G;

--==============================================================
-- Index: GEC2I390
--==============================================================
create index GEC.GEC2I390 on GEC.GECTB390_PGMNO_DVLCO_CSO_CRDTO (
   NU_DOCUMENTO_CREDITO ASC
)
USING STOGROUP SGDDB201
PRIQTY 48 SECQTY 48    
ERASE  NO              
FREEPAGE 10 PCTFREE 10 
GBPCACHE CHANGED       
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I390
--==============================================================
create index GEC.GEC3I390 on GEC.GECTB390_PGMNO_DVLCO_CSO_CRDTO (
   NU_LANCAMENTO_CONTABIL ASC
)
USING STOGROUP SGDDB201
PRIQTY 48 SECQTY 48    
ERASE  NO              
FREEPAGE 10 PCTFREE 10 
GBPCACHE CHANGED       
COMPRESS NO            
INCLUDE NULL KEYS      
BUFFERPOOL BP11        
CLOSE YES              
COPY NO                
DEFER NO               
DEFINE YES             
PIECESIZE 2 G;

--==============================================================
-- Table: GECTB391_TIPO_EVENTO_CONTABIL
--==============================================================
create table GEC.GECTB391_TIPO_EVENTO_CONTABIL (
   NU_TIPO_EVENTO_CONTABIL SMALLINT              
      not null,
   DE_TIPO_EVENTO_CONTABIL VARCHAR(100)          
      not null,
   constraint GECPK391 primary key (NU_TIPO_EVENTO_CONTABIL)  
)
 in GECDB003.GECTS391;

label on table GEC.GECTB391_TIPO_EVENTO_CONTABIL is 
'TIPO_EVENTO_CONTABIL';

--==============================================================
-- Index: GEC1I391
--==============================================================
create unique index GEC.GEC1I391 on GEC.GECTB391_TIPO_EVENTO_CONTABIL (

   NU_TIPO_EVENTO_CONTABIL ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 10 PCTFREE 10    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB393_FALHA_CADASTRAL_BSE
--==============================================================
create table GEC.GECTB393_FALHA_CADASTRAL_BSE (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_FALHA_CADASTRAL   SMALLINT              
      not null,
   constraint GECPK393 primary key (NU_BASE_ELEGIVEL, 
NU_FALHA_CADASTRAL)  
)
 in GECDB003.GECTS393;

label on table GEC.GECTB393_FALHA_CADASTRAL_BSE is 
'FALHA_CADASTRAL_BASE_ELEGIVEL';

--==============================================================
-- Index: GEC1I393
--==============================================================
create unique index GEC.GEC1I393 on GEC.GECTB393_FALHA_CADASTRAL_BSE (
   NU_BASE_ELEGIVEL     ASC,
   NU_FALHA_CADASTRAL   ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 10 PCTFREE 10    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I393
--==============================================================
create index GEC.GEC2I393 on GEC.GECTB393_FALHA_CADASTRAL_BSE (
   NU_FALHA_CADASTRAL   ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 10 PCTFREE 10    
GBPCACHE CHANGED        
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB394_FALHA_CADASTRAL
--==============================================================
create table GEC.GECTB394_FALHA_CADASTRAL (
   NU_FALHA_CADASTRAL   SMALLINT              
      not null,
   DE_FALHA_CADASTRAL   VARCHAR(100)          
      not null,
   constraint GECPK394 primary key (NU_FALHA_CADASTRAL)  
)
 in GECDB003.GECTS394;

label on table GEC.GECTB394_FALHA_CADASTRAL is 'FALHA_CADASTRAL';

--==============================================================
-- Index: GEC1I394
--==============================================================
create unique index GEC.GEC1I394 on GEC.GECTB394_FALHA_CADASTRAL (
   NU_FALHA_CADASTRAL   ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 10 PCTFREE 10    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- View: GECVW351_MOVIMENTO
--==============================================================
create view GEC.GECVW351_MOVIMENTO as
SELECT AA_MOVIMENTO, 
       MM_MOVIMENTO,
       IC_PESSOA,
       NU_CPF_CNPJ,
       NU_CONTRATO,
       SG_CONC_PROVIS,
       PZ_ATRASO_DD,
       VR_SALDO_DEVEDOR,
       NU_SISTEMA,
       NU_PARTICAO
FROM APC.APCTB712_MOVIMENTO;

comment on table GEC.GECVW351_MOVIMENTO is
'View utilizada para recuperar informações do SIAPC sobre dias em atraso
 dos contratos dos clientes. Esta informação será utilizada pelo sistema
 para excluir clientes da tranche de cessão de crédito.';

alter table GEC.GECTB328_ARQVO_ENVDO_DSFZMNTO
   add constraint GEC1F328 foreign key (NU_CESSAO_CREDITO_DESFEITO)
      references GEC.GECTB326_CESSAO_CREDITO_DSFTO 
(NU_CESSAO_CREDITO_DESFEITO)
      on delete restrict;

alter table GEC.GECTB340_EVENTO_CESSAO
   add constraint GEC1F340 foreign key (NU_BASE_ELEGIVEL, 
NU_ETAPA_BASE_ELEGIVEL)
      references GEC.GECTB314_ETAPA_BASE_ELEGIVEL (NU_BASE_ELEGIVEL, 
NU_ETAPA_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB340_EVENTO_CESSAO
   add constraint GEC2F340 foreign key (NU_TIPO_EVENTO_CESSAO)
      references GEC.GECTB341_TIPO_EVENTO_CESSAO (NU_TIPO_EVENTO_CESSAO)

      on delete restrict;

alter table GEC.GECTB342_EVENTO_CESSAO_FILTRO
   add constraint GEC1F342 foreign key (NU_EVENTO_CESSAO)
      references GEC.GECTB340_EVENTO_CESSAO (NU_EVENTO_CESSAO)
      on delete restrict;

alter table GEC.GECTB343_CRDTO_EXCLUIDO_EVENTO
   add constraint GEC1F343 foreign key (NU_EVENTO_CESSAO)
      references GEC.GECTB340_EVENTO_CESSAO (NU_EVENTO_CESSAO)
      on delete restrict;

alter table GEC.GECTB343_CRDTO_EXCLUIDO_EVENTO
   add constraint GEC2F343 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO)
      references GEC.GECTB304_CREDITO_ELGVL_CESSAO (NU_BASE_ELEGIVEL, 
NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB344_EVENTO_ANEXAR_DCMTO
   add constraint GEC1F344 foreign key (NU_EVENTO_CESSAO)
      references GEC.GECTB340_EVENTO_CESSAO (NU_EVENTO_CESSAO)
      on delete restrict;

alter table GEC.GECTB344_EVENTO_ANEXAR_DCMTO
   add constraint GEC2F344 foreign key (NU_TIPO_DOCUMENTO)
      references GEC.GECTB356_TIPO_DOCUMENTO (NU_TIPO_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB345_EVENTO_CESSAO_PRCFO
   add constraint GEC1F345 foreign key (NU_EVENTO_CESSAO)
      references GEC.GECTB340_EVENTO_CESSAO (NU_EVENTO_CESSAO)
      on delete restrict;

alter table GEC.GECTB346_CONTRATO_CREDITO
   add constraint GEC1F346 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO)
      references GEC.GECTB304_CREDITO_ELGVL_CESSAO (NU_BASE_ELEGIVEL, 
NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB346_CONTRATO_CREDITO
   add constraint GEC2F346 foreign key (NU_TIPO_CONTRATO)
      references GEC.GECTB365_TIPO_CONTRATO (NU_TIPO_CONTRATO)
      on delete restrict;

alter table GEC.GECTB346_CONTRATO_CREDITO
   add constraint GEC3F346 foreign key (NU_TIPO_CONDICAO_CONTRATO)
      references GEC.GECTB366_TIPO_CONDICAO_CTRTO 
(NU_TIPO_CONDICAO_CONTRATO)
      on delete restrict;

alter table GEC.GECTB346_CONTRATO_CREDITO
   add constraint GEC4F346 foreign key (NU_MODALIDADE_CONTRATO)
      references GEC.GECTB367_MODALIDADE_CONTRATO 
(NU_MODALIDADE_CONTRATO)
      on delete restrict;

alter table GEC.GECTB346_CONTRATO_CREDITO
   add constraint GEC5F346 foreign key (NU_TIPO_INDEXADOR_CONTRATO)
      references GEC.GECTB368_TIPO_INDEXADOR_CTRTO 
(NU_TIPO_INDEXADOR_CONTRATO)
      on delete restrict;

alter table GEC.GECTB346_CONTRATO_CREDITO
   add constraint GEC6F346 foreign key (NU_TIPO_COBRANCA_CONTRATO)
      references GEC.GECTB369_TIPO_COBRANCA_CTRTO 
(NU_TIPO_COBRANCA_CONTRATO)
      on delete restrict;

alter table GEC.GECTB346_CONTRATO_CREDITO
   add constraint GEC7F346 foreign key (NU_TIPO_SITUACAO, NU_SITUACAO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB347_GARANTIA_CTRTO_CRDTO
   add constraint GEC1F347 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO)
      references GEC.GECTB346_CONTRATO_CREDITO (NU_BASE_ELEGIVEL, 
NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB347_GARANTIA_CTRTO_CRDTO
   add constraint GEC2F347 foreign key (NU_TIPO_GARANTIA)
      references GEC.GECTB370_TIPO_GARANTIA (NU_TIPO_GARANTIA)
      on delete restrict;

alter table GEC.GECTB348_GARANTIA_FIADOR
   add constraint GEC1F348 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_GARANTIA, NU_TIPO_GARANTIA)
      references GEC.GECTB347_GARANTIA_CTRTO_CRDTO (NU_BASE_ELEGIVEL, 
NU_CREDITO, NU_GARANTIA, NU_TIPO_GARANTIA)
      on delete restrict;

alter table GEC.GECTB349_EVENTO_PRCFO_SUBLOTE
   add constraint GEC1F349 foreign key (NU_EVENTO_CESSAO)
      references GEC.GECTB345_EVENTO_CESSAO_PRCFO (NU_EVENTO_CESSAO)
      on delete restrict;

alter table GEC.GECTB374_CREDITO_ENVIO_ARQUIVO
   add constraint GEC1F374 foreign key (NU_ENVIO_ARQUIVO)
      references GEC.GECTB373_ENVIO_ARQUIVO (NU_ENVIO_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB374_CREDITO_ENVIO_ARQUIVO
   add constraint GEC2F374 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO)
      references GEC.GECTB304_CREDITO_ELGVL_CESSAO (NU_BASE_ELEGIVEL, 
NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB374_CREDITO_ENVIO_ARQUIVO
   add constraint GEC3F374 foreign key (NU_TIPO_SITUACAO, NU_SITUACAO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB377_CADASTRO_EMAIL
   add constraint GEC1F377 foreign key (NU_ETAPA_CESSAO)
      references GEC.GECTB353_ETAPA_CESSAO (NU_ETAPA_CESSAO)
      on delete restrict;

alter table GEC.GECTB377_CADASTRO_EMAIL
   add constraint GEC2F377 foreign key (NU_TIPO_MENSAGEM)
      references GEC.GECTB376_TIPO_MENSAGEM (NU_TIPO_MENSAGEM)
      on delete restrict;

alter table GEC.GECTB377_CADASTRO_EMAIL
   add constraint GEC3F377 foreign key (CO_NIVEL_SIGILO)
      references GEC.GECTB379_NIVEL_SIGILO (CO_NIVEL_SIGILO)
      on delete restrict;

alter table GEC.GECTB378_ENVIO_EMAIL
   add constraint GEC1F378 foreign key (NU_BASE_ELEGIVEL, 
NU_ETAPA_BASE_ELEGIVEL)
      references GEC.GECTB314_ETAPA_BASE_ELEGIVEL (NU_BASE_ELEGIVEL, 
NU_ETAPA_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB378_ENVIO_EMAIL
   add constraint GEC2F378 foreign key (NU_ETAPA_CESSAO, 
NU_TIPO_MENSAGEM)
      references GEC.GECTB377_CADASTRO_EMAIL (NU_ETAPA_CESSAO, 
NU_TIPO_MENSAGEM)
      on delete restrict;

alter table GEC.GECTB380_ARQUIVO_CESSAO
   add constraint GEC1F380 foreign key (NU_TIPO_SITUACAO, NU_SITUACAO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB380_ARQUIVO_CESSAO
   add constraint GEC2F380 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB380_ARQUIVO_CESSAO
   add constraint GEC3F380 foreign key (NU_TIPO_BASE_ELEGIVEL)
      references GEC.GECTB381_TIPO_BASE_ELEGIVEL (NU_TIPO_BASE_ELEGIVEL)

      on delete restrict;

alter table GEC.GECTB382_CNTLE_PRCNO_ARQVO_BSE
   add constraint GEC1F382 foreign key (NU_ARQUIVO_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB382_CNTLE_PRCNO_ARQVO_BSE
   add constraint GEC2F382 foreign key (NU_TIPO_PRCNO_ARQVO_BSE)
      references GEC.GECTB383_TIPO_PRCNO_ARQVO_BSE 
(NU_TIPO_PRCNO_ARQVO_BSE)
      on delete restrict;

alter table GEC.GECTB384_PRCSO_ARQUIVO_CESSAO
   add constraint GEC1F384 foreign key (NU_ARQUIVO_CESSAO)
      references GEC.GECTB380_ARQUIVO_CESSAO (NU_ARQUIVO_CESSAO)
      on delete restrict;

alter table GEC.GECTB384_PRCSO_ARQUIVO_CESSAO
   add constraint GEC2F384 foreign key (NU_PRCSO_EXEC_ROTINA, 
NU_EXECUCAO_ROTINA)
      references GEC.GECTB355_EXECUCAO_ROTINA (NU_PRCSO_EXEC_ROTINA, 
NU_EXECUCAO_ROTINA)
      on delete restrict;

alter table GEC.GECTB385_BOLETO_RECEBIMENTO
   add constraint GEC1F385 foreign key (NU_CESSAO_CREDITO)
      references GEC.GECTB311_CESSAO_CREDITO (NU_CESSAO_CREDITO)
      on delete restrict;

alter table GEC.GECTB385_BOLETO_RECEBIMENTO
   add constraint GEC2F385 foreign key (NU_TIPO_SITUACAO, NU_SITUACAO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB385_BOLETO_RECEBIMENTO
   add constraint GEC3F385 foreign key (NU_BASE_ELEGIVEL_CREDITO_CSO)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB386_ANEXO_BOLETO
   add constraint GEC1F386 foreign key (NU_CESSAO_CREDITO, 
NU_NOSSO_NUMERO)
      references GEC.GECTB385_BOLETO_RECEBIMENTO (NU_CESSAO_CREDITO, 
NU_NOSSO_NUMERO)
      on delete restrict;

alter table GEC.GECTB386_ANEXO_BOLETO
   add constraint GEC2F386 foreign key (NU_DOCUMENTO_CREDITO)
      references GEC.GECTB312_CESSAO_DOCUMENTO (NU_DOCUMENTO_CREDITO)
      on delete restrict;

alter table GEC.GECTB387_ROTEIRO_CONTABIL
   add constraint GEC1F387 foreign key (NU_TIPO_EVENTO_CONTABIL)
      references GEC.GECTB391_TIPO_EVENTO_CONTABIL 
(NU_TIPO_EVENTO_CONTABIL)
      on delete restrict;

alter table GEC.GECTB388_LANCAMENTO_CONTABIL
   add constraint GEC1F388 foreign key (NU_ROTEIRO_CONTABIL)
      references GEC.GECTB387_ROTEIRO_CONTABIL (NU_ROTEIRO_CONTABIL)
      on delete restrict;

alter table GEC.GECTB388_LANCAMENTO_CONTABIL
   add constraint GEC2F388 foreign key (NU_TIPO_SITUACAO, 
NU_SITUACAO_LNCTO_CNTBL)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB389_LNCTO_CNTBL_CSO_CRDTO
   add constraint GEC1F389 foreign key (NU_LANCAMENTO_CONTABIL)
      references GEC.GECTB388_LANCAMENTO_CONTABIL 
(NU_LANCAMENTO_CONTABIL)
      on delete restrict;

alter table GEC.GECTB389_LNCTO_CNTBL_CSO_CRDTO
   add constraint GEC2F389 foreign key (NU_CESSAO_CREDITO)
      references GEC.GECTB311_CESSAO_CREDITO (NU_CESSAO_CREDITO)
      on delete restrict;

alter table GEC.GECTB390_PGMNO_DVLCO_CSO_CRDTO
   add constraint GEC1F390 foreign key (NU_DOCUMENTO_CREDITO)
      references GEC.GECTB312_CESSAO_DOCUMENTO (NU_DOCUMENTO_CREDITO)
      on delete restrict;

alter table GEC.GECTB390_PGMNO_DVLCO_CSO_CRDTO
   add constraint GEC2F390 foreign key (NU_LANCAMENTO_CONTABIL)
      references GEC.GECTB388_LANCAMENTO_CONTABIL 
(NU_LANCAMENTO_CONTABIL)
      on delete restrict;

alter table GEC.GECTB393_FALHA_CADASTRAL_BSE
   add constraint GEC1F393 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB393_FALHA_CADASTRAL_BSE
   add constraint GEC2F393 foreign key (NU_FALHA_CADASTRAL)
      references GEC.GECTB394_FALHA_CADASTRAL (NU_FALHA_CADASTRAL)
      on delete restrict;

--==============================================================
-- Database: GECDB003
--==============================================================
create database GECDB003;

create lob tablespace GEC1L380
in GECDB003
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
gbpcache changed
logged
dssize 4 G
bufferpool BP10
close yes
compress no
lockmax 1
locksize lob;

create tablespace GECTS300
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS301
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS302
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS303
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS304
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS305
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS306
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS307
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS308
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS309
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS310
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS311
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS312
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS313
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS314
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS315
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS316
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS317
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS318
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS319
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS320
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS321
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS322
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS323
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS324
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS325
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS326
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS327
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS329
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS330
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS331
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS332
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS333
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS334
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS335
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS336
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS337
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS338
  IN GECDB003                                 
    USING STOGROUP SGDGEC00                     
    PRIQTY 480 SECQTY 480                       
    ERASE  NO                                   
    FREEPAGE 0 PCTFREE 0           
    GBPCACHE CHANGED                            
    TRACKMOD YES                                
    MAXPARTITIONS 2                             
    LOGGED                                      
    DSSIZE 64 G                                 
    SEGSIZE 32                                  
    BUFFERPOOL BP10                             
    LOCKSIZE ANY                                
    LOCKMAX SYSTEM                              
    CLOSE YES                                   
    COMPRESS YES                                
    CCSID      EBCDIC                           
    DEFINE YES                                  
    MAXROWS 255;

create tablespace GECTS339
in GECDB003
 using stogroup SGDGEC00
    priqty 48
    secqty 48
freepage 0
pctfree 5
gbpcache changed
 maxpartitions 2
bufferpool BP10
close yes
compress yes
lockmax system
locksize any
segsize 32;

create tablespace GECTS340
  IN GECDB003
    USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 5 
    GBPCACHE CHANGED
    TRACKMOD YES
    MAXPARTITIONS 2
    LOGGED
    DSSIZE 4 G
    SEGSIZE 32
    BUFFERPOOL BP10
    LOCKSIZE ANY
    LOCKMAX SYSTEM
    CLOSE YES
    COMPRESS YES
    CCSID      EBCDIC
    DEFINE YES
    MAXROWS 255;

create tablespace GECTS341
  IN GECDB003
    USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 5 
    GBPCACHE CHANGED
    TRACKMOD YES
    MAXPARTITIONS 2
    LOGGED
    DSSIZE 4 G
    SEGSIZE 32
    BUFFERPOOL BP10
    LOCKSIZE ANY
    LOCKMAX SYSTEM
    CLOSE YES
    COMPRESS YES
    CCSID      EBCDIC
    DEFINE YES
    MAXROWS 255;

create tablespace GECTS342
  IN GECDB003
    USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 5 
    GBPCACHE CHANGED
    TRACKMOD YES
    MAXPARTITIONS 2
    LOGGED
    DSSIZE 4 G
    SEGSIZE 32
    BUFFERPOOL BP10
    LOCKSIZE ANY
    LOCKMAX SYSTEM
    CLOSE YES
    COMPRESS YES
    CCSID      EBCDIC
    DEFINE YES
    MAXROWS 255;

create tablespace GECTS343
  IN GECDB003
    USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 5 
    GBPCACHE CHANGED
    TRACKMOD YES
    MAXPARTITIONS 2
    LOGGED
    DSSIZE 4 G
    SEGSIZE 32
    BUFFERPOOL BP10
    LOCKSIZE ANY
    LOCKMAX SYSTEM
    CLOSE YES
    COMPRESS YES
    CCSID      EBCDIC
    DEFINE YES
    MAXROWS 255;

create tablespace GECTS344
  IN GECDB003
    USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 5 
    GBPCACHE CHANGED
    TRACKMOD YES
    MAXPARTITIONS 2
    LOGGED
    DSSIZE 4 G
    SEGSIZE 32
    BUFFERPOOL BP10
    LOCKSIZE ANY
    LOCKMAX SYSTEM
    CLOSE YES
    COMPRESS YES
    CCSID      EBCDIC
    DEFINE YES
    MAXROWS 255;

create tablespace GECTS345
  IN GECDB003
    USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 5 
    GBPCACHE CHANGED
    TRACKMOD YES
    MAXPARTITIONS 2
    LOGGED
    DSSIZE 4 G
    SEGSIZE 32
    BUFFERPOOL BP10
    LOCKSIZE ANY
    LOCKMAX SYSTEM
    CLOSE YES
    COMPRESS YES
    CCSID      EBCDIC
    DEFINE YES
    MAXROWS 255;

create tablespace GECTS346
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 0 PCTFREE 0 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS347
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 0 PCTFREE 0 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS348
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 0 PCTFREE 0 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS349
in GECDB003
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 64G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress yes
lockmax system
locksize any
maxrows 255
segsize 32;

create tablespace GECTS350
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS351
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS352
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS353
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS354
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS355
IN GECDB003                             
USING STOGROUP SGDGEC00                 
PRIQTY 48 SECQTY 48                     
ERASE  NO                               
FREEPAGE 0 PCTFREE 0 FOR UPDATE 0       
GBPCACHE CHANGED                        
MAXPARTITIONS 2                         
DSSIZE 64 G                             
SEGSIZE 32                              
BUFFERPOOL BP10                         
LOCKSIZE ANY                            
LOCKMAX SYSTEM                          
CLOSE YES                               
COMPRESS YES                            
DEFINE YES                              
MAXROWS 255;

create tablespace GECTS356
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS357
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS358
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS359
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS360
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS361
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS362
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS363
  IN GECDB003                              
    USING STOGROUP SGDGEC00                  
    PRIQTY 480 SECQTY 480                      
    ERASE  NO                                
    FREEPAGE 0 PCTFREE 0        
    GBPCACHE CHANGED                         
    TRACKMOD YES                             
    MAXPARTITIONS 2                          
    LOGGED                                   
    DSSIZE 64 G                              
    SEGSIZE 32                               
    BUFFERPOOL BP10                          
    LOCKSIZE ANY                             
    LOCKMAX SYSTEM                           
    CLOSE YES                                
    COMPRESS YES                             
    CCSID      EBCDIC                        
    DEFINE YES                               
    MAXROWS 255;

create tablespace GECTS364
 IN GECDB003                          
   USING STOGROUP SGDGEC00              
   PRIQTY 480 SECQTY 480                  
   ERASE  NO                            
   FREEPAGE 0 PCTFREE 0 
   GBPCACHE CHANGED                     
   TRACKMOD YES                         
   MAXPARTITIONS 2                      
   LOGGED                               
   DSSIZE 64 G                          
   SEGSIZE 32                           
   BUFFERPOOL BP10                      
   LOCKSIZE ANY                         
   LOCKMAX SYSTEM                       
   CLOSE YES                            
   COMPRESS YES                         
   CCSID      EBCDIC                    
   DEFINE YES                           
   MAXROWS 255;

create tablespace GECTS365
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 0 PCTFREE 0 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS366
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 0 PCTFREE 0 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS367
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 0 PCTFREE 0 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS368
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 0 PCTFREE 0 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS369
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 0 PCTFREE 0 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS370
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 0 PCTFREE 0 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS371
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 5 PCTFREE 10 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS372
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 5 PCTFREE 10 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS373
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 5 PCTFREE 10 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS374
IN GECDB003
USING STOGROUP SGDGEC00
PRIQTY 48 SECQTY 48
ERASE  NO
FREEPAGE 5 PCTFREE 10 
GBPCACHE CHANGED
TRACKMOD YES
MAXPARTITIONS 2
LOGGED
DSSIZE 64G
SEGSIZE 32
BUFFERPOOL BP10
LOCKSIZE ANY
LOCKMAX SYSTEM
CLOSE YES
COMPRESS YES
CCSID EBCDIC
DEFINE YES
MAXROWS 255;

create tablespace GECTS375
IN GECDB003                         
USING STOGROUP SGDGEC00             
PRIQTY 48 SECQTY 48                 
ERASE  NO                           
FREEPAGE 5 PCTFREE 10 FOR UPDATE 0  
GBPCACHE CHANGED                    
TRACKMOD YES                        
MAXPARTITIONS 2                     
LOGGED                              
DSSIZE 64 G                         
SEGSIZE 32                          
BUFFERPOOL BP10                     
LOCKSIZE ANY                        
LOCKMAX SYSTEM                      
CLOSE YES                           
COMPRESS YES                        
CCSID      EBCDIC   
DEFINE YES          
MAXROWS 255;

create tablespace GECTS376
IN GECDB003                         
USING STOGROUP SGDGEC00             
PRIQTY 48 SECQTY 48                 
ERASE  NO                           
FREEPAGE 5 PCTFREE 10 
GBPCACHE CHANGED                    
TRACKMOD YES                        
MAXPARTITIONS 2                     
LOGGED                              
DSSIZE 64 G                         
SEGSIZE 32                          
BUFFERPOOL BP10                     
LOCKSIZE ANY                        
LOCKMAX SYSTEM                      
CLOSE YES                           
COMPRESS YES                        
CCSID      EBCDIC   
DEFINE YES          
MAXROWS 255;

create tablespace GECTS377
IN GECDB003                         
USING STOGROUP SGDGEC00             
PRIQTY 48 SECQTY 48                 
ERASE  NO                           
FREEPAGE 5 PCTFREE 10 
GBPCACHE CHANGED                    
TRACKMOD YES                        
MAXPARTITIONS 2                     
LOGGED                              
DSSIZE 64 G                         
SEGSIZE 32                          
BUFFERPOOL BP10                     
LOCKSIZE ANY                        
LOCKMAX SYSTEM                      
CLOSE YES                           
COMPRESS YES                        
CCSID      EBCDIC   
DEFINE YES          
MAXROWS 255;

create tablespace GECTS378
IN GECDB003                         
USING STOGROUP SGDGEC00             
PRIQTY 48 SECQTY 48                 
ERASE  NO                           
FREEPAGE 5 PCTFREE 10 FOR UPDATE 0  
GBPCACHE CHANGED                    
TRACKMOD YES                        
MAXPARTITIONS 2                     
LOGGED                              
DSSIZE 64 G                         
SEGSIZE 32                          
BUFFERPOOL BP10                     
LOCKSIZE ANY                        
LOCKMAX SYSTEM                      
CLOSE YES                           
COMPRESS YES                        
CCSID      EBCDIC   
DEFINE YES          
MAXROWS 255;

create tablespace GECTS379
IN GECDB003                         
USING STOGROUP SGDGEC00             
PRIQTY 48 SECQTY 48                 
ERASE  NO                           
FREEPAGE 5 PCTFREE 10 
GBPCACHE CHANGED                    
TRACKMOD YES                        
MAXPARTITIONS 2                     
LOGGED                              
DSSIZE 64 G                         
SEGSIZE 32                          
BUFFERPOOL BP10                     
LOCKSIZE ANY                        
LOCKMAX SYSTEM                      
CLOSE YES                           
COMPRESS YES                        
CCSID      EBCDIC   
DEFINE YES          
MAXROWS 255;

create tablespace GECTS380
in GECDB003
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5 for update 0
gbpcache changed
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
maxrows 255
segsize 32;

create tablespace GECTS381
in GECDB003
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5 for update 0
gbpcache changed
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
maxrows 255
segsize 32;

create tablespace GECTS382
in GECDB003
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5 for update 0
gbpcache changed
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
maxrows 255
segsize 32;

create tablespace GECTS383
in GECDB003
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5 for update 0
gbpcache changed
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
maxrows 255
segsize 32;

create tablespace GECTS384
    IN GECDB003                       
    USING STOGROUP SGDDB201           
    PRIQTY 480 SECQTY 480               
    ERASE  NO                         
    FREEPAGE 0 PCTFREE 5 FOR UPDATE 0 
    GBPCACHE CHANGED                  
    TRACKMOD YES                      
    MAXPARTITIONS 2                   
    LOGGED                            
    DSSIZE 4 G                        
    SEGSIZE 32                        
    BUFFERPOOL BP10                   
    LOCKSIZE ANY                      
    LOCKMAX SYSTEM                    
    CLOSE YES                         
    COMPRESS NO                       
    CCSID      EBCDIC                 
    DEFINE YES                        
    MAXROWS 255;

create tablespace GECTS385
    IN GECDB003                       
    USING STOGROUP SGDDB201           
    PRIQTY 480 SECQTY 480               
    ERASE  NO                         
    FREEPAGE 10 PCTFREE 10 FOR UPDATE 10 
    GBPCACHE CHANGED                  
    TRACKMOD YES                      
    MAXPARTITIONS 2                   
    LOGGED                            
    DSSIZE 64 G                        
    SEGSIZE 64                        
    BUFFERPOOL BP10                   
    LOCKSIZE ANY                      
    LOCKMAX SYSTEM                    
    CLOSE YES                         
    COMPRESS YES                     
    CCSID      EBCDIC                 
    DEFINE YES                        
    MAXROWS 255;

create tablespace GECTS386
    IN GECDB003                       
    USING STOGROUP SGDDB201           
    PRIQTY 480 SECQTY 480               
    ERASE  NO                         
    FREEPAGE 10 PCTFREE 10 FOR UPDATE 10 
    GBPCACHE CHANGED                  
    TRACKMOD YES                      
    MAXPARTITIONS 2                   
    LOGGED                            
    DSSIZE 64 G                        
    SEGSIZE 64                        
    BUFFERPOOL BP10                   
    LOCKSIZE ANY                      
    LOCKMAX SYSTEM                    
    CLOSE YES                         
    COMPRESS YES                       
    CCSID      EBCDIC                 
    DEFINE YES                        
    MAXROWS 255;

create tablespace GECTS388
in GECDB003
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
dssize 64 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress yes
lockmax system
locksize any
maxrows 255
segsize 64;

create tablespace GECTS389
in GECDB003
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
logged
trackmod yes
dssize 64 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress yes
lockmax system
locksize any
maxrows 255
segsize 64;

create tablespace GECTS390
in GECDB003
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
logged
trackmod yes
dssize 64 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress yes
lockmax system
locksize any
maxrows 255
segsize 64;

create tablespace GECTS391
   IN GECDB003                          
    USING STOGROUP SGDDB201              
    PRIQTY 48 SECQTY 48                  
    ERASE  NO                            
    FREEPAGE 10 PCTFREE 10 
    GBPCACHE CHANGED                     
    TRACKMOD YES                         
    MAXPARTITIONS 2                      
    LOGGED                               
    DSSIZE 64 G                          
    SEGSIZE 64                           
    BUFFERPOOL BP10                      
    LOCKSIZE ANY                         
    LOCKMAX SYSTEM                       
    CLOSE YES                            
    COMPRESS YES                         
    CCSID      EBCDIC                    
    DEFINE YES                           
    MAXROWS 255;

create tablespace GECTS393
   IN GECDB003                          
    USING STOGROUP SGDDB201              
    PRIQTY 48 SECQTY 48                  
    ERASE  NO                            
    FREEPAGE 10 PCTFREE 10 
    GBPCACHE CHANGED                     
    TRACKMOD YES                         
    MAXPARTITIONS 2                      
    LOGGED                               
    DSSIZE 64 G                          
    SEGSIZE 64                           
    BUFFERPOOL BP10                      
    LOCKSIZE ANY                         
    LOCKMAX SYSTEM                       
    CLOSE YES                            
    COMPRESS YES                         
    CCSID      EBCDIC                    
    DEFINE YES                           
    MAXROWS 255;

create tablespace GECTS394
   IN GECDB003                          
    USING STOGROUP SGDDB201              
    PRIQTY 48 SECQTY 48                  
    ERASE  NO                            
    FREEPAGE 10 PCTFREE 10 
    GBPCACHE CHANGED                     
    TRACKMOD YES                         
    MAXPARTITIONS 2                      
    LOGGED                               
    DSSIZE 64 G                          
    SEGSIZE 64                           
    BUFFERPOOL BP10                      
    LOCKSIZE ANY                         
    LOCKMAX SYSTEM                       
    CLOSE YES                            
    COMPRESS YES                         
    CCSID      EBCDIC                    
    DEFINE YES                           
    MAXROWS 255;

--==============================================================
-- Table: GECTB300_PROPONENTE
--==============================================================
create table GEC.GECTB300_PROPONENTE (
   NU_CNPJ_PROPONENTE   DECIMAL(14,0)         
      not null
      generated by default as identity
      (
          start with 36699663000195
          increment by 1
       cache 20
           no cycle
       maxvalue 99999999999999
       minvalue 36699663000195
           no order
      ),
   NU_TIPO_SITUACAO_PROPONENTE DECIMAL(3,0)          
      not null,
   NU_SITUACAO_PROPONENTE DECIMAL(3,0)          
      not null,
   DT_SITUACAO_PROPONENTE DATE                  
      not null,
   NO_RAZAO_SOCIAL      VARCHAR(200)          
      not null,
   IC_CADASTRO_BASICO_COMPLETO CHAR(1)               
      not null with default 'N'
         constraint GEC1C300 check (IC_CADASTRO_BASICO_COMPLETO in ('S',
'N')),
   IC_ENDERECO_COMPLETO CHAR(1)               
      not null with default 'N'
         constraint GEC2C300 check (IC_ENDERECO_COMPLETO in ('S','N')),

   IC_RESPONSAVEL_COMPLETO CHAR(1)               
      not null with default 'N'
         constraint GEC3C300 check (IC_RESPONSAVEL_COMPLETO in ('S','N'
)),
   IC_DOCUMENTO_COMPLETO CHAR(1)               
      not null with default 'N'
         constraint GEC4C300 check (IC_DOCUMENTO_COMPLETO in ('S','N')),

   DE_JUSTIFICATIVA_HABILITACAO VARCHAR(240),
   NU_SITUACAO_ESPECIAL SMALLINT,
   NU_AGENCIA_CONTA_CORRENTE SMALLINT,
   NU_AGENCIA_DV        SMALLINT,
   NU_PRODUTO_CONTA_CORRENTE SMALLINT,
   NU_CONTA_CORRENTE    DECIMAL(12,0),
   NU_CONTA_DV          SMALLINT,
   CO_CNPJ_PROPONENTE   CHAR(14)              
      not null with default,
   constraint GECPK300 primary key (NU_CNPJ_PROPONENTE)  
)
 in GECDB003.GECTS300;

label on table GEC.GECTB300_PROPONENTE is 'PROPONENTE';
label on column GEC.GECTB300_PROPONENTE.NU_AGENCIA_DV is 
'NU_AGENCIA_DIGITO_VERIFICADOR';
label on column GEC.GECTB300_PROPONENTE.NU_CONTA_DV is 
'NU_CONTA_DIGITO_VERIFICADOR';
--==============================================================
-- Index: GEC1I300
--==============================================================
create unique index GEC.GEC1I300 on GEC.GECTB300_PROPONENTE (
   NU_CNPJ_PROPONENTE   ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB301_LOTE_CESSAO
--==============================================================
create table GEC.GECTB301_LOTE_CESSAO (
   NU_LOTE_CESSAO       DECIMAL(7,0)          
      not null,
   DE_LOTE_CESSAO       VARCHAR(100)          
      not null,
   constraint GECPK301 primary key (NU_LOTE_CESSAO)  
)
 in GECDB003.GECTS301;

label on table GEC.GECTB301_LOTE_CESSAO is 'LOTE_CESSAO';

--==============================================================
-- Index: GEC1I301
--==============================================================
create unique index GEC.GEC1I301 on GEC.GECTB301_LOTE_CESSAO (
   NU_LOTE_CESSAO       ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB302_BASE_ELEGIVEL_CESSAO
--==============================================================
create table GEC.GECTB302_BASE_ELEGIVEL_CESSAO (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_SISTEMA_ORIGEM_CREDITO SMALLINT              
      not null,
   DT_GERACAO_BASE_ELEGIVEL DATE                  
      not null,
   DT_REFERENCIA_SITUACAO_CREDITO DATE                  
      not null,
   QT_REGISTRO_CREDITO  DECIMAL(7,0)          
      not null,
   VR_REGISTRO_CREDITO  DECIMAL(17,2),
   QT_REGISTRO_REJEITADO DECIMAL(7,0)          
      not null,
   VR_REGISTRO_REJEITADO DECIMAL(17,2),
   CO_TRANSACAO_REPOSITORIO VARCHAR(100),
   QT_CREDITO_CESSAO_DESFEITA INTEGER,
   NU_TIPO_BASE_ELEGIVEL SMALLINT              
      not null with default 1,
   IC_FILTRO_PENDENTE   CHAR(1)               
      not null with default 'N'
         constraint GEC1C302 check (IC_FILTRO_PENDENTE in ('S','N')),
   SG_SISTEMA_ORIGEM_CREDITO CHAR(5),
   constraint GECPK302 primary key (NU_BASE_ELEGIVEL)  
)
 in GECDB003.GECTS302;

label on table GEC.GECTB302_BASE_ELEGIVEL_CESSAO is 
'BASE_ELEGIVEL_CESSAO';
label on column 
GEC.GECTB302_BASE_ELEGIVEL_CESSAO.CO_TRANSACAO_REPOSITORIO is 
'CO_TRANSACAO_CESSAO_REPOSITORIO';
--==============================================================
-- Index: GEC1I302
--==============================================================
create unique index GEC.GEC1I302 on GEC.GECTB302_BASE_ELEGIVEL_CESSAO (

   NU_BASE_ELEGIVEL     ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Index: GEC3I302
--==============================================================
create index GEC.GEC3I302 on GEC.GECTB302_BASE_ELEGIVEL_CESSAO (
   DT_GERACAO_BASE_ELEGIVEL ASC
)
USING STOGROUP SGDGEC00    
PRIQTY 48 SECQTY 48        
ERASE  YES                 
FREEPAGE 0 PCTFREE 0       
GBPCACHE CHANGED                          
COMPRESS NO                
INCLUDE NULL KEYS          
BUFFERPOOL BP11            
CLOSE YES                  
COPY NO                    
DEFER NO                   
DEFINE YES                 
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB303_SUBLOTE_BASE_ELEGIVEL
--==============================================================
create table GEC.GECTB303_SUBLOTE_BASE_ELEGIVEL (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_SUBLOTE_BASE_ELEGIVEL DECIMAL(10,0)         
      not null,
   constraint GECPK303 primary key (NU_BASE_ELEGIVEL, 
NU_SUBLOTE_BASE_ELEGIVEL)  
)
 in GECDB003.GECTS303;

label on table GEC.GECTB303_SUBLOTE_BASE_ELEGIVEL is 
'SUBLOTE_BASE_ELEGIVEL';

--==============================================================
-- Index: GEC1I303
--==============================================================
create unique index GEC.GEC1I303 on GEC.GECTB303_SUBLOTE_BASE_ELEGIVEL (

   NU_BASE_ELEGIVEL     ASC,
   NU_SUBLOTE_BASE_ELEGIVEL ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB304_CREDITO_ELGVL_CESSAO
--==============================================================
create table GEC.GECTB304_CREDITO_ELGVL_CESSAO (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_TIPO_CREDITO      DECIMAL(3,0)          
      not null,
   NU_PRODUTO_CREDITO   DECIMAL(4,0),
   DT_ULTIMO_PAGAMENTO  DATE                  
      not null,
   QT_DIA_ATRASO        DECIMAL(5,0)          
      not null,
   VR_LANCADO_CREDITO_ATRASO DECIMAL(17,2)         
      not null,
   DT_LANCADO_CREDITO_ATRASO DATE                  
      not null,
   DT_NEGATIVACAO_SERASA DATE,
   DT_NEGATIVACAO_SCPC  DATE,
   PC_RENDA_SOBRE_CREDITO_ATRASO DECIMAL(5,2),
   VR_RENDA_SOBRE_CREDITO_ATRASO DECIMAL(17,2),
   NU_AGENCIA_DETENTORA DECIMAL(4,0)          
      not null,
   NU_TIPO_SITUACAO_CREDITO DECIMAL(3,0)          
      not null,
   NU_SITUACAO_CREDITO  DECIMAL(3,0)          
      not null,
   NU_SUBLOTE_BASE_ELEGIVEL DECIMAL(10,0)         
      not null,
   DE_JUSTIFICATIVA_EXCLUSAO VARCHAR(100),
   CO_USUARIO           CHAR(7),
   TS_EXCLUSAO_USUARIO  TIMESTAMP,
   NU_SISTEMA_ORIGEM_CREDITO SMALLINT,
   constraint GECPK304 primary key (NU_BASE_ELEGIVEL, NU_CREDITO)  
)
 in GECDB003.GECTS304;

label on table GEC.GECTB304_CREDITO_ELGVL_CESSAO is 
'CREDITO_ELEGIVEL_CESSAO';

--==============================================================
-- Index: GEC1I304
--==============================================================
create unique index GEC.GEC1I304 on GEC.GECTB304_CREDITO_ELGVL_CESSAO (

   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I304
--==============================================================
create index GEC.GEC2I304 on GEC.GECTB304_CREDITO_ELGVL_CESSAO (
   NU_TIPO_SITUACAO_CREDITO ASC,
   NU_SITUACAO_CREDITO  ASC
)
USING STOGROUP SGDGEC00    
PRIQTY 48 SECQTY 48        
ERASE  YES                 
FREEPAGE 0 PCTFREE 0       
GBPCACHE CHANGED                          
COMPRESS NO                
INCLUDE NULL KEYS          
BUFFERPOOL BP11            
CLOSE YES                  
COPY NO                    
DEFER NO                   
DEFINE YES                 
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB305_CARTAO_CREDITO
--==============================================================
create table GEC.GECTB305_CARTAO_CREDITO (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_CONTA_CREDITO     DECIMAL(12,0)         
      not null,
   NU_ULTIMA_VIA_CARTAO CHAR(16),
   CO_BANDEIRA_CARTAO   CHAR(1),
   CO_VARIANTE_CARTAO   CHAR(1),
   DT_APROVACAO_CARTAO  DATE,
   DT_DESBLOQUEIO_CARTAO DATE,
   DD_VENCIMENTO_FATURA_CARTAO DECIMAL(2,0),
   VR_LIMITE_CREDITO    DECIMAL(17,2),
   NU_TIPO_SITUACAO_CARTAO DECIMAL(3,0)          
      not null,
   NU_SITUACAO_CARTAO   DECIMAL(3,0)          
      not null,
   constraint GECPK305 primary key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_CONTA_CREDITO)  
)
 in GECDB003.GECTS305;

label on table GEC.GECTB305_CARTAO_CREDITO is 'CARTAO_CREDITO';

--==============================================================
-- Index: GEC1I305
--==============================================================
create unique index GEC.GEC1I305 on GEC.GECTB305_CARTAO_CREDITO (
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC,
   NU_CONTA_CREDITO     ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I305
--==============================================================
create index GEC.GEC2I305 on GEC.GECTB305_CARTAO_CREDITO (
   NU_CONTA_CREDITO     ASC
)
USING STOGROUP SGDGEC00    
PRIQTY 48 SECQTY 48        
ERASE  YES                 
FREEPAGE 0 PCTFREE 0       
GBPCACHE CHANGED                          
COMPRESS NO                
INCLUDE NULL KEYS          
BUFFERPOOL BP11            
CLOSE YES                  
COPY NO                    
DEFER NO                   
DEFINE YES                 
PIECESIZE 32 G;

--==============================================================
-- Index: GEC3I305
--==============================================================
create index GEC.GEC3I305 on GEC.GECTB305_CARTAO_CREDITO (
   NU_TIPO_SITUACAO_CARTAO ASC,
   NU_SITUACAO_CARTAO   ASC
)
USING STOGROUP SGDGEC00    
PRIQTY 48 SECQTY 48        
ERASE  YES                 
FREEPAGE 0 PCTFREE 0       
GBPCACHE CHANGED                          
COMPRESS NO                
INCLUDE NULL KEYS          
BUFFERPOOL BP11            
CLOSE YES                  
COPY NO                    
DEFER NO                   
DEFINE YES                 
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB306_PESSOA
--==============================================================
create table GEC.GECTB306_PESSOA (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_PESSOA            DECIMAL(2,0)          
      not null,
   IC_TIPO_PESSOA       CHAR(1)               
      not null
         constraint GEC1C306 check (IC_TIPO_PESSOA in ('F','J')),
   CO_ENDERECO_EMAIL    VARCHAR(100),
   NU_DDD_CELULAR       DECIMAL(4,0),
   NU_TELEFONE_CELULAR  DECIMAL(12,0),
   IC_ENDERECO_CORRESPONDENCIA CHAR(1)               
      not null default 'R'
         constraint GEC2C306 check (IC_ENDERECO_CORRESPONDENCIA in ('R',
'C')),
   constraint GECPK306 primary key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA)  
)
 in GECDB003.GECTS306;

label on table GEC.GECTB306_PESSOA is 'PESSOA';

--==============================================================
-- Index: GEC1I306
--==============================================================
create unique index GEC.GEC1I306 on GEC.GECTB306_PESSOA (
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC,
   NU_PESSOA            ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB307_PESSOA_FISICA
--==============================================================
create table GEC.GECTB307_PESSOA_FISICA (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_PESSOA            DECIMAL(2,0)          
      not null,
   NU_CPF               DECIMAL(11,0)         
      not null,
   NO_PESSOA            VARCHAR(100),
   DT_NASCIMENTO        DATE,
   NO_MAE               VARCHAR(100),
   VR_RENDA_DECLARADA   DECIMAL(17,2),
   CO_PROFISSAO         DECIMAL(3,0),
   NO_PROFISSAO         VARCHAR(40),
   constraint GECPK307 primary key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA)  
)
 in GECDB003.GECTS307;

label on table GEC.GECTB307_PESSOA_FISICA is 'PESSOA_FISICA';

--==============================================================
-- Index: GEC1I307
--==============================================================
create unique index GEC.GEC1I307 on GEC.GECTB307_PESSOA_FISICA (
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC,
   NU_PESSOA            ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB308_PESSOA_JURIDICA
--==============================================================
create table GEC.GECTB308_PESSOA_JURIDICA (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_PESSOA            DECIMAL(2,0)          
      not null,
   NU_CNPJ              DECIMAL(14,0)         
      not null,
   NO_RAZAO_SOCIAL      VARCHAR(200),
   DT_ABERTURA_EMPRESA  DATE,
   VR_FATURAMENTO_MENSAL DECIMAL(17,2),
   CO_CNPJ_CLIENTE      CHAR(14)              
      not null with default,
   constraint GECPK308 primary key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA)  
)
 in GECDB003.GECTS308;

label on table GEC.GECTB308_PESSOA_JURIDICA is 'PESSOA_JURIDICA';

--==============================================================
-- Index: GEC1I308
--==============================================================
create unique index GEC.GEC1I308 on GEC.GECTB308_PESSOA_JURIDICA (
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC,
   NU_PESSOA            ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB309_ENDERECO
--==============================================================
create table GEC.GECTB309_ENDERECO (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_PESSOA            DECIMAL(2,0)          
      not null,
   IC_TIPO_ENDERECO     CHAR(1)               
      not null with default 'R'
         constraint GEC1C309 check (IC_TIPO_ENDERECO in ('R','C')),
   NU_ENDERECO          DECIMAL(1)            
      not null,
   NO_LOGRADOURO        VARCHAR(100),
   NO_BAIRRO            VARCHAR(100),
   NO_CIDADE            VARCHAR(100),
   SG_UF                CHAR(2),
   NU_CEP               DECIMAL(8,0),
   NU_DDD_TELEFONE      DECIMAL(4,0),
   NU_TELEFONE          DECIMAL(12,0),
   constraint GECPK309 primary key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA, NU_ENDERECO, IC_TIPO_ENDERECO)  
)
 in GECDB003.GECTS309;

label on table GEC.GECTB309_ENDERECO is 'ENDERECO';

--==============================================================
-- Index: GEC1I309
--==============================================================
create unique index GEC.GEC1I309 on GEC.GECTB309_ENDERECO (
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC,
   NU_PESSOA            ASC,
   NU_ENDERECO          ASC,
   IC_TIPO_ENDERECO     ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB310_SOCIO_PESSOA_JURIDICA
--==============================================================
create table GEC.GECTB310_SOCIO_PESSOA_JURIDICA (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_PESSOA            DECIMAL(2,0)          
      not null,
   NU_SOCIO             DECIMAL(1,0)          
      not null,
   NU_CPF_CNPJ_SOCIO    DECIMAL(14,0)         
      not null,
   NO_SOCIO             VARCHAR(40)           
      not null,
   IC_TIPO_PESSOA_SOCIO CHAR(1)               
      not null with default 'F'
         constraint GEC1C310 check (IC_TIPO_PESSOA_SOCIO in ('F','J')),

   CO_CPF_CNPJ_SOCIO    CHAR(14)              
      not null with default,
   constraint GECPK310 primary key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA, NU_SOCIO)  
)
 in GECDB003.GECTS310;

label on table GEC.GECTB310_SOCIO_PESSOA_JURIDICA is 
'SOCIO_PESSOA_JURIDICA';

--==============================================================
-- Index: GEC1I310
--==============================================================
create unique index GEC.GEC1I310 on GEC.GECTB310_SOCIO_PESSOA_JURIDICA (

   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC,
   NU_PESSOA            ASC,
   NU_SOCIO             ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB311_CESSAO_CREDITO
--==============================================================
create table GEC.GECTB311_CESSAO_CREDITO (
   NU_CESSAO_CREDITO    DECIMAL(7,0)          
      not null
      generated by default as identity
      (
          start with 23
          increment by 1
       no cache
           no cycle
       maxvalue 9999999
       minvalue 1
      ),
   NU_CNPJ_CESSIONARIO  DECIMAL(14,0)         
      not null,
   IC_TIPO_CESSAO_CREDITO CHAR(1)               
      not null
         constraint GEC1C311 check (IC_TIPO_CESSAO_CREDITO in ('L','B',
'S')),
   DT_CESSAO_CREDITO    DATE                  
      not null,
   VR_TOTAL_CESSAO_CREDITO DECIMAL(17,2)         
      not null,
   VR_EFETIVO_CESSAO_CREDITO DECIMAL(17,2),
   PC_CESSAO_CREDITO    DECIMAL(17,14),
   VR_SALDO_A_DEVOLVER  DECIMAL(17,2),
   constraint GECPK311 primary key (NU_CESSAO_CREDITO)  
)
 in GECDB003.GECTS311;

label on table GEC.GECTB311_CESSAO_CREDITO is 'CESSAO_CREDITO';

--==============================================================
-- Index: GEC1I311
--==============================================================
create unique index GEC.GEC1I311 on GEC.GECTB311_CESSAO_CREDITO (
   NU_CESSAO_CREDITO    ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB312_CESSAO_DOCUMENTO
--==============================================================
create table GEC.GECTB312_CESSAO_DOCUMENTO (
   NU_DOCUMENTO_CREDITO Decimal(11)           
      not null
      generated by default as identity
      (
          start with 25
          increment by 1
       no cache
           no cycle
       maxvalue 99999999999
       minvalue 1
      ),
   NU_CESSAO_CREDITO    DECIMAL(7,0),
   DT_INCLUSAO_DOCUMENTO DATE                  
      not null,
   DE_DOCUMENTO_PROPONENTE VARCHAR(200),
   NO_ARQVO_DOCUMENTO_PROPONENTE VARCHAR(100),
   NU_ENDERECO_REPOSITORIO DECIMAL(14,0),
   TS_INCLUSAO_USUARIO  TIMESTAMP             
      not null,
   CO_USUARIO           CHAR(7),
   NU_TIPO_DOCUMENTO    SMALLINT,
   CO_ENDERECO_REPOSITORIO VARCHAR(100),
   constraint GECPK312 primary key (NU_DOCUMENTO_CREDITO)  
)
 in GECDB003.GECTS312;

label on table GEC.GECTB312_CESSAO_DOCUMENTO is 'CESSAO_DOCUMENTO';
label on column GEC.GECTB312_CESSAO_DOCUMENTO.DE_DOCUMENTO_PROPONENTE is
 'DE_DOCUMENTO';
label on column 
GEC.GECTB312_CESSAO_DOCUMENTO.NO_ARQVO_DOCUMENTO_PROPONENTE is 
'NO_ARQUIVO_DOCUMENTO_PROPONENTE';
--==============================================================
-- Index: GEC1I312
--==============================================================
create unique index GEC.GEC1I312 on GEC.GECTB312_CESSAO_DOCUMENTO (
   NU_DOCUMENTO_CREDITO ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB313_SITUACAO_BASE_ELGVL
--==============================================================
create table GEC.GECTB313_SITUACAO_BASE_ELGVL (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_SITUACAO          DECIMAL(4,0)          
      not null,
   NU_TIPO_SITUACAO_BASE_ELEGIVEL DECIMAL(3,0)          
      not null,
   NU_SITUACAO_BASE_ELEGIVEL DECIMAL(3,0)          
      not null,
   DT_SITUACAO_BASE_ELEGIVEL DATE                  
      not null,
   DE_JSTVA_REVERSAO_STCO VARCHAR(200),
   constraint GECPK313 primary key (NU_BASE_ELEGIVEL, NU_SITUACAO)  
)
 in GECDB003.GECTS313;

label on table GEC.GECTB313_SITUACAO_BASE_ELGVL is 
'SITUACAO_BASE_ELEGIVEL';
label on column GEC.GECTB313_SITUACAO_BASE_ELGVL.DE_JSTVA_REVERSAO_STCO 
is 'DE_JUSTIFICATIVA_REVERSAO_SITUACAO';
--==============================================================
-- Index: GEC1I313
--==============================================================
create unique index GEC.GEC1I313 on GEC.GECTB313_SITUACAO_BASE_ELGVL (
   NU_BASE_ELEGIVEL     ASC,
   NU_SITUACAO          ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB314_ETAPA_BASE_ELEGIVEL
--==============================================================
create table GEC.GECTB314_ETAPA_BASE_ELEGIVEL (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_ETAPA_BASE_ELEGIVEL DECIMAL(3,0)          
      not null,
   NU_ETAPA_CESSAO      DECIMAL(2,0)          
      not null,
   DT_ENTRADA_ETAPA_CESSAO DATE                  
      not null,
   constraint GECPK314 primary key (NU_BASE_ELEGIVEL, 
NU_ETAPA_BASE_ELEGIVEL)  
)
 in GECDB003.GECTS314;

label on table GEC.GECTB314_ETAPA_BASE_ELEGIVEL is 'ETAPA_BASE_ELEGIVEL'
;

--==============================================================
-- Index: GEC1I314
--==============================================================
create unique index GEC.GEC1I314 on GEC.GECTB314_ETAPA_BASE_ELEGIVEL (
   NU_BASE_ELEGIVEL     ASC,
   NU_ETAPA_BASE_ELEGIVEL ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I314
--==============================================================
create index GEC.GEC2I314 on GEC.GECTB314_ETAPA_BASE_ELEGIVEL (
   NU_ETAPA_CESSAO      ASC
)
USING STOGROUP SGDGEC00    
PRIQTY 48 SECQTY 48        
ERASE  YES                 
FREEPAGE 0 PCTFREE 0       
GBPCACHE CHANGED                          
COMPRESS NO                
INCLUDE NULL KEYS          
BUFFERPOOL BP11            
CLOSE YES                  
COPY NO                    
DEFER NO                   
DEFINE YES                 
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB315_DOCUMENTO_PROPONENTE
--==============================================================
create table GEC.GECTB315_DOCUMENTO_PROPONENTE (
   NU_CNPJ_PROPONENTE   DECIMAL(14,0)         
      not null,
   NU_ETAPA_PROPONENTE  DECIMAL(2)            
      not null,
   NU_DOCUMENTO_NECESSARIO DECIMAL(3)            
      not null,
   NU_TIPO_SITUACAO_DOCUMENTO DECIMAL(3,0)          
      not null,
   NU_SITUACAO_DOCUMENTO DECIMAL(3,0)          
      not null,
   NU_TIPO_DOCUMENTO    SMALLINT,
   DT_SITUACAO_DOCUMENTO DATE                  
      not null,
   DT_VALIDADE_DOCUMENTO DATE,
   constraint GECPK315 primary key (NU_CNPJ_PROPONENTE, 
NU_ETAPA_PROPONENTE, NU_DOCUMENTO_NECESSARIO)  
)
 in GECDB003.GECTS315;

label on table GEC.GECTB315_DOCUMENTO_PROPONENTE is 
'DOCUMENTO_PROPONENTE';

--==============================================================
-- Index: GEC1I315
--==============================================================
create unique index GEC.GEC1I315 on GEC.GECTB315_DOCUMENTO_PROPONENTE (

   NU_CNPJ_PROPONENTE   ASC,
   NU_ETAPA_PROPONENTE  ASC,
   NU_DOCUMENTO_NECESSARIO ASC
)
USING STOGROUP SGDGEC00        
PRIQTY 480 SECQTY 480          
ERASE  YES                     
FREEPAGE 0 PCTFREE 0           
GBPCACHE CHANGED               
CLUSTER                        
COMPRESS NO                    
INCLUDE NULL KEYS              
BUFFERPOOL BP11                
CLOSE YES                      
COPY NO                        
DEFER NO                       
DEFINE YES                     
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB316_DOCUMENTO_ADICIONAL
--==============================================================
create table GEC.GECTB316_DOCUMENTO_ADICIONAL (
   NU_CNPJ_PROPONENTE   DECIMAL(14,0)         
      not null,
   NU_ETAPA_PROPONENTE  DECIMAL(2)            
      not null,
   NU_DOCUMENTO_NECESSARIO DECIMAL(3)            
      not null,
   DE_DOCUMENTO_ADICIONAL VARCHAR(100),
   IC_PRAZO_VALIDADE_DOCUMENTO CHAR(1)               
      not null
         constraint GEC1C316 check (IC_PRAZO_VALIDADE_DOCUMENTO in ('S',
'N')),
   constraint GECPK316 primary key (NU_CNPJ_PROPONENTE, 
NU_ETAPA_PROPONENTE, NU_DOCUMENTO_NECESSARIO)  
)
 in GECDB003.GECTS316;

label on table GEC.GECTB316_DOCUMENTO_ADICIONAL is 'DOCUMENTO_ADICIONAL'
;

--==============================================================
-- Index: GEC1I316
--==============================================================
create unique index GEC.GEC1I316 on GEC.GECTB316_DOCUMENTO_ADICIONAL (
   NU_CNPJ_PROPONENTE   ASC,
   NU_ETAPA_PROPONENTE  ASC,
   NU_DOCUMENTO_NECESSARIO ASC
)
USING STOGROUP SGDGEC00        
PRIQTY 480 SECQTY 480          
ERASE  YES                     
FREEPAGE 0 PCTFREE 0           
GBPCACHE CHANGED               
CLUSTER                        
COMPRESS NO                    
INCLUDE NULL KEYS              
BUFFERPOOL BP11                
CLOSE YES                      
COPY NO                        
DEFER NO                       
DEFINE YES                     
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB317_ACAO_DOCUMENTO
--==============================================================
create table GEC.GECTB317_ACAO_DOCUMENTO (
   NU_CNPJ_PROPONENTE   DECIMAL(14,0)         
      not null,
   NU_ETAPA_PROPONENTE  DECIMAL(2)            
      not null,
   NU_DOCUMENTO_NECESSARIO DECIMAL(3)            
      not null,
   NU_DOCUMENTO_CREDITO DECIMAL(11)           
      not null,
   NU_FLUXO_DOCUMENTO   DECIMAL(2),
   constraint GECPK317 primary key (NU_CNPJ_PROPONENTE, 
NU_ETAPA_PROPONENTE, NU_DOCUMENTO_NECESSARIO, NU_DOCUMENTO_CREDITO)  
)
 in GECDB003.GECTS317;

label on table GEC.GECTB317_ACAO_DOCUMENTO is 'ACAO_DOCUMENTO';

--==============================================================
-- Index: GEC1I317
--==============================================================
create unique index GEC.GEC1I317 on GEC.GECTB317_ACAO_DOCUMENTO (
   NU_CNPJ_PROPONENTE   ASC,
   NU_ETAPA_PROPONENTE  ASC,
   NU_DOCUMENTO_NECESSARIO ASC,
   NU_DOCUMENTO_CREDITO ASC
)
USING STOGROUP SGDGEC00        
PRIQTY 480 SECQTY 480          
ERASE  YES                     
FREEPAGE 0 PCTFREE 0           
GBPCACHE CHANGED               
CLUSTER                        
COMPRESS NO                    
INCLUDE NULL KEYS              
BUFFERPOOL BP11                
CLOSE YES                      
COPY NO                        
DEFER NO                       
DEFINE YES                     
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB318_PRDTO_CRDTO_INTERESSE
--==============================================================
create table GEC.GECTB318_PRDTO_CRDTO_INTERESSE (
   NU_CNPJ_PROPONENTE   DECIMAL(14,0)         
      not null,
   NU_PRODUTO_CREDITO_INTERESSE DECIMAL(3)            
      not null,
   constraint GECPK318 primary key (NU_CNPJ_PROPONENTE, 
NU_PRODUTO_CREDITO_INTERESSE)  
)
 in GECDB003.GECTS318;

label on table GEC.GECTB318_PRDTO_CRDTO_INTERESSE is 
'PRODUTO_CREDITO_INTERESSE';

--==============================================================
-- Index: GEC1I318
--==============================================================
create unique index GEC.GEC1I318 on GEC.GECTB318_PRDTO_CRDTO_INTERESSE (

   NU_CNPJ_PROPONENTE   ASC,
   NU_PRODUTO_CREDITO_INTERESSE ASC
)
USING STOGROUP SGDGEC00        
PRIQTY 480 SECQTY 480          
ERASE  YES                     
FREEPAGE 0 PCTFREE 0           
GBPCACHE CHANGED               
CLUSTER                        
COMPRESS NO                    
INCLUDE NULL KEYS              
BUFFERPOOL BP11                
CLOSE YES                      
COPY NO                        
DEFER NO                       
DEFINE YES                     
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB319_SUBLOTE_CEDIDO
--==============================================================
create table GEC.GECTB319_SUBLOTE_CEDIDO (
   NU_CESSAO_CREDITO    DECIMAL(7,0)          
      not null,
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_SUBLOTE_BASE_ELEGIVEL DECIMAL(10,0)         
      not null,
   VR_SUBLOTE_CEDIDO    DECIMAL(17,2)         
      not null,
   VR_EFETIVO_SUBLOTE_CEDIDO DECIMAL(17,2),
   PC_CESSAO_CREDITO    DECIMAL(17,14),
   constraint GECPK319 primary key (NU_CESSAO_CREDITO, NU_BASE_ELEGIVEL,
 NU_SUBLOTE_BASE_ELEGIVEL)  
)
 in GECDB003.GECTS319;

label on table GEC.GECTB319_SUBLOTE_CEDIDO is 'SUBLOTE_CEDIDO';

--==============================================================
-- Index: GEC1I319
--==============================================================
create unique index GEC.GEC1I319 on GEC.GECTB319_SUBLOTE_CEDIDO (
   NU_CESSAO_CREDITO    ASC,
   NU_BASE_ELEGIVEL     ASC,
   NU_SUBLOTE_BASE_ELEGIVEL ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB320_LOTE_CEDIDO
--==============================================================
create table GEC.GECTB320_LOTE_CEDIDO (
   NU_CESSAO_CREDITO    DECIMAL(7,0)          
      not null,
   NU_LOTE_CESSAO       DECIMAL(7,0)          
      not null,
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   VR_BASE_ELEGIVEL_CEDIDA DECIMAL(17,2)         
      not null,
   VR_EFETIVO_BASE_ELGVL_CEDIDA DECIMAL(17,2),
   constraint GECPK320 primary key (NU_CESSAO_CREDITO, NU_LOTE_CESSAO, 
NU_BASE_ELEGIVEL)  
)
 in GECDB003.GECTS320;

label on table GEC.GECTB320_LOTE_CEDIDO is 'LOTE_CEDIDO';

--==============================================================
-- Index: GEC1I320
--==============================================================
create unique index GEC.GEC1I320 on GEC.GECTB320_LOTE_CEDIDO (
   NU_CESSAO_CREDITO    ASC,
   NU_LOTE_CESSAO       ASC,
   NU_BASE_ELEGIVEL     ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB321_BASE_ELEGIVEL_CEDIDA
--==============================================================
create table GEC.GECTB321_BASE_ELEGIVEL_CEDIDA (
   NU_CESSAO_CREDITO    DECIMAL(7,0)          
      not null,
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   constraint GECPK321 primary key (NU_CESSAO_CREDITO, NU_BASE_ELEGIVEL)
  
)
 in GECDB003.GECTS321;

label on table GEC.GECTB321_BASE_ELEGIVEL_CEDIDA is 
'BASE_ELEGIVEL_CEDIDA';

--==============================================================
-- Index: GEC1I321
--==============================================================
create unique index GEC.GEC1I321 on GEC.GECTB321_BASE_ELEGIVEL_CEDIDA (

   NU_CESSAO_CREDITO    ASC,
   NU_BASE_ELEGIVEL     ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB322_LOTE_BASE_ELEGIVEL
--==============================================================
create table GEC.GECTB322_LOTE_BASE_ELEGIVEL (
   NU_LOTE_CESSAO       DECIMAL(7,0)          
      not null,
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   constraint GECPK322 primary key (NU_LOTE_CESSAO, NU_BASE_ELEGIVEL)  

)
 in GECDB003.GECTS322;

label on table GEC.GECTB322_LOTE_BASE_ELEGIVEL is 'LOTE_BASE_ELEGIVEL';


--==============================================================
-- Index: GEC1I322
--==============================================================
create unique index GEC.GEC1I322 on GEC.GECTB322_LOTE_BASE_ELEGIVEL (
   NU_LOTE_CESSAO       ASC,
   NU_BASE_ELEGIVEL     ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB323_ANEXO_HABILITACAO
--==============================================================
create table GEC.GECTB323_ANEXO_HABILITACAO (
   NU_CNPJ_PROPONENTE   DECIMAL(14,0)         
      not null,
   NU_DOCUMENTO_CREDITO DECIMAL(11)           
      not null,
   constraint GECPK323 primary key (NU_CNPJ_PROPONENTE, 
NU_DOCUMENTO_CREDITO)  
)
 in GECDB003.GECTS323;

label on table GEC.GECTB323_ANEXO_HABILITACAO is 'ANEXO_HABILITACAO';

--==============================================================
-- Index: GEC1I323
--==============================================================
create unique index GEC.GEC1I323 on GEC.GECTB323_ANEXO_HABILITACAO (
   NU_CNPJ_PROPONENTE   ASC,
   NU_DOCUMENTO_CREDITO ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB324_ANEXO_BASE_ELEGIVEL
--==============================================================
create table GEC.GECTB324_ANEXO_BASE_ELEGIVEL (
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_DOCUMENTO_CREDITO DECIMAL(11)           
      not null,
   constraint GECPK324 primary key (NU_BASE_ELEGIVEL, 
NU_DOCUMENTO_CREDITO)  
)
 in GECDB003.GECTS324;

label on table GEC.GECTB324_ANEXO_BASE_ELEGIVEL is 'ANEXO_BASE_ELEGIVEL'
;

--==============================================================
-- Index: GEC1I324
--==============================================================
create unique index GEC.GEC1I324 on GEC.GECTB324_ANEXO_BASE_ELEGIVEL (
   NU_BASE_ELEGIVEL     ASC,
   NU_DOCUMENTO_CREDITO ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB325_ANEXO_CESSAO
--==============================================================
create table GEC.GECTB325_ANEXO_CESSAO (
   NU_CESSAO_CREDITO    DECIMAL(7,0)          
      not null,
   NU_DOCUMENTO_CREDITO DECIMAL(11)           
      not null,
   constraint GECPK325 primary key (NU_CESSAO_CREDITO, 
NU_DOCUMENTO_CREDITO)  
)
 in GECDB003.GECTS325;

label on table GEC.GECTB325_ANEXO_CESSAO is 'ANEXO_CESSAO';

--==============================================================
-- Index: GEC1I325
--==============================================================
create unique index GEC.GEC1I325 on GEC.GECTB325_ANEXO_CESSAO (
   NU_CESSAO_CREDITO    ASC,
   NU_DOCUMENTO_CREDITO ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB326_CESSAO_CREDITO_DSFTO
--==============================================================
create table GEC.GECTB326_CESSAO_CREDITO_DSFTO (
   NU_CESSAO_CREDITO_DESFEITO INTEGER               
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 2147483647
       minvalue 1
      ),
   NU_BASE_ELEGIVEL     DECIMAL(7,0),
   NU_TIPO_CESSAO_DESFEITA DECIMAL(3,0),
   NU_SITUACAO_CESSAO_DESFEITA DECIMAL(3,0),
   NU_EVENTO_CESSAO     DECIMAL(18),
   IC_TIPO_DESFAZIMENTO CHAR(1)               
      not null
         constraint GEC1C326 check (IC_TIPO_DESFAZIMENTO in ('A','B','C'
)),
   DT_SOLIITACAO_DESFAZIMENTO DATE                  
      not null,
   QT_CREDITO_DFZMO_SOLICITADO INTEGER               
      not null,
   QT_CREDITO_DFZMO_EFETIVADO INTEGER               
      not null,
   DE_JSTVA_DESFAZIMENTO VARCHAR(200),
   VR_SOLICITACAO_DESFAZIMENTO DECIMAL(17, 2),
   IC_TIPO_SOLICITACAO_DSFTO CHAR(1)               
      not null with default 'A'
         constraint GEC2C326 check (IC_TIPO_SOLICITACAO_DSFTO in ('A',
'M')),
   constraint GECPK326 primary key (NU_CESSAO_CREDITO_DESFEITO)  
)
 in GECDB003.GECTS326;

label on table GEC.GECTB326_CESSAO_CREDITO_DSFTO is 
'CESSAO_CREDITO_DESFEITO';
label on column 
GEC.GECTB326_CESSAO_CREDITO_DSFTO.QT_CREDITO_DFZMO_SOLICITADO is 
'QT_CREDITO_DESFAZIMENTO_SOLICITADO';
label on column 
GEC.GECTB326_CESSAO_CREDITO_DSFTO.QT_CREDITO_DFZMO_EFETIVADO is 
'QT_CREDITO_DESFAZIMENTO_EFETIVADO';
label on column GEC.GECTB326_CESSAO_CREDITO_DSFTO.DE_JSTVA_DESFAZIMENTO 
is 'DE_JUSTIFICATIVA_DESFAZIMENTO';
label on column 
GEC.GECTB326_CESSAO_CREDITO_DSFTO.IC_TIPO_SOLICITACAO_DSFTO is 
'IC_TIPO_SOLICITACAO_DESFAZIMENTO';
--==============================================================
-- Index: GEC1I326
--==============================================================
create unique index GEC.GEC1I326 on GEC.GECTB326_CESSAO_CREDITO_DSFTO (

   NU_CESSAO_CREDITO_DESFEITO ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480      
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    CLUSTER                    
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC2I326
--==============================================================
create index GEC.GEC2I326 on GEC.GECTB326_CESSAO_CREDITO_DSFTO (
   NU_EVENTO_CESSAO     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB327_CRDTO_SLCTO_DSFMNTO
--==============================================================
create table GEC.GECTB327_CRDTO_SLCTO_DSFMNTO (
   NU_CREDITO_DESFEITO  DECIMAL(7,0)          
      not null,
   NU_CESSAO_CREDITO_DESFEITO INTEGER               
      not null,
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_TIPO_CREDITO_DESFEITO DECIMAL(3,0),
   NU_SITUACAO_CREDITO_DESFEITO DECIMAL(3,0),
   NU_MOTIVO_DESFAZIMENTO SMALLINT              
      not null,
   VR_LANCADO_CREDITO_ATRSO_DSFTO DECIMAL(17,2),
   DT_EFETIVACAO_DESFAZIMENTO DATE,
   constraint GECPK327 primary key (NU_BASE_ELEGIVEL, 
NU_CESSAO_CREDITO_DESFEITO, NU_CREDITO_DESFEITO)  
)
 in GECDB003.GECTS327;

label on table GEC.GECTB327_CRDTO_SLCTO_DSFMNTO is 
'CREDITO_SOLICITACAO_DESFAZIMENTO';
label on column 
GEC.GECTB327_CRDTO_SLCTO_DSFMNTO.VR_LANCADO_CREDITO_ATRSO_DSFTO is 
'VR_LANCADO_CREDITO_ATRASO_DESFEITO';
--==============================================================
-- Index: GEC1I327
--==============================================================
create unique index GEC.GEC1I327 on GEC.GECTB327_CRDTO_SLCTO_DSFMNTO (
   NU_BASE_ELEGIVEL     ASC,
   NU_CESSAO_CREDITO_DESFEITO ASC,
   NU_CREDITO_DESFEITO  ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480      
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    CLUSTER                    
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB329_MOTIVO_DSFZMNTO_CRDTO
--==============================================================
create table GEC.GECTB329_MOTIVO_DSFZMNTO_CRDTO (
   NU_MOTIVO_DESFAZIMENTO_CREDITO SMALLINT              
      not null,
   DE_MOTIVO_DESFAZIMENTO_CREDITO VARCHAR(100)          
      not null,
   constraint GECPK329 primary key (NU_MOTIVO_DESFAZIMENTO_CREDITO)  
)
 in GECDB003.GECTS329;

label on table GEC.GECTB329_MOTIVO_DSFZMNTO_CRDTO is 
'MOTIVO_DESFAZIMENTO_CESSAO_CREDITO';

--==============================================================
-- Index: GEC1I329
--==============================================================
create unique index GEC.GEC1I329 on GEC.GECTB329_MOTIVO_DSFZMNTO_CRDTO (

   NU_MOTIVO_DESFAZIMENTO_CREDITO ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480      
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    CLUSTER                    
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB330_SLCTO_RESTRICAO_CLNTE
--==============================================================
create table GEC.GECTB330_SLCTO_RESTRICAO_CLNTE (
   NU_SLCTO_RESTRICAO_CLIENTE INTEGER               
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 2147483647
       minvalue 1
      ),
   NU_TIPO_SITUACAO     DECIMAL(3,0)          
      not null,
   NU_SITUACAO          DECIMAL(3,0)          
      not null,
   NU_CNPJ_PROPONENTE   DECIMAL(14,0),
   NU_BASE_ELEGIVEL     DECIMAL(7,0),
   NU_EVENTO_CESSAO     DECIMAL(18),
   DT_SOLICITACAO_RESTRICAO DATE                  
      not null,
   IC_TIPO_SLCTO_RESTRICAO SMALLINT              
      not null with default 1
         constraint GEC1C330 check (IC_TIPO_SLCTO_RESTRICAO in (1,2,3,
4)),
   QT_REGISTRO_ARQUIVO_ENVIADO INTEGER               
      not null,
   QT_REGISTRO_ARQUIVO_ERRO INTEGER,
   VR_CNTBL_CRDTO_ATSO_MINIMO DECIMAL(17,2),
   VR_CNTBL_CRDTO_ATSO_MAXIMO DECIMAL(17,2),
   QT_DIA_ATRASO_MINIMO SMALLINT,
   QT_DIA_ATRASO_MAXIMO SMALLINT,
   CO_CONTRATO_CLIENTE  CHAR(20),
   NU_CPF_CLIENTE       DECIMAL(11),
   NU_CNPJ_CLIENTE      DECIMAL(14),
   CO_CNPJ_CLIENTE_SLCTO_RSRO CHAR(14),
   constraint GECPK330 primary key (NU_SLCTO_RESTRICAO_CLIENTE)  
)
 in GECDB003.GECTS330;

label on table GEC.GECTB330_SLCTO_RESTRICAO_CLNTE is 
'SOLICITACAO_RESTRICAO_CLIENTE';
label on column 
GEC.GECTB330_SLCTO_RESTRICAO_CLNTE.NU_SLCTO_RESTRICAO_CLIENTE is 
'NU_SOLICITACAO_RESTRICAO_CLIENTE';
label on column GEC.GECTB330_SLCTO_RESTRICAO_CLNTE.NU_TIPO_SITUACAO is 
'NU_TIPO_SITUACAO_SOLICITACAO_RESTRICAO';
label on column GEC.GECTB330_SLCTO_RESTRICAO_CLNTE.NU_SITUACAO is 
'NU_SITUACAO_SOLICITACAO_RESTRICAO';
label on column 
GEC.GECTB330_SLCTO_RESTRICAO_CLNTE.IC_TIPO_SLCTO_RESTRICAO is 
'IC_TIPO_SOLICITACAO_RESTRICAO';
label on column 
GEC.GECTB330_SLCTO_RESTRICAO_CLNTE.VR_CNTBL_CRDTO_ATSO_MINIMO is 
'VR_CONTABIL_CREDITO_ATRASO_MINIMO';
label on column 
GEC.GECTB330_SLCTO_RESTRICAO_CLNTE.VR_CNTBL_CRDTO_ATSO_MAXIMO is 
'VR_CONTABIL_CREDITO_ATRASO_MAXIMO';
label on column 
GEC.GECTB330_SLCTO_RESTRICAO_CLNTE.CO_CNPJ_CLIENTE_SLCTO_RSRO is 
'CO_CNPJ_CLIENTE_SOLICITACAO_RESTRICAO';
--==============================================================
-- Index: GEC1I330
--==============================================================
create unique index GEC.GEC1I330 on GEC.GECTB330_SLCTO_RESTRICAO_CLNTE (

   NU_SLCTO_RESTRICAO_CLIENTE ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I330
--==============================================================
create index GEC.GEC2I330 on GEC.GECTB330_SLCTO_RESTRICAO_CLNTE (
   NU_EVENTO_CESSAO     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  YES
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 4 G;

--==============================================================
-- Table: GECTB331_CRDTO_SLCTO_RESTRICAO
--==============================================================
create table GEC.GECTB331_CRDTO_SLCTO_RESTRICAO (
   NU_SLCTO_RESTRICAO_CLIENTE INTEGER               
      not null,
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_CREDITO           DECIMAL(7,0)          
      not null,
   NU_TIPO_SITUACAO     DECIMAL(3,0)          
      not null,
   NU_SITUACAO          DECIMAL(3,0)          
      not null,
   constraint GECPK331 primary key (NU_SLCTO_RESTRICAO_CLIENTE, 
NU_BASE_ELEGIVEL, NU_CREDITO)  
)
 in GECDB003.GECTS331;

label on table GEC.GECTB331_CRDTO_SLCTO_RESTRICAO is 
'CREDITO_SOLICITACAO_RESTRICAO_CLIENTE';
label on column 
GEC.GECTB331_CRDTO_SLCTO_RESTRICAO.NU_SLCTO_RESTRICAO_CLIENTE is 
'NU_SOLICITACAO_RESTRICAO_CLIENTE';
label on column GEC.GECTB331_CRDTO_SLCTO_RESTRICAO.NU_TIPO_SITUACAO is 
'NU_TIPO_SITUACAO_RESTRICAO_CREDITO';
label on column GEC.GECTB331_CRDTO_SLCTO_RESTRICAO.NU_SITUACAO is 
'NU_SITUACAO_RESTRICAO_CREDITO';
--==============================================================
-- Index: GEC1I331
--==============================================================
create unique index GEC.GEC1I331 on GEC.GECTB331_CRDTO_SLCTO_RESTRICAO (

   NU_SLCTO_RESTRICAO_CLIENTE ASC,
   NU_BASE_ELEGIVEL     ASC,
   NU_CREDITO           ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB332_RGSTO_RESTRICAO_ERRO
--==============================================================
create table GEC.GECTB332_RGSTO_RESTRICAO_ERRO (
   NU_SLCTO_RESTRICAO_CLIENTE INTEGER               
      not null,
   NU_REGISTRO_ERRO     INTEGER               
      not null,
   DE_REGISTRO_ERRO     VARCHAR(500)          
      not null,
   CO_CONTRATO_CLIENTE  CHAR(20),
   NU_CPF_CLIENTE       DECIMAL(11),
   NU_CNPJ_CLIENTE      DECIMAL(14),
   NO_RAZAO_SOCIAL_CLIENTE VARCHAR(100),
   DT_INICIO_CESSAO_CONTRATO DATE,
   DT_TERMINO_CESSAO_CONTRATO DATE,
   constraint GECPK332 primary key (NU_SLCTO_RESTRICAO_CLIENTE, 
NU_REGISTRO_ERRO)  
)
 in GECDB003.GECTS332;

label on table GEC.GECTB332_RGSTO_RESTRICAO_ERRO is 
'REGISTRO_SOLICITACAO_RESTRICAO_ERRO';
label on column 
GEC.GECTB332_RGSTO_RESTRICAO_ERRO.NU_SLCTO_RESTRICAO_CLIENTE is 
'NU_SOLICITACAO_RESTRICAO_CLIENTE';
--==============================================================
-- Index: GEC1I332
--==============================================================
create unique index GEC.GEC1I332 on GEC.GECTB332_RGSTO_RESTRICAO_ERRO (

   NU_SLCTO_RESTRICAO_CLIENTE ASC,
   NU_REGISTRO_ERRO     ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I332
--==============================================================
create index GEC.GEC2I332 on GEC.GECTB332_RGSTO_RESTRICAO_ERRO (
   NU_SLCTO_RESTRICAO_CLIENTE ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB333_CRTCA_REGISTRO_ERRO
--==============================================================
create table GEC.GECTB333_CRTCA_REGISTRO_ERRO (
   NU_SLCTO_RESTRICAO_CLIENTE INTEGER               
      not null,
   NU_REGISTRO_ERRO     INTEGER               
      not null,
   CO_CRTCA_SLCTO_RESTRICAO CHAR(4)               
      not null,
   constraint GECPK333 primary key (NU_SLCTO_RESTRICAO_CLIENTE, 
NU_REGISTRO_ERRO, CO_CRTCA_SLCTO_RESTRICAO)  
)
 in GECDB003.GECTS333;

label on table GEC.GECTB333_CRTCA_REGISTRO_ERRO is 
'CRITICA_REGISTRO_RESTRICAO_ERRO';
label on column 
GEC.GECTB333_CRTCA_REGISTRO_ERRO.NU_SLCTO_RESTRICAO_CLIENTE is 
'NU_SOLICITACAO_RESTRICAO_CLIENTE';
label on column 
GEC.GECTB333_CRTCA_REGISTRO_ERRO.CO_CRTCA_SLCTO_RESTRICAO is 
'CO_CRITICA_SOLICITACAO_RESTRICAO';
--==============================================================
-- Index: GEC1I333
--==============================================================
create unique index GEC.GEC1I333 on GEC.GECTB333_CRTCA_REGISTRO_ERRO (
   NU_SLCTO_RESTRICAO_CLIENTE ASC,
   NU_REGISTRO_ERRO     ASC,
   CO_CRTCA_SLCTO_RESTRICAO ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I333
--==============================================================
create index GEC.GEC2I333 on GEC.GECTB333_CRTCA_REGISTRO_ERRO (
   NU_SLCTO_RESTRICAO_CLIENTE ASC,
   NU_REGISTRO_ERRO     ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Index: GEC3I333
--==============================================================
create index GEC.GEC3I333 on GEC.GECTB333_CRTCA_REGISTRO_ERRO (
   NU_SLCTO_RESTRICAO_CLIENTE ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB334_CRTCA_SLCTO_RESTRICAO
--==============================================================
create table GEC.GECTB334_CRTCA_SLCTO_RESTRICAO (
   CO_CRTCA_SLCTO_RESTRICAO CHAR(4)               
      not null,
   DE_CRTCA_SLCTO_RESTRICAO VARCHAR(120)          
      not null,
   constraint GECPK334 primary key (CO_CRTCA_SLCTO_RESTRICAO)  
)
 in GECDB003.GECTS334;

label on table GEC.GECTB334_CRTCA_SLCTO_RESTRICAO is 
'CRITICA_SOLICITACAO_RESTRICAO';
label on column 
GEC.GECTB334_CRTCA_SLCTO_RESTRICAO.CO_CRTCA_SLCTO_RESTRICAO is 
'CO_CRITICA_SOLICITACAO_RESTRICAO';
label on column 
GEC.GECTB334_CRTCA_SLCTO_RESTRICAO.DE_CRTCA_SLCTO_RESTRICAO is 
'DE_CRITICA_SOLICITACAO_RESTRICAO';
--==============================================================
-- Index: GEC1I334
--==============================================================
create unique index GEC.GEC1I334 on GEC.GECTB334_CRTCA_SLCTO_RESTRICAO (

   CO_CRTCA_SLCTO_RESTRICAO ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB335_PROCESSO_SISTEMA
--==============================================================
create table GEC.GECTB335_PROCESSO_SISTEMA (
   NU_PROCESSO_SISTEMA  SMALLINT              
      not null,
   DE_PROCESSO_SISTEMA  VARCHAR(100)          
      not null,
   constraint GECPK335 primary key (NU_PROCESSO_SISTEMA)  
)
 in GECDB003.GECTS335;

label on table GEC.GECTB335_PROCESSO_SISTEMA is 'PROCESSO_SISTEMA';

--==============================================================
-- Index: GEC1I335
--==============================================================
create unique index GEC.GEC1I335 on GEC.GECTB335_PROCESSO_SISTEMA (
   NU_PROCESSO_SISTEMA  ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB336_EVENTO_SISTEMA
--==============================================================
create table GEC.GECTB336_EVENTO_SISTEMA (
   NU_PROCESSO_SISTEMA  SMALLINT              
      not null,
   NU_EVENTO_SISTEMA    SMALLINT              
      not null,
   DE_EVENTO_SISTEMA    VARCHAR(100)          
      not null,
   constraint GECPK336 primary key (NU_PROCESSO_SISTEMA, 
NU_EVENTO_SISTEMA)  
)
 in GECDB003.GECTS336;

label on table GEC.GECTB336_EVENTO_SISTEMA is 'EVENTO_SISTEMA';

--==============================================================
-- Index: GEC1I336
--==============================================================
create unique index GEC.GEC1I336 on GEC.GECTB336_EVENTO_SISTEMA (
   NU_PROCESSO_SISTEMA  ASC,
   NU_EVENTO_SISTEMA    ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB337_ACAO_AUDITADA
--==============================================================
create table GEC.GECTB337_ACAO_AUDITADA (
   NU_ACAO_AUDITADA     DECIMAL(18)           
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 999999999999999999
       minvalue 1
      ),
   NU_BASE_ELEGIVEL     DECIMAL(7,0),
   NU_PROCESSO_SISTEMA  SMALLINT              
      not null,
   NU_EVENTO_SISTEMA    SMALLINT              
      not null,
   IC_TIPO_EVENTO       CHAR(1)               
      not null default 'C'
         constraint GEC1C337 check (IC_TIPO_EVENTO in ('A','C','E','I'))
,
   TS_INCLUSAO_LOG      TIMESTAMP             
      not null,
   CO_MATRICULA_USUARIO CHAR(8)               
      not null,
   CO_IP_ESTACAO        CHAR(16)              
      not null,
   constraint GECPK337 primary key (NU_ACAO_AUDITADA)  
)
 in GECDB003.GECTS337;

label on table GEC.GECTB337_ACAO_AUDITADA is 'ACAO_AUDITADA';

--==============================================================
-- Index: GEC1I337
--==============================================================
create unique index GEC.GEC1I337 on GEC.GECTB337_ACAO_AUDITADA (
   NU_ACAO_AUDITADA     ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I337
--==============================================================
create index GEC.GEC2I337 on GEC.GECTB337_ACAO_AUDITADA (
   TS_INCLUSAO_LOG      ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Index: GEC3I337
--==============================================================
create index GEC.GEC3I337 on GEC.GECTB337_ACAO_AUDITADA (
   IC_TIPO_EVENTO       ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Index: GEC4I337
--==============================================================
create index GEC.GEC4I337 on GEC.GECTB337_ACAO_AUDITADA (
   NU_BASE_ELEGIVEL     ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Index: GEC5I337
--==============================================================
create index GEC.GEC5I337 on GEC.GECTB337_ACAO_AUDITADA (
   NU_PROCESSO_SISTEMA  ASC,
   NU_EVENTO_SISTEMA    ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Index: GEC6I337
--==============================================================
create index GEC.GEC6I337 on GEC.GECTB337_ACAO_AUDITADA (
   CO_MATRICULA_USUARIO ASC
)
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB338_DETALHE_ACAO_AUDITADA
--==============================================================
create table GEC.GECTB338_DETALHE_ACAO_AUDITADA (
   NU_ACAO_AUDITADA     DECIMAL(18)           
      not null,
   NO_TABELA_AUDITADA   CHAR(30)              
      not null,
   NO_COLUNA_AUDITADA   CHAR(30)              
      not null,
   DE_CONTEUDO_ANTERIOR VARCHAR(400)          
      not null,
   DE_CONTEUDO_ATUAL    VARCHAR(400)          
      not null,
   constraint GECPK338 primary key (NU_ACAO_AUDITADA, NO_TABELA_AUDITADA
, NO_COLUNA_AUDITADA)  
)
 in GECDB003.GECTS338;

label on table GEC.GECTB338_DETALHE_ACAO_AUDITADA is 
'DETALHE_ACAO_AUDITADA';
label on column GEC.GECTB338_DETALHE_ACAO_AUDITADA.DE_CONTEUDO_ANTERIOR 
is 'DE_CONTEUDO_ANTERIOR_COLUNA_AUDITADA';
label on column GEC.GECTB338_DETALHE_ACAO_AUDITADA.DE_CONTEUDO_ATUAL is 
'DE_CONTEUDO_ATUAL_COLUNA_AUDITADA';
--==============================================================
-- Index: GEC1I338
--==============================================================
create unique index GEC.GEC1I338 on GEC.GECTB338_DETALHE_ACAO_AUDITADA (

   NU_ACAO_AUDITADA     ASC,
   NO_TABELA_AUDITADA   ASC,
   NO_COLUNA_AUDITADA   ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB339_ANEXO_CESSAO_DEFEITA
--==============================================================
create table GEC.GECTB339_ANEXO_CESSAO_DEFEITA (
   NU_CESSAO_CREDITO_DESFEITO INTEGER               
      not null,
   NU_DOCUMENTO_CREDITO Decimal(11)           
      not null,
   constraint GECPK339 primary key (NU_CESSAO_CREDITO_DESFEITO, 
NU_DOCUMENTO_CREDITO)  
)
 in GECDB003.GECTS339;

label on table GEC.GECTB339_ANEXO_CESSAO_DEFEITA is 
'ANEXO_CESSAO_DEFEITA';

--==============================================================
-- Index: GEC1I339
--==============================================================
create unique index GEC.GEC1I339 on GEC.GECTB339_ANEXO_CESSAO_DEFEITA (

   NU_CESSAO_CREDITO_DESFEITO ASC,
   NU_DOCUMENTO_CREDITO ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES;

--==============================================================
-- Table: GECTB350_TIPO_SITUACAO
--==============================================================
create table GEC.GECTB350_TIPO_SITUACAO (
   NU_TIPO_SITUACAO     DECIMAL(3,0)          
      not null,
   NO_TIPO_SITUACAO     VARCHAR(25)           
      not null,
   constraint GECPK350 primary key (NU_TIPO_SITUACAO)  
)
 in GECDB003.GECTS350;

label on table GEC.GECTB350_TIPO_SITUACAO is 'TIPO_SITUACAO';

--==============================================================
-- Index: GEC1I350
--==============================================================
create unique index GEC.GEC1I350 on GEC.GECTB350_TIPO_SITUACAO (
   NU_TIPO_SITUACAO     ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB351_SITUACAO
--==============================================================
create table GEC.GECTB351_SITUACAO (
   NU_TIPO_SITUACAO     DECIMAL(3,0)          
      not null,
   NU_SITUACAO          DECIMAL(3,0)          
      not null,
   NO_SITUACAO          VARCHAR(40)           
      not null,
   constraint GECPK351 primary key (NU_TIPO_SITUACAO, NU_SITUACAO)  
)
 in GECDB003.GECTS351;

label on table GEC.GECTB351_SITUACAO is 'SITUACAO';

--==============================================================
-- Index: GEC1I351
--==============================================================
create unique index GEC.GEC1I351 on GEC.GECTB351_SITUACAO (
   NU_TIPO_SITUACAO     ASC,
   NU_SITUACAO          ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB352_TIPO_CREDITO
--==============================================================
create table GEC.GECTB352_TIPO_CREDITO (
   NU_TIPO_CREDITO      DECIMAL(3,0)          
      not null,
   NO_TIPO_CREDITO      VARCHAR(30)           
      not null,
   constraint GECPK352 primary key (NU_TIPO_CREDITO)  
)
 in GECDB003.GECTS352;

label on table GEC.GECTB352_TIPO_CREDITO is 'TIPO_CREDITO';

--==============================================================
-- Index: GEC1I352
--==============================================================
create unique index GEC.GEC1I352 on GEC.GECTB352_TIPO_CREDITO (
   NU_TIPO_CREDITO      ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB353_ETAPA_CESSAO
--==============================================================
create table GEC.GECTB353_ETAPA_CESSAO (
   NU_ETAPA_CESSAO      DECIMAL(2,0)          
      not null,
   NO_ETAPA_CESSAO      VARCHAR(15)           
      not null,
   constraint GECPK353 primary key (NU_ETAPA_CESSAO)  
)
 in GECDB003.GECTS353;

label on table GEC.GECTB353_ETAPA_CESSAO is 'ETAPA_CESSAO';

--==============================================================
-- Index: GEC1I353
--==============================================================
create unique index GEC.GEC1I353 on GEC.GECTB353_ETAPA_CESSAO (
   NU_ETAPA_CESSAO      ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB354_PROCESSO_EXEC_ROTINA
--==============================================================
create table GEC.GECTB354_PROCESSO_EXEC_ROTINA (
   NU_PROCESSO_EXECUCAO_ROTINA DECIMAL(3)            
      not null,
   NO_PROCESSO_EXECUCAO_ROTINA VARCHAR(15)           
      not null,
   DE_PROCESSO_EXECUCAO_ROTINA VARCHAR(120)          
      not null,
   constraint GECPK354 primary key (NU_PROCESSO_EXECUCAO_ROTINA)  
)
 in GECDB003.GECTS354;

label on table GEC.GECTB354_PROCESSO_EXEC_ROTINA is 
'PROCESSO_EXECUCAO_ROTINA';

--==============================================================
-- Index: GEC1I354
--==============================================================
create unique index GEC.GEC1I354 on GEC.GECTB354_PROCESSO_EXEC_ROTINA (

   NU_PROCESSO_EXECUCAO_ROTINA ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB355_EXECUCAO_ROTINA
--==============================================================
create table GEC.GECTB355_EXECUCAO_ROTINA (
   NU_PRCSO_EXEC_ROTINA DECIMAL(3)            
      not null,
   NU_EXECUCAO_ROTINA   DECIMAL(10)           
      not null,
   NU_BASE_ELEGIVEL     DECIMAL(7,0),
   TS_INICIO_EXEC_ROTINA TIMESTAMP             
      not null,
   TS_FIM_EXEC_ROTINA   TIMESTAMP,
   QT_REGISTRO_PROCESSADO DECIMAL(10)           
      not null,
   QT_REGISTRO_ERRO     DECIMAL(10)           
      not null,
   DE_EXECUCAO_ROTINA   VARCHAR(200),
   CO_RETORNO_ROTINA    DECIMAL(5),
   NO_ARQUIVO_ENTRADA   VARCHAR(100),
   constraint GECPK355 primary key (NU_PRCSO_EXEC_ROTINA, 
NU_EXECUCAO_ROTINA)  
)
 in GECDB003.GECTS355;

label on table GEC.GECTB355_EXECUCAO_ROTINA is 'EXECUCAO_ROTINA';
label on column GEC.GECTB355_EXECUCAO_ROTINA.NU_PRCSO_EXEC_ROTINA is 
'NU_PROCESSO_EXECUCAO_ROTINA';
label on column GEC.GECTB355_EXECUCAO_ROTINA.TS_INICIO_EXEC_ROTINA is 
'TS_INICIO_EXECUCAO_ROTINA';
label on column GEC.GECTB355_EXECUCAO_ROTINA.TS_FIM_EXEC_ROTINA is 
'TS_FIM_EXECUCAO_ROTINA';
--==============================================================
-- Index: GEC1I355
--==============================================================
create unique index GEC.GEC1I355 on GEC.GECTB355_EXECUCAO_ROTINA (
   NU_PRCSO_EXEC_ROTINA ASC,
   NU_EXECUCAO_ROTINA   ASC
)
USING STOGROUP SGDGEC00 
PRIQTY 48 SECQTY 48     
ERASE  YES              
FREEPAGE 0 PCTFREE 0    
GBPCACHE CHANGED        
CLUSTER                 
COMPRESS NO             
INCLUDE NULL KEYS       
BUFFERPOOL BP11         
CLOSE YES               
COPY NO                 
DEFER NO                
DEFINE YES              
PIECESIZE 32 G;

--==============================================================
-- Table: GECTB356_TIPO_DOCUMENTO
--==============================================================
create table GEC.GECTB356_TIPO_DOCUMENTO (
   NU_TIPO_DOCUMENTO    SMALLINT              
      not null,
   NU_GRUPO_DOCUMENTO   SMALLINT              
      not null,
   CO_CLASSE_DOCUMENTO  VARCHAR(100)          
      not null,
   NO_TIPO_DOCUMENTO    VARCHAR(100)          
      not null,
   constraint GECPK356 primary key (NU_TIPO_DOCUMENTO)  
)
 in GECDB003.GECTS356;

label on table GEC.GECTB356_TIPO_DOCUMENTO is 'TIPO_DOCUMENTO';

--==============================================================
-- Index: GEC1I356
--==============================================================
create unique index GEC.GEC1I356 on GEC.GECTB356_TIPO_DOCUMENTO (
   NU_TIPO_DOCUMENTO    ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB357_FLUXO_DOCUMENTO
--==============================================================
create table GEC.GECTB357_FLUXO_DOCUMENTO (
   NU_FLUXO_DOCUMENTO   DECIMAL(2)            
      not null,
   NO_FLUXO_DOCUMENTO   VARCHAR(25)           
      not null,
   constraint GECPK357 primary key (NU_FLUXO_DOCUMENTO)  
)
 in GECDB003.GECTS357;

label on table GEC.GECTB357_FLUXO_DOCUMENTO is 'FLUXO_DOCUMENTO';

--==============================================================
-- Index: GEC1I357
--==============================================================
create unique index GEC.GEC1I357 on GEC.GECTB357_FLUXO_DOCUMENTO (
   NU_FLUXO_DOCUMENTO   ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB358_DCMNO_ENTIDADE_EMPRL
--==============================================================
create table GEC.GECTB358_DCMNO_ENTIDADE_EMPRL (
   CO_ENTIDADE_EMPRESARIAL SMALLINT              
      not null,
   NU_DOCUMENTO_NECESSARIO DECIMAL(3)            
      not null,
   constraint GECPK358 primary key (CO_ENTIDADE_EMPRESARIAL, 
NU_DOCUMENTO_NECESSARIO)  
)
 in GECDB003.GECTS358;

label on table GEC.GECTB358_DCMNO_ENTIDADE_EMPRL is 
'DOCUMENTO_ENTIDADE_EMPRESARIAL';

--==============================================================
-- Index: GEC1I358
--==============================================================
create unique index GEC.GEC1I358 on GEC.GECTB358_DCMNO_ENTIDADE_EMPRL (

   CO_ENTIDADE_EMPRESARIAL ASC,
   NU_DOCUMENTO_NECESSARIO ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB359_PRODUTO_CREDITO
--==============================================================
create table GEC.GECTB359_PRODUTO_CREDITO (
   NU_PRODUTO_CREDITO   DECIMAL(4,0)          
      not null,
   NO_PRODUTO_CREDITO   VARCHAR(30)           
      not null,
   constraint GECPK359 primary key (NU_PRODUTO_CREDITO)  
)
 in GECDB003.GECTS359;

label on table GEC.GECTB359_PRODUTO_CREDITO is 'PRODUTO_CREDITO';

--==============================================================
-- Index: GEC1I359
--==============================================================
create unique index GEC.GEC1I359 on GEC.GECTB359_PRODUTO_CREDITO (
   NU_PRODUTO_CREDITO   ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB360_ETAPA_CADASTRO
--==============================================================
create table GEC.GECTB360_ETAPA_CADASTRO (
   NU_ETAPA_PROPONENTE  DECIMAL(2)            
      not null,
   NO_ETAPA_PROPONENTE  VARCHAR(20)           
      not null,
   constraint GECPK360 primary key (NU_ETAPA_PROPONENTE)  
)
 in GECDB003.GECTS360;

label on table GEC.GECTB360_ETAPA_CADASTRO is 'ETAPA_CADASTRO';

--==============================================================
-- Index: GEC1I360
--==============================================================
create unique index GEC.GEC1I360 on GEC.GECTB360_ETAPA_CADASTRO (
   NU_ETAPA_PROPONENTE  ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB361_ETAPA_CADASTRO_DCMTO
--==============================================================
create table GEC.GECTB361_ETAPA_CADASTRO_DCMTO (
   NU_ETAPA_PROPONENTE  DECIMAL(2)            
      not null,
   NU_DOCUMENTO_NECESSARIO DECIMAL(3)            
      not null,
   IC_DOCUMENTO_OBRIGATORIO CHAR(1)               
      not null
         constraint GEC1C361 check (IC_DOCUMENTO_OBRIGATORIO in ('S','N'
)),
   constraint GECPK361 primary key (NU_ETAPA_PROPONENTE, 
NU_DOCUMENTO_NECESSARIO)  
)
 in GECDB003.GECTS361;

label on table GEC.GECTB361_ETAPA_CADASTRO_DCMTO is 
'ETAPA_CADASTRO_DOCUMENTO';

--==============================================================
-- Index: GEC1I361
--==============================================================
create unique index GEC.GEC1I361 on GEC.GECTB361_ETAPA_CADASTRO_DCMTO (

   NU_ETAPA_PROPONENTE  ASC,
   NU_DOCUMENTO_NECESSARIO ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB362_DOCUMENTO_NECESSARIO
--==============================================================
create table GEC.GECTB362_DOCUMENTO_NECESSARIO (
   NU_DOCUMENTO_NECESSARIO DECIMAL(3)            
      not null,
   NO_DOCUMENTO_NECESSARIO VARCHAR(40)           
      not null,
   DE_DETALHADA_DOCUMENTO VARCHAR(255)          
      not null,
   IC_PRAZO_VALIDADE_DOCUMENTO CHAR(1)               
      not null
         constraint GEC1C362 check (IC_PRAZO_VALIDADE_DOCUMENTO in ('S',
'N')),
   IC_DOCUMENTO_PRE_DEFINIDO CHAR(1)               
      not null
         constraint GEC2C362 check (IC_DOCUMENTO_PRE_DEFINIDO in ('S',
'N')),
   constraint GECPK362 primary key (NU_DOCUMENTO_NECESSARIO)  
)
 in GECDB003.GECTS362;

label on table GEC.GECTB362_DOCUMENTO_NECESSARIO is 
'DOCUMENTO_NECESSARIO';

--==============================================================
-- Index: GEC1I362
--==============================================================
create unique index GEC.GEC1I362 on GEC.GECTB362_DOCUMENTO_NECESSARIO (

   NU_DOCUMENTO_NECESSARIO ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB363_FILTRO_CREDITO
--==============================================================
create table GEC.GECTB363_FILTRO_CREDITO (
   NU_PRCSO_EXEC_ROTINA DECIMAL(3)            
      not null,
   NU_EXECUCAO_ROTINA   DECIMAL(10)           
      not null,
   CO_TIPO_FILTRO       CHAR(1)               
      not null,
   NU_TIPO_SITUACAO_FILTRO DECIMAL(3,0)          
      not null,
   NU_SITUACAO_FILTRO   DECIMAL(3,0)          
      not null,
   QT_CONTRATO_REJEITADO INTEGER,
   QT_DIA_ATRASO_ADPTE  SMALLINT,
   DT_DADOS_CONTRATOS   DATE,
   constraint GECPK363 primary key (NU_PRCSO_EXEC_ROTINA, 
NU_EXECUCAO_ROTINA)  
)
 in GECDB003.GECTS363;

label on column GEC.GECTB363_FILTRO_CREDITO.NU_PRCSO_EXEC_ROTINA is 
'NU_PROCESSO_EXECUCAO_ROTINA';
--==============================================================
-- Index: GEC1I363
--==============================================================
create unique index GEC.GEC1I363 on GEC.GECTB363_FILTRO_CREDITO (
   NU_PRCSO_EXEC_ROTINA ASC,
   NU_EXECUCAO_ROTINA   ASC
)
cluster
    USING STOGROUP SGDGEC00     
    PRIQTY 480 SECQTY 480         
    ERASE  YES                  
    FREEPAGE 0 PCTFREE 0        
    GBPCACHE CHANGED            
    COMPRESS NO                 
    INCLUDE NULL KEYS           
    BUFFERPOOL BP11             
    CLOSE YES                   
    COPY NO                     
    DEFER NO                    
    DEFINE YES                  
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB364_GRUPO_DOCUMENTO
--==============================================================
create table GEC.GECTB364_GRUPO_DOCUMENTO (
   NU_GRUPO_DOCUMENTO   SMALLINT              
      not null,
   NO_GRUPO_DOCUMENTO   VARCHAR(100)          
      not null,
   constraint GECPK364 primary key (NU_GRUPO_DOCUMENTO)  
)
 in GECDB003.GECTS364;

label on table GEC.GECTB364_GRUPO_DOCUMENTO is 'GRUPO_DOCUMENTO';

--==============================================================
-- Index: GEC1I364
--==============================================================
create unique index GEC.GEC1I364 on GEC.GECTB364_GRUPO_DOCUMENTO (
   NU_GRUPO_DOCUMENTO   ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 480 SECQTY 480        
    ERASE  YES                 
    FREEPAGE 0 PCTFREE 0       
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Table: GECTB373_ENVIO_ARQUIVO
--==============================================================
create table GEC.GECTB373_ENVIO_ARQUIVO (
   NU_ENVIO_ARQUIVO     INTEGER               
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 2147483647
       minvalue 1
      ),
   NU_BASE_ELEGIVEL     DECIMAL(7,0)          
      not null,
   NU_TIPO_SITUACAO     DECIMAL(3,0)          
      not null,
   NU_SITUACAO          DECIMAL(3,0)          
      not null,
   TS_ENVIO_ARQUIVO     TIMESTAMP             
      not null,
   IC_TIPO_ENVIO_ARQUIVO CHAR(1)               
      not null with default 'A'
         constraint GEC1C373 check (IC_TIPO_ENVIO_ARQUIVO in ('A','B',
'C','D')),
   constraint GECPK373 primary key (NU_ENVIO_ARQUIVO)  
)
 in GECDB003.GECTS373;

label on table GEC.GECTB373_ENVIO_ARQUIVO is 'ENVIO_ARQUIVO';

--==============================================================
-- Index: GEC1I373
--==============================================================
create unique index GEC.GEC1I373 on GEC.GECTB373_ENVIO_ARQUIVO (
   NU_ENVIO_ARQUIVO     ASC
)
cluster
    USING STOGROUP SGDGEC00    
    PRIQTY 48 SECQTY 48
    ERASE  YES                 
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED           
    COMPRESS NO                
    INCLUDE NULL KEYS          
    BUFFERPOOL BP11            
    CLOSE YES                  
    COPY NO                    
    DEFER NO                   
    DEFINE YES                 
    PIECESIZE 32 G;

--==============================================================
-- Index: GEC2I373
--==============================================================
create index GEC.GEC2I373 on GEC.GECTB373_ENVIO_ARQUIVO (
   NU_BASE_ELEGIVEL     ASC
)
  USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  YES
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 32 G;

alter table GEC.GECTB300_PROPONENTE
   add constraint GEC1F300 foreign key (NU_TIPO_SITUACAO_PROPONENTE, 
NU_SITUACAO_PROPONENTE)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB300_PROPONENTE
   add constraint GEC2F300 foreign key (NU_SITUACAO_ESPECIAL)
      references GEC.GECTB372_SITUACAO_ESPECIAL (NU_SITUACAO_ESPECIAL)
      on delete restrict;

alter table GEC.GECTB302_BASE_ELEGIVEL_CESSAO
   add constraint GEC1F302 foreign key (NU_TIPO_BASE_ELEGIVEL)
      references GEC.GECTB381_TIPO_BASE_ELEGIVEL (NU_TIPO_BASE_ELEGIVEL)

      on delete restrict;

alter table GEC.GECTB304_CREDITO_ELGVL_CESSAO
   add constraint GEC1F304 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB304_CREDITO_ELGVL_CESSAO
   add constraint GEC2F304 foreign key (NU_TIPO_SITUACAO_CREDITO, 
NU_SITUACAO_CREDITO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB304_CREDITO_ELGVL_CESSAO
   add constraint GEC3F304 foreign key (NU_TIPO_CREDITO)
      references GEC.GECTB352_TIPO_CREDITO (NU_TIPO_CREDITO)
      on delete restrict;

alter table GEC.GECTB304_CREDITO_ELGVL_CESSAO
   add constraint GEC4F304 foreign key (NU_BASE_ELEGIVEL, 
NU_SUBLOTE_BASE_ELEGIVEL)
      references GEC.GECTB303_SUBLOTE_BASE_ELEGIVEL (NU_BASE_ELEGIVEL, 
NU_SUBLOTE_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB305_CARTAO_CREDITO
   add constraint GEC1F305 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO)
      references GEC.GECTB304_CREDITO_ELGVL_CESSAO (NU_BASE_ELEGIVEL, 
NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB305_CARTAO_CREDITO
   add constraint GEC2F305 foreign key (NU_TIPO_SITUACAO_CARTAO, 
NU_SITUACAO_CARTAO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB306_PESSOA
   add constraint GEC1F306 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO)
      references GEC.GECTB304_CREDITO_ELGVL_CESSAO (NU_BASE_ELEGIVEL, 
NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB307_PESSOA_FISICA
   add constraint GEC1F307 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA)
      references GEC.GECTB306_PESSOA (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA)
      on delete restrict;

alter table GEC.GECTB308_PESSOA_JURIDICA
   add constraint GEC1F308 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA)
      references GEC.GECTB306_PESSOA (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA)
      on delete restrict;

alter table GEC.GECTB309_ENDERECO
   add constraint GEC1F309 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA)
      references GEC.GECTB306_PESSOA (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA)
      on delete restrict;

alter table GEC.GECTB310_SOCIO_PESSOA_JURIDICA
   add constraint GEC1F310 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO, 
NU_PESSOA)
      references GEC.GECTB308_PESSOA_JURIDICA (NU_BASE_ELEGIVEL, 
NU_CREDITO, NU_PESSOA)
      on delete restrict;

alter table GEC.GECTB311_CESSAO_CREDITO
   add constraint GEC1F311 foreign key (NU_CNPJ_CESSIONARIO)
      references GEC.GECTB300_PROPONENTE (NU_CNPJ_PROPONENTE)
      on delete restrict;

alter table GEC.GECTB312_CESSAO_DOCUMENTO
   add constraint GEC2F312 foreign key (NU_TIPO_DOCUMENTO)
      references GEC.GECTB356_TIPO_DOCUMENTO (NU_TIPO_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB313_SITUACAO_BASE_ELGVL
   add constraint GEC1F313 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB313_SITUACAO_BASE_ELGVL
   add constraint GEC2F313 foreign key (NU_TIPO_SITUACAO_BASE_ELEGIVEL, 
NU_SITUACAO_BASE_ELEGIVEL)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB314_ETAPA_BASE_ELEGIVEL
   add constraint GEC1F314 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB314_ETAPA_BASE_ELEGIVEL
   add constraint GEC2F314 foreign key (NU_ETAPA_CESSAO)
      references GEC.GECTB353_ETAPA_CESSAO (NU_ETAPA_CESSAO)
      on delete restrict;

alter table GEC.GECTB315_DOCUMENTO_PROPONENTE
   add constraint GEC1F315 foreign key (NU_CNPJ_PROPONENTE)
      references GEC.GECTB300_PROPONENTE (NU_CNPJ_PROPONENTE)
      on delete restrict;

alter table GEC.GECTB315_DOCUMENTO_PROPONENTE
   add constraint GEC2F315 foreign key (NU_ETAPA_PROPONENTE, 
NU_DOCUMENTO_NECESSARIO)
      references GEC.GECTB361_ETAPA_CADASTRO_DCMTO (NU_ETAPA_PROPONENTE,
 NU_DOCUMENTO_NECESSARIO)
      on delete restrict;

alter table GEC.GECTB315_DOCUMENTO_PROPONENTE
   add constraint GEC3F315 foreign key (NU_TIPO_SITUACAO_DOCUMENTO, 
NU_SITUACAO_DOCUMENTO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB315_DOCUMENTO_PROPONENTE
   add constraint GEC4F315 foreign key (NU_TIPO_DOCUMENTO)
      references GEC.GECTB356_TIPO_DOCUMENTO (NU_TIPO_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB316_DOCUMENTO_ADICIONAL
   add constraint GEC1F316 foreign key (NU_CNPJ_PROPONENTE, 
NU_ETAPA_PROPONENTE, NU_DOCUMENTO_NECESSARIO)
      references GEC.GECTB315_DOCUMENTO_PROPONENTE (NU_CNPJ_PROPONENTE, 
NU_ETAPA_PROPONENTE, NU_DOCUMENTO_NECESSARIO)
      on delete restrict;

alter table GEC.GECTB317_ACAO_DOCUMENTO
   add constraint GEC1F317 foreign key (NU_CNPJ_PROPONENTE, 
NU_ETAPA_PROPONENTE, NU_DOCUMENTO_NECESSARIO)
      references GEC.GECTB315_DOCUMENTO_PROPONENTE (NU_CNPJ_PROPONENTE, 
NU_ETAPA_PROPONENTE, NU_DOCUMENTO_NECESSARIO)
      on delete restrict;

alter table GEC.GECTB317_ACAO_DOCUMENTO
   add constraint GEC2F317 foreign key (NU_DOCUMENTO_CREDITO)
      references GEC.GECTB312_CESSAO_DOCUMENTO (NU_DOCUMENTO_CREDITO)
      on delete restrict;

alter table GEC.GECTB317_ACAO_DOCUMENTO
   add constraint GEC3F317 foreign key (NU_FLUXO_DOCUMENTO)
      references GEC.GECTB357_FLUXO_DOCUMENTO (NU_FLUXO_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB318_PRDTO_CRDTO_INTERESSE
   add constraint GEC1F318 foreign key (NU_CNPJ_PROPONENTE)
      references GEC.GECTB300_PROPONENTE (NU_CNPJ_PROPONENTE)
      on delete restrict;

alter table GEC.GECTB318_PRDTO_CRDTO_INTERESSE
   add constraint GEC2F318 foreign key (NU_PRODUTO_CREDITO_INTERESSE)
      references GEC.GECTB359_PRODUTO_CREDITO (NU_PRODUTO_CREDITO)
      on delete restrict;

alter table GEC.GECTB319_SUBLOTE_CEDIDO
   add constraint GEC1F319 foreign key (NU_BASE_ELEGIVEL, 
NU_SUBLOTE_BASE_ELEGIVEL)
      references GEC.GECTB303_SUBLOTE_BASE_ELEGIVEL (NU_BASE_ELEGIVEL, 
NU_SUBLOTE_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB319_SUBLOTE_CEDIDO
   add constraint GEC2F319 foreign key (NU_CESSAO_CREDITO)
      references GEC.GECTB311_CESSAO_CREDITO (NU_CESSAO_CREDITO)
      on delete restrict;

alter table GEC.GECTB320_LOTE_CEDIDO
   add constraint GEC1F320 foreign key (NU_CESSAO_CREDITO)
      references GEC.GECTB311_CESSAO_CREDITO (NU_CESSAO_CREDITO)
      on delete restrict;

alter table GEC.GECTB320_LOTE_CEDIDO
   add constraint GEC2F320 foreign key (NU_LOTE_CESSAO, 
NU_BASE_ELEGIVEL)
      references GEC.GECTB322_LOTE_BASE_ELEGIVEL (NU_LOTE_CESSAO, 
NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB321_BASE_ELEGIVEL_CEDIDA
   add constraint GEC1F321 foreign key (NU_CESSAO_CREDITO)
      references GEC.GECTB311_CESSAO_CREDITO (NU_CESSAO_CREDITO)
      on delete restrict;

alter table GEC.GECTB321_BASE_ELEGIVEL_CEDIDA
   add constraint GEC2F321 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB322_LOTE_BASE_ELEGIVEL
   add constraint GEC1F322 foreign key (NU_LOTE_CESSAO)
      references GEC.GECTB301_LOTE_CESSAO (NU_LOTE_CESSAO)
      on delete restrict;

alter table GEC.GECTB322_LOTE_BASE_ELEGIVEL
   add constraint GEC2F322 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB323_ANEXO_HABILITACAO
   add constraint GEC1F323 foreign key (NU_CNPJ_PROPONENTE)
      references GEC.GECTB300_PROPONENTE (NU_CNPJ_PROPONENTE)
      on delete restrict;

alter table GEC.GECTB323_ANEXO_HABILITACAO
   add constraint GEC2F323 foreign key (NU_DOCUMENTO_CREDITO)
      references GEC.GECTB312_CESSAO_DOCUMENTO (NU_DOCUMENTO_CREDITO)
      on delete restrict;

alter table GEC.GECTB324_ANEXO_BASE_ELEGIVEL
   add constraint GEC1F324 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB324_ANEXO_BASE_ELEGIVEL
   add constraint GEC2F324 foreign key (NU_DOCUMENTO_CREDITO)
      references GEC.GECTB312_CESSAO_DOCUMENTO (NU_DOCUMENTO_CREDITO)
      on delete restrict;

alter table GEC.GECTB325_ANEXO_CESSAO
   add constraint GEC1F325 foreign key (NU_CESSAO_CREDITO)
      references GEC.GECTB311_CESSAO_CREDITO (NU_CESSAO_CREDITO)
      on delete restrict;

alter table GEC.GECTB325_ANEXO_CESSAO
   add constraint GEC2F325 foreign key (NU_DOCUMENTO_CREDITO)
      references GEC.GECTB312_CESSAO_DOCUMENTO (NU_DOCUMENTO_CREDITO)
      on delete restrict;

alter table GEC.GECTB326_CESSAO_CREDITO_DSFTO
   add constraint GEC1F326 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB326_CESSAO_CREDITO_DSFTO
   add constraint GEC2F326 foreign key (NU_TIPO_CESSAO_DESFEITA, 
NU_SITUACAO_CESSAO_DESFEITA)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB326_CESSAO_CREDITO_DSFTO
   add constraint GEC3F326 foreign key (NU_EVENTO_CESSAO)
      references GEC.GECTB340_EVENTO_CESSAO (NU_EVENTO_CESSAO)
      on delete restrict;

alter table GEC.GECTB327_CRDTO_SLCTO_DSFMNTO
   add constraint GEC1F327 foreign key (NU_BASE_ELEGIVEL, 
NU_CREDITO_DESFEITO)
      references GEC.GECTB304_CREDITO_ELGVL_CESSAO (NU_BASE_ELEGIVEL, 
NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB327_CRDTO_SLCTO_DSFMNTO
   add constraint GEC2F327 foreign key (NU_CESSAO_CREDITO_DESFEITO)
      references GEC.GECTB326_CESSAO_CREDITO_DSFTO 
(NU_CESSAO_CREDITO_DESFEITO)
      on delete restrict;

alter table GEC.GECTB327_CRDTO_SLCTO_DSFMNTO
   add constraint GEC3F327 foreign key (NU_TIPO_CREDITO_DESFEITO, 
NU_SITUACAO_CREDITO_DESFEITO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB327_CRDTO_SLCTO_DSFMNTO
   add constraint GEC4F327 foreign key (NU_MOTIVO_DESFAZIMENTO)
      references GEC.GECTB329_MOTIVO_DSFZMNTO_CRDTO 
(NU_MOTIVO_DESFAZIMENTO_CREDITO)
      on delete restrict;

alter table GEC.GECTB330_SLCTO_RESTRICAO_CLNTE
   add constraint GEC1F330 foreign key (NU_TIPO_SITUACAO, NU_SITUACAO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB330_SLCTO_RESTRICAO_CLNTE
   add constraint GEC2F330 foreign key (NU_CNPJ_PROPONENTE)
      references GEC.GECTB300_PROPONENTE (NU_CNPJ_PROPONENTE)
      on delete restrict;

alter table GEC.GECTB330_SLCTO_RESTRICAO_CLNTE
   add constraint GEC3F330 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB330_SLCTO_RESTRICAO_CLNTE
   add constraint GEC4F330 foreign key (NU_EVENTO_CESSAO)
      references GEC.GECTB340_EVENTO_CESSAO (NU_EVENTO_CESSAO)
      on delete restrict;

alter table GEC.GECTB331_CRDTO_SLCTO_RESTRICAO
   add constraint GEC1F331 foreign key (NU_SLCTO_RESTRICAO_CLIENTE)
      references GEC.GECTB330_SLCTO_RESTRICAO_CLNTE 
(NU_SLCTO_RESTRICAO_CLIENTE)
      on delete restrict;

alter table GEC.GECTB331_CRDTO_SLCTO_RESTRICAO
   add constraint GEC2F331 foreign key (NU_BASE_ELEGIVEL, NU_CREDITO)
      references GEC.GECTB304_CREDITO_ELGVL_CESSAO (NU_BASE_ELEGIVEL, 
NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB331_CRDTO_SLCTO_RESTRICAO
   add constraint GEC3F331 foreign key (NU_TIPO_SITUACAO, NU_SITUACAO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

alter table GEC.GECTB332_RGSTO_RESTRICAO_ERRO
   add constraint GEC1F332 foreign key (NU_SLCTO_RESTRICAO_CLIENTE)
      references GEC.GECTB330_SLCTO_RESTRICAO_CLNTE 
(NU_SLCTO_RESTRICAO_CLIENTE)
      on delete restrict;

alter table GEC.GECTB333_CRTCA_REGISTRO_ERRO
   add constraint GEC1F333 foreign key (NU_SLCTO_RESTRICAO_CLIENTE, 
NU_REGISTRO_ERRO)
      references GEC.GECTB332_RGSTO_RESTRICAO_ERRO 
(NU_SLCTO_RESTRICAO_CLIENTE, NU_REGISTRO_ERRO)
      on delete restrict;

alter table GEC.GECTB333_CRTCA_REGISTRO_ERRO
   add constraint GEC2F333 foreign key (CO_CRTCA_SLCTO_RESTRICAO)
      references GEC.GECTB334_CRTCA_SLCTO_RESTRICAO 
(CO_CRTCA_SLCTO_RESTRICAO)
      on delete restrict;

alter table GEC.GECTB336_EVENTO_SISTEMA
   add constraint GEC1F336 foreign key (NU_PROCESSO_SISTEMA)
      references GEC.GECTB335_PROCESSO_SISTEMA (NU_PROCESSO_SISTEMA)
      on delete restrict;

alter table GEC.GECTB337_ACAO_AUDITADA
   add constraint GEC1F337 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB337_ACAO_AUDITADA
   add constraint GEC2F337 foreign key (NU_PROCESSO_SISTEMA, 
NU_EVENTO_SISTEMA)
      references GEC.GECTB336_EVENTO_SISTEMA (NU_PROCESSO_SISTEMA, 
NU_EVENTO_SISTEMA)
      on delete restrict;

alter table GEC.GECTB338_DETALHE_ACAO_AUDITADA
   add constraint GEC1F338 foreign key (NU_ACAO_AUDITADA)
      references GEC.GECTB337_ACAO_AUDITADA (NU_ACAO_AUDITADA)
      on delete restrict;

alter table GEC.GECTB339_ANEXO_CESSAO_DEFEITA
   add constraint GEC1F339 foreign key (NU_CESSAO_CREDITO_DESFEITO)
      references GEC.GECTB326_CESSAO_CREDITO_DSFTO 
(NU_CESSAO_CREDITO_DESFEITO)
      on delete restrict;

alter table GEC.GECTB339_ANEXO_CESSAO_DEFEITA
   add constraint GEC2F339 foreign key (NU_DOCUMENTO_CREDITO)
      references GEC.GECTB312_CESSAO_DOCUMENTO (NU_DOCUMENTO_CREDITO)
      on delete restrict;

alter table GEC.GECTB351_SITUACAO
   add constraint GEC1F351 foreign key (NU_TIPO_SITUACAO)
      references GEC.GECTB350_TIPO_SITUACAO (NU_TIPO_SITUACAO)
      on delete restrict;

alter table GEC.GECTB355_EXECUCAO_ROTINA
   add constraint GEC1F355 foreign key (NU_PRCSO_EXEC_ROTINA)
      references GEC.GECTB354_PROCESSO_EXEC_ROTINA 
(NU_PROCESSO_EXECUCAO_ROTINA)
      on delete restrict;

alter table GEC.GECTB355_EXECUCAO_ROTINA
   add constraint GEC2F355 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB356_TIPO_DOCUMENTO
   add constraint GEC1F356 foreign key (NU_GRUPO_DOCUMENTO)
      references GEC.GECTB364_GRUPO_DOCUMENTO (NU_GRUPO_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB358_DCMNO_ENTIDADE_EMPRL
   add constraint GEC1F358 foreign key (NU_DOCUMENTO_NECESSARIO)
      references GEC.GECTB362_DOCUMENTO_NECESSARIO 
(NU_DOCUMENTO_NECESSARIO)
      on delete restrict;

alter table GEC.GECTB361_ETAPA_CADASTRO_DCMTO
   add constraint GEC1F361 foreign key (NU_ETAPA_PROPONENTE)
      references GEC.GECTB360_ETAPA_CADASTRO (NU_ETAPA_PROPONENTE)
      on delete restrict;

alter table GEC.GECTB361_ETAPA_CADASTRO_DCMTO
   add constraint GEC2F361 foreign key (NU_DOCUMENTO_NECESSARIO)
      references GEC.GECTB362_DOCUMENTO_NECESSARIO 
(NU_DOCUMENTO_NECESSARIO)
      on delete restrict;

alter table GEC.GECTB363_FILTRO_CREDITO
   add constraint GEC1F363 foreign key (NU_PRCSO_EXEC_ROTINA, 
NU_EXECUCAO_ROTINA)
      references GEC.GECTB355_EXECUCAO_ROTINA (NU_PRCSO_EXEC_ROTINA, 
NU_EXECUCAO_ROTINA)
      on delete restrict;

alter table GEC.GECTB363_FILTRO_CREDITO
   add constraint GEC2F363 foreign key (CO_TIPO_FILTRO)
      references GEC.GECTB375_TIPO_FILTRO (CO_TIPO_FILTRO)
      on delete restrict;

alter table GEC.GECTB373_ENVIO_ARQUIVO
   add constraint GEC1F373 foreign key (NU_BASE_ELEGIVEL)
      references GEC.GECTB302_BASE_ELEGIVEL_CESSAO (NU_BASE_ELEGIVEL)
      on delete restrict;

alter table GEC.GECTB373_ENVIO_ARQUIVO
   add constraint GEC2F373 foreign key (NU_TIPO_SITUACAO, NU_SITUACAO)
      references GEC.GECTB351_SITUACAO (NU_TIPO_SITUACAO, NU_SITUACAO)
      on delete restrict;

