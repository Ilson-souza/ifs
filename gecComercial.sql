--==============================================================
-- DBMS name:      IBM DB2 Version 12 for z/OS
-- Created on:     23/11/2025 09:43:51
--==============================================================


--==============================================================
-- User: GEC
--==============================================================
--==============================================================
-- User: ICO
--==============================================================
--==============================================================
-- Table: GECTB784_PRODUTO_CREDITO
--==============================================================
create table GEC.GECTB784_PRODUTO_CREDITO (
   NU_PRODUTO           SMALLINT              
      not null,
   IC_TIPO_PRODUTO      CHAR(1)               
      not null with default 'S'
         constraint GEC1C784 check (IC_TIPO_PRODUTO in ('S','C')),
   DT_INICIO_VIGENCIA   DATE                  
      not null,
   DT_FIM_VIGENCIA      DATE,
   CO_ARQUIVO_CONTABIL  CHAR(2),
   CO_ARQUIVO_IFMCO_GRNCL_CRDTO CHAR(2),
   NU_LEIAUTE_ARQUIVO_AQUISICAO SMALLINT,
   VR_SALDO_SUBCONTA    DECIMAL(17, 2),
   constraint GECPK784 primary key (NU_PRODUTO)
)
 in GECDB002.GECTS784;

label on table GEC.GECTB784_PRODUTO_CREDITO is 'PRODUTO_CREDITO';
label on column 
GEC.GECTB784_PRODUTO_CREDITO.CO_ARQUIVO_IFMCO_GRNCL_CRDTO is 
'CO_ARQUIVO_INFORMACAO_GERENCIAL_CREDITO';
--==============================================================
-- Index: GEC1I784
--==============================================================
create unique index GEC.GEC1I784 on GEC.GECTB784_PRODUTO_CREDITO (
   NU_PRODUTO           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB785_PARAMETRO_DINAMICO
--==============================================================
create table GEC.GECTB785_PARAMETRO_DINAMICO (
   NO_PARAMETRO_DINAMICO CHAR(30)              
      not null,
   CO_PARAMETRO_DINAMICO CHAR(30)              
      not null,
   constraint GECPK785 primary key (NO_PARAMETRO_DINAMICO)
)
 in GECDB002.GECTS785;

label on table GEC.GECTB785_PARAMETRO_DINAMICO is 'PARAMETRO_DINAMICO';


--==============================================================
-- Index: GEC1I785
--==============================================================
create unique index GEC.GEC1I785 on GEC.GECTB785_PARAMETRO_DINAMICO (
   NO_PARAMETRO_DINAMICO ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB786_ESTAGIO_RISCO_CREDITO
--==============================================================
create table GEC.GECTB786_ESTAGIO_RISCO_CREDITO (
   NU_CREDITO           DECIMAL(19)           
      not null,
   TS_INCLUSAO_ESTAGIO  TIMESTAMP             
      not null,
   DT_ESTAGIO_RISCO_CREDITO DATE,
   NU_TIPO_ESTAGIO_RISCO SMALLINT,
   NU_MOTIVO_ESTAGIO_RISCO SMALLINT,
   IC_SITUACAO_ENVIO_ESTAGIO CHAR(1)               
      not null with default 'P'
         constraint GEC1C786 check (IC_SITUACAO_ENVIO_ESTAGIO in ('P',
'E','R','C','I')),
   IC_ESTAGIO_CARGA_INICIAL CHAR(1)               
      not null with default 'N'
         constraint GEC2C786 check (IC_ESTAGIO_CARGA_INICIAL in ('S','N'
)),
   DT_ESTAGIO_RISCO_CEDENTE DATE,
   NU_ESTAGIO_RISCO_CEDENTE SMALLINT,
   constraint GECPK786 primary key (NU_CREDITO, TS_INCLUSAO_ESTAGIO)
)
 in GECDB002.GECTS786;

label on table GEC.GECTB786_ESTAGIO_RISCO_CREDITO is 
'ESTAGIO_RISCO_CREDITO';
label on column 
GEC.GECTB786_ESTAGIO_RISCO_CREDITO.IC_SITUACAO_ENVIO_ESTAGIO is 
'IC_SITUACAO_ENVIO_ESTAGIO_RISCO';
--==============================================================
-- Index: GEC1I786
--==============================================================
create unique index GEC.GEC1I786 on GEC.GECTB786_ESTAGIO_RISCO_CREDITO (

   NU_CREDITO           ASC,
   TS_INCLUSAO_ESTAGIO  ASC
)
cluster
 using stogroup SGDDB201
    priqty 240
    secqty 240
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 4 G
copy no;

--==============================================================
-- Index: GEC2I786
--==============================================================
create index GEC.GEC2I786 on GEC.GECTB786_ESTAGIO_RISCO_CREDITO (
   NU_TIPO_ESTAGIO_RISCO ASC
)
using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
bufferpool BP11
close yes
copy no;

--==============================================================
-- Table: GECTB787_MOTIVO_ESTAGIO_RISCO
--==============================================================
create table GEC.GECTB787_MOTIVO_ESTAGIO_RISCO (
   NU_TIPO_ESTAGIO_RISCO SMALLINT              
      not null,
   NU_MOTIVO_ESTAGIO_RISCO SMALLINT              
      not null,
   DE_MOTIVO_ESTAGIO_RISCO VARCHAR(100)          
      not null,
   constraint GECPK787 primary key (NU_TIPO_ESTAGIO_RISCO, 
NU_MOTIVO_ESTAGIO_RISCO)
)
 in GECDB002.GECTS787;

label on table GEC.GECTB787_MOTIVO_ESTAGIO_RISCO is 
'MOTIVO_ESTAGIO_RISCO';

--==============================================================
-- Index: GEC1I787
--==============================================================
create unique index GEC.GEC1I787 on GEC.GECTB787_MOTIVO_ESTAGIO_RISCO (

   NU_TIPO_ESTAGIO_RISCO ASC,
   NU_MOTIVO_ESTAGIO_RISCO ASC
)
not cluster
 using stogroup SGDDB201
    priqty 240
    secqty 240
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 4 G
copy no;

--==============================================================
-- Table: GECTB788_TIPO_ESTAGIO_RISCO
--==============================================================
create table GEC.GECTB788_TIPO_ESTAGIO_RISCO (
   NU_TIPO_ESTAGIO_RISCO SMALLINT              
      not null,
   DE_TIPO_ESTAGIO_RISCO VARCHAR(100)          
      not null,
   constraint GECPK788 primary key (NU_TIPO_ESTAGIO_RISCO)
)
 in GECDB002.GECTS788;

label on table GEC.GECTB788_TIPO_ESTAGIO_RISCO is 'TIPO_ESTAGIO_RISCO';


--==============================================================
-- Index: GEC1I788
--==============================================================
create unique index GEC.GEC1I788 on GEC.GECTB788_TIPO_ESTAGIO_RISCO (
   NU_TIPO_ESTAGIO_RISCO ASC
)
not cluster
 using stogroup SGDDB201
    priqty 240
    secqty 240
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 4 G
copy no;

--==============================================================
-- Table: GECTB789_ARQUIVO_INTERFACE
--==============================================================
create table GEC.GECTB789_ARQUIVO_INTERFACE (
   NU_ARQUIVO_INTERFACE INTEGER               
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
   NU_TIPO_ARQUIVO_INTERFACE SMALLINT              
      not null,
   IM_CONTEUDO_ARQUIVO  BLOB(2G)              
      not null,
   IC_SITUACAO_ARQUIVO  CHAR(1)               
      not null with default '0'
         constraint GEC1C789 check (IC_SITUACAO_ARQUIVO in ('0','1','2',
'3')),
   TS_CADASTRO_ARQUIVO  TIMESTAMP             
      not null,
   NO_ARQUIVO_PROCESSADO VARCHAR(100),
   constraint GECPK789 primary key (NU_ARQUIVO_INTERFACE)
)
 in GECDB002.GECTS789;

label on table GEC.GECTB789_ARQUIVO_INTERFACE is 'ARQUIVO_INTERFACE';

--==============================================================
-- Index: GEC1I789
--==============================================================
create unique index GEC.GEC1I789 on GEC.GECTB789_ARQUIVO_INTERFACE (
   NU_ARQUIVO_INTERFACE ASC
)
not cluster
 using stogroup SGDDB201
    priqty 240
    secqty 240
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 4 G
copy no;

--==============================================================
-- Index: GEC2I789
--==============================================================
create index GEC.GEC2I789 on GEC.GECTB789_ARQUIVO_INTERFACE (
   NU_TIPO_ARQUIVO_INTERFACE ASC,
   IC_SITUACAO_ARQUIVO  ASC
)
not cluster
 using stogroup SGDDB201
    priqty 240
    secqty 240
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 4 G
copy no;

--==============================================================
-- Table: GECTB790_TIPO_ARQVO_INTERFACE
--==============================================================
create table GEC.GECTB790_TIPO_ARQVO_INTERFACE (
   NU_TIPO_ARQUIVO_INTERFACE SMALLINT              
      not null,
   DE_TIPO_ARQUIVO_INTERFACE VARCHAR(100)          
      not null,
   constraint GECPK790 primary key (NU_TIPO_ARQUIVO_INTERFACE)
)
 in GECDB002.GECTS790;

label on table GEC.GECTB790_TIPO_ARQVO_INTERFACE is 
'TIPO_ARQUIVO_INTERFACE';

--==============================================================
-- Index: GEC1I790
--==============================================================
create unique index GEC.GEC1I790 on GEC.GECTB790_TIPO_ARQVO_INTERFACE (

   NU_TIPO_ARQUIVO_INTERFACE ASC
)
not cluster
 using stogroup SGDDB201
    priqty 240
    secqty 240
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 4 G
copy no;

--==============================================================
-- Table: GECTB791_CNTLE_ENVIO_INFRO
--==============================================================
create table GEC.GECTB791_CNTLE_ENVIO_INFRO (
   NU_CREDITO           DECIMAL(19)           
      not null,
   CO_TIPO_CONTROLE_ENVIO CHAR(2)               
      not null,
   CO_SITUACAO_CONTROLE_ENVIO CHAR(2)               
      not null,
   TS_CADASTRO_ENVIO_CREDITO TIMESTAMP             
      not null,
   constraint GECPK791 primary key (NU_CREDITO, CO_TIPO_CONTROLE_ENVIO, 
CO_SITUACAO_CONTROLE_ENVIO)
)
 in GECDB002.GECTS790;

label on table GEC.GECTB791_CNTLE_ENVIO_INFRO is 
'CONTROLE_ENVIO_INFORMACAO';

--==============================================================
-- Index: GEC1I791
--==============================================================
create unique index GEC.GEC1I791 on GEC.GECTB791_CNTLE_ENVIO_INFRO (
   NU_CREDITO           ASC,
   CO_TIPO_CONTROLE_ENVIO ASC,
   CO_SITUACAO_CONTROLE_ENVIO ASC
)
cluster
 using stogroup SGDDB201
    priqty 240
    secqty 240
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 4 G
copy no;

--==============================================================
-- Table: GECTB792_CONCILIACAO_C3
--==============================================================
create table GEC.GECTB792_CONCILIACAO_C3 (
   CO_CONCILIACAO_C3    CHAR(21)              
      not null,
   DT_CONCILIACAO_C3    DATE                  
      not null,
   QT_CONTRATO          INTEGER               
      not null,
   IC_SITUACAO_CONCILIACAO_C3 CHAR(1)               
      not null with default '0'
         constraint GEC1C792 check (IC_SITUACAO_CONCILIACAO_C3 in ('0',
'1','2','3','4')),
   DE_JUSTIFICATIVA     VARCHAR(200),
   IC_SITUACAO_EXECUCAO_C3 CHAR(1)               
      not null with default '1'
         constraint GEC2C792 check (IC_SITUACAO_EXECUCAO_C3 in ('1','2',
'3')),
   TS_INCLUSAO_CONCILIACAO_C3 TIMESTAMP             
      not null,
   QT_ARQUIVO_CONCILIACAO_C3 SMALLINT              
      not null with default 0,
   constraint GECPK792 primary key (CO_CONCILIACAO_C3)
)
 in GECDB002.GECTS792;

label on table GEC.GECTB792_CONCILIACAO_C3 is 'CONCILIACAO_C3';

--==============================================================
-- Index: GEC1I792
--==============================================================
create unique index GEC.GEC1I792 on GEC.GECTB792_CONCILIACAO_C3 (
   CO_CONCILIACAO_C3    ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB793_INTERFACE_ARQUIVO_C3
--==============================================================
create table GEC.GECTB793_INTERFACE_ARQUIVO_C3 (
   NU_ARQUIVO           DEC(18)               
      not null,
   NU_ARQUIVO_INTERFACE INTEGER               
      not null,
   constraint GECPK793 primary key (NU_ARQUIVO, NU_ARQUIVO_INTERFACE)
)
 in GECDB002.GECTS793;

label on table GEC.GECTB793_INTERFACE_ARQUIVO_C3 is 
'INTERFACE_ARQUIVO_C3';

--==============================================================
-- Index: GEC1I793
--==============================================================
create unique index GEC.GEC1I793 on GEC.GECTB793_INTERFACE_ARQUIVO_C3 (

   NU_ARQUIVO           ASC,
   NU_ARQUIVO_INTERFACE ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB794_CNTLE_ARQUIVO_PCSDO
--==============================================================
create table GEC.GECTB794_CNTLE_ARQUIVO_PCSDO (
   NU_CONTROLE_EXECUCAO_ROTINA INTEGER               
      not null,
   CO_ROTINA_PROCESSAMENTO CHAR(8)               
      not null,
   NU_ARQUIVO_INTERFACE INTEGER               
      not null,
   constraint GECPK794 primary key (NU_CONTROLE_EXECUCAO_ROTINA, 
CO_ROTINA_PROCESSAMENTO, NU_ARQUIVO_INTERFACE)
)
 in GECDB002.GECTS794;

label on table GEC.GECTB794_CNTLE_ARQUIVO_PCSDO is 
'CONTROLE_ARQUIVO_PROCESSADO';
label on column GEC.GECTB794_CNTLE_ARQUIVO_PCSDO.CO_ROTINA_PROCESSAMENTO
 is 'CO_ROTINA_PROCESSAMENTO_SISTEMA';
--==============================================================
-- Index: GEC1I794
--==============================================================
create unique index GEC.GEC1I794 on GEC.GECTB794_CNTLE_ARQUIVO_PCSDO (
   NU_CONTROLE_EXECUCAO_ROTINA ASC,
   CO_ROTINA_PROCESSAMENTO ASC,
   NU_ARQUIVO_INTERFACE ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB795_ARQVO_CONCILIACAO_C3
--==============================================================
create table GEC.GECTB795_ARQVO_CONCILIACAO_C3 (
   NU_ARQUIVO           DEC(18)               
      not null,
   CO_CONCILIACAO       CHAR(21)              
      not null,
   constraint GECPK795 primary key (NU_ARQUIVO, CO_CONCILIACAO)
)
 in GECDB002.GECTS795;

label on table GEC.GECTB795_ARQVO_CONCILIACAO_C3 is 
'ARQUIVO_CONCILIACAO_C3';

--==============================================================
-- Index: GEC1I795
--==============================================================
create unique index GEC.GEC1I795 on GEC.GECTB795_ARQVO_CONCILIACAO_C3 (

   NU_ARQUIVO           ASC,
   CO_CONCILIACAO       ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB796_CREDITO_CONCILIACAO
--==============================================================
create table GEC.GECTB796_CREDITO_CONCILIACAO (
   NU_CREDITO           DECIMAL(19)           
      not null,
   CO_CONCILIACAO_C3    CHAR(21)              
      not null,
   NU_JUSTIFICATIVA_CONCILIACAO SMALLINT              
      not null,
   TS_CREDITO_CONCILIACAO TIMESTAMP,
   constraint GECPK796 primary key (NU_CREDITO, CO_CONCILIACAO_C3, 
NU_JUSTIFICATIVA_CONCILIACAO)
)
 in GECDB002.GECTS796;

label on table GEC.GECTB796_CREDITO_CONCILIACAO is 'CREDITO_CONCILIACAO'
;

--==============================================================
-- Index: GEC1I796
--==============================================================
create unique index GEC.GEC1I796 on GEC.GECTB796_CREDITO_CONCILIACAO (
   NU_CREDITO           ASC,
   CO_CONCILIACAO_C3    ASC,
   NU_JUSTIFICATIVA_CONCILIACAO ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I796
--==============================================================
create index GEC.GEC2I796 on GEC.GECTB796_CREDITO_CONCILIACAO (
   CO_CONCILIACAO_C3    ASC
)
using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I796
--==============================================================
create index GEC.GEC3I796 on GEC.GECTB796_CREDITO_CONCILIACAO (
   NU_CREDITO           ASC
)
using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB797_JUSTIFICATIVA_CNCLO
--==============================================================
create table GEC.GECTB797_JUSTIFICATIVA_CNCLO (
   NU_JUSTIFICATIVA_CONCILIACAO SMALLINT              
      not null,
   DE_JUSTIFICATIVA_CNCLO VARCHAR(100)          
      not null,
   constraint GECPK797 primary key (NU_JUSTIFICATIVA_CONCILIACAO)
)
 in GECDB002.GECTS797;

label on table GEC.GECTB797_JUSTIFICATIVA_CNCLO is 
'JUSTIFICATIVA_CONCILIACAO';

--==============================================================
-- Index: GEC1I797
--==============================================================
create unique index GEC.GEC1I797 on GEC.GECTB797_JUSTIFICATIVA_CNCLO (
   NU_JUSTIFICATIVA_CONCILIACAO ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB798_HSTRO_LNCTO_CONTABIL
--==============================================================
create table GEC.GECTB798_HSTRO_LNCTO_CONTABIL (
   NU_PERIODO_MOVIMENTO INTEGER               
      not null,
   NU_ROTEIRO_CONTABIL  DECIMAL(9)            
      not null,
   NU_IF                SMALLINT              
      not null,
   TS_ATUALIZACAO_REGISTRO TIMESTAMP             
      not null,
   QT_TOTAL_RGSTO_RTRO_CNTBL INTEGER               
      not null,
   VR_TOTAL_LNCMO_RTRO_CNTBL DECIMAL(17,2)         
      not null,
   CO_USUARIO_EXECUTOU_ATLZO CHAR(7)               
      not null,
   IC_TIPO_ATUALIZACAO_REGISTRO CHAR(1)               
      not null with default 'I'
         constraint GEC1C798 check (IC_TIPO_ATUALIZACAO_REGISTRO in ('I'
,'A','E')),
   constraint GECPK798 primary key (NU_PERIODO_MOVIMENTO, NU_IF, 
NU_ROTEIRO_CONTABIL, TS_ATUALIZACAO_REGISTRO)
)
 in GECDB002.GECTS798;

label on table GEC.GECTB798_HSTRO_LNCTO_CONTABIL is 
'HISTORICO_LANCAMENTO_CONTABIL_MENSAL';
label on column 
GEC.GECTB798_HSTRO_LNCTO_CONTABIL.QT_TOTAL_RGSTO_RTRO_CNTBL is 
'QT_TOTAL_REGISTRO_ROTEIRO_CONTABIL';
label on column 
GEC.GECTB798_HSTRO_LNCTO_CONTABIL.VR_TOTAL_LNCMO_RTRO_CNTBL is 
'VR_TOTAL_LANCAMENTO_ROTEIRO_CONTABIL';
label on column 
GEC.GECTB798_HSTRO_LNCTO_CONTABIL.CO_USUARIO_EXECUTOU_ATLZO is 
'CO_USUARIO_EXECUTOU_ATUALIZACAO';
--==============================================================
-- Index: GEC1I798
--==============================================================
create unique index GEC.GEC1I798 on GEC.GECTB798_HSTRO_LNCTO_CONTABIL (

   NU_PERIODO_MOVIMENTO ASC,
   NU_IF                ASC,
   NU_ROTEIRO_CONTABIL  ASC,
   TS_ATUALIZACAO_REGISTRO ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
copy no;

--==============================================================
-- Index: GEC2I798
--==============================================================
create index GEC.GEC2I798 on GEC.GECTB798_HSTRO_LNCTO_CONTABIL (
   NU_PERIODO_MOVIMENTO ASC
)
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
copy no;

--==============================================================
-- Table: GECTB799_CONSULTA_RESTRICAO
--==============================================================
create table GEC.GECTB799_CONSULTA_RESTRICAO (
   NU_CONSULTA_RESTRICAO INTEGER               
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
   NU_SITUACAO_CONSULTA_RESTRICAO SMALLINT              
      not null,
   QT_CLIENTE_CONSULTA  INTEGER               
      not null,
   QT_CLIENTE_RESTRICAO INTEGER               
      not null,
   TS_CONSULTA_RESTRICAO TIMESTAMP             
      not null,
   constraint GECPK799 primary key (NU_CONSULTA_RESTRICAO)
)
 in GECDB002.GECTS799;

label on table GEC.GECTB799_CONSULTA_RESTRICAO is 'CONSULTA_RESTRICAO';


--==============================================================
-- Index: GEC1I799
--==============================================================
create unique index GEC.GEC1I799 on GEC.GECTB799_CONSULTA_RESTRICAO (
   NU_CONSULTA_RESTRICAO ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB800_STCO_CNSLA_RESTRICAO
--==============================================================
create table GEC.GECTB800_STCO_CNSLA_RESTRICAO (
   NU_SITUACAO_CONSULTA_RESTRICAO SMALLINT              
      not null,
   DE_STCO_CNSLA_RESTRICAO VARCHAR(100)          
      not null,
   constraint GECPK800 primary key (NU_SITUACAO_CONSULTA_RESTRICAO)
)
 in GECDB002.GECTS800;

label on table GEC.GECTB800_STCO_CNSLA_RESTRICAO is 
'SITUACAO_CONSULTA_RESTRICAO';
label on column 
GEC.GECTB800_STCO_CNSLA_RESTRICAO.DE_STCO_CNSLA_RESTRICAO is 
'DE_SITUACAO_CONSULTA_RESTRICAO';
--==============================================================
-- Index: GEC1I800
--==============================================================
create unique index GEC.GEC1I800 on GEC.GECTB800_STCO_CNSLA_RESTRICAO (

   NU_SITUACAO_CONSULTA_RESTRICAO ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB801_CNSLA_RSTCO_ARQVO
--==============================================================
create table GEC.GECTB801_CNSLA_RSTCO_ARQVO (
   NU_CONSULTA_RESTRICAO INTEGER               
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
   NU_ARQUIVO_CESSAO    DECIMAL(18)           
      not null,
   constraint GECPK801 primary key (NU_ARQUIVO_CESSAO, 
NU_CONSULTA_RESTRICAO)
)
 in GECDB002.GECTS801;

label on table GEC.GECTB801_CNSLA_RSTCO_ARQVO is 
'CONSULTA_RESTRICAO_ARQUIVO_CESSAO';

--==============================================================
-- Index: GEC1I801
--==============================================================
create unique index GEC.GEC1I801 on GEC.GECTB801_CNSLA_RSTCO_ARQVO (
   NU_ARQUIVO_CESSAO    ASC,
   NU_CONSULTA_RESTRICAO ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB802_RESTRICAO_CLIENTE
--==============================================================
create table GEC.GECTB802_RESTRICAO_CLIENTE (
   NU_CONSULTA_RESTRICAO INTEGER               
      not null,
   NU_TIPO_RESTRICAO    SMALLINT              
      not null,
   NU_CPF_CLIENTE       DECIMAL(11)           
      not null,
   SG_FONTE_INFORMACAO  CHAR(5)               
      not null,
   constraint GECPK802 primary key (NU_CONSULTA_RESTRICAO, 
NU_TIPO_RESTRICAO, NU_CPF_CLIENTE)
)
 in GECDB002.GECTS802;

label on table GEC.GECTB802_RESTRICAO_CLIENTE is 'RESTRICAO_CLIENTE';

--==============================================================
-- Index: GEC1I802
--==============================================================
create unique index GEC.GEC1I802 on GEC.GECTB802_RESTRICAO_CLIENTE (
   NU_CONSULTA_RESTRICAO ASC,
   NU_TIPO_RESTRICAO    ASC,
   NU_CPF_CLIENTE       ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB803_TIPO_RESTRICAO
--==============================================================
create table GEC.GECTB803_TIPO_RESTRICAO (
   NU_TIPO_RESTRICAO    SMALLINT              
      not null,
   DE_TIPO_RESTRICAO    VARCHAR(100)          
      not null,
   constraint GECPK803 primary key (NU_TIPO_RESTRICAO)
)
 in GECDB002.GECTS803;

label on table GEC.GECTB803_TIPO_RESTRICAO is 'TIPO_RESTRICAO';

--==============================================================
-- Index: GEC1I803
--==============================================================
create unique index GEC.GEC1I803 on GEC.GECTB803_TIPO_RESTRICAO (
   NU_TIPO_RESTRICAO    ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: ICOTBH01_EMPRO_CXA
--==============================================================
create table ICO.ICOTBH01_EMPRO_CXA (
   NU_MATRICULA         INTEGER               
      not null,
   NU_DV_MATRICULA      SMALLINT              
      not null,
   NO_PESSOA            VARCHAR(70)           
      not null,
   DT_PRVSA_DSLGO       DATE,
   NU_UNIDADE_U24       SMALLINT,
   NU_NATURAL_U24       INTEGER,
   NU_FUNCAO_H03        SMALLINT,
   CO_CARGO_H05         CHAR(6),
   NU_CPF_EMPREGADO     DECIMAL(11),
   NU_UNDDE_ALCCO_U24   SMALLINT,
   NU_NTRL_ALCCO_U24    INTEGER,
   constraint ICOPKH01 primary key (NU_MATRICULA),
   constraint IC_INCOM check (IC_INCOMPLETO IN ('S', 'N'))
);

label on table ICO.ICOTBH01_EMPRO_CXA is 'ICOTBH01_EMPRO_CXA2';
label on column ICO.ICOTBH01_EMPRO_CXA.NU_MATRICULA is 
'MATRICULA EMPREGADO';
label on column ICO.ICOTBH01_EMPRO_CXA.NU_DV_MATRICULA is 
'NU_DIGITO_VERIFICADOR_MATRICULA';
label on column ICO.ICOTBH01_EMPRO_CXA.DT_PRVSA_DSLGO is 
'DT_PREVISTA_DESLIGAMENTO';
label on column ICO.ICOTBH01_EMPRO_CXA.NU_UNIDADE_U24 is 'NU_UNIDADE';
label on column ICO.ICOTBH01_EMPRO_CXA.NU_NATURAL_U24 is 'NU_NATURAL';
label on column ICO.ICOTBH01_EMPRO_CXA.NU_FUNCAO_H03 is 'NU_FUNCAO';
label on column ICO.ICOTBH01_EMPRO_CXA.CO_CARGO_H05 is 'CO_CARGO';
label on column ICO.ICOTBH01_EMPRO_CXA.NU_UNDDE_ALCCO_U24 is 
'NU_UNIDADE_ALOCACAO';
label on column ICO.ICOTBH01_EMPRO_CXA.NU_NTRL_ALCCO_U24 is 
'NU_NATURAL_ALOCACAO';
--==============================================================
-- Table: ICOTBL22_UNIDFED
--==============================================================
create table ICO.ICOTBL22_UNIDFED (
   SG_UF                CHAR(2)               
      not null,
   constraint ICOPKL22 primary key (SG_UF)
);

label on table ICO.ICOTBL22_UNIDFED is 'UF';

--==============================================================
-- Table: ICOTBL99_UF_IBGE
--==============================================================
create table ICO.ICOTBL99_UF_IBGE (
   NU_UF_IBGE           SMALLINT              
      not null,
   constraint ICOPKL99 primary key (NU_UF_IBGE)
);

label on table ICO.ICOTBL99_UF_IBGE is 'UNIDADE_FEDERACAO_IBGE';
label on column ICO.ICOTBL99_UF_IBGE.NU_UF_IBGE is 
'NU_UNIDADE_FEDERACAO_IBGE';
--==============================================================
-- Index: ICO1IL99
--==============================================================
create unique index ICO.ICO1IL99 on ICO.ICOTBL99_UF_IBGE (
   NU_UF_IBGE           ASC
)
cluster
 using stogroup SGDDB210
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
bufferpool BP11
close yes
piecesize 2097152;

--==============================================================
-- Index: ICO2IL99
--==============================================================
create index ICO.ICO2IL99 on ICO.ICOTBL99_UF_IBGE (
   
)
using stogroup SGDDB210
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
bufferpool BP11
close yes
piecesize 2097152;

--==============================================================
-- Table: ICOTBN02_AGENCIA
--==============================================================
create table ICO.ICOTBN02_AGENCIA (
   NU_AGENCIA           SMALLINT              
      not null,
   NU_BANCO_N01         SMALLINT              
      not null,
   constraint ICOPKN02 primary key (NU_BANCO_N01, NU_AGENCIA)
);

label on table ICO.ICOTBN02_AGENCIA is 'AGENCIA';
label on column ICO.ICOTBN02_AGENCIA.NU_BANCO_N01 is 'NU_BANCO';
--==============================================================
-- Index: ICO1IN02
--==============================================================
create unique index ICO.ICO1IN02 on ICO.ICOTBN02_AGENCIA (
   NU_BANCO_N01         ASC,
   NU_AGENCIA           ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
bufferpool BP11
close yes
piecesize 2097152;

--==============================================================
-- Table: ICOTBN07_PRTCESPB
--==============================================================
create table ICO.ICOTBN07_PRTCESPB (
   NU_PRTCE_SPB         SMALLINT              
      not null,
   NU_ISPB_PRTCE        INTEGER               
      not null,
   IC_PRTCE_CMPSO       CHAR(1)               
      not null
         constraint ICO1CN07 check (IC_PRTCE_CMPSO in ('S','N')),
   IC_IF                CHAR(1)               
      not null
         constraint ICO2CN07 check (IC_IF in ('S','N')),
   IC_PRESTADOR         CHAR(1)               
      not null
         constraint ICO3CN07 check (IC_PRESTADOR in ('S','N')),
   NU_COMPE             SMALLINT,
   DT_INCLUSAO_SPB      DATE                  
      not null,
   DT_EXCLUSAO_SPB      DATE,
   NO_PARTICIPANTE      CHAR(80)              
      not null,
   NO_RAZAO_SOCIAL      CHAR(80)              
      not null,
   constraint ICOPKN07 primary key (NU_PRTCE_SPB),
   constraint ICO1CN08 check (IC_PRTCE_CMPSO IN ('S', 'N'))
)
 in ICODB001.ICOTSN07
audit none
data capture changes
ccsid ebcdic
not volatile
append no;

label on column ICO.ICOTBN07_PRTCESPB.NU_PRTCE_SPB is 
'NU_PARTICIPANTE_SPB';
label on column ICO.ICOTBN07_PRTCESPB.NU_ISPB_PRTCE is 
'NU_ISPB_PARTICIPANTE';
label on column ICO.ICOTBN07_PRTCESPB.IC_PRTCE_CMPSO is 
'IC_PARTICIPANTE_COMPENSACAO';
label on column ICO.ICOTBN07_PRTCESPB.IC_IF is 
'IC_INSTITUICAO_FINANCEIRA';
label on column ICO.ICOTBN07_PRTCESPB.NU_COMPE is 'NU_COMPENSACAO';
--==============================================================
-- Index: ICO1IN07
--==============================================================
create unique index ICO.ICO1IN07 on ICO.ICOTBN07_PRTCESPB (
   NU_PRTCE_SPB         ASC
)
using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
bufferpool BP11
close yes;

--==============================================================
-- Table: ICOTBO10_PRODUTO
--==============================================================
create table ICO.ICOTBO10_PRODUTO (
   NU_PRODUTO           SMALLINT              
      not null,
   NU_DV_PRODUTO        SMALLINT              
      not null,
   NO_PRODUTO           CHAR(120)             
      not null,
   NO_ABREVIADO_PRDTO   CHAR(40)              
      not null,
   CO_ULTIMA_SITUACAO   CHAR(2)               
      not null,
   NU_ENTIDADE_O03      SMALLINT              
      not null,
   NU_OPERACAO_O23      SMALLINT              
      not null,
   NO_COMERCIAL_PRDTO   CHAR(40),
   constraint ICOPKO10 primary key (NU_PRODUTO)
)
 in ICODB001.ICOTSO10
audit none
data capture changes
ccsid ebcdic
not volatile
append no;

label on column ICO.ICOTBO10_PRODUTO.NU_PRODUTO is 'PRODUTO';
label on column ICO.ICOTBO10_PRODUTO.NU_DV_PRODUTO is 
'NU_DIGITO_VERIFICADOR_PRODUTO';
label on column ICO.ICOTBO10_PRODUTO.NO_ABREVIADO_PRDTO is 
'NO_ABREVIADO_PRODUTO';
label on column ICO.ICOTBO10_PRODUTO.NU_ENTIDADE_O03 is 'NU_ENTIDADE';
label on column ICO.ICOTBO10_PRODUTO.NU_OPERACAO_O23 is 'NU_OPERACAO';
label on column ICO.ICOTBO10_PRODUTO.NO_COMERCIAL_PRDTO is 
'NO_COMERCIAL_PRODUTO';
--==============================================================
-- Table: ICOTBP26_TPPESSOA
--==============================================================
create table ICO.ICOTBP26_TPPESSOA (
   NU_TIPO_PESSOA       SMALLINT              
      not null,
   DE_TIPO_PESSOA       CHAR(50)              
      not null,
   IC_SITUACAO          CHAR(1)               
      not null,
   constraint ICOPKP26 primary key (NU_TIPO_PESSOA)
);

label on column ICO.ICOTBP26_TPPESSOA.NU_TIPO_PESSOA is 'TIPO DE PESSOA'
;
label on column ICO.ICOTBP26_TPPESSOA.DE_TIPO_PESSOA is 
'DESCRICAO DO TIPO PESSOA';
label on column ICO.ICOTBP26_TPPESSOA.IC_SITUACAO is 'SITUACAO';
--==============================================================
-- Index: ICO1IP26
--==============================================================
create unique index ICO.ICO1IP26 on ICO.ICOTBP26_TPPESSOA (
   NU_TIPO_PESSOA       ASC
)
pctfree 10;

--==============================================================
-- Table: ICOTBU24_UNIDADE
--==============================================================
create table ICO.ICOTBU24_UNIDADE (
   NU_UNIDADE           SMALLINT              
      not null,
   NU_NATURAL           INTEGER               
      not null,
   constraint ICOPKU24 primary key (NU_UNIDADE, NU_NATURAL)
);

label on column ICO.ICOTBU24_UNIDADE.NU_UNIDADE is 'UNIDADE';
--==============================================================
-- View: GECVW001_SISTEMA
--==============================================================
create view GEC.GECVW001_SISTEMA (NU_SISTEMA, SG_SISITEMA, NO_SISTEMA) 
as
SELECT 
     NU_SEGMENTO, 
     SG_SEGMENTO, 
     NO_SEGMENTO 
FROM ICO.ICOTBS12_SEGMENTO;

--==============================================================
-- View: GECVW011_UNDE_DPRA
--==============================================================
create view GEC.GECVW011_UNDE_DPRA as
SELECT OPERACIONAL.NU_UNIDADE AS NU_UNIDADE_FILHA,            
       OPERACIONAL.NU_NATURAL AS NU_NATURAL_FILHA,            
       OPERACIONAL.NO_UNIDADE AS NO_UNIDADE_FILHA,            
       OPERACIONAL.SG_UNIDADE AS SG_UNIDADE_FILHA,            
       OPERACIONAL.SG_LOCALIZACAO AS SG_LCLO_UNDE_FILHA,      
       GICOT.NU_UNIDADE AS NU_UNIDADE_PAI,                    
       GICOT.NU_NATURAL AS NU_NATURAL_PAI,                    
       GICOT.NO_UNIDADE AS NO_UNIDADE_PAI,                    
       GICOT.SG_UNIDADE AS SG_UNIDADE_PAI,                    
       GICOT.SG_LOCALIZACAO AS SG_LCLO_UNDE_PAI               
  FROM ICO.ICOTBU24_UNIDADE OPERACIONAL,                      
       ICO.ICOTBU25_VINCUNID VINCULO,                         
       ICO.ICOTBU24_UNIDADE GICOT                             
  WHERE VINCULO.NU_NTRL_VNCLRA_U24 = GICOT.NU_NATURAL         
    AND VINCULO.NU_UNDE_VNCLRA_U24 = GICOT.NU_UNIDADE         
    AND VINCULO.NU_NTRL_VNCLA_U24 = OPERACIONAL.NU_NATURAL    
      AND VINCULO.NU_UNDE_VNCLA_U24 = OPERACIONAL.NU_UNIDADE      
      AND VINCULO.DT_FIM IS NULL                                  
      AND OPERACIONAL.DT_FIM IS NULL                              
      AND OPERACIONAL.IC_ULTIMA_SITUACAO = 'AT'                   
      AND GICOT.IC_ULTIMA_SITUACAO = 'AT'                         
      AND GICOT.DT_FIM IS NULL                                    
      AND GICOT.SG_UNIDADE = 'RSMRA';

--==============================================================
-- View: GECVW012_FERIADO
--==============================================================
create view GEC.GECVW012_FERIADO as
SELECT NO_FERIADO AS NO_FERIADO, DT_FERIADO AS DT_FERIADO      
  FROM ICO.ICOTBF01_FERIADO                                    
  WHERE CO_ABRNA_GGRFA_F03 = 'N';

--==============================================================
-- View: GECVW351_MOVIMENTO
--==============================================================
create view GEC.GECVW351_MOVIMENTO as
select AA_MOVIMENTO, 
       MM_MOVIMENTO,
       IC_PESSOA,
       NU_CPF_CNPJ,
       NU_CONTRATO,
       SG_CONC_PROVIS,
       PZ_ATRASO_DD,
       VR_SALDO_DEVEDOR,
       NU_SISTEMA,
       NU_PARTICAO,
       NU_PRODUTO,
       NU_UNIDADE_CNCSA,
       NU_ENTIDADE_CONTAB
from APCAPCTB712_MOVIMENTO;

--==============================================================
-- View: GECVW402_EMPREGADO_CAIXA
--==============================================================
create view GEC.GECVW402_EMPREGADO_CAIXA as
SELECT NU_MATRICULA, NU_DV_MATRICULA, NO_PESSOA            
     , DT_PRVSA_DSLGO, NU_UNIDADE_U24, NU_NATURAL_U24      
     , NU_FUNCAO_H03, CO_CARGO_H05, NU_CPF_EMPREGADO       
     , NU_UNDDE_ALCCO_U24, NU_NTRL_ALCCO_U24               
                                                           
FROM ICO.ICOTBH01_EMPRO_CXA;

--==============================================================
-- View: GECVW405_PARTICIPANTE_BACEN
--==============================================================
create view GEC.GECVW405_PARTICIPANTE_BACEN as
SELECT NU_PRTCE_SPB, NU_ISPB_PRTCE, IC_PRTCE_CMPSO     
     , IC_IF, IC_PRESTADOR, NU_COMPE, DT_INCLUSAO_SPB  
     , DT_EXCLUSAO_SPB, NO_PARTICIPANTE                
     , NO_RAZAO_SOCIAL                                 
                                                       
FROM ICO.ICOTBN07_PRTCESPB;

--==============================================================
-- View: GECVW406_PRODUTO_SIICO
--==============================================================
create view GEC.GECVW406_PRODUTO_SIICO as
SELECT NU_PRODUTO, NU_DV_PRODUTO, NO_PRODUTO    
     , NO_ABREVIADO_PRDTO, CO_ULTIMA_SITUACAO   
     , NU_ENTIDADE_O03, NU_OPERACAO_O23         
     , NO_COMERCIAL_PRDTO                       
                                                
FROM ICO.ICOTBO10_PRODUTO;

alter table GEC.GECTB786_ESTAGIO_RISCO_CREDITO
   add constraint GEC1F786 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB786_ESTAGIO_RISCO_CREDITO
   add constraint GEC2F786 foreign key (NU_TIPO_ESTAGIO_RISCO, 
NU_MOTIVO_ESTAGIO_RISCO)
      references GEC.GECTB787_MOTIVO_ESTAGIO_RISCO 
(NU_TIPO_ESTAGIO_RISCO, NU_MOTIVO_ESTAGIO_RISCO)
      on delete restrict;

alter table GEC.GECTB787_MOTIVO_ESTAGIO_RISCO
   add constraint GEC1F787 foreign key (NU_TIPO_ESTAGIO_RISCO)
      references GEC.GECTB788_TIPO_ESTAGIO_RISCO (NU_TIPO_ESTAGIO_RISCO)

      on delete restrict;

alter table GEC.GECTB789_ARQUIVO_INTERFACE
   add constraint GEC1F789 foreign key (NU_TIPO_ARQUIVO_INTERFACE)
      references GEC.GECTB790_TIPO_ARQVO_INTERFACE 
(NU_TIPO_ARQUIVO_INTERFACE)
      on delete restrict;

alter table GEC.GECTB791_CNTLE_ENVIO_INFRO
   add constraint GEC1F791 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB793_INTERFACE_ARQUIVO_C3
   add constraint GEC1F793 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB793_INTERFACE_ARQUIVO_C3
   add constraint GEC2F793 foreign key (NU_ARQUIVO_INTERFACE)
      references GEC.GECTB789_ARQUIVO_INTERFACE (NU_ARQUIVO_INTERFACE)
      on delete restrict;

alter table GEC.GECTB794_CNTLE_ARQUIVO_PCSDO
   add constraint GEC1F794 foreign key (NU_CONTROLE_EXECUCAO_ROTINA, 
CO_ROTINA_PROCESSAMENTO)
      references GEC.GECTB779_CTRLE_EXECUCAO_ROTINA 
(NU_CONTROLE_EXECUCAO_ROTINA, CO_ROTINA_PROCESSAMENTO)
      on delete restrict;

alter table GEC.GECTB794_CNTLE_ARQUIVO_PCSDO
   add constraint GEC2F794 foreign key (NU_ARQUIVO_INTERFACE)
      references GEC.GECTB789_ARQUIVO_INTERFACE (NU_ARQUIVO_INTERFACE)
      on delete restrict;

alter table GEC.GECTB795_ARQVO_CONCILIACAO_C3
   add constraint GEC1F795 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB795_ARQVO_CONCILIACAO_C3
   add constraint GEC2F795 foreign key (CO_CONCILIACAO)
      references GEC.GECTB792_CONCILIACAO_C3 (CO_CONCILIACAO_C3)
      on delete restrict;

alter table GEC.GECTB796_CREDITO_CONCILIACAO
   add constraint GEC1F796 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB796_CREDITO_CONCILIACAO
   add constraint GEC2F796 foreign key (CO_CONCILIACAO_C3)
      references GEC.GECTB792_CONCILIACAO_C3 (CO_CONCILIACAO_C3)
      on delete restrict;

alter table GEC.GECTB796_CREDITO_CONCILIACAO
   add constraint GEC3F796 foreign key (NU_JUSTIFICATIVA_CONCILIACAO)
      references GEC.GECTB797_JUSTIFICATIVA_CNCLO 
(NU_JUSTIFICATIVA_CONCILIACAO)
      on delete restrict;

alter table GEC.GECTB799_CONSULTA_RESTRICAO
   add constraint GEC1F799 foreign key (NU_SITUACAO_CONSULTA_RESTRICAO)

      references GEC.GECTB800_STCO_CNSLA_RESTRICAO 
(NU_SITUACAO_CONSULTA_RESTRICAO)
      on delete restrict;

alter table GEC.GECTB801_CNSLA_RSTCO_ARQVO
   add constraint GEC1F801 foreign key (NU_CONSULTA_RESTRICAO)
      references GEC.GECTB799_CONSULTA_RESTRICAO (NU_CONSULTA_RESTRICAO)

      on delete restrict;

alter table GEC.GECTB801_CNSLA_RSTCO_ARQVO
   add constraint GEC2F801 foreign key (NU_ARQUIVO_CESSAO)
      references GEC.GECTB533_ARQUIVO_CESSAO (NU_ARQUIVO_CESSAO)
      on delete restrict;

alter table GEC.GECTB802_RESTRICAO_CLIENTE
   add constraint GEC1F802 foreign key (NU_CONSULTA_RESTRICAO)
      references GEC.GECTB799_CONSULTA_RESTRICAO (NU_CONSULTA_RESTRICAO)

      on delete restrict;

alter table GEC.GECTB802_RESTRICAO_CLIENTE
   add constraint GEC2F802 foreign key (NU_TIPO_RESTRICAO)
      references GEC.GECTB803_TIPO_RESTRICAO (NU_TIPO_RESTRICAO)
      on delete restrict;

drop table GEC.GECTB789_LOB_1;

create lob tablespace GEC1L789
in GECDB002
 using stogroup SGDDB201
    priqty 200
    secqty 200
    erase no
gbpcache changed
dssize 4 G
bufferpool BP10
close yes
lockmax system
locksize any;

CREATE UNIQUE INDEX GEC.GEC1X789      
  ON GEC.GECTB789_LOB_1               
  PADDED                              
  USING STOGROUP SGDDB201             
  PRIQTY 48 SECQTY 48                 
  ERASE  NO                           
  FREEPAGE 0 PCTFREE 0                
  GBPCACHE CHANGED                    
  COMPRESS NO                         
  BUFFERPOOL BP11                     
  CLOSE NO                            
  COPY YES                            
  DEFINE YES                          
  PIECESIZE 4 G;   

create tablespace GECTS500
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS501
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS502
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS503
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS504
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS505
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS506
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS507
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS508
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS509
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS510
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS511
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS512
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS513
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS514
in GECDB002
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
maxrows 255
segsize 32;

create tablespace GECTS515
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS516
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS517
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS518
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS519
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS520
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS521
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS522
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS523
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS524
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS525
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS526
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS527
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS528
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS529
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS530
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS531
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS532
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS533
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS534
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS535
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS536
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS537
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS538
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS539
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS540
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS541
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS542
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS543
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS544
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS545
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS546
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS547
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS548
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS549
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS550
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS551
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS552
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS553
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS554
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS555
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS556
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS557
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS558
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS559
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS560
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS561
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS562
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS563
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS564
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS565
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS566
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS567
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS568
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS569
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS570
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS571
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS572
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS573
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS574
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS575
in GECDB002
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
maxrows 255
segsize 32;

create tablespace GECTS576
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS577
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS578
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS579
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS580
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS581
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS582
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS583
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS584
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS585
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS586
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS587
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS588
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS589
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS590
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS591
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS592
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS593
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS594
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS595
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS596
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS597
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS598
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS599
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS600
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS601
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS602
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS603
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS604
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS605
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS606
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS607
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS608
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS609
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS610
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS611
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS612
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS613
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS614
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS615
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS616
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS617
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS618
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS619
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS620
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS621
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS622
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS623
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS624
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS625
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS626
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS627
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS628
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS629
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS630
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS631
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS632
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS633
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS634
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS635
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS636
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS637
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS638
in GECDB002
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
define yes
logged
trackmod yes
dssize 4 G
 numparts 60
bufferpool BP10
lockmax system
locksize any
maxrows 255
segsize 32;

create tablespace GECTS639
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS640
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS641
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS642
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS643
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS644
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS645
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS646
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS647
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS648
in GECDB002
 using stogroup SGDGEC00
    priqty 4800
    secqty 4800
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS649
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS650
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS651
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS652
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS653
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS654
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS655
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS656
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS657
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS658
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS659
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS660
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS661
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS662
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS663
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS664
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS665
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS666
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS667
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS668
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS669
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS670
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS671
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS672
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS673
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS674
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS675
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS676
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS677
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS678
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS679
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS680
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS681
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS682
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS683
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS684
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS685
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS686
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS687
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS688
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS689
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS690
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS691
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS692
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS693
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS694
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS695
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS696
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS697
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS698
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS699
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS700
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS701
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS702
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS703
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS704
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS705
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS706
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS707
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS708
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS709
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS710
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS711
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS712
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS713
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS714
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS715
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS716
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS717
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS718
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS719
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS720
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS721
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS722
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS723
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS724
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS725
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS726
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS727
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS728
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS729
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS730
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS731
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS732
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS733
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS734
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS735
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS736
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS737
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS738
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS739
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS740
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS741
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS742
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS743
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS744
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS746
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS747
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS748
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS749
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS750
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS751
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS752
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS753
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS754
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS755
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS756
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS757
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS758
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS759
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS760
IN GECDB002                    
USING STOGROUP SGDGEC00        
PRIQTY 48 SECQTY 48            
ERASE  NO                      
FREEPAGE 0 PCTFREE 0           
TRACKMOD YES                   
MAXPARTITIONS 2                
LOGGED                         
DSSIZE 4 G                     
SEGSIZE 32                     
BUFFERPOOL BP10                
LOCKSIZE ANY                   
LOCKMAX SYSTEM                 
DEFINE YES                     
MAXROWS 255;

create tablespace GECTS761
in GECDB002
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS762
in GECDB002
 using stogroup SGDGEC00
    priqty 4800
    secqty 4800
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS763
in GECDB002
 using stogroup SGDGEC00
    priqty 4800
    secqty 4800
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS764
in GECDB002
 using stogroup SGDGEC00
    priqty 4800
    secqty 4800
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS765
in GECDB002
 using stogroup SGDGEC00
    priqty 4800
    secqty 4800
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS766
in GECDB002
 using stogroup SGDGEC00
    priqty 4800
    secqty 4800
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS767
in GECDB002
 using stogroup SGDGEC00
    priqty 4800
    secqty 4800
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS768
in GECDB002
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS769
in GECDB002
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS770
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS771
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS772
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS773
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS774
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS775
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS776
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS777
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS778
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
maxrows 255;
segsize 32;

create tablespace GECTS779
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize row
maxrows 255;
segsize 32;

create tablespace GECTS780
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
segsize 32;

create tablespace GECTS781
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
segsize 32;

create tablespace GECTS782
in GECDB002
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 0 for update 0
gbpcache changed
define yes
logged
trackmod yes
dssize 4 G
 maxpartitions 2
bufferpool BP10
ccsid ebcdic
close yes
compress no
lockmax system
locksize any
segsize 32;

create tablespace GECTS783
in GECDB002
 using stogroup SGDDB201
    priqty 48
    secqty 48
freepage 0
pctfree 5
gbpcache changed
 maxpartitions 2
bufferpool BP10
close yes
lockmax system
locksize any
segsize 32;

create tablespace GECTS784
in GECDB002
 using stogroup SGDDB201
    priqty 480
    secqty 480
freepage 0
pctfree 5
gbpcache changed
 maxpartitions 2
bufferpool BP10
close yes
lockmax system
locksize any
segsize 32;

create tablespace GECTS785
in GECDB002
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
segsize 32;

create tablespace GECTS786
in GECDB002
 using stogroup SGDDB201
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 5 for update 0
gbpcache changed
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
segsize 32;

create tablespace GECTS787
in GECDB002
 using stogroup SGDDB201
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 5 for update 0
gbpcache changed
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
segsize 32;

create tablespace GECTS788
in GECDB002
 using stogroup SGDDB201
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 5 for update 0
gbpcache changed
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
segsize 32;

create tablespace GECTS789
in GECDB002
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5 for update 0
gbpcache changed
dssize 4 G
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
maxrows 255
segsize 32;

create tablespace GECTS790
in GECDB002
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 5 for update 0
gbpcache changed
dssize 4 G
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
maxrows 255
segsize 32;

create tablespace GECTS791
in GECDB002
 using stogroup SGDDB201
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 5 for update 0
gbpcache changed
dssize 4 G
 maxpartitions 2
bufferpool BP10
lockmax system
locksize any
maxrows 255
segsize 64;

create tablespace GECTS792
   IN GECDB002                          
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
    COMPRESS NO                          
    CCSID      EBCDIC                    
    DEFINE YES                           
    MAXROWS 255;

create tablespace GECTS793
   IN GECDB002                          
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
    COMPRESS NO                          
    CCSID      EBCDIC                    
    DEFINE YES                           
    MAXROWS 255;

create tablespace GECTS794
   IN GECDB002                          
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
    COMPRESS NO                          
    CCSID      EBCDIC                    
    DEFINE YES                           
    MAXROWS 255;

create tablespace GECTS795
   IN GECDB002                          
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
    COMPRESS NO                          
    CCSID      EBCDIC                    
    DEFINE YES                           
    MAXROWS 255;

create tablespace GECTS796
   IN GECDB002                          
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
    COMPRESS NO                          
    CCSID      EBCDIC                    
    DEFINE YES                           
    MAXROWS 255;

create tablespace GECTS797
   IN GECDB002                          
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
    COMPRESS NO                          
    CCSID      EBCDIC                    
    DEFINE YES                           
    MAXROWS 255;

create tablespace GECTS798
   IN GECDB002                          
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
    COMPRESS NO                          
    CCSID      EBCDIC                    
    DEFINE YES                           
    MAXROWS 255;

--==============================================================
-- Table: GECTB500_IF
--==============================================================
create table GEC.GECTB500_IF (
   NU_IF                SMALLINT              
      not null,
   IC_GERA_SIAPC        CHAR(1)               
      not null with default 'S'
         constraint GEC1C500 check (IC_GERA_SIAPC in ('S','N')),
   DT_INICIO_RELACIONAMENTO DATE                  
      not null,
   DT_FIM_RELACIONAMENTO DATE,
   TS_INCLUSAO          TIMESTAMP             
      not null,
   NU_MATRICULA_INCLUSAO INTEGER               
      not null,
   CO_IP_ESTACAO_INCLUSAO CHAR(20)              
      not null,
   TS_ALTERACAO         TIMESTAMP,
   NU_MATRICULA_ALTERACAO INTEGER,
   CO_IP_ESTACAO_ALTERACAO CHAR(20),
   CO_EMAIL_CONTATO     CHAR(100),
   DT_ULTIMA_CARGA_DI   DATE,
   constraint GECPK500 primary key (NU_IF)
)
 in GECDB002.GECTS500;

label on table GEC.GECTB500_IF is 'GECTB500_INSTITUICAO_FINANCEIRA';

--==============================================================
-- Index: GEC1I500
--==============================================================
create unique index GEC.GEC1I500 on GEC.GECTB500_IF (
   NU_IF                ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB501_CONTATO_IF
--==============================================================
create table GEC.GECTB501_CONTATO_IF (
   NU_IF                SMALLINT              
      not null,
   NU_SEQUENCIAL_CONTATO DECIMAL(2)            
      not null,
   NO_CONTATO           CHAR(50)              
      not null,
   DE_FORMA_CONTATO     CHAR(100),
   DE_OBSERVACAO        VARCHAR(200),
   TS_INCLUSAO          TIMESTAMP             
      not null,
   NU_MATRICULA_INCLUSAO INTEGER               
      not null,
   CO_IP_ESTACAO_INCLUSAO CHAR(20)              
      not null,
   TS_ALTERACAO         TIMESTAMP,
   NU_MATRICULA_ALTERACAO INTEGER,
   CO_IP_ESTACAO_ALTERACAO CHAR(20),
   constraint GECPK501 primary key (NU_IF, NU_SEQUENCIAL_CONTATO)
)
 in GECDB002.GECTS501;

--==============================================================
-- Index: GEC1I501
--==============================================================
create unique index GEC.GEC1I501 on GEC.GECTB501_CONTATO_IF (
   NU_IF                ASC,
   NU_SEQUENCIAL_CONTATO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB502_CONVENENTE
--==============================================================
create table GEC.GECTB502_CONVENENTE (
   NU_SEQ_CONVENENTE    DECIMAL(5)            
      not null
      generated ? as identity,
   NU_CNPJ_CONVENENTE   DECIMAL(14)           
      not null,
   CO_TIPO_CONVENIO     DECIMAL(1)            
      not null
         constraint GEC1C502 check (CO_TIPO_CONVENIO in (1,2,3)),
   CO_SIAPX             DECIMAL(11),
   NO_CONVENENTE        CHAR(50),
   DT_PENULTIMO_RETORNO DATE,
   DT_ULTIMO_RETORNO    DATE,
   constraint GECPK502 primary key (NU_SEQ_CONVENENTE)
)
 in GECDB002.GECTS502;

--==============================================================
-- Index: GEC1I502
--==============================================================
create unique index GEC.GEC1I502 on GEC.GECTB502_CONVENENTE (
   NU_SEQ_CONVENENTE    ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I502
--==============================================================
create unique index GEC.GEC2I502 on GEC.GECTB502_CONVENENTE (
   NU_CNPJ_CONVENENTE   ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB503_CONVENENTE_IF
--==============================================================
create table GEC.GECTB503_CONVENENTE_IF (
   NU_IF                SMALLINT              
      not null,
   NU_SEQ_CONVENENTE    DECIMAL(5)            
      not null,
   CO_CNVNO_CNVNE_IF    DECIMAL(11)           
      not null,
   CO_TIPO_REPASSE      DECIMAL(2)            
         constraint GEC1C503 check (CO_TIPO_REPASSE is null or 
(CO_TIPO_REPASSE in (1,2))),
   DD_REPASSE           DECIMAL(2),
   constraint GECPK503 primary key (NU_IF, NU_SEQ_CONVENENTE)
)
 in GECDB002.GECTS503;

--==============================================================
-- Index: GEC1I503
--==============================================================
create unique index GEC.GEC1I503 on GEC.GECTB503_CONVENENTE_IF (
   NU_IF                ASC,
   NU_SEQ_CONVENENTE    ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I503
--==============================================================
create index GEC.GEC2I503 on GEC.GECTB503_CONVENENTE_IF (
   NU_SEQ_CONVENENTE    ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB504_ACORDO
--==============================================================
create table GEC.GECTB504_ACORDO (
   NU_ACORDO            DECIMAL(8)            
      not null
      generated ? as identity,
   NU_IF                SMALLINT              
      not null,
   NU_SEQUENCIAL_ACORDO DECIMAL(5)            
      not null,
   VR_SALDO_DISPONIVEL  DECIMAL(18, 6),
   TS_SALDO_DISPONIVEL  TIMESTAMP,
   IC_ATIVO             CHAR(1)               
      not null with default 'S'
         constraint GEC1C504 check (IC_ATIVO in ('S','N')),
   TS_INCLUSAO          TIMESTAMP             
      not null,
   NU_MATRICULA         INTEGER               
      not null,
   CO_IP_ESTACAO        CHAR(20)              
      not null,
   constraint GECPK504 primary key (NU_ACORDO)
)
 in GECDB002.GECTS504;

--==============================================================
-- Index: GEC1I504
--==============================================================
create unique index GEC.GEC1I504 on GEC.GECTB504_ACORDO (
   NU_ACORDO            ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I504
--==============================================================
create unique index GEC.GEC2I504 on GEC.GECTB504_ACORDO (
   NU_IF                ASC,
   NU_SEQUENCIAL_ACORDO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB505_PRODUTO_ACORDO
--==============================================================
create table GEC.GECTB505_PRODUTO_ACORDO (
   NU_ADITIVO           DECIMAL(8)            
      not null,
   NU_PRODUTO           SMALLINT              
      not null,
   constraint GECPK505 primary key (NU_PRODUTO, NU_ADITIVO)
)
 in GECDB002.GECTS505;

--==============================================================
-- Index: GEC1I505
--==============================================================
create unique index GEC.GEC1I505 on GEC.GECTB505_PRODUTO_ACORDO (
   NU_PRODUTO           ASC,
   NU_ADITIVO           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB506_DOCUMENTO_ACORDO
--==============================================================
create table GEC.GECTB506_DOCUMENTO_ACORDO (
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(8)            
      not null,
   NU_ACORDO            DECIMAL(8)            
      not null,
   constraint GECPK506 primary key (NU_SEQUENCIAL_DOCUMENTO)
)
 in GECDB002.GECTS506;

--==============================================================
-- Index: GEC1I506
--==============================================================
create unique index GEC.GEC1I506 on GEC.GECTB506_DOCUMENTO_ACORDO (
   NU_SEQUENCIAL_DOCUMENTO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I506
--==============================================================
create index GEC.GEC2I506 on GEC.GECTB506_DOCUMENTO_ACORDO (
   NU_ACORDO            ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB507_ADITIVO_ACORDO
--==============================================================
create table GEC.GECTB507_ADITIVO_ACORDO (
   NU_ADITIVO           DECIMAL(8)            
      not null
      generated ? as identity,
   NU_ACORDO            DECIMAL(8)            
      not null,
   NU_SEQUENCIAL_ADITIVO INTEGER               
      not null,
   VR_MAXIMO_ANUAL      DECIMAL(18, 2),
   CO_TIPO_LIMITE       DECIMAL(2)            
         constraint GEC1C507 check (CO_TIPO_LIMITE is null or 
(CO_TIPO_LIMITE in (1,2,99))),
   QT_PRAZO             DECIMAL(5),
   DT_INICIO            DATE,
   DE_OBSERVACAO        VARCHAR(1000),
   TS_INCLUSAO          TIMESTAMP             
      not null,
   NU_MATRICULA_INCLUSAO INTEGER               
      not null,
   CO_IP_ESTACAO_INCLUSAO CHAR(20)              
      not null,
   TS_ALTERACAO         TIMESTAMP,
   NU_MATRICULA_ALTERACAO INTEGER,
   CO_IP_ESTACAO_ALTERACAO CHAR(20),
   VR_MAXIMO_MENSAL     DECIMAL(18, 2),
   VR_TOTAL_ACORDO      DECIMAL(19, 2)         default 0,
   constraint GECPK507 primary key (NU_ADITIVO)
)
 in GECDB002.GECTS507;

--==============================================================
-- Index: GEC1I507
--==============================================================
create unique index GEC.GEC1I507 on GEC.GECTB507_ADITIVO_ACORDO (
   NU_ADITIVO           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I507
--==============================================================
create unique index GEC.GEC2I507 on GEC.GECTB507_ADITIVO_ACORDO (
   NU_ACORDO            ASC,
   NU_SEQUENCIAL_ADITIVO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB508_FATOR_REMUNERACAO
--==============================================================
create table GEC.GECTB508_FATOR_REMUNERACAO (
   NU_FATOR             DECIMAL(8)            
      not null
      generated ? as identity,
   NU_TIPO_FATOR        DECIMAL(5)            
      not null,
   DT_REFERENCIA        DATE                  
      not null,
   VR_REFERENCIA        DECIMAL(18,12)        
      not null,
   IC_ATIVO             CHAR(1)               
      not null with default 'S'
         constraint GEC1C508 check (IC_ATIVO in ('S','N')),
   IC_USO               CHAR(1)               
      not null with default 'N'
         constraint GEC2C508 check (IC_USO in ('S','N')),
   TX_REFERENCIA        DECIMAL(4,2),
   DT_FECHAMENTO_TAXA_REFERENCIA DATE,
   constraint GECPK508 primary key (NU_FATOR)
)
 in GECDB002.GECTS508;

--==============================================================
-- Index: GEC1I508
--==============================================================
create unique index GEC.GEC1I508 on GEC.GECTB508_FATOR_REMUNERACAO (
   NU_TIPO_FATOR        ASC,
   DT_REFERENCIA        ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I508
--==============================================================
create unique index GEC.GEC2I508 on GEC.GECTB508_FATOR_REMUNERACAO (
   NU_FATOR             ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB509_FTR_RMNRO_HSTRO
--==============================================================
create table GEC.GECTB509_FTR_RMNRO_HSTRO (
   NU_HISTORICO         DECIMAL(8)            
      not null
      generated ? as identity,
   DT_REFERENCIA        DATE                  
      not null,
   VR_REFERENCIA        DECIMAL(18,12)        
      not null,
   TS_TRANSACAO         TIMESTAMP             
      not null,
   IC_ATIVO             CHAR(1)               
      not null with default 'S'
         constraint GEC1C509 check (IC_ATIVO in ('S','N')),
   IC_USO               CHAR(1)               
      not null with default 'N'
         constraint GEC2C509 check (IC_USO in ('S','N')),
   NU_MATRICULA         INTEGER               
      not null,
   NU_FATOR             DECIMAL(8),
   TS_INCLUSAO          TIMESTAMP             
      not null,
   CO_IP_ESTACAO        CHAR(20)              
      not null,
   IC_ACAO              CHAR(1)               
      not null with default 'I'
         constraint GEC3C509 check (IC_ACAO in ('I','E','A')),
   TX_REFERENCIA        DECIMAL(4,2),
   DT_FECHAMENTO_TAXA_REFERENCIA DATE,
   constraint GECPK509 primary key (NU_HISTORICO)
)
 in GECDB002.GECTS509;

label on column GEC.GECTB509_FTR_RMNRO_HSTRO.NU_MATRICULA is 
'MATRICULA EMPREGADO';
--==============================================================
-- Index: GEC1I509
--==============================================================
create unique index GEC.GEC1I509 on GEC.GECTB509_FTR_RMNRO_HSTRO (
   NU_HISTORICO         ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I509
--==============================================================
create index GEC.GEC2I509 on GEC.GECTB509_FTR_RMNRO_HSTRO (
   DT_REFERENCIA        ASC,
   TS_TRANSACAO         ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB510_TIPO_FATOR_REMUNERACAO
--==============================================================
create table GEC.GECTB510_TIPO_FATOR_REMUNERACAO (
   NU_TIPO_FATOR        DECIMAL(5)            
      not null
      generated ? as identity,
   NO_FATOR             CHAR(20)              
      not null,
   TS_INCLUSAO          TIMESTAMP             
      not null,
   NU_MATRICULA         INTEGER               
      not null,
   CO_IP_ESTACAO        CHAR(20)              
      not null,
   constraint GECPK510 primary key (NU_TIPO_FATOR)
)
 in GECDB002.GECTS510;

--==============================================================
-- Index: GEC1I510
--==============================================================
create unique index GEC.GEC1I510 on GEC.GECTB510_TIPO_FATOR_REMUNERACAO 
(
   NO_FATOR             ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I510
--==============================================================
create unique index GEC.GEC2I510 on GEC.GECTB510_TIPO_FATOR_REMUNERACAO 
(
   NU_TIPO_FATOR        ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I510
--==============================================================
create index GEC.GEC3I510 on GEC.GECTB510_TIPO_FATOR_REMUNERACAO (
   NU_MATRICULA         ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB511_TED_COMERCIAL
--==============================================================
create table GEC.GECTB511_TED_COMERCIAL (
   CO_NUOP              CHAR(25)              
      not null,
   TS_EMISSAO           TIMESTAMP             
      not null,
   CO_CIT               CHAR(25)              
      not null,
   NU_CANAL             DECIMAL(2)            
      not null
         constraint GEC1C511 check (NU_CANAL in (1,2)),
   NU_PRODUTO           SMALLINT              
      not null,
   VR_TED               DECIMAL(19, 2)        
      not null,
   DE_MOTIVO            CHAR(200),
   NU_MATRICULA         INTEGER,
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(8),
   NU_IF                SMALLINT              
      not null,
   IC_VINCULACAO_TED    DECIMAL(2, 0)         
      not null with default 2
         constraint GEC2C511 check (IC_VINCULACAO_TED in (1,2,3,4,5)),
   IC_TIPO_TED          SMALLINT              
         constraint GEC3C511 check (IC_TIPO_TED is null or (IC_TIPO_TED 
in (1,2,3,4,5,6,999))),
   NU_EVENTO_C3         CHAR(21),
   DE_MOTIVO_EXCLUSAO_TED VARCHAR(200),
   constraint GECPK511 primary key (CO_NUOP)
)
 in GECDB002.GECTS511;

label on column GEC.GECTB511_TED_COMERCIAL.NU_MATRICULA is 
'MATRICULA EMPREGADO';
--==============================================================
-- Index: GEC1I511
--==============================================================
create unique index GEC.GEC1I511 on GEC.GECTB511_TED_COMERCIAL (
   CO_NUOP              ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB512_DOCUMENTO_COMERCIAL
--==============================================================
create table GEC.GECTB512_DOCUMENTO_COMERCIAL (
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(8)            
      not null
      generated ? as identity,
   DE_DOCUMENTO         VARCHAR(200)          
      not null with default,
   NO_ARQUIVO           VARCHAR(200)          
      not null with default,
   IC_SITUACAO_ARQUIVO  CHAR(1)               
      not null with default
         constraint GEC1C512 check (IC_SITUACAO_ARQUIVO in ('A','E')),
   NU_MATRICULA         INTEGER               
      not null with default,
   TS_INCLUSAO          TIMESTAMP             
      not null with default,
   CO_IP_ESTACAO_INCLUSAO CHAR(20)              
      not null with default,
   CO_ENDERECO_REPOSITORIO VARCHAR(100),
   constraint GECPK512 primary key (NU_SEQUENCIAL_DOCUMENTO)
)
 in GECDB002.GECTS512;

label on column GEC.GECTB512_DOCUMENTO_COMERCIAL.NU_MATRICULA is 
'MATRICULA EMPREGADO';
--==============================================================
-- Index: GEC1I512
--==============================================================
create unique index GEC.GEC1I512 on GEC.GECTB512_DOCUMENTO_COMERCIAL (
   NU_SEQUENCIAL_DOCUMENTO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB513_TRANCHE
--==============================================================
create table GEC.GECTB513_TRANCHE (
   NU_TRANCHE           DECIMAL(8)            
      not null
      generated ? as identity,
   NU_IF                SMALLINT              
      not null,
   NU_ACORDO            DECIMAL(8, 0),
   NU_PRODUTO           SMALLINT              
      not null,
   IC_COROA_LOJA        CHAR(1)               
         constraint GEC1C513 check (IC_COROA_LOJA is null or 
(IC_COROA_LOJA in ('C','L'))),
   NU_SEQ_OPERACAO      DECIMAL(4)            
      not null,
   NO_OPERACAO          CHAR(200)             
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21),
   NU_IDENTIFICADOR_UNICO_RESERVA CHAR(40),
   CO_SITUACAO_TRANCHE  DECIMAL(2)            
      not null,
   CO_SITUACAO_ELEGIBILIDADE DECIMAL(2)            
      not null,
   DT_REFERENCIA_CESSAO DATE,
   DT_INICIO_CESSAO     DATE,
   TS_SOLICITACAO_ELEGIBILIDADE TIMESTAMP,
   TS_INICIO_ELEGIBILIDADE TIMESTAMP,
   TS_FIM_ELEGIBILIDADE TIMESTAMP,
   PC_CONTA_GRAFICA     DECIMAL(5,2),
   PC_SPREAD_BANCARIO   DECIMAL(5,2),
   IC_TIPO_DIA_VNCMO_CTRDO DECIMAL(02)           
         constraint GEC2C513 check (IC_TIPO_DIA_VNCMO_CTRDO is null or 
(IC_TIPO_DIA_VNCMO_CTRDO in (01,02))),
   DD_VNCMO_CTRDO       DECIMAL(02)           
         constraint GEC3C513 check (DD_VNCMO_CTRDO is null or 
(DD_VNCMO_CTRDO between 1 and 31)),
   IC_TIPO_DIA_VNCMO_EFETIVO DECIMAL(02)           
         constraint GEC4C513 check (IC_TIPO_DIA_VNCMO_EFETIVO is null or
 (IC_TIPO_DIA_VNCMO_EFETIVO in (01,02))),
   DD_VNCMO_EFETIVO     DECIMAL(02)           
         constraint GEC5C513 check (DD_VNCMO_EFETIVO is null or 
(DD_VNCMO_EFETIVO between 1 and 31)),
   IC_TIPO_DIA_VNCMO_PARCELA DECIMAL(02)           
         constraint GEC6C513 check (IC_TIPO_DIA_VNCMO_PARCELA is null or
 (IC_TIPO_DIA_VNCMO_PARCELA in (01,02))),
   DD_VNCMO_PARCELA     DECIMAL(02)           
         constraint GEC7C513 check (DD_VNCMO_PARCELA is null or 
(DD_VNCMO_PARCELA between 1 and 31)),
   NU_SQNCL_VNCCO_CIT_PRODUTO_IF DECIMAL(19, 0),
   PC_TAXA_AQUISICAO    DECIMAL(15,5),
   PZ_MEDIO_BACEN       DECIMAL(9),
   VR_SALDO_DEVEDOR     DECIMAL(18,2),
   DT_MEDIA_VENCIMENTO  DATE,
   PC_TAXA_BASE_REMUNERACAO DECIMAL(18,10),
   QT_CREDITO           SMALLINT,
   IC_RECALCULAR_FLUXO  CHAR(1)               
      not null with default 'N'
         constraint GEC8C513 check (IC_RECALCULAR_FLUXO in ('N','S')),
   IC_MODULO_C3         CHAR(1)               
      not null with default '1'
         constraint GEC9C513 check (IC_MODULO_C3 in ('1','2','3')),
   constraint GECPK513 primary key (NU_TRANCHE)
)
 in GECDB002.GECTS513;

ALTER TABLE GEC.GECTB513_TRANCHE 
   ADD  CONSTRAINT GECAK513 unique (NU_IF, NU_TRANCHE, NU_PRODUTO); 
      

label on table GEC.GECTB513_TRANCHE is 'TRANCHE';
label on column GEC.GECTB513_TRANCHE.NU_IDENTIFICADOR_UNICO_RESERVA is 
'NU_IDENTIFICADOR_UNICO_RESERVA_IF';
label on column GEC.GECTB513_TRANCHE.NU_SQNCL_VNCCO_CIT_PRODUTO_IF is 
'NU_SEQUENCIAL_VINCULO';
--==============================================================
-- Index: GEC1I513
--==============================================================
create unique index GEC.GEC1I513 on GEC.GECTB513_TRANCHE (
   NU_TRANCHE           ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I513
--==============================================================
create index GEC.GEC2I513 on GEC.GECTB513_TRANCHE (
   CO_SITUACAO_TRANCHE  ASC
)
USING STOGROUP SGDDB201
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I513
--==============================================================
create index GEC.GEC3I513 on GEC.GECTB513_TRANCHE (
   CO_SITUACAO_ELEGIBILIDADE ASC
)
USING STOGROUP SGDDB201
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC4I513
--==============================================================
create unique index GEC.GEC4I513 on GEC.GECTB513_TRANCHE (
   NU_IF                ASC,
   NU_TRANCHE           ASC,
   NU_PRODUTO           ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB514_LINHA_ARQUIVO_CESSAO
--==============================================================
create table GEC.GECTB514_LINHA_ARQUIVO_CESSAO (
   NU_LINHA_ARQUIVO_CESSAO DECIMAL(19)           
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 9999999999999999999
       minvalue 1
      ),
   NU_ARQUIVO_CESSAO    DECIMAL(8)            
      not null,
   NU_LINHA_IMPORTADA   DECIMAL(8)            
      not null,
   DE_LINHA_ORIGINAL    VARCHAR(700)          
      not null,
   IC_LINHA_VALIDA      CHAR(1)               
      not null
         constraint GEC1C514 check (IC_LINHA_VALIDA in ('S','N')),
   QT_PARCELA_GERAR     DECIMAL(5),
   VR_SALDO_PRESTACAO_VENCER DECIMAL(19, 2),
   CO_CONTRATO_CLIENTE  CHAR(30),
   NU_CPF_CLIENTE       DECIMAL(11),
   constraint GECPK514 primary key (NU_LINHA_ARQUIVO_CESSAO)
)
 in GECDB002.GECTS514;

label on table GEC.GECTB514_LINHA_ARQUIVO_CESSAO is 
'LINHA_ARQUIVO_CESSAO';

--==============================================================
-- Index: GEC1I514
--==============================================================
create unique index GEC.GEC1I514 on GEC.GECTB514_LINHA_ARQUIVO_CESSAO (

   NU_LINHA_ARQUIVO_CESSAO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I514
--==============================================================
create unique index GEC.GEC2I514 on GEC.GECTB514_LINHA_ARQUIVO_CESSAO (

   NU_ARQUIVO_CESSAO    ASC,
   NU_LINHA_IMPORTADA   ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I514
--==============================================================
create index GEC.GEC3I514 on GEC.GECTB514_LINHA_ARQUIVO_CESSAO (
   NU_ARQUIVO_CESSAO    ASC,
   IC_LINHA_VALIDA      ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC4I514
--==============================================================
create index GEC.GEC4I514 on GEC.GECTB514_LINHA_ARQUIVO_CESSAO (
   CO_CONTRATO_CLIENTE  ASC
);

--==============================================================
-- Index: GEC5I514
--==============================================================
create index GEC.GEC5I514 on GEC.GECTB514_LINHA_ARQUIVO_CESSAO (
   NU_CPF_CLIENTE       ASC
);

--==============================================================
-- Table: GECTB515_ERRO_CESSAO
--==============================================================
create table GEC.GECTB515_ERRO_CESSAO (
   NU_LINHA_ARQVO_CESSAO DECIMAL(19)           
      not null,
   CO_TIPO_ARQUIVO      DECIMAL(3)            
      not null,
   NU_CAMPO             DECIMAL(3)            
      not null,
   NU_ERRO              DECIMAL(5)            
      not null,
   constraint GECPK515 primary key (NU_LINHA_ARQVO_CESSAO, NU_CAMPO, 
NU_ERRO)
)
 in GECDB002.GECTS515;

label on table GEC.GECTB515_ERRO_CESSAO is 'ERRO_CESSAO';

--==============================================================
-- Index: GEC1I515
--==============================================================
create unique index GEC.GEC1I515 on GEC.GECTB515_ERRO_CESSAO (
   NU_LINHA_ARQVO_CESSAO ASC,
   NU_CAMPO             ASC,
   NU_ERRO              ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I515
--==============================================================
create index GEC.GEC2I515 on GEC.GECTB515_ERRO_CESSAO (
   NU_ERRO              ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I515
--==============================================================
create index GEC.GEC3I515 on GEC.GECTB515_ERRO_CESSAO (
   NU_LINHA_ARQVO_CESSAO ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB516_LEIAUTE_ARQVO_EXTERNO
--==============================================================
create table GEC.GECTB516_LEIAUTE_ARQVO_EXTERNO (
   CO_TIPO_ARQUIVO      DECIMAL(3)            
      not null
         constraint GEC1C516 check (CO_TIPO_ARQUIVO in (1,2,3,4,5,6,7)),

   NU_CAMPO             DECIMAL(3)            
      not null,
   CO_TIPO_CAMPO        CHAR(2)               
      not null,
   NO_CAMPO             CHAR(100)             
      not null,
   NU_POSICAO_INICIAL   DECIMAL(4)            
      not null,
   NU_POSICAO_FINAL     DECIMAL(4)            
      not null,
   constraint GECPK516 primary key (CO_TIPO_ARQUIVO, NU_CAMPO)
)
 in GECDB002.GECTS516;

label on table GEC.GECTB516_LEIAUTE_ARQVO_EXTERNO is 
'LEIAUTE_ARQUIVO_EXTERNO';

--==============================================================
-- Index: GEC1I516
--==============================================================
create unique index GEC.GEC1I516 on GEC.GECTB516_LEIAUTE_ARQVO_EXTERNO (

   CO_TIPO_ARQUIVO      ASC,
   NU_CAMPO             ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I516
--==============================================================
create index GEC.GEC2I516 on GEC.GECTB516_LEIAUTE_ARQVO_EXTERNO (
   CO_TIPO_CAMPO        ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB517_CREDITO_CESSAO
--==============================================================
create table GEC.GECTB517_CREDITO_CESSAO (
   NU_CREDITO           DECIMAL(19)           
      not null
      generated 1 as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 9999999999999999999
       minvalue 1
      ),
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_SITUACAO_CONTRATO DECIMAL(2)             with default 1,
   NU_SEQUENCIAL_MODELO_RISCO DECIMAL(8),
   CO_SITUACAO_LIQUIDACAO DECIMAL(5),
   NU_SITUACAO_ANALISE_PCP DECIMAL(2)            
      not null,
   NU_LINHA_ARQUIVO_CESSAO DECIMAL(19)           
      not null,
   NU_CPF_CLIENTE       DECIMAL(11)           
      not null,
   NU_CONTRATO_CLIENTE_IF CHAR(30)              
      not null,
   CO_SITUACAO_ELEGIBILIDADE CHAR(1)               
      not null with default '1'
         constraint GEC2C517 check (CO_SITUACAO_ELEGIBILIDADE in ('1',
'2','3')),
   NO_CLIENTE           CHAR(40),
   VR_TOTAL_FINANCIADO  DECIMAL(19, 2),
   VR_PRESTACAO         DECIMAL(19, 2),
   VR_TAXA_CONTRATADA_MES DECIMAL(15, 10),
   QT_PARCELA_ORIGEM    DECIMAL(3),
   QT_PARCELA_PAGA      DECIMAL(3),
   QT_PARCELA_CEDIDA    DECIMAL(3),
   VR_SALDO_PRESTACAO_VENCER DECIMAL(19, 2),
   DT_CONTRATO          DATE,
   DT_PRIMEIRO_VENCIMENTO DATE,
   DT_PROXIMO_VENCIMENTO DATE,
   DT_ULTIMO_VENCIMENTO DATE,
   CO_NACIONALIDADE     DECIMAL(1),
   DT_OBITO             DATE,
   DT_NASCIMENTO        DATE,
   SG_UF_NASCIMENTO     CHAR(2),
   CO_SEXO              CHAR(1),
   CO_TIPO_RESIDENCIA   CHAR(1),
   CO_ESTADO_CIVIL      CHAR(1),
   NU_RG                CHAR(11),
   DE_ORIGEM_RG         CHAR(10),
   DE_RUA_RESIDENCIA    CHAR(40),
   NU_RESIDENCIA        CHAR(5),
   ED_COMPLEMENTO_RESIDENCIA CHAR(32),
   DE_BAIRRO_RESIDENCIA CHAR(32),
   DE_CIDADE_RESIDENCIA CHAR(32),
   CO_UF_RESIDENCIA     CHAR(2),
   NU_CEP_RESIDENCIA    CHAR(8),
   CO_DDD_TELEFONE_RESIDENCIA CHAR(3),
   NU_TELEFONE_RESIDENCIA CHAR(10),
   DT_ULTIMO_VENCIMENTO_CLIENTE DATE,
   CO_CONTRATO_UNICO_C3 CHAR(21),
   CO_CONTROLE_CONTRATO_IF CHAR(40),
   CO_STCO_LQDCO_ANTECIPADA_C3 DECIMAL(5),
   VR_SALDO_DEVEDOR_DATA_CESSAO DECIMAL(18,2),
   PC_TAXA_CONTRATADA_ANO DECIMAL(18,10),
   PC_TAXA_MEDIA_ANUAL_CREDITO DECIMAL(15,6),
   NU_SITUACAO_RECOMPRA SMALLINT,
   IC_CONTRATO_RENEGOCIADO CHAR(1)               
      not null with default 'N'
         constraint GEC1C517 check (IC_CONTRATO_RENEGOCIADO in ('S','N'
)),
   VR_SALDO_DEVEDOR_ATLZO_CTRTO DECIMAL(17,2),
   IC_SITUACAO_ENVIO_ATLZO_CTRTO CHAR(1)               
      not null with default 'E'
         constraint GEC3C517 check (IC_SITUACAO_ENVIO_ATLZO_CTRTO in (
'E','N','R')),
   DT_PROXIMA_PARCELA_ATUALIZADA DATE,
   DT_PRIMEIRA_PARCELA_NAO_PAGA DATE,
   DT_LIQUIDACAO_CREDITO DATE,
   VR_PAGO_AQUISICAO_CREDITO DECIMAL(17,2),
   VR_PREMIO_DESCONTO_AQSCO_CRDTO DECIMAL(17,2),
   constraint GECPK517 primary key (NU_CREDITO)
)
 in GECDB002.GECTS517;

label on table GEC.GECTB517_CREDITO_CESSAO is 'CREDITO_CESSAO';
label on column GEC.GECTB517_CREDITO_CESSAO.NO_CLIENTE is 'NOME_CLIENTE'
;
label on column GEC.GECTB517_CREDITO_CESSAO.QT_PARCELA_ORIGEM is 
'QUANTIDADE_PARCELA_ORIGEM';
label on column GEC.GECTB517_CREDITO_CESSAO.QT_PARCELA_PAGA is 
'QUANTIDADE_PARCELA_PAGA';
label on column GEC.GECTB517_CREDITO_CESSAO.QT_PARCELA_CEDIDA is 
'QUANTIDADE_PARCELA_CEDIDA';
label on column GEC.GECTB517_CREDITO_CESSAO.VR_SALDO_PRESTACAO_VENCER is
 'SALDO_PRETACAO_VENCER';
label on column GEC.GECTB517_CREDITO_CESSAO.SG_UF_NASCIMENTO is 
'SIGLA_UF_NASCIMENTO';
label on column GEC.GECTB517_CREDITO_CESSAO.CO_TIPO_RESIDENCIA is 
'TIPO_RESIDENCIA';
label on column GEC.GECTB517_CREDITO_CESSAO.CO_ESTADO_CIVIL is 
'CODIGO_ESTADO_CIVIL';
label on column GEC.GECTB517_CREDITO_CESSAO.NU_RG is 
'NUMERO_REGISTRO_GERAL';
label on column GEC.GECTB517_CREDITO_CESSAO.DE_ORIGEM_RG is 
'DESCRICAO_ORIGEM_RG';
label on column GEC.GECTB517_CREDITO_CESSAO.DE_RUA_RESIDENCIA is 
'RUA_RESIDENCIA';
label on column GEC.GECTB517_CREDITO_CESSAO.NU_RESIDENCIA is 
'NUMERO_RESIDENCIA';
label on column GEC.GECTB517_CREDITO_CESSAO.ED_COMPLEMENTO_RESIDENCIA is
 'COMPLEMENTO_RESIDENCIA';
label on column GEC.GECTB517_CREDITO_CESSAO.DE_BAIRRO_RESIDENCIA is 
'BAIRRO_RESIDENCIA';
label on column GEC.GECTB517_CREDITO_CESSAO.DE_CIDADE_RESIDENCIA is 
'CIDADE_RESIDENCIA';
label on column GEC.GECTB517_CREDITO_CESSAO.CO_UF_RESIDENCIA is 
'UF_RESIDENCIA';
label on column GEC.GECTB517_CREDITO_CESSAO.NU_CEP_RESIDENCIA is 
'CEP_RESIDENCIA';
label on column GEC.GECTB517_CREDITO_CESSAO.CO_STCO_LQDCO_ANTECIPADA_C3 
is 'CO_SITUACAO_LIQUIDACAO_C3';
label on column GEC.GECTB517_CREDITO_CESSAO.PC_TAXA_MEDIA_ANUAL_CREDITO 
is 'PC_TAXA_MEDIA_ANUAL_OPERACAO_CREDITO';
label on column GEC.GECTB517_CREDITO_CESSAO.VR_SALDO_DEVEDOR_ATLZO_CTRTO
 is 'VR_SALDO_DEVEDOR_ATUALIZADO_CONTRATO';
label on column 
GEC.GECTB517_CREDITO_CESSAO.IC_SITUACAO_ENVIO_ATLZO_CTRTO is 
'IC_SITUACAO_ENVIO_ATUALIZACAO_SALDO_DEVEDOR_CONTRATO';
label on column 
GEC.GECTB517_CREDITO_CESSAO.VR_PREMIO_DESCONTO_AQSCO_CRDTO is 
'VR_PREMIO_DESCONTO_AQUISICAO_CREDITO';
--==============================================================
-- Index: GEC1I517
--==============================================================
create unique index GEC.GEC1I517 on GEC.GECTB517_CREDITO_CESSAO (
   NU_CREDITO           ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I517
--==============================================================
create index GEC.GEC2I517 on GEC.GECTB517_CREDITO_CESSAO (
   NU_LINHA_ARQUIVO_CESSAO ASC
)
USING STOGROUP SGDDB201
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I517
--==============================================================
create index GEC.GEC3I517 on GEC.GECTB517_CREDITO_CESSAO (
   NU_SEQUENCIAL_MODELO_RISCO ASC
)
USING STOGROUP SGDDB201
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC4I517
--==============================================================
create index GEC.GEC4I517 on GEC.GECTB517_CREDITO_CESSAO (
   NU_TRANCHE           ASC,
   NU_CREDITO           ASC,
   NU_CPF_CLIENTE       ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC5I517
--==============================================================
create index GEC.GEC5I517 on GEC.GECTB517_CREDITO_CESSAO (
   NU_TRANCHE           ASC,
   CO_SITUACAO_ELEGIBILIDADE ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC6I517
--==============================================================
create index GEC.GEC6I517 on GEC.GECTB517_CREDITO_CESSAO (
   NU_TRANCHE           ASC
)
USING STOGROUP SGDDB201
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC7I517
--==============================================================
create index GEC.GEC7I517 on GEC.GECTB517_CREDITO_CESSAO (
   NU_CPF_CLIENTE       ASC,
   NU_CONTRATO_CLIENTE_IF ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC8I517
--==============================================================
create index GEC.GEC8I517 on GEC.GECTB517_CREDITO_CESSAO (
   NU_CREDITO           ASC,
   NU_CPF_CLIENTE       ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC9I517
--==============================================================
create index GEC.GEC9I517 on GEC.GECTB517_CREDITO_CESSAO (
   NU_CPF_CLIENTE       ASC
)
using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 10
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GECAI517
--==============================================================
create index GEC.GECAI517 on GEC.GECTB517_CREDITO_CESSAO (
   NU_CONTRATO_CLIENTE_IF DESC,
   NU_TRANCHE           DESC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GECBI517
--==============================================================
create index GEC.GECBI517 on GEC.GECTB517_CREDITO_CESSAO (
   CO_CONTRATO_UNICO_C3 ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB518_DTLHE_VEICULO_CREDITO
--==============================================================
create table GEC.GECTB518_DTLHE_VEICULO_CREDITO (
   NU_CREDITO           DECIMAL(19)           
      not null,
   CO_DDD_TELEFONE_COMERCIAL CHAR(3),
   NU_TELEFONE_COMERCIAL CHAR(10),
   VR_VEICULO           DECIMAL(19, 2),
   VR_OUTRA_TAXA_FINANCIADA DECIMAL(19, 2),
   CO_TIPO_VEICULO      CHAR(1)               
      not null,
   IC_POSSUI_CRCTA_ESPECIAL CHAR(1)               
         constraint GEC1C518 check (IC_POSSUI_CRCTA_ESPECIAL is null or 
(IC_POSSUI_CRCTA_ESPECIAL in ('S','N'))),
   DE_CARACTERISTICA_ESPECIAL CHAR(50),
   PC_FINANCIAMENTO_VEICULO DECIMAL(5, 5),
   AA_FABRICACAO        DECIMAL(4),
   AA_MODELO            DECIMAL(4),
   CO_CHASSIS           CHAR(25),
   CO_RENAVAN           DECIMAL(15),
   QT_CAPACIDADE_CUBICA_MOTOR DECIMAL(5, 1),
   IC_ALIENACAO_SNG     CHAR(1)               
         constraint GEC2C518 check (IC_ALIENACAO_SNG is null or 
(IC_ALIENACAO_SNG in ('S','N'))),
   IC_GARANTIA_ACESSORIA CHAR(1)               
         constraint GEC3C518 check (IC_GARANTIA_ACESSORIA is null or 
(IC_GARANTIA_ACESSORIA in ('S','N'))),
   CO_TIPO_GARANTIA_ACESSORIA CHAR(1),
   NU_CODIGO_CEDENTE    DECIMAL(10),
   CO_SEU_NUMERO        CHAR(11),
   NU_NOSSO_NUMERO      DECIMAL(20),
   NU_SCORE_MINIMO      DECIMAL(5, 0),
   CO_MODALIDADE_VEICULO CHAR(1)               
         constraint GEC4C518 check (CO_MODALIDADE_VEICULO is null or 
(CO_MODALIDADE_VEICULO in ('N','U'))),
   CO_MODELO_RISCO      CHAR(10),
   IC_PRIMEIRO_VEICULO_FINANCIADO CHAR(1)               
         constraint GEC5C518 check (IC_PRIMEIRO_VEICULO_FINANCIADO is 
null or (IC_PRIMEIRO_VEICULO_FINANCIADO in ('S','N'))),
   DT_AVALIACAO_RISCO   DATE,
   NU_BEHAVIOUR_CAIXA   DECIMAL(5),
   CO_REGIAO_DOMICILIO_VEICULO DECIMAL(2),
   VR_SALDO_DEVEDOR     DECIMAL(19, 2),
   VR_TAXA_ANUAL_CONTRATO DECIMAL(16, 12),
   constraint GECPK518 primary key (NU_CREDITO)
)
 in GECDB002.GECTS518;

label on table GEC.GECTB518_DTLHE_VEICULO_CREDITO is 
'DETALHE_VEICULO_CREDITO';
label on column 
GEC.GECTB518_DTLHE_VEICULO_CREDITO.IC_POSSUI_CRCTA_ESPECIAL is 
'IC_POSSUI_CARACTERISTICA_ESPECIAL';
label on column 
GEC.GECTB518_DTLHE_VEICULO_CREDITO.DE_CARACTERISTICA_ESPECIAL is 
'DESCRICAO_CARACTERISTICA_ESPECIAL';
--==============================================================
-- Index: GEC1I518
--==============================================================
create unique index GEC.GEC1I518 on GEC.GECTB518_DTLHE_VEICULO_CREDITO (

   NU_CREDITO           ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I518
--==============================================================
create index GEC.GEC2I518 on GEC.GECTB518_DTLHE_VEICULO_CREDITO (
   CO_TIPO_VEICULO      ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I518
--==============================================================
create index GEC.GEC3I518 on GEC.GECTB518_DTLHE_VEICULO_CREDITO (
   CO_TIPO_GARANTIA_ACESSORIA ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC4I518
--==============================================================
create index GEC.GEC4I518 on GEC.GECTB518_DTLHE_VEICULO_CREDITO (
   CO_REGIAO_DOMICILIO_VEICULO ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC5I518
--==============================================================
create index GEC.GEC5I518 on GEC.GECTB518_DTLHE_VEICULO_CREDITO (
   NU_CREDITO           ASC,
   CO_RENAVAN           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB519_PARAMETRO_COMERCIAL
--==============================================================
create table GEC.GECTB519_PARAMETRO_COMERCIAL (
   QT_DIAS_VALIDADE_CNAB DECIMAL(3),
   QT_MXMO_DIAS_LQDCO_ANTCA DECIMAL(3),
   VR_MINIMO_DEVOLUCAO_PARCELA DECIMAL(19, 2),
   PC_DIFERENCA_MAXIMA_CALCULADA DECIMAL(10, 5)        
      not null,
   VR_DIFERENCA_MAXIMA_VALORES DECIMAL(10, 5)        
      not null with default 0.02,
   VR_MNMO_PRVSO_DIARIA_RCBMO DECIMAL(19, 2)        
      not null with default 0.02,
   IC_FORMA_ENVIO_ARQVO_SINAF CHAR(1)               
      not null with default 'A'
         constraint GEC1C519 check (IC_FORMA_ENVIO_ARQVO_SINAF in ('A',
'M')),
   NU_DIA_UTIL_ENVIO_ARQVO_SINAF SMALLINT,
   IC_FORMA_ENVIO_SLDO_DVDR CHAR(1)               
      not null with default 'A'
         constraint GEC2C519 check (IC_FORMA_ENVIO_SLDO_DVDR in ('A','M'
)),
   DD_UTIL_ENVIO_SLDO_DVDR SMALLINT,
   DD_LIMITE_NAO_RECEBIMENTO SMALLINT,
   NU_EMAIL_INFORMAR_NAO_RCBMO SMALLINT,
   IC_FORMA_ENVIO_ARQVO_CNCTR CHAR(1)               
         constraint GEC3C519 check (IC_FORMA_ENVIO_ARQVO_CNCTR is null 
or (IC_FORMA_ENVIO_ARQVO_CNCTR in ('A','M'))),
   DD_UTIL_ENVIO_ARQVO_CNCTR SMALLINT
)
 in GECDB002.GECTS519;

label on table GEC.GECTB519_PARAMETRO_COMERCIAL is 'PARAMETRO_COMERCIAL'
;
label on column 
GEC.GECTB519_PARAMETRO_COMERCIAL.VR_MNMO_PRVSO_DIARIA_RCBMO is 
'VR_MINIMO_PREVISAO_DIARIA_RECEBIMENTO';
label on column 
GEC.GECTB519_PARAMETRO_COMERCIAL.IC_FORMA_ENVIO_ARQVO_SINAF is 
'IC_FORMA_ENVIO_ARQUIVO_SINAF';
label on column 
GEC.GECTB519_PARAMETRO_COMERCIAL.NU_DIA_UTIL_ENVIO_ARQVO_SINAF is 
'NU_DIA_UTIL_ENVIO_ARQUIVO_SINAF';
label on column 
GEC.GECTB519_PARAMETRO_COMERCIAL.IC_FORMA_ENVIO_SLDO_DVDR is 
'IC_FORMA_ENVIO_ARQUIVO_SALDO_DEVEDOR';
label on column GEC.GECTB519_PARAMETRO_COMERCIAL.DD_UTIL_ENVIO_SLDO_DVDR
 is 'DD_UTIL_ENVIO_ARQUIVO_SALDO_DEVEDOR';
label on column 
GEC.GECTB519_PARAMETRO_COMERCIAL.NU_EMAIL_INFORMAR_NAO_RCBMO is 
'NU_EMAIL_INFORMAR_NAO_RECEBIMENTO';
label on column 
GEC.GECTB519_PARAMETRO_COMERCIAL.IC_FORMA_ENVIO_ARQVO_CNCTR is 
'IC_FORMA_ENVIO_ARQUIVO_CONCENTRADOR';
label on column 
GEC.GECTB519_PARAMETRO_COMERCIAL.DD_UTIL_ENVIO_ARQVO_CNCTR is 
'DD_UTIL_ENVIO_ARQUIVO_CONCENTRADOR';
--==============================================================
-- Table: GECTB520_CTRIO_ELEGIBILIDADE
--==============================================================
create table GEC.GECTB520_CTRIO_ELEGIBILIDADE (
   NU_CRITERIO_ELEGIBILIDADE DECIMAL(5)            
      not null
      generated ? as identity,
   CO_CRITERIO_ELEGIBILIDADE CHAR(10)              
      not null,
   NO_TTLO_CTRIO_ELEGIBILIDADE CHAR(100)             
      not null,
   DT_INICIO_VALIDADE   DATE                  
      not null,
   DT_FIM_VALIDADE      DATE,
   IC_IGNORAVEL         CHAR(1)               
      not null
         constraint GEC1C520 check (IC_IGNORAVEL in ('S','N')),
   IC_PARAMETRO_ALTERAVEL CHAR(1)               
      not null
         constraint GEC2C520 check (IC_PARAMETRO_ALTERAVEL in ('S','N'))
,
   VR_REFERENCIA_MINIMO DECIMAL(19, 5),
   VR_REFERENCIA_MAXIMO DECIMAL(19, 5),
   DT_REFERENCIA        DATE,
   NU_MATRICULA         INTEGER               
      not null,
   TS_INCLUSAO          TIMESTAMP             
      not null,
   CO_IP_ESTACAO_INCLUSAO CHAR(20)              
      not null,
   NU_PRODUTO           SMALLINT,
   constraint GECPK520 primary key (NU_CRITERIO_ELEGIBILIDADE)
)
 in GECDB002.GECTS520;

label on table GEC.GECTB520_CTRIO_ELEGIBILIDADE is 
'CRITERIO_ELEGIBILIDADE';
label on column GEC.GECTB520_CTRIO_ELEGIBILIDADE.NU_MATRICULA is 
'MATRICULA EMPREGADO';
label on column GEC.GECTB520_CTRIO_ELEGIBILIDADE.NU_PRODUTO is 'PRODUTO'
;
--==============================================================
-- Index: GEC1I520
--==============================================================
create unique index GEC.GEC1I520 on GEC.GECTB520_CTRIO_ELEGIBILIDADE (
   NU_CRITERIO_ELEGIBILIDADE ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I520
--==============================================================
create unique index GEC.GEC2I520 on GEC.GECTB520_CTRIO_ELEGIBILIDADE (
   CO_CRITERIO_ELEGIBILIDADE ASC,
   DT_INICIO_VALIDADE   ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB521_TIPO_CAMPO
--==============================================================
create table GEC.GECTB521_TIPO_CAMPO (
   CO_TIPO_CAMPO        CHAR(2)               
      not null,
   DE_TIPO_CAMPO        CHAR(30),
   constraint GECPK521 primary key (CO_TIPO_CAMPO)
)
 in GECDB002.GECTS521;

label on table GEC.GECTB521_TIPO_CAMPO is 'TIPO_CAMPO';

--==============================================================
-- Index: GEC1I521
--==============================================================
create unique index GEC.GEC1I521 on GEC.GECTB521_TIPO_CAMPO (
   CO_TIPO_CAMPO        ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB522_ERRO_PREVISTO
--==============================================================
create table GEC.GECTB522_ERRO_PREVISTO (
   NU_ERRO              DECIMAL(5)            
      not null,
   CO_TIPO_ERRO         CHAR(2)               
      not null
         constraint GEC1C522 check (CO_TIPO_ERRO in ('1','2')),
   DE_ERRO              VARCHAR(500)          
      not null,
   IC_ERRO_IMPEDITIVO   CHAR(1)               
      not null
         constraint GEC2C522 check (IC_ERRO_IMPEDITIVO in ('S','N')),
   IC_CLASSE_ERRO       CHAR(1)               
      not null
         constraint GEC3C522 check (IC_CLASSE_ERRO in ('1','2')),
   constraint GECPK522 primary key (NU_ERRO)
)
 in GECDB002.GECTS522;

label on table GEC.GECTB522_ERRO_PREVISTO is 'ERRO_PREVISTO';

--==============================================================
-- Index: GEC1I522
--==============================================================
create unique index GEC.GEC1I522 on GEC.GECTB522_ERRO_PREVISTO (
   NU_ERRO              ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB523_PARCELA_CREDITO
--==============================================================
create table GEC.GECTB523_PARCELA_CREDITO (
   NU_PARCELA_CREDITO   DECIMAL(18, 0)        
      not null
      generated ? as identity,
   NU_CREDITO           DECIMAL(19, 0)        
      not null,
   NU_PARCELA           DECIMAL(3, 0)         
      not null,
   VR_RECOMPRA          DECIMAL(19, 2)         with default NULL,
   CO_SITUACAO_BAIXA_PARCELA DECIMAL(2, 0)         
      not null,
   DT_VENCIMENTO_PARCELA DATE                  
      not null,
   VR_PARCELA           DECIMAL(19, 2)         with default NULL,
   DT_PAGAMENTO         DATE                   with default NULL,
   CO_CONTROLE_PARCELA_IF CHAR(40)               for SBCS data with 
default NULL,
   CO_PARCELA_UNICO_C3  CHAR(21)               for SBCS data with 
default NULL,
   NU_SQNCL_PREVISAO_RECEBIMENTO DECIMAL(18, 0)         with default 
NULL,
   DT_SIMULACAO_OPERACAO DATE                   with default NULL,
   CO_SITUACAO_LIQUIDACAO DECIMAL(5, 0)          with default NULL,
   VR_RCBDO_CLIENTE_LQDCO_ANTCA DECIMAL(19, 2)         with default NULL
,
   IC_OPERACAO          CHAR(1)                for SBCS data
      not null with default '1',
   NU_SITUACAO_RECOMPRA SMALLINT               with default NULL,
   constraint GECPK523 primary key (NU_PARCELA_CREDITO)
)
 in GECDB002.GECTS523;

label on table GEC.GECTB523_PARCELA_CREDITO is 'PARCELA_CREDITO';
label on column 
GEC.GECTB523_PARCELA_CREDITO.VR_RCBDO_CLIENTE_LQDCO_ANTCA is 
'VR_RECEBIDO_CLIENTE_LIQUIDACAO_ANTECIPADA';
--==============================================================
-- Index: GEC1I523
--==============================================================
create unique index GEC.GEC1I523 on GEC.GECTB523_PARCELA_CREDITO (
   NU_PARCELA_CREDITO   ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC4I523
--==============================================================
create index GEC.GEC4I523 on GEC.GECTB523_PARCELA_CREDITO (
   DT_VENCIMENTO_PARCELA ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC5I523
--==============================================================
create unique index GEC.GEC5I523 on GEC.GECTB523_PARCELA_CREDITO (
   NU_CREDITO           ASC,
   NU_PARCELA           ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC6I523
--==============================================================
create index GEC.GEC6I523 on GEC.GECTB523_PARCELA_CREDITO (
   NU_CREDITO           ASC,
   DT_VENCIMENTO_PARCELA ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC7I523
--==============================================================
create index GEC.GEC7I523 on GEC.GECTB523_PARCELA_CREDITO (
   CO_PARCELA_UNICO_C3  DESC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB524_TED_TRANCHE
--==============================================================
create table GEC.GECTB524_TED_TRANCHE (
   CO_NUOP              CHAR(25)              
      not null,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   constraint GECPK524 primary key (NU_TRANCHE, CO_NUOP)
)
 in GECDB002.GECTS524;

label on table GEC.GECTB524_TED_TRANCHE is 'TED_TRANCHE';

--==============================================================
-- Index: GEC1I524
--==============================================================
create unique index GEC.GEC1I524 on GEC.GECTB524_TED_TRANCHE (
   NU_TRANCHE           ASC,
   CO_NUOP              ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB525_CNAB
--==============================================================
create table GEC.GECTB525_CNAB (
   NU_SEQ_CNAB          DEC(18)               
      not null
      generated ? as identity,
   NU_IF                SMALLINT              
      not null,
   NU_CNPJ_IF           DECIMAL(14),
   NU_CPF_CLIENTE       DECIMAL(11),
   NU_CONTRATO_CLIENTE_IF CHAR(30),
   DT_VENCIMENTO_TITULO DATE,
   VR_NOMINAL_TITULO    DECIMAL(19, 2),
   CO_TITULO_EMPRESA    CHAR(25),
   NU_DOCUMENTO_COBRANCA CHAR(10),
   CO_NOSSO_NUMERO_CEF  CHAR(17),
   CO_MOTIVO_REJEICAO   CHAR(3),
   DT_CREDITO           DATE,
   DT_CARGA             DATE                  
      not null,
   CO_SEU_NUMERO        CHAR(7),
   constraint GECPK525 primary key (NU_SEQ_CNAB)
)
 in GECDB002.GECTS525;

label on table GEC.GECTB525_CNAB is 'CNAB';

--==============================================================
-- Index: GEC1I525
--==============================================================
create unique index GEC.GEC1I525 on GEC.GECTB525_CNAB (
   NU_SEQ_CNAB          ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I525
--==============================================================
create index GEC.GEC2I525 on GEC.GECTB525_CNAB (
   CO_SEU_NUMERO        ASC,
   DT_VENCIMENTO_TITULO ASC,
   DT_CREDITO           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB526_RETORNO_CONVENENTE
--==============================================================
create table GEC.GECTB526_RETORNO_CONVENENTE (
   NU_RETORNO_CONVENENTE DECIMAL(8)            
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_CNPJ_CONVENENTE   DECIMAL(14),
   NU_CONTRATO_CLIENTE_IF CHAR(40),
   NU_CPF_CLIENTE       DECIMAL(14),
   NU_MATRICULA_CLIENTE_IF CHAR(40),
   VR_PARCELA           DECIMAL(19, 2),
   constraint GECPK526 primary key (NU_RETORNO_CONVENENTE)
)
 in GECDB002.GECTS526;

label on table GEC.GECTB526_RETORNO_CONVENENTE is 'RETORNO_CONVENENTE';


--==============================================================
-- Index: GEC1I526
--==============================================================
create unique index GEC.GEC1I526 on GEC.GECTB526_RETORNO_CONVENENTE (
   NU_RETORNO_CONVENENTE ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I526
--==============================================================
create index GEC.GEC2I526 on GEC.GECTB526_RETORNO_CONVENENTE (
   NU_TRANCHE           ASC,
   NU_CNPJ_CONVENENTE   ASC,
   NU_CPF_CLIENTE       ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I526
--==============================================================
create index GEC.GEC3I526 on GEC.GECTB526_RETORNO_CONVENENTE (
   NU_TRANCHE           ASC,
   NU_CNPJ_CONVENENTE   ASC,
   NU_MATRICULA_CLIENTE_IF ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC4I526
--==============================================================
create index GEC.GEC4I526 on GEC.GECTB526_RETORNO_CONVENENTE (
   NU_TRANCHE           ASC,
   NU_CNPJ_CONVENENTE   ASC,
   NU_CONTRATO_CLIENTE_IF ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB527_FLUXO_PAGAMENTO_PCP
--==============================================================
create table GEC.GECTB527_FLUXO_PAGAMENTO_PCP (
   NU_FLUXO_PAGAMENTO_PCP DECIMAL(18, 0)        
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   DT_VENCIMENTO        DATE                  
      not null,
   VR_PMT               DECIMAL(19, 2),
   VR_PMT_DU            DECIMAL(19, 2),
   VR_PMT_DU_DPM        DECIMAL(19, 2),
   VR_LIQUIDACAO        DECIMAL(19,2),
   VR_VPL_LIQUIDACAO    DECIMAL(19,2),
   constraint GECPK527 primary key (NU_FLUXO_PAGAMENTO_PCP)
)
 in GECDB002.GECTS527;

label on table GEC.GECTB527_FLUXO_PAGAMENTO_PCP is 
'FLUXO_PAGAMENTO_ANALISE_PCP';

--==============================================================
-- Index: GEC1I527
--==============================================================
create unique index GEC.GEC1I527 on GEC.GECTB527_FLUXO_PAGAMENTO_PCP (
   NU_FLUXO_PAGAMENTO_PCP ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I527
--==============================================================
create unique index GEC.GEC2I527 on GEC.GECTB527_FLUXO_PAGAMENTO_PCP (
   NU_TRANCHE           ASC,
   DT_VENCIMENTO        ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB528_CRITERIO_IGNORADO
--==============================================================
create table GEC.GECTB528_CRITERIO_IGNORADO (
   NU_SQ_CRITERIO_IGNORADO DECIMAL(5)            
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_MATRICULA         INTEGER               
      not null,
   NU_CRITERIO_ELEGIBILIDADE DECIMAL(5)            
      not null,
   TS_INCLUSAO          TIMESTAMP             
      not null,
   CO_IP_ESTACAO_INCLUSAO CHAR(20)              
      not null,
   constraint GECPK528 primary key (NU_SQ_CRITERIO_IGNORADO)
)
 in GECDB002.GECTS528;

label on table GEC.GECTB528_CRITERIO_IGNORADO is 'CRITERIO_IGNORADO';
label on column GEC.GECTB528_CRITERIO_IGNORADO.NU_SQ_CRITERIO_IGNORADO 
is 'NU_SEQUENCIAL_CRITERIO_IGNORADO';
--==============================================================
-- Index: GEC1I528
--==============================================================
create unique index GEC.GEC1I528 on GEC.GECTB528_CRITERIO_IGNORADO (
   NU_SQ_CRITERIO_IGNORADO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I528
--==============================================================
create unique index GEC.GEC2I528 on GEC.GECTB528_CRITERIO_IGNORADO (
   NU_TRANCHE           ASC,
   NU_CRITERIO_ELEGIBILIDADE ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I528
--==============================================================
create index GEC.GEC3I528 on GEC.GECTB528_CRITERIO_IGNORADO (
   NU_CRITERIO_ELEGIBILIDADE ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC4I528
--==============================================================
create index GEC.GEC4I528 on GEC.GECTB528_CRITERIO_IGNORADO (
   NU_MATRICULA         ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB529_ERRO_ANALISE_ELGBE
--==============================================================
create table GEC.GECTB529_ERRO_ANALISE_ELGBE (
   NU_SQ_ERRO_ELEGIBILIDADE DECIMAL(19, 0)        
      not null
      generated ? as identity,
   NU_CREDITO           DECIMAL(19)           
      not null,
   NU_CRITERIO_ELEGIBILIDADE DECIMAL(5)            
      not null,
   constraint GECPK529 primary key (NU_SQ_ERRO_ELEGIBILIDADE)
)
 in GECDB002.GECTS529;

label on table GEC.GECTB529_ERRO_ANALISE_ELGBE is 
'ERRO_ANALISE_ELEGIBILIDADE';

--==============================================================
-- Index: GEC1I529
--==============================================================
create unique index GEC.GEC1I529 on GEC.GECTB529_ERRO_ANALISE_ELGBE (
   NU_SQ_ERRO_ELEGIBILIDADE ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I529
--==============================================================
create index GEC.GEC2I529 on GEC.GECTB529_ERRO_ANALISE_ELGBE (
   NU_CRITERIO_ELEGIBILIDADE ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I529
--==============================================================
create index GEC.GEC3I529 on GEC.GECTB529_ERRO_ANALISE_ELGBE (
   NU_CREDITO           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC4I529
--==============================================================
create index GEC.GEC4I529 on GEC.GECTB529_ERRO_ANALISE_ELGBE (
   NU_CREDITO           ASC,
   NU_CRITERIO_ELEGIBILIDADE ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB530_VENCIMENTARIO
--==============================================================
create table GEC.GECTB530_VENCIMENTARIO (
   NU_VENCIMENTARIO     DECIMAL(8)            
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_CONTRATO_CLIENTE_IF CHAR(30)              
      not null,
   DT_VENCIMENTO        DATE                  
      not null,
   VR_PARCELA           DECIMAL(12, 2),
   constraint GECPK530 primary key (NU_VENCIMENTARIO)
)
 in GECDB002.GECTS530;

label on table GEC.GECTB530_VENCIMENTARIO is 'VENCIMENTARIO';

--==============================================================
-- Index: GEC1I530
--==============================================================
create unique index GEC.GEC1I530 on GEC.GECTB530_VENCIMENTARIO (
   NU_VENCIMENTARIO     ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I530
--==============================================================
create unique index GEC.GEC2I530 on GEC.GECTB530_VENCIMENTARIO (
   NU_TRANCHE           ASC,
   NU_CONTRATO_CLIENTE_IF ASC,
   DT_VENCIMENTO        ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB531_CONVENENTE_CESSAO
--==============================================================
create table GEC.GECTB531_CONVENENTE_CESSAO (
   NU_SQNCL_CONVENENTE_CESSAO DECIMAL(19)           
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_SEQUENCIAL_CONVENENTE DECIMAL(5)            
      not null,
   CO_SITUACAO_SIAPX    DECIMAL(11),
   IC_AQUISICAO_AUTORIZADA CHAR(1)                with default 'S'
         constraint GEC1C531 check (IC_AQUISICAO_AUTORIZADA is null or 
(IC_AQUISICAO_AUTORIZADA in ('S','N'))),
   QT_CREDITO           DECIMAL(10),
   VR_SOMATORIO_PARCELA DECIMAL(19, 2),
   PC_TAXA_AQUISICAO    DECIMAL(10, 5),
   VR_PERDA_MAXIMA      DECIMAL(19, 2),
   VR_PERDA_ESPERADA    DECIMAL(19, 2),
   PZ_TOTAL_CARTEIRA    DECIMAL(4),
   IC_NCSDE_RCLCO_FLXO_FUTURO CHAR(1)               
      not null with default 'S'
         constraint GEC2C531 check (IC_NCSDE_RCLCO_FLXO_FUTURO in ('S',
'N')),
   NU_SEQ_CONVENENTE    decimal(5)            
      not null,
   constraint GECPK531 primary key (NU_SQNCL_CONVENENTE_CESSAO)
)
 in GECDB002.GECTS531;

label on table GEC.GECTB531_CONVENENTE_CESSAO is 'CONVENENTE_CESSAO';
label on column 
GEC.GECTB531_CONVENENTE_CESSAO.NU_SQNCL_CONVENENTE_CESSAO is 
'NU_SEQUENCIAL_CONVENENTE_CESSAO';
label on column GEC.GECTB531_CONVENENTE_CESSAO.PZ_TOTAL_CARTEIRA is 
'PRAZO_TOTAL_CARTEIRA';
label on column 
GEC.GECTB531_CONVENENTE_CESSAO.IC_NCSDE_RCLCO_FLXO_FUTURO is 
'IC_NECESSIDADE_RECALCULO_FLUXO_FUTURO';
--==============================================================
-- Index: GEC1I531
--==============================================================
create unique index GEC.GEC1I531 on GEC.GECTB531_CONVENENTE_CESSAO (
   NU_SQNCL_CONVENENTE_CESSAO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I531
--==============================================================
create index GEC.GEC2I531 on GEC.GECTB531_CONVENENTE_CESSAO (
   NU_SEQUENCIAL_CONVENENTE ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I531
--==============================================================
create unique index GEC.GEC3I531 on GEC.GECTB531_CONVENENTE_CESSAO (
   NU_TRANCHE           ASC,
   NU_SEQ_CONVENENTE    ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB532_PARAMETRO_EMAIL
--==============================================================
create table GEC.GECTB532_PARAMETRO_EMAIL (
   NU_SEQ_EMAIL         DECIMAL(3)            
      not null,
   DE_OBJETIVO_INTERNO  CHAR(100)             
      not null,
   CO_EMAIL_DESTINATARIO VARCHAR(300)          
      not null,
   DE_CORPO_EMAIL       VARCHAR(2000),
   DE_ASSUNTO_EMAIL     VARCHAR(300)          
      not null,
   IC_ATIVO             CHAR(1)               
      not null default 'S'
         constraint GEC1C532 check (IC_ATIVO in ('S','N')),
   constraint GECPK532 primary key (NU_SEQ_EMAIL)
)
 in GECDB002.GECTS532;

label on table GEC.GECTB532_PARAMETRO_EMAIL is 'PARAMETRO_EMAIL';
label on column GEC.GECTB532_PARAMETRO_EMAIL.DE_CORPO_EMAIL is 
'DE_CORPO_EMAIL_PRECIFICACAO';
label on column GEC.GECTB532_PARAMETRO_EMAIL.DE_ASSUNTO_EMAIL is 
'DESCRICAO_ASSUNTO_EMAIL';
--==============================================================
-- Index: GEC1I532
--==============================================================
create unique index GEC.GEC1I532 on GEC.GECTB532_PARAMETRO_EMAIL (
   NU_SEQ_EMAIL         ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB533_ARQUIVO_CESSAO
--==============================================================
create table GEC.GECTB533_ARQUIVO_CESSAO (
   NU_ARQUIVO_CESSAO    DECIMAL(18)           
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
   NU_TRANCHE           DECIMAL(8),
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(8),
   NU_SITUACAO_ARQUIVO  SMALLINT              
      not null with default 1,
   NO_ARQUIVO_CESSAO    CHAR(200)             
      not null,
   IC_VALIDACAO_CONCLUIDA CHAR(1)               
      not null
         constraint GEC1C533 check (IC_VALIDACAO_CONCLUIDA in ('S','N'))
,
   TS_RECEBIMENTO_ARQUIVO TIMESTAMP             
      not null,
   NU_ISPB_IF           INTEGER,
   QT_LINHA_ACEITA      INTEGER,
   QT_LINHA_REJEITADA   INTEGER,
   CO_PRODUTO_ARQUIVO   CHAR(4),
   DT_OPERACAO_RESERVA  DATE,
   NU_UNICO_RESERVA     CHAR(21),
   NU_IDENTIFICADOR_UNICO_RESERVA CHAR(40),
   constraint GECPK533 primary key (NU_ARQUIVO_CESSAO)
)
 in GECDB002.GECTS533;

label on table GEC.GECTB533_ARQUIVO_CESSAO is 'ARQUIVO_CESSAO';
label on column GEC.GECTB533_ARQUIVO_CESSAO.NU_ISPB_IF is 
'NU_ISPB_INSTITUICAO_FINANCEIRA';
label on column 
GEC.GECTB533_ARQUIVO_CESSAO.NU_IDENTIFICADOR_UNICO_RESERVA is 
'NU_IDENTIFICADOR_UNICO_RESERVA_IF';
--==============================================================
-- Index: GEC1I533
--==============================================================
create unique index GEC.GEC1I533 on GEC.GECTB533_ARQUIVO_CESSAO (
   NU_ARQUIVO_CESSAO    ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB534_DTLHE_CRDTO_CNGDO
--==============================================================
create table GEC.GECTB534_DTLHE_CRDTO_CNGDO (
   NU_CREDITO           DECIMAL(19)           
      not null,
   NU_SQNCL_CONVENENTE_CESSAO DECIMAL(19, 0)        
      not null,
   DT_ENTRADA_EMPREGO   DATE,
   NU_MATRICULA_CLIENTE_IF CHAR(11),
   constraint GECPK534 primary key (NU_CREDITO)
)
 in GECDB002.GECTS534;

label on table GEC.GECTB534_DTLHE_CRDTO_CNGDO is 
'DETALHE_CREDITO_CONSIGNADO';
label on column 
GEC.GECTB534_DTLHE_CRDTO_CNGDO.NU_SQNCL_CONVENENTE_CESSAO is 
'NU_SEQUENCIAL_CONVENENTE_CESSAO';
--==============================================================
-- Index: GEC1I534
--==============================================================
create unique index GEC.GEC1I534 on GEC.GECTB534_DTLHE_CRDTO_CNGDO (
   NU_CREDITO           ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I534
--==============================================================
create index GEC.GEC2I534 on GEC.GECTB534_DTLHE_CRDTO_CNGDO (
   NU_SQNCL_CONVENENTE_CESSAO ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB535_CC_SALDO_VINCULACAO
--==============================================================
create table GEC.GECTB535_CC_SALDO_VINCULACAO (
   NU_SALDO_VINCULACAO  DECIMAL(18)           
      not null
      generated ? as identity,
   NU_ACORDO            DECIMAL(8)            
      not null,
   DT_SALDO             DATE                  
      not null,
   NU_SEQUENCIAL_SALDO_DIA SMALLINT              
      not null default 1,
   IC_TIPO_SALDO        CHAR(1)               
      not null default 'D'
         constraint GEC1C535 check (IC_TIPO_SALDO in ('D','M')),
   VR_TOTAL_CREDITO     DECIMAL(19, 2),
   VR_TOTAL_DEBITO      DECIMAL(19, 2),
   VR_LIMITE_ACORDO     DECIMAL(19, 2),
   VR_TOTAL_CREDITO_REPASSE DECIMAL(19, 2),
   VR_TOTAL_DEVOLUCAO_REPASSE DECIMAL(19, 2),
   VR_SALDO_DISPONIVEL  DECIMAL(19, 2),
   VR_AGIO_APROPRIADO   DECIMAL(19,2),
   VR_PRESENTE_LIQUIDO  DECIMAL(19,2),
   VR_TOTAL_AQUISICAO   DECIMAL(19,2),
   NU_TRANCHE           DECIMAL(8),
   VR_REINTEGRAR        DECIMAL(18,2),
   constraint GECPK535 primary key (NU_SALDO_VINCULACAO)
)
 in GECDB002.GECTS535;

label on table GEC.GECTB535_CC_SALDO_VINCULACAO is 
'CONTA_CORRENTE_SALDO_VINCULACAO';
label on column 
GEC.GECTB535_CC_SALDO_VINCULACAO.VR_TOTAL_CREDITO_REPASSE is 
'TOTAL_CREDITO_REPASSE';
label on column 
GEC.GECTB535_CC_SALDO_VINCULACAO.VR_TOTAL_DEVOLUCAO_REPASSE is 
'TOTAL_DEVOLUCAO_REPASSE';
--==============================================================
-- Index: GEC1I535
--==============================================================
create unique index GEC.GEC1I535 on GEC.GECTB535_CC_SALDO_VINCULACAO (
   NU_SALDO_VINCULACAO  ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I535
--==============================================================
create unique index GEC.GEC2I535 on GEC.GECTB535_CC_SALDO_VINCULACAO (
   NU_ACORDO            ASC,
   DT_SALDO             ASC,
   NU_SEQUENCIAL_SALDO_DIA ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I535
--==============================================================
create index GEC.GEC3I535 on GEC.GECTB535_CC_SALDO_VINCULACAO (
   NU_ACORDO            ASC,
   NU_TRANCHE           ASC,
   DT_SALDO             ASC,
   NU_SEQUENCIAL_SALDO_DIA ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB536_EMAIL_ENVIADO
--==============================================================
create table GEC.GECTB536_EMAIL_ENVIADO (
   NU_SEQUENCIAL_EMAIL  DECIMAL(8)            
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(8)            
      not null,
   TS_ENVIO_EMAIL       TIMESTAMP,
   NU_MATRICULA         INTEGER               
      not null,
   TS_INCLUSAO          TIMESTAMP             
      not null,
   CO_IP_ESTACAO_INCLUSAO CHAR(20)              
      not null,
   CO_EMAIL_DESTINO     CHAR(100)             
      not null,
   CO_EMAIL_CCOPIA      CHAR(100)             
      not null,
   DE_ASSUNTO           VARCHAR(200),
   DE_CORPO_MENSAGEM    VARCHAR(500),
   constraint GECPK536 primary key (NU_SEQUENCIAL_EMAIL)
)
 in GECDB002.GECTS536;

label on table GEC.GECTB536_EMAIL_ENVIADO is 'EMAIL_ENVIADO';
label on column GEC.GECTB536_EMAIL_ENVIADO.NU_MATRICULA is 
'MATRICULA EMPREGADO';
label on column GEC.GECTB536_EMAIL_ENVIADO.DE_ASSUNTO is 
'DESCRICAO_ASSUNTO';
--==============================================================
-- Index: GEC1I536
--==============================================================
create unique index GEC.GEC1I536 on GEC.GECTB536_EMAIL_ENVIADO (
   NU_SEQUENCIAL_EMAIL  ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I536
--==============================================================
create index GEC.GEC2I536 on GEC.GECTB536_EMAIL_ENVIADO (
   NU_SEQUENCIAL_DOCUMENTO ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I536
--==============================================================
create index GEC.GEC3I536 on GEC.GECTB536_EMAIL_ENVIADO (
   NU_MATRICULA         ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB537_MODELO_RISCO
--==============================================================
create table GEC.GECTB537_MODELO_RISCO (
   NU_SEQUENCIAL_MODELO_RISCO DECIMAL(8, 0)         
      not null
      generated ? as identity,
   CO_MODELO_RISCO      CHAR(10)               for SBCS data
      not null,
   CO_ORIGINACAO_CREDITO CHAR(1)                for SBCS data with 
default NULL,
   CO_MODALIDADE        CHAR(1)                for SBCS data with 
default NULL,
   CO_TIPO_VEICULO      CHAR(1)                for SBCS data
      not null,
   PC_MINIMO_FINANCIAMENTO DECIMAL(5, 2)          with default NULL,
   PC_MAXIMO_FINANCIAMENTO DECIMAL(5, 2)          with default NULL,
   NU_SCORE_MINIMO      DECIMAL(8, 0)          with default NULL,
   NU_SCORE_MAXIMO      DECIMAL(8, 0)          with default NULL,
   NU_BEHAVIOR_MINIMO   DECIMAL(8, 0)          with default NULL,
   NU_BEHAVIOR_MAXIMO   DECIMAL(8, 0)          with default NULL,
   CO_REGIAO_DOMICILIO  CHAR(1)                for SBCS data with 
default NULL,
   DT_INICIO_VALIDADE   DATE                   with default NULL,
   DT_FIM_VALIDADE      DATE                   with default NULL,
   constraint GEC1K537 primary key (NU_SEQUENCIAL_MODELO_RISCO)
)
 in GECDB002.GECTS537;

label on table GEC.GECTB537_MODELO_RISCO is 'MODELO_RISCO';

--==============================================================
-- Index: GEC1I537
--==============================================================
create unique index GEC.GEC1I537 on GEC.GECTB537_MODELO_RISCO (
   NU_SEQUENCIAL_MODELO_RISCO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I537
--==============================================================
create unique index GEC.GEC2I537 on GEC.GECTB537_MODELO_RISCO (
   CO_MODELO_RISCO      ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB538_FLXO_MDLDE_VEICULO
--==============================================================
create table GEC.GECTB538_FLXO_MDLDE_VEICULO (
   NU_FLXO_MDLDE_VEICULO DECIMAL(18, 0)        
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_SEQUENCIAL_MODELO_RISCO DECIMAL(8)            
      not null,
   CO_SITUACAO_ANALISE_PCP DECIMAL(2)            
      not null,
   QT_CREDITO           DECIMAL(8),
   VR_SOMA_PARCELA      DECIMAL(19, 2),
   VR_TAXA_AQUISICAO    DECIMAL(10, 5),
   PC_PERDA_ESPERADA_CAIXA DECIMAL(10, 5),
   PC_PERDA_ESPERADA_IF DECIMAL(10, 5),
   constraint GECPK538 primary key (NU_FLXO_MDLDE_VEICULO)
)
 in GECDB002.GECTS538;

label on table GEC.GECTB538_FLXO_MDLDE_VEICULO is 
'FLUXO_MODALIDADE_VEICULO';

--==============================================================
-- Index: GEC1I538
--==============================================================
create unique index GEC.GEC1I538 on GEC.GECTB538_FLXO_MDLDE_VEICULO (
   NU_FLXO_MDLDE_VEICULO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I538
--==============================================================
create unique index GEC.GEC2I538 on GEC.GECTB538_FLXO_MDLDE_VEICULO (
   NU_TRANCHE           ASC,
   NU_SEQUENCIAL_MODELO_RISCO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB539_DOCUMENTO_TRANCHE
--==============================================================
create table GEC.GECTB539_DOCUMENTO_TRANCHE (
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(8)            
      not null,
   IC_ANEXO_CESSAO      CHAR(1)               
      not null with default 'N'
         constraint GEC1C539 check (IC_ANEXO_CESSAO in ('S','N')),
   IC_DETALHE_PRECIFICACAO CHAR(1)               
      not null with default 'N'
         constraint GEC2C539 check (IC_DETALHE_PRECIFICACAO in ('S','N'
)),
   constraint GECPK539 primary key (NU_TRANCHE, NU_SEQUENCIAL_DOCUMENTO)

)
 in GECDB002.GECTS539;

label on table GEC.GECTB539_DOCUMENTO_TRANCHE is 'DOCUMENTO_TRANCHE';

--==============================================================
-- Index: GEC1I539
--==============================================================
create unique index GEC.GEC1I539 on GEC.GECTB539_DOCUMENTO_TRANCHE (
   NU_TRANCHE           ASC,
   NU_SEQUENCIAL_DOCUMENTO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB540_HSTRO_PRMTO_CMRCL
--==============================================================
create table GEC.GECTB540_HSTRO_PRMTO_CMRCL (
   TS_ALTERACAO         TIMESTAMP             
      not null,
   NU_MATRICULA         DECIMAL(6)            
      not null,
   QT_DIAS_VALIDADE_CNAB DECIMAL(3),
   QT_MXMO_DIAS_LQDCO_ANTCA DECIMAL(3),
   VR_MINIMO_DEVOLUCAO_PARCELA DECIMAL(19, 2),
   PC_DIFERENCA_MAXIMA_CALCULADA DECIMAL(10,5)         
      not null,
   VR_DIFERENCA_MAXIMA_VALORES DECIMAL(10, 5),
   VR_MNMO_PRVSO_DIARIA_RCBMO DECIMAL(19, 2)        
      not null with default,
   IC_FORMA_ENVIO_ARQVO_SINAF CHAR(1)               
         constraint GEC1C540 check (IC_FORMA_ENVIO_ARQVO_SINAF is null 
or (IC_FORMA_ENVIO_ARQVO_SINAF in ('A','M'))),
   NU_DIA_UTIL_ENVIO_ARQVO_SINAF SMALLINT,
   IC_FORMA_ENVIO_SLDO_DVDR CHAR(1)                with default 'A'
         constraint GEC2C540 check (IC_FORMA_ENVIO_SLDO_DVDR is null or 
(IC_FORMA_ENVIO_SLDO_DVDR in ('A','M'))),
   DD_UTIL_ENVIO_SLDO_DVDR SMALLINT,
   DD_LIMITE_NAO_RECEBIMENTO SMALLINT,
   NU_EMAIL_INFORMAR_NAO_RCBMO SMALLINT,
   IC_FORMA_ENVIO_ARQVO_CNCTR CHAR(1)               
         constraint GEC3C540 check (IC_FORMA_ENVIO_ARQVO_CNCTR is null 
or (IC_FORMA_ENVIO_ARQVO_CNCTR in ('A','M'))),
   DD_UTIL_ENVIO_ARQVO_CNCTR SMALLINT,
   constraint GECPK540 primary key (TS_ALTERACAO)
)
 in GECDB002.GECTS540;

label on table GEC.GECTB540_HSTRO_PRMTO_CMRCL is 
'HISTORICO_PARAMETRO_COMERCIAL';
label on column GEC.GECTB540_HSTRO_PRMTO_CMRCL.QT_MXMO_DIAS_LQDCO_ANTCA 
is 'QUANTIDADE_MAXIMA_DIAS_PARA_LIQUIDACAO_ANTECIPADA';
label on column 
GEC.GECTB540_HSTRO_PRMTO_CMRCL.VR_MNMO_PRVSO_DIARIA_RCBMO is 
'VR_MINIMO_PREVISAO_DIARIA_RECEBIMENTO';
label on column 
GEC.GECTB540_HSTRO_PRMTO_CMRCL.IC_FORMA_ENVIO_ARQVO_SINAF is 
'IC_FORMA_ENVIO_ARQUIVO_SINAF';
label on column 
GEC.GECTB540_HSTRO_PRMTO_CMRCL.NU_DIA_UTIL_ENVIO_ARQVO_SINAF is 
'NU_DIA_UTIL_ENVIO_ARQUIVO_SINAF';
label on column GEC.GECTB540_HSTRO_PRMTO_CMRCL.IC_FORMA_ENVIO_SLDO_DVDR 
is 'IC_FORMA_ENVIO_ARQUIVO_SALDO_DEVEDOR';
label on column GEC.GECTB540_HSTRO_PRMTO_CMRCL.DD_UTIL_ENVIO_SLDO_DVDR 
is 'DD_UTIL_ENVIO_ARQUIVO_SALDO_DEVEDOR';
label on column 
GEC.GECTB540_HSTRO_PRMTO_CMRCL.NU_EMAIL_INFORMAR_NAO_RCBMO is 
'NU_EMAIL_INFORMAR_NAO_RECEBIMENTO';
label on column 
GEC.GECTB540_HSTRO_PRMTO_CMRCL.IC_FORMA_ENVIO_ARQVO_CNCTR is 
'IC_FORMA_ENVIO_ARQUIVO_CONCENTRADOR';
label on column GEC.GECTB540_HSTRO_PRMTO_CMRCL.DD_UTIL_ENVIO_ARQVO_CNCTR
 is 'DD_UTIL_ENVIO_ARQUIVO_CONCENTRADOR';
--==============================================================
-- Index: GEC1I540
--==============================================================
create unique index GEC.GEC1I540 on GEC.GECTB540_HSTRO_PRMTO_CMRCL (
   TS_ALTERACAO         DESC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB541_CONTRATO_DI
--==============================================================
create table GEC.GECTB541_CONTRATO_DI (
   NU_SEQUENCIAL_CONTRATO_DI DECIMAL(8)            
      not null
      generated ? as identity,
   NU_IF                SMALLINT              
      not null,
   NU_BANCO             DECIMAL(3),
   NU_CPF               DECIMAL(14),
   NU_CONTRATO          CHAR(20),
   constraint GECPK541 primary key (NU_SEQUENCIAL_CONTRATO_DI)
)
 in GECDB002.GECTS541;

label on table GEC.GECTB541_CONTRATO_DI is 'CONTRATO_DI';

--==============================================================
-- Index: GEC1I541
--==============================================================
create unique index GEC.GEC1I541 on GEC.GECTB541_CONTRATO_DI (
   NU_SEQUENCIAL_CONTRATO_DI ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I541
--==============================================================
create unique index GEC.GEC2I541 on GEC.GECTB541_CONTRATO_DI (
   NU_IF                ASC,
   NU_BANCO             ASC,
   NU_CPF               ASC,
   NU_CONTRATO          ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I541
--==============================================================
create index GEC.GEC3I541 on GEC.GECTB541_CONTRATO_DI (
   NU_IF                ASC,
   NU_CPF               ASC,
   NU_CONTRATO          ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB542_DETALHE_REPASSE
--==============================================================
create table GEC.GECTB542_DETALHE_REPASSE (
   NU_SEQUENCIAL_REPASSE DECIMAL(18)           
      not null
      generated ? as identity,
   NU_SQNCL_ARQVO_REPASSE DECIMAL(18)           
      not null,
   NU_CONTRATO_CLIENTE_IF CHAR(30)              
      not null,
   NU_PARCELA_CREDITO   DECIMAL(18, 0),
   NU_CESSAO_TRANCHE    DECIMAL(8),
   DT_CESSAO_TRANCHE    DATE,
   DT_VENCIMENTO_CONTRATO DATE,
   DT_RECEBIMENTO_PAGAMENTO_PRCLA DATE,
   DT_REPASSE_CAIXA     DATE,
   DT_PRESTACAO_ESTORNADA DATE,
   VR_PRESTACAO_SOMADA_JURO DECIMAL(10, 2),
   VR_RECEBIDO_PARCELA  DECIMAL(10, 2),
   VR_JURO_RECEBIDO_PARCELA DECIMAL(10, 2),
   VR_ENCARGO_RECEBIDO  DECIMAL(10, 2),
   VR_VALOR_RECEBIDO    DECIMAL(10, 2),
   PC_INDCE_APROPRIACAO_DI_CETIP DECIMAL(15, 10),
   VR_TOTAL_REPASSADO   DECIMAL(10,2),
   NU_MOTIVO_RECEBIMENTO DECIMAL(2)            
      not null,
   IC_AGENTE_RECEBEDOR  DECIMAL(2)            
         constraint GEC1C542 check (IC_AGENTE_RECEBEDOR is null or 
(IC_AGENTE_RECEBEDOR in (1,2,3))),
   NU_MOTIVO_ESTORNO    DECIMAL(2),
   NU_MOTIVO_RECUSA_DEVOLUCAO DECIMAL(3),
   NU_AGRUPADOR_REPASSE DECIMAL(2)            
      not null,
   IC_SITUACAO_REPASSE  CHAR(1)               
         constraint GEC2C542 check (IC_SITUACAO_REPASSE is null or 
(IC_SITUACAO_REPASSE in ('A','R'))),
   IC_SITUACAO_APROPRIACAO CHAR(1)               
         constraint GEC3C542 check (IC_SITUACAO_APROPRIACAO is null or 
(IC_SITUACAO_APROPRIACAO in ('1','2','3','4'))),
   VR_DIFERENCA_ESPERADO_RCBDO DECIMAL(10, 2),
   VR_ESPRO_RCPAO_INADIMPLENCIA DECIMAL(10, 2),
   VR_ESPERADO_LQDCO_ANTECIPADA DECIMAL(10, 2),
   IC_EXSTA_PARCELA_COMPLEMENTAR CHAR(1)               
         constraint GEC4C542 check (IC_EXSTA_PARCELA_COMPLEMENTAR is 
null or (IC_EXSTA_PARCELA_COMPLEMENTAR in ('S','N'))),
   VR_PRCLA_CMPLR_ATUALIZADA DECIMAL(10, 2),
   NU_SQNCL_PACOTE_DEVOLUCAO DECIMAL(18),
   VR_DEVOLUCAO_CREDITO DECIMAL(10, 2),
   DT_PGMNO_DEVOLUCAO_CREDITO DATE,
   VR_CUSTAS_DEVOLUCAO_CREDITO DECIMAL(10, 2)         with default 0,
   VR_SALDO_DEVOLVER_ATUALIZADO DECIMAL(10, 2),
   IC_STCO_DVLCO_PRCLA_CMPLR CHAR(1)               
         constraint GEC5C542 check (IC_STCO_DVLCO_PRCLA_CMPLR is null or
 (IC_STCO_DVLCO_PRCLA_CMPLR in ('1','2'))),
   VR_SALDO_DEVEDOR_ATLDO_RPSE DECIMAL(17,2),
   DT_PROXIMO_VNCMO_RCBMO_RPSE DATE,
   DT_PRMRA_PRCLA_NAO_PAGA_RPSE DATE,
   constraint GECPK542 primary key (NU_SEQUENCIAL_REPASSE)
)
 in GECDB002.GECTS542;

label on table GEC.GECTB542_DETALHE_REPASSE is 'DETALHE_REPASSE';
label on column GEC.GECTB542_DETALHE_REPASSE.NU_SQNCL_ARQVO_REPASSE is 
'NU_SEQUENCIAL_ARQUIVO_REPASSE';
label on column 
GEC.GECTB542_DETALHE_REPASSE.DT_RECEBIMENTO_PAGAMENTO_PRCLA is 
'DT_RECEBIMENTO_PAGAMENTO_PARCELA';
label on column GEC.GECTB542_DETALHE_REPASSE.VR_PRESTACAO_SOMADA_JURO is
 'VR_PRESTACAO_SOMADA_JUROS';
label on column GEC.GECTB542_DETALHE_REPASSE.VR_JURO_RECEBIDO_PARCELA is
 'VR_JUROS_RECEBIDO_PARCELA';
label on column GEC.GECTB542_DETALHE_REPASSE.VR_VALOR_RECEBIDO is 
'VR_TOTAL_RECEBIDO_PELA_IF';
label on column 
GEC.GECTB542_DETALHE_REPASSE.PC_INDCE_APROPRIACAO_DI_CETIP is 
'PC_INDICE_APROPRIACAO_DI_CETIP';
label on column GEC.GECTB542_DETALHE_REPASSE.VR_DIFERENCA_ESPERADO_RCBDO
 is 'VR_DIFERENCA_ESPERADO_RECEBIDO';
label on column 
GEC.GECTB542_DETALHE_REPASSE.VR_ESPRO_RCPAO_INADIMPLENCIA is 
'VR_ESPERADO_RECUPERACAO_INADIMPLENCIA';
label on column 
GEC.GECTB542_DETALHE_REPASSE.VR_ESPERADO_LQDCO_ANTECIPADA is 
'VR_ESPERADO_LIQUIDACAO_ANTECIPADA';
label on column 
GEC.GECTB542_DETALHE_REPASSE.IC_EXSTA_PARCELA_COMPLEMENTAR is 
'IC_EXISTENCIA_PARCELA_COMPLEMENTAR';
label on column GEC.GECTB542_DETALHE_REPASSE.VR_PRCLA_CMPLR_ATUALIZADA 
is 'VR_PARCELA_COMPLEMENTAR_ATUALIZADA';
label on column GEC.GECTB542_DETALHE_REPASSE.NU_SQNCL_PACOTE_DEVOLUCAO 
is 'NU_SEQUENCIAL_PACOTE_DEVOLUCAO';
label on column GEC.GECTB542_DETALHE_REPASSE.DT_PGMNO_DEVOLUCAO_CREDITO 
is 'DT_PAGAMENTO_DEVOLUCAO_CREDITO';
label on column GEC.GECTB542_DETALHE_REPASSE.IC_STCO_DVLCO_PRCLA_CMPLR 
is 'IC_SITUACAO_DEVOLUCAO_PARCELA_COMPLEMENTAR';
label on column GEC.GECTB542_DETALHE_REPASSE.VR_SALDO_DEVEDOR_ATLDO_RPSE
 is 'VR_SALDO_DEVEDOR_ATUALIZADO_REPASSE';
label on column GEC.GECTB542_DETALHE_REPASSE.DT_PROXIMO_VNCMO_RCBMO_RPSE
 is 'DT_PROXIMO_VENCIMENTO_RECEBIMENTO_REPASSE';
label on column 
GEC.GECTB542_DETALHE_REPASSE.DT_PRMRA_PRCLA_NAO_PAGA_RPSE is 
'DT_PRIMEIRA_PARCELA_NAO_PAGA_REPASSE';
--==============================================================
-- Index: GEC1I542
--==============================================================
create unique index GEC.GEC1I542 on GEC.GECTB542_DETALHE_REPASSE (
   NU_SEQUENCIAL_REPASSE ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I542
--==============================================================
create index GEC.GEC2I542 on GEC.GECTB542_DETALHE_REPASSE (
   NU_PARCELA_CREDITO   ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I542
--==============================================================
create index GEC.GEC3I542 on GEC.GECTB542_DETALHE_REPASSE (
   NU_AGRUPADOR_REPASSE ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
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
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC4I542
--==============================================================
create index GEC.GEC4I542 on GEC.GECTB542_DETALHE_REPASSE (
   NU_SQNCL_ARQVO_REPASSE ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
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
-- Index: GEC5I542
--==============================================================
create index GEC.GEC5I542 on GEC.GECTB542_DETALHE_REPASSE (
   NU_CONTRATO_CLIENTE_IF ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
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
-- Index: GEC6I542
--==============================================================
create index GEC.GEC6I542 on GEC.GECTB542_DETALHE_REPASSE (
   DT_RECEBIMENTO_PAGAMENTO_PRCLA ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
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
-- Table: GECTB543_MTVO_RCSA_DVLCO_RPSE
--==============================================================
create table GEC.GECTB543_MTVO_RCSA_DVLCO_RPSE (
   NU_MTVO_RECUSA_DVLCO_RPSE DECIMAL(3)            
      not null
      generated ? as identity,
   DE_MTVO_RECUSA_DVLCO_RPSE VARCHAR(50)           
      not null,
   constraint GECPK543 primary key (NU_MTVO_RECUSA_DVLCO_RPSE)
)
 in GECDB002.GECTS543;

label on table GEC.GECTB543_MTVO_RCSA_DVLCO_RPSE is 
'MOTIVO_RECUSA_DEVOLUCAO';

--==============================================================
-- Index: GEC1I543
--==============================================================
create unique index GEC.GEC1I543 on GEC.GECTB543_MTVO_RCSA_DVLCO_RPSE (

   NU_MTVO_RECUSA_DVLCO_RPSE ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB544_ARQVO_REPASSE
--==============================================================
create table GEC.GECTB544_ARQVO_REPASSE (
   NU_SQNCL_ARQVO_REPASSE DECIMAL(18)           
      not null
      generated ? as identity,
   NU_PACOTE_RECEBIMENTO_REPASSE DECIMAL(18),
   NO_ARQVO_REPASSE     CHAR(100),
   NU_IF                SMALLINT,
   DT_RECEBIMENTO       DATE,
   QT_PARCELA           INTEGER,
   VR_TOTAL_RECEBIMENTO_ARQUIVO DECIMAL(19, 2),
   VR_TOTAL_REPASSADO_ARQUIVO DECIMAL(19, 2),
   IC_TIPO_PRODUTO      CHAR(1)               
         constraint GEC1C544 check (IC_TIPO_PRODUTO is null or 
(IC_TIPO_PRODUTO in ('1','X'))),
   QT_REGISTRO_ARQUIVO  DECIMAL(8),
   TS_INICIO_PROCESSAMENTO TIMESTAMP,
   TS_FIM_PROCESSAMENTO TIMESTAMP,
   IC_ARQUIVO_PROCESSADO CHAR(1)               
      not null
         constraint GEC2C544 check (IC_ARQUIVO_PROCESSADO in ('S','N')),

   NU_PRODUTO           SMALLINT,
   constraint GECPK544 primary key (NU_SQNCL_ARQVO_REPASSE)
)
 in GECDB002.GECTS544;

label on table GEC.GECTB544_ARQVO_REPASSE is 'ARQUIVO_REPASSE';
label on column GEC.GECTB544_ARQVO_REPASSE.NU_SQNCL_ARQVO_REPASSE is 
'NU_SEQUENCIAL_ARQUIVO_REPASSE';
label on column GEC.GECTB544_ARQVO_REPASSE.NO_ARQVO_REPASSE is 
'NO_ARQUIVO_REPASSE';
--==============================================================
-- Index: GEC1I544
--==============================================================
create unique index GEC.GEC1I544 on GEC.GECTB544_ARQVO_REPASSE (
   NU_SQNCL_ARQVO_REPASSE ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I544
--==============================================================
create index GEC.GEC2I544 on GEC.GECTB544_ARQVO_REPASSE (
   NU_IF                ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC4I544
--==============================================================
create index GEC.GEC4I544 on GEC.GECTB544_ARQVO_REPASSE (
   NU_PACOTE_RECEBIMENTO_REPASSE ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC5I544
--==============================================================
create index GEC.GEC5I544 on GEC.GECTB544_ARQVO_REPASSE (
   NU_PRODUTO           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB545_RSLTO_PRCNO_SNTTO
--==============================================================
create table GEC.GECTB545_RSLTO_PRCNO_SNTTO (
   NU_AGRUPADOR_REPASSE DECIMAL(2)            
      not null,
   NU_PACOTE_RECEBIMENTO_REPASSE DECIMAL(18)           
      not null,
   QT_ENCONTRADO_ITEM_AGRUPADOR DECIMAL(10)            with default 0,
   VR_ENCONTRADO_ITEM_AGRUPADOR DECIMAL(19, 2)         with default 0,
   constraint GECPK545 primary key (NU_AGRUPADOR_REPASSE, 
NU_PACOTE_RECEBIMENTO_REPASSE)
)
 in GECDB002.GECTS545;

label on table GEC.GECTB545_RSLTO_PRCNO_SNTTO is 
'RESULTADO_PROCESSAMENTO_SINTETICO';

--==============================================================
-- Index: GEC1I545
--==============================================================
create unique index GEC.GEC1I545 on GEC.GECTB545_RSLTO_PRCNO_SNTTO (
   NU_AGRUPADOR_REPASSE ASC,
   NU_PACOTE_RECEBIMENTO_REPASSE ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I545
--==============================================================
create index GEC.GEC2I545 on GEC.GECTB545_RSLTO_PRCNO_SNTTO (
   NU_PACOTE_RECEBIMENTO_REPASSE ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB546_MOTIVO_RECEBIMENTO
--==============================================================
create table GEC.GECTB546_MOTIVO_RECEBIMENTO (
   NU_MOTIVO_RECEBIMENTO DECIMAL(2)            
      not null,
   DE_MOTIVO_RECEBIMENTO VARCHAR(50)           
      not null,
   constraint GECPK546 primary key (NU_MOTIVO_RECEBIMENTO)
)
 in GECDB002.GECTS546;

label on table GEC.GECTB546_MOTIVO_RECEBIMENTO is 'MOTIVO_RECEBIMENTO';


--==============================================================
-- Index: GEC1I546
--==============================================================
create unique index GEC.GEC1I546 on GEC.GECTB546_MOTIVO_RECEBIMENTO (
   NU_MOTIVO_RECEBIMENTO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB547_MOTIVO_ESTORNO
--==============================================================
create table GEC.GECTB547_MOTIVO_ESTORNO (
   NU_MOTIVO_ESTORNO    DECIMAL(2)            
      not null,
   DE_MOTIVO_ESTORNO    VARCHAR(50)           
      not null,
   constraint GECPK547 primary key (NU_MOTIVO_ESTORNO)
)
 in GECDB002.GECTS547;

label on table GEC.GECTB547_MOTIVO_ESTORNO is 'MOTIVO_ESTORNO';

--==============================================================
-- Index: GEC1I547
--==============================================================
create unique index GEC.GEC1I547 on GEC.GECTB547_MOTIVO_ESTORNO (
   NU_MOTIVO_ESTORNO    ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB548_SITUACAO_TRANCHE
--==============================================================
create table GEC.GECTB548_SITUACAO_TRANCHE (
   CO_SITUACAO_TRANCHE  DECIMAL(2)            
      not null,
   DE_SITUACAO_TRANCHE  CHAR(150)             
      not null,
   DE_SITUACAO_CONTRATO VARCHAR(15)           
      not null,
   constraint GECPK548 primary key (CO_SITUACAO_TRANCHE)
)
 in GECDB002.GECTS548;

label on table GEC.GECTB548_SITUACAO_TRANCHE is 'SITUACAO_TRANCHE';

--==============================================================
-- Index: GEC1I548
--==============================================================
create unique index GEC.GEC1I548 on GEC.GECTB548_SITUACAO_TRANCHE (
   CO_SITUACAO_TRANCHE  ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB549_STCO_ELEGIBILIDADE
--==============================================================
create table GEC.GECTB549_STCO_ELEGIBILIDADE (
   CO_SITUACAO_ELEGIBILIDADE DECIMAL(2)            
      not null,
   DE_SITUACAO_ELEGIBILIDADE CHAR(30)              
      not null,
   constraint GECPK549 primary key (CO_SITUACAO_ELEGIBILIDADE)
)
 in GECDB002.GECTS549;

label on table GEC.GECTB549_STCO_ELEGIBILIDADE is 
'SITUACAO_ELEGIBILIDADE';

--==============================================================
-- Index: GEC1I549
--==============================================================
create unique index GEC.GEC1I549 on GEC.GECTB549_STCO_ELEGIBILIDADE (
   CO_SITUACAO_ELEGIBILIDADE ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB550_TIPO_VEICULO
--==============================================================
create table GEC.GECTB550_TIPO_VEICULO (
   CO_TIPO_VEICULO      CHAR(1)               
      not null,
   DE_TIPO_VEICULO      CHAR(20)              
      not null,
   constraint GECPK550 primary key (CO_TIPO_VEICULO)
)
 in GECDB002.GECTS550;

label on table GEC.GECTB550_TIPO_VEICULO is 'TIPO_VEICULO';

--==============================================================
-- Index: GEC1I550
--==============================================================
create unique index GEC.GEC1I550 on GEC.GECTB550_TIPO_VEICULO (
   CO_TIPO_VEICULO      ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB551_TIPO_GRNTA_ACESSORIA
--==============================================================
create table GEC.GECTB551_TIPO_GRNTA_ACESSORIA (
   CO_TIPO_GARANTIA_ACESSORIA CHAR(1)               
      not null,
   DE_TIPO_GARANTIA_ACESSORIA CHAR(20),
   constraint GECPK551 primary key (CO_TIPO_GARANTIA_ACESSORIA)
)
 in GECDB002.GECTS551;

label on table GEC.GECTB551_TIPO_GRNTA_ACESSORIA is 
'TIPO_GARANTIA_ACESSORIA';

--==============================================================
-- Index: GEC1I551
--==============================================================
create unique index GEC.GEC1I551 on GEC.GECTB551_TIPO_GRNTA_ACESSORIA (

   CO_TIPO_GARANTIA_ACESSORIA ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB552_REGIAO_DOMICILIO
--==============================================================
create table GEC.GECTB552_REGIAO_DOMICILIO (
   CO_REGIAO_DOMICILIO  DECIMAL(2)            
      not null,
   DE_REGIAO_DOMICILIO  CHAR(20),
   constraint GECPK552 primary key (CO_REGIAO_DOMICILIO)
)
 in GECDB002.GECTS552;

label on table GEC.GECTB552_REGIAO_DOMICILIO is 'REGIAO_DOMICILIO';

--==============================================================
-- Index: GEC1I552
--==============================================================
create unique index GEC.GEC1I552 on GEC.GECTB552_REGIAO_DOMICILIO (
   CO_REGIAO_DOMICILIO  ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
dssize ? G
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB553_SITUACAO_ANALISE_PCP
--==============================================================
create table GEC.GECTB553_SITUACAO_ANALISE_PCP (
   NU_SITUACAO_ANALISE_PCP DECIMAL(2)            
      not null,
   DE_SITUACAO_ANALISE_PCP CHAR(50)              
      not null,
   constraint GECPK553 primary key (NU_SITUACAO_ANALISE_PCP)
)
 in GECDB002.GECTS553;

label on table GEC.GECTB553_SITUACAO_ANALISE_PCP is 
'SITUACAO_ANALISE_PRECO_CONVENIO';

--==============================================================
-- Index: GEC1I553
--==============================================================
create unique index GEC.GEC1I553 on GEC.GECTB553_SITUACAO_ANALISE_PCP (

   NU_SITUACAO_ANALISE_PCP ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB554_OFCO_LQDCO_ANTECIPADA
--==============================================================
create table GEC.GECTB554_OFCO_LQDCO_ANTECIPADA (
   NU_OFCO_LQDCO_ANTECIPADA DECIMAL(8)            
      not null
      generated ? as identity,
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(8)            
      not null,
   MM_ANO_REFERENCIA    CHAR(6)               
      not null,
   constraint GECPK554 primary key (NU_OFCO_LQDCO_ANTECIPADA)
)
 in GECDB002.GECTS554;

label on table GEC.GECTB554_OFCO_LQDCO_ANTECIPADA is 
'OFICIO_LIQUIDACAO_ANTECIPADA';
label on column 
GEC.GECTB554_OFCO_LQDCO_ANTECIPADA.NU_OFCO_LQDCO_ANTECIPADA is 
'NU_SEQUENCIAL_OFICIO_LIQUIDACAO_ANTECIPADA';
--==============================================================
-- Index: GEC1I554
--==============================================================
create unique index GEC.GEC1I554 on GEC.GECTB554_OFCO_LQDCO_ANTECIPADA (

   NU_OFCO_LQDCO_ANTECIPADA ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I554
--==============================================================
create unique index GEC.GEC2I554 on GEC.GECTB554_OFCO_LQDCO_ANTECIPADA (

   NU_SEQUENCIAL_DOCUMENTO ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB555_VNCLO_PRCLA_REPASSE
--==============================================================
create table GEC.GECTB555_VNCLO_PRCLA_REPASSE (
   NU_SEQUENCIAL_REPASSE DECIMAL(18)           
      not null,
   NU_EVENTO_LIQUIDACAO_REPASSE CHAR(21)              
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   TS_VINCULACAO        TIMESTAMP             
      not null,
   constraint GECPK555 primary key (NU_SEQUENCIAL_REPASSE, 
NU_EVENTO_LIQUIDACAO_REPASSE, NU_UNICO_PARCELA_REGISTRADORA, 
NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA)
)
 in GECDB002.GECTS555;

label on table GEC.GECTB555_VNCLO_PRCLA_REPASSE is 
'VINCULO_PARCELA_REPASSE';
label on column GEC.GECTB555_VNCLO_PRCLA_REPASSE.NU_IDNTR_PRTCE_ADMDO is
 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB555_VNCLO_PRCLA_REPASSE.NU_UNICO_CONTRATO_RGSDA
 is 'NU_UNICO_CONTRATO_REGISTRADORA';
--==============================================================
-- Index: GEC1I555
--==============================================================
create unique index GEC.GEC1I555 on GEC.GECTB555_VNCLO_PRCLA_REPASSE (
   NU_SEQUENCIAL_REPASSE ASC,
   NU_EVENTO_LIQUIDACAO_REPASSE ASC,
   NU_UNICO_PARCELA_REGISTRADORA ASC,
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_UNICO_CONTRATO_RGSDA ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I555
--==============================================================
create index GEC.GEC2I555 on GEC.GECTB555_VNCLO_PRCLA_REPASSE (
   NU_SEQUENCIAL_REPASSE ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I555
--==============================================================
create index GEC.GEC3I555 on GEC.GECTB555_VNCLO_PRCLA_REPASSE (
   NU_EVENTO_LIQUIDACAO_REPASSE ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC4I555
--==============================================================
create index GEC.GEC4I555 on GEC.GECTB555_VNCLO_PRCLA_REPASSE (
   NU_UNICO_PARCELA_REGISTRADORA ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB556_TED_REPASSE
--==============================================================
create table GEC.GECTB556_TED_REPASSE (
   CO_NUOP              CHAR(25)              
      not null,
   NU_PACOTE_RECEBIMENTO_REPASSE DECIMAL(18)           
      not null,
   constraint GECPK556 primary key (CO_NUOP, 
NU_PACOTE_RECEBIMENTO_REPASSE)
)
 in GECDB002.GECTS556;

--==============================================================
-- Index: GEC1I556
--==============================================================
create unique index GEC.GEC1I556 on GEC.GECTB556_TED_REPASSE (
   CO_NUOP              ASC,
   NU_PACOTE_RECEBIMENTO_REPASSE ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB557_AGRPR_PRCNO_SNTCO
--==============================================================
create table GEC.GECTB557_AGRPR_PRCNO_SNTCO (
   NU_AGRUPADOR_REPASSE DECIMAL(2)            
      not null
      generated ? as identity,
   DE_AGRUPADOR_REPASSE CHAR(50)              
      not null,
   constraint GECPK557 primary key (NU_AGRUPADOR_REPASSE)
)
 in GECDB002.GECTS557;

label on table GEC.GECTB557_AGRPR_PRCNO_SNTCO is 
'AGRUPADOR_RESULTADO_PROCESSAMENTO_SINTETICO';
label on column GEC.GECTB557_AGRPR_PRCNO_SNTCO.DE_AGRUPADOR_REPASSE is 
'DESCRICAO_AGRUPADOR_REPASSE';
--==============================================================
-- Index: GEC1I557
--==============================================================
create unique index GEC.GEC1I557 on GEC.GECTB557_AGRPR_PRCNO_SNTCO (
   NU_AGRUPADOR_REPASSE ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB558_CNTLE_RCBMO_ARQUIVO
--==============================================================
create table GEC.GECTB558_CNTLE_RCBMO_ARQUIVO (
   NU_ARQUIVO           DEC(18)               
      not null,
   QT_REGISTRO_TOTAL    SMALLINT              
      not null,
   QT_REGISTRO_RECEBIDO SMALLINT              
      not null,
   CO_CNTLE_DESTINATARIO_ORIGINAL CHAR(20)              
      not null,
   NO_ARQUIVO_RECEBIDO  VARCHAR(40)           
      not null,
   constraint GECPK558 primary key (NU_ARQUIVO)
)
 in GECDB002.GECTS558;

label on table GEC.GECTB558_CNTLE_RCBMO_ARQUIVO is 
'CONTROLE_RECEBIMENTO_ARQUIVO';
label on column 
GEC.GECTB558_CNTLE_RCBMO_ARQUIVO.CO_CNTLE_DESTINATARIO_ORIGINAL is 
'CO_CONTROLE_DESTINATARIO_ORIGINAL';
--==============================================================
-- Index: GEC1I558
--==============================================================
create unique index GEC.GEC1I558 on GEC.GECTB558_CNTLE_RCBMO_ARQUIVO (
   NU_ARQUIVO           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB559_PCTE_DVLCO_PARCELA
--==============================================================
create table GEC.GECTB559_PCTE_DVLCO_PARCELA (
   NU_SQNCL_PACOTE_DEVOLUCAO DECIMAL(18)           
      not null
      generated ? as identity,
   NU_IF                SMALLINT              
      not null,
   NU_PRODUTO           SMALLINT              
      not null,
   DT_SIMULACAO         DATE,
   DT_DEVOLUCAO         DATE,
   QT_PARCELA_DEVOLVER  DECIMAL(8),
   VR_SLDO_DEVEDOR_ATUALIZADO DECIMAL(19, 2),
   CO_NUOP              CHAR(25),
   NU_ARQUIVO_OFICIO    DECIMAL(8),
   constraint GECPK559 primary key (NU_SQNCL_PACOTE_DEVOLUCAO)
)
 in GECDB002.GECTS559;

label on table GEC.GECTB559_PCTE_DVLCO_PARCELA is 
'PACOTE_DEVOLUCAO_PARCELA';
label on column 
GEC.GECTB559_PCTE_DVLCO_PARCELA.NU_SQNCL_PACOTE_DEVOLUCAO is 
'NU_SEQUENCIAL_PACOTE_DEVOLUCAO';
label on column GEC.GECTB559_PCTE_DVLCO_PARCELA.NU_ARQUIVO_OFICIO is 
'NU_SEQUENCIAL_ARQUIVO_OFICIO';
--==============================================================
-- Index: GEC1I559
--==============================================================
create unique index GEC.GEC1I559 on GEC.GECTB559_PCTE_DVLCO_PARCELA (
   NU_SQNCL_PACOTE_DEVOLUCAO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I559
--==============================================================
create index GEC.GEC2I559 on GEC.GECTB559_PCTE_DVLCO_PARCELA (
   CO_NUOP              ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I559
--==============================================================
create index GEC.GEC3I559 on GEC.GECTB559_PCTE_DVLCO_PARCELA (
   NU_PRODUTO           ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC4I559
--==============================================================
create index GEC.GEC4I559 on GEC.GECTB559_PCTE_DVLCO_PARCELA (
   NU_IF                ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC5I559
--==============================================================
create index GEC.GEC5I559 on GEC.GECTB559_PCTE_DVLCO_PARCELA (
   NU_ARQUIVO_OFICIO    ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB560_ARQVO_PRCLA_CMPLR
--==============================================================
create table GEC.GECTB560_ARQVO_PRCLA_CMPLR (
   NU_SQNCL_ARQVO_PARCELA_CMPLR DECIMAL(18)           
      not null
      generated ? as identity,
   NU_PRODUTO           SMALLINT              
      not null,
   NO_ARQVO_PARCELA_CMPLR VARCHAR(100),
   NU_IF                SMALLINT              
      not null,
   NU_PACOTE_RECEBIMENTO_REPASSE DECIMAL(18),
   DT_RECEBIMENTO       DATE,
   VR_TOTAL_RECEBIDO    DECIMAL(19, 2),
   VR_TOTAL_REPASSADO   DECIMAL(19, 2),
   IC_TIPO_PRODUTO      CHAR(1)               
         constraint GEC1C560 check (IC_TIPO_PRODUTO is null or 
(IC_TIPO_PRODUTO in ('1','X'))),
   QT_REGISTRO_ARQUIVO  DECIMAL(9),
   IC_STCO_PROCESSAMENTO_ARQUIVO DECIMAL(3)            
      not null default 1
         constraint GEC2C560 check (IC_STCO_PROCESSAMENTO_ARQUIVO in (1,
2,3)),
   TS_INICIO_PROCESSAMENTO TIMESTAMP,
   TS_FIM_PROCESSAMENTO TIMESTAMP,
   constraint GECPK560 primary key (NU_SQNCL_ARQVO_PARCELA_CMPLR)
)
 in GECDB002.GECTS560;

label on table GEC.GECTB560_ARQVO_PRCLA_CMPLR is 
'ARQUIVO_PARCELA_COMPLEMENTAR';
label on column 
GEC.GECTB560_ARQVO_PRCLA_CMPLR.NU_SQNCL_ARQVO_PARCELA_CMPLR is 
'NU_SEQUENCIAL_ARQUIVO_PARCELA_COMPLEMENTAR';
label on column 
GEC.GECTB560_ARQVO_PRCLA_CMPLR.IC_STCO_PROCESSAMENTO_ARQUIVO is 
'IC_SITUACAO_PROCESSAMENTO_ARQUIVO';
--==============================================================
-- Index: GEC1I560
--==============================================================
create unique index GEC.GEC1I560 on GEC.GECTB560_ARQVO_PRCLA_CMPLR (
   NU_SQNCL_ARQVO_PARCELA_CMPLR ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I560
--==============================================================
create index GEC.GEC2I560 on GEC.GECTB560_ARQVO_PRCLA_CMPLR (
   NU_IF                ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I560
--==============================================================
create index GEC.GEC3I560 on GEC.GECTB560_ARQVO_PRCLA_CMPLR (
   NU_PRODUTO           ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB561_PARCELA_COMPLEMENTAR
--==============================================================
create table GEC.GECTB561_PARCELA_COMPLEMENTAR (
   NU_PARCELA_COMPLEMENTAR DECIMAL(18)           
      not null
      generated ? as identity,
   NU_PARCELA_CREDITO   DECIMAL(18, 0),
   NU_SQNCL_ARQVO_PARCELA_CMPLR DECIMAL(18)           
      not null,
   NU_SQNCL_PACOTE_DEVOLUCAO DECIMAL(18),
   NU_OFCO_LQDCO_ANTECIPADA DECIMAL(8),
   NU_TRANCHE_ARQUIVO   DECIMAL(5),
   PC_TAXA_CESSAO       DECIMAL(13,8)          with default 0,
   NU_CONTRATO          CHAR(30),
   DT_PAGAMENTO_CLIENTE DATE,
   VR_RECEBIMENTO_CLIENTE DECIMAL(16, 2),
   QT_DIA_UTIL_VENCIMENTO_PGMNO SMALLINT,
   VR_PRESENTE_CESSAO   DECIMAL(19, 2),
   VR_DIFERENCA_CALCULADA DECIMAL(19, 2),
   IN_DI_DATA_PAGAMENTO DECIMAL(13, 9),
   IN_DI_DATA_REPASSE   DECIMAL(13, 9),
   VR_LIQUIDO_A_PAGAR   DECIMAL(12, 2),
   DT_PGMNO_PARCELA_COMPLEMENTAR DATE,
   VR_DIFERENCA_ESPERADO_RCBDO DECIMAL(10, 2),
   IC_SITUACAO_PROCESSAMENTO DECIMAL(2)            
         constraint GEC1C561 check (IC_SITUACAO_PROCESSAMENTO is null or
 (IC_SITUACAO_PROCESSAMENTO in (1,2,3,4))),
   IC_SITUACAO_APROPRIACAO CHAR(1)               
         constraint GEC2C561 check (IC_SITUACAO_APROPRIACAO is null or 
(IC_SITUACAO_APROPRIACAO in ('1','2','3','4'))),
   NU_AGRUPADOR_REPASSE DECIMAL(2),
   DT_VENCIMENTO_PARCELA_CMPLR DATE,
   VR_PRESTACAO         DECIMAL(19,2),
   constraint GECPK561 primary key (NU_PARCELA_COMPLEMENTAR)
)
 in GECDB002.GECTS561;

label on table GEC.GECTB561_PARCELA_COMPLEMENTAR is 
'PARCELA COMPLEMENTAR';
label on column 
GEC.GECTB561_PARCELA_COMPLEMENTAR.NU_SQNCL_ARQVO_PARCELA_CMPLR is 
'NU_SEQUENCIAL_ARQUIVO_PARCELA_COMPLEMENTAR';
label on column 
GEC.GECTB561_PARCELA_COMPLEMENTAR.NU_OFCO_LQDCO_ANTECIPADA is 
'NU_SEQUENCIAL_OFICIO_LIQUIDACAO_ANTECIPADA';
label on column 
GEC.GECTB561_PARCELA_COMPLEMENTAR.DT_PGMNO_PARCELA_COMPLEMENTAR is 
'DT_PAGAMENTO_PARCELA_COMPLEMENTAR';
label on column 
GEC.GECTB561_PARCELA_COMPLEMENTAR.VR_DIFERENCA_ESPERADO_RCBDO is 
'VR_DIFERENCA_ESPERADO_RECEBIDO';
label on column 
GEC.GECTB561_PARCELA_COMPLEMENTAR.DT_VENCIMENTO_PARCELA_CMPLR is 
'DT_VENCIMENTO_PACELA_COMPLEMENTAR';
--==============================================================
-- Index: GEC1I561
--==============================================================
create unique index GEC.GEC1I561 on GEC.GECTB561_PARCELA_COMPLEMENTAR (

   NU_PARCELA_COMPLEMENTAR ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I561
--==============================================================
create index GEC.GEC2I561 on GEC.GECTB561_PARCELA_COMPLEMENTAR (
   NU_PARCELA_CREDITO   ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I561
--==============================================================
create index GEC.GEC3I561 on GEC.GECTB561_PARCELA_COMPLEMENTAR (
   NU_SQNCL_ARQVO_PARCELA_CMPLR ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB562_PCTE_RCBMO_REPASSE
--==============================================================
create table GEC.GECTB562_PCTE_RCBMO_REPASSE (
   NU_PACOTE_RECEBIMENTO_REPASSE DECIMAL(18)           
      not null
      generated ? as identity,
   QT_REGISTRO_PACOTE   DECIMAL(8)             with default 0,
   VR_TOTAL_RECEBIMENTO_PACOTE DECIMAL(19, 2),
   VR_TOTAL_REPASSADO_PACOTE DECIMAL(19, 2),
   TS_INCLUSAO_PACOTE   TIMESTAMP             
      not null,
   TS_INICIO_PROCESSAMENTO TIMESTAMP,
   TS_FIM_PROCESSAMENTO TIMESTAMP,
   constraint GECPK562 primary key (NU_PACOTE_RECEBIMENTO_REPASSE)
)
 in GECDB002.GECTS562;

label on table GEC.GECTB562_PCTE_RCBMO_REPASSE is 
'PACOTE_RECEBIMENTO_REPASSE';

--==============================================================
-- Index: GEC1I562
--==============================================================
create unique index GEC.GEC1I562 on GEC.GECTB562_PCTE_RCBMO_REPASSE (
   NU_PACOTE_RECEBIMENTO_REPASSE ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB563_PCTE_RCBMO_CMPLR
--==============================================================
create table GEC.GECTB563_PCTE_RCBMO_CMPLR (
   NU_PCTE_RCBMO_PRCLA_CMPLR DECIMAL(18)           
      not null
      generated ? as identity,
   QT_REGISTRO_PACOTE   DECIMAL(8)             with default 0,
   VR_TOTAL_RECEBIMENTO_PACOTE DECIMAL(19, 2),
   TS_INCLUSAO_PACOTE   TIMESTAMP             
      not null,
   TS_INICIO_PROCESSAMENTO TIMESTAMP,
   TS_FIM_PROCESSAMENTO TIMESTAMP,
   constraint GECPK563 primary key (NU_PCTE_RCBMO_PRCLA_CMPLR)
)
 in GECDB002.GECTS563;

label on table GEC.GECTB563_PCTE_RCBMO_CMPLR is 
'PACOTE_RECEBIMENTO_PARCELA_COMPLEMENTAR';
label on column GEC.GECTB563_PCTE_RCBMO_CMPLR.NU_PCTE_RCBMO_PRCLA_CMPLR 
is 'NU_PACOTE_RECEBIMENTO_PARCELA_COMPLEMENTAR';
--==============================================================
-- Index: GEC1I563
--==============================================================
create unique index GEC.GEC1I563 on GEC.GECTB563_PCTE_RCBMO_CMPLR (
   NU_PCTE_RCBMO_PRCLA_CMPLR ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB564_TED_PARCELA_CMPLR
--==============================================================
create table GEC.GECTB564_TED_PARCELA_CMPLR (
   CO_NUOP              CHAR(25)              
      not null,
   NU_PCTE_RCBMO_PRCLA_CMPLR DECIMAL(18)           
      not null,
   constraint GECPK564 primary key (CO_NUOP, NU_PCTE_RCBMO_PRCLA_CMPLR)

)
 in GECDB002.GECTS564;

label on table GEC.GECTB564_TED_PARCELA_CMPLR is 
'TED PARCELA COMPLEMENTAR';
label on column GEC.GECTB564_TED_PARCELA_CMPLR.NU_PCTE_RCBMO_PRCLA_CMPLR
 is 'NU_PACOTE_RECEBIMENTO_PARCELA_COMPLEMENTAR';
--==============================================================
-- Index: GEC1I564
--==============================================================
create unique index GEC.GEC1I564 on GEC.GECTB564_TED_PARCELA_CMPLR (
   CO_NUOP              ASC,
   NU_PCTE_RCBMO_PRCLA_CMPLR ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I564
--==============================================================
create index GEC.GEC2I564 on GEC.GECTB564_TED_PARCELA_CMPLR (
   NU_PCTE_RCBMO_PRCLA_CMPLR ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 5 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB565_VNCCO_CIT_PRODUTO_IF
--==============================================================
create table GEC.GECTB565_VNCCO_CIT_PRODUTO_IF (
   NU_SQNCL_VINCULO     DECIMAL(19, 0)        
      not null
      generated ? as identity,
   NU_IF                SMALLINT              
      not null,
   NU_PRODUTO           SMALLINT              
      not null,
   CO_CIT_RECEBIMENTO   CHAR(25)              
      not null,
   CO_CIT_PAGAMENTO     CHAR(25)              
      not null,
   NU_CONTA_GRAFICA     SMALLINT,
   TS_INCLUSAO          TIMESTAMP             
      not null,
   NU_MATRICULA_INCLUSAO INTEGER               
      not null,
   CO_IP_ESTACAO_INCLUSAO CHAR(20)              
      not null,
   TS_ALTERACAO         TIMESTAMP,
   NU_MATRICULA_ALTERACAO INTEGER,
   CO_IP_ESTACAO_ALTERACAO CHAR(20),
   constraint GECPK565 primary key (NU_SQNCL_VINCULO)
)
 in GECDB002.GECTS565;

label on table GEC.GECTB565_VNCCO_CIT_PRODUTO_IF is 
'VINCULACAO CIT PRODUTO IF';
label on column GEC.GECTB565_VNCCO_CIT_PRODUTO_IF.NU_SQNCL_VINCULO is 
'NU_SEQUENCIAL_VINCULO';
--==============================================================
-- Index: GEC1I565
--==============================================================
create unique index GEC.GEC1I565 on GEC.GECTB565_VNCCO_CIT_PRODUTO_IF (

   NU_SQNCL_VINCULO     ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I565
--==============================================================
create unique index GEC.GEC2I565 on GEC.GECTB565_VNCCO_CIT_PRODUTO_IF (

   NU_IF                ASC,
   NU_PRODUTO           ASC,
   CO_CIT_RECEBIMENTO   ASC,
   CO_CIT_PAGAMENTO     ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB566_PREVISAO_RECEBIMENTO
--==============================================================
create table GEC.GECTB566_PREVISAO_RECEBIMENTO (
   NU_SQNCL_PREVISAO    DECIMAL(19, 0)        
      not null
      generated ? as identity,
   NU_IF                SMALLINT              
      not null,
   NU_PRODUTO           SMALLINT              
      not null,
   DT_PREVISAO          DATE                  
      not null,
   IC_TIPO_PREVISAO     DECIMAL(01)           
      not null
         constraint GEC1C566 check (IC_TIPO_PREVISAO in (1,2,3)),
   NU_TRANCHE           DECIMAL(8),
   VR_PREVISAO          DECIMAL(18,2)         
      not null,
   TS_INCLUSAO          TIMESTAMP             
      not null,
   constraint GECPK566 primary key (NU_SQNCL_PREVISAO)
)
 in GECDB002.GECTS566;

label on table GEC.GECTB566_PREVISAO_RECEBIMENTO is 
'PREVISAO RECEBIMENTO';

--==============================================================
-- Index: GEC1I566
--==============================================================
create unique index GEC.GEC1I566 on GEC.GECTB566_PREVISAO_RECEBIMENTO (

   NU_SQNCL_PREVISAO    ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I566
--==============================================================
create unique index GEC.GEC2I566 on GEC.GECTB566_PREVISAO_RECEBIMENTO (

   NU_IF                ASC,
   NU_PRODUTO           ASC,
   DT_PREVISAO          ASC,
   IC_TIPO_PREVISAO     ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB567_RESERVA
--==============================================================
create table GEC.GECTB567_RESERVA (
   NU_SEQUENCIAL_RESERVA INTEGER               
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8, 0)         
      not null,
   NU_SITUACAO_RESERVA  SMALLINT              
      not null,
   CO_CONTROLE_RESERVA_IF CHAR(40),
   CO_IDENTIFICADOR_RESERVA CHAR(10),
   CO_RESERVA_UNICO_C3  CHAR(21),
   NU_CNPJ_BASE_CEDENTE DEC(8)                
      not null,
   NU_CNPJ_BASE_CESSIONARIO DEC(8)                
      not null,
   DT_OPERACAO_RESERVA  DATE,
   IC_TROCA_GESTAO      CHAR(1)               
         constraint GEC1C567 check (IC_TROCA_GESTAO is null or 
(IC_TROCA_GESTAO in ('S','N'))),
   IC_RESERVA_ATIVA     CHAR(1)               
      not null
         constraint GEC2C567 check (IC_RESERVA_ATIVA in ('1','2')),
   CO_UNICO_CESSAO_C3   CHAR(21),
   NU_SITUACAO_EVENTO   SMALLINT,
   NU_TIPO_DIVERGENTE   SMALLINT,
   constraint GECPK567 primary key (NU_SEQUENCIAL_RESERVA)
)
 in GECDB002.GECTS567;

label on table GEC.GECTB567_RESERVA is 'RESERVA';
label on column GEC.GECTB567_RESERVA.CO_CONTROLE_RESERVA_IF is 
'CO_CONTROLE_RESERVA_INSTITUICAO_FINANCEIRA';
--==============================================================
-- Index: GEC1I567
--==============================================================
create unique index GEC.GEC1I567 on GEC.GECTB567_RESERVA (
   NU_SEQUENCIAL_RESERVA ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I567
--==============================================================
create index GEC.GEC2I567 on GEC.GECTB567_RESERVA (
   CO_RESERVA_UNICO_C3  ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB568_ARQUIVO_C3
--==============================================================
create table GEC.GECTB568_ARQUIVO_C3 (
   NU_ARQUIVO           DEC(18)               
      not null
      generated 1 as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 999999999999999999
       minvalue 1
      ),
   NO_ARQUIVO           CHAR(50),
   IC_SISTEMA_ORIGEM    CHAR(1)               
      not null
         constraint GEC1C568 check (IC_SISTEMA_ORIGEM in ('1','2')),
   IC_SISTEMA_DESTINO   CHAR(1)               
      not null
         constraint GEC2C568 check (IC_SISTEMA_DESTINO in ('1','2')),
   CO_TIPO_ARQUIVO      CHAR(10)              
      not null,
   NU_SEQUENCIAL_SOLICITACAO DEC(18),
   TS_MOVIMENTO_ARQUIVO TIMESTAMP             
      not null with default,
   TS_PROCESSAMENTO_ARQUIVO TIMESTAMP             
      not null with default,
   NU_ARQUIVO_REFERENCIA DEC(18),
   NU_SITUACAO_ARQUIVO  SMALLINT               with default 5,
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(8),
   QT_TOTAL_REGISTRO_PCSDO_ARQVO INTEGER,
   DE_PROCESSAMENTO_ARQUIVO VARCHAR(200),
   constraint GECPK568 primary key (NU_ARQUIVO)
)
 in GECDB002.GECTS568;

label on table GEC.GECTB568_ARQUIVO_C3 is 'ARQUIVO_C3';
label on column GEC.GECTB568_ARQUIVO_C3.QT_TOTAL_REGISTRO_PCSDO_ARQVO is
 'QT_TOTAL_REGISTRO_PROCESSADO_ARQUIVO';
--==============================================================
-- Index: GEC1I568
--==============================================================
create unique index GEC.GEC1I568 on GEC.GECTB568_ARQUIVO_C3 (
   NU_ARQUIVO           ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB569_CONTRATO_RESERVA
--==============================================================
create table GEC.GECTB569_CONTRATO_RESERVA (
   NU_SEQUENCIAL_VINCULACAO DEC(18)               
      not null
      generated ? as identity,
   NU_SEQUENCIAL_RESERVA INTEGER               
      not null,
   NU_CREDITO           DECIMAL(19, 0)        
      not null,
   IC_EXCLUIDO          CHAR(1)               
      not null
         constraint GEC1C569 check (IC_EXCLUIDO in ('S','N')),
   constraint GECPK569 primary key (NU_SEQUENCIAL_VINCULACAO)
)
 in GECDB002.GECTS569;

label on table GEC.GECTB569_CONTRATO_RESERVA is 'CONTRATO_RESERVA';

--==============================================================
-- Index: GEC1I569
--==============================================================
create unique index GEC.GEC1I569 on GEC.GECTB569_CONTRATO_RESERVA (
   NU_SEQUENCIAL_VINCULACAO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 132480
    secqty 13680
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I569
--==============================================================
create unique index GEC.GEC2I569 on GEC.GECTB569_CONTRATO_RESERVA (
   NU_SEQUENCIAL_RESERVA ASC,
   NU_CREDITO           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 132480
    secqty 13680
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I569
--==============================================================
create index GEC.GEC3I569 on GEC.GECTB569_CONTRATO_RESERVA (
   NU_CREDITO           ASC,
   IC_EXCLUIDO          ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 132480
    secqty 13680
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB570_TIPO_ARQUIVO_C3
--==============================================================
create table GEC.GECTB570_TIPO_ARQUIVO_C3 (
   CO_TIPO_ARQUIVO      CHAR(10)              
      not null,
   DE_TIPO_ARQUIVO      VARCHAR(500)          
      not null,
   IC_FUNCAO_ARQUIVO    CHAR(1)               
      not null
         constraint GEC1C570 check (IC_FUNCAO_ARQUIVO in ('1','2','3',
'4')),
   constraint GECPK570 primary key (CO_TIPO_ARQUIVO)
)
 in GECDB002.GECTS570;

label on table GEC.GECTB570_TIPO_ARQUIVO_C3 is 'TIPO_ARQUIVO_C3';

--==============================================================
-- Index: GEC1I570
--==============================================================
create unique index GEC.GEC1I570 on GEC.GECTB570_TIPO_ARQUIVO_C3 (
   CO_TIPO_ARQUIVO      ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB571_CONTRATO_ARQUIVO
--==============================================================
create table GEC.GECTB571_CONTRATO_ARQUIVO (
   NU_ARQUIVO           DEC(18)               
      not null,
   NU_SEQUENCIAL_RESERVA INTEGER               
      not null,
   NU_CREDITO           DECIMAL(19)           
      not null,
   IC_SITUACAO_CREDITO  DECIMAL(2)            
      not null with default 1
         constraint GEC1C571 check (IC_SITUACAO_CREDITO in (1,2,3)),
   constraint GECPK571 primary key (NU_CREDITO, NU_SEQUENCIAL_RESERVA, 
NU_ARQUIVO)
)
 in GECDB002.GECTS571;

label on table GEC.GECTB571_CONTRATO_ARQUIVO is 'CONTRATO_ARQUIVO';

--==============================================================
-- Index: GEC1I571
--==============================================================
create unique index GEC.GEC1I571 on GEC.GECTB571_CONTRATO_ARQUIVO (
   NU_CREDITO           ASC,
   NU_SEQUENCIAL_RESERVA ASC,
   NU_ARQUIVO           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB572_SITUACAO_RESERVA
--==============================================================
create table GEC.GECTB572_SITUACAO_RESERVA (
   NU_SITUACAO_RESERVA  SMALLINT              
      not null,
   DE_SITUACAO_RESERVA  VARCHAR(500)          
      not null,
   constraint GECPK572 primary key (NU_SITUACAO_RESERVA)
)
 in GECDB002.GECTS572;

label on table GEC.GECTB572_SITUACAO_RESERVA is 'SITUACAO_RESERVA';

--==============================================================
-- Index: GEC1I572
--==============================================================
create unique index GEC.GEC1I572 on GEC.GECTB572_SITUACAO_RESERVA (
   NU_SITUACAO_RESERVA  ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB573_TIPO_TABELA_VEICULO
--==============================================================
create table GEC.GECTB573_TIPO_TABELA_VEICULO (
   CO_TIPO_TABELA_VEICULO CHAR(1)               
      not null,
   DE_TIPO_TABELA_VEICULO VARCHAR(500)          
      not null,
   constraint GECPK573 primary key (CO_TIPO_TABELA_VEICULO)
)
 in GECDB002.GECTS573;

label on table GEC.GECTB573_TIPO_TABELA_VEICULO is 'TIPO_TABELA_VEICULO'
;

--==============================================================
-- Index: GEC1I573
--==============================================================
create unique index GEC.GEC1I573 on GEC.GECTB573_TIPO_TABELA_VEICULO (
   CO_TIPO_TABELA_VEICULO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB574_ERRO_C3
--==============================================================
create table GEC.GECTB574_ERRO_C3 (
   CO_ERRO_C3           CHAR(8)               
      not null,
   DE_ERRO_C3           VARCHAR(500)          
      not null,
   constraint GECPK574 primary key (CO_ERRO_C3)
)
 in GECDB002.GECTS574;

label on table GEC.GECTB574_ERRO_C3 is 'ERRO_C3';

--==============================================================
-- Index: GEC1I574
--==============================================================
create unique index GEC.GEC1I574 on GEC.GECTB574_ERRO_C3 (
   CO_ERRO_C3           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB575_ARQUIVO_PROTOCOLO
--==============================================================
create table GEC.GECTB575_ARQUIVO_PROTOCOLO (
   NU_ARQUIVO           DEC(18)               
      not null,
   NU_SITUACAO_REQUISICAO SMALLINT              
      not null,
   DT_REFERENCIA        DATE                  
      not null,
   NU_ISPB_EMISSOR      INTEGER               
      not null,
   NU_ISPB_DESTINATARIO INTEGER               
      not null,
   CO_CONTROLE_EMISSOR  CHAR(20)              
      not null,
   CO_CNTLE_DESTINATARIO_ORIGINAL CHAR(20)              
      not null,
   constraint GECPK575 primary key (NU_ARQUIVO)
)
 in GECDB002.GECTS575;

label on table GEC.GECTB575_ARQUIVO_PROTOCOLO is 'ARQUIVO_PROTOCOLO';
label on column 
GEC.GECTB575_ARQUIVO_PROTOCOLO.CO_CNTLE_DESTINATARIO_ORIGINAL is 
'CO_CONTROLE_DESTINATARIO_ORIGINAL';
--==============================================================
-- Index: GEC1I575
--==============================================================
create unique index GEC.GEC1I575 on GEC.GECTB575_ARQUIVO_PROTOCOLO (
   NU_ARQUIVO           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB576_ARQUIVO_ERRO
--==============================================================
create table GEC.GECTB576_ARQUIVO_ERRO (
   NU_ARQUIVO           DEC(18)               
      not null,
   NU_SEQUENCIAL_ERRO   SMALLINT              
      not null,
   CO_ERRO_C3           CHAR(8)               
      not null,
   constraint GECPK576 primary key (NU_ARQUIVO, NU_SEQUENCIAL_ERRO)
)
 in GECDB002.GECTS576;

label on table GEC.GECTB576_ARQUIVO_ERRO is 'ARQUIVO_ERRO';

--==============================================================
-- Index: GEC1I576
--==============================================================
create unique index GEC.GEC1I576 on GEC.GECTB576_ARQUIVO_ERRO (
   NU_ARQUIVO           ASC,
   NU_SEQUENCIAL_ERRO   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB577_GARANTIA_C3
--==============================================================
create table GEC.GECTB577_GARANTIA_C3 (
   NU_CREDITO           DECIMAL(19, 0)        
      not null,
   TS_CADASTRO_GARANTIA TIMESTAMP             
      not null,
   IC_ORIGEM_GARANTIA   CHAR(1)               
      not null
         constraint GEC1C577 check (IC_ORIGEM_GARANTIA in ('1','2')),
   DT_CONTRATACAO       DATE                  
      not null,
   VR_FINANCIADO        DEC(19, 2)            
      not null,
   QT_PARCELA_ORIGINAL  INTEGER               
      not null,
   NU_CNPJ_BASE_CONSIGNANTE DEC(8)                
      not null,
   NU_SEQUENCIAL_RESERVA INTEGER               
      not null,
   NU_ARQUIVO           DEC(18)               
      not null,
   CO_STCO_GRNTA_AGENTE_VALIDADOR CHAR(13),
   CO_SITUACAO_CONTRATO_GARANTIA CHAR(1),
   NU_CNPJ_BASE_AGENTE_VALIDADOR DEC(8),
   CO_GARANTIA_C3       CHAR(21),
   constraint GECPK577 primary key (NU_CREDITO)
)
 in GECDB002.GECTS577;

label on table GEC.GECTB577_GARANTIA_C3 is 'GARANTIA_C3';
label on column GEC.GECTB577_GARANTIA_C3.CO_STCO_GRNTA_AGENTE_VALIDADOR 
is 'CO_SITUACAO_GARANTIA_AGENTE_VALIDADOR';
--==============================================================
-- Index: GEC1I577
--==============================================================
create unique index GEC.GEC1I577 on GEC.GECTB577_GARANTIA_C3 (
   NU_CREDITO           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB578_HISTORICO_GARANTIA_C3
--==============================================================
create table GEC.GECTB578_HISTORICO_GARANTIA_C3 (
   NU_CREDITO           DECIMAL(19, 0)        
      not null,
   TS_HISTORICO         TIMESTAMP             
      not null,
   TS_CADASTRO_GARANTIA TIMESTAMP             
      not null,
   IC_ORIGEM_GARANTIA   CHAR(1)               
      not null
         constraint GEC1C578 check (IC_ORIGEM_GARANTIA in ('1','2')),
   DT_CONTRATACAO       DATE,
   VR_FINANCIADO        DEC(19, 2),
   QT_PARCELA_ORIGINAL  INTEGER,
   NU_CNPJ_BASE_CONSIGNANTE DEC(8),
   CO_STCO_GRNTA_AGENTE_VALIDADOR CHAR(13),
   CO_SITUACAO_CONTRATO_GARANTIA CHAR(1),
   NU_SEQUENCIAL_RESERVA INTEGER,
   NU_ARQUIVO           DEC(18),
   NU_CNPJ_BASE_AGENTE_VALIDADOR DEC(8),
   CO_GARANTIA_C3       CHAR(21),
   CO_IDENTIFICADOR_CHASSI CHAR(17),
   NU_SITUACAO_VALIDACAO_PARCELA SMALLINT,
   NU_ANO_MODELO_VEICULO SMALLINT,
   NU_CNPJ_BASE_BNFRO_CRIVO DEC(8),
   CO_TIPO_TABELA_VEICULO CHAR(1),
   DE_VEICULO           CHAR(80),
   CO_CONTRATO_ENTE_CONSIGNANTE CHAR(20),
   NU_BENEFICIO_ENTE_CONSIGNANTE DEC(10),
   NU_MATRICULA_ENTE_CONSIGNANTE CHAR(20),
   NU_ANO_MES_CMTCA_PRMRO_DSCNO DEC(6),
   NU_STCO_MNSLDE_RECUPERACAO SMALLINT,
   constraint GECPK578 primary key (NU_CREDITO, TS_HISTORICO)
)
 in GECDB002.GECTS578;

label on table GEC.GECTB578_HISTORICO_GARANTIA_C3 is 
'HISTORICO_GARANTIA_C3';
label on column 
GEC.GECTB578_HISTORICO_GARANTIA_C3.CO_STCO_GRNTA_AGENTE_VALIDADOR is 
'CO_SITUACAO_GARANTIA_AGENTE_VALIDADOR';
label on column 
GEC.GECTB578_HISTORICO_GARANTIA_C3.NU_CNPJ_BASE_BNFRO_CRIVO is 
'NU_CNPJ_BASE_BENEFICIARIO_CRIVO';
label on column 
GEC.GECTB578_HISTORICO_GARANTIA_C3.NU_ANO_MES_CMTCA_PRMRO_DSCNO is 
'NU_ANO_MES_COMPETENCIA_PRIMEIRO_DESCONTO';
label on column 
GEC.GECTB578_HISTORICO_GARANTIA_C3.NU_STCO_MNSLDE_RECUPERACAO is 
'NU_SITUACAO_MENSALIDADE_RECUPERACAO';
--==============================================================
-- Index: GEC1I578
--==============================================================
create unique index GEC.GEC1I578 on GEC.GECTB578_HISTORICO_GARANTIA_C3 (

   NU_CREDITO           ASC,
   TS_HISTORICO         ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB579_PRMTO_GERACAO_ARQUIVO
--==============================================================
create table GEC.GECTB579_PRMTO_GERACAO_ARQUIVO (
   NU_SEQUENCIAL_PARAMETRO INTEGER               
      not null
      generated ? as identity,
   NO_PARAMETRO         CHAR(30)              
      not null,
   TS_CADASTRO          TIMESTAMP             
      not null,
   constraint GECPK579 primary key (NU_SEQUENCIAL_PARAMETRO)
)
 in GECDB002.GECTS579;

label on table GEC.GECTB579_PRMTO_GERACAO_ARQUIVO is 
'GECTB579_PARAMETRO_GERACAO_ARQUIVO';

--==============================================================
-- Index: GEC1I579
--==============================================================
create unique index GEC.GEC1I579 on GEC.GECTB579_PRMTO_GERACAO_ARQUIVO (

   NU_SEQUENCIAL_PARAMETRO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB580_STCO_VLDCO_PARCELA
--==============================================================
create table GEC.GECTB580_STCO_VLDCO_PARCELA (
   NU_SITUACAO_VALIDACAO_PARCELA SMALLINT              
      not null,
   DE_SITUACAO_VALIDACAO_PARCELA VARCHAR(500)          
      not null,
   constraint GECPK580 primary key (NU_SITUACAO_VALIDACAO_PARCELA)
)
 in GECDB002.GECTS580;

label on table GEC.GECTB580_STCO_VLDCO_PARCELA is 
'SITUACAO_VALIDACAO_PARCELA';

--==============================================================
-- Index: GEC1I580
--==============================================================
create unique index GEC.GEC1I580 on GEC.GECTB580_STCO_VLDCO_PARCELA (
   NU_SITUACAO_VALIDACAO_PARCELA ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB581_STCO_MNSDE_RCPAO
--==============================================================
create table GEC.GECTB581_STCO_MNSDE_RCPAO (
   NU_STCO_MNSLDE_RECUPERACAO SMALLINT              
      not null,
   DE_STCO_MNSLDE_RECUPERACAO VARCHAR(500)          
      not null,
   constraint GECPK581 primary key (NU_STCO_MNSLDE_RECUPERACAO)
)
 in GECDB002.GECTS581;

label on table GEC.GECTB581_STCO_MNSDE_RCPAO is 
'SITUACAO_MENSALIDADE_RECUPERACAO';
label on column GEC.GECTB581_STCO_MNSDE_RCPAO.NU_STCO_MNSLDE_RECUPERACAO
 is 'NU_SITUACAO_MENSALIDADE_RECUPERACAO';
--==============================================================
-- Index: GEC1I581
--==============================================================
create unique index GEC.GEC1I581 on GEC.GECTB581_STCO_MNSDE_RCPAO (
   NU_STCO_MNSLDE_RECUPERACAO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB582_STCO_GARANTIA_VLDDR
--==============================================================
create table GEC.GECTB582_STCO_GARANTIA_VLDDR (
   CO_STCO_GRNTA_AGENTE_VALIDADOR CHAR(13)              
      not null,
   DE_STCO_GRNTA_AGENTE_VALIDADOR VARCHAR(500)          
      not null,
   constraint GECPK582 primary key (CO_STCO_GRNTA_AGENTE_VALIDADOR)
)
 in GECDB002.GECTS582;

label on table GEC.GECTB582_STCO_GARANTIA_VLDDR is 
'SITUACAO_GARANTIA_VALIDADOR';
label on column 
GEC.GECTB582_STCO_GARANTIA_VLDDR.CO_STCO_GRNTA_AGENTE_VALIDADOR is 
'CO_SITUACAO_GARANTIA_AGENTE_VALIDADOR';
label on column 
GEC.GECTB582_STCO_GARANTIA_VLDDR.DE_STCO_GRNTA_AGENTE_VALIDADOR is 
'DE_SITUACAO_GARANTIA_AGENTE_VALIDADOR';
--==============================================================
-- Index: GEC1I582
--==============================================================
create unique index GEC.GEC1I582 on GEC.GECTB582_STCO_GARANTIA_VLDDR (
   CO_STCO_GRNTA_AGENTE_VALIDADOR ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB583_ARQUIVO_RESERVA
--==============================================================
create table GEC.GECTB583_ARQUIVO_RESERVA (
   NU_SEQUENCIAL_ARQUIVO_RESERVA DEC(18)               
      not null
      generated ? as identity,
   NU_SEQUENCIAL_RESERVA INTEGER               
      not null,
   NU_ARQUIVO           DEC(18)               
      not null,
   constraint GECPK583 primary key (NU_SEQUENCIAL_ARQUIVO_RESERVA)
)
 in GECDB002.GECTS583;

label on table GEC.GECTB583_ARQUIVO_RESERVA is 'ARQUIVO_RESERVA';

--==============================================================
-- Index: GEC1I583
--==============================================================
create unique index GEC.GEC1I583 on GEC.GECTB583_ARQUIVO_RESERVA (
   NU_SEQUENCIAL_ARQUIVO_RESERVA ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I583
--==============================================================
create index GEC.GEC2I583 on GEC.GECTB583_ARQUIVO_RESERVA (
   NU_ARQUIVO           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I583
--==============================================================
create unique index GEC.GEC3I583 on GEC.GECTB583_ARQUIVO_RESERVA (
   NU_SEQUENCIAL_RESERVA ASC,
   NU_ARQUIVO           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB584_ERRO_ENCONTRADO
--==============================================================
create table GEC.GECTB584_ERRO_ENCONTRADO (
   NU_ARQUIVO           DEC(18)               
      not null,
   NU_SEQUENCIAL_ERRO   INTEGER               
      not null,
   CO_ERRO_C3           CHAR(8)               
      not null,
   IC_TIPO_ERRO         CHAR(1)               
      not null
         constraint GEC1C584 check (IC_TIPO_ERRO in ('1','2','3','4','5'
,'6','7')),
   constraint GECPK584 primary key (NU_ARQUIVO, NU_SEQUENCIAL_ERRO)
)
 in GECDB002.GECTS584;

label on table GEC.GECTB584_ERRO_ENCONTRADO is 'ERRO_ENCONTRADO';

--==============================================================
-- Index: GEC1I584
--==============================================================
create unique index GEC.GEC1I584 on GEC.GECTB584_ERRO_ENCONTRADO (
   NU_ARQUIVO           ASC,
   NU_SEQUENCIAL_ERRO   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB585_CHAVE_PRIMARIA_ERRO
--==============================================================
create table GEC.GECTB585_CHAVE_PRIMARIA_ERRO (
   NU_ARQUIVO           DEC(18)               
      not null,
   NU_SEQUENCIAL_ERRO   INTEGER               
      not null,
   NU_SEQUENCIAL_CHAVE  DEC(1)                
      not null,
   NO_CAMPO_CHAVE       CHAR(30)              
      not null,
   DE_CONTEUDO_CAMPO_CHAVE CHAR(50)              
      not null,
   constraint GECPK585 primary key (NU_ARQUIVO, NU_SEQUENCIAL_ERRO, 
NU_SEQUENCIAL_CHAVE)
)
 in GECDB002.GECTS585;

label on table GEC.GECTB585_CHAVE_PRIMARIA_ERRO is 'CHAVE_PRIMARIA_ERRO'
;

--==============================================================
-- Index: GEC1I585
--==============================================================
create unique index GEC.GEC1I585 on GEC.GECTB585_CHAVE_PRIMARIA_ERRO (
   NU_ARQUIVO           ASC,
   NU_SEQUENCIAL_ERRO   ASC,
   NU_SEQUENCIAL_CHAVE  ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB586_CONFIRMACAO_CESSAO
--==============================================================
create table GEC.GECTB586_CONFIRMACAO_CESSAO (
   NU_SEQUENCIAL_RESERVA INTEGER               
      not null,
   TS_CADASTRO_CONFIRMACAO_CESSAO TIMESTAMP             
      not null,
   VR_FINANCEIRO_OPERACAO DEC(19, 2)            
      not null,
   IC_LQDCO_FINANCEIRA_CAMARA CHAR(1)               
      not null
         constraint GEC1C586 check (IC_LQDCO_FINANCEIRA_CAMARA in ('S',
'N')),
   DT_LIQUIDACAO        DATE                  
      not null,
   PC_TARIFACAO         DEC(5, 3),
   IC_SITUACAO_CONFIRMACAO CHAR(1)               
      not null
         constraint GEC2C586 check (IC_SITUACAO_CONFIRMACAO in ('1','2',
'3')),
   CO_TPO_PRTCE_RSPNL_TARIFACAO CHAR(1),
   NU_ARQUIVO           DEC(18)               
      not null,
   constraint GECPK586 primary key (NU_SEQUENCIAL_RESERVA, 
TS_CADASTRO_CONFIRMACAO_CESSAO)
)
 in GECDB002.GECTS586;

label on table GEC.GECTB586_CONFIRMACAO_CESSAO is 'CONFIRMACAO_CESSAO';

label on column 
GEC.GECTB586_CONFIRMACAO_CESSAO.IC_LQDCO_FINANCEIRA_CAMARA is 
'IC_LIQUIDACAO_FINANCEIRA_CAMARA';
label on column 
GEC.GECTB586_CONFIRMACAO_CESSAO.CO_TPO_PRTCE_RSPNL_TARIFACAO is 
'CO_TIPO_PARTICIPANTE_RESPONSAVEL_TARIFACAO';
--==============================================================
-- Index: GEC1I586
--==============================================================
create unique index GEC.GEC1I586 on GEC.GECTB586_CONFIRMACAO_CESSAO (
   NU_SEQUENCIAL_RESERVA ASC,
   TS_CADASTRO_CONFIRMACAO_CESSAO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I586
--==============================================================
create index GEC.GEC2I586 on GEC.GECTB586_CONFIRMACAO_CESSAO (
   NU_SEQUENCIAL_RESERVA ASC,
   IC_SITUACAO_CONFIRMACAO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I586
--==============================================================
create index GEC.GEC3I586 on GEC.GECTB586_CONFIRMACAO_CESSAO (
   NU_SEQUENCIAL_RESERVA ASC,
   NU_ARQUIVO           ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 129600 SECQTY 12960
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB587_STCO_CTRTO_GARANTIA
--==============================================================
create table GEC.GECTB587_STCO_CTRTO_GARANTIA (
   CO_SITUACAO_CONTRATO_GARANTIA CHAR(1)               
      not null,
   DE_SITUACAO_CONTRATO_GARANTIA VARCHAR(500)          
      not null,
   constraint GECPK587 primary key (CO_SITUACAO_CONTRATO_GARANTIA)
)
 in GECDB002.GECTS587;

label on table GEC.GECTB587_STCO_CTRTO_GARANTIA is 
'SITUACAO_CONTRATO_GARANTIA';

--==============================================================
-- Index: GEC1I587
--==============================================================
create unique index GEC.GEC1I587 on GEC.GECTB587_STCO_CTRTO_GARANTIA (
   CO_SITUACAO_CONTRATO_GARANTIA ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB588_SOLICITACAO_ARQUIVO
--==============================================================
create table GEC.GECTB588_SOLICITACAO_ARQUIVO (
   NU_SEQUENCIAL_SOLICITACAO DEC(18)               
      not null
      generated ? as identity,
   CO_TIPO_ARQUIVO      CHAR(10),
   NU_TRANCHE           DECIMAL(8, 0),
   TS_ATENDIMENTO_SOLICITACAO TIMESTAMP             
      not null,
   TS_SOLICITACAO       TIMESTAMP             
      not null,
   IC_SITUACAO_SOLICITACAO CHAR(1)               
      not null
         constraint GEC1C588 check (IC_SITUACAO_SOLICITACAO in ('1','2',
'3','4','5','6','7','8','9')),
   CO_USUARIO_SOLICITANTE CHAR(8)               
      not null,
   constraint GECPK588 primary key (NU_SEQUENCIAL_SOLICITACAO)
)
 in GECDB002.GECTS588;

label on table GEC.GECTB588_SOLICITACAO_ARQUIVO is 'SOLICITACAO_ARQUIVO'
;

--==============================================================
-- Index: GEC1I588
--==============================================================
create unique index GEC.GEC1I588 on GEC.GECTB588_SOLICITACAO_ARQUIVO (
   NU_SEQUENCIAL_SOLICITACAO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I588
--==============================================================
create index GEC.GEC2I588 on GEC.GECTB588_SOLICITACAO_ARQUIVO (
   IC_SITUACAO_SOLICITACAO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB589_GRADE_HORARIA
--==============================================================
create table GEC.GECTB589_GRADE_HORARIA (
   NU_SEQUENCIAL_GRADE_HORARIA INTEGER               
      not null
      generated ? as identity,
   CO_TIPO_ARQUIVO      CHAR(10)              
      not null,
   DT_INICIO_VIGENCIA   DATE                  
      not null,
   DT_FIM_VIGENCIA      DATE,
   TS_CADASTRO          TIMESTAMP             
      not null,
   CO_USUARIO_RESPONSAVEL CHAR(8)               
      not null,
   IC_ATIVO             CHAR(1)               
      not null
         constraint GEC1C589 check (IC_ATIVO in ('A','I')),
   constraint GECPK589 primary key (NU_SEQUENCIAL_GRADE_HORARIA)
)
 in GECDB002.GECTS589;

label on table GEC.GECTB589_GRADE_HORARIA is 'GRADE_HORARIA';

--==============================================================
-- Index: GEC1I589
--==============================================================
create unique index GEC.GEC1I589 on GEC.GECTB589_GRADE_HORARIA (
   NU_SEQUENCIAL_GRADE_HORARIA ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I589
--==============================================================
create unique index GEC.GEC2I589 on GEC.GECTB589_GRADE_HORARIA (
   CO_TIPO_ARQUIVO      ASC,
   TS_CADASTRO          ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I589
--==============================================================
create unique index GEC.GEC3I589 on GEC.GECTB589_GRADE_HORARIA (
   CO_TIPO_ARQUIVO      ASC,
   DT_INICIO_VIGENCIA   ASC,
   DT_FIM_VIGENCIA      ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB590_JANELA_PROCESSAMENTO
--==============================================================
create table GEC.GECTB590_JANELA_PROCESSAMENTO (
   NU_SEQUENCIAL_GRADE_HORARIA INTEGER               
      not null,
   NU_JANELA            SMALLINT              
      not null,
   HH_INICIO            TIME                  
      not null,
   HH_TERMINO           TIME                  
      not null,
   constraint GECPK590 primary key (NU_SEQUENCIAL_GRADE_HORARIA, 
NU_JANELA)
)
 in GECDB002.GECTS590;

label on table GEC.GECTB590_JANELA_PROCESSAMENTO is 
'JANELA_PROCESSAMENTO';

--==============================================================
-- Index: GEC1I590
--==============================================================
create unique index GEC.GEC1I590 on GEC.GECTB590_JANELA_PROCESSAMENTO (

   NU_SEQUENCIAL_GRADE_HORARIA ASC,
   NU_JANELA            ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB591_TPO_PRTCE_RSPNL_TRFCO
--==============================================================
create table GEC.GECTB591_TPO_PRTCE_RSPNL_TRFCO (
   CO_TPO_PRTCE_RSPNL_TARIFACAO CHAR(1)               
      not null,
   NO_TPO_PRTCE_RSPNL_TARIFACAO CHAR(50)              
      not null,
   constraint GECPK591 primary key (CO_TPO_PRTCE_RSPNL_TARIFACAO)
)
 in GECDB002.GECTS591;

label on table GEC.GECTB591_TPO_PRTCE_RSPNL_TRFCO is 
'TIPO_PARTICIPANTE_RESPONSAVEL_TARIFACAO';
label on column 
GEC.GECTB591_TPO_PRTCE_RSPNL_TRFCO.CO_TPO_PRTCE_RSPNL_TARIFACAO is 
'CO_TIPO_PARTICIPANTE_RESPONSAVEL_TARIFACAO';
label on column 
GEC.GECTB591_TPO_PRTCE_RSPNL_TRFCO.NO_TPO_PRTCE_RSPNL_TARIFACAO is 
'NO_TIPO_PARTICIPANTE_RESPONSAVEL_TARIFACAO';
--==============================================================
-- Index: GEC1I591
--==============================================================
create unique index GEC.GEC1I591 on GEC.GECTB591_TPO_PRTCE_RSPNL_TRFCO (

   CO_TPO_PRTCE_RSPNL_TARIFACAO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB592_SITUACAO_EVENTO
--==============================================================
create table GEC.GECTB592_SITUACAO_EVENTO (
   NU_SITUACAO_EVENTO   SMALLINT              
      not null,
   DE_SITUACAO_EVENTO   VARCHAR(500)          
      not null,
   constraint GECPK592 primary key (NU_SITUACAO_EVENTO)
)
 in GECDB002.GECTS592;

label on table GEC.GECTB592_SITUACAO_EVENTO is 'SITUACAO_EVENTO';

--==============================================================
-- Index: GEC1I592
--==============================================================
create unique index GEC.GEC1I592 on GEC.GECTB592_SITUACAO_EVENTO (
   NU_SITUACAO_EVENTO   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB593_TIPO_DIVERGENTE
--==============================================================
create table GEC.GECTB593_TIPO_DIVERGENTE (
   NU_TIPO_DIVERGENTE   SMALLINT              
      not null,
   DE_TIPO_DIVERGENTE   VARCHAR(500)          
      not null,
   constraint GECPK593 primary key (NU_TIPO_DIVERGENTE)
)
 in GECDB002.GECTS593;

label on table GEC.GECTB593_TIPO_DIVERGENTE is 'TIPO_DIVERGENTE';

--==============================================================
-- Index: GEC1I593
--==============================================================
create unique index GEC.GEC1I593 on GEC.GECTB593_TIPO_DIVERGENTE (
   NU_TIPO_DIVERGENTE   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA
--==============================================================
create table GEC.GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA (
   NU_SEQUENCIAL_EVENTO DECIMAL(19, 0)        
      not null
      generated ? as identity,
   NU_CREDITO           DECIMAL(19, 0),
   CO_MOTIVO_EVENTO     CHAR(3),
   NU_SITUACAO_EVENTO   SMALLINT,
   CO_CONTROLE_EVENTO_IF CHAR(40),
   CO_EVENTO_UNICO_C3   CHAR(21),
   CO_CNPJ_BASE_SLCTE_EVENTO_C3 CHAR(8),
   CO_CONTRATO_UNICO_C3 CHAR(21),
   constraint GECPK594 primary key (NU_SEQUENCIAL_EVENTO)
)
 in GECDB002.GECTS594;

label on table GEC.GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA is 
'EVENTO_LIQUIDACAO_ANTECIPADA3';
label on column 
GEC.GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA.CO_CNPJ_BASE_SLCTE_EVENTO_C3 
is 'CO_CNPJ_BASE_SOLICITANTE_EVENTO_C3';
--==============================================================
-- Index: GEC1I594
--==============================================================
create unique index GEC.GEC1I594 on 
GEC.GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA (
   NU_SEQUENCIAL_EVENTO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I594
--==============================================================
create index GEC.GEC2I594 on GEC.GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA (

   NU_CREDITO           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB595_PARCELA_EVENTO
--==============================================================
create table GEC.GECTB595_PARCELA_EVENTO (
   NU_SEQUENCIAL_EVENTO DECIMAL(19, 0)        
      not null,
   NU_PARCELA_CREDITO   DECIMAL(18, 0)        
      not null,
   constraint GECPK595 primary key (NU_SEQUENCIAL_EVENTO, 
NU_PARCELA_CREDITO)
)
 in GECDB002.GECTS595;

label on table GEC.GECTB595_PARCELA_EVENTO is 'PARCELA_EVENTO';

--==============================================================
-- Index: GEC1I595
--==============================================================
create unique index GEC.GEC1I595 on GEC.GECTB595_PARCELA_EVENTO (
   NU_SEQUENCIAL_EVENTO ASC,
   NU_PARCELA_CREDITO   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I595
--==============================================================
create unique index GEC.GEC2I595 on GEC.GECTB595_PARCELA_EVENTO (
   NU_SEQUENCIAL_EVENTO ASC,
   NU_PARCELA_CREDITO   ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB596_MOTIVO_EVENTO
--==============================================================
create table GEC.GECTB596_MOTIVO_EVENTO (
   CO_MOTIVO_EVENTO     CHAR(3)               
      not null,
   DE_MOTIVO_EVENTO     VARCHAR(500)          
      not null,
   constraint GECPK596 primary key (CO_MOTIVO_EVENTO)
)
 in GECDB002.GECTS596;

label on table GEC.GECTB596_MOTIVO_EVENTO is 'MOTIVO_EVENTO';

--==============================================================
-- Index: GEC1I596
--==============================================================
create unique index GEC.GEC1I596 on GEC.GECTB596_MOTIVO_EVENTO (
   CO_MOTIVO_EVENTO     ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB597_ARQVO_EVNTO_LQDCO
--==============================================================
create table GEC.GECTB597_ARQVO_EVNTO_LQDCO (
   NU_ARQUIVO           DEC(18)               
      not null,
   NU_SEQUENCIAL_EVENTO DECIMAL(19, 0)        
      not null,
   constraint GECPK597 primary key (NU_ARQUIVO, NU_SEQUENCIAL_EVENTO)
)
 in GECDB002.GECTS597;

label on table GEC.GECTB597_ARQVO_EVNTO_LQDCO is 
'ARQUIVO_EVENTO_LIQUIDACAO';

--==============================================================
-- Index: GEC1I597
--==============================================================
create unique index GEC.GEC1I597 on GEC.GECTB597_ARQVO_EVNTO_LQDCO (
   NU_ARQUIVO           ASC,
   NU_SEQUENCIAL_EVENTO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB598_CONTEUDO_PARAMETRO
--==============================================================
create table GEC.GECTB598_CONTEUDO_PARAMETRO (
   NU_SEQUENCIAL_PARAMETRO INTEGER               
      not null,
   NU_SEQUENCIAL_SOLICITACAO DEC(18)               
      not null,
   DE_CONTEUDO_PARAMETRO VARCHAR(500)          
      not null,
   constraint GECPK598 primary key (NU_SEQUENCIAL_PARAMETRO, 
NU_SEQUENCIAL_SOLICITACAO)
)
 in GECDB002.GECTS598;

--==============================================================
-- Index: GEC1I598
--==============================================================
create unique index GEC.GEC1I598 on GEC.GECTB598_CONTEUDO_PARAMETRO (
   NU_SEQUENCIAL_PARAMETRO ASC,
   NU_SEQUENCIAL_SOLICITACAO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I598
--==============================================================
create index GEC.GEC2I598 on GEC.GECTB598_CONTEUDO_PARAMETRO (
   NU_SEQUENCIAL_SOLICITACAO ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 480 SECQTY 480
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB599_GARANTIA_CONSIGNADO
--==============================================================
create table GEC.GECTB599_GARANTIA_CONSIGNADO (
   NU_CREDITO           DECIMAL(19, 0)        
      not null,
   CO_CONTRATO_ENTE_CONSIGNANTE CHAR(20),
   NU_BENEFICIO_ENTE_CONSIGNANTE DEC(10),
   NU_MATRICULA_ENTE_CONSIGNANTE CHAR(20),
   NU_ANO_MES_CMTCA_PRMRO_DSCNO DEC(6),
   NU_STCO_MNSLDE_RECUPERACAO SMALLINT,
   constraint GECPK599 primary key (NU_CREDITO)
)
 in GECDB002.GECTS599;

label on table GEC.GECTB599_GARANTIA_CONSIGNADO is 'GARANTIA_CONSIGNADO'
;
label on column 
GEC.GECTB599_GARANTIA_CONSIGNADO.NU_ANO_MES_CMTCA_PRMRO_DSCNO is 
'NU_ANO_MES_COMPETENCIA_PRIMEIRO_DESCONTO';
label on column 
GEC.GECTB599_GARANTIA_CONSIGNADO.NU_STCO_MNSLDE_RECUPERACAO is 
'NU_SITUACAO_MENSALIDADE_RECUPERACAO';
--==============================================================
-- Index: GEC1I599
--==============================================================
create unique index GEC.GEC1I599 on GEC.GECTB599_GARANTIA_CONSIGNADO (
   NU_CREDITO           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB600_GARANTIA_VEICULO
--==============================================================
create table GEC.GECTB600_GARANTIA_VEICULO (
   NU_CREDITO           DECIMAL(19, 0)        
      not null,
   CO_IDENTIFICADOR_CHASSI CHAR(17)              
      not null,
   NU_SITUACAO_VALIDACAO_PARCELA SMALLINT,
   NU_ANO_MODELO_VEICULO SMALLINT              
      not null,
   NU_CNPJ_BASE_BNFRO_CRIVO DEC(8),
   CO_TIPO_TABELA_VEICULO CHAR(1),
   DE_VEICULO           CHAR(80),
   constraint GECPK600 primary key (NU_CREDITO)
)
 in GECDB002.GECTS600;

label on table GEC.GECTB600_GARANTIA_VEICULO is 'GARANTIA_VEICULO';
label on column GEC.GECTB600_GARANTIA_VEICULO.NU_CNPJ_BASE_BNFRO_CRIVO 
is 'NU_CNPJ_BASE_BENEFICIARIO_CRIVO';
--==============================================================
-- Index: GEC1I600
--==============================================================
create unique index GEC.GEC1I600 on GEC.GECTB600_GARANTIA_VEICULO (
   NU_CREDITO           ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB601_TIPO_RELATORIO
--==============================================================
create table GEC.GECTB601_TIPO_RELATORIO (
   NU_CODIGO_RELATORIO  SMALLINT              
      not null,
   DE_TITULO_RELATORIO  VARCHAR(500)          
      not null,
   constraint GECPK601 primary key (NU_CODIGO_RELATORIO)
)
 in GECDB002.GECTS601;

label on table GEC.GECTB601_TIPO_RELATORIO is 'TIPO_RELATORIO';

--==============================================================
-- Index: GEC1I601
--==============================================================
create unique index GEC.GEC1I601 on GEC.GECTB601_TIPO_RELATORIO (
   NU_CODIGO_RELATORIO  ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB602_SOLICITACAO_RELATORIO
--==============================================================
create table GEC.GECTB602_SOLICITACAO_RELATORIO (
   NU_SEQUENCIAL_RELATORIO DECIMAL(10, 0)        
      not null
      generated ? as identity,
   DT_REFERENCIA        DATE                   with default NULL,
   DT_INICIO_PERIODO_RELATORIO DATE                   with default NULL,

   DT_FIM_PERIODO_RELATORIO DATE                   with default NULL,
   NU_TRANCHE           DECIMAL(8, 0)          with default NULL,
   NU_IF                SMALLINT               with default NULL,
   NU_SEQ_CONVENENTE    DECIMAL(5, 0)          with default NULL,
   NU_CODIGO_RELATORIO  SMALLINT              
      not null,
   NU_SITUACAO_RELATORIO SMALLINT              
      not null,
   NU_PRODUTO           SMALLINT               with default NULL,
   TS_SOLICITACAO_GERACAO TIMESTAMP
                                  (6) WITHOUT TIME ZONE
      not null,
   TS_INICIO_GERACAO_RELATORIO TIMESTAMP
                                       (6) WITHOUT TIME ZONE with 
default NULL,
   TS_FIM_GERACAO_RELATORIO TIMESTAMP
                                    (6) WITHOUT TIME ZONE with default 
NULL,
   CO_SOLICITANTE       CHAR(10)               for SBCS data with 
default NULL,
   NU_SITUACAO_BAIXA_PARCELA DECIMAL(2, 0)          with default NULL,
   IC_STCO_CNTRO_GARANTIA CHAR(1)                for SBCS data
      not null with default '0',
   constraint GECPK602 primary key (NU_SEQUENCIAL_RELATORIO)
)
 in GECDB002.GECTS602;

label on table GEC.GECTB602_SOLICITACAO_RELATORIO is 
'SOLICITACAO_RELATORIO';
label on column GEC.GECTB602_SOLICITACAO_RELATORIO.NU_PRODUTO is 
'PRODUTO';
label on column 
GEC.GECTB602_SOLICITACAO_RELATORIO.IC_STCO_CNTRO_GARANTIA is 
'IC_SITUACAO_CONTRATO_GARANTIA';
--==============================================================
-- Index: GEC1I602
--==============================================================
create unique index GEC.GEC1I602 on GEC.GECTB602_SOLICITACAO_RELATORIO (

   NU_SEQUENCIAL_RELATORIO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I602
--==============================================================
create index GEC.GEC2I602 on GEC.GECTB602_SOLICITACAO_RELATORIO (
   NU_SITUACAO_RELATORIO ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I602
--==============================================================
create index GEC.GEC3I602 on GEC.GECTB602_SOLICITACAO_RELATORIO (
   NU_CODIGO_RELATORIO  ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB603_VLR_PRSTE_FTRO_CRDTO
--==============================================================
create table GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO (
   NU_SEQUENCIAL_RELATORIO DECIMAL(10, 0)        
      not null,
   NU_SEQUENCIAL_DETALHE_RELATORI DECIMAL(19, 0)        
      not null,
   NU_SEQ_CONVENENTE    decimal(5),
   NU_TRANCHE           DECIMAL(8, 0),
   DT_ASSINATURA        DATE,
   QT_CREDITO_ADQUIRIDO DECIMAL(10, 0),
   VR_SALDO_ADQUIRIDO   DECIMAL(19,2),
   VR_FUTURO_ADQUIRIDO  DECIMAL(19,2),
   QT_CREDITO_ATUAL     DECIMAL(10, 0),
   VR_SALDO_ATUAL       DECIMAL(19,2),
   VR_FUTURO_ATUAL      DECIMAL(19,2),
   constraint GECPK603 primary key (NU_SEQUENCIAL_RELATORIO, 
NU_SEQUENCIAL_DETALHE_RELATORI)
)
 in GECDB002.GECTS603;

label on table GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO is 
'RELATORIO_VALOR_PRESENTE_VALOR_FUTURO_CREDITO';
label on column 
GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO.NU_SEQUENCIAL_DETALHE_RELATORI is 
'NU_SEQUENCIAL_DETALHE_RELATORIO';
label on column GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO.DT_ASSINATURA is 
'DT ASSINATURA';
label on column GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO.QT_CREDITO_ADQUIRIDO 
is 'Quantidade de créditos adquiridos';
--==============================================================
-- Index: GEC1I603
--==============================================================
create unique index GEC.GEC1I603 on GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO (

   NU_SEQUENCIAL_RELATORIO ASC,
   NU_SEQUENCIAL_DETALHE_RELATORI ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I603
--==============================================================
create index GEC.GEC2I603 on GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO (
   NU_TRANCHE           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I603
--==============================================================
create index GEC.GEC3I603 on GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO (
   NU_SEQ_CONVENENTE    ASC
)
USING STOGROUP SGDGEC00
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC4I603
--==============================================================
create index GEC.GEC4I603 on GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO (
   NU_SEQUENCIAL_RELATORIO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB604_SITUACAO_RELATORIO
--==============================================================
create table GEC.GECTB604_SITUACAO_RELATORIO (
   NU_SITUACAO_RELATORIO SMALLINT              
      not null,
   DE_SITUACAO_RELATORIO CHAR(100),
   constraint GECPK604 primary key (NU_SITUACAO_RELATORIO)
)
 in GECDB002.GECTS604;

label on table GEC.GECTB604_SITUACAO_RELATORIO is 'SITUACAO_RELATORIO';


--==============================================================
-- Index: GEC1I604
--==============================================================
create unique index GEC.GEC1I604 on GEC.GECTB604_SITUACAO_RELATORIO (
   NU_SITUACAO_RELATORIO ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB605_RLTRO_ENVIADO_EMAIL
--==============================================================
create table GEC.GECTB605_RLTRO_ENVIADO_EMAIL (
   NU_SEQUENCIAL_EMAIL  DECIMAL(8, 0)         
      not null
      generated ? as identity,
   NU_SEQUENCIAL_RELATORIO DECIMAL(10)           
      not null,
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(8, 0)         
      not null,
   TS_ENVIO_EMAIL       TIMESTAMP,
   NU_MATRICULA         INTEGER               
      not null,
   TS_INCLUSAO          TIMESTAMP             
      not null,
   CO_IP_ESTACAO_INCLUSAO CHAR(20)              
      not null,
   CO_EMAIL_DESTINO     CHAR(100)             
      not null,
   CO_EMAIL_CCOPIA      CHAR(100)             
      not null,
   DE_ASSUNTO           VARCHAR(200),
   DE_CORPO_MENSAGEM    VARCHAR(500),
   constraint GECPK605 primary key (NU_SEQUENCIAL_EMAIL)
)
 in GECDB002.GECTS605;

label on table GEC.GECTB605_RLTRO_ENVIADO_EMAIL is 
'RELATORIO_ENVIADO_POR_EMAIL';
label on column GEC.GECTB605_RLTRO_ENVIADO_EMAIL.NU_MATRICULA is 
'MATRICULA EMPREGADO';
label on column GEC.GECTB605_RLTRO_ENVIADO_EMAIL.DE_ASSUNTO is 
'DESCRICAO_ASSUNTO';
--==============================================================
-- Index: GEC1I605
--==============================================================
create unique index GEC.GEC1I605 on GEC.GECTB605_RLTRO_ENVIADO_EMAIL (
   NU_SEQUENCIAL_EMAIL  ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I605
--==============================================================
create index GEC.GEC2I605 on GEC.GECTB605_RLTRO_ENVIADO_EMAIL (
   NU_SEQUENCIAL_DOCUMENTO ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I605
--==============================================================
create index GEC.GEC3I605 on GEC.GECTB605_RLTRO_ENVIADO_EMAIL (
   NU_MATRICULA         ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB606_RLTRO_DTLMO_BXA_PRCLA
--==============================================================
create table GEC.GECTB606_RLTRO_DTLMO_BXA_PRCLA (
   NU_SEQUENCIAL_RELATORIO DECIMAL(10)           
      not null,
   NU_SEQUENCIAL_DTLHE_RELATORIO DECIMAL(18)           
      not null,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_CREDITO_CONTRATO  DECIMAL(19)           
      not null,
   NU_PARCELA           DECIMAL(3)            
      not null,
   DT_VNCMO_PARCELA     DATE                  
      not null,
   VR_PARCELA           DECIMAL(18,2)         
      not null,
   NU_EVENTO_C3         CHAR(21)              
      not null,
   NU_PARCELA_C3        CHAR(21)              
      not null,
   DT_PGMNO_PARCELA     DATE                  
      not null,
   VR_PAGO_PARCELA      DECIMAL(18,2)         
      not null,
   VR_NOVO_PARCELA      DECIMAL(18,2),
   VR_NOVO_PRINCIPAL_PRCLA DECIMAL(18,2),
   VR_NOVO_JUROS_PRCLA  DECIMAL(18,2),
   IC_LIQUIDACAO_EXTRA_JUDICIAL CHAR(1)               
      not null with default 'N'
         constraint GEC1C606 check (IC_LIQUIDACAO_EXTRA_JUDICIAL in ('S'
,'N')),
   IC_OCORRENCIA_LEILAO CHAR(1)               
      not null with default 'N'
         constraint GEC2C606 check (IC_OCORRENCIA_LEILAO in ('S','N')),

   VR_RECEBIDO_LEILAO   DECIMAL(18,2),
   VR_NOVO_SALDO_PREJUIZO DECIMAL(18,2),
   DT_OCORRENCIA_ESTORNO DATE,
   constraint GECPK606 primary key (NU_SEQUENCIAL_RELATORIO, 
NU_SEQUENCIAL_DTLHE_RELATORIO)
)
 in GECDB002.GECTS606;

label on table GEC.GECTB606_RLTRO_DTLMO_BXA_PRCLA is 
'RELATORIO_DETALHAMENTO_BAIXA_PARCELA';
label on column 
GEC.GECTB606_RLTRO_DTLMO_BXA_PRCLA.NU_SEQUENCIAL_DTLHE_RELATORIO is 
'NU_SEQUENCIAL_DETALHE_RELATORIO';
label on column GEC.GECTB606_RLTRO_DTLMO_BXA_PRCLA.DT_VNCMO_PARCELA is 
'DT_VENCIMENTO_PARCELA';
label on column GEC.GECTB606_RLTRO_DTLMO_BXA_PRCLA.DT_PGMNO_PARCELA is 
'DT_PAGAMENTO_PARCELA';
label on column 
GEC.GECTB606_RLTRO_DTLMO_BXA_PRCLA.VR_NOVO_PRINCIPAL_PRCLA is 
'VR_NOVO_PRINCIPAL_PARCELA';
label on column GEC.GECTB606_RLTRO_DTLMO_BXA_PRCLA.VR_NOVO_JUROS_PRCLA 
is 'VR_NOVO_JUROS_PARCELA';
--==============================================================
-- Index: GEC1I606
--==============================================================
create unique index GEC.GEC1I606 on GEC.GECTB606_RLTRO_DTLMO_BXA_PRCLA (

   NU_SEQUENCIAL_RELATORIO ASC,
   NU_SEQUENCIAL_DTLHE_RELATORIO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB607_RLTRO_LQDCO_ANTCA
--==============================================================
create table GEC.GECTB607_RLTRO_LQDCO_ANTCA (
   NU_SEQUENCIAL_RELATORIO DECIMAL(10, 0)        
      not null,
   NU_SEQUENCIAL_DETALHE_RELATORI DECIMAL(19, 0)        
      not null,
   NU_TRANCHE           DECIMAL(8, 0)         
      not null,
   AA_REFERENCIA_LQDCO_ANTCA DECIMAL(4, 0),
   MM_REFERENCIA_LQDCO_ANTCA DECIMAL(2, 0),
   PC_TAXA_CESSAO       DECIMAL(16,5),
   QT_PARCELA_ANTECIPADA DECIMAL(19, 0),
   VR_RMNRO_MINIMA_ESPERADA DECIMAL(19,2),
   VR_RCBDO_LQDCO_ANTECIPADA DECIMAL(19,2),
   VR_EXPCA_RCBMO_PRCLA_CMPLR DECIMAL(19,2),
   constraint GECPK607 primary key (NU_SEQUENCIAL_RELATORIO, 
NU_SEQUENCIAL_DETALHE_RELATORI)
)
 in GECDB002.GECTS607;

label on table GEC.GECTB607_RLTRO_LQDCO_ANTCA is 
'RELATORIO_LIQUIDACAO_ANTECIPADA';
label on column 
GEC.GECTB607_RLTRO_LQDCO_ANTCA.NU_SEQUENCIAL_DETALHE_RELATORI is 
'NU_SEQUENCIAL_DETALHE_RELATORIO';
label on column GEC.GECTB607_RLTRO_LQDCO_ANTCA.AA_REFERENCIA_LQDCO_ANTCA
 is 'AA_REFERENCIA_LIQUIDACAO_ANTECIPADA';
label on column GEC.GECTB607_RLTRO_LQDCO_ANTCA.MM_REFERENCIA_LQDCO_ANTCA
 is 'MM_REFERENCIA_LIQUIDACAO_ANTECIPADA';
label on column GEC.GECTB607_RLTRO_LQDCO_ANTCA.VR_RMNRO_MINIMA_ESPERADA 
is 'VR_REMUNERACAO_MINIMA_ESPERADA';
label on column GEC.GECTB607_RLTRO_LQDCO_ANTCA.VR_RCBDO_LQDCO_ANTECIPADA
 is 'VR_RECEBIDO_LIQUIDACAO_ANTECIPADA';
label on column 
GEC.GECTB607_RLTRO_LQDCO_ANTCA.VR_EXPCA_RCBMO_PRCLA_CMPLR is 
'VR_EXPECTATIVA_RECEBIMENTO_PARCELA_COMPLEMENTAR';
--==============================================================
-- Index: GEC1I607
--==============================================================
create unique index GEC.GEC1I607 on GEC.GECTB607_RLTRO_LQDCO_ANTCA (
   NU_SEQUENCIAL_RELATORIO ASC,
   NU_SEQUENCIAL_DETALHE_RELATORI ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I607
--==============================================================
create index GEC.GEC2I607 on GEC.GECTB607_RLTRO_LQDCO_ANTCA (
   NU_TRANCHE           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I607
--==============================================================
create index GEC.GEC3I607 on GEC.GECTB607_RLTRO_LQDCO_ANTCA (
   NU_SEQUENCIAL_RELATORIO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB608_RLTRO_BXA_PNDNE_RPSE
--==============================================================
create table GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE (
   NU_SEQUENCIAL_RELATORIO DECIMAL(10)           
      not null,
   NU_SEQUENCIAL_DTLHE_RELATORIO DECIMAL(18)           
      not null,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_CREDITO_CONTRATO  DECIMAL(19)           
      not null,
   NU_PARCELA           DECIMAL(3)            
      not null,
   NU_CONTRATO_C3       CHAR(21)              
      not null,
   NU_PARCELA_C3        CHAR(21)              
      not null,
   DT_RCBMO_REPASSE     DATE                  
      not null,
   VR_RCBDO_REPASSE     DECIMAL(18,2)         
      not null,
   VR_PAGO_PARCELA      DECIMAL(18,2)         
      not null,
   VR_PAGO_PRINCIPAL_PRCLA DECIMAL(18,2),
   VR_PAGO_JUROS_PRCLA  DECIMAL(18,2),
   VR_PAGO_JUROS_MORA_PRCLA DECIMAL(18,2),
   VR_PAGO_MULTA_PRCLA  DECIMAL(18,2),
   VR_NOVO_PARCELA      DECIMAL(18,2),
   VR_PAGO_IOF_ATRASO_PRCLA DECIMAL(18,2),
   VR_DSCNO_PGMNO_PRCLA DECIMAL(18,2),
   VR_ABATIMENTO_PGMNO_PRCLA DECIMAL(18,2),
   VR_DESPESA_PGMNO_PRCLA DECIMAL(18,2),
   VR_NOVO_PRINCIPAL_PRCLA DECIMAL(18,2),
   VR_NOVO_JUROS_PRCLA  DECIMAL(18,2),
   VR_NOVO_SALDO_DEVEDOR_PRCLA DECIMAL(18,2),
   VR_NOVO_SALDO_PREJUIZO DECIMAL(18,2),
   NU_SITUACAO_BAIXA_PARCELA DECIMAL(2),
   constraint GECPK608 primary key (NU_SEQUENCIAL_RELATORIO, 
NU_SEQUENCIAL_DTLHE_RELATORIO)
)
 in GECDB002.GECTS608;

label on table GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE is 
'RELATORIO_BAIXA_PENDENTE_REPASSE_CONCLUIDO';
label on column 
GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.NU_SEQUENCIAL_DTLHE_RELATORIO is 
'NU_SEQUENCIAL_DETALHE_RELATORIO';
label on column GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.DT_RCBMO_REPASSE is 
'DT_RECEBIMENTO_REPASSE';
label on column GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_RCBDO_REPASSE is 
'VR_RECEBIDO_REPASSE';
label on column 
GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_PAGO_PRINCIPAL_PRCLA is 
'VR_PAGO_PRINCIPAL_PARCELA';
label on column GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_PAGO_JUROS_PRCLA is
 'VR_PAGO_JUROS_PARCELA';
label on column 
GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_PAGO_JUROS_MORA_PRCLA is 
'VR_PAGO_JUROS_MORA_PARCELA';
label on column GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_PAGO_MULTA_PRCLA is
 'VR_PAGO_MULTA_PARCELA';
label on column 
GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_PAGO_IOF_ATRASO_PRCLA is 
'VR_PAGO_IOF_ATRASO_PARCELA';
label on column GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_DSCNO_PGMNO_PRCLA 
is 'VR_DESCONTO_PAGAMENTO_PARCELA';
label on column 
GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_ABATIMENTO_PGMNO_PRCLA is 
'VR_ABATIMENTO_PAGAMENTO_PARCELA';
label on column GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_DESPESA_PGMNO_PRCLA
 is 'VR_DESPESA_PAGAMENTO_PARCELA';
label on column 
GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_NOVO_PRINCIPAL_PRCLA is 
'VR_NOVO_PRINCIPAL_PARCELA';
label on column GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_NOVO_JUROS_PRCLA is
 'VR_NOVO_JUROS_PARCELA';
label on column 
GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE.VR_NOVO_SALDO_DEVEDOR_PRCLA is 
'VR_NOVO_SALDO_DEVEDOR_PARCELA';
--==============================================================
-- Index: GEC1I608
--==============================================================
create unique index GEC.GEC1I608 on GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE (

   NU_SEQUENCIAL_RELATORIO ASC,
   NU_SEQUENCIAL_DTLHE_RELATORIO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB609_EVNTO_LQDCO_TRANCHE
--==============================================================
create table GEC.GECTB609_EVNTO_LQDCO_TRANCHE (
   NU_SEQUENCIAL_EVENTO DECIMAL(19, 0)        
      not null,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   PZ_MEDIO_BACEN       DECIMAL(9),
   VR_SALDO_MEDIO_BACEN DECIMAL(19,2),
   QT_CRDTO_LQDCO_ANTECIPADA DECIMAL(9)            
      not null,
   VR_PRESENTE          DECIMAL(19,2),
   VR_FUTURO            DECIMAL(19,2),
   VR_SALDO_DEVEDOR     DECIMAL(19,2),
   VR_SALDO_MEDIO_BACEN_RMNCE DECIMAL(18,2),
   VR_SLDO_DVDR_ANTES_LQDCO DECIMAL(18,2),
   QT_CREDITO_APOS_LIQUIDACAO SMALLINT,
   constraint GECPK611 primary key (NU_SEQUENCIAL_EVENTO, NU_TRANCHE)
)
 in GECDB002.GECTS609;

label on table GEC.GECTB609_EVNTO_LQDCO_TRANCHE is 
'EVENTO_LIQUIDACAO_ANTECIPADA_TRANCHE';
label on column GEC.GECTB609_EVNTO_LQDCO_TRANCHE.PZ_MEDIO_BACEN is 
'PRAZO_MEDIO_BACEN';
label on column GEC.GECTB609_EVNTO_LQDCO_TRANCHE.VR_SALDO_MEDIO_BACEN is
 'SALDO MEDIO BACEN';
label on column 
GEC.GECTB609_EVNTO_LQDCO_TRANCHE.QT_CRDTO_LQDCO_ANTECIPADA is 
'QT_CREDITO_LIQUIDACAO_ANTECIPADA';
label on column 
GEC.GECTB609_EVNTO_LQDCO_TRANCHE.VR_SALDO_MEDIO_BACEN_RMNCE is 
'VR_SALDO_MEDIO_BACEN_REMANESCENTE_TRANCHE';
label on column 
GEC.GECTB609_EVNTO_LQDCO_TRANCHE.VR_SLDO_DVDR_ANTES_LQDCO is 
'VR_SALDO_DEVEDOR_ANTES_LIQUIDACAO';
--==============================================================
-- Index: GEC1I609
--==============================================================
create unique index GEC.GEC1I609 on GEC.GECTB609_EVNTO_LQDCO_TRANCHE (
   NU_SEQUENCIAL_EVENTO ASC,
   NU_TRANCHE           ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I609
--==============================================================
create index GEC.GEC2I609 on GEC.GECTB609_EVNTO_LQDCO_TRANCHE (
   NU_SEQUENCIAL_EVENTO ASC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I609
--==============================================================
create index GEC.GEC3I609 on GEC.GECTB609_EVNTO_LQDCO_TRANCHE (
   NU_TRANCHE           ASC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB610_ARQVO_LQDCO_ANTCA
--==============================================================
create table GEC.GECTB610_ARQVO_LQDCO_ANTCA (
   NU_SQNCL_ARQUIVO_RECEBIDO DECIMAL(19)           
      not null
      generated ? as identity,
   NU_IF                SMALLINT              
      not null,
   NU_ORDEM_ARQUIVO_IF  DECIMAL(19)           
      not null,
   NO_ARQUIVO_RECEBIDO  CHAR(100)             
      not null,
   TS_INCLUSAO_ARQUIVO  TIMESTAMP             
      not null,
   CO_STCO_PROCESSAMENTO_ARQUIVO CHAR(2)               
      not null
         constraint GEC1C610 check (CO_STCO_PROCESSAMENTO_ARQUIVO in (
'01','02','03','04','05')),
   TS_INICIO_PROCESSAMENTO TIMESTAMP,
   TS_FIM_PROCESSAMENTO TIMESTAMP,
   CO_USUARIO_RESPONSAVEL CHAR(10),
   CO_BANCO             CHAR(3),
   CO_PRODUTO           CHAR(4),
   constraint GECPK610 primary key (NU_SQNCL_ARQUIVO_RECEBIDO)
)
 in GECDB002.GECTS610;

label on table GEC.GECTB610_ARQVO_LQDCO_ANTCA is 
'ARQUIVOS_LIQUIDACAO_ANTECIPADA';
label on column GEC.GECTB610_ARQVO_LQDCO_ANTCA.NU_SQNCL_ARQUIVO_RECEBIDO
 is 'NU_SEQUENCIAL_ARQUIVO_RECEBIDO';
--==============================================================
-- Index: GEC1I610
--==============================================================
create unique index GEC.GEC1I610 on GEC.GECTB610_ARQVO_LQDCO_ANTCA (
   NU_SQNCL_ARQUIVO_RECEBIDO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I610
--==============================================================
create unique index GEC.GEC2I610 on GEC.GECTB610_ARQVO_LQDCO_ANTCA (
   NU_IF                ASC,
   NU_ORDEM_ARQUIVO_IF  ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I610
--==============================================================
create index GEC.GEC3I610 on GEC.GECTB610_ARQVO_LQDCO_ANTCA (
   NU_IF                ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB611_EVNTO_LQDCO_ANTCA
--==============================================================
create table GEC.GECTB611_EVNTO_LQDCO_ANTCA (
   NU_SEQUENCIAL_EVENTO DECIMAL(19, 0)        
      not null
      generated ? as identity,
   NU_ORDEM_LIQUIDACAO_IF DECIMAL(19)           
      not null,
   DT_SIMULACAO_LQDCO_ANTECIPADA DATE                  
      not null,
   DT_LIQUIDACAO_ANTECIPADA DATE,
   PZ_MEDIO_BACEN       DECIMAL(9),
   VR_SALDO_MEDIO_BACEN DECIMAL(19,2),
   QT_CRDTO_LQDCO_ANTECIPADA DECIMAL(9)            
      not null,
   VR_PRESENTE          DECIMAL(19,2),
   VR_FUTURO            DECIMAL(19,2),
   VR_SALDO_DEVEDOR     DECIMAL(19,2),
   CO_SITUACAO_LIQUIDACAO DECIMAL(5)            
      not null,
   NU_IF                SMALLINT              
      not null,
   NU_SITUACAO_EVENTO   SMALLINT              
      not null,
   VR_ATUALIZACAO_CDI_EVENTO DECIMAL(18,2),
   constraint GECPK611 primary key (NU_SEQUENCIAL_EVENTO)
)
 in GECDB002.GECTS611;

label on table GEC.GECTB611_EVNTO_LQDCO_ANTCA is 
'EVENTO_LIQUIDACAO_ANTECIPADA';
label on column 
GEC.GECTB611_EVNTO_LQDCO_ANTCA.DT_SIMULACAO_LQDCO_ANTECIPADA is 
'DT_SIMULACAO_LIQUIDACAO_ANTECIPADA';
label on column GEC.GECTB611_EVNTO_LQDCO_ANTCA.PZ_MEDIO_BACEN is 
'PRAZO_MEDIO_BACEN';
label on column GEC.GECTB611_EVNTO_LQDCO_ANTCA.VR_SALDO_MEDIO_BACEN is 
'SALDO MEDIO BACEN';
label on column GEC.GECTB611_EVNTO_LQDCO_ANTCA.QT_CRDTO_LQDCO_ANTECIPADA
 is 'QT_CREDITO_LIQUIDACAO_ANTECIPADA';
--==============================================================
-- Index: GEC1I611
--==============================================================
create unique index GEC.GEC1I611 on GEC.GECTB611_EVNTO_LQDCO_ANTCA (
   NU_SEQUENCIAL_EVENTO ASC
)
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I611
--==============================================================
create index GEC.GEC2I611 on GEC.GECTB611_EVNTO_LQDCO_ANTCA (
   NU_ORDEM_LIQUIDACAO_IF ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I611
--==============================================================
create index GEC.GEC3I611 on GEC.GECTB611_EVNTO_LQDCO_ANTCA (
   DT_LIQUIDACAO_ANTECIPADA ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB612_TED_EVNTO_LQDCO_ANTCA
--==============================================================
create table GEC.GECTB612_TED_EVNTO_LQDCO_ANTCA (
   CO_NUOP              CHAR(25)              
      not null,
   NU_SEQUENCIAL_EVENTO DECIMAL(19, 0)        
      not null,
   NU_SEQUENCIAL_VINCULO DECIMAL(19, 0),
   TS_MOVIMENTO         TIMESTAMP,
   constraint GECPK612 primary key (CO_NUOP, NU_SEQUENCIAL_EVENTO)
)
 in GECDB002.GECTS612;

label on table GEC.GECTB612_TED_EVNTO_LQDCO_ANTCA is 
'TED_EVENTO_LIQUIDACAO_ANTECIPADA';

--==============================================================
-- Index: GEC1I612
--==============================================================
create unique index GEC.GEC1I612 on GEC.GECTB612_TED_EVNTO_LQDCO_ANTCA (

   CO_NUOP              ASC,
   NU_SEQUENCIAL_EVENTO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB613_SALDO_CONTA_GRAFICA
--==============================================================
create table GEC.GECTB613_SALDO_CONTA_GRAFICA (
   NU_SEQUENCIAL_VINCULO DECIMAL(19, 0)        
      not null,
   TS_MOVIMENTO         TIMESTAMP             
      not null,
   VR_SALDO_ANTERIOR    DECIMAL(19,2)         
      not null,
   DE_HISTORICO         VARCHAR(500)          
      not null,
   VR_DEBITO            DECIMAL(19,2),
   VR_CREDITO           DECIMAL(19,2),
   VR_REMUNERACAO_DI    DECIMAL(19,2),
   NU_FATOR             DECIMAL(8, 0)         
      not null,
   constraint GECPK613 primary key (NU_SEQUENCIAL_VINCULO, TS_MOVIMENTO)

)
 in GECDB002.GECTS613;

label on table GEC.GECTB613_SALDO_CONTA_GRAFICA is 'SALDO_CONTA_GRAFICA'
;

--==============================================================
-- Index: GEC1I613
--==============================================================
create unique index GEC.GEC1I613 on GEC.GECTB613_SALDO_CONTA_GRAFICA (
   NU_SEQUENCIAL_VINCULO ASC,
   TS_MOVIMENTO         ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I613
--==============================================================
create index GEC.GEC2I613 on GEC.GECTB613_SALDO_CONTA_GRAFICA (
   NU_FATOR             ASC
)
USING STOGROUP SGDGEC00
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB614_STCO_LQDCO_ANTECIPADA
--==============================================================
create table GEC.GECTB614_STCO_LQDCO_ANTECIPADA (
   CO_SITUACAO_LIQUIDACAO DECIMAL(5)            
      not null,
   DE_SITUACAO_LIQUIDACAO CHAR(30),
   constraint GECPK614 primary key (CO_SITUACAO_LIQUIDACAO)
)
 in GECDB002.GECTS614;

label on table GEC.GECTB614_STCO_LQDCO_ANTECIPADA is 
'SITUACAO_LIQUIDACAO_ANTECIPADA';

--==============================================================
-- Index: GEC1I614
--==============================================================
create unique index GEC.GEC1I614 on GEC.GECTB614_STCO_LQDCO_ANTECIPADA (

   CO_SITUACAO_LIQUIDACAO ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB615_FLXO_PGMNO_CONTABIL
--==============================================================
create table GEC.GECTB615_FLXO_PGMNO_CONTABIL (
   NU_TRANCHE           DECIMAL(8, 0)         
      not null,
   DT_REFERENCIA        DATE                  
      not null,
   NU_SEQUENCIAL_LANCAMENTO DECIMAL(18)           
      not null,
   CO_TIPO_FLUXO        CHAR(1)               
      not null,
   CO_TIPO_EVENTO       DECIMAL(3, 0)         
      not null,
   VR_SALDO_DEVEDOR_ANTERIOR DECIMAL(19, 0),
   VR_JURO_ACUMULADO    DECIMAL(19, 2)         default 0,
   VR_PRESTACAO         DECIMAL(19, 2)         default 0,
   VR_JURO_PAGO         DECIMAL(19, 2),
   VR_AMORTIZACAO       DECIMAL(19, 2),
   VR_VPL_LIQUIDACAO    DECIMAL(19, 2),
   VR_SALDO_DEVEDOR_AMORTIZADO DECIMAL(19, 2),
   VR_JURO_PRO_RATA     DECIMAL(19, 2),
   VR_AGIO              DECIMAL(19, 2),
   QT_CONTRATO_LIQUIDADO DECIMAL(6, 0),
   VR_TOTAL_PARCELA_LIQUIDADA DECIMAL(19,2),
   VR_EXPECTATIVA_RENDA_NAO_RLZDA DECIMAL(18,2),
   VR_EXPECTATIVA_AGIO_NAO_EFTDO DECIMAL(18,2),
   VR_RESULTADO_LIQUIDO_NAO_RLZDO DECIMAL(18,2),
   QT_DIA_DESDE_ULTMA_AMORTIZACAO SMALLINT,
   PC_TXA_DSCNO_ANUAL_DIA_CORRIDO DECIMAL(15,5),
   PC_TXA_DSCNO_MNSL_DIA_CORRIDO DECIMAL(15,5),
   constraint GECPK615 primary key (NU_TRANCHE, DT_REFERENCIA, 
NU_SEQUENCIAL_LANCAMENTO)
)
 in GECDB002.GECTS615;

label on table GEC.GECTB615_FLXO_PGMNO_CONTABIL is 
'FLUXO_CONTABIL_PAGAMENTO';
label on column 
GEC.GECTB615_FLXO_PGMNO_CONTABIL.VR_EXPECTATIVA_RENDA_NAO_RLZDA is 
'VR_EXPECTATIVA_RENDA_NAO_REALIZADA';
label on column 
GEC.GECTB615_FLXO_PGMNO_CONTABIL.VR_EXPECTATIVA_AGIO_NAO_EFTDO is 
'VR_EXPECTATIVA_AGIO_NAO_EFETIVADO';
label on column 
GEC.GECTB615_FLXO_PGMNO_CONTABIL.VR_RESULTADO_LIQUIDO_NAO_RLZDO is 
'VR_RESULTADO_LIQUIDO_NAO_REALIZADO';
label on column 
GEC.GECTB615_FLXO_PGMNO_CONTABIL.QT_DIA_DESDE_ULTMA_AMORTIZACAO is 
'QT_DIA_DESDE_ULTIMA_AMORTIZACAO';
label on column 
GEC.GECTB615_FLXO_PGMNO_CONTABIL.PC_TXA_DSCNO_ANUAL_DIA_CORRIDO is 
'PC_TAXA_DESCONTO_ANUAL_DIA_CORRIDO';
label on column 
GEC.GECTB615_FLXO_PGMNO_CONTABIL.PC_TXA_DSCNO_MNSL_DIA_CORRIDO is 
'PC_TAXA_DESCONTO_MENSAL_DIA_CORRIDO';
--==============================================================
-- Index: GEC1I615
--==============================================================
create unique index GEC.GEC1I615 on GEC.GECTB615_FLXO_PGMNO_CONTABIL (
   NU_TRANCHE           ASC,
   DT_REFERENCIA        ASC,
   NU_SEQUENCIAL_LANCAMENTO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I615
--==============================================================
create index GEC.GEC2I615 on GEC.GECTB615_FLXO_PGMNO_CONTABIL (
   CO_TIPO_EVENTO       ASC,
   DT_REFERENCIA        ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I615
--==============================================================
create index GEC.GEC3I615 on GEC.GECTB615_FLXO_PGMNO_CONTABIL (
   NU_TRANCHE           ASC,
   DT_REFERENCIA        ASC,
   CO_TIPO_FLUXO        ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB616_TIPO_EVENTO
--==============================================================
create table GEC.GECTB616_TIPO_EVENTO (
   CO_TIPO_EVENTO       DECIMAL(3, 0)         
      not null,
   DE_TIPO_EVENTO       CHAR(50)              
      not null,
   constraint GECPK616 primary key (CO_TIPO_EVENTO)
)
 in GECDB002.GECTS616;

label on table GEC.GECTB616_TIPO_EVENTO is 'TIPO_EVENTO';

--==============================================================
-- Index: GEC1I616
--==============================================================
create unique index GEC.GEC1I616 on GEC.GECTB616_TIPO_EVENTO (
   CO_TIPO_EVENTO       ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB617_FLUXO_AQUISICAO
--==============================================================
create table GEC.GECTB617_FLUXO_AQUISICAO (
   NU_TRANCHE           DECIMAL(8, 0)         
      not null,
   DT_REFERENCIA        DATE                  
      not null,
   NU_SEQUENCIAL_REFERENCIA DECIMAL(8, 0)         
      not null,
   VR_SALDO_DEVEDOR_CONTRATO DECIMAL(19, 2),
   VR_PAGO              DECIMAL(19, 2),
   VR_AGIO              DECIMAL(19, 2),
   VR_TOTAL_FLUXO_FUTURO DECIMAL(19, 2),
   VR_RECEITA_BRUTA     DECIMAL(19, 2),
   VR_RECEITA_LIQUIDA   DECIMAL(19, 2),
   PC_TAXA_CONTRATA_MENSAL DECIMAL(19, 7),
   PC_TAXA_CONTRATA_ANUAL DECIMAL(19, 7),
   DT_ULTIMO_VENCIMENTO DATE,
   PZ_OPERACAO          INTEGER,
   QT_CONTRATO_CEDIDO   DECIMAL(6, 0),
   DT_LIQUIDACAO        DATE,
   PZ_MEDIO_DIA_UTIL    INTEGER,
   VR_JURO              DECIMAL(19, 2),
   VR_JURO_PRO_RATA     DECIMAL(19, 2),
   VR_PRESENTE_LIQUIDO  DECIMAL(19, 2),
   VR_AMORTIZACAO       DECIMAL(19, 2),
   VR_SALDO_CONTA_GRAFICA DECIMAL(18,2),
   PZ_MEDIO_LIQUIDACAO  INTEGER,
   VR_RETIDO_CONTA_GRAFICA DECIMAL(18,2),
   QT_CREDITO_ATIVO     INTEGER,
   VR_RECEBIDO_REPASSE  DECIMAL(18,2),
   VR_RCBDO_LQDCO_ANTECIPADA DECIMAL(18,2),
   VR_DIFERENCA_ATUALIZADA_MES DECIMAL(18,2),
   VR_APROPRIADO        DECIMAL(18,2),
   constraint GECPK617 primary key (NU_TRANCHE, DT_REFERENCIA, 
NU_SEQUENCIAL_REFERENCIA)
)
 in GECDB002.GECTS617;

label on table GEC.GECTB617_FLUXO_AQUISICAO is 'FLUXO_AQUISICAO';
label on column GEC.GECTB617_FLUXO_AQUISICAO.VR_RCBDO_LQDCO_ANTECIPADA 
is 'VR_RECEBIDO_LIQUIDACAO_ANTECIPADA';
--==============================================================
-- Index: GEC1I617
--==============================================================
create unique index GEC.GEC1I617 on GEC.GECTB617_FLUXO_AQUISICAO (
   NU_TRANCHE           ASC,
   DT_REFERENCIA        ASC,
   NU_SEQUENCIAL_REFERENCIA ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB618_HSTRO_STCO_DEVEDOR
--==============================================================
create table GEC.GECTB618_HSTRO_STCO_DEVEDOR (
   NU_SQNCL_SITUACAO_DEVEDOR DECIMAL(19)           
      not null
      generated ? as identity,
   TS_INCLUSAO          TIMESTAMP             
      not null,
   NU_IF                SMALLINT              
      not null,
   NU_SITUACAO_EVENTO   SMALLINT              
      not null,
   DT_INICIO            DATE                  
      not null,
   DT_FIM               DATE,
   NU_MATRICULA_INCLUSAO INTEGER               
      not null,
   CO_IP_ESTACAO_INCLUSAO CHAR(20)              
      not null,
   constraint GECPK618 primary key (NU_SQNCL_SITUACAO_DEVEDOR)
)
 in GECDB002.GECTS618;

label on table GEC.GECTB618_HSTRO_STCO_DEVEDOR is 
'HISTORICO_SITUACAO_DEVEDOR';

--==============================================================
-- Index: GEC1I618
--==============================================================
create unique index GEC.GEC1I618 on GEC.GECTB618_HSTRO_STCO_DEVEDOR (
   NU_SQNCL_SITUACAO_DEVEDOR ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I618
--==============================================================
create unique index GEC.GEC2I618 on GEC.GECTB618_HSTRO_STCO_DEVEDOR (
   NU_IF                ASC,
   DT_INICIO            ASC,
   NU_SITUACAO_EVENTO   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB619_SITUACAO_DEVEDOR
--==============================================================
create table GEC.GECTB619_SITUACAO_DEVEDOR (
   NU_SITUACAO_DEVEDOR  SMALLINT              
      not null,
   DE_SITUACAO_DEVEDOR  VARCHAR(500)          
      not null,
   constraint GECPK619 primary key (NU_SITUACAO_DEVEDOR)
)
 in GECDB002.GECTS619;

label on table GEC.GECTB619_SITUACAO_DEVEDOR is 'SITUACAO_DEVEDOR';

--==============================================================
-- Index: GEC1I619
--==============================================================
create unique index GEC.GEC1I619 on GEC.GECTB619_SITUACAO_DEVEDOR (
   NU_SITUACAO_DEVEDOR  ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB620_EXTRACAO_SIAPC
--==============================================================
create table GEC.GECTB620_EXTRACAO_SIAPC (
   NU_SQNCL_GERACAO_ARQVO DECIMAL(19)           
      not null
      generated ? as identity,
   NU_SITUACAO_RELATORIO SMALLINT,
   TS_SOLICITACAO_GERACAO TIMESTAMP             
      not null,
   TS_INICIO_GERACAO_RELATORIO TIMESTAMP,
   TS_FIM_GERACAO_RELATORIO TIMESTAMP,
   CO_SOLICITANTE       CHAR(10)              
      not null,
   CO_IP_ESTACAO        CHAR(20)              
      not null,
   DT_GERACAO_ARQUIVO   DATE                  
      not null,
   DT_MOVIMENTO         DATE                  
      not null,
   constraint GECPK620 primary key (NU_SQNCL_GERACAO_ARQVO)
)
 in GECDB002.GECTS620;

label on table GEC.GECTB620_EXTRACAO_SIAPC is 'EXTRACAO_SIAPC';
label on column GEC.GECTB620_EXTRACAO_SIAPC.NU_SQNCL_GERACAO_ARQVO is 
'NU_SEQUENCIAL_GERACAO_ARQUIVO';
--==============================================================
-- Index: GEC1I620
--==============================================================
create unique index GEC.GEC1I620 on GEC.GECTB620_EXTRACAO_SIAPC (
   NU_SQNCL_GERACAO_ARQVO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB621_CONTRATO_NVO_ALTERADO
--==============================================================
create table GEC.GECTB621_CONTRATO_NVO_ALTERADO (
   NU_SQNCL_GERACAO_ARQVO DECIMAL(19)           
      not null,
   NU_TIPO_REGISTRO     DECIMAL(2, 0)         
      not null,
   NU_SEQUENCIAL_REGISTRO DECIMAL(19)           
      not null,
   NU_TRANCHE           DECIMAL(8, 0),
   IC_TIPO_CPF_TOMADOR  DECIMAL(1),
   PZ_CONTRATO          INTEGER,
   NU_TIPO_CONTRATO     SMALLINT              
      not null,
   NU_SITUACAO_CONTRATO SMALLINT              
      not null,
   NU_NATUREZA_OPERACAO SMALLINT              
      not null,
   NU_MODALIDADE_OPERACAO SMALLINT              
      not null,
   NU_SUB_MODALIDADE_OPERACAO SMALLINT              
      not null,
   NU_INDEXADOR         SMALLINT              
      not null,
   NU_TIPO_TAXA_REFERENCIAL SMALLINT              
      not null,
   NU_MOEDA_VARIACAO_CAMBIAL SMALLINT,
   NU_TIPO_RENEGOCIACAO SMALLINT              
      not null,
   NU_TIPO_FORMA_PAGAMENTO SMALLINT              
      not null,
   VR_CONCESSAO_ORIGINAL DECIMAL(19,2),
   DT_VNCMO_ULTMA_PRCLA_PRDTO DATE,
   DT_PAGAMENTO_CESSAO  DATE,
   PZ_CARENCIA          DECIMAL(5),
   QT_TOTAL_PARCELA_PRODUTO DECIMAL(4, 0),
   DT_CESSAO            DATE,
   PC_TAXA_JURO         DECIMAL(12, 5),
   VR_LIQUIDO_CONTRATO  DECIMAL(19,2),
   PC_INDICADOR         DECIMAL(16, 7),
   VR_PRESTACAO         DECIMAL(10,2),
   PZ_REMANESCENTE      DECIMAL(5),
   VR_DIVIDA_VINCENDA   DECIMAL(19,2),
   VR_RENDA_APROPRIAR   DECIMAL(19,2),
   VR_PAGO_PRESTACAO    DECIMAL(19,2),
   QT_PARCELA_ABERTO    DECIMAL(6, 0),
   DT_PROXIMO_VENCIMENTO DATE,
   NU_SITUACAO_DEVEDOR  SMALLINT,
   DT_SITUACAO_DEVEDOR  DATE,
   PC_TAXA_EFETIVA_ANUAL DECIMAL(16,7),
   constraint GECPK621 primary key (NU_SQNCL_GERACAO_ARQVO, 
NU_SEQUENCIAL_REGISTRO, NU_TIPO_REGISTRO)
)
 in GECDB002.GECTS621;

label on table GEC.GECTB621_CONTRATO_NVO_ALTERADO is 
'CONTRATO_NOVO_ALTERADO';
label on column 
GEC.GECTB621_CONTRATO_NVO_ALTERADO.NU_SQNCL_GERACAO_ARQVO is 
'NU_SEQUENCIAL_GERACAO_ARQUIVO';
label on column 
GEC.GECTB621_CONTRATO_NVO_ALTERADO.NU_SUB_MODALIDADE_OPERACAO is 
'NU_SUBNIVEL_MODALIDADE_OPERACAO';
label on column 
GEC.GECTB621_CONTRATO_NVO_ALTERADO.DT_VNCMO_ULTMA_PRCLA_PRDTO is 
'DT_VENCIMENTO_ULTIMA_PARCELA_PRODUTO';
--==============================================================
-- Index: GEC1I621
--==============================================================
create unique index GEC.GEC1I621 on GEC.GECTB621_CONTRATO_NVO_ALTERADO (

   NU_SQNCL_GERACAO_ARQVO ASC,
   NU_SEQUENCIAL_REGISTRO ASC,
   NU_TIPO_REGISTRO     ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I621
--==============================================================
create index GEC.GEC2I621 on GEC.GECTB621_CONTRATO_NVO_ALTERADO (
   NU_TRANCHE           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I621
--==============================================================
create index GEC.GEC3I621 on GEC.GECTB621_CONTRATO_NVO_ALTERADO (
   NU_SQNCL_GERACAO_ARQVO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB622_VENCIMENTO_SEGREGADO
--==============================================================
create table GEC.GECTB622_VENCIMENTO_SEGREGADO (
   NU_SQNCL_GERACAO_ARQVO DECIMAL(19)           
      not null,
   NU_TIPO_REGISTRO     DECIMAL(2, 0)         
      not null,
   NU_SEQUENCIAL_REGISTRO DECIMAL(19)           
      not null,
   NU_TRANCHE           DECIMAL(8, 0),
   NU_TIPO_INFORMACAO   SMALLINT              
      not null,
   NU_LIMITE_INFERIOR   decimal(16,7),
   NU_LIMITE_SUPERIOR   decimal(16,7),
   VR_CONTABIL_INFORMACAO decimal(19,2),
   constraint GECPK622 primary key (NU_SQNCL_GERACAO_ARQVO, 
NU_SEQUENCIAL_REGISTRO, NU_TIPO_REGISTRO)
)
 in GECDB002.GECTS622;

label on table GEC.GECTB622_VENCIMENTO_SEGREGADO is 
'VENCIMENTO_SEGREGADO';
label on column GEC.GECTB622_VENCIMENTO_SEGREGADO.NU_SQNCL_GERACAO_ARQVO
 is 'NU_SEQUENCIAL_GERACAO_ARQUIVO';
--==============================================================
-- Index: GEC1I622
--==============================================================
create unique index GEC.GEC1I622 on GEC.GECTB622_VENCIMENTO_SEGREGADO (

   NU_SQNCL_GERACAO_ARQVO ASC,
   NU_SEQUENCIAL_REGISTRO ASC,
   NU_TIPO_REGISTRO     ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB623_TIPO_CONTRATO
--==============================================================
create table GEC.GECTB623_TIPO_CONTRATO (
   NU_TIPO_CONTRATO     SMALLINT              
      not null,
   DE_TIPO_CONTRATO     CHAR(200)             
      not null,
   constraint GECPK623 primary key (NU_TIPO_CONTRATO)
)
 in GECDB002.GECTS623;

label on table GEC.GECTB623_TIPO_CONTRATO is 'TIPO_CONTRATO_C3';

--==============================================================
-- Index: GEC1I623
--==============================================================
create unique index GEC.GEC1I623 on GEC.GECTB623_TIPO_CONTRATO (
   NU_TIPO_CONTRATO     ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB624_SITUACAO_CONTRATO
--==============================================================
create table GEC.GECTB624_SITUACAO_CONTRATO (
   NU_SITUACAO_CONTRATO SMALLINT              
      not null,
   DE_SITUACAO_CONTRATO CHAR(200)             
      not null,
   constraint GECPK624 primary key (NU_SITUACAO_CONTRATO)
)
 in GECDB002.GECTS624;

label on table GEC.GECTB624_SITUACAO_CONTRATO is 'SITUACAO_CONTRATO_C3';


--==============================================================
-- Index: GEC1I624
--==============================================================
create unique index GEC.GEC1I624 on GEC.GECTB624_SITUACAO_CONTRATO (
   NU_SITUACAO_CONTRATO ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB625_NATUREZA_OPERACAO
--==============================================================
create table GEC.GECTB625_NATUREZA_OPERACAO (
   NU_NATUREZA_OPERACAO SMALLINT              
      not null,
   DE_NATUREZA_OPERACAO VARCHAR(500)          
      not null,
   constraint GECPK625 primary key (NU_NATUREZA_OPERACAO)
)
 in GECDB002.GECTS625;

label on table GEC.GECTB625_NATUREZA_OPERACAO is 'NATUREZA_OPERCAO_C3';


--==============================================================
-- Index: GEC1I625
--==============================================================
create unique index GEC.GEC1I625 on GEC.GECTB625_NATUREZA_OPERACAO (
   NU_NATUREZA_OPERACAO ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB626_SUBNVL_MDLDE_OPRCO
--==============================================================
create table GEC.GECTB626_SUBNVL_MDLDE_OPRCO (
   NU_MODALIDADE_OPERACAO SMALLINT              
      not null,
   NU_SUB_MODALIDADE_OPERACAO SMALLINT              
      not null,
   DE_SUB_MODALIDADE_OPERACAO VARCHAR(500)          
      not null,
   CO_MODALIDADE_OPRCO_SCR3040 CHAR(4)               
      not null,
   constraint GECPK626 primary key (NU_MODALIDADE_OPERACAO, 
NU_SUB_MODALIDADE_OPERACAO)
)
 in GECDB002.GECTS626;

label on table GEC.GECTB626_SUBNVL_MDLDE_OPRCO is 
'SUBNIVEL_MODALIDADE_OPERACAO_C3';
label on column 
GEC.GECTB626_SUBNVL_MDLDE_OPRCO.NU_SUB_MODALIDADE_OPERACAO is 
'NU_SUBNIVEL_MODALIDADE_OPERACAO';
label on column 
GEC.GECTB626_SUBNVL_MDLDE_OPRCO.CO_MODALIDADE_OPRCO_SCR3040 is 
'CO_MODALIDADE_OPERACAO_SCR3040';
--==============================================================
-- Index: GEC1I626
--==============================================================
create unique index GEC.GEC1I626 on GEC.GECTB626_SUBNVL_MDLDE_OPRCO (
   NU_MODALIDADE_OPERACAO ASC,
   NU_SUB_MODALIDADE_OPERACAO ASC
)
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I626
--==============================================================
create unique index GEC.GEC2I626 on GEC.GECTB626_SUBNVL_MDLDE_OPRCO (
   CO_MODALIDADE_OPRCO_SCR3040 ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB627_MODALIDADE_OPERACAO
--==============================================================
create table GEC.GECTB627_MODALIDADE_OPERACAO (
   NU_MODALIDADE_OPERACAO SMALLINT              
      not null,
   DE_MODALIDADE_OPERACAO VARCHAR(500)          
      not null,
   constraint GECPK627 primary key (NU_MODALIDADE_OPERACAO)
)
 in GECDB002.GECTS627;

label on table GEC.GECTB627_MODALIDADE_OPERACAO is 
'MODALIDADE_OPERACAO_C3';

--==============================================================
-- Index: GEC1I627
--==============================================================
create unique index GEC.GEC1I627 on GEC.GECTB627_MODALIDADE_OPERACAO (
   NU_MODALIDADE_OPERACAO ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB628_INDXR_TXA_REFERENCIAL
--==============================================================
create table GEC.GECTB628_INDXR_TXA_REFERENCIAL (
   NU_TIPO_TAXA_REFERENCIAL SMALLINT              
      not null,
   NU_INDEXADOR         SMALLINT              
      not null,
   NO_INDEXADOR         VARCHAR(500)          
      not null,
   constraint GECPK628 primary key (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
)
 in GECDB002.GECTS628;

label on table GEC.GECTB628_INDXR_TXA_REFERENCIAL is 
'INDEXADOR_TAXA_REFERENCIAL';

--==============================================================
-- Index: GEC1I628
--==============================================================
create unique index GEC.GEC1I628 on GEC.GECTB628_INDXR_TXA_REFERENCIAL (

   NU_INDEXADOR         ASC,
   NU_TIPO_TAXA_REFERENCIAL ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB629_TPO_TAXA_REFERENCIAL
--==============================================================
create table GEC.GECTB629_TPO_TAXA_REFERENCIAL (
   NU_TIPO_TAXA_REFERENCIAL SMALLINT              
      not null,
   DE_TIPO_TAXA_REFERENCIAL VARCHAR(500)          
      not null,
   constraint GECPK629 primary key (NU_TIPO_TAXA_REFERENCIAL)
)
 in GECDB002.GECTS629;

label on table GEC.GECTB629_TPO_TAXA_REFERENCIAL is 
'TIPO_TAXA_REFERENCIAL';

--==============================================================
-- Index: GEC1I629
--==============================================================
create unique index GEC.GEC1I629 on GEC.GECTB629_TPO_TAXA_REFERENCIAL (

   NU_TIPO_TAXA_REFERENCIAL ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB630_VARIACAO_CAMBIAL
--==============================================================
create table GEC.GECTB630_VARIACAO_CAMBIAL (
   NU_MOEDA_VARIACAO    SMALLINT              
      not null,
   NO_MOEDA_VARIACAO    CHAR(200)             
      not null,
   constraint GECPK630 primary key (NU_MOEDA_VARIACAO)
)
 in GECDB002.GECTS630;

label on table GEC.GECTB630_VARIACAO_CAMBIAL is 'VARIACAO_CAMBIAL';
label on column GEC.GECTB630_VARIACAO_CAMBIAL.NO_MOEDA_VARIACAO is 
'DE_MOEDA_VARIACAO';
--==============================================================
-- Index: GEC1I630
--==============================================================
create unique index GEC.GEC1I630 on GEC.GECTB630_VARIACAO_CAMBIAL (
   NU_MOEDA_VARIACAO    ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB631_TIPO_RENEGOCIACAO
--==============================================================
create table GEC.GECTB631_TIPO_RENEGOCIACAO (
   NU_TIPO_RENEGOCIACAO SMALLINT              
      not null,
   DE_TIPO_RENEGOCIACAO VARCHAR(400)          
      not null,
   constraint GECPK631 primary key (NU_TIPO_RENEGOCIACAO)
)
 in GECDB002.GECTS631;

label on table GEC.GECTB631_TIPO_RENEGOCIACAO is 'TIPO_RENEGOCIACAO';

--==============================================================
-- Index: GEC1I631
--==============================================================
create unique index GEC.GEC1I631 on GEC.GECTB631_TIPO_RENEGOCIACAO (
   NU_TIPO_RENEGOCIACAO ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB632_TIPO_FORMA_PAGAMENTO
--==============================================================
create table GEC.GECTB632_TIPO_FORMA_PAGAMENTO (
   NU_TIPO_FORMA_PAGAMENTO SMALLINT              
      not null,
   DE_TIPO_FORMA_PAGAMENTO CHAR(200)             
      not null,
   constraint GECPK632 primary key (NU_TIPO_FORMA_PAGAMENTO)
)
 in GECDB002.GECTS632;

label on table GEC.GECTB632_TIPO_FORMA_PAGAMENTO is 
'TIPO_FORMA_PAGAMENTO';

--==============================================================
-- Index: GEC1I632
--==============================================================
create unique index GEC.GEC1I632 on GEC.GECTB632_TIPO_FORMA_PAGAMENTO (

   NU_TIPO_FORMA_PAGAMENTO ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB633_CREDITO_LQDCO_ANTCA
--==============================================================
create table GEC.GECTB633_CREDITO_LQDCO_ANTCA (
   NU_SQNCL_ARQUIVO_RECEBIDO DECIMAL(19)           
      not null,
   NU_SEQUENCIAL_LINHA_DETALHE DECIMAL(19)           
      not null,
   NU_CREDITO           DECIMAL(19, 0),
   NU_CPF_CLIENTE       DECIMAL(11)           
      not null,
   NU_CONTRATO_CLIENTE_IF CHAR(30)              
      not null,
   NO_CLIENTE           CHAR(40)              
      not null,
   NU_SITUACAO_CONTRATO_IF DECIMAL(2)            
      not null,
   DT_LIQUIDACAO        DATE                  
      not null,
   CO_MOTIVO_EVENTO_C3  CHAR(3)               
      not null,
   VR_PRESENTE_CREDITO  DECIMAL(18,2),
   PZ_MEDIO_APOS_LQDCO_ANTECIPADA SMALLINT,
   VR_SLDO_DVDR_ANTES_LQDCO_ANTCA DECIMAL(18,2),
   IC_TIPO_ERRO         SMALLINT              
         constraint GEC1C633 check (IC_TIPO_ERRO is null or 
(IC_TIPO_ERRO in (1,2))),
   VR_FUTURO_CREDITO    DECIMAL(18,2),
   constraint GECPK633 primary key (NU_SQNCL_ARQUIVO_RECEBIDO, 
NU_SEQUENCIAL_LINHA_DETALHE)
)
 in GECDB002.GECTS633;

label on table GEC.GECTB633_CREDITO_LQDCO_ANTCA is 
'CREDITO_LIQUIDACAO_ANTECIPADA';
label on column 
GEC.GECTB633_CREDITO_LQDCO_ANTCA.NU_SQNCL_ARQUIVO_RECEBIDO is 
'NU_SEQUENCIAL_ARQUIVO_RECEBIDO';
--==============================================================
-- Index: GEC1I633
--==============================================================
create unique index GEC.GEC1I633 on GEC.GECTB633_CREDITO_LQDCO_ANTCA (
   NU_SQNCL_ARQUIVO_RECEBIDO ASC,
   NU_SEQUENCIAL_LINHA_DETALHE ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I633
--==============================================================
create index GEC.GEC2I633 on GEC.GECTB633_CREDITO_LQDCO_ANTCA (
   NU_CREDITO           ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I633
--==============================================================
create index GEC.GEC3I633 on GEC.GECTB633_CREDITO_LQDCO_ANTCA (
   NU_CPF_CLIENTE       ASC,
   NU_CONTRATO_CLIENTE_IF ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB634_TIPO_INFORMACAO
--==============================================================
create table GEC.GECTB634_TIPO_INFORMACAO (
   NU_TIPO_INFORMACAO   SMALLINT              
      not null,
   DE_TIPO_INFORMACAO   CHAR(50)              
      not null,
   CO_TIPO_INFORMACAO   CHAR(5)               
      not null,
   constraint GECPK634 primary key (NU_TIPO_INFORMACAO)
)
 in GECDB002.GECTS634;

--==============================================================
-- Index: GEC1I634
--==============================================================
create unique index GEC.GEC1I634 on GEC.GECTB634_TIPO_INFORMACAO (
   NU_TIPO_INFORMACAO   ASC
)
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB635_RLTRO_ANTCA_SEM_CBRCO
--==============================================================
create table GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO (
   NU_SEQUENCIAL_RELATORIO DECIMAL(10)           
      not null,
   NU_SEQUENCIAL_DETALHE SMALLINT              
      not null,
   NU_TRANCHE           DECIMAL(8),
   QT_PARCELA_ANTECIPADA DECIMAL(10),
   VR_REMUNERACAO_MNMA_ESPERADA DECIMAL(19,2),
   VR_TTL_RECEBIDO_ANTECIPADO DECIMAL(19,2),
   VR_TTL_EXPCA_RCBR_PRCLA_CMPLR DECIMAL(19,2),
   constraint GECPK635 primary key (NU_SEQUENCIAL_RELATORIO, 
NU_SEQUENCIAL_DETALHE)
)
 in GECDB002.GECTS635;

label on table GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO is 
'RELATORIO_LIQUIDACAO_ANTECIPADA_SEM_COOBRIGACAO';
label on column GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO.QT_PARCELA_ANTECIPADA
 is 'QT_PARCELA_ANTECIPADA_PERIODO';
label on column 
GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO.VR_REMUNERACAO_MNMA_ESPERADA is 
'VR_REMUNERACAO_MINIMA_ESPERADA';
label on column 
GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO.VR_TTL_RECEBIDO_ANTECIPADO is 
'VR_TOTAL_RECEBIDO_ANTECIPADO';
label on column 
GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO.VR_TTL_EXPCA_RCBR_PRCLA_CMPLR is 
'VR_TOTAL_EXPECTATIVA_RECEBER_PARCELA_COMPLEMENTAR';
--==============================================================
-- Index: GEC1I635
--==============================================================
create unique index GEC.GEC1I635 on GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO (

   NU_SEQUENCIAL_RELATORIO ASC,
   NU_SEQUENCIAL_DETALHE ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I635
--==============================================================
create index GEC.GEC2I635 on GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO (
   NU_TRANCHE           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I635
--==============================================================
create index GEC.GEC3I635 on GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO (
   NU_SEQUENCIAL_RELATORIO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB636_GARANTIA_CONTRATO
--==============================================================
create table GEC.GECTB636_GARANTIA_CONTRATO (
   NU_SEQUENCIAL_GERACAO_ARQUIVO DECIMAL(19)           
      not null,
   NU_CREDITO           DECIMAL(19)           
      not null,
   NU_TIPO_REGISTRO     DECIMAL(2)            
      not null,
   NU_SEQUENCIAL_REGISTRO DECIMAL(18)           
      not null,
   NU_TIPO_INFORMACAO   SMALLINT              
      not null,
   NU_ORDEM_PRIORIDADE  DECIMAL(3)            
      not null,
   VR_MONETARIO_INFORMACAO DECIMAL(18,2),
   DE_INFORMACAO        CHAR(100),
   constraint GECPK636 primary key (NU_SEQUENCIAL_GERACAO_ARQUIVO, 
NU_CREDITO, NU_TIPO_REGISTRO, NU_SEQUENCIAL_REGISTRO)
)
 in GECDB002.GECTS636;

label on table GEC.GECTB636_GARANTIA_CONTRATO is 'GARANTIA_CONTRATO';

--==============================================================
-- Index: GEC1I636
--==============================================================
create unique index GEC.GEC1I636 on GEC.GECTB636_GARANTIA_CONTRATO (
   NU_SEQUENCIAL_GERACAO_ARQUIVO ASC,
   NU_CREDITO           ASC,
   NU_TIPO_REGISTRO     ASC,
   NU_SEQUENCIAL_REGISTRO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase yes
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB637_ETTRA_ARQVO_IMPORTADO
--==============================================================
create table GEC.GECTB637_ETTRA_ARQVO_IMPORTADO (
   NU_SQNCL_ARQUIVO_IMPORTADO DECIMAL(18)           
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
   NU_SITUACAO_VALIDACAO SMALLINT              
      not null,
   QT_ERRO_ENCONTRADO   INTEGER,
   NU_PRODUTO           SMALLINT,
   NU_CONTROLE_EXECUCAO_ROTINA INTEGER,
   CO_ROTINA_PROCESSAMENTO CHAR(8),
   NU_IF                SMALLINT,
   NU_PERIODO_MOVIMENTO_ARQUIVO INTEGER               
      not null,
   CO_TIPO_MOVIMENTO_ARQUIVO CHAR(1)               
      not null with default 'R',
   IC_SITUACAO_ENVIO_ARQUIVO SMALLINT              
      not null with default 1
         constraint GEC1C637 check (IC_SITUACAO_ENVIO_ARQUIVO in (1,2,
3)),
   QT_REGISTRO_PROCESSADO INTEGER,
   VR_TOTAL_SALDO_DEVEDOR DECIMAL(17,2),
   TS_ENVIO_ARQUIVO     TIMESTAMP,
   QT_CONTRATO_PROCESSADO INTEGER,
   constraint GECPK637 primary key (NU_SQNCL_ARQUIVO_IMPORTADO)
)
 in GECDB002.GECTS637;

label on table GEC.GECTB637_ETTRA_ARQVO_IMPORTADO is 
'ESTRUTURA_ARQUIVO_SIAPC_IMPORTADO';
label on column 
GEC.GECTB637_ETTRA_ARQVO_IMPORTADO.NU_SQNCL_ARQUIVO_IMPORTADO is 
'NU_SEQUENCIAL_ARQUIVO_SIAPC_IMPORTADO';
label on column 
GEC.GECTB637_ETTRA_ARQVO_IMPORTADO.CO_ROTINA_PROCESSAMENTO is 
'CO_ROTINA_PROCESSAMENTO_SISTEMA';
--==============================================================
-- Index: GEC1I637
--==============================================================
create unique index GEC.GEC1I637 on GEC.GECTB637_ETTRA_ARQVO_IMPORTADO (

   NU_SQNCL_ARQUIVO_IMPORTADO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB638_DTLHE_ARQVO_IMPORTADO
--==============================================================
create table GEC.GECTB638_DTLHE_ARQVO_IMPORTADO (
   NU_SQNCL_ARQUIVO_IMPORTADO DECIMAL(18)           
      not null,
   NU_LINHA_ARQUIVO     INTEGER               
      not null,
   DE_LINHA_DETALHE     VARCHAR(1000),
   CO_TIPO_REGISTRO     CHAR(2)               
      not null,
   IC_LINHA_VALIDADA    CHAR(1)               
      not null with default 'N'
         constraint GEC1C638 check (IC_LINHA_VALIDADA in ('S','N')),
   NU_PERIODO_MOVIMENTO_ARQUIVO INTEGER               
      not null with default 0,
   constraint GECPK638 primary key (NU_SQNCL_ARQUIVO_IMPORTADO, 
NU_LINHA_ARQUIVO)
)
 in GECDB002.GECTS638
partition by (NU_PERIODO_MOVIMENTO_ARQUIVO
asc)
(
 partition 1 ending at  (202105),
 partition 2 ending at (202106),
 partition 3 ending at (202107),
 partition 4 ending at (202108),
 partition 5 ending at (202109),
 partition 6 ending at (202110),
 partition 7 ending at (202111),
 partition 8 ending at (202112),
 partition 9 ending at (202201),
 partition 10 ending at (202202),
 partition 11 ending at (202203),
 partition 12 ending at (202204),
 partition 13 ending at (202205),
 partition 14 ending at (202206),
 partition 15 ending at (202207),
 partition 16 ending at (202208),
 partition 17 ending at (202209),
 partition 18 ending at (202210),
 partition 19 ending at (202211),
 partition 20 ending at (202212),
 partition 21 ending at (202301),
 partition 22 ending at (202302),
 partition 23 ending at (202303),
 partition 24 ending at (202304),
 partition 25 ending at (202305),
 partition 26 ending at (202306),
 partition 27 ending at (202307),
 partition 28 ending at (202308),
 partition 29 ending at (202309),
 partition 30 ending at (202310),
 partition 31 ending at (202311),
 partition 32 ending at (202312),
 partition 33 ending at (202401),
 partition 34 ending at (202402),
 partition 35 ending at (202403),
 partition 36 ending at (202404),
 partition 37 ending at (202405),
 partition 38 ending at (202406),
 partition 39 ending at (202407),
 partition 40 ending at (202408),
 partition 41 ending at (202409),
 partition 42 ending at (202410),
 partition 43 ending at (202411),
 partition 44 ending at (202412),
 partition 45 ending at (202501),
 partition 46 ending at (202502),
 partition 47 ending at (202503),
 partition 48 ending at (202504),
 partition 49 ending at (202505),
 partition 50 ending at (202506),
 partition 51 ending at (202507),
 partition 52 ending at (202508),
 partition 53 ending at (202509),
 partition 54 ending at (202510),
 partition 55 ending at (202511),
 partition 56 ending at (202512),
 partition 57 ending at (202601),
 partition 58 ending at (202602),
 partition 59 ending at (202603),
 partition 60 ending at (202604)
);

label on table GEC.GECTB638_DTLHE_ARQVO_IMPORTADO is 
'DETALHE_ARQUIVO_SIAPC_IMPORTADO';
label on column 
GEC.GECTB638_DTLHE_ARQVO_IMPORTADO.NU_SQNCL_ARQUIVO_IMPORTADO is 
'NU_SEQUENCIAL_ARQUIVO_SIAPC_IMPORTADO';
label on column 
GEC.GECTB638_DTLHE_ARQVO_IMPORTADO.NU_PERIODO_MOVIMENTO_ARQUIVO is 
'NU_PERIODO_MOVIMENTO_ARQUIVO_IMPORTADO';
--==============================================================
-- Index: GEC1I638
--==============================================================
create unique index GEC.GEC1I638 on GEC.GECTB638_DTLHE_ARQVO_IMPORTADO (

   NU_SQNCL_ARQUIVO_IMPORTADO ASC,
   NU_LINHA_ARQUIVO     ASC
)
cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I638
--==============================================================
create index GEC.GEC2I638 on GEC.GECTB638_DTLHE_ARQVO_IMPORTADO (
   NU_SQNCL_ARQUIVO_IMPORTADO ASC
)
not cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 129600
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB639_TIPO_ERRO_VALIDACAO
--==============================================================
create table GEC.GECTB639_TIPO_ERRO_VALIDACAO (
   NU_SEQUENCIAL_TIPO_ERRO DECIMAL(18)           
      not null,
   DE_TIPO_ERRO         VARCHAR(150)          
      not null,
   CO_TIPO_ERRO         char(5)               
      not null,
   IC_SEVERIDADE        char(1)               
      not null
         constraint GEC1C639 check (IC_SEVERIDADE in ('S','N')),
   CO_TIPO_REGISTRO     CHAR(2)               
      not null,
   constraint GECPK639 primary key (NU_SEQUENCIAL_TIPO_ERRO)
)
 in GECDB002.GECTS639;

label on table GEC.GECTB639_TIPO_ERRO_VALIDACAO is 
'TIPO_ERRO_VALIDACAO_ARQUIVO_SIAPC';

--==============================================================
-- Index: GEC1I639
--==============================================================
create unique index GEC.GEC1I639 on GEC.GECTB639_TIPO_ERRO_VALIDACAO (
   NU_SEQUENCIAL_TIPO_ERRO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB640_ERRO_VALIDACAO
--==============================================================
create table GEC.GECTB640_ERRO_VALIDACAO (
   NU_SQNCL_ARQUIVO_IMPORTADO DECIMAL(18)           
      not null,
   NU_LINHA_ARQUIVO_ERRO INTEGER               
      not null,
   NU_SEQUENCIAL_ERRO   INTEGER               
      not null,
   NU_TIPO_ERRO_ENCONTRADO DECIMAL(18)           
      not null,
   NU_PERIODO_MOVIMENTO_ARQUIVO INTEGER               
      not null with default 0,
   constraint GECPK640 primary key (NU_SQNCL_ARQUIVO_IMPORTADO, 
NU_LINHA_ARQUIVO_ERRO, NU_SEQUENCIAL_ERRO)
)
 in GECDB002.GECTS640;

label on table GEC.GECTB640_ERRO_VALIDACAO is 
'ERRO_VALIDACAO_ARQUIVO_SIAPC';
label on column GEC.GECTB640_ERRO_VALIDACAO.NU_SQNCL_ARQUIVO_IMPORTADO 
is 'NU_SEQUENCIAL_ARQUIVO_SIAPC_IMPORTADO';
label on column GEC.GECTB640_ERRO_VALIDACAO.NU_PERIODO_MOVIMENTO_ARQUIVO
 is 'NU_PERIODO_MOVIMENTO_ARQUIVO_IMPORTADO';
--==============================================================
-- Index: GEC1I640
--==============================================================
create unique index GEC.GEC1I640 on GEC.GECTB640_ERRO_VALIDACAO (
   NU_SQNCL_ARQUIVO_IMPORTADO ASC,
   NU_LINHA_ARQUIVO_ERRO ASC,
   NU_SEQUENCIAL_ERRO   ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB641_PREMIO_PERFORMANCE
--==============================================================
create table GEC.GECTB641_PREMIO_PERFORMANCE (
   NU_SEQUENCIAL_PREMIO DECIMAL(18)           
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_IF                SMALLINT              
      not null,
   DT_REFERENCIA        DATE                  
      not null,
   PC_TAXA_AQUISICAO    DECIMAL(15,5),
   QT_TOTAL_MES_CONTRATADO SMALLINT,
   PZ_DECORRIDO         SMALLINT,
   VR_PERDA_ESPERADA_AQUISICAO DECIMAL(18,2),
   VR_PERDA_MAXIMA_AQUISICAO DECIMAL(18,2),
   PC_PERDA_INCRL_AQUISICAO DECIMAL(15,5),
   VR_PERDA_INCRL_AQUISICAO DECIMAL(18,2),
   VR_PERDA_MAXIMA_POTENCIAL DECIMAL(18,2),
   VR_PERDA_REALIZADA   DECIMAL(18,2),
   VR_PERDA_ESPDA_REFERENCIA DECIMAL(18,2),
   VR_PERDA_MAXIMA_REFERENCIA DECIMAL(18,2),
   PC_PERDA_INCRL_REFERENCIA DECIMAL(15,5),
   VR_PERDA_INCRL_REFERENCIA DECIMAL(18,2),
   VR_PREMIO_PERFORMANCE DECIMAL(18,2),
   VR_PROVISAO_ACUMULADA DECIMAL(18,2),
   VR_PASSIVEL_LIBERACAO DECIMAL(18,2),
   VR_LIBERADO          DECIMAL(18,2),
   DT_PAGAMENTO_LIBERADO DATE,
   NU_MODELO_PREMIO_PERFORMANCE SMALLINT              
      not null with default 1,
   VR_ANTECIPACAO       DECIMAL(18, 2),
   VR_INADIMPENCIA      DECIMAL(18, 2),
   constraint GECPK641 primary key (NU_SEQUENCIAL_PREMIO)
)
 in GECDB002.GECTS641;

label on table GEC.GECTB641_PREMIO_PERFORMANCE is 'PREMIO_PERFORMANCE';

label on column GEC.GECTB641_PREMIO_PERFORMANCE.NU_IF is 
'NU_INSTITUICAO_FINANCEIRA';
label on column GEC.GECTB641_PREMIO_PERFORMANCE.PC_PERDA_INCRL_AQUISICAO
 is 'PC_PERDA_INCREMENTAL_AQUISICAO';
label on column GEC.GECTB641_PREMIO_PERFORMANCE.VR_PERDA_INCRL_AQUISICAO
 is 'VR_PERDA_INCREMENTAL_AQUISICAO';
label on column 
GEC.GECTB641_PREMIO_PERFORMANCE.VR_PERDA_ESPDA_REFERENCIA is 
'VR_PERDA_ESPERADA_REFERENCIA';
label on column 
GEC.GECTB641_PREMIO_PERFORMANCE.PC_PERDA_INCRL_REFERENCIA is 
'PC_PERDA_INCREMENTAL_REFERENCIA';
label on column 
GEC.GECTB641_PREMIO_PERFORMANCE.VR_PERDA_INCRL_REFERENCIA is 
'VR_PERDA_INCREMENTAL_REFERENCIA';
--==============================================================
-- Index: GEC1I641
--==============================================================
create unique index GEC.GEC1I641 on GEC.GECTB641_PREMIO_PERFORMANCE (
   NU_SEQUENCIAL_PREMIO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I641
--==============================================================
create index GEC.GEC2I641 on GEC.GECTB641_PREMIO_PERFORMANCE (
   NU_TRANCHE           ASC,
   NU_IF                ASC,
   NU_MODELO_PREMIO_PERFORMANCE ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB642_TED_PRMO_PERFORMANCE
--==============================================================
create table GEC.GECTB642_TED_PRMO_PERFORMANCE (
   NU_SEQUENCIAL_PREMIO DECIMAL(18)           
      not null,
   CO_NUOP              CHAR(25)              
      not null,
   constraint GECPK642 primary key (NU_SEQUENCIAL_PREMIO, CO_NUOP)
)
 in GECDB002.GECTS642;

label on table GEC.GECTB642_TED_PRMO_PERFORMANCE is 
'TED_PREMIO_PERFORMANCE';
label on column GEC.GECTB642_TED_PRMO_PERFORMANCE.CO_NUOP is 
'CO_NUMERO_OPERACAO';
--==============================================================
-- Index: GEC1I642
--==============================================================
create unique index GEC.GEC1I642 on GEC.GECTB642_TED_PRMO_PERFORMANCE (

   NU_SEQUENCIAL_PREMIO ASC,
   CO_NUOP              ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB643_MAPA_INDMA_TRANCHE
--==============================================================
create table GEC.GECTB643_MAPA_INDMA_TRANCHE (
   NU_SQNCL_MAPA_TRANCHE DECIMAL(18)           
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   DT_REFERENCIA        DATE                  
      not null,
   QT_ATUAL_CONTRATO    INTEGER,
   VR_SALDO_DEVEDOR     DECIMAL(18,2),
   constraint GECPK643 primary key (NU_SQNCL_MAPA_TRANCHE)
)
 in GECDB002.GECTS643;

label on table GEC.GECTB643_MAPA_INDMA_TRANCHE is 
'MAPA_INADIMPLENCIA_POR_TRANCHE';
label on column GEC.GECTB643_MAPA_INDMA_TRANCHE.NU_SQNCL_MAPA_TRANCHE is
 'NU_SEQUENCIAL_MAPA_TRANCHE';
--==============================================================
-- Index: GEC1I643
--==============================================================
create unique index GEC.GEC1I643 on GEC.GECTB643_MAPA_INDMA_TRANCHE (
   NU_SQNCL_MAPA_TRANCHE ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB644_FAIXA_ATRASO_INDMA
--==============================================================
create table GEC.GECTB644_FAIXA_ATRASO_INDMA (
   NU_SEQUENCIAL_FAIXA  INTEGER               
      not null,
   DE_FAIXA             CHAR(200)             
      not null,
   NU_LIMITE_SUPERIOR   SMALLINT              
      not null,
   NU_LIMITE_INFERIOR   SMALLINT              
      not null,
   constraint GECPK644 primary key (NU_SEQUENCIAL_FAIXA)
)
 in GECDB002.GECTS644;

label on table GEC.GECTB644_FAIXA_ATRASO_INDMA is 
'FAIXA_ATRASO_INADIMPLENCIA';

--==============================================================
-- Index: GEC1I644
--==============================================================
create unique index GEC.GEC1I644 on GEC.GECTB644_FAIXA_ATRASO_INDMA (
   NU_SEQUENCIAL_FAIXA  ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB645_INADIMPLENCIA_TRANCHE
--==============================================================
create table GEC.GECTB645_INADIMPLENCIA_TRANCHE (
   NU_SEQUENCIAL_MAPA_TRANCHE DECIMAL(18)           
      not null,
   NU_SEQUENCIAL_FAIXA  INTEGER               
      not null,
   QT_CONTRATO_ATRASADO INTEGER,
   PC_SALDO_ATRASO      DECIMAL(18,5),
   VR_SALDO_ATRASO      DECIMAL(18,2),
   constraint GECPK645 primary key (NU_SEQUENCIAL_MAPA_TRANCHE, 
NU_SEQUENCIAL_FAIXA)
)
 in GECDB002.GECTS645;

label on table GEC.GECTB645_INADIMPLENCIA_TRANCHE is 
'INADIMPLENCIA_POR_TRANCHE';

--==============================================================
-- Index: GEC1I645
--==============================================================
create unique index GEC.GEC1I645 on GEC.GECTB645_INADIMPLENCIA_TRANCHE (

   NU_SEQUENCIAL_MAPA_TRANCHE ASC,
   NU_SEQUENCIAL_FAIXA  ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB646_MPA_INDMA_CONVENENTE
--==============================================================
create table GEC.GECTB646_MPA_INDMA_CONVENENTE (
   NU_SEQUENCIAL_CONVENENTE decimal(5)            
      not null,
   DT_REFERENCIA        DATE                  
      not null,
   QT_ATUAL_CONTRATO    INTEGER,
   VR_SALDO_DEVEDOR     DECIMAL(18,2),
   QT_CONTRATO_FAIXA_ATRASO_31_60 INTEGER,
   PC_SALDO_FAIXA_ATRASO_31_60 DECIMAL(18,5),
   VR_SALDO_FAIXA_ATRASO_31_60 DECIMAL(18,2),
   QT_CONTRATO_ATRASO_MAIOR_60 INTEGER,
   PC_SALDO_ATRASO_MAIOR_60 DECIMAL(18,5),
   VR_SALDO_ATRASO_MAIOR_60 DECIMAL(18,2),
   constraint GECPK646 primary key (NU_SEQUENCIAL_CONVENENTE, 
DT_REFERENCIA)
)
 in GECDB002.GECTS646;

label on table GEC.GECTB646_MPA_INDMA_CONVENENTE is 
'MAPA_INADIMPLENCIA_POR_CONVENENTE';

--==============================================================
-- Index: GEC1I646
--==============================================================
create unique index GEC.GEC1I646 on GEC.GECTB646_MPA_INDMA_CONVENENTE (

   NU_SEQUENCIAL_CONVENENTE ASC,
   DT_REFERENCIA        ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB647_INDMA_TIPO_VCLO_COTA
--==============================================================
create table GEC.GECTB647_INDMA_TIPO_VCLO_COTA (
   NU_SEQUENCIAL_DETALHE_MAPA DECIMAL(18)           
      not null
      generated ? as identity,
   NU_SEQUENCIAL_MAPA_TRANCHE DECIMAL(18)           
      not null,
   CO_TIPO_VEICULO      CHAR(1)               
      not null,
   NU_SEQUENCIAL_FAIXA  INTEGER               
      not null,
   IC_COTA_FINANCIAMENTO CHAR(1)               
      not null
         constraint GEC1C647 check (IC_COTA_FINANCIAMENTO in ('1','2')),

   QT_CONTRATO_ATRASADO INTEGER,
   PC_SALDO_ATRASADO    DECIMAL(18,5),
   VR_SALDO_ATRASADO    DECIMAL(18,2),
   constraint GECPK647 primary key (NU_SEQUENCIAL_DETALHE_MAPA)
)
 in GECDB002.GECTS647;

label on table GEC.GECTB647_INDMA_TIPO_VCLO_COTA is 
'INADIMPLENCIA_TIPO_VEICULO_COTA';

--==============================================================
-- Index: GEC1I647
--==============================================================
create unique index GEC.GEC1I647 on GEC.GECTB647_INDMA_TIPO_VCLO_COTA (

   NU_SEQUENCIAL_DETALHE_MAPA ASC
)
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I647
--==============================================================
create unique index GEC.GEC2I647 on GEC.GECTB647_INDMA_TIPO_VCLO_COTA (

   NU_SEQUENCIAL_MAPA_TRANCHE ASC,
   CO_TIPO_VEICULO      ASC,
   NU_SEQUENCIAL_FAIXA  ASC,
   IC_COTA_FINANCIAMENTO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I647
--==============================================================
create index GEC.GEC3I647 on GEC.GECTB647_INDMA_TIPO_VCLO_COTA (
   NU_SEQUENCIAL_MAPA_TRANCHE ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 48 SECQTY 48
    ERASE  NO
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB648_FUNCIONALIDADE_ADTDA
--==============================================================
create table GEC.GECTB648_FUNCIONALIDADE_ADTDA (
   NU_FUNCIONALIDADE_ADTA SMALLINT              
      not null,
   DE_FUNCIONALIDADE_ADTA VARCHAR(100)          
      not null,
   constraint GECPK648 primary key (NU_FUNCIONALIDADE_ADTA)
)
 in GECDB002.GECTS648;

label on table GEC.GECTB648_FUNCIONALIDADE_ADTDA is 
'FUNCIONALIDADE_AUDITADA';

--==============================================================
-- Index: GEC1I648
--==============================================================
create unique index GEC.GEC1I648 on GEC.GECTB648_FUNCIONALIDADE_ADTDA (

   NU_FUNCIONALIDADE_ADTA ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB649_DTLHE_RLTRO_REPASSE
--==============================================================
create table GEC.GECTB649_DTLHE_RLTRO_REPASSE (
   NU_SEQUENCIAL_DETALHE DECIMAL(18)           
      not null
      generated ? as identity,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_SEQUENCIAL_RELATORIO DECIMAL(10)           
      not null,
   DT_REPASSE           DATE                  
      not null,
   VR_PRESTACAO         DECIMAL(18,2),
   VR_RECEBIDO          DECIMAL(18,2),
   VR_ENCARGO           DECIMAL(18,2),
   VR_DIFERENCA_ATUALIZACAO DECIMAL(18,2),
   VR_REPASSE           DECIMAL(18,2),
   constraint GECPK649 primary key (NU_SEQUENCIAL_DETALHE)
)
 in GECDB002.GECTS649;

label on table GEC.GECTB649_DTLHE_RLTRO_REPASSE is 
'DETALHE_RELATORIO_REPASSE';

--==============================================================
-- Index: GEC1I649
--==============================================================
create unique index GEC.GEC1I649 on GEC.GECTB649_DTLHE_RLTRO_REPASSE (
   NU_SEQUENCIAL_DETALHE ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I649
--==============================================================
create unique index GEC.GEC2I649 on GEC.GECTB649_DTLHE_RLTRO_REPASSE (
   NU_SEQUENCIAL_RELATORIO ASC,
   NU_TRANCHE           ASC,
   DT_REPASSE           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB650_FLXO_SLDO_DEVEDOR_IF
--==============================================================
create table GEC.GECTB650_FLXO_SLDO_DEVEDOR_IF (
   NU_IF                SMALLINT              
      not null,
   DT_REFERENCIA        DATE                  
      not null,
   CO_SOLICITANTE       CHAR(10)              
      not null,
   CO_IP_ESTACAO        CHAR(20)              
      not null,
   TS_INCLUSAO          TIMESTAMP             
      not null,
   VR_CODITEM_9017      DECIMAL(19,2),
   VR_CODITEM_9018      DECIMAL(19,2),
   VR_CODITEM_9020      DECIMAL(19,2),
   VR_CODITEM_9021      DECIMAL(19,2),
   constraint GECPK650 primary key (NU_IF, DT_REFERENCIA)
)
 in GECDB002.GECTS650;

label on table GEC.GECTB650_FLXO_SLDO_DEVEDOR_IF is 
'FLUXO_SALDO_CONTRATO_INSTITUICAO_FINANCEIRA';
label on column GEC.GECTB650_FLXO_SLDO_DEVEDOR_IF.NU_IF is 
'NU_INSTITUICAO_FINANCEIRA';
--==============================================================
-- Index: GEC1I650
--==============================================================
create unique index GEC.GEC1I650 on GEC.GECTB650_FLXO_SLDO_DEVEDOR_IF (

   NU_IF                ASC,
   DT_REFERENCIA        ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB651_FLUXO_SALDO_CREDITO
--==============================================================
create table GEC.GECTB651_FLUXO_SALDO_CREDITO (
   NU_CREDITO           DECIMAL(19)           
      not null,
   DT_REFERENCIA        date                  
      not null,
   VR_SLDO_DVDR_ATRASO_INFERIOR DECIMAL(18,2),
   VR_PRSTE_ATRASO_INFERIOR DECIMAL(18,2),
   VR_FLXO_FTRO_ATRASO_INFERIOR DECIMAL(18,2),
   VR_SALDO_DEVEDOR     DECIMAL(18,2),
   VR_VALOR_PRESENTE    DECIMAL(18,2),
   VR_FLUXO_FUTURO      DECIMAL(18,2),
   VR_SLDO_DVDR_ATRASO_SUPERIOR DECIMAL(18,2),
   VR_PRSTE_ATRASO_SUPERIOR DECIMAL(18,2),
   VR_FLXO_FTRO_ATRASO_SUPERIOR DECIMAL(18,2),
   constraint GECPK651 primary key (NU_CREDITO, DT_REFERENCIA)
)
 in GECDB002.GECTS651;

label on table GEC.GECTB651_FLUXO_SALDO_CREDITO is 'FLUXO_SALDO_CREDITO'
;
label on column 
GEC.GECTB651_FLUXO_SALDO_CREDITO.VR_SLDO_DVDR_ATRASO_INFERIOR is 
'VR_SALDO_DEVEDOR_ATRASO_INFERIOR';
label on column 
GEC.GECTB651_FLUXO_SALDO_CREDITO.VR_PRSTE_ATRASO_INFERIOR is 
'VR_PRESENTE_ATRASO_INFERIOR';
label on column 
GEC.GECTB651_FLUXO_SALDO_CREDITO.VR_FLXO_FTRO_ATRASO_INFERIOR is 
'VR_FLUXO_FUTURO_ATRASO_INFERIOR';
--==============================================================
-- Index: GEC1I651
--==============================================================
create unique index GEC.GEC1I651 on GEC.GECTB651_FLUXO_SALDO_CREDITO (
   NU_CREDITO           ASC,
   DT_REFERENCIA        ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB652_TIPO_FLUXO
--==============================================================
create table GEC.GECTB652_TIPO_FLUXO (
   CO_TIPO_FLUXO        CHAR(1)               
      not null,
   DE_TIPO_FLUXO        CHAR(30)              
      not null,
   constraint GECPK652 primary key (CO_TIPO_FLUXO)
)
 in GECDB002.GECTS652;

label on table GEC.GECTB652_TIPO_FLUXO is 'TIPO_FLUXO';

--==============================================================
-- Index: GEC1I652
--==============================================================
create unique index GEC.GEC1I652 on GEC.GECTB652_TIPO_FLUXO (
   CO_TIPO_FLUXO        ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB653_SITUACAO_VLDCO_ARQVO
--==============================================================
create table GEC.GECTB653_SITUACAO_VLDCO_ARQVO (
   NU_SITUACAO_VALIDACAO SMALLINT              
      not null,
   DE_SITUACAO_VALIDACAO CHAR(30)              
      not null,
   constraint GECPK653 primary key (NU_SITUACAO_VALIDACAO)
)
 in GECDB002.GECTS653;

label on table GEC.GECTB653_SITUACAO_VLDCO_ARQVO is 
'SITUACAO_VALIDACAO_ARQUIVO';

--==============================================================
-- Index: GEC1I653
--==============================================================
create unique index GEC.GEC1I653 on GEC.GECTB653_SITUACAO_VLDCO_ARQVO (

   NU_SITUACAO_VALIDACAO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB654_FLUXO_RCBMO_CONVENIO
--==============================================================
create table GEC.GECTB654_FLUXO_RCBMO_CONVENIO (
   DT_REFERENCIA        DATE                  
      not null,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_SEQUENCIAL_CONVENENTE decimal(5)            
      not null,
   QT_CREDITO_ATIVO     DECIMAL(10),
   VR_PREVISTO_RECEBER  DECIMAL(18,2),
   VR_RECEBIDO          DECIMAL(18,2),
   VR_LIQUIDACAO_ANTECIPADA DECIMAL(18,2),
   constraint GECPK654 primary key (DT_REFERENCIA, NU_TRANCHE, 
NU_SEQUENCIAL_CONVENENTE)
)
 in GECDB002.GECTS654;

label on table GEC.GECTB654_FLUXO_RCBMO_CONVENIO is 
'FLUXO_RECEBIMENTO_CONVENIO';

--==============================================================
-- Index: GEC1I654
--==============================================================
create unique index GEC.GEC1I654 on GEC.GECTB654_FLUXO_RCBMO_CONVENIO (

   DT_REFERENCIA        ASC,
   NU_TRANCHE           ASC,
   NU_SEQUENCIAL_CONVENENTE ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I654
--==============================================================
create index GEC.GEC2I654 on GEC.GECTB654_FLUXO_RCBMO_CONVENIO (
   NU_SEQUENCIAL_CONVENENTE ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 129600 SECQTY 12960
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I654
--==============================================================
create index GEC.GEC3I654 on GEC.GECTB654_FLUXO_RCBMO_CONVENIO (
   NU_TRANCHE           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB655_FLUXO_RECEBIMENTO_VEICULO
--==============================================================
create table GEC.GECTB655_FLUXO_RECEBIMENTO_VEICULO (
   CO_TIPO_VEICULO      CHAR(1)               
      not null,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   DT_REFERENCIA        DATE                  
      not null,
   QT_CREDITO_ATIVO     DECIMAL(10),
   VR_PREVISTO_RECEBER  DECIMAL(18,2),
   VR_RECEBIDO          DECIMAL(18,2),
   VR_LIQUIDACAO_ANTECIPADA DECIMAL(18,2),
   constraint GECPK655 primary key (CO_TIPO_VEICULO, NU_TRANCHE, 
DT_REFERENCIA)
)
 in GECDB002.GECTS655;

label on table GEC.GECTB655_FLUXO_RECEBIMENTO_VEICULO is 
'FLUXO_RECEBIMENTO_VEICULO';

--==============================================================
-- Index: GEC1I655
--==============================================================
create unique index GEC.GEC1I655 on 
GEC.GECTB655_FLUXO_RECEBIMENTO_VEICULO (
   CO_TIPO_VEICULO      ASC,
   NU_TRANCHE           ASC,
   DT_REFERENCIA        ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I655
--==============================================================
create index GEC.GEC2I655 on GEC.GECTB655_FLUXO_RECEBIMENTO_VEICULO (
   NU_TRANCHE           ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 129600
    secqty 12960
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I655
--==============================================================
create index GEC.GEC3I655 on GEC.GECTB655_FLUXO_RECEBIMENTO_VEICULO (
   CO_TIPO_VEICULO      ASC
)
USING STOGROUP SGDGEC00
    PRIQTY 129600 SECQTY 12960
    ERASE  NO
    FREEPAGE 0 PCTFREE 0
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB656_SITUACAO_PARCELA_C3
--==============================================================
create table GEC.GECTB656_SITUACAO_PARCELA_C3 (
   NU_ARQUIVO           DECIMAL(18)           
      not null,
   NU_SEQUENCIAL_RESERVA INTEGER               
      not null,
   NU_CREDITO           DECIMAL(19)           
      not null,
   NU_PARCELA_CREDITO   DECIMAL(18)           
      not null,
   IC_SITUACAO_PARCELA_C3 CHAR(1)               
      not null with default 'A'
         constraint GEC1C656 check (IC_SITUACAO_PARCELA_C3 in ('A','R'))
,
   constraint GECPK656 primary key (NU_ARQUIVO, NU_SEQUENCIAL_RESERVA, 
NU_CREDITO, NU_PARCELA_CREDITO)
)
 in GECDB002.GECTS656;

label on table GEC.GECTB656_SITUACAO_PARCELA_C3 is 'SITUACAO_PARCELA_C3'
;

--==============================================================
-- Index: GEC1I656
--==============================================================
create unique index GEC.GEC1I656 on GEC.GECTB656_SITUACAO_PARCELA_C3 (
   NU_ARQUIVO           ASC,
   NU_SEQUENCIAL_RESERVA ASC,
   NU_CREDITO           ASC,
   NU_PARCELA_CREDITO   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I656
--==============================================================
create index GEC.GEC2I656 on GEC.GECTB656_SITUACAO_PARCELA_C3 (
   NU_PARCELA_CREDITO   ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB657_CMPMO_CANCELAMENTO
--==============================================================
create table GEC.GECTB657_CMPMO_CANCELAMENTO (
   NU_TRANCHE           DECIMAL(8)            
      not null,
   TS_CANCELAMENTO      TIMESTAMP             
      not null,
   DE_RESUMO_CANCELAMENTO VARCHAR(100),
   DE_CMPMO_OBSRO_CANCELAMENTO VARCHAR(1000),
   NU_MTRCA_RSPNL_CANCELAMENTO INTEGER               
      not null,
   CO_IP_ESTACAO_RESPONSAVEL CHAR(16)              
      not null,
   constraint GECPK657 primary key (NU_TRANCHE, TS_CANCELAMENTO)
)
 in GECDB002.GECTS657;

label on table GEC.GECTB657_CMPMO_CANCELAMENTO is 
'COMPLEMENTO_CANCELAMENTO_TRANCHE';
label on column 
GEC.GECTB657_CMPMO_CANCELAMENTO.DE_CMPMO_OBSRO_CANCELAMENTO is 
'DE_COMPLEMENTO_OBSERVACAO_CANCELAMENTO';
label on column 
GEC.GECTB657_CMPMO_CANCELAMENTO.NU_MTRCA_RSPNL_CANCELAMENTO is 
'NU_MATRICULA_RESPONSAVEL_CANCELAMENTO';
--==============================================================
-- Index: GEC1I657
--==============================================================
create unique index GEC.GEC1I657 on GEC.GECTB657_CMPMO_CANCELAMENTO (
   NU_TRANCHE           ASC,
   TS_CANCELAMENTO      ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB658_SITUACAO_ARQUIVO
--==============================================================
create table GEC.GECTB658_SITUACAO_ARQUIVO (
   NU_SITUACAO_ARQUIVO  SMALLINT              
      not null,
   DE_SITUACAO_ARQUIVO  CHAR(50)              
      not null,
   constraint GECPK658 primary key (NU_SITUACAO_ARQUIVO)
)
 in GECDB002.GECTS658;

label on table GEC.GECTB658_SITUACAO_ARQUIVO is 
'SITUACAO_ARQUIVO_REGISTRADORA';

--==============================================================
-- Index: GEC1I658
--==============================================================
create unique index GEC.GEC1I658 on GEC.GECTB658_SITUACAO_ARQUIVO (
   NU_SITUACAO_ARQUIVO  ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB659_SITUACAO_VINCULACAO
--==============================================================
create table GEC.GECTB659_SITUACAO_VINCULACAO (
   NU_SITUACAO_VINCULACAO SMALLINT              
      not null,
   DE_SITUACAO_VINCULACAO CHAR(20)              
      not null,
   constraint GECPK659 primary key (NU_SITUACAO_VINCULACAO)
)
 in GECDB002.GECTS659;

label on table GEC.GECTB659_SITUACAO_VINCULACAO is 'SITUACAO_VINCULACAO'
;

--==============================================================
-- Index: GEC1I659
--==============================================================
create unique index GEC.GEC1I659 on GEC.GECTB659_SITUACAO_VINCULACAO (
   NU_SITUACAO_VINCULACAO ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB660_VNCLO_TRANCHE_RESERVA
--==============================================================
create table GEC.GECTB660_VNCLO_TRANCHE_RESERVA (
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_SITUACAO_VINCULACAO SMALLINT              
      not null,
   QT_CREDITO_NAO_LOCALIZADO DECIMAL(15),
   TS_ATUALIZACAO       TIMESTAMP             
      not null,
   TS_INCLUSAO_VINCULO  TIMESTAMP             
      not null with default,
   constraint GECPK660 primary key (NU_TRANCHE, 
NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO)
)
 in GECDB002.GECTS660;

label on table GEC.GECTB660_VNCLO_TRANCHE_RESERVA is 
'VINCULO_TRANCHE_RESERVA';
label on column GEC.GECTB660_VNCLO_TRANCHE_RESERVA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I660
--==============================================================
create unique index GEC.GEC1I660 on GEC.GECTB660_VNCLO_TRANCHE_RESERVA (

   NU_TRANCHE           ASC,
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB661_VARREDURA_RGSDA
--==============================================================
create table GEC.GECTB661_VARREDURA_RGSDA (
   NU_UNICO_RESERVA     CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_CONTROLE_RESERVA_IF VARCHAR(40)           
      not null,
   NU_IDENTIFICADOR_RESERVA CHAR(10)              
      not null,
   QT_CONTRATO_ACEITO   DECIMAL(12),
   QT_PARCELA_ACEITA    DECIMAL(12),
   QT_CONTRATO_RECUSADO DECIMAL(12),
   QT_PARCELA_RECUSADA  DECIMAL(12),
   NU_TIPO_COOBRIGACAO_CSNRO CHAR(4),
   QT_CREDITO_PREVISTO  DECIMAL(12),
   NU_SQNCL_SLCTO_CANCELAMENTO DECIMAL(18),
   IC_CANCELAMENTO_ACEITO CHAR(1)               
         constraint GEC1C661 check (IC_CANCELAMENTO_ACEITO is null or 
(IC_CANCELAMENTO_ACEITO in ('S','N'))),
   CO_MTVO_RCSA_CANCELAMENTO CHAR(8),
   NU_SITUACAO_RESERVA  SMALLINT,
   constraint GECPK661 primary key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
)
 in GECDB002.GECTS661;

label on table GEC.GECTB661_VARREDURA_RGSDA is 'VARREDURA_REGISTRADORA';

label on column GEC.GECTB661_VARREDURA_RGSDA.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB661_VARREDURA_RGSDA.NU_TIPO_COOBRIGACAO_CSNRO 
is 'NU_TIPO_COOBRIGACAO_CESSIONARIO';
label on column GEC.GECTB661_VARREDURA_RGSDA.NU_SQNCL_SLCTO_CANCELAMENTO
 is 'NU_SEQUENCIAL_SOLICITACAO_CANCELAMENTO_RESERVA';
label on column GEC.GECTB661_VARREDURA_RGSDA.CO_MTVO_RCSA_CANCELAMENTO 
is 'CO_MOTIVO_RECUSA_CANCELAMENTO';
--==============================================================
-- Index: GEC1I661
--==============================================================
create unique index GEC.GEC1I661 on GEC.GECTB661_VARREDURA_RGSDA (
   NU_UNICO_RESERVA     DESC,
   NU_IDNTR_PRTCE_ADMDO DESC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB662_FRMA_PAGAMENTO_RGSDA
--==============================================================
create table GEC.GECTB662_FRMA_PAGAMENTO_RGSDA (
   NU_FORMA_PAGAMENTO_RGSDA SMALLINT              
      not null,
   DE_FORMA_PAGAMENTO_RGSDA VARCHAR(200)          
      not null,
   constraint GECPK662 primary key (NU_FORMA_PAGAMENTO_RGSDA)
)
 in GECDB002.GECTS662;

label on table GEC.GECTB662_FRMA_PAGAMENTO_RGSDA is 
'FORMA_PAGAMENTO_REGISTRADORA';

--==============================================================
-- Index: GEC1I662
--==============================================================
create unique index GEC.GEC1I662 on GEC.GECTB662_FRMA_PAGAMENTO_RGSDA (

   NU_FORMA_PAGAMENTO_RGSDA ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB663_TIPO_PERIODICIDADE
--==============================================================
create table GEC.GECTB663_TIPO_PERIODICIDADE (
   NU_TIPO_PERIODICIDADE DECIMAL(4)            
      not null,
   DE_TIPO_PERIODICIDADE char(50)              
      not null,
   constraint GECPK663 primary key (NU_TIPO_PERIODICIDADE)
)
 in GECDB002.GECTS663;

label on table GEC.GECTB663_TIPO_PERIODICIDADE is 'TIPO_PERIODICIDADE';


--==============================================================
-- Index: GEC1I663
--==============================================================
create unique index GEC.GEC1I663 on GEC.GECTB663_TIPO_PERIODICIDADE (
   NU_TIPO_PERIODICIDADE ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB664_TIPO_REGIME_AMRTO
--==============================================================
create table GEC.GECTB664_TIPO_REGIME_AMRTO (
   NU_TIPO_REGIME_AMORTIZACAO DECIMAL(4)            
      not null,
   DE_TIPO_REGIME_AMORTIZACAO char(50)              
      not null,
   constraint GECPK664 primary key (NU_TIPO_REGIME_AMORTIZACAO)
)
 in GECDB002.GECTS664;

label on table GEC.GECTB664_TIPO_REGIME_AMRTO is 
'TIPO_REGIME_AMORTIZACAO_REGISTRADORA';

--==============================================================
-- Index: GEC1I664
--==============================================================
create unique index GEC.GEC1I664 on GEC.GECTB664_TIPO_REGIME_AMRTO (
   NU_TIPO_REGIME_AMORTIZACAO ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB665_CREDITO_RESERVA_RGSDA
--==============================================================
create table GEC.GECTB665_CREDITO_RESERVA_RGSDA (
   NU_UNICO_RESERVA_REGISTRADORA CHAR
                                         (21)     for SBCS data
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)                for SBCS data
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR
                                   (21)     for SBCS data
      not null,
   IC_CONTRATO_ACEITO   CHAR(1)                for SBCS data
      not null with default 'S',
   IC_CONTRATO_ACEITO_OPERADOR CHAR(1)                for SBCS data
      not null with default 'S',
   CO_CONTRATO_ORIGINAL CHAR
                                (40)     for SBCS data
      not null,
   CO_ISPB_ENTE_CONSIGNANTE CHAR(8)                for SBCS data with 
default NULL,
   CO_ISPB_ORIGINADORA_CONTRATO CHAR(8)                for SBCS data 
with default NULL,
   IC_TIPO_CLIENTE      CHAR(1)                for SBCS data
      not null,
   CO_CPF_CNPJ_CLIENTE_TOMADOR CHAR
                                       (14)     for SBCS data
      not null,
   NU_TIPO_CONTRATO     CHAR(4)                for SBCS data with 
default NULL,
   NU_INDEXADOR         SMALLINT               with default NULL,
   NU_TIPO_TAXA_REFERENCIAL SMALLINT               with default NULL,
   DT_CONTRATACAO       DATE                  
      not null,
   VR_FINANCIADO_CONTRATO DECIMAL(18, 2)        
      not null,
   QT_ORIGINAL_PRCLA_CONTRATADA SMALLINT               with default NULL
,
   VR_PRINCIPAL_CONTRATO DECIMAL(18, 2)         with default NULL,
   VR_ENTRADA_FINANCIAMENTO DECIMAL(18, 2)         with default NULL,
   VR_LIQUIDO_LIBERADO  DECIMAL(18, 2)         with default NULL,
   NU_TPO_RGME_AMRTO_CONTRATADO DECIMAL(4, 0)          with default NULL
,
   NU_FORMA_PAGAMENTO   SMALLINT               with default NULL,
   IC_TIPO_TAXA         CHAR(1)                for SBCS data
      not null,
   PC_TAXA_JURO_EFETIVA_MENSAL DECIMAL(10, 5)         with default NULL,

   PC_TAXA_JURO_EFETIVA_ANUAL DECIMAL(10, 5)         with default NULL,

   VR_CUSTO_EFETIVO_TOTAL DECIMAL(18, 2)         with default NULL,
   NU_BANCO_DEBITO_PARCELA DECIMAL(3, 0)          with default NULL,
   NU_AGENCIA_DEBITO_PARCELA SMALLINT               with default NULL,
   NU_CONTA_CORRENTE_DBTO_PARCELA CHAR(13)               for SBCS data 
with default NULL,
   NU_TIPO_PERIODICIDADE DECIMAL(4, 0)          with default NULL,
   DT_VENCIMENTO_ULTIMA_PARCELA DATE                  
      not null,
   DT_VNCMO_PRIMEIRA_PARCELA DATE                  
      not null,
   PC_INDEXADOR_TAXA_REFERENCIAL DECIMAL(10, 5)         with default 
NULL,
   CO_MOEDA_CONTRATO_PADRAO_CNAB CHAR(2)                for SBCS data 
with default NULL,
   NU_NATUREZA_OPERACAO SMALLINT               with default NULL,
   IC_COBRANCA_JURO_MULTA CHAR(1)                for SBCS data
      not null,
   IC_COBRANCA_JURO_MORA CHAR(1)                for SBCS data
      not null,
   IC_CONTRATO_SITUACAO_PREJUIZO CHAR(1)                for SBCS data
      not null,
   VR_SALDO_PREJUIZO_CONTRATO DECIMAL(18, 2)         with default NULL,

   NU_CREDITO_CONTRATO  DECIMAL(19, 0)         with default NULL,
   constraint GECPK665 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
)
 in GECDB002.GECTS665;

label on table GEC.GECTB665_CREDITO_RESERVA_RGSDA is 
'CREDITO_RESERVA_REGISTRADORA';
label on column GEC.GECTB665_CREDITO_RESERVA_RGSDA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column 
GEC.GECTB665_CREDITO_RESERVA_RGSDA.NU_UNICO_CONTRATO_RGSDA is 
'NU_UNICO_CONTRATO_REGISTRADORA';
label on column 
GEC.GECTB665_CREDITO_RESERVA_RGSDA.QT_ORIGINAL_PRCLA_CONTRATADA is 
'QT_ORIGINAL_PARCELA_CONTRATADA';
label on column 
GEC.GECTB665_CREDITO_RESERVA_RGSDA.NU_TPO_RGME_AMRTO_CONTRATADO is 
'NU_TIPO_REGIME_AMORTIZACAO_CONTRATADO_CLIENTE';
label on column 
GEC.GECTB665_CREDITO_RESERVA_RGSDA.DT_VNCMO_PRIMEIRA_PARCELA is 
'DT_VENCIMENTO_PRIMEIRA_PARCELA';
--==============================================================
-- Index: GEC1I665
--==============================================================
create unique index GEC.GEC1I665 on GEC.GECTB665_CREDITO_RESERVA_RGSDA (

   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_UNICO_CONTRATO_RGSDA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB666_ENCARGO_CONTRATO
--==============================================================
create table GEC.GECTB666_ENCARGO_CONTRATO (
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_REGISTRADORA CHAR(21)              
      not null,
   IC_OBJETO_ENCARGO    CHAR(1)               
      not null
         constraint GEC1C666 check (IC_OBJETO_ENCARGO in ('1','2','3')),

   NU_SEQUENCIAL_ENCARGO SMALLINT              
      not null,
   NU_INDEXADOR         SMALLINT,
   NU_TIPO_TAXA_REFERENCIAL SMALLINT,
   QT_DIA_COBRANCA      SMALLINT,
   IC_TIPO_COBRANCA     CHAR(1)               
      not null
         constraint GEC2C666 check (IC_TIPO_COBRANCA in ('1','2')),
   CO_BASE_CALCULO      CHAR(1),
   VR_COBRANCA          DECIMAL(18,2),
   IC_TIPO_CALCULO      SMALLINT              
      not null default 0
         constraint GEC3C666 check (IC_TIPO_CALCULO in (0,1,2,3)),
   IC_FORMA_CALCULO     SMALLINT              
      not null
         constraint GEC4C666 check (IC_FORMA_CALCULO in (0,1,2)),
   PC_JURO_MULTA        DECIMAL(10,5),
   PC_INDEXADOR         DECIMAL(10,5),
   IC_FINANCIAMENTO     CHAR(1)               
      not null
         constraint GEC5C666 check (IC_FINANCIAMENTO in ('S','N')),
   NU_TIPO_ENCARGO      DECIMAL(4),
   NU_TIPO_PERIODICIDADE DECIMAL(4),
   constraint GECPK666 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_REGISTRADORA, IC_OBJETO_ENCARGO, 
NU_SEQUENCIAL_ENCARGO)
)
 in GECDB002.GECTS666;

label on table GEC.GECTB666_ENCARGO_CONTRATO is 'ENCARGO_CONTRATO';
label on column GEC.GECTB666_ENCARGO_CONTRATO.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I666
--==============================================================
create unique index GEC.GEC1I666 on GEC.GECTB666_ENCARGO_CONTRATO (
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_UNICO_REGISTRADORA ASC,
   IC_OBJETO_ENCARGO    ASC,
   NU_SEQUENCIAL_ENCARGO ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB667_CRITERIO_SELECAO
--==============================================================
create table GEC.GECTB667_CRITERIO_SELECAO (
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   IC_TIPO_VENCIMENTO   CHAR(1)               
      not null default '1'
         constraint GEC1C667 check (IC_TIPO_VENCIMENTO in ('1','2','3'))
,
   NU_TIPO_CONTRATO     SMALLINT,
   QT_DIA_VENCER        DECIMAL(10),
   QT_DIA_VENCIDA       DECIMAL(10),
   IC_TPO_VRCO_VALOR_FINANCEIRO CHAR(1)               
         constraint GEC2C667 check (IC_TPO_VRCO_VALOR_FINANCEIRO is null
 or (IC_TPO_VRCO_VALOR_FINANCEIRO in ('1','2','3'))),
   VR_FINANCEIRO_OPERACAO DECIMAL(18,2),
   PC_VARIACAO_VALOR_OPERACAO DECIMAL(3,2),
   constraint GECPK667 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, IC_TIPO_VENCIMENTO)
)
 in GECDB002.GECTS667;

label on table GEC.GECTB667_CRITERIO_SELECAO is 'CRITERIO_SELECAO';
label on column GEC.GECTB667_CRITERIO_SELECAO.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB667_CRITERIO_SELECAO.PC_VARIACAO_VALOR_OPERACAO
 is 'PC_VARIACAO_VALOR_FINANCEIRO_OPERACAO';
--==============================================================
-- Index: GEC1I667
--==============================================================
create unique index GEC.GEC1I667 on GEC.GECTB667_CRITERIO_SELECAO (
   NU_UNICO_RESERVA_REGISTRADORA DESC,
   NU_IDNTR_PRTCE_ADMDO DESC,
   IC_TIPO_VENCIMENTO   DESC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB668_TPO_BXA_CONTRATO_C3
--==============================================================
create table GEC.GECTB668_TPO_BXA_CONTRATO_C3 (
   CO_TIPO_BAIXA        CHAR(4)               
      not null,
   DE_TIPO_CONTRATO     VARCHAR(200)          
      not null,
   constraint GECPK668 primary key (CO_TIPO_BAIXA)
)
 in GECDB002.GECTS668;

label on table GEC.GECTB668_TPO_BXA_CONTRATO_C3 is 
'TIPO_BAIXA_CONTRATO_C3';

--==============================================================
-- Index: GEC1I668
--==============================================================
create unique index GEC.GEC1I668 on GEC.GECTB668_TPO_BXA_CONTRATO_C3 (
   CO_TIPO_BAIXA        ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB669_TIPO_ENCARGO
--==============================================================
create table GEC.GECTB669_TIPO_ENCARGO (
   NU_TIPO_ENCARGO      DECIMAL(4)            
      not null,
   DE_TIPO_ENCARGO      char(50)              
      not null,
   constraint GECPK669 primary key (NU_TIPO_ENCARGO)
)
 in GECDB002.GECTS669;

label on table GEC.GECTB669_TIPO_ENCARGO is 'TIPO_ENCARGO';

--==============================================================
-- Index: GEC1I669
--==============================================================
create unique index GEC.GEC1I669 on GEC.GECTB669_TIPO_ENCARGO (
   NU_TIPO_ENCARGO      ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB670_CLIENTE_CONTRATO
--==============================================================
create table GEC.GECTB670_CLIENTE_CONTRATO (
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_CPF_CNPJ_CLIENTE  DECIMAL(15)           
      not null,
   NO_CLIENTE           CHAR(40),
   DT_NASCIMENTO        DATE,
   DT_ABERTURA_EMPRESA  DATE,
   CO_SEXO              CHAR(1),
   DE_NACIONALIDADE     CHAR(25),
   NU_TIPO_DOCUMENTO    SMALLINT,
   NU_DOCUMENTO_CLIENTE CHAR(30),
   DT_EXPEDICAO_DOCUMENTO_CLIENTE date,
   SG_UF_ORGAO_EXPEDIDOR CHAR(2),
   NO_ORGAO_EXPEDIDOR   CHAR(20),
   NO_MAE_CLIENTE       CHAR(40),
   IC_ESTADO_CIVIL      CHAR(2)               
         constraint GEC4C670 check (IC_ESTADO_CIVIL is null or 
(IC_ESTADO_CIVIL in ('01','02','03','04','05','06','07','99'))),
   NU_TELEFONE_COMERCIAL CHAR(20),
   NU_TELEFONE_CELULAR  CHAR(20),
   NU_TELEFONE_RESIDENCIA CHAR(20),
   NO_CONJUGE           CHAR(40),
   NU_CPF_CONJUGE       DECIMAL(11),
   ED_ELETRONICO_CLIENTE VARCHAR(50),
   IC_PORTE_CLIENTE_PF  CHAR(1)               
         constraint GEC1C670 check (IC_PORTE_CLIENTE_PF is null or 
(IC_PORTE_CLIENTE_PF in ('1','2','3','4','5','6','7','8'))),
   NO_CONTATO_EMPRESA   CHAR(40),
   IC_PORTE_CLIENTE_PJ  CHAR(1)               
         constraint GEC2C670 check (IC_PORTE_CLIENTE_PJ is null or 
(IC_PORTE_CLIENTE_PJ in ('1','2','3','4'))),
   IC_TIPO_CONTROLE     CHAR(1)               
         constraint GEC3C670 check (IC_TIPO_CONTROLE is null or 
(IC_TIPO_CONTROLE in ('1','2','3','4'))),
   VR_FATURAMENTO       DECIMAL(18,2),
   constraint GECPK670 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, NU_CPF_CNPJ_CLIENTE)
)
 in GECDB002.GECTS670;

label on table GEC.GECTB670_CLIENTE_CONTRATO is 'CLIENTE_CONTRATO';
label on column GEC.GECTB670_CLIENTE_CONTRATO.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB670_CLIENTE_CONTRATO.NU_UNICO_CONTRATO_RGSDA is
 'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB670_CLIENTE_CONTRATO.DT_NASCIMENTO is 
'DT_NASCIMENTO_CLIENTE';
--==============================================================
-- Index: GEC1I670
--==============================================================
create unique index GEC.GEC1I670 on GEC.GECTB670_CLIENTE_CONTRATO (
   NU_UNICO_RESERVA_REGISTRADORA DESC,
   NU_IDNTR_PRTCE_ADMDO DESC,
   NU_UNICO_CONTRATO_RGSDA DESC,
   NU_CPF_CNPJ_CLIENTE  DESC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB671_TIPO_ENTE_CONSIGNANTE
--==============================================================
create table GEC.GECTB671_TIPO_ENTE_CONSIGNANTE (
   CO_TIPO_ENTE_CONSIGNANTE CHAR(4)               
      not null,
   DE_TIPO_ENTE_CONSIGNANTE char(50)              
      not null,
   constraint GECPK671 primary key (CO_TIPO_ENTE_CONSIGNANTE)
)
 in GECDB002.GECTS671;

label on table GEC.GECTB671_TIPO_ENTE_CONSIGNANTE is 
'TIPO_ENTE_CONSIGNANTE';

--==============================================================
-- Index: GEC1I671
--==============================================================
create unique index GEC.GEC1I671 on GEC.GECTB671_TIPO_ENTE_CONSIGNANTE (

   CO_TIPO_ENTE_CONSIGNANTE ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB672_STCO_ARQVO_RCBDO_IF
--==============================================================
create table GEC.GECTB672_STCO_ARQVO_RCBDO_IF (
   NU_SITUACAO_ARQUIVO  SMALLINT              
      not null,
   DE_SITUACAO_ARQUIVO  VARCHAR(50)           
      not null,
   constraint GECPK672 primary key (NU_SITUACAO_ARQUIVO)
)
 in GECDB002.GECTS672;

label on table GEC.GECTB672_STCO_ARQVO_RCBDO_IF is 
'SITUACAO_ARQUIVO_RECEBIDO_IF';

--==============================================================
-- Index: GEC1I672
--==============================================================
create unique index GEC.GEC1I672 on GEC.GECTB672_STCO_ARQVO_RCBDO_IF (
   NU_SITUACAO_ARQUIVO  ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB673_TPO_DCMTO_IDNFO
--==============================================================
create table GEC.GECTB673_TPO_DCMTO_IDNFO (
   NU_TIPO_DOCUMENTO    SMALLINT              
      not null,
   DE_TIPO_DOCUMENTO    VARCHAR(20)           
      not null,
   constraint GECPK673 primary key (NU_TIPO_DOCUMENTO)
)
 in GECDB002.GECTS673;

label on table GEC.GECTB673_TPO_DCMTO_IDNFO is 
'TIPO_DOCUMENTO_IDENTIFICACAO';

--==============================================================
-- Index: GEC1I673
--==============================================================
create unique index GEC.GEC1I673 on GEC.GECTB673_TPO_DCMTO_IDNFO (
   NU_TIPO_DOCUMENTO    ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB674_ENDERECO_CLIENTE
--==============================================================
create table GEC.GECTB674_ENDERECO_CLIENTE (
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_CPF_CNPJ_CLIENTE  DECIMAL(15)           
      not null,
   NU_SQNCL_RESIDENCIA  SMALLINT              
      not null,
   IC_TIPO_ENDERECO     CHAR(1)               
      not null
         constraint GEC1C674 check (IC_TIPO_ENDERECO in ('R','C','P')),

   DE_ENDERECO_CLIENTE  CHAR(140)             
      not null,
   DE_CIDADE_RESIDENCIA CHAR(50),
   SG_UF_RESIDENCIA     CHAR(2)               
      not null,
   NU_CEP_RESIDENCIA    CHAR(8),
   NO_PAIS_CLIENTE      VARCHAR(50),
   constraint GECPK674 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, NU_CPF_CNPJ_CLIENTE, 
NU_SQNCL_RESIDENCIA)
)
 in GECDB002.GECTS674;

label on table GEC.GECTB674_ENDERECO_CLIENTE is 'ENDERECO_CLIENTE';
label on column GEC.GECTB674_ENDERECO_CLIENTE.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB674_ENDERECO_CLIENTE.NU_UNICO_CONTRATO_RGSDA is
 'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB674_ENDERECO_CLIENTE.DE_CIDADE_RESIDENCIA is 
'CIDADE_RESIDENCIA';
label on column GEC.GECTB674_ENDERECO_CLIENTE.NU_CEP_RESIDENCIA is 
'CEP_RESIDENCIA';
--==============================================================
-- Index: GEC1I674
--==============================================================
create unique index GEC.GEC1I674 on GEC.GECTB674_ENDERECO_CLIENTE (
   NU_UNICO_RESERVA_REGISTRADORA DESC,
   NU_IDNTR_PRTCE_ADMDO DESC,
   NU_UNICO_CONTRATO_RGSDA DESC,
   NU_CPF_CNPJ_CLIENTE  DESC,
   NU_SQNCL_RESIDENCIA  DESC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB675_REPRESENTANTE_LEGAL
--==============================================================
create table GEC.GECTB675_REPRESENTANTE_LEGAL (
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_CPF_CNPJ_CLIENTE  DECIMAL(15)           
      not null,
   NU_CPF_REPRESENTANTE DECIMAL(11)           
      not null,
   constraint GECPK675 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, NU_CPF_CNPJ_CLIENTE, 
NU_CPF_REPRESENTANTE)
)
 in GECDB002.GECTS675;

label on table GEC.GECTB675_REPRESENTANTE_LEGAL is 'REPRESENTANTE_LEGAL'
;
label on column GEC.GECTB675_REPRESENTANTE_LEGAL.NU_IDNTR_PRTCE_ADMDO is
 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB675_REPRESENTANTE_LEGAL.NU_UNICO_CONTRATO_RGSDA
 is 'NU_UNICO_CONTRATO_REGISTRADORA';
--==============================================================
-- Index: GEC1I675
--==============================================================
create unique index GEC.GEC1I675 on GEC.GECTB675_REPRESENTANTE_LEGAL (
   NU_UNICO_RESERVA_REGISTRADORA DESC,
   NU_IDNTR_PRTCE_ADMDO DESC,
   NU_UNICO_CONTRATO_RGSDA DESC,
   NU_CPF_CNPJ_CLIENTE  DESC,
   NU_CPF_REPRESENTANTE DESC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB676_GARANTIA_CESSAO_RGSDA
--==============================================================
create table GEC.GECTB676_GARANTIA_CESSAO_RGSDA (
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_CONTROLE_IF_GARANTIA CHAR(40)              
      not null,
   IC_TIPO_GARANTIA     CHAR(2)               
      not null
         constraint GEC1C676 check (IC_TIPO_GARANTIA in ('1','2','3','4'
,'5','6','7','8','9','10','11')),
   CO_TIPO_GARANTIA_SCR SMALLINT              
      not null
         constraint C_CO_TIPO_GARANTIA check (CO_TIPO_GARANTIA_SCR in 
(01,02,03,04,05,06,07,08,09,10,11,12,13)),
   CO_SUBTIPO_GARANTIA_SCR SMALLINT              
      not null,
   IC_SITUACAO_GARANTIA CHAR(1)               
      not null
         constraint GEC2C676 check (IC_SITUACAO_GARANTIA in ('1','2')),

   IC_BEM_FINANCIADO    CHAR(1)               
         constraint GEC3C676 check (IC_BEM_FINANCIADO is null or 
(IC_BEM_FINANCIADO in ('S','N'))),
   PC_GARANTIA          DECIMAL(5,2),
   VR_ORIGINAL_GARANTIA DECIMAL(18,2),
   VR_GARANTIA_AVALIADA DECIMAL(18,2),
   DT_REAVALIACAO_GARANTIA DATE,
   CO_CLASSIFICACAO_RISCO CHAR(2),
   constraint GECPK676 primary key (NU_UNICO_GARANTIA_RGSDA)
)
 in GECDB002.GECTS676;

label on table GEC.GECTB676_GARANTIA_CESSAO_RGSDA is 
'GARANTIA_CESSAO_REGISTRADORA';
label on column 
GEC.GECTB676_GARANTIA_CESSAO_RGSDA.NU_UNICO_GARANTIA_RGSDA is 
'NU_UNICO_GARANTIA_REGISTRADORA';
label on column GEC.GECTB676_GARANTIA_CESSAO_RGSDA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column 
GEC.GECTB676_GARANTIA_CESSAO_RGSDA.NU_UNICO_CONTRATO_RGSDA is 
'NU_UNICO_CONTRATO_REGISTRADORA';
--==============================================================
-- Index: GEC1I676
--==============================================================
create unique index GEC.GEC1I676 on GEC.GECTB676_GARANTIA_CESSAO_RGSDA (

   NU_UNICO_GARANTIA_RGSDA DESC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB677_OBJETO_CTRTO_CNGDO
--==============================================================
create table GEC.GECTB677_OBJETO_CTRTO_CNGDO (
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_ISPB_CONSIGNANTE  CHAR(8)               
      not null,
   CO_TIPO_ENTE_CONSIGNANTE CHAR(4)               
      not null,
   NU_CNPJ_ORGAO_PAGADOR CHAR(14),
   NU_ISPB_ORGAO_PAGADOR CHAR(8),
   CO_IDNTR_ORGAO_PAGADOR DECIMAL(15),
   NU_CNTRO_SRVCO_CNTLE_CNSGO CHAR(21),
   NU_CONTRATO_ENTE_CONSIGNANTE CHAR(20),
   NU_BENEFICIO_ENTE_CONSIGNANTE DECIMAL(10),
   NU_MATRICULA_ENTE_CONSIGNANTE DECIMAL(20),
   AA_COMPETENCIA_1_DESCONTO DECIMAL(4),
   MM_COMPETENCIA_1_DESCONTO DECIMAL(2),
   VR_MARGEM_CONSIGNADA DECIMAL(18,2),
   NU_VINCULO_EMPREGATICIO SMALLINT,
   DT_ADMISSAO_EMPREGADO DATE,
   constraint GECPK677 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, NU_ISPB_CONSIGNANTE)
)
 in GECDB002.GECTS677;

label on table GEC.GECTB677_OBJETO_CTRTO_CNGDO is 
'OBJETO_CONTRATO_CONSIGNADO';
label on column GEC.GECTB677_OBJETO_CTRTO_CNGDO.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB677_OBJETO_CTRTO_CNGDO.NU_UNICO_CONTRATO_RGSDA 
is 'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB677_OBJETO_CTRTO_CNGDO.CO_IDNTR_ORGAO_PAGADOR 
is 'CO_IDENTIFICADOR ORGAO_PAGADOR';
label on column 
GEC.GECTB677_OBJETO_CTRTO_CNGDO.NU_CNTRO_SRVCO_CNTLE_CNSGO is 
'NU_CONTRATO_SERVICO_CONTROLE_CONSIGNACAO';
--==============================================================
-- Index: GEC1I677
--==============================================================
create unique index GEC.GEC1I677 on GEC.GECTB677_OBJETO_CTRTO_CNGDO (
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_UNICO_CONTRATO_RGSDA ASC,
   NU_ISPB_CONSIGNANTE  ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB678_TIPO_EMPREGATICIO
--==============================================================
create table GEC.GECTB678_TIPO_EMPREGATICIO (
   NU_TIPO_VINCULO_EMPREGATICIO SMALLINT              
      not null,
   DE_TIPO_VINCULO_EMPREGATICIO VARCHAR(200)          
      not null,
   constraint GECPK678 primary key (NU_TIPO_VINCULO_EMPREGATICIO)
)
 in GECDB002.GECTS678;

label on table GEC.GECTB678_TIPO_EMPREGATICIO is 
'TIPO_VINCULO_EMPREGATICIO';

--==============================================================
-- Index: GEC1I678
--==============================================================
create unique index GEC.GEC1I678 on GEC.GECTB678_TIPO_EMPREGATICIO (
   NU_TIPO_VINCULO_EMPREGATICIO ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB679_PRCLA_RESERVA_RGSDA
--==============================================================
create table GEC.GECTB679_PRCLA_RESERVA_RGSDA (
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   IC_ACEITO_AQUISICAO  CHAR(1)               
      not null default '0'
         constraint C_IC_ACEITO_AQUISI check (IC_ACEITO_AQUISICAO in (
'0','S','N')),
   DT_VENCIMENTO_PARCELA DATE                  
      not null,
   IC_TIPO_PARCELA      CHAR(1)               
      not null
         constraint C_IC_TIPO_PARCELA check (IC_TIPO_PARCELA in ('1','2'
,'3')),
   VR_PARCELA           DECIMAL(18,2)         
      not null,
   VR_PRINCIPAL         DECIMAL(18,2),
   VR_JURO              DECIMAL(18,2),
   VR_SALDO_DEVEDOR     DECIMAL(18,2),
   VR_PRINCIPAL_ORIGINAL DECIMAL(18,2),
   VR_JURO_PARCELA_ORIGINAL DECIMAL(18,2),
   VR_SALDO_DEVEDOR_ORIGINAL DECIMAL(18,2),
   VR_SALDO_PREJUIZO    DECIMAL(18,2),
   VR_SLDO_PRJZO_PRCLA_ORIGINAL DECIMAL(18,2),
   CO_CMC7              CHAR(40),
   CO_LINHA_DIGITAVEL   CHAR(47),
   CO_IDENTIFICACAO_BOLETO CHAR(21),
   NU_SITUACAO_PARCELA  SMALLINT              
      not null,
   NU_PARCELA_CREDITO   DECIMAL(18),
   IC_PARCELA_CEDIDA    CHAR(1)               
         constraint C_IC_PARCELA_CEDID check (IC_PARCELA_CEDIDA is null 
or (IC_PARCELA_CEDIDA in ('S','N'))),
   CO_ISPB_CESSIONARIO_PAGANTE CHAR(8),
   NU_SITUACAO_REPASSE  SMALLINT              
      not null,
   NU_SITUACAO_BAIXA_PARCELA DECIMAL(2)            
      not null,
   constraint GECPK679 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, 
NU_UNICO_PARCELA_REGISTRADORA)
)
 in GECDB002.GECTS679;

label on table GEC.GECTB679_PRCLA_RESERVA_RGSDA is 
'PARCELA_RESERVA_REGISTRADORA';
label on column GEC.GECTB679_PRCLA_RESERVA_RGSDA.NU_IDNTR_PRTCE_ADMDO is
 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB679_PRCLA_RESERVA_RGSDA.NU_UNICO_CONTRATO_RGSDA
 is 'NU_UNICO_CONTRATO_REGISTRADORA';
label on column 
GEC.GECTB679_PRCLA_RESERVA_RGSDA.VR_SLDO_PRJZO_PRCLA_ORIGINAL is 
'VR_SALDO_PREJUIZO_PARCELA_ORIGINAL';
--==============================================================
-- Index: GEC1I679
--==============================================================
create unique index GEC.GEC1I679 on GEC.GECTB679_PRCLA_RESERVA_RGSDA (
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_UNICO_CONTRATO_RGSDA ASC,
   NU_UNICO_PARCELA_REGISTRADORA ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I679
--==============================================================
create unique index GEC.GEC2I679 on GEC.GECTB679_PRCLA_RESERVA_RGSDA (
   NU_UNICO_PARCELA_REGISTRADORA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I679
--==============================================================
create unique index GEC.GEC3I679 on GEC.GECTB679_PRCLA_RESERVA_RGSDA (
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_UNICO_PARCELA_REGISTRADORA ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB680_PGMNO_PARCELA_RGSDA
--==============================================================
create table GEC.GECTB680_PGMNO_PARCELA_RGSDA (
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   DT_PAGAMENTO_PARCELA DATE                  
      not null,
   VR_PAGO_PARCELA      DECIMAL(18,2),
   VR_PRINCIPAL_PAGO_PARCELA DECIMAL(18,2),
   VR_JURO_PAGO_PARCELA DECIMAL(18,2),
   VR_JURO_MORA_PAGO_PARCELA DECIMAL(18,2),
   VR_MULTA_PAGO_PARCELA DECIMAL(18,2),
   VR_IOF_PARCELA       DECIMAL(18,2),
   VR_DESCONTO_PARCELA  DECIMAL(18,2),
   VR_ABATIMENTO_PARCELA DECIMAL(18,2),
   VR_DESPESA_PARCELA   DECIMAL(18,2),
   IC_LIQUIDACAO_EXTRA_JUDICIAL CHAR(1)               
         constraint GEC1C680 check (IC_LIQUIDACAO_EXTRA_JUDICIAL is null
 or (IC_LIQUIDACAO_EXTRA_JUDICIAL in ('S','N'))),
   IC_PAGO_LEILAO       CHAR(1)               
         constraint GEC2C680 check (IC_PAGO_LEILAO is null or 
(IC_PAGO_LEILAO in ('S','N'))),
   VR_PAGO_LEILAO       DECIMAL(18,2),
   IC_SEGURO_PAGO       CHAR(1)               
         constraint GEC3C680 check (IC_SEGURO_PAGO is null or 
(IC_SEGURO_PAGO in ('S','N'))),
   constraint GECPK680 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, 
NU_UNICO_PARCELA_REGISTRADORA, DT_PAGAMENTO_PARCELA)
)
 in GECDB002.GECTS680;

label on table GEC.GECTB680_PGMNO_PARCELA_RGSDA is 
'PAGAMENTO_PARCELA_REGISTRADORA';
label on column GEC.GECTB680_PGMNO_PARCELA_RGSDA.NU_IDNTR_PRTCE_ADMDO is
 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB680_PGMNO_PARCELA_RGSDA.NU_UNICO_CONTRATO_RGSDA
 is 'NU_UNICO_CONTRATO_REGISTRADORA';
--==============================================================
-- Index: GEC1I680
--==============================================================
create unique index GEC.GEC1I680 on GEC.GECTB680_PGMNO_PARCELA_RGSDA (
   NU_UNICO_RESERVA_REGISTRADORA DESC,
   NU_IDNTR_PRTCE_ADMDO DESC,
   NU_UNICO_CONTRATO_RGSDA DESC,
   NU_UNICO_PARCELA_REGISTRADORA DESC,
   DT_PAGAMENTO_PARCELA DESC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB681_STCO_PARCELA_RGSDA
--==============================================================
create table GEC.GECTB681_STCO_PARCELA_RGSDA (
   NU_SITUACAO_PARCELA_RGSDA SMALLINT              
      not null,
   DE_SITUACAO_PARCELA_RGSDA VARCHAR(50)           
      not null,
   constraint GECPK681 primary key (NU_SITUACAO_PARCELA_RGSDA)
)
 in GECDB002.GECTS681;

label on table GEC.GECTB681_STCO_PARCELA_RGSDA is 
'SITUACAO_PARCELA_REGISTRADORA';

--==============================================================
-- Index: GEC1I681
--==============================================================
create unique index GEC.GEC1I681 on GEC.GECTB681_STCO_PARCELA_RGSDA (
   NU_SITUACAO_PARCELA_RGSDA ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB682_DETALHE_RESERVA
--==============================================================
create table GEC.GECTB682_DETALHE_RESERVA (
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   DT_OPERACAO_RESERVA  DATE                  
      not null,
   IC_COOBRIGACAO       CHAR(1)               
         constraint GEC1C682 check (IC_COOBRIGACAO is null or 
(IC_COOBRIGACAO in ('S','N'))),
   IC_TIPO_COOBRIGACAO_RESERVA CHAR(4)               
         constraint GEC2C682 check (IC_TIPO_COOBRIGACAO_RESERVA is null 
or (IC_TIPO_COOBRIGACAO_RESERVA in ('0101','0102','0103','0104','0105',
'0701','0702','0703','0704','0705','0706','0707','1001','1002','1003')))
,
   PC_COOBRIGACAO       DECIMAL(10,5),
   PC_RISCO             DECIMAL(10,5),
   IC_TROCA_GESTAO      CHAR(1)               
         constraint GEC3C682 check (IC_TROCA_GESTAO is null or 
(IC_TROCA_GESTAO in ('S','N'))),
   IC_TIPO_REPASSE      CHAR(1)               
         constraint GEC4C682 check (IC_TIPO_REPASSE is null or 
(IC_TIPO_REPASSE in ('0','1','2','3','4','5'))),
   QT_DIA_REPASSE       SMALLINT,
   DD_REPASSE           SMALLINT,
   IC_TIPO_PERIODICIDADE CHAR(1)               
         constraint GEC5C682 check (IC_TIPO_PERIODICIDADE is null or 
(IC_TIPO_PERIODICIDADE in ('0','1','2','3','4','5','6'))),
   IC_TIPO_RESERVA      CHAR(1)               
         constraint GEC6C682 check (IC_TIPO_RESERVA is null or 
(IC_TIPO_RESERVA in ('1','2'))),
   constraint GECPK682 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, DT_OPERACAO_RESERVA)
)
 in GECDB002.GECTS682;

label on table GEC.GECTB682_DETALHE_RESERVA is 'DETALHE_RESERVA';
label on column GEC.GECTB682_DETALHE_RESERVA.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I682
--==============================================================
create unique index GEC.GEC1I682 on GEC.GECTB682_DETALHE_RESERVA (
   NU_UNICO_RESERVA_REGISTRADORA DESC,
   NU_IDNTR_PRTCE_ADMDO DESC,
   DT_OPERACAO_RESERVA  DESC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB683_VINCULA_ARQVO_RESRVA
--==============================================================
create table GEC.GECTB683_VINCULA_ARQVO_RESRVA (
   NU_ARQUIVO           DECIMAL(18)           
      not null,
   NU_EVENTO_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   constraint GECPK683 primary key (NU_ARQUIVO, NU_EVENTO_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
)
 in GECDB002.GECTS683;

label on table GEC.GECTB683_VINCULA_ARQVO_RESRVA is 
'VINCULA_ARQUIVO_RESERVA';
label on column GEC.GECTB683_VINCULA_ARQVO_RESRVA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I683
--==============================================================
create unique index GEC.GEC1I683 on GEC.GECTB683_VINCULA_ARQVO_RESRVA (

   NU_ARQUIVO           ASC,
   NU_EVENTO_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB684_TIPO_COOBRIGACAO
--==============================================================
create table GEC.GECTB684_TIPO_COOBRIGACAO (
   NU_TIPO_COOBRIGACAO  CHAR(4)               
      not null,
   DE_TIPO_COOBRIGACAO  CHAR(100)             
      not null,
   constraint GECPK684 primary key (NU_TIPO_COOBRIGACAO)
)
 in GECDB002.GECTS684;

label on table GEC.GECTB684_TIPO_COOBRIGACAO is 'TIPO_COOBRIGACAO';

--==============================================================
-- Index: GEC1I684
--==============================================================
create unique index GEC.GEC1I684 on GEC.GECTB684_TIPO_COOBRIGACAO (
   NU_TIPO_COOBRIGACAO  ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB685_HSTRO_SITUACAO_RSRVA
--==============================================================
create table GEC.GECTB685_HSTRO_SITUACAO_RSRVA (
   NU_UNICO_C3          CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_SITUACAO_RESERVA  SMALLINT              
      not null,
   TS_RECEPCAO_SITUACAO TIMESTAMP             
      not null,
   constraint GECPK685 primary key (TS_RECEPCAO_SITUACAO, NU_UNICO_C3, 
NU_IDNTR_PRTCE_ADMDO, NU_SITUACAO_RESERVA)
)
 in GECDB002.GECTS685;

label on table GEC.GECTB685_HSTRO_SITUACAO_RSRVA is 
'HISTORICO_SITUACAO_RESERVA_REGISTRADORA';
label on column GEC.GECTB685_HSTRO_SITUACAO_RSRVA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I685
--==============================================================
create unique index GEC.GEC1I685 on GEC.GECTB685_HSTRO_SITUACAO_RSRVA (

   TS_RECEPCAO_SITUACAO ASC,
   NU_UNICO_C3          DESC,
   NU_IDNTR_PRTCE_ADMDO DESC,
   NU_SITUACAO_RESERVA  DESC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I685
--==============================================================
create index GEC.GEC2I685 on GEC.GECTB685_HSTRO_SITUACAO_RSRVA (
   NU_UNICO_C3          ASC,
   NU_SITUACAO_RESERVA  ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB686_RPRSE_LGL_GRNTA_FDJRA
--==============================================================
create table GEC.GECTB686_RPRSE_LGL_GRNTA_FDJRA (
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   NU_SQNCL_GRNTA_FIDEJUSSORIA SMALLINT              
      not null,
   NU_CPF_REPSE_LEGAL   DECIMAL(11)           
      not null,
   constraint GECPK686 primary key (NU_CPF_REPSE_LEGAL, 
NU_UNICO_GARANTIA_RGSDA, NU_SQNCL_GRNTA_FIDEJUSSORIA)
)
 in GECDB002.GECTS686;

label on table GEC.GECTB686_RPRSE_LGL_GRNTA_FDJRA is 
'GARANTIA_FIDEJUSSORIA_REPRESENTANTE_LEGAL';
label on column 
GEC.GECTB686_RPRSE_LGL_GRNTA_FDJRA.NU_UNICO_GARANTIA_RGSDA is 
'NU_UNICO_GARANTIA_REGISTRADORA';
label on column 
GEC.GECTB686_RPRSE_LGL_GRNTA_FDJRA.NU_SQNCL_GRNTA_FIDEJUSSORIA is 
'NU_SEQUENCIAL_GARANTIA_FIDEJUSSORIA';
label on column GEC.GECTB686_RPRSE_LGL_GRNTA_FDJRA.NU_CPF_REPSE_LEGAL is
 'NU_CPF_REPRESENTANTE_LEGAL';
--==============================================================
-- Index: GEC1I686
--==============================================================
create unique index GEC.GEC1I686 on GEC.GECTB686_RPRSE_LGL_GRNTA_FDJRA (

   NU_CPF_REPSE_LEGAL   DESC,
   NU_UNICO_GARANTIA_RGSDA DESC,
   NU_SQNCL_GRNTA_FIDEJUSSORIA DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB687_CESSAO_REGISTRADORA
--==============================================================
create table GEC.GECTB687_CESSAO_REGISTRADORA (
   NU_UNICO_RESERVA     CHAR(21)               for SBCS data
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)                for SBCS data
      not null,
   NU_CONTRATO_CESSAO_IF CHAR
                                 (40)     for SBCS data
      not null,
   NU_SQNCL_SOLICITACAO_CESSAO DECIMAL(18, 0)         with default NULL,

   NU_UNCO_CESSAO_REGISTRADORA CHAR
                                       (21)     for SBCS data
      not null,
   CO_ISPB_PARTICIPANTE_ADMDO CHAR(8)                for SBCS data
      not null,
   CO_ISPB_IF_ORIGINADORA CHAR(8)                for SBCS data
      not null,
   NU_SITUACAO_CESSAO   SMALLINT               with default NULL,
   IC_CESSAO_ATIVA      CHAR(1)                for SBCS data
      not null with default 'S',
   IC_CESSAO_ACEITA_RECUSADA CHAR(1)                for SBCS data
      not null,
   NU_SQNCL_SLCTO_CANCELAMENTO DECIMAL(18, 0)         with default NULL,

   IC_CANCELAMENTO_ACEITO CHAR(1)                for SBCS data
      not null,
   CO_MTVO_RCSA_CANCELAMENTO CHAR(8)                for SBCS data with 
default NULL,
   IC_TIPO_CLIENTE      CHAR(1)                for SBCS data
      not null,
   CO_CNPJ_CPF_TOMADOR  CHAR
                                (14)     for SBCS data
      not null,
   NU_TIPO_CONTRATO     CHAR(4)                for SBCS data with 
default NULL,
   NU_TIPO_TAXA_REFERENCIAL SMALLINT               with default NULL,
   VR_FINANCEIRO_OPERACAO DECIMAL(18, 2)         with default NULL,
   IC_LIQUIDACAO_FINANCEIRA_CIP CHAR(1)                for SBCS data
      not null with default 'N',
   IC_QLFCO_CESSAO_SEM_FNNCO CHAR(1)                for SBCS data
      not null,
   VR_MNTNE_NAO_FNNCO_OPRCO DECIMAL(18, 2)         with default NULL,
   DT_LIQUIDACAO_CESSAO DATE                   with default NULL,
   CO_ISPB_LIQUIDANTE   CHAR(8)                for SBCS data
      not null,
   IC_RSPNL_TARIFACAO_CNTRE CHAR(1)                for SBCS data
      not null,
   PC_TARIFACAO         DECIMAL(10, 5)         with default NULL,
   IC_ALTERACAO_DADO_CADASTRAL CHAR(1)                for SBCS data
      not null with default 'N',
   IC_OPRCO_FNDO_INVTO_DRTO_CRDTO CHAR(1)                for SBCS data
      not null with default 'N',
   CO_CONTRATO_SCR      CHAR(40)               for SBCS data with 
default NULL,
   DT_CONTRATACAO_CESSAO DATE                   with default NULL,
   IC_TIPO_TAXA         CHAR(1)                for SBCS data
      not null,
   PC_TAXA_JURO_EFETIVA_MENSAL DECIMAL(10, 5)         with default NULL,

   PC_TAXA_JURO_EFETIVA_ANUAL DECIMAL(10, 5)         with default NULL,

   NU_INDEXADOR         SMALLINT               with default NULL,
   PC_INDEXADOR         DECIMAL(10, 5)         with default NULL,
   NU_NATUREZA_OPERACAO SMALLINT               with default NULL,
   IC_COBRANCA_JURO_MULTA CHAR(1)                for SBCS data
      not null,
   IC_COBRANCA_JURO_MORA CHAR(1)                for SBCS data
      not null,
   constraint GECPK687 primary key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
)
 in GECDB002.GECTS687;

label on table GEC.GECTB687_CESSAO_REGISTRADORA is 'CESSAO_REGISTRADORA'
;
label on column GEC.GECTB687_CESSAO_REGISTRADORA.NU_IDNTR_PRTCE_ADMDO is
 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column 
GEC.GECTB687_CESSAO_REGISTRADORA.NU_SQNCL_SOLICITACAO_CESSAO is 
'NU_SEQUENCIAL_SOLICITACAO_CESSAO';
label on column 
GEC.GECTB687_CESSAO_REGISTRADORA.NU_UNCO_CESSAO_REGISTRADORA is 
'NU_UNICO_CESSAO_REGISTRADORA';
label on column 
GEC.GECTB687_CESSAO_REGISTRADORA.CO_ISPB_PARTICIPANTE_ADMDO is 
'CO_ISPB_PARTICIPANTE_ADMINISTRADO';
label on column 
GEC.GECTB687_CESSAO_REGISTRADORA.NU_SQNCL_SLCTO_CANCELAMENTO is 
'NU_SEQUENCIAL_SOLICITACAO_CANCELAMENTO_CESSAO';
label on column 
GEC.GECTB687_CESSAO_REGISTRADORA.CO_MTVO_RCSA_CANCELAMENTO is 
'CO_MOTIVO_RECUSA_CANCELAMENTO';
label on column 
GEC.GECTB687_CESSAO_REGISTRADORA.IC_LIQUIDACAO_FINANCEIRA_CIP is 
'IC_LIQUIDACAO_FINANCEIRA_CAMARA_INTERBANCARIA_DE_PAGAMENTOS';
label on column 
GEC.GECTB687_CESSAO_REGISTRADORA.IC_QLFCO_CESSAO_SEM_FNNCO is 
'IC_QUALIFICACAO_CESSAO_SEM_FINANCEIRO';
label on column 
GEC.GECTB687_CESSAO_REGISTRADORA.VR_MNTNE_NAO_FNNCO_OPRCO is 
'VR_MONTANTE_NAO_FINANCEIRO_OPERACAO';
label on column 
GEC.GECTB687_CESSAO_REGISTRADORA.IC_RSPNL_TARIFACAO_CNTRE is 
'IC_RESPONSAVEL_TARIFACAO_CONTRAPARTE';
label on column 
GEC.GECTB687_CESSAO_REGISTRADORA.IC_OPRCO_FNDO_INVTO_DRTO_CRDTO is 
'IC_OPERACAO_FUNDOS_INVESTIMENTOS_DIREITOS_CREDITORIOS';
--==============================================================
-- Index: GEC1I687
--==============================================================
create unique index GEC.GEC1I687 on GEC.GECTB687_CESSAO_REGISTRADORA (
   NU_UNICO_RESERVA     ASC,
   NU_IDNTR_PRTCE_ADMDO ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB688_DIVERGENCIA_CESSAO
--==============================================================
create table GEC.GECTB688_DIVERGENCIA_CESSAO (
   NU_UNICO_RESERVA     CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_SQNCL_VARREDURA   SMALLINT              
      not null,
   NU_TIPO_DIVERGENCIA  SMALLINT              
      not null,
   NU_SQNCL_DIVERGENCIA SMALLINT              
      not null,
   constraint GECPK688 primary key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO, NU_SQNCL_VARREDURA, NU_TIPO_DIVERGENCIA, 
NU_SQNCL_DIVERGENCIA)
)
 in GECDB002.GECTS688;

label on table GEC.GECTB688_DIVERGENCIA_CESSAO is 'DIVERGENCIA_CESSAO';

label on column GEC.GECTB688_DIVERGENCIA_CESSAO.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I688
--==============================================================
create unique index GEC.GEC1I688 on GEC.GECTB688_DIVERGENCIA_CESSAO (
   NU_UNICO_RESERVA     ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_SQNCL_VARREDURA   ASC,
   NU_TIPO_DIVERGENCIA  ASC,
   NU_SQNCL_DIVERGENCIA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB689_TIPO_DIVERGENCIA
--==============================================================
create table GEC.GECTB689_TIPO_DIVERGENCIA (
   NU_TIPO_DIVERGENCIA  SMALLINT              
      not null,
   DE_TIPO_DIVERGENCIA  VARCHAR(50)           
      not null,
   constraint GECPK689 primary key (NU_TIPO_DIVERGENCIA)
)
 in GECDB002.GECTS689;

label on table GEC.GECTB689_TIPO_DIVERGENCIA is 'TIPO_DIVERGENCIA';

--==============================================================
-- Index: GEC1I689
--==============================================================
create unique index GEC.GEC1I689 on GEC.GECTB689_TIPO_DIVERGENCIA (
   NU_TIPO_DIVERGENCIA  ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB690_VARREDURA_CESSAO
--==============================================================
create table GEC.GECTB690_VARREDURA_CESSAO (
   NU_UNICO_RESERVA     CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_SQNCL_VARREDURA   SMALLINT              
      not null,
   NU_ARQUIVO           DECIMAL(18),
   TS_INCLUSAO          TIMESTAMP             
      not null,
   NU_UNICO_CESSAO      CHAR(21),
   NU_CONTRATO_CESSAO_RGSDA CHAR(21),
   NU_SITUACAO_EVENTO   SMALLINT              
      not null,
   constraint GECPK690 primary key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO, NU_SQNCL_VARREDURA)
)
 in GECDB002.GECTS690;

label on table GEC.GECTB690_VARREDURA_CESSAO is 
'VARREDURA_CESSAO_REGISTRADORA';
label on column GEC.GECTB690_VARREDURA_CESSAO.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB690_VARREDURA_CESSAO.NU_CONTRATO_CESSAO_RGSDA 
is 'NU_CONTRATO_CESSAO_REGISTRADORA';
--==============================================================
-- Index: GEC1I690
--==============================================================
create unique index GEC.GEC1I690 on GEC.GECTB690_VARREDURA_CESSAO (
   NU_UNICO_RESERVA     ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_SQNCL_VARREDURA   ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB691_ACEITE_RESERVA
--==============================================================
create table GEC.GECTB691_ACEITE_RESERVA (
   NU_UNICO_RESERVA     CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_SEQUENCIAL_SOLICITACAO DECIMAL(18)           
      not null,
   QT_PARCELA_ACEITA    DECIMAL(12),
   QT_PARCELA_RECUSADA  DECIMAL(12),
   IC_TIPO_RESPOSTA     CHAR(2)               
      not null
         constraint GEC1C691 check (IC_TIPO_RESPOSTA in ('AT','RT','AP',
'RP')),
   constraint GECPK691 primary key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO, NU_SEQUENCIAL_SOLICITACAO)
)
 in GECDB002.GECTS691;

label on table GEC.GECTB691_ACEITE_RESERVA is 'ACEITE_RESERVA';
label on column GEC.GECTB691_ACEITE_RESERVA.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I691
--==============================================================
create unique index GEC.GEC1I691 on GEC.GECTB691_ACEITE_RESERVA (
   NU_UNICO_RESERVA     ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_SEQUENCIAL_SOLICITACAO ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I691
--==============================================================
create unique index GEC.GEC2I691 on GEC.GECTB691_ACEITE_RESERVA (
   NU_SEQUENCIAL_SOLICITACAO ASC
)
USING STOGROUP SGDDB201
    PRIQTY 48 SECQTY 48
    ERASE  YES
    FREEPAGE 0 PCTFREE 5
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB692_PARCELA_ACEITE_RSRVA
--==============================================================
create table GEC.GECTB692_PARCELA_ACEITE_RSRVA (
   NU_UNICO_RESERVA     CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_SEQUENCIAL_SOLICITACAO DECIMAL(18)           
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   NU_ARQUIVO           DECIMAL(18)           
      not null,
   IC_PARCELA_ACEITA    CHAR(1)               
      not null with default 'S'
         constraint GEC1C692 check (IC_PARCELA_ACEITA in ('S','N')),
   CO_MOTIVO_RECUSA     CHAR(8),
   constraint GECPK692 primary key (NU_ARQUIVO, NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO, NU_SEQUENCIAL_SOLICITACAO, 
NU_UNICO_PARCELA_REGISTRADORA)
)
 in GECDB002.GECTS692;

label on table GEC.GECTB692_PARCELA_ACEITE_RSRVA is 
'PARCELA_ACEITE_RESERVA';
label on column GEC.GECTB692_PARCELA_ACEITE_RSRVA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I692
--==============================================================
create unique index GEC.GEC1I692 on GEC.GECTB692_PARCELA_ACEITE_RSRVA (

   NU_ARQUIVO           ASC,
   NU_UNICO_RESERVA     ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_SEQUENCIAL_SOLICITACAO ASC,
   NU_UNICO_PARCELA_REGISTRADORA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I692
--==============================================================
create index GEC.GEC2I692 on GEC.GECTB692_PARCELA_ACEITE_RSRVA (
   NU_UNICO_RESERVA     ASC,
   NU_UNICO_PARCELA_REGISTRADORA ASC
)
include
not cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB693_DTLHE_GRNTA_VEICULO
--==============================================================
create table GEC.GECTB693_DTLHE_GRNTA_VEICULO (
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   VR_ENTRADA_VEICULO   DECIMAL(18,2),
   CO_CHASSI_VEICULO    CHAR(17),
   CO_TIPO_VEICULO      INT                   
         constraint C_CO_TIPO_VEICULO check (CO_TIPO_VEICULO is null or 
(CO_TIPO_VEICULO in (1,2,3,4,5,6,7,99))),
   CO_TIPO_TABELA_VEICULO CHAR(1)               
         constraint GEC4C693 check (CO_TIPO_TABELA_VEICULO is null or 
(CO_TIPO_TABELA_VEICULO in ('1','2'))),
   CO_VEICULO_TABELA    CHAR(11),
   SG_UF_TABELA_VEICULO CHAR(2),
   IC_VEICULO_USADO     CHAR(1)               
         constraint GEC1C693 check (IC_VEICULO_USADO is null or 
(IC_VEICULO_USADO in ('S','N'))),
   NU_PLACA_VEICULO     CHAR(7),
   SG_UF_PLACA_VEICULO  CHAR(2),
   QT_QUILOMETRAGEM     DECIMAL(9),
   CO_RENAVAM           CHAR(11),
   NU_NOTA_FISCAL       CHAR(10),
   NU_SERIE_NOTA_FISCAL CHAR(10),
   VR_NOTA_FISCAL       DECIMAL(18,2),
   DT_EMISSAO_NOTA_FISCAL DATE,
   VR_MERCADO_VEICULO   DECIMAL(18,2),
   IC_CATEGORIA_VEICULO CHAR(2)               
         constraint GEC2C693 check (IC_CATEGORIA_VEICULO is null or 
(IC_CATEGORIA_VEICULO in ('1','2','3','4','5','6','7','8','9','10','11',
'12','13','14','15','99'))),
   CO_MARCA_VEICULO     CHAR(5),
   IC_MODELO_VEICULO    CHAR(8),
   AA_MODELO_VEICULO    SMALLINT,
   AA_FABRICACAO_VEICULO SMALLINT,
   IC_TIPO_COMBUSTIVEL  CHAR(2),
   NO_PAIS_FABRICACAO   CHAR(15),
   constraint GECPK693 primary key (NU_UNICO_GARANTIA_RGSDA)
)
 in GECDB002.GECTS693;

label on table GEC.GECTB693_DTLHE_GRNTA_VEICULO is 
'DETALHE_GARANTIA_VEICULO';
label on column GEC.GECTB693_DTLHE_GRNTA_VEICULO.NU_UNICO_GARANTIA_RGSDA
 is 'NU_UNICO_GARANTIA_REGISTRADORA';
--==============================================================
-- Index: GEC1I693
--==============================================================
create unique index GEC.GEC1I693 on GEC.GECTB693_DTLHE_GRNTA_VEICULO (
   NU_UNICO_GARANTIA_RGSDA DESC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB694_MTVO_INVALIDAR_ARQVO
--==============================================================
create table GEC.GECTB694_MTVO_INVALIDAR_ARQVO (
   NU_MOTIVO_INVALIDAR_ARQUIVO SMALLINT              
      not null,
   DE_MOTIVO_INVALIDAR_ARQUIVO VARCHAR(50)           
      not null,
   constraint GECPK694 primary key (NU_MOTIVO_INVALIDAR_ARQUIVO)
)
 in GECDB002.GECTS694;

label on table GEC.GECTB694_MTVO_INVALIDAR_ARQVO is 
'MOTIVO_INVALIDAR_ARQUIVO_RECEBIDO_IF';

--==============================================================
-- Index: GEC1I694
--==============================================================
create unique index GEC.GEC1I694 on GEC.GECTB694_MTVO_INVALIDAR_ARQVO (

   NU_MOTIVO_INVALIDAR_ARQUIVO ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB695_IMOVEL_GRNTA_CESSAO
--==============================================================
create table GEC.GECTB695_IMOVEL_GRNTA_CESSAO (
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   NU_TIPO_IMOVEL       SMALLINT              
      not null,
   IC_TIPO_USO_IMOVEL   CHAR(1)               
      not null
         constraint GEC1C695 check (IC_TIPO_USO_IMOVEL in ('1','2')),
   NU_INSCRICAO_MNCPL_IMOVEL CHAR(20)              
      not null,
   NU_MATRICULA_IMOVEL  CHAR(20),
   CO_IDENFICADOR_CARTORIO CHAR(6),
   IC_TIPO_ENDERECO     CHAR(1)               
      not null
         constraint GEC2C695 check (IC_TIPO_ENDERECO in ('R','C','P')),

   DE_ENDERECO_IMOVEL_GARANTIA VARCHAR(140)          
      not null,
   DE_CIDADE_IMOVEL_GARANTIA VARCHAR(80),
   SG_UF_IMOVEL_GARANTIA CHAR(2)               
      not null,
   NU_CEP_IMOVEL_GARANTIA CHAR(8),
   NO_PAIS_IMOVEL_GARANTIA VARCHAR(15),
   constraint GECPK695 primary key (NU_UNICO_GARANTIA_RGSDA)
)
 in GECDB002.GECTS695;

label on table GEC.GECTB695_IMOVEL_GRNTA_CESSAO is 
'IMOVEL_GARANTIA_CESSAO';
label on column GEC.GECTB695_IMOVEL_GRNTA_CESSAO.NU_UNICO_GARANTIA_RGSDA
 is 'NU_UNICO_GARANTIA_REGISTRADORA';
label on column 
GEC.GECTB695_IMOVEL_GRNTA_CESSAO.NU_INSCRICAO_MNCPL_IMOVEL is 
'NU_INSCRICAO_MUNICIPAL_IMOVEL';
--==============================================================
-- Index: GEC1I695
--==============================================================
create unique index GEC.GEC1I695 on GEC.GECTB695_IMOVEL_GRNTA_CESSAO (
   NU_UNICO_GARANTIA_RGSDA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB696_GRNTA_FDJRA_CESSAO
--==============================================================
create table GEC.GECTB696_GRNTA_FDJRA_CESSAO (
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   NU_SQNCL_GRNTA_FIDEJUSSORIA SMALLINT              
      not null,
   IC_TIPO_PESSOA       CHAR(1)               
      not null
         constraint GEC1C696 check (IC_TIPO_PESSOA in ('F','J')),
   NU_CPF_CNPJ_CLIENTE  CHAR(14)              
      not null,
   NO_CLIENTE           VARCHAR(80),
   NO_MAE_CLIENTE       VARCHAR(80),
   IC_ESTADO_CIVIL      CHAR(2)               
         constraint GEC2C696 check (IC_ESTADO_CIVIL is null or 
(IC_ESTADO_CIVIL in ('01','02','03','04','05','06','07','99'))),
   NU_CPF_CONJUGE       CHAR(14),
   NO_CONJUGE           VARCHAR(80),
   IC_PORTE_PESSOA_GRNTA_FDJRA_PF CHAR(1)               
         constraint GEC3C696 check (IC_PORTE_PESSOA_GRNTA_FDJRA_PF is 
null or (IC_PORTE_PESSOA_GRNTA_FDJRA_PF in ('1','2','3','4','5','6','7',
'8'))),
   IC_PORTE_PESSOA_GRNTA_FDJRA_PJ CHAR(1)               
         constraint GEC4C696 check (IC_PORTE_PESSOA_GRNTA_FDJRA_PJ is 
null or (IC_PORTE_PESSOA_GRNTA_FDJRA_PJ in ('1','2','3','4'))),
   DT_ABERTURA          DATE,
   IC_TIPO_DOCUMENTO    CHAR(2)               
         constraint GEC5C696 check (IC_TIPO_DOCUMENTO is null or 
(IC_TIPO_DOCUMENTO in ('01','02','03','04','05','06','99'))),
   NU_DOCUMENTO         CHAR(20),
   NU_TELEFONE_COMERCIAL BIGINT,
   NO_CONTATO_COMERCIAL VARCHAR(80),
   IC_TIPO_CONTROLE     CHAR(1)               
         constraint GEC6C696 check (IC_TIPO_CONTROLE is null or 
(IC_TIPO_CONTROLE in ('1','2','3','4'))),
   VR_FATURAMENTO       DECIMAL(18,2),
   constraint GECPK696 primary key (NU_UNICO_GARANTIA_RGSDA, 
NU_SQNCL_GRNTA_FIDEJUSSORIA)
)
 in GECDB002.GECTS696;

label on table GEC.GECTB696_GRNTA_FDJRA_CESSAO is 
'GARANTIA_FIDEJUSSORIA_GARANTIA_CESSAO';
label on column GEC.GECTB696_GRNTA_FDJRA_CESSAO.NU_UNICO_GARANTIA_RGSDA 
is 'NU_UNICO_GARANTIA_REGISTRADORA';
label on column 
GEC.GECTB696_GRNTA_FDJRA_CESSAO.NU_SQNCL_GRNTA_FIDEJUSSORIA is 
'NU_SEQUENCIAL_GARANTIA_FIDEJUSSORIA';
label on column GEC.GECTB696_GRNTA_FDJRA_CESSAO.NO_CLIENTE is 
'NOME_CLIENTE';
label on column 
GEC.GECTB696_GRNTA_FDJRA_CESSAO.IC_PORTE_PESSOA_GRNTA_FDJRA_PF is 
'IC_PORTE_PESSOA_GARANTIA_FIDEJUSSORIA_PF';
label on column 
GEC.GECTB696_GRNTA_FDJRA_CESSAO.IC_PORTE_PESSOA_GRNTA_FDJRA_PJ is 
'IC_PORTE_PESSOA_GARANTIA_FIDEJUSSORIA_PJ';
--==============================================================
-- Index: GEC1I696
--==============================================================
create unique index GEC.GEC1I696 on GEC.GECTB696_GRNTA_FDJRA_CESSAO (
   NU_UNICO_GARANTIA_RGSDA ASC,
   NU_SQNCL_GRNTA_FIDEJUSSORIA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB697_EQPMO_GRNTA_CESSAO
--==============================================================
create table GEC.GECTB697_EQPMO_GRNTA_CESSAO (
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   DE_TIPO_EQUIPAMENTO  VARCHAR(60)           
      not null,
   VR_ENTRADA_EQUIPAMENTO DECIMAL(18,2),
   NU_CNPJ_FABRICANTE   CHAR(14),
   NU_CNPJ_FORNECEDOR   CHAR(14),
   NU_NOTA_FISCAL       CHAR(10),
   NU_SERIE_NOTA_FISCAL CHAR(9),
   VR_NOTA_FISCAL       DECIMAL(18,2),
   DT_EMISSAO_NOTA_FISCAL DATE,
   NO_PAIS_FABRICACAO   VARCHAR(15),
   NU_SERIAL_EQUIPAMENTO CHAR(9),
   constraint GECPK697 primary key (NU_UNICO_GARANTIA_RGSDA)
)
 in GECDB002.GECTS697;

label on table GEC.GECTB697_EQPMO_GRNTA_CESSAO is 
'EQUIPAMENTO_GARANTIA_CESSAO';
label on column GEC.GECTB697_EQPMO_GRNTA_CESSAO.NU_UNICO_GARANTIA_RGSDA 
is 'NU_UNICO_GARANTIA_REGISTRADORA';
--==============================================================
-- Index: GEC1I697
--==============================================================
create unique index GEC.GEC1I697 on GEC.GECTB697_EQPMO_GRNTA_CESSAO (
   NU_UNICO_GARANTIA_RGSDA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB698_INSNO_FNNCO_GRNTA
--==============================================================
create table GEC.GECTB698_INSNO_FNNCO_GRNTA (
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   IC_TIPO_INSTRUMENTO_FINANCEIRO CHAR(1)               
      not null
         constraint GEC1C698 check (IC_TIPO_INSTRUMENTO_FINANCEIRO in (
'1','2','3')),
   CO_INSTRUMENTO_FINANCEIRO CHAR(12)              
      not null,
   DT_EMISSAO_INSTRUMENTO_FNNCO DATE,
   DT_INICIAL_INSTRUMENTO_FNNCO DATE,
   DT_VNCMO_INSTRUMENTO_FNNCO DATE,
   QT_EMITIDA_INSTRUMENTO_FNNCO INT,
   VR_UNITARIO_INSTRUMENTO_FNNCO DECIMAL(18,2),
   NU_MATRICULA_INSTRUMENTO_FNNCO CHAR(20),
   CO_IDENTIFICADOR_CARTORIO CHAR(6),
   constraint GECPK698 primary key (NU_UNICO_GARANTIA_RGSDA)
)
 in GECDB002.GECTS698;

label on table GEC.GECTB698_INSNO_FNNCO_GRNTA is 
'INSTRUMENTO_FINANCEIRO_GARANTIA_CESSAO';
label on column GEC.GECTB698_INSNO_FNNCO_GRNTA.NU_UNICO_GARANTIA_RGSDA 
is 'NU_UNICO_GARANTIA_REGISTRADORA';
label on column 
GEC.GECTB698_INSNO_FNNCO_GRNTA.DT_EMISSAO_INSTRUMENTO_FNNCO is 
'DT_EMISSAO_INSTRUMENTO_FINANCEIRO';
label on column 
GEC.GECTB698_INSNO_FNNCO_GRNTA.DT_INICIAL_INSTRUMENTO_FNNCO is 
'DT_INICIAL_INSTRUMENTO_FINANCEIRO';
label on column 
GEC.GECTB698_INSNO_FNNCO_GRNTA.DT_VNCMO_INSTRUMENTO_FNNCO is 
'DT_VENCIMENTO_INSTRUMENTO_FINANCEIRO';
label on column 
GEC.GECTB698_INSNO_FNNCO_GRNTA.QT_EMITIDA_INSTRUMENTO_FNNCO is 
'QT_EMITIDA_INSTRUMENTO_FINANCEIRO';
label on column 
GEC.GECTB698_INSNO_FNNCO_GRNTA.VR_UNITARIO_INSTRUMENTO_FNNCO is 
'VR_UNITARIO_INSTRUMENTO_FINANCEIRO';
label on column 
GEC.GECTB698_INSNO_FNNCO_GRNTA.NU_MATRICULA_INSTRUMENTO_FNNCO is 
'NU_MATRICULA_INSTRUMENTO_FINANCEIRO';
--==============================================================
-- Index: GEC1I698
--==============================================================
create unique index GEC.GEC1I698 on GEC.GECTB698_INSNO_FNNCO_GRNTA (
   NU_UNICO_GARANTIA_RGSDA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB699_SITUACAO_CESSAO_C3
--==============================================================
create table GEC.GECTB699_SITUACAO_CESSAO_C3 (
   NU_SITUACAO_CESSAO_C3 SMALLINT              
      not null,
   DE_SITUACAO_CESSAO_C3 VARCHAR(30)           
      not null,
   constraint GECPK699 primary key (NU_SITUACAO_CESSAO_C3)
)
 in GECDB002.GECTS699;

label on table GEC.GECTB699_SITUACAO_CESSAO_C3 is 'SITUACAO_CESSAO_C3';


--==============================================================
-- Index: GEC1I699
--==============================================================
create unique index GEC.GEC1I699 on GEC.GECTB699_SITUACAO_CESSAO_C3 (
   NU_SITUACAO_CESSAO_C3 ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB700_EVNTO_LIQUIDACAO_RPSE
--==============================================================
create table GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE (
   NU_EVENTO_LIQUIDACAO_REPASSE CHAR(21)              
      not null,
   NU_PRODUTO           SMALLINT,
   CO_ISPB_PRTCE_ADMINISTRADO CHAR(8)               
      not null,
   NU_CONTROLE_EVENTO_IF CHAR(40)              
      not null,
   VR_REPASSE           DECIMAL(18,2),
   IC_LIQUIDACAO_FINANCEIRA_CIP CHAR(1)               
      not null default 'N'
         constraint GEC1C700 check (IC_LIQUIDACAO_FINANCEIRA_CIP in ('S'
,'N')),
   DT_LIQUIDACAO_REPASSE DATE                  
      not null,
   CO_ISPB_PRTCE_LIQUIDANTE CHAR(8),
   IC_ACEITE_CONFIRMADO CHAR(1)               
      not null
         constraint GEC2C700 check (IC_ACEITE_CONFIRMADO in ('S','N')),

   NU_SITUACAO_REPASSE  SMALLINT              
      not null,
   constraint GECPK700 primary key (NU_EVENTO_LIQUIDACAO_REPASSE)
)
 in GECDB002.GECTS700;

label on table GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE is 
'EVENTO_LIQUIDACAO_REPASSE';
label on column 
GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE.CO_ISPB_PRTCE_ADMINISTRADO is 
'CO_ISPB_PARTICIPANTE_ADMINISTRADO';
label on column 
GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE.CO_ISPB_PRTCE_LIQUIDANTE is 
'CO_ISPB_PARTICIPANTE_LIQUIDANTE';
--==============================================================
-- Index: GEC1I700
--==============================================================
create unique index GEC.GEC1I700 on GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE (

   NU_EVENTO_LIQUIDACAO_REPASSE DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB701_PARCELA_REPASSE_RGSDA
--==============================================================
create table GEC.GECTB701_PARCELA_REPASSE_RGSDA (
   NU_EVENTO_LIQUIDACAO_REPASSE CHAR(21)              
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_EVENTO_ESTORNO    CHAR(21),
   IC_VALOR_REPASSE_ESTORNADO CHAR(1)               
      not null default 'N'
         constraint GEC1C701 check (IC_VALOR_REPASSE_ESTORNADO in ('S',
'N')),
   constraint GECPK701 primary key (NU_EVENTO_LIQUIDACAO_REPASSE, 
NU_UNICO_PARCELA_REGISTRADORA, NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
)
 in GECDB002.GECTS701;

label on table GEC.GECTB701_PARCELA_REPASSE_RGSDA is 
'PARCELA_REPASSE_REGISTRADORA';
label on column 
GEC.GECTB701_PARCELA_REPASSE_RGSDA.NU_UNICO_CONTRATO_RGSDA is 
'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB701_PARCELA_REPASSE_RGSDA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I701
--==============================================================
create unique index GEC.GEC1I701 on GEC.GECTB701_PARCELA_REPASSE_RGSDA (

   NU_EVENTO_LIQUIDACAO_REPASSE DESC,
   NU_UNICO_PARCELA_REGISTRADORA DESC,
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_UNICO_CONTRATO_RGSDA ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB702_CONTRATO_RPSE_RGSDA
--==============================================================
create table GEC.GECTB702_CONTRATO_RPSE_RGSDA (
   NU_EVENTO_LIQUIDACAO_REPASSE CHAR(21)              
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_EVENTO_ESTORNO    CHAR(21),
   IC_EVENTO_ESTORNADO  CHAR(1)               
      not null default 'N'
         constraint GEC1C702 check (IC_EVENTO_ESTORNADO in ('S','N')),
   constraint GECPK702 primary key (NU_EVENTO_LIQUIDACAO_REPASSE, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
)
 in GECDB002.GECTS702;

label on table GEC.GECTB702_CONTRATO_RPSE_RGSDA is 
'CONTRATO_REPASSE_REGISTRADORA';
label on column GEC.GECTB702_CONTRATO_RPSE_RGSDA.NU_UNICO_CONTRATO_RGSDA
 is 'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB702_CONTRATO_RPSE_RGSDA.NU_IDNTR_PRTCE_ADMDO is
 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I702
--==============================================================
create unique index GEC.GEC1I702 on GEC.GECTB702_CONTRATO_RPSE_RGSDA (
   NU_EVENTO_LIQUIDACAO_REPASSE DESC,
   NU_UNICO_CONTRATO_RGSDA DESC,
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I702
--==============================================================
create index GEC.GEC2I702 on GEC.GECTB702_CONTRATO_RPSE_RGSDA (
   NU_EVENTO_LIQUIDACAO_REPASSE DESC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB703_VNCLA_TED_EVENTO_RPSE
--==============================================================
create table GEC.GECTB703_VNCLA_TED_EVENTO_RPSE (
   NU_EVENTO_LIQUIDACAO_REPASSE CHAR(21)              
      not null,
   CO_NUOP              CHAR(25)              
      not null,
   TS_VINCULACAO_EVENTO TIMESTAMP             
      not null,
   CO_MATRICULA_USUARIO CHAR(10)              
      not null,
   CO_IP                CHAR(28)              
      not null,
   IC_VINCULO_CANCELADO CHAR(1)               
      not null default 'A'
         constraint GEC1C703 check (IC_VINCULO_CANCELADO in ('A','C')),

   constraint GECPK703 primary key (NU_EVENTO_LIQUIDACAO_REPASSE, 
CO_NUOP)
)
 in GECDB002.GECTS703;

label on table GEC.GECTB703_VNCLA_TED_EVENTO_RPSE is 
'VINCULA_TED_EVENTO_REPASSE';

--==============================================================
-- Index: GEC1I703
--==============================================================
create unique index GEC.GEC1I703 on GEC.GECTB703_VNCLA_TED_EVENTO_RPSE (

   NU_EVENTO_LIQUIDACAO_REPASSE DESC,
   CO_NUOP              DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB704_VNCLA_EVENTO_ARQUIVO
--==============================================================
create table GEC.GECTB704_VNCLA_EVENTO_ARQUIVO (
   NU_SEQUENCIAL_EVENTO DECIMAL(19)           
      not null,
   NU_SQNCL_ARQUIVO_RECEBIDO DECIMAL(19)           
      not null,
   IC_SITUACAO_VINCULACAO CHAR(1)               
      not null default 'A'
         constraint GEC1C704 check (IC_SITUACAO_VINCULACAO in ('A','C'))
,
   constraint GECPK704 primary key (NU_SEQUENCIAL_EVENTO, 
NU_SQNCL_ARQUIVO_RECEBIDO)
)
 in GECDB002.GECTS704;

label on table GEC.GECTB704_VNCLA_EVENTO_ARQUIVO is 
'VINCULA_LIQUIDACAO_ANTECIPADA_CC_ARQUIVOS_RECEBIDOS';
label on column 
GEC.GECTB704_VNCLA_EVENTO_ARQUIVO.NU_SQNCL_ARQUIVO_RECEBIDO is 
'NU_SEQUENCIAL_ARQUIVO_RECEBIDO';
--==============================================================
-- Index: GEC1I704
--==============================================================
create unique index GEC.GEC1I704 on GEC.GECTB704_VNCLA_EVENTO_ARQUIVO (

   NU_SEQUENCIAL_EVENTO DESC,
   NU_SQNCL_ARQUIVO_RECEBIDO DESC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB705_VNCLA_TED_FLUXO_RCBMO
--==============================================================
create table GEC.GECTB705_VNCLA_TED_FLUXO_RCBMO (
   NU_SQNCL_PREVISAO    DECIMAL(19)           
      not null,
   CO_NUOP              CHAR(25)              
      not null,
   TS_VNCLO_TED_FLUXO_RCBMO TIMESTAMP             
      not null,
   CO_MATRICULA_USUARIO CHAR(10)              
      not null,
   CO_IP                CHAR(28)              
      not null,
   IC_VINCULO_CANCELADO CHAR(1)               
      not null default 'A'
         constraint GEC1C705 check (IC_VINCULO_CANCELADO in ('A','C')),

   constraint GECPK705 primary key (NU_SQNCL_PREVISAO, CO_NUOP)
)
 in GECDB002.GECTS705;

label on table GEC.GECTB705_VNCLA_TED_FLUXO_RCBMO is 
'VINCULA_TED_FLUXO_RECEBIMENTO_TRANCHE';
label on column 
GEC.GECTB705_VNCLA_TED_FLUXO_RCBMO.TS_VNCLO_TED_FLUXO_RCBMO is 
'TS_VINCULACAO_TED_FLUXO_RECEBIMENTO';
--==============================================================
-- Index: GEC1I705
--==============================================================
create unique index GEC.GEC1I705 on GEC.GECTB705_VNCLA_TED_FLUXO_RCBMO (

   NU_SQNCL_PREVISAO    DESC,
   CO_NUOP              DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB706_ACEITE_EVENTO_RGSDA
--==============================================================
create table GEC.GECTB706_ACEITE_EVENTO_RGSDA (
   NU_EVENTO_ACEITE_RGSDA CHAR(21)              
      not null,
   NU_SEQUENCIAL_SOLICITACAO DECIMAL(18)           
      not null,
   IC_EVENTO_ACEITO     CHAR(1)               
      not null
         constraint GEC1C706 check (IC_EVENTO_ACEITO in ('S','N')),
   TS_INCLUSAO_EVENTO   TIMESTAMP             
      not null,
   CO_ISPB_PRTCE_LIQUIDANTE CHAR(8),
   NU_ARQUIVO_EVENTO_ORIGEM DECIMAL(18),
   constraint GECPK706 primary key (NU_EVENTO_ACEITE_RGSDA, 
NU_SEQUENCIAL_SOLICITACAO)
)
 in GECDB002.GECTS706;

label on table GEC.GECTB706_ACEITE_EVENTO_RGSDA is 
'ACEITE_EVENTO_REGISTRADORA';
label on column 
GEC.GECTB706_ACEITE_EVENTO_RGSDA.CO_ISPB_PRTCE_LIQUIDANTE is 
'CO_ISPB_PARTICIPANTE_LIQUIDANTE_RECOMPRA';
--==============================================================
-- Index: GEC1I706
--==============================================================
create unique index GEC.GEC1I706 on GEC.GECTB706_ACEITE_EVENTO_RGSDA (
   NU_EVENTO_ACEITE_RGSDA ASC,
   NU_SEQUENCIAL_SOLICITACAO ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB707_EVNTO_ESTORNO_RGSDA
--==============================================================
create table GEC.GECTB707_EVNTO_ESTORNO_RGSDA (
   NU_EVENTO_ESTORNO    CHAR(21)              
      not null,
   TS_INCLUSAO_EVENTO   TIMESTAMP             
      not null,
   IC_SITUACAO_ESTORNO  CHAR(1)               
      not null
         constraint GEC1C707 check (IC_SITUACAO_ESTORNO in ('1','2','3',
'4','5')),
   IC_TIPO_ESTORNO      CHAR(1)               
      not null
         constraint GEC2C707 check (IC_TIPO_ESTORNO in ('1','2')),
   constraint GECPK707 primary key (NU_EVENTO_ESTORNO)
)
 in GECDB002.GECTS707;

label on table GEC.GECTB707_EVNTO_ESTORNO_RGSDA is 
'EVENTO_ESTORNO_REGEISTRADO';

--==============================================================
-- Index: GEC1I707
--==============================================================
create unique index GEC.GEC1I707 on GEC.GECTB707_EVNTO_ESTORNO_RGSDA (
   NU_EVENTO_ESTORNO    DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB708_TED_EVNTO_RECOMPRA
--==============================================================
create table GEC.GECTB708_TED_EVNTO_RECOMPRA (
   CO_NUOP              CHAR(25)              
      not null,
   NU_EVENTO_UNICO_REGISTRADORA CHAR(21)              
      not null,
   CO_ISPB_IF_SOLICITANTE_EVNTO CHAR(8)               
      not null,
   TS_VINCULACAO_EVENTO_RECOMPRA TIMESTAMP             
      not null,
   CO_MATRICULA_USUARIO CHAR(10)              
      not null,
   CO_IP                CHAR(28)              
      not null,
   IC_SITUACAO_VINCULACAO CHAR(1)               
      not null default 'A'
         constraint GEC1C708 check (IC_SITUACAO_VINCULACAO in ('A','C'))
,
   constraint GECPK708 primary key (CO_NUOP, 
NU_EVENTO_UNICO_REGISTRADORA, CO_ISPB_IF_SOLICITANTE_EVNTO)
)
 in GECDB002.GECTS708;

label on table GEC.GECTB708_TED_EVNTO_RECOMPRA is 
'VINCULA_TED_EVENTO_RECOMPRA_REGISTRADORA';

--==============================================================
-- Index: GEC1I708
--==============================================================
create unique index GEC.GEC1I708 on GEC.GECTB708_TED_EVNTO_RECOMPRA (
   CO_NUOP              DESC,
   NU_EVENTO_UNICO_REGISTRADORA DESC,
   CO_ISPB_IF_SOLICITANTE_EVNTO DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB709_HSTRO_SITUACAO_EVENTO
--==============================================================
create table GEC.GECTB709_HSTRO_SITUACAO_EVENTO (
   NU_EVENTO_REGISTRADORA CHAR(21)              
      not null,
   NU_SITUACAO_EVENTO   SMALLINT              
      not null,
   TS_RECEPCAO_SITUACAO TIMESTAMP             
      not null,
   constraint GECPK709 primary key (NU_EVENTO_REGISTRADORA, 
NU_SITUACAO_EVENTO, TS_RECEPCAO_SITUACAO)
)
 in GECDB002.GECTS709;

label on table GEC.GECTB709_HSTRO_SITUACAO_EVENTO is 
'HISTORICO_SITUACAO_EVENTO_REGISTRADORA';

--==============================================================
-- Index: GEC1I709
--==============================================================
create unique index GEC.GEC1I709 on GEC.GECTB709_HSTRO_SITUACAO_EVENTO (

   NU_EVENTO_REGISTRADORA ASC,
   NU_SITUACAO_EVENTO   ASC,
   TS_RECEPCAO_SITUACAO DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I709
--==============================================================
create index GEC.GEC2I709 on GEC.GECTB709_HSTRO_SITUACAO_EVENTO (
   TS_RECEPCAO_SITUACAO DESC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB710_EVENTO_RECOMPRA_RGSDA
--==============================================================
create table GEC.GECTB710_EVENTO_RECOMPRA_RGSDA (
   NU_EVENTO_UNICO_REGISTRADORA CHAR
                                        (21)     for SBCS data
      not null,
   TS_INCLUSAO_EVENTO   TIMESTAMP (6) WITHOUT TIME ZONE
      not null,
   VR_FINANCEIRO_RECOMPRA DECIMAL(18, 2)         with default NULL,
   IC_LIQUIDACAO_FINANCEIRA_CIP CHAR(1)                for SBCS data
      not null with default 'N',
   DT_LIQUIDACAO_RECOMPRA DATE                  
      not null,
   CO_ISPB_PRTCE_LIQUIDANTE CHAR(8)                for SBCS data with 
default NULL,
   NU_SITUACAO_RECOMPRA SMALLINT              
      not null with default,
   constraint GECPK710 primary key (NU_EVENTO_UNICO_REGISTRADORA)
)
 in GECDB002.GECTS710;

label on table GEC.GECTB710_EVENTO_RECOMPRA_RGSDA is 
'EVENTO_RECOMPRA_REGISTRADORA';
label on column 
GEC.GECTB710_EVENTO_RECOMPRA_RGSDA.IC_LIQUIDACAO_FINANCEIRA_CIP is 
'IC_LIQUIDACAO_FINANCEIRA_CAMARA';
label on column 
GEC.GECTB710_EVENTO_RECOMPRA_RGSDA.CO_ISPB_PRTCE_LIQUIDANTE is 
'CO_ISPB_PARTICIPANTE_LIQUIDANTE';
--==============================================================
-- Index: GEC1I710
--==============================================================
create unique index GEC.GEC1I710 on GEC.GECTB710_EVENTO_RECOMPRA_RGSDA (

   NU_EVENTO_UNICO_REGISTRADORA DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB711_BAIXA_NOVO_CONTRATO
--==============================================================
create table GEC.GECTB711_BAIXA_NOVO_CONTRATO (
   NU_EVENTO_BAIXA      CHAR(21)              
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   CO_MODALIDADE_OPRCO_SCR3040 CHAR(4),
   CO_CONTRATO_ORIGINAL CHAR(40)              
      not null,
   IC_TIPO_CLIENTE      CHAR(1)               
      not null default 'F'
         constraint GEC1C711 check (IC_TIPO_CLIENTE in ('F','J')),
   CO_CPF_CLIENTE_TOMADOR CHAR(14)              
      not null,
   VR_RENEGOCIADO_NOVO_CONTRATO DECIMAL(18,2),
   VR_DIVIDA_NOVO_CONTRATO DECIMAL(18,2),
   constraint GECPK711 primary key (NU_EVENTO_BAIXA, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
)
 in GECDB002.GECTS711;

label on table GEC.GECTB711_BAIXA_NOVO_CONTRATO is 'BAIXA_NOVO_CONTRATO'
;
label on column GEC.GECTB711_BAIXA_NOVO_CONTRATO.NU_UNICO_CONTRATO_RGSDA
 is 'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB711_BAIXA_NOVO_CONTRATO.NU_IDNTR_PRTCE_ADMDO is
 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column 
GEC.GECTB711_BAIXA_NOVO_CONTRATO.CO_MODALIDADE_OPRCO_SCR3040 is 
'CO_MODALIDADE_OPERACAO_SCR3040';
--==============================================================
-- Index: GEC1I711
--==============================================================
create unique index GEC.GEC1I711 on GEC.GECTB711_BAIXA_NOVO_CONTRATO (
   NU_EVENTO_BAIXA      ASC,
   NU_UNICO_CONTRATO_RGSDA ASC,
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC
)
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I711
--==============================================================
create index GEC.GEC2I711 on GEC.GECTB711_BAIXA_NOVO_CONTRATO (
   CO_MODALIDADE_OPRCO_SCR3040 DESC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I711
--==============================================================
create index GEC.GEC3I711 on GEC.GECTB711_BAIXA_NOVO_CONTRATO (
   NU_EVENTO_BAIXA      DESC,
   NU_UNICO_CONTRATO_RGSDA DESC,
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB712_ARQUIVO_RECOMPRA_IF
--==============================================================
create table GEC.GECTB712_ARQUIVO_RECOMPRA_IF (
   NU_SQNCL_ARQVO_RECEBIDO DECIMAL(18)           
      not null
      generated ? as identity,
   NU_SITUACAO_ARQUIVO  SMALLINT              
      not null,
   NU_MOTIVO_INVALIDAR_ARQUIVO SMALLINT,
   NO_ARQUIVO_RECEBIDO  VARCHAR(200),
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(18)           
      not null,
   IC_VALIDACAO_CONCLUIDA CHAR(1)               
      not null
         constraint GEC1C702 check (IC_VALIDACAO_CONCLUIDA in ('S','N'))
,
   TS_RECEBIMENTO_ARQUIVO TIMESTAMP             
      not null,
   NU_ISPB_IF_CEDENTE   DECIMAL(8),
   CO_PRODUTO           SMALLINT,
   IC_SOLICITANTE_RECOMPRA CHAR(1)               
      not null
         constraint GEC2C712 check (IC_SOLICITANTE_RECOMPRA in ('1','2',
'3')),
   constraint GECPK712 primary key (NU_SQNCL_ARQVO_RECEBIDO)
)
 in GECDB002.GECTS712;

label on table GEC.GECTB712_ARQUIVO_RECOMPRA_IF is 'ARQUIVO_RECOMPRA_IF'
;
label on column GEC.GECTB712_ARQUIVO_RECOMPRA_IF.NU_SQNCL_ARQVO_RECEBIDO
 is 'NU_SEQUENCIAL_ARQUIVO_RECEBIDO';
label on column GEC.GECTB712_ARQUIVO_RECOMPRA_IF.NU_ISPB_IF_CEDENTE is 
'NU_ISPB_INSTITUICAO_FINANCEIRA_CEDENTE';
--==============================================================
-- Index: GEC1I712
--==============================================================
create unique index GEC.GEC1I712 on GEC.GECTB712_ARQUIVO_RECOMPRA_IF (
   NU_SQNCL_ARQVO_RECEBIDO DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB713_TIPO_BAIXA_PARCELA_C3
--==============================================================
create table GEC.GECTB713_TIPO_BAIXA_PARCELA_C3 (
   NU_TIPO_BAIXA_PARCELA SMALLINT              
      not null,
   DE_TIPO_BAIXA_PARCELA VARCHAR(200)          
      not null,
   constraint GECPK713 primary key (NU_TIPO_BAIXA_PARCELA)
)
 in GECDB002.GECTS713;

label on table GEC.GECTB713_TIPO_BAIXA_PARCELA_C3 is 
'TIPO_BAIXA_PARCELA_C3';

--==============================================================
-- Index: GEC1I713
--==============================================================
create unique index GEC.GEC1I713 on GEC.GECTB713_TIPO_BAIXA_PARCELA_C3 (

   NU_TIPO_BAIXA_PARCELA DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB714_BAIXA_PARCELA_RGSDA
--==============================================================
create table GEC.GECTB714_BAIXA_PARCELA_RGSDA (
   NU_EVENTO_BAIXA      CHAR(21)              
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_TIPO_BAIXA_PARCELA SMALLINT,
   NU_EVENTO_ESTORNO    CHAR(21),
   NU_PARCELA_CREDITO   DECIMAL(18)           
      not null,
   IC_EVENTO_ESTORNADO  CHAR(1)               
      not null default 'N'
         constraint GEC1C714 check (IC_EVENTO_ESTORNADO in ('S','N')),
   DT_PAGAMENTO_PARCELA DATE                  
      not null,
   VR_PAGO_PARCELA      DECIMAL(15,2)         
      not null,
   VR_PRINCIPAL_PAGO    DECIMAL(15,2),
   VR_JURO_PAGO         DECIMAL(15,2),
   VR_JURO_MORA_PAGO    DECIMAL(15,2),
   VR_MULTA_PAGA        DECIMAL(15,2),
   VR_IOF_ATRASO        DECIMAL(15,2),
   VR_DSCNO_PGMNO_PRCLA DECIMAL(15,2),
   VR_ABATIMENTO_PGMNO_PRCLA DECIMAL(15,2),
   VR_DESPESA_PAGA      DECIMAL(15,2),
   IC_LIQUIDACAO_EXTRA_JUDICIAL CHAR(1)               
      not null with default 'N'
         constraint GEC2C714 check (IC_LIQUIDACAO_EXTRA_JUDICIAL in ('S'
,'N')),
   IC_OCORRENCIA_LEILAO CHAR(1)               
      not null with default 'N'
         constraint GEC3C714 check (IC_OCORRENCIA_LEILAO in ('S','N')),

   VR_RECEBIDO_LEILAO   DECIMAL(15,2),
   IC_SEGURO_PAGO       CHAR(1)               
      not null with default 'N'
         constraint GEC4C714 check (IC_SEGURO_PAGO in ('S','N')),
   VR_NOVO_VALOR_PARCELA DECIMAL(15,2),
   VR_NOVO_VALOR_PRINCIPAL DECIMAL(15,2),
   VR_NOVO_VALOR_JUROS  DECIMAL(15,2),
   VR_NOVO_SALDO_DEVEDOR DECIMAL(15,2),
   VR_NOVO_SALDO_PREJUIZO DECIMAL(15,2),
   constraint GECPK714 primary key (NU_EVENTO_BAIXA, 
NU_UNICO_PARCELA_REGISTRADORA, NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
)
 in GECDB002.GECTS714;

label on table GEC.GECTB714_BAIXA_PARCELA_RGSDA is 
'BAIXA_PARCELA_REGISTRADORA';
label on column GEC.GECTB714_BAIXA_PARCELA_RGSDA.NU_UNICO_CONTRATO_RGSDA
 is 'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB714_BAIXA_PARCELA_RGSDA.NU_IDNTR_PRTCE_ADMDO is
 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB714_BAIXA_PARCELA_RGSDA.VR_DSCNO_PGMNO_PRCLA is
 'VR_DESCONTO_PAGAMENTO_PARCELA';
label on column 
GEC.GECTB714_BAIXA_PARCELA_RGSDA.VR_ABATIMENTO_PGMNO_PRCLA is 
'VR_ABATIMENTO_PAGAMENTO_PARCELA';
--==============================================================
-- Index: GEC1I714
--==============================================================
create unique index GEC.GEC1I714 on GEC.GECTB714_BAIXA_PARCELA_RGSDA (
   NU_EVENTO_BAIXA      DESC,
   NU_UNICO_PARCELA_REGISTRADORA DESC,
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_UNICO_CONTRATO_RGSDA ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I714
--==============================================================
create index GEC.GEC2I714 on GEC.GECTB714_BAIXA_PARCELA_RGSDA (
   NU_PARCELA_CREDITO   DESC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I714
--==============================================================
create index GEC.GEC3I714 on GEC.GECTB714_BAIXA_PARCELA_RGSDA (
   NU_EVENTO_ESTORNO    DESC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC4I714
--==============================================================
create index GEC.GEC4I714 on GEC.GECTB714_BAIXA_PARCELA_RGSDA (
   NU_UNICO_PARCELA_REGISTRADORA DESC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB715_RECOMPRA_CTRTO_RGSDA
--==============================================================
create table GEC.GECTB715_RECOMPRA_CTRTO_RGSDA (
   NU_EVENTO_UNICO_REGISTRADORA CHAR(21)              
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   VR_RECOMPRA          DECIMAL(18,2)         
      not null,
   constraint GECPK715 primary key (NU_EVENTO_UNICO_REGISTRADORA, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_PARCELA_REGISTRADORA, 
NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO)
)
 in GECDB002.GECTS715;

label on table GEC.GECTB715_RECOMPRA_CTRTO_RGSDA is 
'RECOMPRA_CONTRATO_REGISTRADORA';
label on column 
GEC.GECTB715_RECOMPRA_CTRTO_RGSDA.NU_UNICO_CONTRATO_RGSDA is 
'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB715_RECOMPRA_CTRTO_RGSDA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I715
--==============================================================
create unique index GEC.GEC1I715 on GEC.GECTB715_RECOMPRA_CTRTO_RGSDA (

   NU_EVENTO_UNICO_REGISTRADORA DESC,
   NU_UNICO_CONTRATO_RGSDA DESC,
   NU_UNICO_PARCELA_REGISTRADORA DESC,
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I715
--==============================================================
create index GEC.GEC3I715 on GEC.GECTB715_RECOMPRA_CTRTO_RGSDA (
   NU_UNICO_CONTRATO_RGSDA DESC,
   NU_UNICO_PARCELA_REGISTRADORA DESC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB716_EVENTO_BAIXA_RGSDA
--==============================================================
create table GEC.GECTB716_EVENTO_BAIXA_RGSDA (
   NU_EVENTO_BAIXA      CHAR(21)              
      not null,
   TS_INCLUSAO_EVENTO   TIMESTAMP             
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_CONTROLE_RESERVA_IF VARCHAR(40)           
      not null,
   constraint GECPK716 primary key (NU_EVENTO_BAIXA)
)
 in GECDB002.GECTS716;

label on table GEC.GECTB716_EVENTO_BAIXA_RGSDA is 
'EVENTO_BAIXA_DA_REGISTRADORA';
label on column GEC.GECTB716_EVENTO_BAIXA_RGSDA.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I716
--==============================================================
create unique index GEC.GEC1I716 on GEC.GECTB716_EVENTO_BAIXA_RGSDA (
   NU_EVENTO_BAIXA      DESC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB717_BAIXA_CONTRATO_RGSDA
--==============================================================
create table GEC.GECTB717_BAIXA_CONTRATO_RGSDA (
   NU_EVENTO_BAIXA      CHAR(21)              
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   CO_TIPO_BAIXA        CHAR(4)               
      not null,
   NU_EVENTO_ESTORNO    CHAR(21),
   IC_EVENTO_ESTORNADO  CHAR(1)               
      not null with default 'N'
         constraint GEC1C717 check (IC_EVENTO_ESTORNADO in ('S','N')),
   constraint GECPK717 primary key (NU_EVENTO_BAIXA, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
)
 in GECDB002.GECTS717;

label on table GEC.GECTB717_BAIXA_CONTRATO_RGSDA is 
'BAIXA_CONTRATO_REGISTRADORA';
label on column 
GEC.GECTB717_BAIXA_CONTRATO_RGSDA.NU_UNICO_CONTRATO_RGSDA is 
'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB717_BAIXA_CONTRATO_RGSDA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I717
--==============================================================
create unique index GEC.GEC1I717 on GEC.GECTB717_BAIXA_CONTRATO_RGSDA (

   NU_EVENTO_BAIXA      DESC,
   NU_UNICO_CONTRATO_RGSDA DESC,
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I717
--==============================================================
create index GEC.GEC2I717 on GEC.GECTB717_BAIXA_CONTRATO_RGSDA (
   NU_UNICO_CONTRATO_RGSDA DESC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC4I717
--==============================================================
create index GEC.GEC4I717 on GEC.GECTB717_BAIXA_CONTRATO_RGSDA (
   NU_EVENTO_BAIXA      DESC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB718_SITUACAO_RECOMPRA
--==============================================================
create table GEC.GECTB718_SITUACAO_RECOMPRA (
   NU_SITUACAO_RECOMPRA SMALLINT              
      not null,
   DE_SITUACAO_RECOMPRA VARCHAR(50)           
      not null,
   constraint GECPK718 primary key (NU_SITUACAO_RECOMPRA)
)
 in GECDB002.GECTS718;

label on table GEC.GECTB718_SITUACAO_RECOMPRA is 'SITUACAO_RECOMPRA';

--==============================================================
-- Index: GEC1I718
--==============================================================
create unique index GEC.GEC1I718 on GEC.GECTB718_SITUACAO_RECOMPRA (
   NU_SITUACAO_RECOMPRA DESC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB719_CREDITO_RECOMPRA
--==============================================================
create table GEC.GECTB719_CREDITO_RECOMPRA (
   NU_SQNCL_ARQVO_RECEBIDO DECIMAL(18)           
      not null,
   NU_LINHA_DETALHE     DECIMAL(18)           
      not null,
   NU_CREDITO_CONTRATO  DECIMAL(19)           
      not null,
   CO_MOTIVO_RECOMPRA   SMALLINT              
      not null,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_CPF_CLIENTE       DECIMAL(11)           
      not null,
   NU_CONTRATO_CLIENTE_IF CHAR(30)              
      not null,
   VR_CUSTAS_RECOMPRA   DECIMAL(19,2)         
      not null,
   DT_OBITO             DATE                  
      not null,
   IC_ACEITE_RECOMPRA   CHAR(1)               
      not null
         constraint GEC1C719 check (IC_ACEITE_RECOMPRA in ('1','2','3'))
,
   DT_RECOMPRA          DATE                  
      not null,
   VR_RECOMPRA          DECIMAL(18,2)         
      not null,
   IC_SITUACAO_RECOMPRA CHAR(1)               
      not null with default '0'
         constraint GEC2C719 check (IC_SITUACAO_RECOMPRA in ('0','1','2'
)),
   constraint GECPK719 primary key (NU_LINHA_DETALHE, 
NU_SQNCL_ARQVO_RECEBIDO)
)
 in GECDB002.GECTS719;

label on table GEC.GECTB719_CREDITO_RECOMPRA is 
'CREDITO_ARQUIVO_RECOMPRA';
label on column GEC.GECTB719_CREDITO_RECOMPRA.NU_SQNCL_ARQVO_RECEBIDO is
 'NU_SEQUENCIAL_ARQUIVO_RECEBIDO';
--==============================================================
-- Index: GEC1I719
--==============================================================
create unique index GEC.GEC1I719 on GEC.GECTB719_CREDITO_RECOMPRA (
   NU_LINHA_DETALHE     DESC,
   NU_SQNCL_ARQVO_RECEBIDO DESC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I719
--==============================================================
create unique index GEC.GEC2I719 on GEC.GECTB719_CREDITO_RECOMPRA (
   NU_TRANCHE           DESC,
   NU_CREDITO_CONTRATO  DESC,
   NU_CPF_CLIENTE       DESC,
   NU_CONTRATO_CLIENTE_IF DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I719
--==============================================================
create index GEC.GEC3I719 on GEC.GECTB719_CREDITO_RECOMPRA (
   NU_CREDITO_CONTRATO  DESC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB720_ARQVO_PCTE_RECOMPRA
--==============================================================
create table GEC.GECTB720_ARQVO_PCTE_RECOMPRA (
   NU_SQNCL_ARQVO_RECEBIDO DECIMAL(18)           
      not null,
   NU_SQCL_PACOTE_RECOMPRA DECIMAL(18)           
      not null,
   constraint GECPK720 primary key (NU_SQCL_PACOTE_RECOMPRA, 
NU_SQNCL_ARQVO_RECEBIDO)
)
 in GECDB002.GECTS720;

label on table GEC.GECTB720_ARQVO_PCTE_RECOMPRA is 
'ARQUIVO_PACOTE_RECOMPRA';
label on column GEC.GECTB720_ARQVO_PCTE_RECOMPRA.NU_SQNCL_ARQVO_RECEBIDO
 is 'NU_SEQUENCIAL_ARQUIVO_RECEBIDO';
--==============================================================
-- Index: GEC1I720
--==============================================================
create unique index GEC.GEC1I720 on GEC.GECTB720_ARQVO_PCTE_RECOMPRA (
   NU_SQCL_PACOTE_RECOMPRA DESC,
   NU_SQNCL_ARQVO_RECEBIDO DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB721_PACOTE_RECOMPRA
--==============================================================
create table GEC.GECTB721_PACOTE_RECOMPRA (
   NU_SQCL_PACOTE_RECOMPRA DECIMAL(18)           
      not null
      generated ? as identity,
   TS_INCLUSAO_EVENTO   TIMESTAMP             
      not null,
   DT_SIMULACAO_RECOMPRA DATE                  
      not null,
   NU_IF_CEDENTE        SMALLINT              
      not null,
   NU_PRODUTO           SMALLINT              
      not null,
   NU_SITUACAO_RECOMPRA SMALLINT              
      not null,
   VR_RECOMPRA          DECIMAL(18,2)         
      not null,
   CO_SITUACAO_EVENTO_C3 SMALLINT,
   NU_EVENTO_UNICO_REGISTRADORA CHAR(21),
   constraint GECPK721 primary key (NU_SQCL_PACOTE_RECOMPRA)
)
 in GECDB002.GECTS721;

label on table GEC.GECTB721_PACOTE_RECOMPRA is 'PACOTE_RECOMPRA';

--==============================================================
-- Index: GEC1I721
--==============================================================
create unique index GEC.GEC1I721 on GEC.GECTB721_PACOTE_RECOMPRA (
   NU_SQCL_PACOTE_RECOMPRA DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I721
--==============================================================
create index GEC.GEC2I721 on GEC.GECTB721_PACOTE_RECOMPRA (
   NU_IF_CEDENTE        DESC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB722_TED_PACOTE_RECOMPRA
--==============================================================
create table GEC.GECTB722_TED_PACOTE_RECOMPRA (
   CO_NUOP              CHAR(25)              
      not null,
   NU_SQCL_PACOTE_RECOMPRA DECIMAL(18)           
      not null,
   constraint GECPK722 primary key (CO_NUOP, NU_SQCL_PACOTE_RECOMPRA)
)
 in GECDB002.GECTS722;

label on table GEC.GECTB722_TED_PACOTE_RECOMPRA is 
'VINCULA_TED_PACOTE_RECOMPRA';

--==============================================================
-- Index: GEC1I722
--==============================================================
create unique index GEC.GEC1I722 on GEC.GECTB722_TED_PACOTE_RECOMPRA (
   CO_NUOP              DESC,
   NU_SQCL_PACOTE_RECOMPRA DESC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I722
--==============================================================
create index GEC.GEC2I722 on GEC.GECTB722_TED_PACOTE_RECOMPRA (
   NU_SQCL_PACOTE_RECOMPRA DESC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB723_DOCUMENTO_RECOMPRA
--==============================================================
create table GEC.GECTB723_DOCUMENTO_RECOMPRA (
   NU_SQCL_PACOTE_RECOMPRA DECIMAL(18)           
      not null,
   NU_SEQUENCIAL_DOCUMENTO DECIMAL(18)           
      not null,
   constraint GECPK723 primary key (NU_SEQUENCIAL_DOCUMENTO, 
NU_SQCL_PACOTE_RECOMPRA)
)
 in GECDB002.GECTS723;

label on table GEC.GECTB723_DOCUMENTO_RECOMPRA is 'DOCUMENTO_RECOMPRA';


--==============================================================
-- Index: GEC1I723
--==============================================================
create unique index GEC.GEC1I723 on GEC.GECTB723_DOCUMENTO_RECOMPRA (
   NU_SEQUENCIAL_DOCUMENTO DESC,
   NU_SQCL_PACOTE_RECOMPRA DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB724_SITUACAO_CONTRATO
--==============================================================
create table GEC.GECTB724_SITUACAO_CONTRATO (
   CO_SITUACAO_CONTRATO DECIMAL(2)            
      not null,
   DE_SITUACAO_CONTRATO VARCHAR(50)           
      not null,
   constraint GECPK724 primary key (CO_SITUACAO_CONTRATO)
)
 in GECDB002.GECTS724;

label on table GEC.GECTB724_SITUACAO_CONTRATO is 'SITUACAO_CONTRATO';

--==============================================================
-- Index: GEC1I724
--==============================================================
create unique index GEC.GEC1I724 on GEC.GECTB724_SITUACAO_CONTRATO (
   CO_SITUACAO_CONTRATO DESC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB725_CABECALHO_RLTRO_RCBDO
--==============================================================
create table GEC.GECTB725_CABECALHO_RLTRO_RCBDO (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null
      generated ? as identity,
   TS_REFERENCIA_POSICAO_LNCMO TIMESTAMP             
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   DT_MOVIMENTO_OPERACAO DATE,
   NU_STCO_PROCESSAMENTO_RLTRO SMALLINT              
      not null,
   constraint GECPK725 primary key (NU_SQNCL_RELATORIO_RECEBIDO)
)
 in GECDB002.GECTS725;

label on table GEC.GECTB725_CABECALHO_RLTRO_RCBDO is 
'CABECALHO_RELATORIO_RECEBIDO';
label on column 
GEC.GECTB725_CABECALHO_RLTRO_RCBDO.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column 
GEC.GECTB725_CABECALHO_RLTRO_RCBDO.TS_REFERENCIA_POSICAO_LNCMO is 
'TS_REFERENCIA_POSICAO_LANCAMENTO';
label on column GEC.GECTB725_CABECALHO_RLTRO_RCBDO.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column 
GEC.GECTB725_CABECALHO_RLTRO_RCBDO.NU_STCO_PROCESSAMENTO_RLTRO is 
'NU_SITUACAO_PROCESSAMENTO_RELATORIO_C3';
--==============================================================
-- Index: GEC1I725
--==============================================================
create unique index GEC.GEC1I725 on GEC.GECTB725_CABECALHO_RLTRO_RCBDO (

   NU_SQNCL_RELATORIO_RECEBIDO ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I725
--==============================================================
create index GEC.GEC2I725 on GEC.GECTB725_CABECALHO_RLTRO_RCBDO (
   TS_REFERENCIA_POSICAO_LNCMO ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB726_VNCLA_ARQVO_RLTRO_C3
--==============================================================
create table GEC.GECTB726_VNCLA_ARQVO_RLTRO_C3 (
   NU_ARQUIVO           DECIMAL(18)           
      not null,
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   constraint GECPK726 primary key (NU_ARQUIVO, 
NU_SQNCL_RELATORIO_RECEBIDO)
)
 in GECDB002.GECTS726;

label on table GEC.GECTB726_VNCLA_ARQVO_RLTRO_C3 is 
'VINCULA_ARQUIVO_RELATORIO_C3';
label on column 
GEC.GECTB726_VNCLA_ARQVO_RLTRO_C3.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
--==============================================================
-- Index: GEC1I726
--==============================================================
create unique index GEC.GEC1I726 on GEC.GECTB726_VNCLA_ARQVO_RLTRO_C3 (

   NU_ARQUIVO           ASC,
   NU_SQNCL_RELATORIO_RECEBIDO ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I726
--==============================================================
create index GEC.GEC2I726 on GEC.GECTB726_VNCLA_ARQVO_RLTRO_C3 (
   NU_SQNCL_RELATORIO_RECEBIDO ASC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I726
--==============================================================
create index GEC.GEC3I726 on GEC.GECTB726_VNCLA_ARQVO_RLTRO_C3 (
   NU_ARQUIVO           ASC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Table: GECTB727_PSCO_DIARIA_RSRVA
--==============================================================
create table GEC.GECTB727_PSCO_DIARIA_RSRVA (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   NU_LINHA_RELATORIO   DECIMAL(12)           
      not null,
   NU_SITUACAO_RESERVA  SMALLINT              
      not null,
   NU_UNICO_RESERVA     CHAR(21)              
      not null,
   NU_CONTROLE_RESERVA_IF VARCHAR(40)           
      not null,
   DT_OPERACAO_RESERVA  DATE                  
      not null,
   CO_ISPB_CEDENTE      CHAR(8),
   CO_ISPB_CESSIONARIO  CHAR(8),
   NU_IDENTIFICADOR_RESERVA CHAR(10),
   IC_COOBRIGACAO       CHAR(1)               
      not null
         constraint GEC1C727 check (IC_COOBRIGACAO in ('S','N')),
   IC_TROCA_GESTAO      CHAR(1)               
      not null
         constraint GEC2C727 check (IC_TROCA_GESTAO in ('S','N')),
   QT_CONTRATO_LANCADO_CEDENTE DECIMAL(10),
   QT_CONTRATO_LNCDO_CESSIONARIO DECIMAL(10),
   QT_CONTRATO_CASADO   DECIMAL(10),
   constraint GECPK727 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
NU_LINHA_RELATORIO)
)
 in GECDB002.GECTS727;

label on table GEC.GECTB727_PSCO_DIARIA_RSRVA is 
'POSICAO_DIARIA_RESERVA_REGISTRADORA';
label on column 
GEC.GECTB727_PSCO_DIARIA_RSRVA.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column GEC.GECTB727_PSCO_DIARIA_RSRVA.NU_CONTROLE_RESERVA_IF is
 'NU_CONTROLE_RESERVA_INSTITUICAO_FINANCEIRA';
label on column 
GEC.GECTB727_PSCO_DIARIA_RSRVA.QT_CONTRATO_LNCDO_CESSIONARIO is 
'QT_CONTRATO_LANCADO_CESSIONARIO';
--==============================================================
-- Index: GEC1I727
--==============================================================
create unique index GEC.GEC1I727 on GEC.GECTB727_PSCO_DIARIA_RSRVA (
   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   NU_LINHA_RELATORIO   ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB728_PSCO_DIARIA_CESSAO
--==============================================================
create table GEC.GECTB728_PSCO_DIARIA_CESSAO (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   NU_LINHA_RELATORIO   DECIMAL(12)           
      not null,
   NU_SITUACAO_EVENTO   SMALLINT,
   NU_UNCO_CESSAO_REGISTRADORA char(21)              
      not null,
   NU_UNICO_RESERVA     CHAR(21)              
      not null,
   VR_FINANCEIRO_OPERACAO DECIMAL(18,2),
   CO_ISPB_CEDENTE      CHAR(8),
   CO_ISPB_CESSIONARIO  CHAR(8),
   IC_LIQUIDACAO_FINANCEIRA_CIP CHAR(1)               
      not null default 'N'
         constraint GEC1C728 check (IC_LIQUIDACAO_FINANCEIRA_CIP in ('0'
,'S','N','P')),
   IC_QLFCO_CESSAO_SEM_FNNCO CHAR(1)               
      not null
         constraint GEC2C728 check (IC_QLFCO_CESSAO_SEM_FNNCO in ('0',
'1','2','3','4')),
   VR_MNTNE_NAO_FNNCO_OPRCO DECIMAL(18,2),
   DT_LIQUIDACAO_CESSAO DATE,
   NU_ISPB_LIQUIDANTE   CHAR(8)               
      not null,
   IC_RSPNL_TARIFACAO_CNTRE CHAR(1)               
      not null
         constraint GEC3C728 check (IC_RSPNL_TARIFACAO_CNTRE in ('0','1'
,'2')),
   PC_TARIFACAO_CESSAO  DECIMAL(5,2),
   IC_ALTERACAO_DADO_CADASTRAL CHAR(1)               
      not null default 'N'
         constraint GEC4C728 check (IC_ALTERACAO_DADO_CADASTRAL in ('S',
'N')),
   NU_CTRTO_CESSAO_CEDENTE CHAR(21),
   NU_CTRTO_CESSAO_CESSIONARIO CHAR(21),
   constraint GECPK728 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
NU_LINHA_RELATORIO)
)
 in GECDB002.GECTS728;

label on table GEC.GECTB728_PSCO_DIARIA_CESSAO is 
'POSICAO_DIARIA_CESSAO_REGISTRADORA';
label on column 
GEC.GECTB728_PSCO_DIARIA_CESSAO.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column 
GEC.GECTB728_PSCO_DIARIA_CESSAO.NU_UNCO_CESSAO_REGISTRADORA is 
'NU_UNICO_CESSAO_REGISTRADORA';
label on column 
GEC.GECTB728_PSCO_DIARIA_CESSAO.IC_LIQUIDACAO_FINANCEIRA_CIP is 
'IC_LIQUIDACAO_FINANCEIRA_CAMARA_INTERBANCARIA_PAGAMENTOS';
label on column 
GEC.GECTB728_PSCO_DIARIA_CESSAO.IC_QLFCO_CESSAO_SEM_FNNCO is 
'IC_QUALIFICACAO_CESSAO_SEM_FINANCEIRO';
label on column GEC.GECTB728_PSCO_DIARIA_CESSAO.VR_MNTNE_NAO_FNNCO_OPRCO
 is 'VR_MONTANTE_NAO_FINANCEIRO_OPERACAO';
label on column GEC.GECTB728_PSCO_DIARIA_CESSAO.IC_RSPNL_TARIFACAO_CNTRE
 is 'IC_RESPONSAVEL_TARIFACAO_CONTRAPARTE';
--==============================================================
-- Index: GEC1I728
--==============================================================
create unique index GEC.GEC1I728 on GEC.GECTB728_PSCO_DIARIA_CESSAO (
   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   NU_LINHA_RELATORIO   ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB729_PSCO_DIARIA_CONTRATO
--==============================================================
create table GEC.GECTB729_PSCO_DIARIA_CONTRATO (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   IC_GRUPO_EVENTO      CHAR(1)               
      not null
         constraint GEC1C729 check (IC_GRUPO_EVENTO in ('1','2','3','4',
'5','6','7','8')),
   NU_SEQUENCIAL_GRUPO  DECIMAL(15)           
      not null,
   NU_EVENTO_EVENTO     CHAR(21)              
      not null,
   NU_SITUACAO_EVENTO   SMALLINT,
   CO_MOTIVO_EVENTO     CHAR(3),
   NU_CONTROLE_EVENTO_IF VARCHAR(40),
   NU_UNICO_RESERVA_RGSDA CHAR(21),
   NU_UNCO_CONTRATO_RGSDA CHAR(21),
   IC_ACEITE_LQDCO_ANTCA_RCMPA CHAR(1)               
      not null default '0'
         constraint GEC2C729 check (IC_ACEITE_LQDCO_ANTCA_RCMPA in ('0',
'S','N')),
   CO_ISPB_NOVO_GESTOR  CHAR(8),
   IC_CANCELAMENTO      CHAR(1)               
      not null default '0'
         constraint GEC3C729 check (IC_CANCELAMENTO in ('0','S','N')),
   constraint GECPK729 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
NU_SEQUENCIAL_GRUPO, IC_GRUPO_EVENTO)
)
 in GECDB002.GECTS729;

label on table GEC.GECTB729_PSCO_DIARIA_CONTRATO is 
'POSICAO_DIARIA_CONTRATO';
label on column 
GEC.GECTB729_PSCO_DIARIA_CONTRATO.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column GEC.GECTB729_PSCO_DIARIA_CONTRATO.NU_CONTROLE_EVENTO_IF 
is 'NU_CONTROLE_EVENTO_INSTITUICAO_FINANCEIRA';
label on column GEC.GECTB729_PSCO_DIARIA_CONTRATO.NU_UNICO_RESERVA_RGSDA
 is 'NU_UNICO_RESERVA_REGISTRADORA';
label on column GEC.GECTB729_PSCO_DIARIA_CONTRATO.NU_UNCO_CONTRATO_RGSDA
 is 'NU_UNICO_CONTRATO_REGISTRADORA';
label on column 
GEC.GECTB729_PSCO_DIARIA_CONTRATO.IC_ACEITE_LQDCO_ANTCA_RCMPA is 
'IC_ACEITE_LIQUIDACAO_ANTECIPADA_RECOMPRA';
--==============================================================
-- Index: GEC1I729
--==============================================================
create unique index GEC.GEC1I729 on GEC.GECTB729_PSCO_DIARIA_CONTRATO (

   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   NU_SEQUENCIAL_GRUPO  ASC,
   IC_GRUPO_EVENTO      ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB730_PSCO_DRA_BLQO_TRNSA
--==============================================================
create table GEC.GECTB730_PSCO_DRA_BLQO_TRNSA (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   IC_GRUPO_EVENTO      CHAR(1)               
      not null
         constraint GEC1C730 check (IC_GRUPO_EVENTO in ('1','2','3','4'
)),
   NU_SEQUENCIAL_GRUPO  DECIMAL(15)           
      not null,
   NU_CONTROLE_EVENTO_IF CHAR(20),
   CO_ISPB_BENEFICIADOR CHAR(8),
   CO_ISPB_BENEFICIARIO CHAR(8),
   QT_CONTRATO_ENVIADO  DECIMAL(10),
   QT_CONTRATO_RETORNADO DECIMAL(10),
   DT_REFERENCIA_POSICAO_LNCMO DATE,
   constraint GECPK730 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
NU_SEQUENCIAL_GRUPO, IC_GRUPO_EVENTO)
)
 in GECDB002.GECTS730;

label on table GEC.GECTB730_PSCO_DRA_BLQO_TRNSA is 
'POSICAO_DIARIA_BLOQUEIO_TRANSFERENCIA';
label on column 
GEC.GECTB730_PSCO_DRA_BLQO_TRNSA.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column GEC.GECTB730_PSCO_DRA_BLQO_TRNSA.NU_CONTROLE_EVENTO_IF 
is 'NU_CONTROLE_EVENTO_INSTITUICAO_FINANCEIRA';
--==============================================================
-- Index: GEC1I730
--==============================================================
create unique index GEC.GEC1I730 on GEC.GECTB730_PSCO_DRA_BLQO_TRNSA (
   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   NU_SEQUENCIAL_GRUPO  ASC,
   IC_GRUPO_EVENTO      ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB731_PSCO_DRA_LQDCO_RPSE
--==============================================================
create table GEC.GECTB731_PSCO_DRA_LQDCO_RPSE (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   IC_GRUPO_EVENTO      CHAR(1)               
      not null
         constraint GEC1C731 check (IC_GRUPO_EVENTO in ('1','2','3','4'
)),
   NU_SEQUENCIAL_GRUPO  DECIMAL(15)           
      not null,
   NU_SITUACAO_EVENTO   SMALLINT              
      not null,
   NU_EVENTO_REGISTRADORA CHAR(21)              
      not null,
   NU_EVENTO_ESTORNAR   CHAR(21),
   NU_CONTROLE_EVENTO_IF CHAR(40),
   VR_FINANCEIRO_REPASSE DECIMAL(18,2),
   IC_LIQUIDACAO_FINANCEIRA_CIP CHAR(1)               
      not null
         constraint GEC2C731 check (IC_LIQUIDACAO_FINANCEIRA_CIP in ('0'
,'S','N')),
   DT_LIQUIDACAO_REPASSE DATE,
   CO_ISPB_PRTCE_LIQUIDANTE CHAR(8),
   constraint GECPK731 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO)
)
 in GECDB002.GECTS731;

label on table GEC.GECTB731_PSCO_DRA_LQDCO_RPSE is 
'POSICAO_DIARIA_LIQUIDACAO_REPASSE';
label on column 
GEC.GECTB731_PSCO_DRA_LQDCO_RPSE.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column GEC.GECTB731_PSCO_DRA_LQDCO_RPSE.NU_CONTROLE_EVENTO_IF 
is 'NU_CONTROLE_EVENTO_INSTITUICAO_FINANCEIRA';
label on column 
GEC.GECTB731_PSCO_DRA_LQDCO_RPSE.IC_LIQUIDACAO_FINANCEIRA_CIP is 
'IC_LIQUIDACAO_FINANCEIRA_CAMARA_INTERBANCARIA_PAGAMENTO';
label on column 
GEC.GECTB731_PSCO_DRA_LQDCO_RPSE.CO_ISPB_PRTCE_LIQUIDANTE is 
'CO_ISPB_PARTICIPANTE_LIQUIDANTE';
--==============================================================
-- Index: GEC1I731
--==============================================================
create unique index GEC.GEC1I731 on GEC.GECTB731_PSCO_DRA_LQDCO_RPSE (
   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   IC_GRUPO_EVENTO      ASC,
   NU_SEQUENCIAL_GRUPO  ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB732_PSCO_DRA_BAIXA_CTRTO
--==============================================================
create table GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   IC_GRUPO_EVENTO      CHAR(1)               
      not null
         constraint GEC1C732 check (IC_GRUPO_EVENTO in ('1','2','3','4'
)),
   NU_SEQUENCIAL_GRUPO  DECIMAL(15)           
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_SITUACAO_EVENTO   SMALLINT              
      not null,
   NU_EVENTO_REGISTRADORA CHAR(21)              
      not null,
   NU_EVENTO_ESTORNAR   CHAR(21),
   NU_CONTROLE_EVENTO_IF CHAR(40),
   CO_TIPO_BAIXA        CHAR(4),
   CO_NOVO_CONTRATO     CHAR(40),
   CO_MODALIDADE_OPRCO_SCR3040 CHAR(4),
   VR_RENEGOCIADO_NOVO_CONTRATO DECIMAL(18,2),
   constraint GECPK732 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO)
)
 in GECDB002.GECTS732;

label on table GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO is 
'POSICAO_DIARIA_BAIXA_CONTRATO';
label on column 
GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column 
GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO.NU_UNICO_CONTRATO_RGSDA is 
'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO.NU_CONTROLE_EVENTO_IF 
is 'NU_CONTROLE_EVENTO_INSTITUICAO_FINANCEIRA';
label on column 
GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO.CO_MODALIDADE_OPRCO_SCR3040 is 
'CO_MODALIDADE_OPERACAO_SCR3040';
--==============================================================
-- Index: GEC1I732
--==============================================================
create unique index GEC.GEC1I732 on GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO (

   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   IC_GRUPO_EVENTO      ASC,
   NU_SEQUENCIAL_GRUPO  ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB733_CTRTO_PSCO_LNCMO_DRO
--==============================================================
create table GEC.GECTB733_CTRTO_PSCO_LNCMO_DRO (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   IC_GRUPO_EVENTO      CHAR(1)               
      not null
         constraint GEC1C733 check (IC_GRUPO_EVENTO in ('1','2','3','4'
)),
   NU_SEQUENCIAL_GRUPO  DECIMAL(15)           
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   constraint GECPK733 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO, NU_UNICO_CONTRATO_RGSDA)
)
 in GECDB002.GECTS733;

label on table GEC.GECTB733_CTRTO_PSCO_LNCMO_DRO is 
'CONTRATO_POSICAO_LANCAMENTO_DIARIO';
label on column 
GEC.GECTB733_CTRTO_PSCO_LNCMO_DRO.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column 
GEC.GECTB733_CTRTO_PSCO_LNCMO_DRO.NU_UNICO_CONTRATO_RGSDA is 
'NU_UNICO_CONTRATO_REGISTRADORA';
--==============================================================
-- Index: GEC1I733
--==============================================================
create unique index GEC.GEC1I733 on GEC.GECTB733_CTRTO_PSCO_LNCMO_DRO (

   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   IC_GRUPO_EVENTO      ASC,
   NU_SEQUENCIAL_GRUPO  ASC,
   NU_UNICO_CONTRATO_RGSDA ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I733
--==============================================================
create index GEC.GEC2I733 on GEC.GECTB733_CTRTO_PSCO_LNCMO_DRO (
   NU_UNICO_CONTRATO_RGSDA ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB734_RLTRO_QUITACAO_CESSAO
--==============================================================
create table GEC.GECTB734_RLTRO_QUITACAO_CESSAO (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   NU_UNCO_CESSAO_REGISTRADORA CHAR(21)              
      not null,
   DT_CONTRATACAO_CESSAO DATE                  
      not null,
   CO_ISPB_CEDENTE      CHAR(8)               
      not null,
   CO_ISPB_CESSIONARIO  CHAR(8)               
      not null,
   constraint GECPK734 primary key (NU_UNCO_CESSAO_REGISTRADORA, 
NU_SQNCL_RELATORIO_RECEBIDO)
)
 in GECDB002.GECTS734;

label on table GEC.GECTB734_RLTRO_QUITACAO_CESSAO is 
'RELATORIO_QUITACAO_CESSAO';
label on column 
GEC.GECTB734_RLTRO_QUITACAO_CESSAO.NU_UNCO_CESSAO_REGISTRADORA is 
'NU_UNICO_CESSAO_REGISTRADORA';
--==============================================================
-- Index: GEC1I734
--==============================================================
create unique index GEC.GEC1I734 on GEC.GECTB734_RLTRO_QUITACAO_CESSAO (

   NU_UNCO_CESSAO_REGISTRADORA ASC,
   NU_SQNCL_RELATORIO_RECEBIDO ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB735_PSCO_DRA_VNCMO_PRCLA
--==============================================================
create table GEC.GECTB735_PSCO_DRA_VNCMO_PRCLA (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   IC_GRUPO_EVENTO      CHAR(1)               
      not null
         constraint GEC1C735 check (IC_GRUPO_EVENTO in ('1','2')),
   NU_SEQUENCIAL_GRUPO  DECIMAL(15)           
      not null,
   NU_UNCO_CESSAO_REGISTRADORA CHAR(21),
   CO_ISPB_CEDENTE      CHAR(8),
   CO_ISPB_CESSIONARIO  CHAR(8),
   VR_SOMA_PARCELA      DECIMAL(18,2),
   constraint GECPK735 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO)
)
 in GECDB002.GECTS735;

label on table GEC.GECTB735_PSCO_DRA_VNCMO_PRCLA is 
'POSICAO_DIARIA_VENCIMENTO_PARCELA';
label on column 
GEC.GECTB735_PSCO_DRA_VNCMO_PRCLA.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column 
GEC.GECTB735_PSCO_DRA_VNCMO_PRCLA.NU_UNCO_CESSAO_REGISTRADORA is 
'NU_UNICO_CESSAO_REGISTRADORA';
--==============================================================
-- Index: GEC1I735
--==============================================================
create unique index GEC.GEC1I735 on GEC.GECTB735_PSCO_DRA_VNCMO_PRCLA (

   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   IC_GRUPO_EVENTO      ASC,
   NU_SEQUENCIAL_GRUPO  ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB736_CONTRATO_PSCO_PRCLA
--==============================================================
create table GEC.GECTB736_CONTRATO_PSCO_PRCLA (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   IC_GRUPO_EVENTO      CHAR(1)               
      not null
         constraint GEC1C736 check (IC_GRUPO_EVENTO in ('1','2')),
   NU_SEQUENCIAL_GRUPO  DECIMAL(15)           
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   CO_CONTRATO_ORIGINAL CHAR(40)              
      not null,
   CO_ISPB_ENTE_CONSIGNANTE CHAR(8),
   constraint GECPK736 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO, NU_UNICO_CONTRATO_RGSDA)
)
 in GECDB002.GECTS736;

label on table GEC.GECTB736_CONTRATO_PSCO_PRCLA is 
'CONTRATO_POSICAO_DIARIA_VENCIMENTO_PARCELA';
label on column 
GEC.GECTB736_CONTRATO_PSCO_PRCLA.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column GEC.GECTB736_CONTRATO_PSCO_PRCLA.NU_UNICO_CONTRATO_RGSDA
 is 'NU_UNICO_CONTRATO_REGISTRADORA';
--==============================================================
-- Index: GEC1I736
--==============================================================
create unique index GEC.GEC1I736 on GEC.GECTB736_CONTRATO_PSCO_PRCLA (
   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   IC_GRUPO_EVENTO      ASC,
   NU_SEQUENCIAL_GRUPO  ASC,
   NU_UNICO_CONTRATO_RGSDA ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB737_PRCLA_PSCO_DRA_VNCMO
--==============================================================
create table GEC.GECTB737_PRCLA_PSCO_DRA_VNCMO (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   IC_GRUPO_EVENTO      CHAR(1)               
      not null
         constraint GEC1C737 check (IC_GRUPO_EVENTO in ('1','2')),
   NU_SEQUENCIAL_GRUPO  DECIMAL(15)           
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   NU_SITUACAO_PARCELA_RGSDA SMALLINT,
   DT_VENCIMENTO_PARCELA DATE                  
      not null,
   VR_VENCIMENTO_PARCELA DECIMAL(18,2)         
      not null,
   constraint GECPK737 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO, NU_UNICO_CONTRATO_RGSDA, 
NU_UNICO_PARCELA_REGISTRADORA)
)
 in GECDB002.GECTS737;

label on table GEC.GECTB737_PRCLA_PSCO_DRA_VNCMO is 
'PARCELAS_POSICAO_DIARIA_VENCIMENTO_PARCELA';
label on column 
GEC.GECTB737_PRCLA_PSCO_DRA_VNCMO.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
label on column 
GEC.GECTB737_PRCLA_PSCO_DRA_VNCMO.NU_UNICO_CONTRATO_RGSDA is 
'NU_UNICO_CONTRATO_REGISTRADORA';
label on column 
GEC.GECTB737_PRCLA_PSCO_DRA_VNCMO.NU_SITUACAO_PARCELA_RGSDA is 
'NU_SITUACAO_PARCELA_REGISTRADORA';
--==============================================================
-- Index: GEC1I737
--==============================================================
create unique index GEC.GEC1I737 on GEC.GECTB737_PRCLA_PSCO_DRA_VNCMO (

   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   IC_GRUPO_EVENTO      ASC,
   NU_SEQUENCIAL_GRUPO  ASC,
   NU_UNICO_CONTRATO_RGSDA ASC,
   NU_UNICO_PARCELA_REGISTRADORA ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB738_GRNTA_CRDTO_CLIENTE
--==============================================================
create table GEC.GECTB738_GRNTA_CRDTO_CLIENTE (
   NU_SEQUENCIAL_GARANTIA DECIMAL(18)           
      not null
      generated ? as identity,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_ARQUIVO           DECIMAL(18)           
      not null,
   NU_TIPO_CONTRATO     SMALLINT              
      not null,
   IC_TIPO_GARANTIA     CHAR(1)               
      not null
         constraint GEC1C738 check (IC_TIPO_GARANTIA in ('1','2')),
   IC_STCO_CTRTO_RFRNE_GRNTA CHAR(1)               
      not null
         constraint GEC2C738 check (IC_STCO_CTRTO_RFRNE_GRNTA in ('G',
'I','N','V','C','S')),
   CO_ISPB_AGENTE_VALIDADOR CHAR(8),
   CO_ISPB_ORIGINADOR_CONTRATO CHAR(8)               
      not null,
   CO_ISPB_GESTOR_CONTRATO CHAR(8),
   constraint GECPK738 primary key (NU_SEQUENCIAL_GARANTIA)
)
 in GECDB002.GECTS738;

label on table GEC.GECTB738_GRNTA_CRDTO_CLIENTE is 
'GARANTIA_CREDITO_CLIENTE';
label on column GEC.GECTB738_GRNTA_CRDTO_CLIENTE.NU_UNICO_CONTRATO_RGSDA
 is 'NU_UNICO_CONTRATO_REGISTRADORA';
label on column GEC.GECTB738_GRNTA_CRDTO_CLIENTE.NU_IDNTR_PRTCE_ADMDO is
 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column 
GEC.GECTB738_GRNTA_CRDTO_CLIENTE.IC_STCO_CTRTO_RFRNE_GRNTA is 
'IC_SITUACAO_CONTRATO_REFERENTE_GARANTIA';
--==============================================================
-- Index: GEC1I738
--==============================================================
create unique index GEC.GEC1I738 on GEC.GECTB738_GRNTA_CRDTO_CLIENTE (
   NU_SEQUENCIAL_GARANTIA ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I738
--==============================================================
create index GEC.GEC2I738 on GEC.GECTB738_GRNTA_CRDTO_CLIENTE (
   NU_UNICO_RESERVA_REGISTRADORA DESC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_UNICO_CONTRATO_RGSDA ASC
)
USING STOGROUP SYSDEFLT
    PRIQTY -1 SECQTY -1
    ERASE  NO
    FREEPAGE 0 PCTFREE 10
    GBPCACHE CHANGED
    NOT CLUSTER
    COMPRESS NO
    INCLUDE NULL KEYS
    BUFFERPOOL BP11
    CLOSE YES
    COPY NO
    DEFER NO
    DEFINE YES
    PIECESIZE 2 G;

--==============================================================
-- Index: GEC3I738
--==============================================================
create index GEC.GEC3I738 on GEC.GECTB738_GRNTA_CRDTO_CLIENTE (
   NU_ARQUIVO           ASC,
   NU_UNICO_CONTRATO_RGSDA ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB739_VEICULO_GRNTA_CLIENTE
--==============================================================
create table GEC.GECTB739_VEICULO_GRNTA_CLIENTE (
   NU_SEQUENCIAL_GARANTIA DECIMAL(18)           
      not null,
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   IC_SITUACAO_GARANTIA CHAR(1)               
      not null
         constraint GEC1C739 check (IC_SITUACAO_GARANTIA in ('1','2')),

   CO_STCO_GRNTA_AGENTE_VALIDADOR CHAR(13)              
      not null,
   CO_IDENTIFICADOR_CHASSI CHAR(17)              
      not null,
   NU_SITUACAO_VALIDACAO_PARCELA SMALLINT,
   NU_CNPJ_BASE_BNFRO_CRIVO DECIMAL(8),
   constraint GECPK739 primary key (NU_SEQUENCIAL_GARANTIA, 
NU_UNICO_GARANTIA_RGSDA)
)
 in GECDB002.GECTS739;

label on table GEC.GECTB739_VEICULO_GRNTA_CLIENTE is 
'VEICULO_GARANTIA_CLIENTE';
label on column 
GEC.GECTB739_VEICULO_GRNTA_CLIENTE.NU_UNICO_GARANTIA_RGSDA is 
'NU_UNICO_GARANTIA_REGISTRADORA';
label on column 
GEC.GECTB739_VEICULO_GRNTA_CLIENTE.CO_STCO_GRNTA_AGENTE_VALIDADOR is 
'CO_SITUACAO_GARANTIA_AGENTE_VALIDADOR';
label on column 
GEC.GECTB739_VEICULO_GRNTA_CLIENTE.NU_CNPJ_BASE_BNFRO_CRIVO is 
'NU_CNPJ_BASE_BENEFICIARIO_CRIVO';
--==============================================================
-- Index: GEC1I739
--==============================================================
create unique index GEC.GEC1I739 on GEC.GECTB739_VEICULO_GRNTA_CLIENTE (

   NU_SEQUENCIAL_GARANTIA ASC,
   NU_UNICO_GARANTIA_RGSDA ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB740_CNSGA_GARANTIA_CLNTE
--==============================================================
create table GEC.GECTB740_CNSGA_GARANTIA_CLNTE (
   NU_SEQUENCIAL_GARANTIA DECIMAL(18)           
      not null,
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   NU_ISPB_CONSIGNANTE  CHAR(8)               
      not null,
   IC_SITUACAO_GARANTIA CHAR(1)               
      not null
         constraint GEC1C740 check (IC_SITUACAO_GARANTIA in ('1','2')),

   CO_STCO_GRNTA_AGENTE_VALIDADOR CHAR(13)              
      not null,
   NU_CONTRATO_ENTE_CONSIGNANTE CHAR(20),
   NU_BENEFICIO_ENTE_CONSIGNANTE DECIMAL(10),
   NU_MATRICULA_ENTE_CONSIGNANTE DECIMAL(20),
   constraint GECPK740 primary key (NU_SEQUENCIAL_GARANTIA, 
NU_UNICO_GARANTIA_RGSDA)
)
 in GECDB002.GECTS740;

label on table GEC.GECTB740_CNSGA_GARANTIA_CLNTE is 
'CONSIGNADORA_GARANTIA_CLIENTE';
label on column 
GEC.GECTB740_CNSGA_GARANTIA_CLNTE.NU_UNICO_GARANTIA_RGSDA is 
'NU_UNICO_GARANTIA_REGISTRADORA';
label on column 
GEC.GECTB740_CNSGA_GARANTIA_CLNTE.CO_STCO_GRNTA_AGENTE_VALIDADOR is 
'CO_SITUACAO_GARANTIA_AGENTE_VALIDADOR';
--==============================================================
-- Index: GEC1I740
--==============================================================
create unique index GEC.GEC1I740 on GEC.GECTB740_CNSGA_GARANTIA_CLNTE (

   NU_SEQUENCIAL_GARANTIA ASC,
   NU_UNICO_GARANTIA_RGSDA ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB741_ENDERECO_GARANTIA
--==============================================================
create table GEC.GECTB741_ENDERECO_GARANTIA (
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   NU_SEQUENCIAL_ENDCO_GRNTA DECIMAL(18)           
      not null,
   NU_CPF_CNPJ_PESSOA   SMALLINT,
   IC_TIPO_PESSOA       CHAR(1)               
         constraint GEC1C741 check (IC_TIPO_PESSOA is null or 
(IC_TIPO_PESSOA in ('F','J'))),
   IC_TIPO_ENDERECO     CHAR(1)               
      not null
         constraint GEC2C741 check (IC_TIPO_ENDERECO in ('R','C','P')),

   DE_ENDERECO_GARANTIA CHAR(140)             
      not null,
   DE_CIDADE_GARANTIA   VARCHAR(80),
   SG_UF_GARANTIA       CHAR(2)               
      not null,
   NU_CEP_GARANTIA      CHAR(8),
   NO_PAIS_GARANTIA     VARCHAR(15),
   IC_IDENTIFICACAO_ENDERECO CHAR(1)               
         constraint GEC3C741 check (IC_IDENTIFICACAO_ENDERECO is null or
 (IC_IDENTIFICACAO_ENDERECO in ('0','1','2'))),
   constraint GECPK741 primary key (NU_SEQUENCIAL_ENDCO_GRNTA, 
NU_UNICO_GARANTIA_RGSDA)
)
 in GECDB002.GECTS741;

label on table GEC.GECTB741_ENDERECO_GARANTIA is 'ENDERECO_GARANTIA';
label on column GEC.GECTB741_ENDERECO_GARANTIA.NU_UNICO_GARANTIA_RGSDA 
is 'NU_UNICO_GARANTIA_REGISTRADORA';
label on column GEC.GECTB741_ENDERECO_GARANTIA.NU_SEQUENCIAL_ENDCO_GRNTA
 is 'NU_SEQUENCIAL_ENDERECO_GARANTIA';
--==============================================================
-- Index: GEC1I741
--==============================================================
create unique index GEC.GEC1I741 on GEC.GECTB741_ENDERECO_GARANTIA (
   NU_SEQUENCIAL_ENDCO_GRNTA ASC,
   NU_UNICO_GARANTIA_RGSDA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB742_TIPO_IMOVEL
--==============================================================
create table GEC.GECTB742_TIPO_IMOVEL (
   NU_TIPO_IMOVEL       SMALLINT              
      not null,
   DE_TIPO_IMOVEL       VARCHAR(200)          
      not null,
   constraint GECPK742 primary key (NU_TIPO_IMOVEL)
)
 in GECDB002.GECTS742;

label on table GEC.GECTB742_TIPO_IMOVEL is 'TIPO_IMOVEL';

--==============================================================
-- Index: GEC1I742
--==============================================================
create unique index GEC.GEC1I742 on GEC.GECTB742_TIPO_IMOVEL (
   NU_TIPO_IMOVEL       ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB743_TIPO_PRODUTO
--==============================================================
create table GEC.GECTB743_TIPO_PRODUTO (
   CO_TIPO_PRODUTO      CHAR(4)               
      not null,
   DE_TIPO_PRODUTO      VARCHAR(200)          
      not null,
   constraint GECPK743 primary key (CO_TIPO_PRODUTO)
)
 in GECDB002.GECTS743;

label on table GEC.GECTB743_TIPO_PRODUTO is 'TIPO_PRODUTO';

--==============================================================
-- Index: GEC1I743
--==============================================================
create unique index GEC.GEC1I743 on GEC.GECTB743_TIPO_PRODUTO (
   CO_TIPO_PRODUTO      ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB744_MRCDA_GRNTA_CESSAO
--==============================================================
create table GEC.GECTB744_MRCDA_GRNTA_CESSAO (
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   CO_TIPO_PRODUTO_MERCADORIA VARCHAR(60)           
      not null,
   CO_PRODUTO_MERCADORIA CHAR(2),
   DE_PRODUTO_MERCADORIA VARCHAR(80),
   VR_PESO_LIQUIDO_MERCADORIA DECIMAL(13,4),
   AA_SAFRA_MERCADORIA  SMALLINT,
   QT_PRODUTO_MERCADORIA INT,
   CO_UNIDADE_PRODUTO_MERCADORIA INT,
   constraint GECPK744 primary key (NU_UNICO_GARANTIA_RGSDA)
)
 in GECDB002.GECTS744;

label on table GEC.GECTB744_MRCDA_GRNTA_CESSAO is 
'MERCADORIA_GARANTIA_CESSAO';
label on column GEC.GECTB744_MRCDA_GRNTA_CESSAO.NU_UNICO_GARANTIA_RGSDA 
is 'NU_UNICO_GARANTIA_REGISTRADORA';
--==============================================================
-- Index: GEC1I744
--==============================================================
create unique index GEC.GEC1I744 on GEC.GECTB744_MRCDA_GRNTA_CESSAO (
   NU_UNICO_GARANTIA_RGSDA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB746_STCO_BAIXA_PARCELA
--==============================================================
create table GEC.GECTB746_STCO_BAIXA_PARCELA (
   NU_SITUACAO_BAIXA_PARCELA DECIMAL(2)            
      not null,
   DE_SITUACAO_BAIXA_PARCELA VARCHAR(50)           
      not null,
   constraint GECPK746 primary key (NU_SITUACAO_BAIXA_PARCELA)
)
 in GECDB002.GECTS746;

label on table GEC.GECTB746_STCO_BAIXA_PARCELA is 
'SITUACAO_BAIXA_PARCELA';

--==============================================================
-- Index: GEC1I746
--==============================================================
create unique index GEC.GEC1I746 on GEC.GECTB746_STCO_BAIXA_PARCELA (
   NU_SITUACAO_BAIXA_PARCELA ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB747_RLTRO_GRNTA_RGSDA
--==============================================================
create table GEC.GECTB747_RLTRO_GRNTA_RGSDA (
   NU_SEQUENCIAL_RELATORIO DECIMAL(10)           
      not null,
   NU_IF                SMALLINT              
      not null,
   NU_PRODUTO           SMALLINT              
      not null,
   NU_TRANCHE           DECIMAL(8),
   QT_CREDITO_GERADO    SMALLINT              
      not null,
   constraint GECPK747 primary key (NU_SEQUENCIAL_RELATORIO, NU_IF, 
NU_PRODUTO)
)
 in GECDB002.GECTS747;

label on table GEC.GECTB747_RLTRO_GRNTA_RGSDA is 
'RELATORIO_GARANTIA_C3_REGISTRADORA';
label on column GEC.GECTB747_RLTRO_GRNTA_RGSDA.NU_IF is 
'NU_INSTITUICAO_FINANCEIRA';
--==============================================================
-- Index: GEC1I747
--==============================================================
create unique index GEC.GEC1I747 on GEC.GECTB747_RLTRO_GRNTA_RGSDA (
   NU_SEQUENCIAL_RELATORIO ASC,
   NU_IF                ASC,
   NU_PRODUTO           ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB748_DTLHE_RLTRO_GRNTA
--==============================================================
create table GEC.GECTB748_DTLHE_RLTRO_GRNTA (
   NU_SEQUENCIAL_RELATORIO DECIMAL(10)           
      not null,
   NU_IF                SMALLINT              
      not null,
   NU_PRODUTO           SMALLINT              
      not null,
   NU_CREDITO_CONTRATO  DECIMAL(19)           
      not null,
   NU_TRANCHE           DECIMAL(8)            
      not null,
   NU_SEQUENCIAL_GARANTIA_ATUAL DECIMAL(18)           
      not null,
   NU_SQNCL_GARANTIA_ANTERIOR DECIMAL(18)           
      not null,
   DT_RECEBIMENTO_ATUAL DATE                  
      not null,
   DT_RECEBIMENTO_ANTERIOR DATE                  
      not null,
   IC_STCO_GRNTA_ATUAL  CHAR(1)               
      not null default 'G'
         constraint GEC1C748 check (IC_STCO_GRNTA_ATUAL in ('G','I','N',
'V','C','S','0')),
   IC_STCO_GRNTA_ANTERIOR CHAR(1)               
      not null default 'G'
         constraint GEC2C748 check (IC_STCO_GRNTA_ANTERIOR in ('G','I',
'N','V','C','S','0')),
   NU_UNICO_GARANTIA_ATUAL CHAR(21)              
      not null,
   NU_UNICO_GARANTIA_ANTERIOR CHAR(21)              
      not null,
   CO_STCO_GRNTA_AGENTE_VLDDR_ATL CHAR(13)              
      not null,
   CO_STCO_GRNTA_AGENTE_VLDDR_ANR CHAR(13)              
      not null,
   constraint GECPK748 primary key (NU_SEQUENCIAL_RELATORIO, NU_IF, 
NU_PRODUTO, NU_CREDITO_CONTRATO)
)
 in GECDB002.GECTS748;

label on table GEC.GECTB748_DTLHE_RLTRO_GRNTA is 
'DETALHE_RELATORIO_GARANTIA_REGISTRADORA';
label on column GEC.GECTB748_DTLHE_RLTRO_GRNTA.NU_IF is 
'NU_INSTITUICAO_FINANCEIRA';
label on column 
GEC.GECTB748_DTLHE_RLTRO_GRNTA.NU_SQNCL_GARANTIA_ANTERIOR is 
'NU_SEQUENCIAL_GARANTIA_ANTERIOR';
label on column GEC.GECTB748_DTLHE_RLTRO_GRNTA.IC_STCO_GRNTA_ATUAL is 
'IC_SITUACAO_GARANTIA_ATUAL';
label on column GEC.GECTB748_DTLHE_RLTRO_GRNTA.IC_STCO_GRNTA_ANTERIOR is
 'IC_SITUACAO_GARANTIA_ANTERIOR';
label on column 
GEC.GECTB748_DTLHE_RLTRO_GRNTA.CO_STCO_GRNTA_AGENTE_VLDDR_ATL is 
'CO_SITUACAO_GARANTIA_ATUAL';
label on column 
GEC.GECTB748_DTLHE_RLTRO_GRNTA.CO_STCO_GRNTA_AGENTE_VLDDR_ANR is 
'CO_SITUACAO_GARANTIA_ANTERIOR';
--==============================================================
-- Index: GEC1I748
--==============================================================
create unique index GEC.GEC1I748 on GEC.GECTB748_DTLHE_RLTRO_GRNTA (
   NU_SEQUENCIAL_RELATORIO ASC,
   NU_IF                ASC,
   NU_PRODUTO           ASC,
   NU_CREDITO_CONTRATO  ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 5
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB749_PESSOA_INSNO_FNNCO
--==============================================================
create table GEC.GECTB749_PESSOA_INSNO_FNNCO (
   NU_CPF_CNPJ_PESSOA   CHAR(14)              
      not null,
   IC_TIPO_PESSOA       CHAR(1)               
      not null
         constraint GEC1C749 check (IC_TIPO_PESSOA in ('F','J')),
   NO_PESSOA            VARCHAR(80),
   IC_TIPO_PESSOA_VINCULADA CHAR(1)               
         constraint GEC2C749 check (IC_TIPO_PESSOA_VINCULADA is null or 
(IC_TIPO_PESSOA_VINCULADA in ('F','J'))),
   constraint GECPK749 primary key (NU_CPF_CNPJ_PESSOA, IC_TIPO_PESSOA)

)
 in GECDB002.GECTS749;

label on table GEC.GECTB749_PESSOA_INSNO_FNNCO is 
'PESSOA_INSTRUMENTO_FINANCEIRO';

--==============================================================
-- Index: GEC1I749
--==============================================================
create unique index GEC.GEC1I749 on GEC.GECTB749_PESSOA_INSNO_FNNCO (
   NU_CPF_CNPJ_PESSOA   ASC,
   IC_TIPO_PESSOA       ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB750_PESSOA_GARANTIA
--==============================================================
create table GEC.GECTB750_PESSOA_GARANTIA (
   NU_UNICO_GARANTIA_RGSDA CHAR(21)              
      not null,
   NU_CPF_CNPJ_PESSOA   CHAR(14)              
      not null,
   IC_TIPO_PESSOA       CHAR(1)               
      not null
         constraint GEC1C750 check (IC_TIPO_PESSOA in ('F','J')),
   constraint GECPK750 primary key (NU_UNICO_GARANTIA_RGSDA, 
NU_CPF_CNPJ_PESSOA, IC_TIPO_PESSOA)
)
 in GECDB002.GECTS750;

label on table GEC.GECTB750_PESSOA_GARANTIA is 
'PESSOA_GARANTIA_INSTRUMENTO_FINANCEIRO';
label on column GEC.GECTB750_PESSOA_GARANTIA.NU_UNICO_GARANTIA_RGSDA is 
'NU_UNICO_GARANTIA_REGISTRADORA';
--==============================================================
-- Index: GEC1I750
--==============================================================
create unique index GEC.GEC1I750 on GEC.GECTB750_PESSOA_GARANTIA (
   NU_UNICO_GARANTIA_RGSDA DESC,
   NU_CPF_CNPJ_PESSOA   DESC,
   IC_TIPO_PESSOA       DESC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB751_VINCULA_ARQVO_EVNTO
--==============================================================
create table GEC.GECTB751_VINCULA_ARQVO_EVNTO (
   NU_ARQUIVO           DECIMAL(18)           
      not null,
   NU_EVENTO_RGSDA      CHAR(21)              
      not null,
   constraint GECPK751 primary key (NU_ARQUIVO, NU_EVENTO_RGSDA)
)
 in GECDB002.GECTS751;

label on table GEC.GECTB751_VINCULA_ARQVO_EVNTO is 
'VINCULA_ARQUIVO_EVENTO';

--==============================================================
-- Index: GEC1I751
--==============================================================
create unique index GEC.GEC1I751 on GEC.GECTB751_VINCULA_ARQVO_EVNTO (
   NU_ARQUIVO           DESC,
   NU_EVENTO_RGSDA      DESC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB752_EVENTO_RGSDA
--==============================================================
create table GEC.GECTB752_EVENTO_RGSDA (
   NU_EVENTO_RGSDA      CHAR(21)              
      not null,
   CO_ISPB_IF_SOLICITANTE_EVNTO CHAR(8)               
      not null,
   NU_SITUACAO_EVENTO   SMALLINT,
   IC_TIPO_EVENTO       CHAR(1)               
      not null
         constraint GEC1C752 check (IC_TIPO_EVENTO in ('1','2','3','4'))
,
   NU_IDNTR_PRTCE_ADMDO CHAR(8),
   constraint GECPK752 primary key (NU_EVENTO_RGSDA)
)
 in GECDB002.GECTS752;

label on column GEC.GECTB752_EVENTO_RGSDA.CO_ISPB_IF_SOLICITANTE_EVNTO 
is 'CO_ISPB_IF_SOLICITANTE_EVENTO';
label on column GEC.GECTB752_EVENTO_RGSDA.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I752
--==============================================================
create unique index GEC.GEC1I752 on GEC.GECTB752_EVENTO_RGSDA (
   NU_EVENTO_RGSDA      ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB753_SITUACAO_REPASSE
--==============================================================
create table GEC.GECTB753_SITUACAO_REPASSE (
   NU_SITUACAO_REPASSE  SMALLINT              
      not null,
   DE_SITUACAO_REPASSE  VARCHAR(50            
      not null,
   constraint GECPK753 primary key (NU_SITUACAO_REPASSE)
)
 in GECDB002.GECTS753;

label on table GEC.GECTB753_SITUACAO_REPASSE is 'SITUACAO_REPASSE';

--==============================================================
-- Index: GEC1I753
--==============================================================
create unique index GEC.GEC1I753 on GEC.GECTB753_SITUACAO_REPASSE (
   NU_SITUACAO_REPASSE  ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB754_VINCULA_ERRO_EVENTO
--==============================================================
create table GEC.GECTB754_VINCULA_ERRO_EVENTO (
   NU_ARQUIVO           DEC(18)               
      not null,
   NU_SEQUENCIAL_ERRO   SMALLINT              
      not null,
   NU_EVENTO_RGSDA      CHAR(21)              
      not null,
   constraint GECPK754 primary key (NU_ARQUIVO, NU_SEQUENCIAL_ERRO, 
NU_EVENTO_RGSDA)
)
 in GECDB002.GECTS754;

label on table GEC.GECTB754_VINCULA_ERRO_EVENTO is 'VINCULA_ERRO_EVENTO'
;

--==============================================================
-- Index: GEC1I754
--==============================================================
create unique index GEC.GEC1I754 on GEC.GECTB754_VINCULA_ERRO_EVENTO (
   NU_ARQUIVO           ASC,
   NU_SEQUENCIAL_ERRO   ASC,
   NU_EVENTO_RGSDA      ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB755_ENCARGO_CESSAO
--==============================================================
create table GEC.GECTB755_ENCARGO_CESSAO (
   NU_UNICO_RESERVA     CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   IC_OBJETO_ENCARGO    CHAR(1)               
      not null
         constraint GEC1C755 check (IC_OBJETO_ENCARGO in ('1','2','3')),

   NU_SEQUENCIAL_ENCARGO SMALLINT              
      not null,
   NU_INDEXADOR         SMALLINT,
   NU_TIPO_TAXA_REFERENCIAL SMALLINT,
   QT_DIA_COBRANCA      SMALLINT,
   IC_TIPO_COBRANCA     CHAR(1)               
      not null
         constraint GEC2C755 check (IC_TIPO_COBRANCA in ('1','2')),
   VR_BASE_CALCULO      DECIMAL(18,2),
   VR_COBRANCA          DECIMAL(18,2),
   IC_TIPO_CALCULO      CHAR(1)               
      not null
         constraint GEC3C755 check (IC_TIPO_CALCULO in ('0','1','2','3'
)),
   IC_FORMA_CALCULO     CHAR(1)               
      not null
         constraint GEC4C755 check (IC_FORMA_CALCULO in ('0','1','2')),

   PC_JURO_MULTA        DECIMAL(10,5),
   PC_INDEXADOR         DECIMAL(10,5),
   IC_FINANCIAMENTO     CHAR(1)               
      not null
         constraint GEC5C755 check (IC_FINANCIAMENTO in ('0','S','N')),

   NU_TIPO_ENCARGO      DECIMAL(4),
   NU_TIPO_PERIODICIDADE DECIMAL(4),
   constraint GECPK755 primary key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO, IC_OBJETO_ENCARGO, NU_SEQUENCIAL_ENCARGO)
)
 in GECDB002.GECTS755;

label on table GEC.GECTB755_ENCARGO_CESSAO is 'ENCARGO_CESSAO';
label on column GEC.GECTB755_ENCARGO_CESSAO.NU_UNICO_RESERVA is 
'NU_UNICO_RESERVA_REGISTRADORA';
label on column GEC.GECTB755_ENCARGO_CESSAO.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I755
--==============================================================
create unique index GEC.GEC1I755 on GEC.GECTB755_ENCARGO_CESSAO (
   NU_UNICO_RESERVA     ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   IC_OBJETO_ENCARGO    ASC,
   NU_SEQUENCIAL_ENCARGO ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB756_ENCARGO_PARCELA
--==============================================================
create table GEC.GECTB756_ENCARGO_PARCELA (
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   IC_OBJETO_ENCARGO    CHAR(1)               
      not null
         constraint GEC1C756 check (IC_OBJETO_ENCARGO in ('1','2','3')),

   NU_SEQUENCIAL_ENCARGO SMALLINT              
      not null,
   NU_INDEXADOR         SMALLINT,
   NU_TIPO_TAXA_REFERENCIAL SMALLINT,
   QT_DIA_COBRANCA      SMALLINT,
   IC_TIPO_COBRANCA     CHAR(1)               
      not null
         constraint GEC2C756 check (IC_TIPO_COBRANCA in ('1','2')),
   VR_BASE_CALCULO      DECIMAL(18,2),
   VR_COBRANCA          DECIMAL(18,2),
   IC_TIPO_CALCULO      CHAR(1)               
      not null
         constraint GEC3C756 check (IC_TIPO_CALCULO in ('1','2','3')),
   IC_FORMA_CALCULO     CHAR(1)               
      not null
         constraint GEC4C756 check (IC_FORMA_CALCULO in ('1','2')),
   PC_JURO_MULTA        DECIMAL(10,5),
   PC_INDEXADOR         DECIMAL(10,5),
   IC_FINANCIAMENTO     CHAR(1)               
      not null
         constraint GEC5C756 check (IC_FINANCIAMENTO in ('S','N')),
   NU_TIPO_ENCARGO      DECIMAL(4),
   NU_TIPO_PERIODICIDADE DECIMAL(4),
   constraint GECPK756 primary key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, 
NU_UNICO_PARCELA_REGISTRADORA, IC_OBJETO_ENCARGO, NU_SEQUENCIAL_ENCARGO)

)
 in GECDB002.GECTS756;

label on table GEC.GECTB756_ENCARGO_PARCELA is 'ENCARGO_PARCELA';
label on column GEC.GECTB756_ENCARGO_PARCELA.NU_IDNTR_PRTCE_ADMDO is 
'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column GEC.GECTB756_ENCARGO_PARCELA.NU_UNICO_CONTRATO_RGSDA is 
'NU_UNICO_CONTRATO_REGISTRADORA';
--==============================================================
-- Index: GEC1I756
--==============================================================
create unique index GEC.GEC1I756 on GEC.GECTB756_ENCARGO_PARCELA (
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_UNICO_CONTRATO_RGSDA ASC,
   NU_UNICO_PARCELA_REGISTRADORA ASC,
   IC_OBJETO_ENCARGO    ASC,
   NU_SEQUENCIAL_ENCARGO ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB757_VINCULA_ERRO_RESERVA
--==============================================================
create table GEC.GECTB757_VINCULA_ERRO_RESERVA (
   NU_ARQUIVO           DEC(18)               
      not null,
   NU_SEQUENCIAL_ERRO   SMALLINT              
      not null,
   NU_UNICO_RESERVA     CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   constraint GECPK757 primary key (NU_ARQUIVO, NU_SEQUENCIAL_ERRO, 
NU_UNICO_RESERVA, NU_IDNTR_PRTCE_ADMDO)
)
 in GECDB002.GECTS757;

label on table GEC.GECTB757_VINCULA_ERRO_RESERVA is 
'VINCULA_ERRO_RESERVA';
label on column GEC.GECTB757_VINCULA_ERRO_RESERVA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
--==============================================================
-- Index: GEC1I757
--==============================================================
create unique index GEC.GEC1I757 on GEC.GECTB757_VINCULA_ERRO_RESERVA (

   NU_ARQUIVO           ASC,
   NU_SEQUENCIAL_ERRO   ASC,
   NU_UNICO_RESERVA     ASC,
   NU_IDNTR_PRTCE_ADMDO ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB758_VINCULA_ERRO_PARCELA
--==============================================================
create table GEC.GECTB758_VINCULA_ERRO_PARCELA (
   NU_ARQUIVO           DEC(18)               
      not null,
   NU_SEQUENCIAL_ERRO   SMALLINT              
      not null,
   NU_UNICO_RESERVA_REGISTRADORA CHAR(21)              
      not null,
   NU_IDNTR_PRTCE_ADMDO CHAR(8)               
      not null,
   NU_UNICO_CONTRATO_RGSDA CHAR(21)              
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   constraint GECPK758 primary key (NU_ARQUIVO, NU_SEQUENCIAL_ERRO, 
NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_PARCELA_REGISTRADORA)
)
 in GECDB002.GECTS758;

label on table GEC.GECTB758_VINCULA_ERRO_PARCELA is 
'VINCULA_ERRO_PARCELA';
label on column GEC.GECTB758_VINCULA_ERRO_PARCELA.NU_IDNTR_PRTCE_ADMDO 
is 'NU_IDENTIFICADOR_PARTICIPANTE_ADMINISTRADO';
label on column 
GEC.GECTB758_VINCULA_ERRO_PARCELA.NU_UNICO_CONTRATO_RGSDA is 
'NU_UNICO_CONTRATO_REGISTRADORA';
--==============================================================
-- Index: GEC1I758
--==============================================================
create unique index GEC.GEC1I758 on GEC.GECTB758_VINCULA_ERRO_PARCELA (

   NU_ARQUIVO           ASC,
   NU_SEQUENCIAL_ERRO   ASC,
   NU_UNICO_RESERVA_REGISTRADORA ASC,
   NU_IDNTR_PRTCE_ADMDO ASC,
   NU_UNICO_CONTRATO_RGSDA ASC,
   NU_UNICO_PARCELA_REGISTRADORA ASC
)
include
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase yes
freepage 0
pctfree 5
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB759_PRCLA_PSCO_LNCMO_DRO
--==============================================================
create table GEC.GECTB759_PRCLA_PSCO_LNCMO_DRO (
   NU_SQNCL_RELATORIO_RECEBIDO DECIMAL(18)           
      not null,
   IC_GRUPO_EVENTO      CHAR(1)               
      not null
         constraint GEC1C759 check (IC_GRUPO_EVENTO in ('1','2','3','4'
)),
   NU_SEQUENCIAL_GRUPO  DECIMAL(15)           
      not null,
   NU_UNICO_PARCELA_REGISTRADORA CHAR(21)              
      not null,
   constraint GECPK733 primary key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO, NU_UNICO_PARCELA_REGISTRADORA)
)
 in GECDB002.GECTS759;

label on table GEC.GECTB759_PRCLA_PSCO_LNCMO_DRO is 
'PARCELA_POSICAO_LANCAMENTO_DIARIO';
label on column 
GEC.GECTB759_PRCLA_PSCO_LNCMO_DRO.NU_SQNCL_RELATORIO_RECEBIDO is 
'NU_SEQUENCIAL_RELATORIO_RECEBIDO';
--==============================================================
-- Index: GEC1I759
--==============================================================
create unique index GEC.GEC1I759 on GEC.GECTB759_PRCLA_PSCO_LNCMO_DRO (

   NU_SQNCL_RELATORIO_RECEBIDO ASC,
   IC_GRUPO_EVENTO      ASC,
   NU_SEQUENCIAL_GRUPO  ASC,
   NU_UNICO_PARCELA_REGISTRADORA ASC
)
include
cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I759
--==============================================================
create index GEC.GEC2I759 on GEC.GECTB759_PRCLA_PSCO_LNCMO_DRO (
   NU_UNICO_PARCELA_REGISTRADORA ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB760_STCO_PRCMO_RLTRO
--==============================================================
create table GEC.GECTB760_STCO_PRCMO_RLTRO (
   NU_STCO_PROCESSAMENTO_RLTRO SMALLINT              
      not null,
   DE_STCO_PROCESSAMENTO_RLTRO VARCHAR(100)          
      not null,
   constraint GECPK760 primary key (NU_STCO_PROCESSAMENTO_RLTRO)
)
 in GECDB002.GECTS760;

label on table GEC.GECTB760_STCO_PRCMO_RLTRO is 
'SITUACAO_PRCESSAMENTO_RELATORIO';
label on column 
GEC.GECTB760_STCO_PRCMO_RLTRO.NU_STCO_PROCESSAMENTO_RLTRO is 
'NU_SITUACAO_PROCESSAMENTO_RELATORIO';
label on column 
GEC.GECTB760_STCO_PRCMO_RLTRO.DE_STCO_PROCESSAMENTO_RLTRO is 
'DE_SITUACAO_PROCESSAMENTO_RELATORIO';
--==============================================================
-- Index: GEC1I760
--==============================================================
create unique index GEC.GEC1I760 on GEC.GECTB760_STCO_PRCMO_RLTRO (
   NU_STCO_PROCESSAMENTO_RLTRO ASC
)
include
not cluster
 using stogroup SYSDEFLT
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB761_CONTROLE_MIGRACAO
--==============================================================
create table GEC.GECTB761_CONTROLE_MIGRACAO (
   CO_TABELA_MIGRADA    CHAR(3)               
      not null,
   NU_CHAVE_REGISTRO_ORIGEM DECIMAL(18, 0)        
      not null,
   NU_CHAVE_REGSITRO_DESTINO DECIMAL(18, 0)        
      not null,
   constraint GECPK761 primary key (CO_TABELA_MIGRADA, 
NU_CHAVE_REGISTRO_ORIGEM)
)
 in GECDB002.GECTS761;

label on table GEC.GECTB761_CONTROLE_MIGRACAO is 'CONTROLE_MIGRACAO';

--==============================================================
-- Index: GEC1I761
--==============================================================
create unique index GEC.GEC1I761 on GEC.GECTB761_CONTROLE_MIGRACAO (
   CO_TABELA_MIGRADA    ASC,
   NU_CHAVE_REGISTRO_ORIGEM ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB762_ACAO_AUDITADA
--==============================================================
create table GEC.GECTB762_ACAO_AUDITADA (
   NU_ACAO_AUDITADA     DECIMAL(18)           
      not null
      generated ? as identity,
   NU_FUNCIONALIDADE_ADTA SMALLINT              
      not null,
   DT_EVENTO            DATE                  
      not null,
   HH_EVENTO            TIME                  
      not null,
   CO_MATRICULA_USUARIO CHAR(7)               
      not null,
   IC_ACAO_OPERACIONAL  CHAR(1)               
      not null
         constraint GEC1C762 check (IC_ACAO_OPERACIONAL in ('I','A','E',
'C')),
   CO_IP_ESTACAO        CHAR(16)              
      not null,
   constraint GECPK762 primary key (NU_ACAO_AUDITADA)
)
 in GECDB002.GECTS762;

label on table GEC.GECTB762_ACAO_AUDITADA is 'ACAO_AUDITADA';

--==============================================================
-- Index: GEC1I762
--==============================================================
create unique index GEC.GEC1I762 on GEC.GECTB762_ACAO_AUDITADA (
   NU_ACAO_AUDITADA     ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I762
--==============================================================
create index GEC.GEC2I762 on GEC.GECTB762_ACAO_AUDITADA (
   IC_ACAO_OPERACIONAL  ASC,
   CO_MATRICULA_USUARIO ASC,
   DT_EVENTO            ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I762
--==============================================================
create index GEC.GEC3I762 on GEC.GECTB762_ACAO_AUDITADA (
   IC_ACAO_OPERACIONAL  ASC,
   DT_EVENTO            ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC4I762
--==============================================================
create index GEC.GEC4I762 on GEC.GECTB762_ACAO_AUDITADA (
   CO_MATRICULA_USUARIO ASC,
   DT_EVENTO            ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC5I762
--==============================================================
create index GEC.GEC5I762 on GEC.GECTB762_ACAO_AUDITADA (
   DT_EVENTO            ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB763_LOG_TABELA
--==============================================================
create table GEC.GECTB763_LOG_TABELA (
   NU_ACAO_AUDITADA     DECIMAL(18)           
      not null,
   NU_TABELA_AUDITADA   SMALLINT              
      not null,
   constraint GECPK763 primary key (NU_ACAO_AUDITADA, 
NU_TABELA_AUDITADA)
)
 in GECDB002.GECTS763;

label on table GEC.GECTB763_LOG_TABELA is 'LOG_TABELA';

--==============================================================
-- Index: GEC1I763
--==============================================================
create unique index GEC.GEC1I763 on GEC.GECTB763_LOG_TABELA (
   NU_ACAO_AUDITADA     ASC,
   NU_TABELA_AUDITADA   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I763
--==============================================================
create index GEC.GEC2I763 on GEC.GECTB763_LOG_TABELA (
   NU_ACAO_AUDITADA     ASC,
   NU_TABELA_AUDITADA   ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I763
--==============================================================
create index GEC.GEC3I763 on GEC.GECTB763_LOG_TABELA (
   NU_ACAO_AUDITADA     ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB764_CHAVE_PRIMARIA
--==============================================================
create table GEC.GECTB764_CHAVE_PRIMARIA (
   NU_ACAO_AUDITADA     DECIMAL(18)           
      not null,
   NU_TABELA_AUDITADA   SMALLINT              
      not null,
   CO_CHAVE_PRIMARIA    CHAR(8)               
      not null,
   DE_CONTEUDO          VARCHAR(400)          
      not null,
   constraint GECPK764 primary key (NU_ACAO_AUDITADA, NU_TABELA_AUDITADA
, CO_CHAVE_PRIMARIA)
)
 in GECDB002.GECTS764;

label on table GEC.GECTB764_CHAVE_PRIMARIA is 'CHAVE_PRIMARIA';

--==============================================================
-- Index: GEC1I764
--==============================================================
create unique index GEC.GEC1I764 on GEC.GECTB764_CHAVE_PRIMARIA (
   NU_ACAO_AUDITADA     ASC,
   NU_TABELA_AUDITADA   ASC,
   CO_CHAVE_PRIMARIA    ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I764
--==============================================================
create index GEC.GEC2I764 on GEC.GECTB764_CHAVE_PRIMARIA (
   NU_ACAO_AUDITADA     ASC,
   NU_TABELA_AUDITADA   ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I764
--==============================================================
create index GEC.GEC3I764 on GEC.GECTB764_CHAVE_PRIMARIA (
   NU_ACAO_AUDITADA     ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB765_LOG_CONTEUDO
--==============================================================
create table GEC.GECTB765_LOG_CONTEUDO (
   NU_ACAO_AUDITADA     DECIMAL(18)           
      not null,
   NU_TABELA_AUDITADA   SMALLINT              
      not null,
   NO_COLUNA_AUDITADA   CHAR(30)              
      not null,
   DE_CONTEUDO_ANTERIOR VARCHAR(400),
   DE_CONTEUDO_ATUAL    VARCHAR(400),
   constraint GECPK765 primary key (NU_ACAO_AUDITADA, NU_TABELA_AUDITADA
, NO_COLUNA_AUDITADA)
)
 in GECDB002.GECTS765;

label on table GEC.GECTB765_LOG_CONTEUDO is 'LOG_CONTEUDO';

--==============================================================
-- Index: GEC1I765
--==============================================================
create unique index GEC.GEC1I765 on GEC.GECTB765_LOG_CONTEUDO (
   NU_ACAO_AUDITADA     ASC,
   NU_TABELA_AUDITADA   ASC,
   NO_COLUNA_AUDITADA   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I765
--==============================================================
create index GEC.GEC2I765 on GEC.GECTB765_LOG_CONTEUDO (
   NU_ACAO_AUDITADA     ASC,
   NU_TABELA_AUDITADA   ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I765
--==============================================================
create index GEC.GEC3I765 on GEC.GECTB765_LOG_CONTEUDO (
   NU_ACAO_AUDITADA     ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB766_TABELA_AUDITADA
--==============================================================
create table GEC.GECTB766_TABELA_AUDITADA (
   NU_TABELA_AUDITADA   SMALLINT              
      not null,
   DE_TABELA_AUDITADA   VARCHAR(100)          
      not null,
   constraint GECPK766 primary key (NU_TABELA_AUDITADA)
)
 in GECDB002.GECTS766;

label on table GEC.GECTB766_TABELA_AUDITADA is 'TABELA_AUDITADA';
label on column GEC.GECTB766_TABELA_AUDITADA.DE_TABELA_AUDITADA is 
'DE_TABELA_AUDITADA';
--==============================================================
-- Index: GEC1I766
--==============================================================
create unique index GEC.GEC1I766 on GEC.GECTB766_TABELA_AUDITADA (
   NU_TABELA_AUDITADA   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB767_FNCNE_TABELA_ADTDA
--==============================================================
create table GEC.GECTB767_FNCNE_TABELA_ADTDA (
   NU_FUNCIONALIDADE_ADTA SMALLINT              
      not null,
   NU_TABELA_AUDITADA   SMALLINT              
      not null,
   constraint GECPK767 primary key (NU_FUNCIONALIDADE_ADTA, 
NU_TABELA_AUDITADA)
)
 in GECDB002.GECTS767;

label on table GEC.GECTB767_FNCNE_TABELA_ADTDA is 
'FUNCIONALIDADE_TABELA_AUDITADA';

--==============================================================
-- Index: GEC1I767
--==============================================================
create unique index GEC.GEC1I767 on GEC.GECTB767_FNCNE_TABELA_ADTDA (
   NU_FUNCIONALIDADE_ADTA ASC,
   NU_TABELA_AUDITADA   ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I767
--==============================================================
create index GEC.GEC2I767 on GEC.GECTB767_FNCNE_TABELA_ADTDA (
   NU_FUNCIONALIDADE_ADTA ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I767
--==============================================================
create index GEC.GEC3I767 on GEC.GECTB767_FNCNE_TABELA_ADTDA (
   NU_TABELA_AUDITADA   ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty -1
    secqty -1
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB768_PARAMETRO_RELATORIO
--==============================================================
create table GECTB768_PARAMETRO_RELATORIO (
   NU_SEQ_PARAMETRO     SMALLINT              
      not null,
   NU_GRAU_SIGILO       SMALLINT              
      not null,
   NO_VICE_PRESIDENCIA_CARTEIRA VARCHAR(100)          
      not null,
   NO_SPRNA_AQUISICAO_CARTEIRA VARCHAR(100)          
      not null,
   NO_GERENCIA_AQUISICAO_CARTEIRA VARCHAR(100)          
      not null,
   constraint GECPK768 primary key (NU_SEQ_PARAMETRO)
)
 in GECDB002.GECTS768;

label on column 
GECTB768_PARAMETRO_RELATORIO.NO_VICE_PRESIDENCIA_CARTEIRA is 
'NO_VICE_PRESIDENCIA_AQUISICAO_CARTEIRA';
label on column GECTB768_PARAMETRO_RELATORIO.NO_SPRNA_AQUISICAO_CARTEIRA
 is 'NO_SUPERINTENDENCIA_AQUISICAO_CARTEIRA';
--==============================================================
-- Index: GECI1768
--==============================================================
create unique index GECI1768 on GECTB768_PARAMETRO_RELATORIO (
   NU_SEQ_PARAMETRO     ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB769_GRAU_SIGILO
--==============================================================
create table GECTB769_GRAU_SIGILO (
   NU_GRAU_SIGILO       SMALLINT              
      not null,
   DE_GRAU_SIGILO       VARCHAR(30)           
      not null,
   constraint GECPK769 primary key (NU_GRAU_SIGILO)
)
 IN GECDB002.GECTS769;

--==============================================================
-- Index: GEC1I769
--==============================================================
create unique index GEC1I769 on GECTB769_GRAU_SIGILO (
   NU_GRAU_SIGILO       ASC
)
include
cluster
 using stogroup SGDGEC00
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 0
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB770_ARQUIVO_CONTABIL
--==============================================================
create table GEC.GECTB770_ARQUIVO_CONTABIL (
   NU_ARQUIVO_CONTABIL  DECIMAL(9)            
      not null
      generated by default as identity,
   NU_IF                SMALLINT              
      not null,
   NU_CONTROLE_EXECUCAO_ROTINA INTEGER               
      not null,
   CO_ROTINA_PROCESSAMENTO CHAR(8)               
      not null,
   NU_PERIODO_MOVIMENTO_ARQUIVO INTEGER               
      not null,
   IC_TIPO_PROCESSAMENTO_ARQUIVO SMALLINT              
      not null
         constraint GEC1C770 check (IC_TIPO_PROCESSAMENTO_ARQUIVO in (1,
2,3)),
   QT_REGISTRO_PROCESSADO INTEGER,
   QT_REGISTRO_REJEITADO INTEGER,
   VR_TOTAL_SALDO_DEVEDOR_ARQUIVO DECIMAL(17,2),
   DT_MOVIMENTO_ARQUIVO DATE,
   NU_PRODUTO           SMALLINT              
      not null with default 4852,
   constraint GECPK770 primary key (NU_ARQUIVO_CONTABIL)
)
 in GECDB002.GECTS770;

label on table GEC.GECTB770_ARQUIVO_CONTABIL is 'ARQUIVO_CONTABIL';
label on column GEC.GECTB770_ARQUIVO_CONTABIL.CO_ROTINA_PROCESSAMENTO is
 'CO_ROTINA_PROCESSAMENTO_SISTEMA';
label on column 
GEC.GECTB770_ARQUIVO_CONTABIL.NU_PERIODO_MOVIMENTO_ARQUIVO is 
'NU_PERIODO_MOVIMENTO_ARQUIVO_CONTABIL';
label on column 
GEC.GECTB770_ARQUIVO_CONTABIL.IC_TIPO_PROCESSAMENTO_ARQUIVO is 
'IC_TIPO_PROCESSAMENTO_ARQUIVO_CONTABIL';
label on column GEC.GECTB770_ARQUIVO_CONTABIL.QT_REGISTRO_PROCESSADO is 
'QT_REGISTRO_PROCESSADO_ARQUIVO_CONTABIL';
label on column GEC.GECTB770_ARQUIVO_CONTABIL.QT_REGISTRO_REJEITADO is 
'QT_REGISTRO_REJEITADO_ARQUIVO_CONTABIL';
label on column 
GEC.GECTB770_ARQUIVO_CONTABIL.VR_TOTAL_SALDO_DEVEDOR_ARQUIVO is 
'VR_TOTAL_SALDO_DEVEDOR_ARQUIVO_CONTABIL';
label on column GEC.GECTB770_ARQUIVO_CONTABIL.DT_MOVIMENTO_ARQUIVO is 
'DT_MOVIMENTO_ARQUIVO_RECEBIDO';
--==============================================================
-- Index: GEC1I770
--==============================================================
create unique index GEC.GEC1I770 on GEC.GECTB770_ARQUIVO_CONTABIL (
   NU_ARQUIVO_CONTABIL  ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I770
--==============================================================
create index GEC.GEC2I770 on GEC.GECTB770_ARQUIVO_CONTABIL (
   NU_IF                ASC,
   NU_PERIODO_MOVIMENTO_ARQUIVO ASC,
   IC_TIPO_PROCESSAMENTO_ARQUIVO ASC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB771_REGISTRO_ARQVO_CNTBL
--==============================================================
create table GEC.GECTB771_REGISTRO_ARQVO_CNTBL (
   NU_ARQUIVO_CONTABIL  DECIMAL(9)            
      not null,
   NU_REGISTRO_ARQVO_CNTBL INTEGER               
      not null,
   NU_CREDITO           DECIMAL(19),
   CO_CONTRATO_CEDENTE  CHAR(20)              
      not null,
   NU_CPF_CNPJ          DECIMAL(14)           
      not null,
   QT_DIA_ATRASO        SMALLINT,
   VR_SALDO_DEVEDOR     DECIMAL(17,2),
   VR_SLDO_DVDR_ANTERIOR DECIMAL(17,2),
   VR_SLDO_DVDR_AQUISICAO_CPTCA DECIMAL(17,2),
   VR_JURO_MENSAL       DECIMAL(17,2),
   VR_DESCONTO_NEGOCIACAO DECIMAL(17,2),
   VR_PRJZO_CSLDO_PPDDE_BNDU DECIMAL(17,2),
   VR_PERDA_RETENCAO_CVNTE DECIMAL(17,2),
   VR_RCBMO_CVNTE_LCDA_PERDA DECIMAL(17,2),
   VR_ESTORNO_JURO_MENSAL DECIMAL(17,2),
   VR_RCBMO_PRCLA_LIQUIDACAO DECIMAL(17,2),
   VR_RCBMO_ENCARGO_ATRASO DECIMAL(17,2),
   VR_RCBMO_IOF_ATRASO  DECIMAL(17,2),
   VR_RCBMO_MULTA       DECIMAL(17,2),
   VR_ESTORNO_PRCLA_LIQUIDACAO DECIMAL(17,2),
   VR_ESTORNO_ENCARGO_ATRASO DECIMAL(17,2),
   VR_ESTORNO_IOF_ATRASO DECIMAL(17,2),
   VR_ESTORNO_MULTA     DECIMAL(17,2),
   VR_CSLDO_PPDDE_BNDU  DECIMAL(17,2),
   VR_INCSO_BLOQUEIO_ACUMULO_JURO DECIMAL(17,2),
   VR_BAIXA_BLOQUEIO_ACUMULO_JURO DECIMAL(17,2),
   VR_SALDO_BLOQUEIO_ACUMULO_JURO DECIMAL(17,2),
   VR_ESTNO_INCSO_BLQO_ACMLO_JURO DECIMAL(17,2),
   VR_ESTNO_BAIXA_BLQO_ACMLO_JURO DECIMAL(17,2),
   constraint GECPK771 primary key (NU_ARQUIVO_CONTABIL, 
NU_REGISTRO_ARQVO_CNTBL)
)
 in GECDB002.GECTS771;

label on table GEC.GECTB771_REGISTRO_ARQVO_CNTBL is 
'REGISTRO_ARQUIVO_CONTABIL';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.NU_REGISTRO_ARQVO_CNTBL is 
'NU_REGISTRO_ARQUIVO_CONTABIL';
label on column GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_SLDO_DVDR_ANTERIOR 
is 'VR_SALDO_DEVEDOR_MES_ANTERIOR';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_SLDO_DVDR_AQUISICAO_CPTCA is 
'VR_SALDO_DEVEDOR_AQUISICAO_COMPETENCIA';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_PRJZO_CSLDO_PPDDE_BNDU is 
'VR_PREJUIZO_CONSOLIDADO_PROPRIEDADE_BNDU';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_PERDA_RETENCAO_CVNTE is 
'VR_PERDA_RETENCAO_CONVENENTE';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_RCBMO_CVNTE_LCDA_PERDA is 
'VR_RECEBIMENTO_CONVENENTE_LANCADA_PERDA';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_RCBMO_PRCLA_LIQUIDACAO is 
'VR_RECEBIMENTO_PARCELA_LIQUIDACAO';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_RCBMO_ENCARGO_ATRASO is 
'VR_RECEBIMENTO_ENCARGO_ATRASO';
label on column GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_RCBMO_IOF_ATRASO is
 'VR_RECEBIMENTO_IOF_ATRASO';
label on column GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_RCBMO_MULTA is 
'VR_RECEBIMENTO_MULTA';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_ESTORNO_PRCLA_LIQUIDACAO is 
'VR_ESTORNO_PARCELA_LIQUIDACAO';
label on column GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_CSLDO_PPDDE_BNDU is
 'VR_CONSOLIDADO_PROPRIEDADE_BNDU';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_INCSO_BLOQUEIO_ACUMULO_JURO is 
'VR_INCLUSAO_BLOQUEIO_ACUMULO_JURO';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_ESTNO_INCSO_BLQO_ACMLO_JURO is 
'VR_ESTORNO_INCLUSAO_BLOQUEIO_ACUMULO_JURO';
label on column 
GEC.GECTB771_REGISTRO_ARQVO_CNTBL.VR_ESTNO_BAIXA_BLQO_ACMLO_JURO is 
'VR_ESTORNO_BAIXA_BLOQUEIO_ACUMULO_JURO';
--==============================================================
-- Index: GEC1I771
--==============================================================
create unique index GEC.GEC1I771 on GEC.GECTB771_REGISTRO_ARQVO_CNTBL (

   NU_ARQUIVO_CONTABIL  ASC,
   NU_REGISTRO_ARQVO_CNTBL ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I771
--==============================================================
create index GEC.GEC2I771 on GEC.GECTB771_REGISTRO_ARQVO_CNTBL (
   NU_ARQUIVO_CONTABIL  DESC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I771
--==============================================================
create index GEC.GEC3I771 on GEC.GECTB771_REGISTRO_ARQVO_CNTBL (
   NU_CREDITO           DESC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC4I771
--==============================================================
create index GEC.GEC4I771 on GEC.GECTB771_REGISTRO_ARQVO_CNTBL (
   NU_ARQUIVO_CONTABIL  ASC,
   CO_CONTRATO_CEDENTE  ASC
);

--==============================================================
-- Table: GECTB772_CRITICA_ARQVO_RCBDO
--==============================================================
create table GEC.GECTB772_CRITICA_ARQVO_RCBDO (
   NU_CRITICA           SMALLINT              
      not null,
   DE_CRITICA           VARCHAR(100)          
      not null,
   IC_CRITICA_IMPEDITIVA CHAR(1)               
      not null default 'N'
         constraint GEC2C522 check (IC_CRITICA_IMPEDITIVA in ('S','N')),

   constraint GECPK772 primary key (NU_CRITICA)
)
 in GECDB002.GECTS772;

label on table GEC.GECTB772_CRITICA_ARQVO_RCBDO is 
'CRITICA_ARQUIVO_RECEBIDO';

--==============================================================
-- Index: GEC1I772
--==============================================================
create unique index GEC.GEC1I772 on GEC.GECTB772_CRITICA_ARQVO_RCBDO (
   NU_CRITICA           ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB773_ROTINA_PROCESSAMENTO_SISTEMA
--==============================================================
create table GEC.GECTB773_ROTINA_PROCESSAMENTO_SISTEMA (
   CO_ROTINA_PROCESSAMENTO CHAR(8)               
      not null,
   DE_ROTINA_PROCESSAMENTO VARCHAR(120)          
      not null,
   constraint GECPK773 primary key (CO_ROTINA_PROCESSAMENTO)
)
 in GECDB002.GECTS773;

label on table GEC.GECTB773_ROTINA_PROCESSAMENTO_SISTEMA is 
'ROTINA_PROCESSAMENTO_SISTEMA';
label on column 
GEC.GECTB773_ROTINA_PROCESSAMENTO_SISTEMA.CO_ROTINA_PROCESSAMENTO is 
'CO_ROTINA_PROCESSAMENTO_SISTEMA';
label on column 
GEC.GECTB773_ROTINA_PROCESSAMENTO_SISTEMA.DE_ROTINA_PROCESSAMENTO is 
'DE_ROTINA_PROCESSAMENTO_SISTEMA';
--==============================================================
-- Index: GEC1I773
--==============================================================
create unique index GEC.GEC1I773 on 
GEC.GECTB773_ROTINA_PROCESSAMENTO_SISTEMA (
   CO_ROTINA_PROCESSAMENTO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB774_ROTEIRO_CONTABIL
--==============================================================
create table GEC.GECTB774_ROTEIRO_CONTABIL (
   NU_ROTEIRO_CONTABIL  DECIMAL(9)            
      not null
      generated by default as identity
      (
          start with 1
          increment by 1
       cache 20
           no cycle
       maxvalue 999999999
       minvalue 1
      ),
   NU_PRODUTO           SMALLINT              
      not null,
   NU_EVENTO_CONTABIL   INTEGER               
      not null,
   IC_SITUACAO_LANCAMENTO CHAR(1)               
      not null with default 'L'
         constraint GEC1C774 check (IC_SITUACAO_LANCAMENTO in ('L','E',
'R','C')),
   NO_FATO_GERADOR      VARCHAR(100)          
      not null,
   DT_INICIO_VIGENCIA   DATE                  
      not null,
   DT_FIM_VIGENCIA      DATE,
   DE_EVENTO_CONTABIL   VARCHAR(100),
   constraint GECPK774 primary key (NU_ROTEIRO_CONTABIL)
)
 in GECDB002.GECTS774;

ALTER TABLE GEC.GECTB513_TRANCHE 
   ADD  CONSTRAINT GECAK513 unique (NU_IF, NU_TRANCHE, NU_PRODUTO); 
      

label on table GEC.GECTB774_ROTEIRO_CONTABIL is 'ROTEIRO_CONTABIL';

--==============================================================
-- Index: GEC1I774
--==============================================================
create unique index GEC.GEC1I774 on GEC.GECTB774_ROTEIRO_CONTABIL (
   NU_ROTEIRO_CONTABIL  ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB775_LANCAMENTO_CONTABIL_MENSAL
--==============================================================
create table GEC.GECTB775_LANCAMENTO_CONTABIL_MENSAL (
   NU_PERIODO_MOVIMENTO INTEGER               
      not null,
   NU_ROTEIRO_CONTABIL  DECIMAL(9)            
      not null,
   NU_IF                SMALLINT              
      not null,
   QT_TOTAL_RGSTO_RTRO_CNTBL INTEGER               
      not null,
   VR_TOTAL_LNCMO_RTRO_CNTBL DECIMAL(17,2)         
      not null,
   constraint GECPK775 primary key (NU_PERIODO_MOVIMENTO, NU_IF, 
NU_ROTEIRO_CONTABIL)
)
 in GECDB002.GECTS775;

label on table GEC.GECTB775_LANCAMENTO_CONTABIL_MENSAL is 
'LANCAMENTO_CONTABIL_MENSAL_IF';
label on column 
GEC.GECTB775_LANCAMENTO_CONTABIL_MENSAL.QT_TOTAL_RGSTO_RTRO_CNTBL is 
'QT_TOTAL_REGISTRO_ROTEIRO_CONTABIL';
label on column 
GEC.GECTB775_LANCAMENTO_CONTABIL_MENSAL.VR_TOTAL_LNCMO_RTRO_CNTBL is 
'VR_TOTAL_LANCAMENTO_ROTEIRO_CONTABIL';
--==============================================================
-- Index: GEC1I775
--==============================================================
create unique index GEC.GEC1I775 on 
GEC.GECTB775_LANCAMENTO_CONTABIL_MENSAL (
   NU_PERIODO_MOVIMENTO ASC,
   NU_IF                ASC,
   NU_ROTEIRO_CONTABIL  ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I775
--==============================================================
create index GEC.GEC2I775 on GEC.GECTB775_LANCAMENTO_CONTABIL_MENSAL (
   NU_ROTEIRO_CONTABIL  DESC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC3I775
--==============================================================
create index GEC.GEC3I775 on GEC.GECTB775_LANCAMENTO_CONTABIL_MENSAL (
   NU_PERIODO_MOVIMENTO DESC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC4I775
--==============================================================
create index GEC.GEC4I775 on GEC.GECTB775_LANCAMENTO_CONTABIL_MENSAL (
   NU_IF                DESC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB776_ROTEIRO_CONTABIL_LEIAUTE
--==============================================================
create table GEC.GECTB776_ROTEIRO_CONTABIL_LEIAUTE (
   NU_ROTEIRO_CONTABIL  DECIMAL(9)            
      not null,
   CO_TIPO_ARQUIVO      DECIMAL(3)            
      not null
         constraint C_CO_TIPO_ARQUIVO check (CO_TIPO_ARQUIVO in (1,2,3,4
,5,6,7)),
   NU_CAMPO             DECIMAL(3)            
      not null,
   constraint GECPK776 primary key (NU_ROTEIRO_CONTABIL, CO_TIPO_ARQUIVO
, NU_CAMPO)
)
 in GECDB002.GECTS776;

label on table GEC.GECTB776_ROTEIRO_CONTABIL_LEIAUTE is 
'ROTEIRO_CONTABIL_LEIAUTE_ARQUIVO';

--==============================================================
-- Index: GEC1I776
--==============================================================
create unique index GEC.GEC1I776 on 
GEC.GECTB776_ROTEIRO_CONTABIL_LEIAUTE (
   NU_ROTEIRO_CONTABIL  ASC,
   CO_TIPO_ARQUIVO      ASC,
   NU_CAMPO             ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB777_ERRO_REGISTRO_CNTBL
--==============================================================
create table GEC.GECTB777_ERRO_REGISTRO_CNTBL (
   NU_ARQUIVO_CONTABIL  DECIMAL(9)            
      not null,
   NU_REGISTRO_ARQVO_CNTBL INTEGER               
      not null,
   NU_CRITICA           SMALLINT              
      not null,
   constraint GECPK777 primary key (NU_ARQUIVO_CONTABIL, 
NU_REGISTRO_ARQVO_CNTBL, NU_CRITICA)
)
 in GECDB002.GECTS777;

label on table GEC.GECTB777_ERRO_REGISTRO_CNTBL is 
'ERRO_REGISTO_ARQUIVO_CONTABIL';
label on column GEC.GECTB777_ERRO_REGISTRO_CNTBL.NU_REGISTRO_ARQVO_CNTBL
 is 'NU_REGISTRO_ARQUIVO_CONTABIL';
--==============================================================
-- Index: GEC1I777
--==============================================================
create unique index GEC.GEC1I777 on GEC.GECTB777_ERRO_REGISTRO_CNTBL (
   NU_ARQUIVO_CONTABIL  ASC,
   NU_REGISTRO_ARQVO_CNTBL ASC,
   NU_CRITICA           ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I777
--==============================================================
create index GEC.GEC2I777 on GEC.GECTB777_ERRO_REGISTRO_CNTBL (
   NU_ARQUIVO_CONTABIL  DESC,
   NU_REGISTRO_ARQVO_CNTBL DESC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB778_ERRO_ROTINA
--==============================================================
create table GEC.GECTB778_ERRO_ROTINA (
   NU_CONTROLE_EXECUCAO_ROTINA INTEGER               
      not null,
   CO_ROTINA_PROCESSAMENTO CHAR(8)               
      not null,
   NU_CRITICA           SMALLINT              
      not null,
   constraint GECPK778 primary key (NU_CRITICA, 
NU_CONTROLE_EXECUCAO_ROTINA, CO_ROTINA_PROCESSAMENTO)
)
 in GECDB002.GECTS778;

label on table GEC.GECTB778_ERRO_ROTINA is 'ERRO_ROTINA';
label on column GEC.GECTB778_ERRO_ROTINA.CO_ROTINA_PROCESSAMENTO is 
'CO_ROTINA_PROCESSAMENTO_SISTEMA';
--==============================================================
-- Index: GEC1I778
--==============================================================
create unique index GEC.GEC1I778 on GEC.GECTB778_ERRO_ROTINA (
   NU_CRITICA           ASC,
   NU_CONTROLE_EXECUCAO_ROTINA ASC,
   CO_ROTINA_PROCESSAMENTO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I778
--==============================================================
create index GEC.GEC2I778 on GEC.GECTB778_ERRO_ROTINA (
   NU_CONTROLE_EXECUCAO_ROTINA ASC,
   CO_ROTINA_PROCESSAMENTO ASC
);

--==============================================================
-- Table: GECTB779_CTRLE_EXECUCAO_ROTINA
--==============================================================
create table GEC.GECTB779_CTRLE_EXECUCAO_ROTINA (
   NU_CONTROLE_EXECUCAO_ROTINA INTEGER               
      not null,
   CO_ROTINA_PROCESSAMENTO CHAR(8)               
      not null,
   IC_SITUACAO_EXCUCAO  SMALLINT              
      not null
         constraint GEC1C779 check (IC_SITUACAO_EXCUCAO in (1,2,3,4)),
   TS_INICIO_PROCESSAMENTO TIMESTAMP             
      not null,
   TS_FIM_PROCESSAMENTO TIMESTAMP,
   NO_ARQUIVO           VARCHAR(100),
   DE_DTLHA_SITUACAO_EXCECUCAO VARCHAR(200),
   QT_REGISTRO_PROCESSADO INTEGER,
   VR_SALDO_PROCESSADO  DECIMAL(17,2),
   QT_CONTRATO_PROCESSADO INTEGER,
   NU_PERIODO_MOVIMENTO INTEGER,
   constraint GECPK779 primary key (NU_CONTROLE_EXECUCAO_ROTINA, 
CO_ROTINA_PROCESSAMENTO)
)
 in GECDB002.GECTS779;

label on table GEC.GECTB779_CTRLE_EXECUCAO_ROTINA is 
'CONTROLE_EXECUCAO_ROTINA';
label on column 
GEC.GECTB779_CTRLE_EXECUCAO_ROTINA.CO_ROTINA_PROCESSAMENTO is 
'CO_ROTINA_PROCESSAMENTO_SISTEMA';
label on column GEC.GECTB779_CTRLE_EXECUCAO_ROTINA.IC_SITUACAO_EXCUCAO 
is 'IC_SITUACAO_EXCUCAO_PROCESSAMENTO';
label on column 
GEC.GECTB779_CTRLE_EXECUCAO_ROTINA.DE_DTLHA_SITUACAO_EXCECUCAO is 
'DE_DETALHADA_SITUACAO_EXCECUCAO';
--==============================================================
-- Index: GEC1I779
--==============================================================
create unique index GEC.GEC1I779 on GEC.GECTB779_CTRLE_EXECUCAO_ROTINA (

   NU_CONTROLE_EXECUCAO_ROTINA ASC,
   CO_ROTINA_PROCESSAMENTO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB780_ARQUIVO_CONSOLIDACAO_CNTBL
--==============================================================
create table GEC.GECTB780_ARQUIVO_CONSOLIDACAO_CNTBL (
   NU_PERIODO_MOVIMENTO INTEGER               
      not null,
   NU_CONTROLE_EXECUCAO_ROTINA INTEGER,
   CO_ROTINA_PROCESSAMENTO CHAR(8),
   IC_SITUACAO_ENVIO_ARQUIVO SMALLINT              
      not null with default 1
         constraint GEC1C780 check (IC_SITUACAO_ENVIO_ARQUIVO in (1,2,
3)),
   DT_MOVIMENTO_ARQUIVO DATE,
   TS_LIBERACAO_ARQUIVO_CONTABIL TIMESTAMP,
   constraint GECPK780 primary key (NU_PERIODO_MOVIMENTO)
)
 in GECDB002.GECTS780;

label on table GEC.GECTB780_ARQUIVO_CONSOLIDACAO_CNTBL is 
'ARQUIVO_CONSOLIDACAO_CONTABIL';
label on column 
GEC.GECTB780_ARQUIVO_CONSOLIDACAO_CNTBL.CO_ROTINA_PROCESSAMENTO is 
'CO_ROTINA_PROCESSAMENTO_SISTEMA';
label on column 
GEC.GECTB780_ARQUIVO_CONSOLIDACAO_CNTBL.IC_SITUACAO_ENVIO_ARQUIVO is 
'IC_SITUACAO_ENVIO_ARQUIVO_CONTABIL';
label on column 
GEC.GECTB780_ARQUIVO_CONSOLIDACAO_CNTBL.DT_MOVIMENTO_ARQUIVO is 
'DT_MOVIMENTO_ARQUIVO_ENVIADO';
--==============================================================
-- Index: GEC1I780
--==============================================================
create unique index GEC.GEC1I780 on 
GEC.GECTB780_ARQUIVO_CONSOLIDACAO_CNTBL (
   NU_PERIODO_MOVIMENTO ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB781_CRITICA_APLICADO_ARQUIVO
--==============================================================
create table GEC.GECTB781_CRITICA_APLICADO_ARQUIVO (
   CO_TIPO_ARQUIVO      DECIMAL(3)            
      not null
         constraint C_CO_TIPO_ARQUIVO check (CO_TIPO_ARQUIVO in (1,2,3,4
,5,6,7)),
   NU_CAMPO             DECIMAL(3)            
      not null,
   NU_CRITICA           SMALLINT              
      not null,
   constraint GECPK781 primary key (CO_TIPO_ARQUIVO, NU_CAMPO, 
NU_CRITICA)
)
 in GECDB002.GECTS781;

label on table GEC.GECTB781_CRITICA_APLICADO_ARQUIVO is 
'CRITICA_APLICADO_ARQUIVO';

--==============================================================
-- Index: GEC1I781
--==============================================================
create unique index GEC.GEC1I781 on 
GEC.GECTB781_CRITICA_APLICADO_ARQUIVO (
   CO_TIPO_ARQUIVO      ASC,
   NU_CAMPO             ASC,
   NU_CRITICA           ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I781
--==============================================================
create index GEC.GEC2I781 on GEC.GECTB781_CRITICA_APLICADO_ARQUIVO (
   CO_TIPO_ARQUIVO      DESC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB782_ERRO_DETALHE_ARQUIVO
--==============================================================
create table GEC.GECTB782_ERRO_DETALHE_ARQUIVO (
   NU_SQNCL_ARQUIVO_IMPORTADO DECIMAL(18)           
      not null,
   NU_LINHA_ARQUIVO     INTEGER               
      not null,
   NU_CRITICA           SMALLINT              
      not null,
   CO_CONTRATO_CEDENTE  CHAR(20),
   NU_CPF_CNPJ_CLIENTE  DECIMAL(14),
   VR_SALDO_DEVEDOR_CONTRATO DECIMAL(17,2),
   NU_PERIODO_MOVIMENTO INTEGER               
      not null with default 0,
   constraint GECPK782 primary key (NU_SQNCL_ARQUIVO_IMPORTADO, 
NU_LINHA_ARQUIVO, NU_CRITICA)
)
 in GECDB002.GECTS782;

label on table GEC.GECTB782_ERRO_DETALHE_ARQUIVO is 
'ERRO_DETALHE_ARQUIVO';
label on column 
GEC.GECTB782_ERRO_DETALHE_ARQUIVO.NU_SQNCL_ARQUIVO_IMPORTADO is 
'NU_SEQUENCIAL_ARQUIVO_SIAPC_IMPORTADO';
--==============================================================
-- Index: GEC1I782
--==============================================================
create unique index GEC.GEC1I782 on GEC.GECTB782_ERRO_DETALHE_ARQUIVO (

   NU_SQNCL_ARQUIVO_IMPORTADO ASC,
   NU_LINHA_ARQUIVO     ASC,
   NU_CRITICA           ASC
)
cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Index: GEC2I782
--==============================================================
create index GEC.GEC2I782 on GEC.GECTB782_ERRO_DETALHE_ARQUIVO (
   NU_SQNCL_ARQUIVO_IMPORTADO DESC
)
include
not cluster
 using stogroup SGDGEC00
    priqty 480
    secqty 480
    erase no
freepage 0
pctfree 10
gbpcache changed
define yes
compress no
bufferpool BP11
close yes
defer no
piecesize 2 G
copy no;

--==============================================================
-- Table: GECTB783_TIPO_MOVIMENTO_ARQVO
--==============================================================
create table GEC.GECTB783_TIPO_MOVIMENTO_ARQVO (
   CO_TIPO_MOVIMENTO_ARQUIVO CHAR(1)               
      not null,
   DE_TIPO_MOVIMENTO_ARQUIVO VARCHAR(120)          
      not null,
   constraint GECPK783 primary key (CO_TIPO_MOVIMENTO_ARQUIVO)
)
 in GECDB002.GECTS783;

label on table GEC.GECTB783_TIPO_MOVIMENTO_ARQVO is 
'TIPO_MOVIMENTO_ARQUIVO';

--==============================================================
-- Index: GEC1I783
--==============================================================
create unique index GEC.GEC1I783 on GEC.GECTB783_TIPO_MOVIMENTO_ARQVO (

   CO_TIPO_MOVIMENTO_ARQUIVO ASC
)
cluster
 using stogroup SGDDB201
    priqty 48
    secqty 48
    erase no
freepage 0
pctfree 10
gbpcache changed
compress no
bufferpool BP11
close yes
copy no;

alter table GEC.GECTB500_IF
   add constraint GEC1F500 foreign key (NU_MATRICULA_INCLUSAO)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB500_IF
   add constraint GEC2F500 foreign key (NU_MATRICULA_ALTERACAO)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB500_IF
   add constraint GEC3F500 foreign key (NU_IF)
      references ICO.ICOTBN07_PRTCESPB (NU_PRTCE_SPB)
      on delete restrict;

alter table GEC.GECTB501_CONTATO_IF
   add constraint GEC1F501 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB501_CONTATO_IF
   add constraint GEC2F501 foreign key (NU_MATRICULA_INCLUSAO)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB501_CONTATO_IF
   add constraint GEC3F501 foreign key (NU_MATRICULA_ALTERACAO)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB503_CONVENENTE_IF
   add constraint GEC1F503 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB503_CONVENENTE_IF
   add constraint GEC2F503 foreign key (NU_SEQ_CONVENENTE)
      references GEC.GECTB502_CONVENENTE (NU_SEQ_CONVENENTE)
      on delete restrict;

alter table GEC.GECTB504_ACORDO
   add constraint GEC1F504 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB504_ACORDO
   add constraint GEC2F504 foreign key (NU_MATRICULA)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB505_PRODUTO_ACORDO
   add constraint GEC1F505 foreign key (NU_ADITIVO)
      references GEC.GECTB507_ADITIVO_ACORDO (NU_ADITIVO)
      on delete restrict;

alter table GEC.GECTB505_PRODUTO_ACORDO
   add constraint GEC2F505 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB506_DOCUMENTO_ACORDO
   add constraint GEC1F506 foreign key (NU_ACORDO)
      references GEC.GECTB504_ACORDO (NU_ACORDO)
      on delete restrict;

alter table GEC.GECTB506_DOCUMENTO_ACORDO
   add constraint GEC2F506 foreign key (NU_SEQUENCIAL_DOCUMENTO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB507_ADITIVO_ACORDO
   add constraint GEC1F507 foreign key (NU_ACORDO)
      references GEC.GECTB504_ACORDO (NU_ACORDO)
      on delete restrict;

alter table GEC.GECTB507_ADITIVO_ACORDO
   add constraint GEC2F507 foreign key (NU_MATRICULA_INCLUSAO)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB507_ADITIVO_ACORDO
   add constraint GEC3F507 foreign key (NU_MATRICULA_ALTERACAO)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB508_FATOR_REMUNERACAO
   add constraint GEC1F508 foreign key (NU_TIPO_FATOR)
      references GEC.GECTB510_TIPO_FATOR_REMUNERACAO (NU_TIPO_FATOR)
      on delete restrict;

alter table GEC.GECTB509_FTR_RMNRO_HSTRO
   add constraint GEC1F509 foreign key (NU_FATOR)
      references GEC.GECTB508_FATOR_REMUNERACAO (NU_FATOR)
      on delete restrict;

alter table GEC.GECTB509_FTR_RMNRO_HSTRO
   add constraint GEC2F509 foreign key (NU_MATRICULA)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB510_TIPO_FATOR_REMUNERACAO
   add constraint GEC2F510 foreign key (NU_MATRICULA)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB511_TED_COMERCIAL
   add constraint GEC1F511 foreign key (NU_MATRICULA)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB511_TED_COMERCIAL
   add constraint GEC2F511 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB511_TED_COMERCIAL
   add constraint GEC3F511 foreign key (NU_SEQUENCIAL_DOCUMENTO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB511_TED_COMERCIAL
   add constraint GEC4F511 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB512_DOCUMENTO_COMERCIAL
   add constraint GEC1F512 foreign key (NU_MATRICULA)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB513_TRANCHE
   add constraint GEC1F513 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB513_TRANCHE
   add constraint GEC2F513 foreign key (CO_SITUACAO_TRANCHE)
      references GEC.GECTB548_SITUACAO_TRANCHE (CO_SITUACAO_TRANCHE)
      on delete restrict;

alter table GEC.GECTB513_TRANCHE
   add constraint GEC3F513 foreign key (CO_SITUACAO_ELEGIBILIDADE)
      references GEC.GECTB549_STCO_ELEGIBILIDADE 
(CO_SITUACAO_ELEGIBILIDADE)
      on delete restrict;

alter table GEC.GECTB513_TRANCHE
   add constraint GEC4F513 foreign key (NU_ACORDO)
      references GEC.GECTB504_ACORDO (NU_ACORDO)
      on delete restrict;

alter table GEC.GECTB513_TRANCHE
   add constraint GEC7F513 foreign key (NU_SQNCL_VNCCO_CIT_PRODUTO_IF)
      references GEC.GECTB565_VNCCO_CIT_PRODUTO_IF (NU_SQNCL_VINCULO)
      on delete restrict;

alter table GEC.GECTB514_LINHA_ARQUIVO_CESSAO
   add constraint GEC1F514 foreign key (NU_ARQUIVO_CESSAO)
      references GEC.GECTB533_ARQUIVO_CESSAO (NU_ARQUIVO_CESSAO)
      on delete restrict;

alter table GEC.GECTB515_ERRO_CESSAO
   add constraint GEC1F515 foreign key (CO_TIPO_ARQUIVO, NU_CAMPO)
      references GEC.GECTB516_LEIAUTE_ARQVO_EXTERNO (CO_TIPO_ARQUIVO, 
NU_CAMPO)
      on delete restrict;

alter table GEC.GECTB515_ERRO_CESSAO
   add constraint GEC2F515 foreign key (NU_ERRO)
      references GEC.GECTB522_ERRO_PREVISTO (NU_ERRO)
      on delete restrict;

alter table GEC.GECTB515_ERRO_CESSAO
   add constraint GEC3F515 foreign key (NU_LINHA_ARQVO_CESSAO)
      references GEC.GECTB514_LINHA_ARQUIVO_CESSAO 
(NU_LINHA_ARQUIVO_CESSAO)
      on delete restrict;

alter table GEC.GECTB516_LEIAUTE_ARQVO_EXTERNO
   add constraint GEC1F516 foreign key (CO_TIPO_CAMPO)
      references GEC.GECTB521_TIPO_CAMPO (CO_TIPO_CAMPO)
      on delete restrict;

alter table GEC.GECTB517_CREDITO_CESSAO
   add constraint GEC1F517 foreign key (NU_LINHA_ARQUIVO_CESSAO)
      references GEC.GECTB514_LINHA_ARQUIVO_CESSAO 
(NU_LINHA_ARQUIVO_CESSAO)
      on delete restrict;

alter table GEC.GECTB517_CREDITO_CESSAO
   add constraint GEC2F517 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB517_CREDITO_CESSAO
   add constraint GEC3F517 foreign key (NU_SEQUENCIAL_MODELO_RISCO)
      references GEC.GECTB537_MODELO_RISCO (NU_SEQUENCIAL_MODELO_RISCO)

      on delete restrict;

alter table GEC.GECTB517_CREDITO_CESSAO
   add constraint GEC4F517 foreign key (NU_SITUACAO_ANALISE_PCP)
      references GEC.GECTB553_SITUACAO_ANALISE_PCP 
(NU_SITUACAO_ANALISE_PCP)
      on delete restrict;

alter table GEC.GECTB517_CREDITO_CESSAO
   add constraint GEC5F517 foreign key (CO_SITUACAO_LIQUIDACAO)
      references GEC.GECTB614_STCO_LQDCO_ANTECIPADA 
(CO_SITUACAO_LIQUIDACAO)
      on delete restrict;

alter table GEC.GECTB517_CREDITO_CESSAO
   add constraint GEC6F517 foreign key (CO_STCO_LQDCO_ANTECIPADA_C3)
      references GEC.GECTB614_STCO_LQDCO_ANTECIPADA 
(CO_SITUACAO_LIQUIDACAO)
      on delete restrict;

alter table GEC.GECTB517_CREDITO_CESSAO
   add constraint GEC7F517 foreign key (NU_SITUACAO_RECOMPRA)
      references GEC.GECTB718_SITUACAO_RECOMPRA (NU_SITUACAO_RECOMPRA)
      on delete restrict;

alter table GEC.GECTB518_DTLHE_VEICULO_CREDITO
   add constraint GEC1F518 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB518_DTLHE_VEICULO_CREDITO
   add constraint GEC2F518 foreign key (CO_TIPO_VEICULO)
      references GEC.GECTB550_TIPO_VEICULO (CO_TIPO_VEICULO)
      on delete restrict;

alter table GEC.GECTB518_DTLHE_VEICULO_CREDITO
   add constraint GEC3F518 foreign key (CO_TIPO_GARANTIA_ACESSORIA)
      references GEC.GECTB551_TIPO_GRNTA_ACESSORIA 
(CO_TIPO_GARANTIA_ACESSORIA)
      on delete restrict;

alter table GEC.GECTB518_DTLHE_VEICULO_CREDITO
   add constraint GEC4F518 foreign key (CO_REGIAO_DOMICILIO_VEICULO)
      references GEC.GECTB552_REGIAO_DOMICILIO (CO_REGIAO_DOMICILIO)
      on delete restrict;

alter table GEC.GECTB520_CTRIO_ELEGIBILIDADE
   add constraint GEC1F520 foreign key (NU_MATRICULA)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB520_CTRIO_ELEGIBILIDADE
   add constraint GEC2F520 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB523_PARCELA_CREDITO
   add constraint GEC1F523 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB523_PARCELA_CREDITO
   add constraint GEC3F523 foreign key (NU_SQNCL_PREVISAO_RECEBIMENTO)
      references GEC.GECTB566_PREVISAO_RECEBIMENTO (NU_SQNCL_PREVISAO)
      on delete restrict;

alter table GEC.GECTB523_PARCELA_CREDITO
   add constraint GEC4F523 foreign key (CO_SITUACAO_LIQUIDACAO)
      references GEC.GECTB614_STCO_LQDCO_ANTECIPADA 
(CO_SITUACAO_LIQUIDACAO)
      on delete restrict;

alter table GEC.GECTB523_PARCELA_CREDITO
   add constraint GEC6F523 foreign key (CO_SITUACAO_BAIXA_PARCELA)
      references GEC.GECTB746_STCO_BAIXA_PARCELA 
(NU_SITUACAO_BAIXA_PARCELA)
      on delete restrict;

alter table GEC.GECTB523_PARCELA_CREDITO
   add constraint GEC7F523 foreign key (NU_SITUACAO_RECOMPRA)
      references GEC.GECTB718_SITUACAO_RECOMPRA (NU_SITUACAO_RECOMPRA)
      on delete restrict;

alter table GEC.GECTB524_TED_TRANCHE
   add constraint GEC1F524 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB524_TED_TRANCHE
   add constraint GEC2F524 foreign key (CO_NUOP)
      references GEC.GECTB511_TED_COMERCIAL (CO_NUOP)
      on delete restrict;

alter table GEC.GECTB525_CNAB
   add constraint GEC1F525 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB526_RETORNO_CONVENENTE
   add constraint GEC1F526 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB527_FLUXO_PAGAMENTO_PCP
   add constraint GEC1F527 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB528_CRITERIO_IGNORADO
   add constraint GEC1F528 foreign key (NU_MATRICULA)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB528_CRITERIO_IGNORADO
   add constraint GEC2F528 foreign key (NU_CRITERIO_ELEGIBILIDADE)
      references GEC.GECTB520_CTRIO_ELEGIBILIDADE 
(NU_CRITERIO_ELEGIBILIDADE)
      on delete restrict;

alter table GEC.GECTB528_CRITERIO_IGNORADO
   add constraint GEC3F528 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB529_ERRO_ANALISE_ELGBE
   add constraint GEC1F529 foreign key (NU_CRITERIO_ELEGIBILIDADE)
      references GEC.GECTB520_CTRIO_ELEGIBILIDADE 
(NU_CRITERIO_ELEGIBILIDADE)
      on delete restrict;

alter table GEC.GECTB529_ERRO_ANALISE_ELGBE
   add constraint GEC2F529 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB530_VENCIMENTARIO
   add constraint GEC1F530 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB531_CONVENENTE_CESSAO
   add constraint GEC1F531 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB531_CONVENENTE_CESSAO
   add constraint GEC2F531 foreign key (NU_SEQ_CONVENENTE)
      references GEC.GECTB502_CONVENENTE (NU_SEQ_CONVENENTE)
      on delete restrict;

alter table GEC.GECTB533_ARQUIVO_CESSAO
   add constraint GEC1F533 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB533_ARQUIVO_CESSAO
   add constraint GEC2F533 foreign key (NU_SEQUENCIAL_DOCUMENTO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB533_ARQUIVO_CESSAO
   add constraint GEC3F533 foreign key (NU_SITUACAO_ARQUIVO)
      references GEC.GECTB672_STCO_ARQVO_RCBDO_IF (NU_SITUACAO_ARQUIVO)

      on delete restrict;

alter table GEC.GECTB534_DTLHE_CRDTO_CNGDO
   add constraint GEC1F534 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB534_DTLHE_CRDTO_CNGDO
   add constraint GEC2F534 foreign key (NU_SQNCL_CONVENENTE_CESSAO)
      references GEC.GECTB531_CONVENENTE_CESSAO 
(NU_SQNCL_CONVENENTE_CESSAO)
      on delete restrict;

alter table GEC.GECTB535_CC_SALDO_VINCULACAO
   add constraint GEC1F535 foreign key (NU_ACORDO)
      references GEC.GECTB504_ACORDO (NU_ACORDO)
      on delete restrict;

alter table GEC.GECTB535_CC_SALDO_VINCULACAO
   add constraint GEC2F535 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB536_EMAIL_ENVIADO
   add constraint GEC1F536 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB536_EMAIL_ENVIADO
   add constraint GEC2F536 foreign key (NU_SEQUENCIAL_DOCUMENTO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB536_EMAIL_ENVIADO
   add constraint GEC3F536 foreign key (NU_MATRICULA)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB537_MODELO_RISCO
   add constraint GEC1F537 foreign key (CO_TIPO_VEICULO)
      references GEC.GECTB550_TIPO_VEICULO (CO_TIPO_VEICULO)
      on delete restrict;

alter table GEC.GECTB538_FLXO_MDLDE_VEICULO
   add constraint GEC2F538 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB538_FLXO_MDLDE_VEICULO
   add constraint GEC3F538 foreign key (NU_SEQUENCIAL_MODELO_RISCO)
      references GEC.GECTB537_MODELO_RISCO (NU_SEQUENCIAL_MODELO_RISCO)

      on delete restrict;

alter table GEC.GECTB539_DOCUMENTO_TRANCHE
   add constraint GEC1F539 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB539_DOCUMENTO_TRANCHE
   add constraint GEC2F539 foreign key (NU_SEQUENCIAL_DOCUMENTO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB541_CONTRATO_DI
   add constraint GEC1F541 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB542_DETALHE_REPASSE
   add constraint GEC1F542 foreign key (NU_MOTIVO_RECUSA_DEVOLUCAO)
      references GEC.GECTB543_MTVO_RCSA_DVLCO_RPSE 
(NU_MTVO_RECUSA_DVLCO_RPSE)
      on delete restrict;

alter table GEC.GECTB542_DETALHE_REPASSE
   add constraint GEC2F542 foreign key (NU_SQNCL_PACOTE_DEVOLUCAO)
      references GEC.GECTB559_PCTE_DVLCO_PARCELA 
(NU_SQNCL_PACOTE_DEVOLUCAO)
      on delete restrict;

alter table GEC.GECTB542_DETALHE_REPASSE
   add constraint GEC3F542 foreign key (NU_MOTIVO_RECEBIMENTO)
      references GEC.GECTB546_MOTIVO_RECEBIMENTO (NU_MOTIVO_RECEBIMENTO)

      on delete restrict;

alter table GEC.GECTB542_DETALHE_REPASSE
   add constraint GEC4F542 foreign key (NU_MOTIVO_ESTORNO)
      references GEC.GECTB547_MOTIVO_ESTORNO (NU_MOTIVO_ESTORNO)
      on delete restrict;

alter table GEC.GECTB542_DETALHE_REPASSE
   add constraint GEC5F542 foreign key (NU_PARCELA_CREDITO)
      references GEC.GECTB523_PARCELA_CREDITO (NU_PARCELA_CREDITO)
      on delete restrict;

alter table GEC.GECTB542_DETALHE_REPASSE
   add constraint GEC6F542 foreign key (NU_SQNCL_ARQVO_REPASSE)
      references GEC.GECTB544_ARQVO_REPASSE (NU_SQNCL_ARQVO_REPASSE)
      on delete restrict;

alter table GEC.GECTB542_DETALHE_REPASSE
   add constraint GEC7F542 foreign key (NU_AGRUPADOR_REPASSE)
      references GEC.GECTB557_AGRPR_PRCNO_SNTCO (NU_AGRUPADOR_REPASSE)
      on delete restrict;

alter table GEC.GECTB544_ARQVO_REPASSE
   add constraint GEC1F544 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB544_ARQVO_REPASSE
   add constraint GEC4F544 foreign key (NU_PACOTE_RECEBIMENTO_REPASSE)
      references GEC.GECTB562_PCTE_RCBMO_REPASSE 
(NU_PACOTE_RECEBIMENTO_REPASSE)
      on delete restrict;

alter table GEC.GECTB545_RSLTO_PRCNO_SNTTO
   add constraint GEC1F545 foreign key (NU_PACOTE_RECEBIMENTO_REPASSE)
      references GEC.GECTB562_PCTE_RCBMO_REPASSE 
(NU_PACOTE_RECEBIMENTO_REPASSE)
      on delete restrict;

alter table GEC.GECTB545_RSLTO_PRCNO_SNTTO
   add constraint GEC2F545 foreign key (NU_AGRUPADOR_REPASSE)
      references GEC.GECTB557_AGRPR_PRCNO_SNTCO (NU_AGRUPADOR_REPASSE)
      on delete restrict;

alter table GEC.GECTB554_OFCO_LQDCO_ANTECIPADA
   add constraint GEC1F554 foreign key (NU_SEQUENCIAL_DOCUMENTO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB555_VNCLO_PRCLA_REPASSE
   add constraint GEC1F555 foreign key (NU_SEQUENCIAL_REPASSE)
      references GEC.GECTB542_DETALHE_REPASSE (NU_SEQUENCIAL_REPASSE)
      on delete restrict;

alter table GEC.GECTB555_VNCLO_PRCLA_REPASSE
   add constraint GEC2F555 foreign key (NU_EVENTO_LIQUIDACAO_REPASSE, 
NU_UNICO_PARCELA_REGISTRADORA, NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
      references GEC.GECTB701_PARCELA_REPASSE_RGSDA 
(NU_EVENTO_LIQUIDACAO_REPASSE, NU_UNICO_PARCELA_REGISTRADORA, 
NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA)
      on delete restrict;

alter table GEC.GECTB556_TED_REPASSE
   add constraint GEC1F556 foreign key (NU_PACOTE_RECEBIMENTO_REPASSE)
      references GEC.GECTB562_PCTE_RCBMO_REPASSE 
(NU_PACOTE_RECEBIMENTO_REPASSE)
      on delete restrict;

alter table GEC.GECTB556_TED_REPASSE
   add constraint GEC2F556 foreign key (CO_NUOP)
      references GEC.GECTB511_TED_COMERCIAL (CO_NUOP)
      on delete restrict;

alter table GEC.GECTB558_CNTLE_RCBMO_ARQUIVO
   add constraint GEC1F558 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB559_PCTE_DVLCO_PARCELA
   add constraint GEC1F559 foreign key (NU_ARQUIVO_OFICIO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB559_PCTE_DVLCO_PARCELA
   add constraint GEC2F559 foreign key (CO_NUOP)
      references GEC.GECTB511_TED_COMERCIAL (CO_NUOP)
      on delete restrict;

alter table GEC.GECTB559_PCTE_DVLCO_PARCELA
   add constraint GEC3F559 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB559_PCTE_DVLCO_PARCELA
   add constraint GEC4F559 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB560_ARQVO_PRCLA_CMPLR
   add constraint GEC1F560 foreign key (NU_PACOTE_RECEBIMENTO_REPASSE)
      references GEC.GECTB563_PCTE_RCBMO_CMPLR 
(NU_PCTE_RCBMO_PRCLA_CMPLR)
      on delete restrict;

alter table GEC.GECTB560_ARQVO_PRCLA_CMPLR
   add constraint GEC2F560 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB560_ARQVO_PRCLA_CMPLR
   add constraint GEC3F560 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB561_PARCELA_COMPLEMENTAR
   add constraint GEC1F561 foreign key (NU_PARCELA_CREDITO)
      references GEC.GECTB523_PARCELA_CREDITO (NU_PARCELA_CREDITO)
      on delete restrict;

alter table GEC.GECTB561_PARCELA_COMPLEMENTAR
   add constraint GEC2F561 foreign key (NU_SQNCL_ARQVO_PARCELA_CMPLR)
      references GEC.GECTB560_ARQVO_PRCLA_CMPLR 
(NU_SQNCL_ARQVO_PARCELA_CMPLR)
      on delete restrict;

alter table GEC.GECTB561_PARCELA_COMPLEMENTAR
   add constraint GEC3F561 foreign key (NU_SQNCL_PACOTE_DEVOLUCAO)
      references GEC.GECTB559_PCTE_DVLCO_PARCELA 
(NU_SQNCL_PACOTE_DEVOLUCAO)
      on delete restrict;

alter table GEC.GECTB561_PARCELA_COMPLEMENTAR
   add constraint GEC4F561 foreign key (NU_OFCO_LQDCO_ANTECIPADA)
      references GEC.GECTB554_OFCO_LQDCO_ANTECIPADA 
(NU_OFCO_LQDCO_ANTECIPADA)
      on delete restrict;

alter table GEC.GECTB561_PARCELA_COMPLEMENTAR
   add constraint GEC5F561 foreign key (NU_AGRUPADOR_REPASSE)
      references GEC.GECTB557_AGRPR_PRCNO_SNTCO (NU_AGRUPADOR_REPASSE)
      on delete restrict;

alter table GEC.GECTB564_TED_PARCELA_CMPLR
   add constraint GEC1F564 foreign key (CO_NUOP)
      references GEC.GECTB511_TED_COMERCIAL (CO_NUOP)
      on delete restrict;

alter table GEC.GECTB564_TED_PARCELA_CMPLR
   add constraint GEC2F564 foreign key (NU_PCTE_RCBMO_PRCLA_CMPLR)
      references GEC.GECTB563_PCTE_RCBMO_CMPLR 
(NU_PCTE_RCBMO_PRCLA_CMPLR)
      on delete restrict;

alter table GEC.GECTB565_VNCCO_CIT_PRODUTO_IF
   add constraint GEC1F565 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB565_VNCCO_CIT_PRODUTO_IF
   add constraint GEC2F565 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB565_VNCCO_CIT_PRODUTO_IF
   add constraint GEC3F565 foreign key (NU_MATRICULA_INCLUSAO)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB565_VNCCO_CIT_PRODUTO_IF
   add constraint GEC4F565 foreign key (NU_MATRICULA_ALTERACAO)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB566_PREVISAO_RECEBIMENTO
   add constraint GEC1F566 foreign key (NU_IF, NU_TRANCHE, NU_PRODUTO)
      references GEC.GECTB513_TRANCHE (NU_IF, NU_TRANCHE, NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB566_PREVISAO_RECEBIMENTO
   add constraint GEC2F566 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB567_RESERVA
   add constraint GEC1F567 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB567_RESERVA
   add constraint GEC2F567 foreign key (NU_SITUACAO_RESERVA)
      references GEC.GECTB572_SITUACAO_RESERVA (NU_SITUACAO_RESERVA)
      on delete restrict;

alter table GEC.GECTB567_RESERVA
   add constraint GEC3F567 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB567_RESERVA
   add constraint GEC4F567 foreign key (NU_TIPO_DIVERGENTE)
      references GEC.GECTB593_TIPO_DIVERGENTE (NU_TIPO_DIVERGENTE)
      on delete restrict;

alter table GEC.GECTB568_ARQUIVO_C3
   add constraint GEC1F568 foreign key (CO_TIPO_ARQUIVO)
      references GEC.GECTB570_TIPO_ARQUIVO_C3 (CO_TIPO_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB568_ARQUIVO_C3
   add constraint GEC2F568 foreign key (NU_SEQUENCIAL_SOLICITACAO)
      references GEC.GECTB588_SOLICITACAO_ARQUIVO 
(NU_SEQUENCIAL_SOLICITACAO)
      on delete restrict;

alter table GEC.GECTB568_ARQUIVO_C3
   add constraint GEC3F568 foreign key (NU_ARQUIVO_REFERENCIA)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete cascade;

alter table GEC.GECTB568_ARQUIVO_C3
   add constraint GEC4F568 foreign key (NU_SITUACAO_ARQUIVO)
      references GEC.GECTB658_SITUACAO_ARQUIVO (NU_SITUACAO_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB568_ARQUIVO_C3
   add constraint GEC5F568 foreign key (NU_SEQUENCIAL_DOCUMENTO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB569_CONTRATO_RESERVA
   add constraint GEC1F569 foreign key (NU_SEQUENCIAL_RESERVA)
      references GEC.GECTB567_RESERVA (NU_SEQUENCIAL_RESERVA)
      on delete restrict;

alter table GEC.GECTB569_CONTRATO_RESERVA
   add constraint GEC2F569 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB571_CONTRATO_ARQUIVO
   add constraint GEC1F571 foreign key (NU_SEQUENCIAL_RESERVA, 
NU_CREDITO)
      references GEC.GECTB569_CONTRATO_RESERVA (NU_SEQUENCIAL_RESERVA, 
NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB571_CONTRATO_ARQUIVO
   add constraint GEC2F571 foreign key (NU_SEQUENCIAL_RESERVA, 
NU_ARQUIVO)
      references GEC.GECTB583_ARQUIVO_RESERVA (NU_SEQUENCIAL_RESERVA, 
NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB575_ARQUIVO_PROTOCOLO
   add constraint GEC1F575 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB576_ARQUIVO_ERRO
   add constraint GEC1F576 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB576_ARQUIVO_ERRO
   add constraint GEC3F576 foreign key (CO_ERRO_C3)
      references GEC.GECTB574_ERRO_C3 (CO_ERRO_C3)
      on delete restrict;

alter table GEC.GECTB577_GARANTIA_C3
   add constraint GEC1F577 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB577_GARANTIA_C3
   add constraint GEC2F577 foreign key (CO_STCO_GRNTA_AGENTE_VALIDADOR)

      references GEC.GECTB582_STCO_GARANTIA_VLDDR 
(CO_STCO_GRNTA_AGENTE_VALIDADOR)
      on delete restrict;

alter table GEC.GECTB577_GARANTIA_C3
   add constraint GEC3F577 foreign key (CO_SITUACAO_CONTRATO_GARANTIA)
      references GEC.GECTB587_STCO_CTRTO_GARANTIA 
(CO_SITUACAO_CONTRATO_GARANTIA)
      on delete restrict;

alter table GEC.GECTB577_GARANTIA_C3
   add constraint GEC4F577 foreign key (NU_SEQUENCIAL_RESERVA, 
NU_ARQUIVO)
      references GEC.GECTB583_ARQUIVO_RESERVA (NU_SEQUENCIAL_RESERVA, 
NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB578_HISTORICO_GARANTIA_C3
   add constraint GEC1F578 foreign key (NU_CREDITO)
      references GEC.GECTB577_GARANTIA_C3 (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB583_ARQUIVO_RESERVA
   add constraint GEC1F583 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB583_ARQUIVO_RESERVA
   add constraint GEC2F583 foreign key (NU_SEQUENCIAL_RESERVA)
      references GEC.GECTB567_RESERVA (NU_SEQUENCIAL_RESERVA)
      on delete restrict;

alter table GEC.GECTB584_ERRO_ENCONTRADO
   add constraint GEC1F584 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB584_ERRO_ENCONTRADO
   add constraint GEC2F584 foreign key (CO_ERRO_C3)
      references GEC.GECTB574_ERRO_C3 (CO_ERRO_C3)
      on delete restrict;

alter table GEC.GECTB585_CHAVE_PRIMARIA_ERRO
   add constraint GEC1F585 foreign key (NU_ARQUIVO, NU_SEQUENCIAL_ERRO)

      references GEC.GECTB584_ERRO_ENCONTRADO (NU_ARQUIVO, 
NU_SEQUENCIAL_ERRO)
      on delete restrict;

alter table GEC.GECTB586_CONFIRMACAO_CESSAO
   add constraint GEC1F586 foreign key (NU_SEQUENCIAL_RESERVA)
      references GEC.GECTB567_RESERVA (NU_SEQUENCIAL_RESERVA)
      on delete restrict;

alter table GEC.GECTB586_CONFIRMACAO_CESSAO
   add constraint GEC2F586 foreign key (NU_SEQUENCIAL_RESERVA, 
NU_ARQUIVO)
      references GEC.GECTB583_ARQUIVO_RESERVA (NU_SEQUENCIAL_RESERVA, 
NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB586_CONFIRMACAO_CESSAO
   add constraint GEC3F586 foreign key (CO_TPO_PRTCE_RSPNL_TARIFACAO)
      references GEC.GECTB591_TPO_PRTCE_RSPNL_TRFCO 
(CO_TPO_PRTCE_RSPNL_TARIFACAO)
      on delete restrict;

alter table GEC.GECTB588_SOLICITACAO_ARQUIVO
   add constraint GEC1F588 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB588_SOLICITACAO_ARQUIVO
   add constraint GEC2F588 foreign key (CO_TIPO_ARQUIVO)
      references GEC.GECTB570_TIPO_ARQUIVO_C3 (CO_TIPO_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB589_GRADE_HORARIA
   add constraint GEC1F589 foreign key (CO_TIPO_ARQUIVO)
      references GEC.GECTB570_TIPO_ARQUIVO_C3 (CO_TIPO_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB590_JANELA_PROCESSAMENTO
   add constraint GEC1F590 foreign key (NU_SEQUENCIAL_GRADE_HORARIA)
      references GEC.GECTB589_GRADE_HORARIA 
(NU_SEQUENCIAL_GRADE_HORARIA)
      on delete restrict;

alter table GEC.GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA
   add constraint GEC1F594 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA
   add constraint GEC2F594 foreign key (CO_MOTIVO_EVENTO)
      references GEC.GECTB596_MOTIVO_EVENTO (CO_MOTIVO_EVENTO)
      on delete restrict;

alter table GEC.GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA
   add constraint GEC3F594 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB595_PARCELA_EVENTO
   add constraint GEC1F595 foreign key (NU_SEQUENCIAL_EVENTO)
      references GEC.GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA 
(NU_SEQUENCIAL_EVENTO)
      on delete restrict;

alter table GEC.GECTB595_PARCELA_EVENTO
   add constraint GEC2F595 foreign key (NU_PARCELA_CREDITO)
      references GEC.GECTB523_PARCELA_CREDITO (NU_PARCELA_CREDITO)
      on delete restrict;

alter table GEC.GECTB597_ARQVO_EVNTO_LQDCO
   add constraint GEC1F597 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB597_ARQVO_EVNTO_LQDCO
   add constraint GEC2F597 foreign key (NU_SEQUENCIAL_EVENTO)
      references GEC.GECTB594_EVENTO_LIQUIDACAO_ANTECIPADA 
(NU_SEQUENCIAL_EVENTO)
      on delete restrict;

alter table GEC.GECTB598_CONTEUDO_PARAMETRO
   add constraint GEC1F598 foreign key (NU_SEQUENCIAL_SOLICITACAO)
      references GEC.GECTB588_SOLICITACAO_ARQUIVO 
(NU_SEQUENCIAL_SOLICITACAO)
      on delete restrict;

alter table GEC.GECTB598_CONTEUDO_PARAMETRO
   add constraint GEC2F598 foreign key (NU_SEQUENCIAL_PARAMETRO)
      references GEC.GECTB579_PRMTO_GERACAO_ARQUIVO 
(NU_SEQUENCIAL_PARAMETRO)
      on delete restrict;

alter table GEC.GECTB599_GARANTIA_CONSIGNADO
   add constraint GEC1F599 foreign key (NU_CREDITO)
      references GEC.GECTB577_GARANTIA_C3 (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB599_GARANTIA_CONSIGNADO
   add constraint GEC2F599 foreign key (NU_STCO_MNSLDE_RECUPERACAO)
      references GEC.GECTB581_STCO_MNSDE_RCPAO 
(NU_STCO_MNSLDE_RECUPERACAO)
      on delete restrict;

alter table GEC.GECTB600_GARANTIA_VEICULO
   add constraint GEC1F600 foreign key (NU_CREDITO)
      references GEC.GECTB577_GARANTIA_C3 (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB600_GARANTIA_VEICULO
   add constraint GEC2F600 foreign key (NU_SITUACAO_VALIDACAO_PARCELA)
      references GEC.GECTB580_STCO_VLDCO_PARCELA 
(NU_SITUACAO_VALIDACAO_PARCELA)
      on delete restrict;

alter table GEC.GECTB600_GARANTIA_VEICULO
   add constraint GEC3F600 foreign key (CO_TIPO_TABELA_VEICULO)
      references GEC.GECTB573_TIPO_TABELA_VEICULO 
(CO_TIPO_TABELA_VEICULO)
      on delete restrict;

alter table GEC.GECTB602_SOLICITACAO_RELATORIO
   add constraint GEC1F602 foreign key (NU_CODIGO_RELATORIO)
      references GEC.GECTB601_TIPO_RELATORIO (NU_CODIGO_RELATORIO)
      on delete restrict;

alter table GEC.GECTB602_SOLICITACAO_RELATORIO
   add constraint GEC2F602 foreign key (NU_SITUACAO_RELATORIO)
      references GEC.GECTB604_SITUACAO_RELATORIO (NU_SITUACAO_RELATORIO)

      on delete restrict;

alter table GEC.GECTB602_SOLICITACAO_RELATORIO
   add constraint GEC3F602 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB602_SOLICITACAO_RELATORIO
   add constraint GEC5F602 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB602_SOLICITACAO_RELATORIO
   add constraint GEC6F602 foreign key (NU_SEQ_CONVENENTE)
      references GEC.GECTB502_CONVENENTE (NU_SEQ_CONVENENTE)
      on delete restrict;

alter table GEC.GECTB602_SOLICITACAO_RELATORIO
   add constraint GEC7F602 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB602_SOLICITACAO_RELATORIO
   add constraint GEC8F602 foreign key (NU_SITUACAO_BAIXA_PARCELA)
      references GEC.GECTB746_STCO_BAIXA_PARCELA 
(NU_SITUACAO_BAIXA_PARCELA)
      on delete restrict;

alter table GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO
   add constraint GEC1F603 foreign key (NU_SEQUENCIAL_RELATORIO)
      references GEC.GECTB602_SOLICITACAO_RELATORIO 
(NU_SEQUENCIAL_RELATORIO)
      on delete restrict;

alter table GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO
   add constraint GEC2F603 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB603_VLR_PRSTE_FTRO_CRDTO
   add constraint GEC3F603 foreign key (NU_SEQ_CONVENENTE)
      references GEC.GECTB502_CONVENENTE (NU_SEQ_CONVENENTE)
      on delete restrict;

alter table GEC.GECTB605_RLTRO_ENVIADO_EMAIL
   add constraint GEC1F605 foreign key (NU_SEQUENCIAL_DOCUMENTO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB605_RLTRO_ENVIADO_EMAIL
   add constraint GEC2F605 foreign key (NU_MATRICULA)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB605_RLTRO_ENVIADO_EMAIL
   add constraint GEC3F605 foreign key (NU_SEQUENCIAL_RELATORIO)
      references GEC.GECTB602_SOLICITACAO_RELATORIO 
(NU_SEQUENCIAL_RELATORIO)
      on delete restrict;

alter table GEC.GECTB606_RLTRO_DTLMO_BXA_PRCLA
   add constraint GEC1F606 foreign key (NU_SEQUENCIAL_RELATORIO)
      references GEC.GECTB602_SOLICITACAO_RELATORIO 
(NU_SEQUENCIAL_RELATORIO)
      on delete restrict;

alter table GEC.GECTB607_RLTRO_LQDCO_ANTCA
   add constraint GEC1F607 foreign key (NU_SEQUENCIAL_RELATORIO)
      references GEC.GECTB602_SOLICITACAO_RELATORIO 
(NU_SEQUENCIAL_RELATORIO)
      on delete restrict;

alter table GEC.GECTB607_RLTRO_LQDCO_ANTCA
   add constraint GEC2F607 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE
   add constraint GEC1F608 foreign key (NU_SEQUENCIAL_RELATORIO)
      references GEC.GECTB602_SOLICITACAO_RELATORIO 
(NU_SEQUENCIAL_RELATORIO)
      on delete restrict;

alter table GEC.GECTB608_RLTRO_BXA_PNDNE_RPSE
   add constraint GEC2F608 foreign key (NU_SITUACAO_BAIXA_PARCELA)
      references GEC.GECTB746_STCO_BAIXA_PARCELA 
(NU_SITUACAO_BAIXA_PARCELA)
      on delete restrict;

alter table GEC.GECTB609_EVNTO_LQDCO_TRANCHE
   add constraint GEC1F609 foreign key (NU_SEQUENCIAL_EVENTO)
      references GEC.GECTB611_EVNTO_LQDCO_ANTCA (NU_SEQUENCIAL_EVENTO)
      on delete restrict;

alter table GEC.GECTB609_EVNTO_LQDCO_TRANCHE
   add constraint GEC2F609 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB610_ARQVO_LQDCO_ANTCA
   add constraint GEC1F610 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB611_EVNTO_LQDCO_ANTCA
   add constraint GEC1F611 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB611_EVNTO_LQDCO_ANTCA
   add constraint GEC2F611 foreign key (CO_SITUACAO_LIQUIDACAO)
      references GEC.GECTB614_STCO_LQDCO_ANTECIPADA 
(CO_SITUACAO_LIQUIDACAO)
      on delete restrict;

alter table GEC.GECTB612_TED_EVNTO_LQDCO_ANTCA
   add constraint GEC1F612 foreign key (CO_NUOP)
      references GEC.GECTB511_TED_COMERCIAL (CO_NUOP)
      on delete restrict;

alter table GEC.GECTB612_TED_EVNTO_LQDCO_ANTCA
   add constraint GEC2F612 foreign key (NU_SEQUENCIAL_EVENTO)
      references GEC.GECTB611_EVNTO_LQDCO_ANTCA (NU_SEQUENCIAL_EVENTO)
      on delete restrict;

alter table GEC.GECTB612_TED_EVNTO_LQDCO_ANTCA
   add constraint GEC3F612 foreign key (NU_SEQUENCIAL_VINCULO, 
TS_MOVIMENTO)
      references GEC.GECTB613_SALDO_CONTA_GRAFICA (NU_SEQUENCIAL_VINCULO
, TS_MOVIMENTO)
      on delete restrict;

alter table GEC.GECTB613_SALDO_CONTA_GRAFICA
   add constraint GEC1F613 foreign key (NU_SEQUENCIAL_VINCULO)
      references GEC.GECTB565_VNCCO_CIT_PRODUTO_IF (NU_SQNCL_VINCULO)
      on delete restrict;

alter table GEC.GECTB613_SALDO_CONTA_GRAFICA
   add constraint GEC2F613 foreign key (NU_FATOR)
      references GEC.GECTB508_FATOR_REMUNERACAO (NU_FATOR)
      on delete restrict;

alter table GEC.GECTB615_FLXO_PGMNO_CONTABIL
   add constraint GEC1F615 foreign key (CO_TIPO_EVENTO)
      references GEC.GECTB616_TIPO_EVENTO (CO_TIPO_EVENTO)
      on delete restrict;

alter table GEC.GECTB615_FLXO_PGMNO_CONTABIL
   add constraint GEC2F615 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB615_FLXO_PGMNO_CONTABIL
   add constraint GEC3F615 foreign key (CO_TIPO_FLUXO)
      references GEC.GECTB652_TIPO_FLUXO (CO_TIPO_FLUXO)
      on delete restrict;

alter table GEC.GECTB617_FLUXO_AQUISICAO
   add constraint GEC1F617 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB618_HSTRO_STCO_DEVEDOR
   add constraint GEC1F618 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB619_SITUACAO_DEVEDOR (NU_SITUACAO_DEVEDOR)
      on delete restrict;

alter table GEC.GECTB618_HSTRO_STCO_DEVEDOR
   add constraint GEC2F618 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB620_EXTRACAO_SIAPC
   add constraint GEC1F620 foreign key (NU_SITUACAO_RELATORIO)
      references GEC.GECTB604_SITUACAO_RELATORIO (NU_SITUACAO_RELATORIO)

      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GEC1F621 foreign key (NU_SQNCL_GERACAO_ARQVO)
      references GEC.GECTB620_EXTRACAO_SIAPC (NU_SQNCL_GERACAO_ARQVO)
      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GEC2F621 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GEC3F621 foreign key (NU_SITUACAO_CONTRATO)
      references GEC.GECTB624_SITUACAO_CONTRATO (NU_SITUACAO_CONTRATO)
      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GEC4F621 foreign key (NU_TIPO_CONTRATO)
      references GEC.GECTB623_TIPO_CONTRATO (NU_TIPO_CONTRATO)
      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GEC5F621 foreign key (NU_MODALIDADE_OPERACAO, 
NU_SUB_MODALIDADE_OPERACAO)
      references GEC.GECTB626_SUBNVL_MDLDE_OPRCO (NU_MODALIDADE_OPERACAO
, NU_SUB_MODALIDADE_OPERACAO)
      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GEC6F621 foreign key (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      references GEC.GECTB628_INDXR_TXA_REFERENCIAL (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GEC7F621 foreign key (NU_MOEDA_VARIACAO_CAMBIAL)
      references GEC.GECTB630_VARIACAO_CAMBIAL (NU_MOEDA_VARIACAO)
      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GEC8F621 foreign key (NU_TIPO_RENEGOCIACAO)
      references GEC.GECTB631_TIPO_RENEGOCIACAO (NU_TIPO_RENEGOCIACAO)
      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GEC9F621 foreign key (NU_TIPO_FORMA_PAGAMENTO)
      references GEC.GECTB632_TIPO_FORMA_PAGAMENTO 
(NU_TIPO_FORMA_PAGAMENTO)
      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GECAF621 foreign key (NU_SITUACAO_DEVEDOR)
      references GEC.GECTB619_SITUACAO_DEVEDOR (NU_SITUACAO_DEVEDOR)
      on delete restrict;

alter table GEC.GECTB621_CONTRATO_NVO_ALTERADO
   add constraint GECBF621 foreign key (NU_NATUREZA_OPERACAO)
      references GEC.GECTB625_NATUREZA_OPERACAO (NU_NATUREZA_OPERACAO)
      on delete restrict;

alter table GEC.GECTB622_VENCIMENTO_SEGREGADO
   add constraint GEC1F622 foreign key (NU_SQNCL_GERACAO_ARQVO)
      references GEC.GECTB620_EXTRACAO_SIAPC (NU_SQNCL_GERACAO_ARQVO)
      on delete restrict;

alter table GEC.GECTB622_VENCIMENTO_SEGREGADO
   add constraint GEC2F622 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB622_VENCIMENTO_SEGREGADO
   add constraint GEC3F622 foreign key (NU_TIPO_INFORMACAO)
      references GEC.GECTB634_TIPO_INFORMACAO (NU_TIPO_INFORMACAO)
      on delete restrict;

alter table GEC.GECTB626_SUBNVL_MDLDE_OPRCO
   add constraint GEC1F626 foreign key (NU_MODALIDADE_OPERACAO)
      references GEC.GECTB627_MODALIDADE_OPERACAO 
(NU_MODALIDADE_OPERACAO)
      on delete restrict;

alter table GEC.GECTB628_INDXR_TXA_REFERENCIAL
   add constraint GEC1F628 foreign key (NU_TIPO_TAXA_REFERENCIAL)
      references GEC.GECTB629_TPO_TAXA_REFERENCIAL 
(NU_TIPO_TAXA_REFERENCIAL)
      on delete restrict;

alter table GEC.GECTB633_CREDITO_LQDCO_ANTCA
   add constraint GEC1F633 foreign key (NU_SQNCL_ARQUIVO_RECEBIDO)
      references GEC.GECTB610_ARQVO_LQDCO_ANTCA 
(NU_SQNCL_ARQUIVO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB633_CREDITO_LQDCO_ANTCA
   add constraint GEC2F633 foreign key (CO_MOTIVO_EVENTO_C3)
      references GEC.GECTB596_MOTIVO_EVENTO (CO_MOTIVO_EVENTO)
      on delete restrict;

alter table GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO
   add constraint GEC1F635 foreign key (NU_SEQUENCIAL_RELATORIO)
      references GEC.GECTB602_SOLICITACAO_RELATORIO 
(NU_SEQUENCIAL_RELATORIO)
      on delete restrict;

alter table GEC.GECTB635_RLTRO_ANTCA_SEM_CBRCO
   add constraint GEC2F635 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB636_GARANTIA_CONTRATO
   add constraint GEC1F636 foreign key (NU_SEQUENCIAL_GERACAO_ARQUIVO)
      references GEC.GECTB620_EXTRACAO_SIAPC (NU_SQNCL_GERACAO_ARQVO)
      on delete restrict;

alter table GEC.GECTB636_GARANTIA_CONTRATO
   add constraint GEC2F636 foreign key (NU_TIPO_INFORMACAO)
      references GEC.GECTB634_TIPO_INFORMACAO (NU_TIPO_INFORMACAO)
      on delete restrict;

alter table GEC.GECTB636_GARANTIA_CONTRATO
   add constraint GEC3F636 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB637_ETTRA_ARQVO_IMPORTADO
   add constraint GEC1F637 foreign key (NU_CONTROLE_EXECUCAO_ROTINA, 
CO_ROTINA_PROCESSAMENTO)
      references GEC.GECTB779_CTRLE_EXECUCAO_ROTINA 
(NU_CONTROLE_EXECUCAO_ROTINA, CO_ROTINA_PROCESSAMENTO)
      on delete restrict;

alter table GEC.GECTB637_ETTRA_ARQVO_IMPORTADO
   add constraint GEC2F637 foreign key (NU_SITUACAO_VALIDACAO)
      references GEC.GECTB653_SITUACAO_VLDCO_ARQVO 
(NU_SITUACAO_VALIDACAO)
      on delete restrict;

alter table GEC.GECTB637_ETTRA_ARQVO_IMPORTADO
   add constraint GEC3F637 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB637_ETTRA_ARQVO_IMPORTADO
   add constraint GEC4F637 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB637_ETTRA_ARQVO_IMPORTADO
   add constraint GEC5F637 foreign key (CO_TIPO_MOVIMENTO_ARQUIVO)
      references GEC.GECTB783_TIPO_MOVIMENTO_ARQVO 
(CO_TIPO_MOVIMENTO_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB638_DTLHE_ARQVO_IMPORTADO
   add constraint GEC1F638 foreign key (NU_SQNCL_ARQUIVO_IMPORTADO)
      references GEC.GECTB637_ETTRA_ARQVO_IMPORTADO 
(NU_SQNCL_ARQUIVO_IMPORTADO)
      on delete restrict;

alter table GEC.GECTB640_ERRO_VALIDACAO
   add constraint GEC1F640 foreign key (NU_SQNCL_ARQUIVO_IMPORTADO, 
NU_LINHA_ARQUIVO_ERRO)
      references GEC.GECTB638_DTLHE_ARQVO_IMPORTADO 
(NU_SQNCL_ARQUIVO_IMPORTADO, NU_LINHA_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB640_ERRO_VALIDACAO
   add constraint GEC2F640 foreign key (NU_TIPO_ERRO_ENCONTRADO)
      references GEC.GECTB639_TIPO_ERRO_VALIDACAO 
(NU_SEQUENCIAL_TIPO_ERRO)
      on delete restrict;

alter table GEC.GECTB641_PREMIO_PERFORMANCE
   add constraint GEC1F641 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB641_PREMIO_PERFORMANCE
   add constraint GEC2F641 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB642_TED_PRMO_PERFORMANCE
   add constraint GEC1F642 foreign key (NU_SEQUENCIAL_PREMIO)
      references GEC.GECTB641_PREMIO_PERFORMANCE (NU_SEQUENCIAL_PREMIO)

      on delete restrict;

alter table GEC.GECTB642_TED_PRMO_PERFORMANCE
   add constraint GEC2F642 foreign key (CO_NUOP)
      references GEC.GECTB511_TED_COMERCIAL (CO_NUOP)
      on delete restrict;

alter table GEC.GECTB643_MAPA_INDMA_TRANCHE
   add constraint GEC1F643 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB645_INADIMPLENCIA_TRANCHE
   add constraint GEC1F645 foreign key (NU_SEQUENCIAL_FAIXA)
      references GEC.GECTB644_FAIXA_ATRASO_INDMA (NU_SEQUENCIAL_FAIXA)
      on delete restrict;

alter table GEC.GECTB645_INADIMPLENCIA_TRANCHE
   add constraint GEC2F645 foreign key (NU_SEQUENCIAL_MAPA_TRANCHE)
      references GEC.GECTB643_MAPA_INDMA_TRANCHE (NU_SQNCL_MAPA_TRANCHE)

      on delete restrict;

alter table GEC.GECTB646_MPA_INDMA_CONVENENTE
   add constraint GEC1F646 foreign key (NU_SEQUENCIAL_CONVENENTE)
      references GEC.GECTB502_CONVENENTE (NU_SEQ_CONVENENTE)
      on delete restrict;

alter table GEC.GECTB647_INDMA_TIPO_VCLO_COTA
   add constraint GEC1F647 foreign key (NU_SEQUENCIAL_MAPA_TRANCHE)
      references GEC.GECTB643_MAPA_INDMA_TRANCHE (NU_SQNCL_MAPA_TRANCHE)

      on delete restrict;

alter table GEC.GECTB647_INDMA_TIPO_VCLO_COTA
   add constraint GEC2F647 foreign key (NU_SEQUENCIAL_FAIXA)
      references GEC.GECTB644_FAIXA_ATRASO_INDMA (NU_SEQUENCIAL_FAIXA)
      on delete restrict;

alter table GEC.GECTB647_INDMA_TIPO_VCLO_COTA
   add constraint GEC3F647 foreign key (CO_TIPO_VEICULO)
      references GEC.GECTB550_TIPO_VEICULO (CO_TIPO_VEICULO)
      on delete restrict;

alter table GEC.GECTB649_DTLHE_RLTRO_REPASSE
   add constraint GEC1F649 foreign key (NU_SEQUENCIAL_RELATORIO)
      references GEC.GECTB602_SOLICITACAO_RELATORIO 
(NU_SEQUENCIAL_RELATORIO)
      on delete restrict;

alter table GEC.GECTB649_DTLHE_RLTRO_REPASSE
   add constraint GEC2F649 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB650_FLXO_SLDO_DEVEDOR_IF
   add constraint GEC1F650 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB651_FLUXO_SALDO_CREDITO
   add constraint GEC1F651 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB654_FLUXO_RCBMO_CONVENIO
   add constraint GEC1F654 foreign key (NU_SEQUENCIAL_CONVENENTE)
      references GEC.GECTB502_CONVENENTE (NU_SEQ_CONVENENTE)
      on delete restrict;

alter table GEC.GECTB654_FLUXO_RCBMO_CONVENIO
   add constraint GEC2F654 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB655_FLUXO_RECEBIMENTO_VEICULO
   add constraint GEC1F655 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB655_FLUXO_RECEBIMENTO_VEICULO
   add constraint GEC2F655 foreign key (CO_TIPO_VEICULO)
      references GEC.GECTB550_TIPO_VEICULO (CO_TIPO_VEICULO)
      on delete restrict;

alter table GEC.GECTB656_SITUACAO_PARCELA_C3
   add constraint GEC1F656 foreign key (NU_CREDITO, 
NU_SEQUENCIAL_RESERVA, NU_ARQUIVO)
      references GEC.GECTB571_CONTRATO_ARQUIVO (NU_CREDITO, 
NU_SEQUENCIAL_RESERVA, NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB657_CMPMO_CANCELAMENTO
   add constraint GEC1F657 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB657_CMPMO_CANCELAMENTO
   add constraint GEC2F657 foreign key (NU_MTRCA_RSPNL_CANCELAMENTO)
      references ICO.ICOTBH01_EMPRO_CXA (NU_MATRICULA)
      on delete restrict;

alter table GEC.GECTB660_VNCLO_TRANCHE_RESERVA
   add constraint GEC1F660 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB660_VNCLO_TRANCHE_RESERVA
   add constraint GEC2F660 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB661_VARREDURA_RGSDA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB660_VNCLO_TRANCHE_RESERVA
   add constraint GEC3F660 foreign key (NU_SITUACAO_VINCULACAO)
      references GEC.GECTB659_SITUACAO_VINCULACAO 
(NU_SITUACAO_VINCULACAO)
      on delete restrict;

alter table GEC.GECTB661_VARREDURA_RGSDA
   add constraint GEC1F661 foreign key (NU_TIPO_COOBRIGACAO_CSNRO)
      references GEC.GECTB684_TIPO_COOBRIGACAO (NU_TIPO_COOBRIGACAO)
      on delete restrict;

alter table GEC.GECTB661_VARREDURA_RGSDA
   add constraint GEC2F661 foreign key (NU_SQNCL_SLCTO_CANCELAMENTO)
      references GEC.GECTB588_SOLICITACAO_ARQUIVO 
(NU_SEQUENCIAL_SOLICITACAO)
      on delete restrict;

alter table GEC.GECTB661_VARREDURA_RGSDA
   add constraint GEC3F661 foreign key (CO_MTVO_RCSA_CANCELAMENTO)
      references GEC.GECTB574_ERRO_C3 (CO_ERRO_C3)
      on delete restrict;

alter table GEC.GECTB661_VARREDURA_RGSDA
   add constraint GEC4F661 foreign key (NU_SITUACAO_RESERVA)
      references GEC.GECTB572_SITUACAO_RESERVA (NU_SITUACAO_RESERVA)
      on delete restrict;

alter table GEC.GECTB665_CREDITO_RESERVA_RGSDA
   add constraint GEC1F665 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB661_VARREDURA_RGSDA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB665_CREDITO_RESERVA_RGSDA
   add constraint GEC3F665 foreign key (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      references GEC.GECTB628_INDXR_TXA_REFERENCIAL (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      on delete restrict;

alter table GEC.GECTB665_CREDITO_RESERVA_RGSDA
   add constraint GEC4F665 foreign key (NU_TPO_RGME_AMRTO_CONTRATADO)
      references GEC.GECTB664_TIPO_REGIME_AMRTO 
(NU_TIPO_REGIME_AMORTIZACAO)
      on delete restrict;

alter table GEC.GECTB665_CREDITO_RESERVA_RGSDA
   add constraint GEC6F665 foreign key (NU_TIPO_PERIODICIDADE)
      references GEC.GECTB663_TIPO_PERIODICIDADE (NU_TIPO_PERIODICIDADE)

      on delete restrict;

alter table GEC.GECTB665_CREDITO_RESERVA_RGSDA
   add constraint GEC7F665 foreign key (NU_NATUREZA_OPERACAO)
      references GEC.GECTB625_NATUREZA_OPERACAO (NU_NATUREZA_OPERACAO)
      on delete restrict;

alter table GEC.GECTB665_CREDITO_RESERVA_RGSDA
   add constraint GEC8F665 foreign key (NU_CREDITO_CONTRATO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB666_ENCARGO_CONTRATO
   add constraint GEC1F666 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_REGISTRADORA)
      references GEC.GECTB665_CREDITO_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA)
      on delete restrict;

alter table GEC.GECTB666_ENCARGO_CONTRATO
   add constraint GEC2F666 foreign key (NU_TIPO_ENCARGO)
      references GEC.GECTB669_TIPO_ENCARGO (NU_TIPO_ENCARGO)
      on delete restrict;

alter table GEC.GECTB666_ENCARGO_CONTRATO
   add constraint GEC3F666 foreign key (NU_TIPO_PERIODICIDADE)
      references GEC.GECTB663_TIPO_PERIODICIDADE (NU_TIPO_PERIODICIDADE)

      on delete restrict;

alter table GEC.GECTB666_ENCARGO_CONTRATO
   add constraint GEC4F666 foreign key (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      references GEC.GECTB628_INDXR_TXA_REFERENCIAL (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      on delete restrict;

alter table GEC.GECTB667_CRITERIO_SELECAO
   add constraint GEC1F667 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB661_VARREDURA_RGSDA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB667_CRITERIO_SELECAO
   add constraint GEC2F667 foreign key (NU_TIPO_CONTRATO)
      references GEC.GECTB623_TIPO_CONTRATO (NU_TIPO_CONTRATO)
      on delete restrict;

alter table GEC.GECTB670_CLIENTE_CONTRATO
   add constraint GEC1F670 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
      references GEC.GECTB665_CREDITO_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA)
      on delete restrict;

alter table GEC.GECTB670_CLIENTE_CONTRATO
   add constraint GEC2F670 foreign key (NU_TIPO_DOCUMENTO)
      references GEC.GECTB673_TPO_DCMTO_IDNFO (NU_TIPO_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB674_ENDERECO_CLIENTE
   add constraint GEC1F674 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, NU_CPF_CNPJ_CLIENTE)
      references GEC.GECTB670_CLIENTE_CONTRATO 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA, NU_CPF_CNPJ_CLIENTE)
      on delete restrict;

alter table GEC.GECTB675_REPRESENTANTE_LEGAL
   add constraint GEC1F675 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, NU_CPF_CNPJ_CLIENTE)
      references GEC.GECTB670_CLIENTE_CONTRATO 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA, NU_CPF_CNPJ_CLIENTE)
      on delete restrict;

alter table GEC.GECTB676_GARANTIA_CESSAO_RGSDA
   add constraint GEC1F676 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
      references GEC.GECTB665_CREDITO_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA)
      on delete restrict;

alter table GEC.GECTB677_OBJETO_CTRTO_CNGDO
   add constraint GEC1F677 foreign key (NU_VINCULO_EMPREGATICIO)
      references GEC.GECTB678_TIPO_EMPREGATICIO 
(NU_TIPO_VINCULO_EMPREGATICIO)
      on delete restrict;

alter table GEC.GECTB677_OBJETO_CTRTO_CNGDO
   add constraint GEC2F677 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
      references GEC.GECTB665_CREDITO_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA)
      on delete restrict;

alter table GEC.GECTB677_OBJETO_CTRTO_CNGDO
   add constraint GEC3F677 foreign key (CO_TIPO_ENTE_CONSIGNANTE)
      references GEC.GECTB671_TIPO_ENTE_CONSIGNANTE 
(CO_TIPO_ENTE_CONSIGNANTE)
      on delete restrict;

alter table GEC.GECTB679_PRCLA_RESERVA_RGSDA
   add constraint GEC1F679 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
      references GEC.GECTB665_CREDITO_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA)
      on delete restrict;

alter table GEC.GECTB679_PRCLA_RESERVA_RGSDA
   add constraint GEC2F679 foreign key (NU_SITUACAO_PARCELA)
      references GEC.GECTB681_STCO_PARCELA_RGSDA 
(NU_SITUACAO_PARCELA_RGSDA)
      on delete restrict;

alter table GEC.GECTB679_PRCLA_RESERVA_RGSDA
   add constraint GEC3F679 foreign key (NU_PARCELA_CREDITO)
      references GEC.GECTB523_PARCELA_CREDITO (NU_PARCELA_CREDITO)
      on delete restrict;

alter table GEC.GECTB679_PRCLA_RESERVA_RGSDA
   add constraint GEC4F679 foreign key (NU_SITUACAO_REPASSE)
      references GEC.GECTB753_SITUACAO_REPASSE (NU_SITUACAO_REPASSE)
      on delete restrict;

alter table GEC.GECTB679_PRCLA_RESERVA_RGSDA
   add constraint GEC5F679 foreign key (NU_SITUACAO_BAIXA_PARCELA)
      references GEC.GECTB746_STCO_BAIXA_PARCELA 
(NU_SITUACAO_BAIXA_PARCELA)
      on delete restrict;

alter table GEC.GECTB680_PGMNO_PARCELA_RGSDA
   add constraint GEC1F680 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, 
NU_UNICO_PARCELA_REGISTRADORA)
      references GEC.GECTB679_PRCLA_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_PARCELA_REGISTRADORA)
      on delete restrict;

alter table GEC.GECTB682_DETALHE_RESERVA
   add constraint GEC1F682 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB661_VARREDURA_RGSDA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB683_VINCULA_ARQVO_RESRVA
   add constraint GEC1F683 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB683_VINCULA_ARQVO_RESRVA
   add constraint GEC2F683 foreign key (NU_EVENTO_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB661_VARREDURA_RGSDA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB685_HSTRO_SITUACAO_RSRVA
   add constraint GEC1F685 foreign key (NU_UNICO_C3, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB661_VARREDURA_RGSDA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB685_HSTRO_SITUACAO_RSRVA
   add constraint GEC2F685 foreign key (NU_SITUACAO_RESERVA)
      references GEC.GECTB572_SITUACAO_RESERVA (NU_SITUACAO_RESERVA)
      on delete restrict;

alter table GEC.GECTB686_RPRSE_LGL_GRNTA_FDJRA
   add constraint GEC1F686 foreign key (NU_UNICO_GARANTIA_RGSDA, 
NU_SQNCL_GRNTA_FIDEJUSSORIA)
      references GEC.GECTB696_GRNTA_FDJRA_CESSAO 
(NU_UNICO_GARANTIA_RGSDA, NU_SQNCL_GRNTA_FIDEJUSSORIA)
      on delete restrict;

alter table GEC.GECTB687_CESSAO_REGISTRADORA
   add constraint GEC1F687 foreign key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB661_VARREDURA_RGSDA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB687_CESSAO_REGISTRADORA
   add constraint GEC3F687 foreign key (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      references GEC.GECTB628_INDXR_TXA_REFERENCIAL (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      on delete restrict;

alter table GEC.GECTB687_CESSAO_REGISTRADORA
   add constraint GEC4F687 foreign key (NU_NATUREZA_OPERACAO)
      references GEC.GECTB625_NATUREZA_OPERACAO (NU_NATUREZA_OPERACAO)
      on delete restrict;

alter table GEC.GECTB687_CESSAO_REGISTRADORA
   add constraint GEC5F687 foreign key (NU_SQNCL_SOLICITACAO_CESSAO)
      references GEC.GECTB588_SOLICITACAO_ARQUIVO 
(NU_SEQUENCIAL_SOLICITACAO)
      on delete restrict;

alter table GEC.GECTB687_CESSAO_REGISTRADORA
   add constraint GEC6F687 foreign key (CO_MTVO_RCSA_CANCELAMENTO)
      references GEC.GECTB574_ERRO_C3 (CO_ERRO_C3)
      on delete restrict;

alter table GEC.GECTB687_CESSAO_REGISTRADORA
   add constraint GEC7F687 foreign key (NU_SITUACAO_CESSAO)
      references GEC.GECTB699_SITUACAO_CESSAO_C3 (NU_SITUACAO_CESSAO_C3)

      on delete restrict;

alter table GEC.GECTB688_DIVERGENCIA_CESSAO
   add constraint GEC1F688 foreign key (NU_TIPO_DIVERGENCIA)
      references GEC.GECTB689_TIPO_DIVERGENCIA (NU_TIPO_DIVERGENCIA)
      on delete restrict;

alter table GEC.GECTB688_DIVERGENCIA_CESSAO
   add constraint GEC2F688 foreign key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO, NU_SQNCL_VARREDURA)
      references GEC.GECTB690_VARREDURA_CESSAO (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO, NU_SQNCL_VARREDURA)
      on delete restrict;

alter table GEC.GECTB690_VARREDURA_CESSAO
   add constraint GEC1F690 foreign key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB661_VARREDURA_RGSDA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB690_VARREDURA_CESSAO
   add constraint GEC2F690 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB690_VARREDURA_CESSAO
   add constraint GEC3F690 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB691_ACEITE_RESERVA
   add constraint GEC1F691 foreign key (NU_SEQUENCIAL_SOLICITACAO)
      references GEC.GECTB588_SOLICITACAO_ARQUIVO 
(NU_SEQUENCIAL_SOLICITACAO)
      on delete restrict;

alter table GEC.GECTB691_ACEITE_RESERVA
   add constraint GEC2F691 foreign key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB661_VARREDURA_RGSDA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB692_PARCELA_ACEITE_RSRVA
   add constraint GEC1F692 foreign key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO, NU_SEQUENCIAL_SOLICITACAO)
      references GEC.GECTB691_ACEITE_RESERVA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO, NU_SEQUENCIAL_SOLICITACAO)
      on delete restrict;

alter table GEC.GECTB692_PARCELA_ACEITE_RSRVA
   add constraint GEC2F692 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB692_PARCELA_ACEITE_RSRVA
   add constraint GEC4F692 foreign key (CO_MOTIVO_RECUSA)
      references GEC.GECTB574_ERRO_C3 (CO_ERRO_C3)
      on delete restrict;

alter table GEC.GECTB693_DTLHE_GRNTA_VEICULO
   add constraint GEC1F693 foreign key (NU_UNICO_GARANTIA_RGSDA)
      references GEC.GECTB676_GARANTIA_CESSAO_RGSDA 
(NU_UNICO_GARANTIA_RGSDA)
      on delete restrict;

alter table GEC.GECTB695_IMOVEL_GRNTA_CESSAO
   add constraint GEC1F695 foreign key (NU_TIPO_IMOVEL)
      references GEC.GECTB742_TIPO_IMOVEL (NU_TIPO_IMOVEL)
      on delete restrict;

alter table GEC.GECTB695_IMOVEL_GRNTA_CESSAO
   add constraint GEC2F695 foreign key (NU_UNICO_GARANTIA_RGSDA)
      references GEC.GECTB676_GARANTIA_CESSAO_RGSDA 
(NU_UNICO_GARANTIA_RGSDA)
      on delete restrict;

alter table GEC.GECTB696_GRNTA_FDJRA_CESSAO
   add constraint GEC1F696 foreign key (NU_UNICO_GARANTIA_RGSDA)
      references GEC.GECTB676_GARANTIA_CESSAO_RGSDA 
(NU_UNICO_GARANTIA_RGSDA)
      on delete restrict;

alter table GEC.GECTB697_EQPMO_GRNTA_CESSAO
   add constraint GEC1F697 foreign key (NU_UNICO_GARANTIA_RGSDA)
      references GEC.GECTB676_GARANTIA_CESSAO_RGSDA 
(NU_UNICO_GARANTIA_RGSDA)
      on delete restrict;

alter table GEC.GECTB698_INSNO_FNNCO_GRNTA
   add constraint GEC1F698 foreign key (NU_UNICO_GARANTIA_RGSDA)
      references GEC.GECTB676_GARANTIA_CESSAO_RGSDA 
(NU_UNICO_GARANTIA_RGSDA)
      on delete restrict;

alter table GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE
   add constraint GEC1F700 foreign key (NU_EVENTO_LIQUIDACAO_REPASSE)
      references GEC.GECTB752_EVENTO_RGSDA (NU_EVENTO_RGSDA)
      on delete restrict;

alter table GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE
   add constraint GEC2F700 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE
   add constraint GEC3F700 foreign key (NU_SITUACAO_REPASSE)
      references GEC.GECTB753_SITUACAO_REPASSE (NU_SITUACAO_REPASSE)
      on delete restrict;

alter table GEC.GECTB701_PARCELA_REPASSE_RGSDA
   add constraint GEC1F701 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, 
NU_UNICO_PARCELA_REGISTRADORA)
      references GEC.GECTB679_PRCLA_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_PARCELA_REGISTRADORA)
      on delete restrict;

alter table GEC.GECTB701_PARCELA_REPASSE_RGSDA
   add constraint GEC2F701 foreign key (NU_EVENTO_LIQUIDACAO_REPASSE)
      references GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE 
(NU_EVENTO_LIQUIDACAO_REPASSE)
      on delete restrict;

alter table GEC.GECTB701_PARCELA_REPASSE_RGSDA
   add constraint GEC3F701 foreign key (NU_EVENTO_ESTORNO)
      references GEC.GECTB707_EVNTO_ESTORNO_RGSDA (NU_EVENTO_ESTORNO)
      on delete restrict;

alter table GEC.GECTB702_CONTRATO_RPSE_RGSDA
   add constraint GEC1F702 foreign key (NU_EVENTO_LIQUIDACAO_REPASSE)
      references GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE 
(NU_EVENTO_LIQUIDACAO_REPASSE)
      on delete restrict;

alter table GEC.GECTB702_CONTRATO_RPSE_RGSDA
   add constraint GEC2F702 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
      references GEC.GECTB665_CREDITO_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA)
      on delete restrict;

alter table GEC.GECTB702_CONTRATO_RPSE_RGSDA
   add constraint GEC3F702 foreign key (NU_EVENTO_ESTORNO)
      references GEC.GECTB707_EVNTO_ESTORNO_RGSDA (NU_EVENTO_ESTORNO)
      on delete restrict;

alter table GEC.GECTB703_VNCLA_TED_EVENTO_RPSE
   add constraint GEC1F703 foreign key (NU_EVENTO_LIQUIDACAO_REPASSE)
      references GEC.GECTB700_EVNTO_LIQUIDACAO_RPSE 
(NU_EVENTO_LIQUIDACAO_REPASSE)
      on delete restrict;

alter table GEC.GECTB703_VNCLA_TED_EVENTO_RPSE
   add constraint GEC2F703 foreign key (CO_NUOP)
      references GEC.GECTB511_TED_COMERCIAL (CO_NUOP)
      on delete restrict;

alter table GEC.GECTB704_VNCLA_EVENTO_ARQUIVO
   add constraint GEC1F704 foreign key (NU_SQNCL_ARQUIVO_RECEBIDO)
      references GEC.GECTB610_ARQVO_LQDCO_ANTCA 
(NU_SQNCL_ARQUIVO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB704_VNCLA_EVENTO_ARQUIVO
   add constraint GEC2F704 foreign key (NU_SEQUENCIAL_EVENTO)
      references GEC.GECTB611_EVNTO_LQDCO_ANTCA (NU_SEQUENCIAL_EVENTO)
      on delete restrict;

alter table GEC.GECTB705_VNCLA_TED_FLUXO_RCBMO
   add constraint GEC1F705 foreign key (CO_NUOP)
      references GEC.GECTB511_TED_COMERCIAL (CO_NUOP)
      on delete restrict;

alter table GEC.GECTB705_VNCLA_TED_FLUXO_RCBMO
   add constraint GEC2F705 foreign key (NU_SQNCL_PREVISAO)
      references GEC.GECTB566_PREVISAO_RECEBIMENTO (NU_SQNCL_PREVISAO)
      on delete restrict;

alter table GEC.GECTB706_ACEITE_EVENTO_RGSDA
   add constraint GEC1F706 foreign key (NU_EVENTO_ACEITE_RGSDA)
      references GEC.GECTB752_EVENTO_RGSDA (NU_EVENTO_RGSDA)
      on delete restrict;

alter table GEC.GECTB706_ACEITE_EVENTO_RGSDA
   add constraint GEC2F706 foreign key (NU_SEQUENCIAL_SOLICITACAO)
      references GEC.GECTB588_SOLICITACAO_ARQUIVO 
(NU_SEQUENCIAL_SOLICITACAO)
      on delete restrict;

alter table GEC.GECTB706_ACEITE_EVENTO_RGSDA
   add constraint GEC3F706 foreign key (NU_ARQUIVO_EVENTO_ORIGEM)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB707_EVNTO_ESTORNO_RGSDA
   add constraint GEC1F707 foreign key (NU_EVENTO_ESTORNO)
      references GEC.GECTB752_EVENTO_RGSDA (NU_EVENTO_RGSDA)
      on delete restrict;

alter table GEC.GECTB708_TED_EVNTO_RECOMPRA
   add constraint GEC1F708 foreign key (NU_EVENTO_UNICO_REGISTRADORA)
      references GEC.GECTB710_EVENTO_RECOMPRA_RGSDA 
(NU_EVENTO_UNICO_REGISTRADORA)
      on delete restrict;

alter table GEC.GECTB708_TED_EVNTO_RECOMPRA
   add constraint GEC2F708 foreign key (CO_NUOP)
      references GEC.GECTB511_TED_COMERCIAL (CO_NUOP)
      on delete restrict;

alter table GEC.GECTB709_HSTRO_SITUACAO_EVENTO
   add constraint GEC1F709 foreign key (NU_EVENTO_REGISTRADORA)
      references GEC.GECTB752_EVENTO_RGSDA (NU_EVENTO_RGSDA)
      on delete restrict;

alter table GEC.GECTB709_HSTRO_SITUACAO_EVENTO
   add constraint GEC2F709 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB710_EVENTO_RECOMPRA_RGSDA
   add constraint GEC1F710 foreign key (NU_EVENTO_UNICO_REGISTRADORA)
      references GEC.GECTB752_EVENTO_RGSDA (NU_EVENTO_RGSDA)
      on delete restrict;

alter table GEC.GECTB710_EVENTO_RECOMPRA_RGSDA
   add constraint GEC2F710 foreign key (NU_SITUACAO_RECOMPRA)
      references GEC.GECTB718_SITUACAO_RECOMPRA (NU_SITUACAO_RECOMPRA)
      on delete restrict;

alter table GEC.GECTB711_BAIXA_NOVO_CONTRATO
   add constraint GEC1F711 foreign key (NU_EVENTO_BAIXA, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB717_BAIXA_CONTRATO_RGSDA (NU_EVENTO_BAIXA, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB711_BAIXA_NOVO_CONTRATO
   add constraint GEC2F711 foreign key (CO_MODALIDADE_OPRCO_SCR3040)
      references GEC.GECTB626_SUBNVL_MDLDE_OPRCO 
(CO_MODALIDADE_OPRCO_SCR3040)
      on delete restrict;

alter table GEC.GECTB712_ARQUIVO_RECOMPRA_IF
   add constraint GEC1F712 foreign key (NU_SITUACAO_ARQUIVO)
      references GEC.GECTB672_STCO_ARQVO_RCBDO_IF (NU_SITUACAO_ARQUIVO)

      on delete restrict;

alter table GEC.GECTB712_ARQUIVO_RECOMPRA_IF
   add constraint GEC2F712 foreign key (NU_MOTIVO_INVALIDAR_ARQUIVO)
      references GEC.GECTB694_MTVO_INVALIDAR_ARQVO 
(NU_MOTIVO_INVALIDAR_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB712_ARQUIVO_RECOMPRA_IF
   add constraint GEC3F712 foreign key (NU_SEQUENCIAL_DOCUMENTO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB714_BAIXA_PARCELA_RGSDA
   add constraint GEC1F714 foreign key (NU_EVENTO_BAIXA)
      references GEC.GECTB716_EVENTO_BAIXA_RGSDA (NU_EVENTO_BAIXA)
      on delete restrict;

alter table GEC.GECTB714_BAIXA_PARCELA_RGSDA
   add constraint GEC2F714 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, 
NU_UNICO_PARCELA_REGISTRADORA)
      references GEC.GECTB679_PRCLA_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_PARCELA_REGISTRADORA)
      on delete restrict;

alter table GEC.GECTB714_BAIXA_PARCELA_RGSDA
   add constraint GEC3F714 foreign key (NU_TIPO_BAIXA_PARCELA)
      references GEC.GECTB713_TIPO_BAIXA_PARCELA_C3 
(NU_TIPO_BAIXA_PARCELA)
      on delete restrict;

alter table GEC.GECTB714_BAIXA_PARCELA_RGSDA
   add constraint GEC4F714 foreign key (NU_EVENTO_ESTORNO)
      references GEC.GECTB707_EVNTO_ESTORNO_RGSDA (NU_EVENTO_ESTORNO)
      on delete restrict;

alter table GEC.GECTB715_RECOMPRA_CTRTO_RGSDA
   add constraint GEC1F715 foreign key (NU_EVENTO_UNICO_REGISTRADORA)
      references GEC.GECTB710_EVENTO_RECOMPRA_RGSDA 
(NU_EVENTO_UNICO_REGISTRADORA)
      on delete restrict;

alter table GEC.GECTB715_RECOMPRA_CTRTO_RGSDA
   add constraint GEC2F715 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, 
NU_UNICO_PARCELA_REGISTRADORA)
      references GEC.GECTB679_PRCLA_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_PARCELA_REGISTRADORA)
      on delete restrict;

alter table GEC.GECTB716_EVENTO_BAIXA_RGSDA
   add constraint GEC1F716 foreign key (NU_EVENTO_BAIXA)
      references GEC.GECTB752_EVENTO_RGSDA (NU_EVENTO_RGSDA)
      on delete restrict;

alter table GEC.GECTB717_BAIXA_CONTRATO_RGSDA
   add constraint GEC1F717 foreign key (NU_EVENTO_BAIXA)
      references GEC.GECTB716_EVENTO_BAIXA_RGSDA (NU_EVENTO_BAIXA)
      on delete restrict;

alter table GEC.GECTB717_BAIXA_CONTRATO_RGSDA
   add constraint GEC2F717 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
      references GEC.GECTB665_CREDITO_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA)
      on delete restrict;

alter table GEC.GECTB717_BAIXA_CONTRATO_RGSDA
   add constraint GEC3F717 foreign key (CO_TIPO_BAIXA)
      references GEC.GECTB668_TPO_BXA_CONTRATO_C3 (CO_TIPO_BAIXA)
      on delete restrict;

alter table GEC.GECTB717_BAIXA_CONTRATO_RGSDA
   add constraint GEC4F717 foreign key (NU_EVENTO_ESTORNO)
      references GEC.GECTB707_EVNTO_ESTORNO_RGSDA (NU_EVENTO_ESTORNO)
      on delete restrict;

alter table GEC.GECTB719_CREDITO_RECOMPRA
   add constraint GEC1F719 foreign key (NU_CREDITO_CONTRATO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB719_CREDITO_RECOMPRA
   add constraint GEC2F719 foreign key (NU_SQNCL_ARQVO_RECEBIDO)
      references GEC.GECTB712_ARQUIVO_RECOMPRA_IF 
(NU_SQNCL_ARQVO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB719_CREDITO_RECOMPRA
   add constraint GEC3F719 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB720_ARQVO_PCTE_RECOMPRA
   add constraint GEC1F720 foreign key (NU_SQNCL_ARQVO_RECEBIDO)
      references GEC.GECTB712_ARQUIVO_RECOMPRA_IF 
(NU_SQNCL_ARQVO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB720_ARQVO_PCTE_RECOMPRA
   add constraint GEC2F720 foreign key (NU_SQCL_PACOTE_RECOMPRA)
      references GEC.GECTB721_PACOTE_RECOMPRA (NU_SQCL_PACOTE_RECOMPRA)

      on delete restrict;

alter table GEC.GECTB721_PACOTE_RECOMPRA
   add constraint GEC1F721 foreign key (NU_SITUACAO_RECOMPRA)
      references GEC.GECTB718_SITUACAO_RECOMPRA (NU_SITUACAO_RECOMPRA)
      on delete restrict;

alter table GEC.GECTB721_PACOTE_RECOMPRA
   add constraint GEC2F721 foreign key (CO_SITUACAO_EVENTO_C3)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB721_PACOTE_RECOMPRA
   add constraint GEC3F721 foreign key (NU_EVENTO_UNICO_REGISTRADORA)
      references GEC.GECTB710_EVENTO_RECOMPRA_RGSDA 
(NU_EVENTO_UNICO_REGISTRADORA)
      on delete restrict;

alter table GEC.GECTB721_PACOTE_RECOMPRA
   add constraint GEC4F721 foreign key (NU_IF_CEDENTE)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB721_PACOTE_RECOMPRA
   add constraint GEC5F721 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB722_TED_PACOTE_RECOMPRA
   add constraint GEC1F722 foreign key (CO_NUOP)
      references GEC.GECTB511_TED_COMERCIAL (CO_NUOP)
      on delete restrict;

alter table GEC.GECTB722_TED_PACOTE_RECOMPRA
   add constraint GEC2F722 foreign key (NU_SQCL_PACOTE_RECOMPRA)
      references GEC.GECTB721_PACOTE_RECOMPRA (NU_SQCL_PACOTE_RECOMPRA)

      on delete restrict;

alter table GEC.GECTB723_DOCUMENTO_RECOMPRA
   add constraint GEC1F723 foreign key (NU_SEQUENCIAL_DOCUMENTO)
      references GEC.GECTB512_DOCUMENTO_COMERCIAL 
(NU_SEQUENCIAL_DOCUMENTO)
      on delete restrict;

alter table GEC.GECTB723_DOCUMENTO_RECOMPRA
   add constraint GEC2F723 foreign key (NU_SQCL_PACOTE_RECOMPRA)
      references GEC.GECTB721_PACOTE_RECOMPRA (NU_SQCL_PACOTE_RECOMPRA)

      on delete restrict;

alter table GEC.GECTB725_CABECALHO_RLTRO_RCBDO
   add constraint GEC2F725 foreign key (NU_STCO_PROCESSAMENTO_RLTRO)
      references GEC.GECTB760_STCO_PRCMO_RLTRO 
(NU_STCO_PROCESSAMENTO_RLTRO)
      on delete restrict;

alter table GEC.GECTB726_VNCLA_ARQVO_RLTRO_C3
   add constraint GEC1F726 foreign key (NU_SQNCL_RELATORIO_RECEBIDO)
      references GEC.GECTB725_CABECALHO_RLTRO_RCBDO 
(NU_SQNCL_RELATORIO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB726_VNCLA_ARQVO_RLTRO_C3
   add constraint GEC2F726 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB727_PSCO_DIARIA_RSRVA
   add constraint GEC1F727 foreign key (NU_SQNCL_RELATORIO_RECEBIDO)
      references GEC.GECTB725_CABECALHO_RLTRO_RCBDO 
(NU_SQNCL_RELATORIO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB727_PSCO_DIARIA_RSRVA
   add constraint GEC2F727 foreign key (NU_SITUACAO_RESERVA)
      references GEC.GECTB572_SITUACAO_RESERVA (NU_SITUACAO_RESERVA)
      on delete restrict;

alter table GEC.GECTB728_PSCO_DIARIA_CESSAO
   add constraint GEC1F728 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB728_PSCO_DIARIA_CESSAO
   add constraint GEC2F728 foreign key (NU_SQNCL_RELATORIO_RECEBIDO)
      references GEC.GECTB725_CABECALHO_RLTRO_RCBDO 
(NU_SQNCL_RELATORIO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB729_PSCO_DIARIA_CONTRATO
   add constraint GEC1F729 foreign key (NU_SQNCL_RELATORIO_RECEBIDO)
      references GEC.GECTB725_CABECALHO_RLTRO_RCBDO 
(NU_SQNCL_RELATORIO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB729_PSCO_DIARIA_CONTRATO
   add constraint GEC2F729 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB729_PSCO_DIARIA_CONTRATO
   add constraint GEC3F729 foreign key (CO_MOTIVO_EVENTO)
      references GEC.GECTB596_MOTIVO_EVENTO (CO_MOTIVO_EVENTO)
      on delete restrict;

alter table GEC.GECTB730_PSCO_DRA_BLQO_TRNSA
   add constraint GEC1F730 foreign key (NU_SQNCL_RELATORIO_RECEBIDO)
      references GEC.GECTB725_CABECALHO_RLTRO_RCBDO 
(NU_SQNCL_RELATORIO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB731_PSCO_DRA_LQDCO_RPSE
   add constraint GEC1F731 foreign key (NU_SQNCL_RELATORIO_RECEBIDO)
      references GEC.GECTB725_CABECALHO_RLTRO_RCBDO 
(NU_SQNCL_RELATORIO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB731_PSCO_DRA_LQDCO_RPSE
   add constraint GEC2F731 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO
   add constraint GEC1F732 foreign key (NU_SQNCL_RELATORIO_RECEBIDO)
      references GEC.GECTB725_CABECALHO_RLTRO_RCBDO 
(NU_SQNCL_RELATORIO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO
   add constraint GEC2F732 foreign key (CO_MODALIDADE_OPRCO_SCR3040)
      references GEC.GECTB626_SUBNVL_MDLDE_OPRCO 
(CO_MODALIDADE_OPRCO_SCR3040)
      on delete restrict;

alter table GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO
   add constraint GEC3F732 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB732_PSCO_DRA_BAIXA_CTRTO
   add constraint GEC4F732 foreign key (CO_TIPO_BAIXA)
      references GEC.GECTB668_TPO_BXA_CONTRATO_C3 (CO_TIPO_BAIXA)
      on delete restrict;

alter table GEC.GECTB733_CTRTO_PSCO_LNCMO_DRO
   add constraint GEC1F733 foreign key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO)
      references GEC.GECTB731_PSCO_DRA_LQDCO_RPSE 
(NU_SQNCL_RELATORIO_RECEBIDO, IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO)
      on delete restrict;

alter table GEC.GECTB734_RLTRO_QUITACAO_CESSAO
   add constraint GEC1F734 foreign key (NU_SQNCL_RELATORIO_RECEBIDO)
      references GEC.GECTB725_CABECALHO_RLTRO_RCBDO 
(NU_SQNCL_RELATORIO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB735_PSCO_DRA_VNCMO_PRCLA
   add constraint GEC1F735 foreign key (NU_SQNCL_RELATORIO_RECEBIDO)
      references GEC.GECTB725_CABECALHO_RLTRO_RCBDO 
(NU_SQNCL_RELATORIO_RECEBIDO)
      on delete restrict;

alter table GEC.GECTB736_CONTRATO_PSCO_PRCLA
   add constraint GEC1F736 foreign key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO)
      references GEC.GECTB735_PSCO_DRA_VNCMO_PRCLA 
(NU_SQNCL_RELATORIO_RECEBIDO, IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO)
      on delete restrict;

alter table GEC.GECTB737_PRCLA_PSCO_DRA_VNCMO
   add constraint GEC1F737 foreign key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO, NU_UNICO_CONTRATO_RGSDA)
      references GEC.GECTB736_CONTRATO_PSCO_PRCLA 
(NU_SQNCL_RELATORIO_RECEBIDO, IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO, 
NU_UNICO_CONTRATO_RGSDA)
      on delete restrict;

alter table GEC.GECTB737_PRCLA_PSCO_DRA_VNCMO
   add constraint GEC2F737 foreign key (NU_SITUACAO_PARCELA_RGSDA)
      references GEC.GECTB681_STCO_PARCELA_RGSDA 
(NU_SITUACAO_PARCELA_RGSDA)
      on delete restrict;

alter table GEC.GECTB738_GRNTA_CRDTO_CLIENTE
   add constraint GEC1F738 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA)
      references GEC.GECTB665_CREDITO_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA)
      on delete restrict;

alter table GEC.GECTB738_GRNTA_CRDTO_CLIENTE
   add constraint GEC2F738 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB738_GRNTA_CRDTO_CLIENTE
   add constraint GEC3F738 foreign key (NU_TIPO_CONTRATO)
      references GEC.GECTB623_TIPO_CONTRATO (NU_TIPO_CONTRATO)
      on delete restrict;

alter table GEC.GECTB739_VEICULO_GRNTA_CLIENTE
   add constraint GEC1F739 foreign key (NU_SEQUENCIAL_GARANTIA)
      references GEC.GECTB738_GRNTA_CRDTO_CLIENTE 
(NU_SEQUENCIAL_GARANTIA)
      on delete restrict;

alter table GEC.GECTB739_VEICULO_GRNTA_CLIENTE
   add constraint GEC2F739 foreign key (CO_STCO_GRNTA_AGENTE_VALIDADOR)

      references GEC.GECTB582_STCO_GARANTIA_VLDDR 
(CO_STCO_GRNTA_AGENTE_VALIDADOR)
      on delete restrict;

alter table GEC.GECTB739_VEICULO_GRNTA_CLIENTE
   add constraint GEC3F739 foreign key (NU_SITUACAO_VALIDACAO_PARCELA)
      references GEC.GECTB580_STCO_VLDCO_PARCELA 
(NU_SITUACAO_VALIDACAO_PARCELA)
      on delete restrict;

alter table GEC.GECTB740_CNSGA_GARANTIA_CLNTE
   add constraint GEC1F740 foreign key (NU_SEQUENCIAL_GARANTIA)
      references GEC.GECTB738_GRNTA_CRDTO_CLIENTE 
(NU_SEQUENCIAL_GARANTIA)
      on delete restrict;

alter table GEC.GECTB740_CNSGA_GARANTIA_CLNTE
   add constraint GEC2F740 foreign key (CO_STCO_GRNTA_AGENTE_VALIDADOR)

      references GEC.GECTB582_STCO_GARANTIA_VLDDR 
(CO_STCO_GRNTA_AGENTE_VALIDADOR)
      on delete restrict;

alter table GEC.GECTB741_ENDERECO_GARANTIA
   add constraint GEC1F741 foreign key (NU_CPF_CNPJ_PESSOA, 
IC_TIPO_PESSOA)
      references GEC.GECTB749_PESSOA_INSNO_FNNCO (NU_CPF_CNPJ_PESSOA, 
IC_TIPO_PESSOA)
      on delete restrict;

alter table GEC.GECTB741_ENDERECO_GARANTIA
   add constraint GEC2F741 foreign key (NU_UNICO_GARANTIA_RGSDA)
      references GEC.GECTB676_GARANTIA_CESSAO_RGSDA 
(NU_UNICO_GARANTIA_RGSDA)
      on delete restrict;

alter table GEC.GECTB744_MRCDA_GRNTA_CESSAO
   add constraint GEC1F744 foreign key (NU_UNICO_GARANTIA_RGSDA)
      references GEC.GECTB676_GARANTIA_CESSAO_RGSDA 
(NU_UNICO_GARANTIA_RGSDA)
      on delete restrict;

alter table GEC.GECTB744_MRCDA_GRNTA_CESSAO
   add constraint GEC2F744 foreign key (CO_TIPO_PRODUTO_MERCADORIA)
      references GEC.GECTB743_TIPO_PRODUTO (CO_TIPO_PRODUTO)
      on delete restrict;

alter table GEC.GECTB747_RLTRO_GRNTA_RGSDA
   add constraint GEC1F747 foreign key (NU_SEQUENCIAL_RELATORIO)
      references GEC.GECTB602_SOLICITACAO_RELATORIO 
(NU_SEQUENCIAL_RELATORIO)
      on delete restrict;

alter table GEC.GECTB747_RLTRO_GRNTA_RGSDA
   add constraint GEC2F747 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB747_RLTRO_GRNTA_RGSDA
   add constraint GEC3F747 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB747_RLTRO_GRNTA_RGSDA
   add constraint GEC4F747 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB748_DTLHE_RLTRO_GRNTA
   add constraint GEC1F748 foreign key (NU_SQNCL_GARANTIA_ANTERIOR)
      references GEC.GECTB738_GRNTA_CRDTO_CLIENTE 
(NU_SEQUENCIAL_GARANTIA)
      on delete restrict;

alter table GEC.GECTB748_DTLHE_RLTRO_GRNTA
   add constraint GEC2F748 foreign key (NU_SEQUENCIAL_GARANTIA_ATUAL)
      references GEC.GECTB738_GRNTA_CRDTO_CLIENTE 
(NU_SEQUENCIAL_GARANTIA)
      on delete restrict;

alter table GEC.GECTB748_DTLHE_RLTRO_GRNTA
   add constraint GEC3F748 foreign key (NU_SEQUENCIAL_RELATORIO, NU_IF, 
NU_PRODUTO)
      references GEC.GECTB747_RLTRO_GRNTA_RGSDA (NU_SEQUENCIAL_RELATORIO
, NU_IF, NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB748_DTLHE_RLTRO_GRNTA
   add constraint GEC4F748 foreign key (NU_CREDITO_CONTRATO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB748_DTLHE_RLTRO_GRNTA
   add constraint GEC5F748 foreign key (CO_STCO_GRNTA_AGENTE_VLDDR_ANR)

      references GEC.GECTB582_STCO_GARANTIA_VLDDR 
(CO_STCO_GRNTA_AGENTE_VALIDADOR)
      on delete restrict;

alter table GEC.GECTB748_DTLHE_RLTRO_GRNTA
   add constraint GEC6F748 foreign key (CO_STCO_GRNTA_AGENTE_VLDDR_ATL)

      references GEC.GECTB582_STCO_GARANTIA_VLDDR 
(CO_STCO_GRNTA_AGENTE_VALIDADOR)
      on delete restrict;

alter table GEC.GECTB748_DTLHE_RLTRO_GRNTA
   add constraint GEC7F748 foreign key (NU_TRANCHE)
      references GEC.GECTB513_TRANCHE (NU_TRANCHE)
      on delete restrict;

alter table GEC.GECTB750_PESSOA_GARANTIA
   add constraint GEC1F750 foreign key (NU_UNICO_GARANTIA_RGSDA)
      references GEC.GECTB698_INSNO_FNNCO_GRNTA 
(NU_UNICO_GARANTIA_RGSDA)
      on delete restrict;

alter table GEC.GECTB750_PESSOA_GARANTIA
   add constraint GEC2F750 foreign key (NU_CPF_CNPJ_PESSOA, 
IC_TIPO_PESSOA)
      references GEC.GECTB749_PESSOA_INSNO_FNNCO (NU_CPF_CNPJ_PESSOA, 
IC_TIPO_PESSOA)
      on delete restrict;

alter table GEC.GECTB751_VINCULA_ARQVO_EVNTO
   add constraint GEC1F751 foreign key (NU_ARQUIVO)
      references GEC.GECTB568_ARQUIVO_C3 (NU_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB751_VINCULA_ARQVO_EVNTO
   add constraint GEC2F751 foreign key (NU_EVENTO_RGSDA)
      references GEC.GECTB752_EVENTO_RGSDA (NU_EVENTO_RGSDA)
      on delete restrict;

alter table GEC.GECTB752_EVENTO_RGSDA
   add constraint GEC1F752 foreign key (NU_SITUACAO_EVENTO)
      references GEC.GECTB592_SITUACAO_EVENTO (NU_SITUACAO_EVENTO)
      on delete restrict;

alter table GEC.GECTB754_VINCULA_ERRO_EVENTO
   add constraint GEC1F754 foreign key (NU_ARQUIVO, NU_SEQUENCIAL_ERRO)

      references GEC.GECTB576_ARQUIVO_ERRO (NU_ARQUIVO, 
NU_SEQUENCIAL_ERRO)
      on delete restrict;

alter table GEC.GECTB754_VINCULA_ERRO_EVENTO
   add constraint GEC2F754 foreign key (NU_EVENTO_RGSDA)
      references GEC.GECTB752_EVENTO_RGSDA (NU_EVENTO_RGSDA)
      on delete restrict;

alter table GEC.GECTB755_ENCARGO_CESSAO
   add constraint GEC1F755 foreign key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB687_CESSAO_REGISTRADORA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB755_ENCARGO_CESSAO
   add constraint GEC2F755 foreign key (NU_TIPO_ENCARGO)
      references GEC.GECTB669_TIPO_ENCARGO (NU_TIPO_ENCARGO)
      on delete restrict;

alter table GEC.GECTB755_ENCARGO_CESSAO
   add constraint GEC3F755 foreign key (NU_TIPO_PERIODICIDADE)
      references GEC.GECTB663_TIPO_PERIODICIDADE (NU_TIPO_PERIODICIDADE)

      on delete restrict;

alter table GEC.GECTB755_ENCARGO_CESSAO
   add constraint GEC4F755 foreign key (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      references GEC.GECTB628_INDXR_TXA_REFERENCIAL (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      on delete restrict;

alter table GEC.GECTB756_ENCARGO_PARCELA
   add constraint GEC1F756 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, 
NU_UNICO_PARCELA_REGISTRADORA)
      references GEC.GECTB679_PRCLA_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_PARCELA_REGISTRADORA)
      on delete restrict;

alter table GEC.GECTB756_ENCARGO_PARCELA
   add constraint GEC2F756 foreign key (NU_TIPO_ENCARGO)
      references GEC.GECTB669_TIPO_ENCARGO (NU_TIPO_ENCARGO)
      on delete restrict;

alter table GEC.GECTB756_ENCARGO_PARCELA
   add constraint GEC3F756 foreign key (NU_TIPO_PERIODICIDADE)
      references GEC.GECTB663_TIPO_PERIODICIDADE (NU_TIPO_PERIODICIDADE)

      on delete restrict;

alter table GEC.GECTB756_ENCARGO_PARCELA
   add constraint GEC4F756 foreign key (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      references GEC.GECTB628_INDXR_TXA_REFERENCIAL (NU_INDEXADOR, 
NU_TIPO_TAXA_REFERENCIAL)
      on delete restrict;

alter table GEC.GECTB757_VINCULA_ERRO_RESERVA
   add constraint GEC1F757 foreign key (NU_ARQUIVO, NU_SEQUENCIAL_ERRO)

      references GEC.GECTB576_ARQUIVO_ERRO (NU_ARQUIVO, 
NU_SEQUENCIAL_ERRO)
      on delete restrict;

alter table GEC.GECTB757_VINCULA_ERRO_RESERVA
   add constraint GEC2F757 foreign key (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      references GEC.GECTB661_VARREDURA_RGSDA (NU_UNICO_RESERVA, 
NU_IDNTR_PRTCE_ADMDO)
      on delete restrict;

alter table GEC.GECTB758_VINCULA_ERRO_PARCELA
   add constraint GEC1F758 foreign key (NU_ARQUIVO, NU_SEQUENCIAL_ERRO)

      references GEC.GECTB576_ARQUIVO_ERRO (NU_ARQUIVO, 
NU_SEQUENCIAL_ERRO)
      on delete restrict;

alter table GEC.GECTB758_VINCULA_ERRO_PARCELA
   add constraint GEC2F758 foreign key (NU_UNICO_RESERVA_REGISTRADORA, 
NU_IDNTR_PRTCE_ADMDO, NU_UNICO_CONTRATO_RGSDA, 
NU_UNICO_PARCELA_REGISTRADORA)
      references GEC.GECTB679_PRCLA_RESERVA_RGSDA 
(NU_UNICO_RESERVA_REGISTRADORA, NU_IDNTR_PRTCE_ADMDO, 
NU_UNICO_CONTRATO_RGSDA, NU_UNICO_PARCELA_REGISTRADORA)
      on delete restrict;

alter table GEC.GECTB759_PRCLA_PSCO_LNCMO_DRO
   add constraint GEC1F759 foreign key (NU_SQNCL_RELATORIO_RECEBIDO, 
IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO)
      references GEC.GECTB731_PSCO_DRA_LQDCO_RPSE 
(NU_SQNCL_RELATORIO_RECEBIDO, IC_GRUPO_EVENTO, NU_SEQUENCIAL_GRUPO)
      on delete restrict;

alter table GEC.GECTB762_ACAO_AUDITADA
   add constraint GEC1F762 foreign key (NU_FUNCIONALIDADE_ADTA)
      references GEC.GECTB648_FUNCIONALIDADE_ADTDA 
(NU_FUNCIONALIDADE_ADTA)
      on delete restrict;

alter table GEC.GECTB763_LOG_TABELA
   add constraint GEC1F763 foreign key (NU_ACAO_AUDITADA)
      references GEC.GECTB762_ACAO_AUDITADA (NU_ACAO_AUDITADA)
      on delete restrict;

alter table GEC.GECTB763_LOG_TABELA
   add constraint GEC2F763 foreign key (NU_TABELA_AUDITADA)
      references GEC.GECTB766_TABELA_AUDITADA (NU_TABELA_AUDITADA)
      on delete restrict;

alter table GEC.GECTB764_CHAVE_PRIMARIA
   add constraint GEC1F764 foreign key (NU_ACAO_AUDITADA, 
NU_TABELA_AUDITADA)
      references GEC.GECTB763_LOG_TABELA (NU_ACAO_AUDITADA, 
NU_TABELA_AUDITADA)
      on delete restrict;

alter table GEC.GECTB765_LOG_CONTEUDO
   add constraint GEC1F765 foreign key (NU_ACAO_AUDITADA, 
NU_TABELA_AUDITADA)
      references GEC.GECTB763_LOG_TABELA (NU_ACAO_AUDITADA, 
NU_TABELA_AUDITADA)
      on delete restrict;

alter table GEC.GECTB767_FNCNE_TABELA_ADTDA
   add constraint GEC1F767 foreign key (NU_FUNCIONALIDADE_ADTA)
      references GEC.GECTB648_FUNCIONALIDADE_ADTDA 
(NU_FUNCIONALIDADE_ADTA)
      on delete restrict;

alter table GEC.GECTB767_FNCNE_TABELA_ADTDA
   add constraint GEC2F767 foreign key (NU_TABELA_AUDITADA)
      references GEC.GECTB766_TABELA_AUDITADA (NU_TABELA_AUDITADA)
      on delete restrict;

alter table GECTB768_PARAMETRO_RELATORIO
   add constraint GEC1F768 foreign key (NU_GRAU_SIGILO)
      references GECTB769_GRAU_SIGILO (NU_GRAU_SIGILO)
      on delete restrict;

alter table GEC.GECTB770_ARQUIVO_CONTABIL
   add constraint GEC1F770 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB770_ARQUIVO_CONTABIL
   add constraint GEC2F770 foreign key (NU_CONTROLE_EXECUCAO_ROTINA, 
CO_ROTINA_PROCESSAMENTO)
      references GEC.GECTB779_CTRLE_EXECUCAO_ROTINA 
(NU_CONTROLE_EXECUCAO_ROTINA, CO_ROTINA_PROCESSAMENTO)
      on delete restrict;

alter table GEC.GECTB770_ARQUIVO_CONTABIL
   add constraint GEC3F770 foreign key (NU_PRODUTO)
      references GEC.GECTB784_PRODUTO_CREDITO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB771_REGISTRO_ARQVO_CNTBL
   add constraint GEC1F771 foreign key (NU_ARQUIVO_CONTABIL)
      references GEC.GECTB770_ARQUIVO_CONTABIL (NU_ARQUIVO_CONTABIL)
      on delete restrict;

alter table GEC.GECTB771_REGISTRO_ARQVO_CNTBL
   add constraint GEC2F771 foreign key (NU_CREDITO)
      references GEC.GECTB517_CREDITO_CESSAO (NU_CREDITO)
      on delete restrict;

alter table GEC.GECTB774_ROTEIRO_CONTABIL
   add constraint GEC1F774 foreign key (NU_PRODUTO)
      references ICO.ICOTBO10_PRODUTO (NU_PRODUTO)
      on delete restrict;

alter table GEC.GECTB775_LANCAMENTO_CONTABIL_MENSAL
   add constraint GEC1F775 foreign key (NU_ROTEIRO_CONTABIL)
      references GEC.GECTB774_ROTEIRO_CONTABIL (NU_ROTEIRO_CONTABIL)
      on delete restrict;

alter table GEC.GECTB775_LANCAMENTO_CONTABIL_MENSAL
   add constraint GEC2F775 foreign key (NU_IF)
      references GEC.GECTB500_IF (NU_IF)
      on delete restrict;

alter table GEC.GECTB776_ROTEIRO_CONTABIL_LEIAUTE
   add constraint GEC1F776 foreign key (NU_ROTEIRO_CONTABIL)
      references GEC.GECTB774_ROTEIRO_CONTABIL (NU_ROTEIRO_CONTABIL)
      on delete restrict;

alter table GEC.GECTB776_ROTEIRO_CONTABIL_LEIAUTE
   add constraint GEC2F776 foreign key (CO_TIPO_ARQUIVO, NU_CAMPO)
      references GEC.GECTB516_LEIAUTE_ARQVO_EXTERNO (CO_TIPO_ARQUIVO, 
NU_CAMPO)
      on delete restrict;

alter table GEC.GECTB777_ERRO_REGISTRO_CNTBL
   add constraint GEC1F777 foreign key (NU_ARQUIVO_CONTABIL, 
NU_REGISTRO_ARQVO_CNTBL)
      references GEC.GECTB771_REGISTRO_ARQVO_CNTBL (NU_ARQUIVO_CONTABIL,
 NU_REGISTRO_ARQVO_CNTBL)
      on delete restrict;

alter table GEC.GECTB777_ERRO_REGISTRO_CNTBL
   add constraint GEC2F777 foreign key (NU_CRITICA)
      references GEC.GECTB772_CRITICA_ARQVO_RCBDO (NU_CRITICA)
      on delete restrict;

alter table GEC.GECTB778_ERRO_ROTINA
   add constraint GEC1F778 foreign key (NU_CONTROLE_EXECUCAO_ROTINA, 
CO_ROTINA_PROCESSAMENTO)
      references GEC.GECTB779_CTRLE_EXECUCAO_ROTINA 
(NU_CONTROLE_EXECUCAO_ROTINA, CO_ROTINA_PROCESSAMENTO)
      on delete restrict;

alter table GEC.GECTB778_ERRO_ROTINA
   add constraint GEC2F778 foreign key (NU_CRITICA)
      references GEC.GECTB772_CRITICA_ARQVO_RCBDO (NU_CRITICA)
      on delete restrict;

alter table GEC.GECTB779_CTRLE_EXECUCAO_ROTINA
   add constraint GEC1F779 foreign key (CO_ROTINA_PROCESSAMENTO)
      references GEC.GECTB773_ROTINA_PROCESSAMENTO_SISTEMA 
(CO_ROTINA_PROCESSAMENTO)
      on delete restrict;

alter table GEC.GECTB780_ARQUIVO_CONSOLIDACAO_CNTBL
   add constraint GEC1F780 foreign key (NU_CONTROLE_EXECUCAO_ROTINA, 
CO_ROTINA_PROCESSAMENTO)
      references GEC.GECTB779_CTRLE_EXECUCAO_ROTINA 
(NU_CONTROLE_EXECUCAO_ROTINA, CO_ROTINA_PROCESSAMENTO)
      on delete restrict;

alter table GEC.GECTB781_CRITICA_APLICADO_ARQUIVO
   add constraint GEC1F781 foreign key (CO_TIPO_ARQUIVO, NU_CAMPO)
      references GEC.GECTB516_LEIAUTE_ARQVO_EXTERNO (CO_TIPO_ARQUIVO, 
NU_CAMPO)
      on delete restrict;

alter table GEC.GECTB781_CRITICA_APLICADO_ARQUIVO
   add constraint GEC2F781 foreign key (NU_CRITICA)
      references GEC.GECTB772_CRITICA_ARQVO_RCBDO (NU_CRITICA)
      on delete restrict;

alter table GEC.GECTB782_ERRO_DETALHE_ARQUIVO
   add constraint GEC1F782 foreign key (NU_SQNCL_ARQUIVO_IMPORTADO, 
NU_LINHA_ARQUIVO)
      references GEC.GECTB638_DTLHE_ARQVO_IMPORTADO 
(NU_SQNCL_ARQUIVO_IMPORTADO, NU_LINHA_ARQUIVO)
      on delete restrict;

alter table GEC.GECTB782_ERRO_DETALHE_ARQUIVO
   add constraint GEC2F782 foreign key (NU_CRITICA)
      references GEC.GECTB772_CRITICA_ARQVO_RCBDO (NU_CRITICA)
      on delete restrict;

create auxiliary table GEC.GECTB789_LOB_1 in GECDB002.GEC1L789 
   stores GEC.GECTB789_ARQUIVO_INTERFACE column IM_CONTEUDO_ARQUIVO part
 1;

