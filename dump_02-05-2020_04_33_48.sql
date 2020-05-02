--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE credit_scoring_v2;




--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md56a55934acf0a33b5632ec819e4ad1557';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.1 (Debian 12.1-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "credit_scoring_v2" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.1 (Debian 12.1-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: credit_scoring_v2; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE credit_scoring_v2 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE credit_scoring_v2 OWNER TO postgres;

\connect credit_scoring_v2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: credit_scoring_v2; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE credit_scoring_v2 SET "TimeZone" TO 'Asia/bangkok';


\connect credit_scoring_v2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ageoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ageoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer NOT NULL,
    criteria_no integer NOT NULL,
    no integer
);


ALTER TABLE public.ageoption OWNER TO postgres;

--
-- Name: ageoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ageoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.ageoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: criteria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.criteria (
    id integer NOT NULL,
    criteria_no integer NOT NULL,
    criteria_title character varying NOT NULL,
    weight integer NOT NULL
);


ALTER TABLE public.criteria OWNER TO postgres;

--
-- Name: criteria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.criteria ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.criteria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: eduoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.eduoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.eduoption OWNER TO postgres;

--
-- Name: eduoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.eduoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.eduoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: forgotpasswordquestionoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forgotpasswordquestionoption (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.forgotpasswordquestionoption OWNER TO postgres;

--
-- Name: forgotpasswordquestionoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.forgotpasswordquestionoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.forgotpasswordquestionoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: frechangenameoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.frechangenameoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.frechangenameoption OWNER TO postgres;

--
-- Name: frechangenameoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.frechangenameoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.frechangenameoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: funcallow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcallow (
    id integer NOT NULL,
    funcno integer NOT NULL,
    title character varying NOT NULL,
    superadminallow boolean DEFAULT true,
    adminallow boolean DEFAULT true,
    employeeallow boolean DEFAULT true,
    loanerallow boolean DEFAULT true
);


ALTER TABLE public.funcallow OWNER TO postgres;

--
-- Name: funcallow_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.funcallow ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.funcallow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: genderstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genderstatus (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.genderstatus OWNER TO postgres;

--
-- Name: geography; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.geography (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.geography OWNER TO postgres;

--
-- Name: haveguarantoroption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.haveguarantoroption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.haveguarantoroption OWNER TO postgres;

--
-- Name: haveguarantoroption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.haveguarantoroption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.haveguarantoroption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iamguarantoroption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iamguarantoroption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.iamguarantoroption OWNER TO postgres;

--
-- Name: iamguarantoroption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iamguarantoroption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iamguarantoroption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: incomeperdebtoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incomeperdebtoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.incomeperdebtoption OWNER TO postgres;

--
-- Name: incomeperdebtoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.incomeperdebtoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.incomeperdebtoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: incometrendoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incometrendoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.incometrendoption OWNER TO postgres;

--
-- Name: incometrendoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.incometrendoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.incometrendoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: joboption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.joboption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.joboption OWNER TO postgres;

--
-- Name: joboption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.joboption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.joboption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: loanobjectoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loanobjectoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.loanobjectoption OWNER TO postgres;

--
-- Name: loanobjectoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.loanobjectoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.loanobjectoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
    id integer NOT NULL,
    subdistrict character varying NOT NULL,
    district character varying NOT NULL,
    zipcode character varying NOT NULL,
    subdistrict_code character varying NOT NULL,
    district_code character varying NOT NULL,
    province_code character varying NOT NULL
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: marriedstatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marriedstatus (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.marriedstatus OWNER TO postgres;

--
-- Name: mortgagesecuritiesperloanoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mortgagesecuritiesperloanoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.mortgagesecuritiesperloanoption OWNER TO postgres;

--
-- Name: mortgagesecuritiesperloanoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.mortgagesecuritiesperloanoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.mortgagesecuritiesperloanoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: paydebthistoryoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paydebthistoryoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.paydebthistoryoption OWNER TO postgres;

--
-- Name: paydebthistoryoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.paydebthistoryoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.paydebthistoryoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: permissionaccess; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissionaccess (
    id integer NOT NULL,
    accessshowloanernewlistadmin boolean NOT NULL,
    accessshowloanernewlistworker boolean NOT NULL,
    accessshowloanerinverifylistadmin boolean NOT NULL,
    accessshowloanerinverifylistworker boolean NOT NULL,
    accessshowloanerwaitapprovelistadmin boolean NOT NULL,
    accessshowloanerwaitapprovelistworker boolean NOT NULL,
    verifyquestionnairebyadmin boolean NOT NULL,
    verifyquestionnairebyworker boolean NOT NULL,
    sendtoapprovebyadmin boolean NOT NULL,
    sendtoapprovebyworker boolean NOT NULL,
    accessshowloanerhadapprovelistadmin boolean,
    accessshowloanerhadapprovelistworker boolean,
    accessshowloanerhaddenylistadmin boolean,
    accessshowloanerhaddenylistworker boolean,
    accessshowloanernotmakelistadmin boolean,
    accessshowloanernotmakelistworker boolean
);


ALTER TABLE public.permissionaccess OWNER TO postgres;

--
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    title_en character varying,
    score integer,
    geographyid integer
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.provinces ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.provinces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: questionnaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionnaire (
    id bigint NOT NULL,
    loanerid bigint NOT NULL,
    updatedby bigint,
    approveby bigint,
    statusid integer NOT NULL,
    sendat timestamp with time zone,
    updatedat timestamp with time zone,
    approverate double precision,
    approvetotal double precision,
    interest double precision,
    verifycomment character varying,
    approvecomment character varying,
    creditgrade character varying,
    creditrisk character varying,
    risklevel character varying,
    matrixindex character varying,
    suggest character varying DEFAULT ''::character varying NOT NULL,
    suggestscore integer,
    suggestgivescore integer,
    income double precision NOT NULL,
    loan double precision NOT NULL,
    debtpermonth double precision NOT NULL,
    totaldebt double precision NOT NULL,
    saving double precision NOT NULL,
    mortgagesecurities double precision NOT NULL,
    age character varying NOT NULL,
    job character varying NOT NULL,
    edu character varying NOT NULL,
    timejob character varying NOT NULL,
    frechangename character varying NOT NULL,
    timeofphonenumber character varying NOT NULL,
    timeofnameinhouseparticular character varying NOT NULL,
    paydebthistory character varying NOT NULL,
    statusinhouseparticular character varying NOT NULL,
    incomeperdebt character varying NOT NULL,
    totaldebtperyearincome character varying NOT NULL,
    savingperloan character varying NOT NULL,
    mortgagesecuritiesperloan character varying NOT NULL,
    haveguarantor character varying NOT NULL,
    iamguarantor character varying NOT NULL,
    incometrend character varying NOT NULL,
    loanobject character varying NOT NULL,
    provincecode character varying NOT NULL,
    incomew double precision NOT NULL,
    loanw double precision NOT NULL,
    debtpermonthw double precision NOT NULL,
    totaldebtw double precision NOT NULL,
    savingw double precision NOT NULL,
    mortgagesecuritiesw double precision NOT NULL,
    agew character varying NOT NULL,
    jobw character varying NOT NULL,
    eduw character varying NOT NULL,
    timejobw character varying NOT NULL,
    frechangenamew character varying NOT NULL,
    timeofphonenumberw character varying NOT NULL,
    timeofnameinhouseparticularw character varying NOT NULL,
    paydebthistoryw character varying NOT NULL,
    statusinhouseparticularw character varying NOT NULL,
    incomeperdebtw character varying NOT NULL,
    totaldebtperyearincomew character varying NOT NULL,
    savingperloanw character varying NOT NULL,
    mortgagesecuritiesperloanw character varying NOT NULL,
    haveguarantorw character varying NOT NULL,
    iamguarantorw character varying NOT NULL,
    incometrendw character varying NOT NULL,
    loanobjectw character varying NOT NULL,
    provincecodew character varying NOT NULL,
    loanerpayback double precision,
    suggestw character varying DEFAULT ''::character varying,
    changeresultcomment character varying
);


ALTER TABLE public.questionnaire OWNER TO postgres;

--
-- Name: questionnaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.questionnaire ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.questionnaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: questionnairestatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questionnairestatus (
    id integer NOT NULL,
    title character varying
);


ALTER TABLE public.questionnairestatus OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: savingperloanoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.savingperloanoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.savingperloanoption OWNER TO postgres;

--
-- Name: savingperloanoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.savingperloanoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.savingperloanoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: statusinhouseparticularoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statusinhouseparticularoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.statusinhouseparticularoption OWNER TO postgres;

--
-- Name: statusinhouseparticularoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.statusinhouseparticularoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.statusinhouseparticularoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: timejoboption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timejoboption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.timejoboption OWNER TO postgres;

--
-- Name: timejoboption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.timejoboption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.timejoboption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: timeofnameinhouseparticularoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timeofnameinhouseparticularoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.timeofnameinhouseparticularoption OWNER TO postgres;

--
-- Name: timeofnameinhouseparticularoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.timeofnameinhouseparticularoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.timeofnameinhouseparticularoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: timeofphonenumberoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timeofphonenumberoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.timeofphonenumberoption OWNER TO postgres;

--
-- Name: timeofphonenumberoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.timeofphonenumberoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.timeofphonenumberoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: totaldebtperyearincomeoption; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.totaldebtperyearincomeoption (
    id integer NOT NULL,
    code character varying NOT NULL,
    title character varying NOT NULL,
    score integer,
    criteria_no integer NOT NULL
);


ALTER TABLE public.totaldebtperyearincomeoption OWNER TO postgres;

--
-- Name: totaldebtperyearincomeoption_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.totaldebtperyearincomeoption ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.totaldebtperyearincomeoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    roleid integer,
    citizenid character varying,
    email character varying NOT NULL,
    password character varying NOT NULL,
    name character varying NOT NULL,
    surname character varying NOT NULL,
    genderid integer,
    marriedid integer,
    religion character varying,
    birthday character varying NOT NULL,
    phone character varying NOT NULL,
    child integer,
    facebook character varying,
    ig character varying,
    line character varying,
    address1_home character varying,
    address2_home character varying,
    subdistrict_home character varying,
    district_home character varying,
    provincecode_home character varying,
    zipcode_home character varying,
    office_name character varying,
    address1_office character varying,
    address2_office character varying,
    subdistrict_office character varying,
    district_office character varying,
    provincecode_office character varying,
    zipcode_office character varying,
    forgotpasswordquestionid integer,
    forgotpasswordans character varying NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: ageoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ageoption (id, code, title, score, criteria_no, no) FROM stdin;
3	3	20-30 ปี	3	1	2
5	5	31-40 ปี	5	1	3
4	4	41-50 ปี	4	1	4
2	2	51-60 ปี	2	1	5
1	1	มากกว่า 60 ปี	1	1	6
6	0	--กรุณาระบุช่วงอายุของท่าน--	0	1	0
7	6	น้อยกว่า 20 ปี	1	1	1
\.


--
-- Data for Name: criteria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.criteria (id, criteria_no, criteria_title, weight) FROM stdin;
1	1	Character	3
2	2	Capacity	3
3	3	Capital	2
4	4	Collateral	1
5	5	Condition	1
\.


--
-- Data for Name: eduoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.eduoption (id, code, title, score, criteria_no) FROM stdin;
1	0	--กรุณาระบุระดับการศึกษาของท่าน--	1	1
2	1	สำเร็จการศึกษาระดับต่ำกว่า ม.6 หรือ ปวช.	1	1
3	2	สำเร็จการศึกษาระดับ ม.6 หรือ ปวช.	1	1
4	3	สำเร็จการศึกษาระดับ ปวส. / ปวท./อนุปริญญา	1	1
5	4	สำเร็จการศึกษาระดับปริญญาตรี	1	1
6	5	ระดับการศึกษาสูงกว่าปริญญาตรี	1	1
\.


--
-- Data for Name: forgotpasswordquestionoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forgotpasswordquestionoption (id, title) FROM stdin;
1	อาหารที่คุณชอบคือ?
2	ชื่อสัตว์เลี้ยงที่คุณชื่นชอบ?
3	สถานที่คุณชื่นชอบ?
\.


--
-- Data for Name: frechangenameoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.frechangenameoption (id, code, title, score, criteria_no) FROM stdin;
1	0	--กรุณาระบุจำนวนครั้งที่ท่านเคยเปลี่ยนชื่อ--	1	1
2	1	มากกว่า 3 ครั้ง	1	1
3	2	3 ครั้ง	2	1
4	3	2 ครั้ง	3	1
6	5	ไม่เคยเลย	5	1
5	4	1 ครั้ง	4	1
\.


--
-- Data for Name: funcallow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.funcallow (id, funcno, title, superadminallow, adminallow, employeeallow, loanerallow) FROM stdin;
\.


--
-- Data for Name: genderstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genderstatus (id, title) FROM stdin;
1	ชาย
2	หญิง
3	ไม่ประสงค์ระบุ
\.


--
-- Data for Name: geography; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.geography (id, title) FROM stdin;
1	ภาคเหนือ
2	ภาคกลาง
3	ภาคตะวันออก
4	ภาคออกเฉียงเหนือ
5	ภาคตะวันตก
6	ภาคใต้
\.


--
-- Data for Name: haveguarantoroption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.haveguarantoroption (id, code, title, score, criteria_no) FROM stdin;
1	0	--ท่านมีบุคคลหรือสถาบันการเงินค้ำประกันหรือไม่--	1	4
2	1	ไม่มีบุคคลหรือสถาบันการเงินค้ำประกัน	1	4
3	5	มีบุคคลที่น่าเชื่อถือค้ำประกัน	5	4
\.


--
-- Data for Name: iamguarantoroption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.iamguarantoroption (id, code, title, score, criteria_no) FROM stdin;
1	0	--กรุณาระบุข้อมูลการค้ำประกันให้ผู้อื่นของท่าน--	1	4
2	3	ท่านมีการค้ำประกันให้บุคคลอื่น	3	4
3	5	ท่านไม่มีการค้ำประกันให้บุคคลอื่น	5	4
\.


--
-- Data for Name: incomeperdebtoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incomeperdebtoption (id, code, title, score, criteria_no) FROM stdin;
1	1	รายได้สุทธิต่อเดือน < หรือ = จำนวนเงินผ่อนชำระต่อเดือน	1	2
2	2	รายได้สุทธิต่อเดือน > จำนวนเงินผ่อนชำระ = 1-20%	2	2
3	3	รายได้สุทธิต่อเดือน>จำนวนเงินผ่อนชำระ อยู่ในช่วง 21 -50%	3	2
4	4	รายได้สุทธิต่อเดือน>จำนวนเงินผ่อนชำระ อยู่ในช่วง 51-80%	4	2
5	5	รายได้ประจำสุทธิต่อเดือน>จำนวนเงินผ่อนชำระ = มากกว่า 80%ขึ้นไป	5	2
\.


--
-- Data for Name: incometrendoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incometrendoption (id, code, title, score, criteria_no) FROM stdin;
1	0	--กรุณาประเมินแนวโน้มเศรษฐกิจที่มีผลต่อรายได้ของท่าน--	1	5
2	1	รายได้ลดลง มากกว่า 9% ต่อปี	1	5
3	2	รายได้ลดลง 1-9% ต่อปี	2	5
4	3	รายได้คงเดิม	3	5
5	4	รายได้เพิ่มขึ้น 1-9% ต่อปี	4	5
6	5	รายได้เพิ่มขึ้น มากกว่า 9% ต่อปี	5	5
\.


--
-- Data for Name: joboption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.joboption (id, code, title, score, criteria_no) FROM stdin;
1	0	--กรุณาระบุอาชีพของท่าน--	1	1
2	1	ว่างงาน	1	1
3	2	นักเรียน/นิสิต/นักศึกษา	1	1
4	3	มีรายได้ไม่แน่นอน	2	1
5	4	ลูกจ้างชั่วคราว/ลูกจ้างรายวัน	2	1
6	5	ผู้ใช้แรงงาน/ทำงานพาร์ทไทม์	2	1
7	6	อาชีพอิสระ/แรงงานฝีมือ	3	1
8	7	เกษตรกร	3	1
9	8	พ่อค้าแม่ค้า	3	1
10	9	ข้าราชการครู	2	1
11	10	อาจารย์มหาวิทยาลัย	3	1
12	11	ข้าราชการพยาบาล	2	1
13	12	ตำรวจหรือทหารชั้นประทวน	1	1
14	13	ข้าราชการ/พนักงานราชการ	4	1
15	14	พนักงานประจำ/พนักงานเอกชน	4	1
16	15	แพทย์/สัตวแพทย์/ทันตแพทย์/เภสัชกร	5	1
17	16	ผู้พิพากษา/อัยการ	5	1
18	17	นักบินพาณิชย์	5	1
19	18	เจ้าของธุรกิจรายได้ต่ำกว่า 1 ล้านบาทต่อปี	3	1
20	19	เจ้าของธุรกิจมีรายได้ 1-10 ล้านบาทต่อปี	4	1
21	20	เจ้าของธุรกิจมีรายได้มากกว่า 10 ล้านบาทต่อปี	5	1
\.


--
-- Data for Name: loanobjectoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loanobjectoption (id, code, title, score, criteria_no) FROM stdin;
1	0	--กรุณาระบุวัตถุประสงค์ในการกู้ยืมของท่าน--	1	5
2	1	เพื่อการชำระหนี้เงินกู้ที่อื่น/เพื่อการพนัน/กู้ให้ผู้อื่น	1	5
3	2	ซื้อสิ่งของฟุ่มเฟือยหรือเครื่องประดับ/เพื่อการท่องเที่ยว/เพื่อการศึกษา/ลงทุนในForex,Option,หุ้น,เงินดิจิตอล	2	5
4	3	เพื่ออุปโภคหรือการบริโภค/ลงทุนใดๆ เพื่อการสร้างอาชีพใหม่	3	5
5	4	เพื่อเสริมสภาพคล่องในการดำเนินธุรกิจหรือกิจการส่วนตัว	4	5
6	5	เพื่อขยายกิจการหรือธุรกิจ/เพื่อลงทุนในการเพิ่มศักยภาพการแข่งขันในเชิงธุรกิจ	5	5
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.location (id, subdistrict, district, zipcode, subdistrict_code, district_code, province_code) FROM stdin;
1	คลองท่อมเหนือ	คลองท่อม	81120	810402	8104	81
2	คลองท่อมใต้	คลองท่อม	81120	810401	8104	81
3	คลองพน	คลองท่อม	81170	810403	8104	81
4	ทรายขาว	คลองท่อม	81170	810404	8104	81
5	พรุดินนา	คลองท่อม	81120	810406	8104	81
6	ห้วยน้ำขาว	คลองท่อม	81120	810405	8104	81
7	เพหลา	คลองท่อม	81120	810407	8104	81
8	คีรีวง	ปลายพระยา	81160	810604	8106	81
9	ปลายพระยา	ปลายพระยา	81160	810599	8106	81
10	เขาต่อ	ปลายพระยา	81160	810598	8106	81
11	เขาเขน	ปลายพระยา	81160	810597	8106	81
12	ดินอุดม	ลำทับ	81190	810702	8107	81
13	ดินแดง	ลำทับ	81190	810704	8107	81
14	ทุ่งไทรทอง	ลำทับ	81190	810703	8107	81
15	ลำทับ	ลำทับ	81190	810499	8107	81
16	คลองยา	อ่าวลึก	81110	810508	8105	81
17	คลองหิน	อ่าวลึก	81110	810504	8105	81
18	นาเหนือ	อ่าวลึก	81110	810503	8105	81
19	บ้านกลาง	อ่าวลึก	81110	810509	8105	81
20	อ่าวลึกน้อย	อ่าวลึก	81110	810505	8105	81
21	อ่าวลึกเหนือ	อ่าวลึก	81110	810506	8105	81
22	อ่าวลึกใต้	อ่าวลึก	81110	810501	8105	81
23	เขาใหญ่	อ่าวลึก	81110	810507	8105	81
24	แหลมสัก	อ่าวลึก	81110	810502	8105	81
25	คลองยาง	เกาะลันตา	81120	810304	8103	81
26	ศาลาด่าน	เกาะลันตา	81150	810305	8103	81
27	เกาะกลาง	เกาะลันตา	81120	810303	8103	81
28	เกาะลันตาน้อย	เกาะลันตา	81150	810302	8103	81
29	เกาะลันตาใหญ่	เกาะลันตา	81150	810301	8103	81
30	พรุเตียว	เขาพนม	81140	810204	8102	81
31	สินปุน	เขาพนม	80240	810203	8102	81
32	หน้าเขา	เขาพนม	81140	810205	8102	81
33	เขาดิน	เขาพนม	81140	810202	8102	81
34	เขาพนม	เขาพนม	81140	810201	8102	81
35	โคกหาร	เขาพนม	80240	810206	8102	81
36	กระบี่น้อย	เมืองกระบี่	81000	810103	8101	81
37	กระบี่ใหญ่	เมืองกระบี่	81000	810102	8101	81
38	คลองประสงค์	เมืองกระบี่	81000	810118	8101	81
39	ทับปริก	เมืองกระบี่	81000	810111	8101	81
40	ปากน้ำ	เมืองกระบี่	81000	810101	8101	81
41	หนองทะเล	เมืองกระบี่	81180	810117	8101	81
42	อ่าวนาง	เมืองกระบี่	81000	810116	8101	81
43	เขาคราม	เมืองกระบี่	81000	810105	8101	81
44	เขาทอง	เมืองกระบี่	81000	810106	8101	81
45	ไสไทย	เมืองกระบี่	81000	810115	8101	81
46	คลองขนาน	เหนือคลอง	81130	810107	8108	81
47	คลองเขม้า	เหนือคลอง	81130	810108	8108	81
48	ตลิ่งชัน	เหนือคลอง	81130	810110	8108	81
49	ปกาสัย	เหนือคลอง	81130	810112	8108	81
50	ห้วยยูง	เหนือคลอง	81130	810113	8108	81
51	เกาะศรีบอยา	เหนือคลอง	81130	810104	8108	81
52	เหนือคลอง	เหนือคลอง	81130	810114	8108	81
53	โคกยาง	เหนือคลอง	81130	810109	8108	81
54	คลองต้นไทร	คลองสาน	10600	101804	1018	10
55	คลองสาน	คลองสาน	10600	101599	1018	10
56	บางลำภูล่าง	คลองสาน	10600	101803	1018	10
57	สมเด็จเจ้าพระยา	คลองสาน	10600	101801	1018	10
58	ทรายกองดิน	คลองสามวา	10510	101004	1046	10
59	ทรายกองดินใต้	คลองสามวา	10510	101005	1046	10
60	บางชัน	คลองสามวา	10510	101003	1046	10
61	สามวาตะวันตก	คลองสามวา	10510	101007	1046	10
62	สามวาตะวันออก	คลองสามวา	10510	101006	1046	10
63	คลองตัน	คลองเตย	10110	100902	1033	10
64	คลองเตย	คลองเตย	10110	100901	1033	10
65	พระโขนง	คลองเตย	10110	100903	1033	10
66	พระโขนง	คลองเตย	10260	100903	1033	10
67	คันนายาว	คันนายาว	10230	100606	1043	10
68	รามอินทรา	คันนายาว	10230	false	1043	10
69	จตุจักร	จตุจักร	10900	103005	1030	10
70	จอมพล	จตุจักร	10900	103004	1030	10
71	จันทรเกษม	จตุจักร	10900	103003	1030	10
72	ลาดยาว	จตุจักร	10900	100501	1030	10
73	เสนานิคม	จตุจักร	10900	103002	1030	10
74	จอมทอง	จอมทอง	10150	102102	1035	10
75	บางขุนเทียน	จอมทอง	10150	102103	1035	10
76	บางค้อ	จอมทอง	10150	102101	1035	10
77	บางมด	จอมทอง	10150	102106	1035	10
78	ดอนเมือง	ดอนเมือง	10210	false	1036	10
79	สนามบิน	ดอนเมือง	10210	false	1036	10
80	สีกัน	ดอนเมือง	10210	100505	1036	10
81	ดินแดง	ดินแดง	10400	101703	1026	10
82	ดุสิต	ดุสิต	10300	100201	1002	10
83	ถนนนครไชยศรี	ดุสิต	10300	100206	1002	10
84	วชิรพยาบาล	ดุสิต	10300	100202	1002	10
85	สวนจิตรลดา	ดุสิต	10300	100203	1002	10
86	สวนจิตรลดา	ดุสิต	10303	100203	1002	10
87	สี่แยกมหานาค	ดุสิต	10300	100204	1002	10
88	คลองชักพระ	ตลิ่งชัน	10170	101901	1019	10
89	ฉิมพลี	ตลิ่งชัน	10170	101903	1019	10
90	ตลิ่งชัน	ตลิ่งชัน	10170	101902	1019	10
91	บางพรม	ตลิ่งชัน	10170	101904	1019	10
92	บางระมาด	ตลิ่งชัน	10170	101905	1019	10
93	บางเชือกหนัง	ตลิ่งชัน	10170	101907	1019	10
94	ทวีวัฒนา	ทวีวัฒนา	10170	101906	1048	10
95	ศาลาธรรมสพน์	ทวีวัฒนา	10170	101908	1048	10
96	ทุ่งครุ	ทุ่งครุ	10140	102404	1049	10
97	บางมด	ทุ่งครุ	10140	102106	1049	10
98	ดาวคะนอง	ธนบุรี	10600	101506	1015	10
99	ตลาดพลู	ธนบุรี	10600	101505	1015	10
100	บางยี่เรือ	ธนบุรี	10600	101503	1015	10
101	บุคคโล	ธนบุรี	10600	101504	1015	10
102	วัดกัลยาณ์	ธนบุรี	10600	101501	1015	10
103	สำเหร่	ธนบุรี	10600	101507	1015	10
104	หิรัญรูจี	ธนบุรี	10600	101502	1015	10
105	บางขุนนนท์	บางกอกน้อย	10700	102006	1020	10
106	บางขุนศรี	บางกอกน้อย	10700	102007	1020	10
107	บ้านช่างหล่อ	บางกอกน้อย	10700	102005	1020	10
108	ศิริราช	บางกอกน้อย	10700	102004	1020	10
109	อรุณอัมรินทร์	บางกอกน้อย	10700	false	1020	10
110	วัดท่าพระ	บางกอกใหญ่	10600	101602	1016	10
111	วัดอรุณ	บางกอกใหญ่	10600	101601	1016	10
112	คลองจั่น	บางกะปิ	10240	100601	1006	10
113	หัวหมาก	บางกะปิ	10240	100608	1006	10
114	หัวหมาก	บางกะปิ	10250	100608	1006	10
115	ท่าข้าม	บางขุนเทียน	10150	102105	1021	10
116	แสมดำ	บางขุนเทียน	10150	102107	1021	10
117	บางคอแหลม	บางคอแหลม	10120	101207	1031	10
118	บางโคล่	บางคอแหลม	10120	101206	1031	10
119	วัดพระยาไกร	บางคอแหลม	10120	101205	1031	10
120	บางซื่อ	บางซื่อ	10800	100205	1029	10
121	วงศ์สว่าง	บางซื่อ	10800	false	1029	10
122	บางนา	บางนา	10260	100904	1047	10
123	บางบอน	บางบอน	10150	102104	1050	10
124	บางบำหรุ	บางพลัด	10700	102002	1025	10
125	บางพลัด	บางพลัด	10700	102001	1025	10
126	บางยี่ขัน	บางพลัด	10700	102008	1025	10
127	บางอ้อ	บางพลัด	10700	102003	1025	10
128	บางรัก	บางรัก	10500	100404	1004	10
129	มหาพฤฒาราม	บางรัก	10500	100401	1004	10
130	สีลม	บางรัก	10500	100402	1004	10
131	สี่พระยา	บางรัก	10500	100405	1004	10
132	สุริยวงศ์	บางรัก	10500	100403	1004	10
133	ท่าแร้ง	บางเขน	10220	100508	1005	10
134	ท่าแร้ง	บางเขน	10230	100508	1005	10
135	อนุสาวรีย์	บางเขน	10220	100502	1005	10
136	บางแค	บางแค	10160	102203	1040	10
137	บางแคเหนือ	บางแค	10160	102204	1040	10
138	บางไผ่	บางแค	10160	102205	1040	10
139	หลักสอง	บางแค	10160	102301	1040	10
140	คลองกุ่ม	บึงกุ่ม	10230	100604	1027	10
141	คลองกุ่ม	บึงกุ่ม	10240	100604	1027	10
142	นวมินทร์	บึงกุ่ม	10230	false	1027	10
143	นวลจันทร์	บึงกุ่ม	10230	false	1027	10
144	ปทุมวัน	ปทุมวัน	10330	100703	1007	10
145	รองเมือง	ปทุมวัน	10330	100701	1007	10
146	ลุมพินี	ปทุมวัน	10330	100704	1007	10
147	วังใหม่	ปทุมวัน	10330	100702	1007	10
148	วังใหม่	ปทุมวัน	10110	100702	1007	10
149	วังใหม่	ปทุมวัน	10120	100702	1007	10
150	วังใหม่	ปทุมวัน	10400	100702	1007	10
151	วังใหม่	ปทุมวัน	10500	100702	1007	10
152	ดอกไม้	ประเวศ	10250	100909	1032	10
153	ประเวศ	ประเวศ	10250	100908	1032	10
154	หนองบอน	ประเวศ	10250	100907	1032	10
155	คลองมหานาค	ป้อมปราบศัตรูพ่าย	10100	100803	1008	10
156	บ้านบาตร	ป้อมปราบศัตรูพ่าย	10100	100804	1008	10
157	ป้อมปราบ	ป้อมปราบศัตรูพ่าย	10100	100801	1008	10
158	วัดเทพศิรินทร์	ป้อมปราบศัตรูพ่าย	10100	100802	1008	10
159	วัดโสมนัส	ป้อมปราบศัตรูพ่าย	10100	100805	1008	10
160	สามเสนใน	พญาไท	10400	100299	1014	10
161	ชนะสงคราม	พระนคร	10200	100109	1001	10
162	ตลาดยอด	พระนคร	10200	100108	1001	10
163	บวรนิเวศ	พระนคร	10200	100107	1001	10
164	บางขุนพรหม	พระนคร	10200	100111	1001	10
165	บ้านพานถม	พระนคร	10200	100110	1001	10
166	พระบรมมหาราชวัง	พระนคร	10200	100101	1001	10
167	วังบูรพาภิรมย์	พระนคร	10200	100102	1001	10
168	วัดราชบพิธ	พระนคร	10200	100103	1001	10
169	วัดสามพระยา	พระนคร	10200	100112	1001	10
170	ศาลเจ้าพ่อเสือ	พระนคร	10200	100105	1001	10
171	สำราญราษฎร์	พระนคร	10200	100104	1001	10
172	เสาชิงช้า	พระนคร	10200	100106	1001	10
173	บางจาก	พระโขนง	10260	100905	1009	10
174	คลองขวาง	ภาษีเจริญ	10160	102208	1022	10
175	คูหาสวรรค์	ภาษีเจริญ	10160	102210	1022	10
176	บางจาก	ภาษีเจริญ	10160	100905	1022	10
177	บางด้วน	ภาษีเจริญ	10160	102202	1022	10
178	บางหว้า	ภาษีเจริญ	10160	102201	1022	10
179	บางแวก	ภาษีเจริญ	10160	102207	1022	10
180	ปากคลองภาษีเจริญ	ภาษีเจริญ	10160	102209	1022	10
181	มีนบุรี	มีนบุรี	10510	101001	1010	10
182	แสนแสบ	มีนบุรี	10510	101002	1010	10
183	ช่องนนทรี	ยานนาวา	10120	101203	1012	10
184	บางโพงพาง	ยานนาวา	10120	101204	1012	10
185	ถนนพญาไท	ราชเทวี	10400	101405	1037	10
186	ถนนเพชรบุรี	ราชเทวี	10400	101402	1037	10
187	ทุ่งพญาไท	ราชเทวี	10400	101403	1037	10
188	มักกะสัน	ราชเทวี	10400	101404	1037	10
189	บางปะกอก	ราษฎร์บูรณะ	10140	102402	1024	10
190	ราษฎร์บูรณะ	ราษฎร์บูรณะ	10140	102401	1024	10
191	ขุมทอง	ลาดกระบัง	10520	101106	1011	10
192	คลองสองต้นนุ่น	ลาดกระบัง	10520	101102	1011	10
193	คลองสามประเวศ	ลาดกระบัง	10520	101103	1011	10
194	ทับยาว	ลาดกระบัง	10520	101105	1011	10
195	ลาดกระบัง	ลาดกระบัง	10520	101101	1011	10
196	ลำปลาทิว	ลาดกระบัง	10520	101104	1011	10
197	จรเข้บัว	ลาดพร้าว	10230	100607	1038	10
198	ลาดพร้าว	ลาดพร้าว	10230	100603	1038	10
199	คลองเจ้าคุณสิงห์	วังทองหลาง	10310	false	1045	10
200	พลับพลา	วังทองหลาง	10310	false	1045	10
201	วังทองหลาง	วังทองหลาง	10310	100602	1045	10
202	สะพานสอง	วังทองหลาง	10310	false	1045	10
203	คลองตันเหนือ	วัฒนา	10110	103305	1039	10
204	คลองเตยเหนือ	วัฒนา	10110	103304	1039	10
205	พระโขนงเหนือ	วัฒนา	10110	103306	1039	10
206	พระโขนงเหนือ	วัฒนา	10260	103306	1039	10
207	สวนหลวง	สวนหลวง	10250	100906	1034	10
208	อ่อนนุช	สวนหลวง	10250	103400	1034	10
209	สะพานสูง	สะพานสูง	10240	100605	1044	10
210	สะพานสูง	สะพานสูง	10250	100605	1044	10
211	ราษฎร์พัฒนา	สะพานสูง	10240	104402	1044	10
212	ทับช้าง	สะพานสูง	10250	104403	1044	10
213	จักรวรรดิ์	สัมพันธวงศ์	10100	false	1013	10
214	ตลาดน้อย	สัมพันธวงศ์	10100	101303	1013	10
215	สัมพันธวงศ์	สัมพันธวงศ์	10100	101302	1013	10
216	ทุ่งมหาเมฆ	สาทร	10120	101208	1028	10
217	ทุ่งวัดดอน	สาทร	10120	101201	1028	10
218	ยานนาวา	สาทร	10120	101202	1028	10
219	คลองถนน	สายไหม	10220	100503	1042	10
220	สายไหม	สายไหม	10220	100506	1042	10
221	ออเงิน	สายไหม	10220	100509	1042	10
222	กระทุ่มราย	หนองจอก	10530	100301	1003	10
223	คลองสิบ	หนองจอก	10530	100303	1003	10
224	คลองสิบสอง	หนองจอก	10530	100304	1003	10
225	คู้ฝั่งเหนือ	หนองจอก	10530	100306	1003	10
226	ลำต้อยติ่ง	หนองจอก	10530	100308	1003	10
227	ลำผักชี	หนองจอก	10530	100307	1003	10
228	หนองจอก	หนองจอก	10530	100302	1003	10
229	โคกแฝด	หนองจอก	10530	100305	1003	10
230	หนองค้างพลู	หนองแขม	10160	102303	1023	10
231	หนองแขม	หนองแขม	10160	102302	1023	10
232	ตลาดบางเขน	หลักสี่	10210	100504	1041	10
233	ทุ่งสองห้อง	หลักสี่	10210	100507	1041	10
234	บางกะปิ	ห้วยขวาง	10310	101702	1017	10
235	สามเสนนอก	ห้วยขวาง	10310	101704	1017	10
236	ห้วยขวาง	ห้วยขวาง	10310	101701	1017	10
237	กลอนโด	ด่านมะขามเตี้ย	71260	710115	7111	71
238	จรเข้เผือก	ด่านมะขามเตี้ย	71260	710114	7111	71
239	ด่านมะขามเตี้ย	ด่านมะขามเตี้ย	71260	710112	7111	71
240	หนองไผ่	ด่านมะขามเตี้ย	71260	711104	7111	71
241	ชะแล	ทองผาภูมิ	71180	710705	7107	71
242	ท่าขนุน	ทองผาภูมิ	71180	710701	7107	71
243	ปิล๊อก	ทองผาภูมิ	71180	710702	7107	71
244	ลิ่นถิ่น	ทองผาภูมิ	71180	710704	7107	71
245	สหกรณ์นิคม	ทองผาภูมิ	71180	710707	7107	71
246	หินดาด	ทองผาภูมิ	71180	710703	7107	71
247	ห้วยเขย่ง	ทองผาภูมิ	71180	710706	7107	71
248	ดอนขมิ้น	ท่ามะกา	71120	710509	7105	71
249	ดอนชะเอม	ท่ามะกา	71130	710503	7105	71
250	ตะคร้ำเอน	ท่ามะกา	71130	710505	7105	71
251	ท่ามะกา	ท่ามะกา	71120	710506	7105	71
252	ท่าเรือ	ท่ามะกา	71130	710507	7105	71
253	ท่าเสา	ท่ามะกา	71120	710202	7105	71
254	ท่าไม้	ท่ามะกา	71120	710504	7105	71
255	พงตึก	ท่ามะกา	71120	710501	7105	71
256	พระแท่น	ท่ามะกา	71130	710512	7105	71
257	ยางม่วง	ท่ามะกา	71120	710502	7105	71
258	สนามแย้	ท่ามะกา	70190	710515	7105	71
259	หนองลาน	ท่ามะกา	71130	710517	7105	71
260	หวายเหนียว	ท่ามะกา	71120	710513	7105	71
261	อุโลกสี่หมื่น	ท่ามะกา	71130	710510	7105	71
262	เขาสามสิบหาบ	ท่ามะกา	71120	710511	7105	71
263	แสนตอ	ท่ามะกา	71130	710514	7105	71
264	โคกตะบอง	ท่ามะกา	71120	710508	7105	71
265	ทุ่งทอง	ท่าม่วง	71110	710606	7106	71
266	ท่าตะคร้อ	ท่าม่วง	71130	710611	7106	71
267	ท่าม่วง	ท่าม่วง	71110	710601	7106	71
268	ท่าล้อ	ท่าม่วง	71000	710604	7106	71
269	บ้านใหม่	ท่าม่วง	71110	710609	7106	71
270	พังตรุ	ท่าม่วง	71110	710610	7106	71
271	ม่วงชุม	ท่าม่วง	71110	710608	7106	71
272	รางสาลี่	ท่าม่วง	71110	710612	7106	71
273	วังขนาย	ท่าม่วง	71110	710602	7106	71
274	วังศาลา	ท่าม่วง	71110	710603	7106	71
275	หนองขาว	ท่าม่วง	71110	710605	7106	71
276	หนองตากยา	ท่าม่วง	71110	710613	7106	71
277	เขาน้อย	ท่าม่วง	71110	710607	7106	71
278	ช่องด่าน	บ่อพลอย	71160	710308	7103	71
279	บ่อพลอย	บ่อพลอย	71160	710301	7103	71
280	หนองกร่าง	บ่อพลอย	71220	710309	7103	71
281	หนองกุ่ม	บ่อพลอย	71160	710302	7103	71
282	หนองรี	บ่อพลอย	71220	710303	7103	71
283	หลุมรัง	บ่อพลอย	71160	710305	7103	71
284	ดอนตาเพชร	พนมทวน	71140	710912	7109	71
285	ดอนเจดีย์	พนมทวน	71140	710904	7109	71
286	ทุ่งสมอ	พนมทวน	71140	710903	7109	71
287	พนมทวน	พนมทวน	71140	710901	7109	71
288	พังตรุ	พนมทวน	71140	710610	7109	71
289	รางหวาย	พนมทวน	71170	710906	7109	71
290	หนองสาหร่าย	พนมทวน	71140	710911	7109	71
291	หนองโรง	พนมทวน	71140	710902	7109	71
292	ด่านแม่แฉลบ	ศรีสวัสดิ์	71250	710402	7104	71
293	ท่ากระดาน	ศรีสวัสดิ์	71250	710404	7104	71
294	นาสวน	ศรีสวัสดิ์	71250	710401	7104	71
295	หนองเป็ด	ศรีสวัสดิ์	71250	710403	7104	71
296	เขาโจด	ศรีสวัสดิ์	71220	710405	7104	71
297	แม่กระบุง	ศรีสวัสดิ์	71250	710406	7104	71
298	ปรังเผล	สังขละบุรี	71240	710802	7108	71
299	หนองลู	สังขละบุรี	71240	710801	7108	71
300	ไล่โว่	สังขละบุรี	71240	710803	7108	71
301	สมเด็จเจริญ	หนองปรือ	71220	710307	7112	71
302	หนองปรือ	หนองปรือ	71220	710304	7112	71
303	หนองปลาไหล	หนองปรือ	71220	710306	7112	71
304	ดอนแสลบ	ห้วยกระเจา	71170	710907	7113	71
305	วังไผ่	ห้วยกระเจา	71170	710910	7113	71
306	สระลงเรือ	ห้วยกระเจา	71170	710909	7113	71
307	ห้วยกระเจา	ห้วยกระเจา	71170	710908	7113	71
308	ช่องสะเดา	เมืองกาญจนบุรี	71190	710109	7101	71
309	ท่ามะขาม	เมืองกาญจนบุรี	71000	710104	7101	71
310	บ้านเก่า	เมืองกาญจนบุรี	71000	710113	7101	71
311	บ้านเหนือ	เมืองกาญจนบุรี	71000	710101	7101	71
312	บ้านใต้	เมืองกาญจนบุรี	71000	710102	7101	71
313	ปากแพรก	เมืองกาญจนบุรี	71000	710103	7101	71
314	ลาดหญ้า	เมืองกาญจนบุรี	71190	710107	7101	71
315	วังด้ง	เมืองกาญจนบุรี	71190	710108	7101	71
316	วังเย็น	เมืองกาญจนบุรี	71000	710116	7101	71
317	หนองบัว	เมืองกาญจนบุรี	71190	710106	7101	71
318	หนองหญ้า	เมืองกาญจนบุรี	71000	710110	7101	71
319	เกาะสำโรง	เมืองกาญจนบุรี	71000	710111	7101	71
320	แก่งเสี้ยน	เมืองกาญจนบุรี	71000	710105	7101	71
321	ทุ่งกระบ่ำ	เลาขวัญ	71210	711006	7110	71
322	หนองนกแก้ว	เลาขวัญ	71210	711005	7110	71
323	หนองประดู่	เลาขวัญ	71210	711003	7110	71
324	หนองปลิง	เลาขวัญ	71210	711004	7110	71
325	หนองฝ้าย	เลาขวัญ	71210	711007	7110	71
326	หนองโสน	เลาขวัญ	71210	711002	7110	71
327	เลาขวัญ	เลาขวัญ	71210	711001	7110	71
328	ท่าเสา	ไทรโยค	71150	710202	7102	71
329	บ้องตี้	ไทรโยค	71150	710207	7102	71
330	ลุ่มสุ่ม	ไทรโยค	71150	710201	7102	71
331	วังกระแจะ	ไทรโยค	71150	710205	7102	71
332	ศรีมงคล	ไทรโยค	71150	710206	7102	71
333	สิงห์	ไทรโยค	71150	710203	7102	71
334	ไทรโยค	ไทรโยค	71150	710204	7102	71
335	กมลาไสย	กมลาไสย	46130	460301	4603	46
336	ดงลิง	กมลาไสย	46130	460304	4603	46
337	ธัญญา	กมลาไสย	46130	460305	4603	46
338	หนองแปน	กมลาไสย	46130	460308	4603	46
339	หลักเมือง	กมลาไสย	46130	460302	4603	46
340	เจ้าท่า	กมลาไสย	46130	460310	4603	46
341	โคกสมบูรณ์	กมลาไสย	46130	460311	4603	46
342	โพนงาม	กมลาไสย	46130	460303	4603	46
343	กุดค้าว	กุฉินารายณ์	46110	460512	4605	46
344	กุดหว้า	กุฉินารายณ์	46110	460506	4605	46
345	จุมจัง	กุฉินารายณ์	46110	460504	4605	46
346	นาขาม	กุฉินารายณ์	46110	460508	4605	46
347	นาโก	กุฉินารายณ์	46110	460510	4605	46
348	บัวขาว	กุฉินารายณ์	46110	460501	4605	46
349	สมสะอาด	กุฉินารายณ์	46110	460511	4605	46
350	สามขา	กุฉินารายณ์	46110	460507	4605	46
351	หนองห้าง	กุฉินารายณ์	46110	460509	4605	46
352	เหล่าใหญ่	กุฉินารายณ์	46110	460503	4605	46
353	เหล่าไฮงาม	กุฉินารายณ์	46110	460505	4605	46
354	แจนแลน	กุฉินารายณ์	46110	460502	4605	46
355	ดินจี่	คำม่วง	46180	461005	4610	46
356	ทุ่งคลอง	คำม่วง	46180	460997	4610	46
357	นาทัน	คำม่วง	46180	461007	4610	46
358	นาบอน	คำม่วง	46180	461006	4610	46
359	เนินยาง	คำม่วง	46180	461009	4610	46
360	โพน	คำม่วง	46180	460999	4610	46
361	ฆ้องชัยพัฒนา	ฆ้องชัย	46130	460313	4618	46
362	ลำชี	ฆ้องชัย	46130	460307	4618	46
363	เหล่ากลาง	ฆ้องชัย	46130	461802	4618	46
364	โคกสะอาด	ฆ้องชัย	46130	460309	4618	46
365	โนนศิลาเลิง	ฆ้องชัย	46130	461804	4618	46
366	ดงพยุง	ดอนจาน	46000	460112	4617	46
367	ดอนจาน	ดอนจาน	46000	460114	4617	46
368	นาจำปา	ดอนจาน	46000	460118	4617	46
369	ม่วงนา	ดอนจาน	46000	460110	4617	46
370	สะอาดไชยศรี	ดอนจาน	46000	460122	4617	46
371	กุงเก่า	ท่าคันโท	46190	461102	4611	46
372	กุดจิก	ท่าคันโท	46190	461104	4611	46
373	ดงสมบูรณ์	ท่าคันโท	46190	461106	4611	46
374	ท่าคันโท	ท่าคันโท	46190	461101	4611	46
375	นาตาล	ท่าคันโท	46190	461105	4611	46
376	ยางอู้ม	ท่าคันโท	46190	461103	4611	46
377	นาคู	นาคู	46160	460605	4616	46
378	บ่อแก้ว	นาคู	46160	460607	4616	46
379	ภูแล่นช้าง	นาคู	46160	460604	4616	46
380	สายนาวัง	นาคู	46160	460609	4616	46
381	โนนนาจาน	นาคู	46160	460610	4616	46
382	นามน	นามน	46230	460198	4602	46
383	ยอดแกง	นามน	46230	460199	4602	46
384	สงเปลือย	นามน	46230	460203	4602	46
385	หนองบัว	นามน	46230	460205	4602	46
386	หลักเหลี่ยม	นามน	46230	460204	4602	46
387	คลองขาม	ยางตลาด	46120	460711	4607	46
388	ดอนสมบูรณ์	ยางตลาด	46120	460709	4607	46
389	นาดี	ยางตลาด	46120	460713	4607	46
390	นาเชือก	ยางตลาด	46120	460710	4607	46
391	บัวบาน	ยางตลาด	46120	460704	4607	46
392	ยางตลาด	ยางตลาด	46120	460701	4607	46
393	หนองตอกแป้น	ยางตลาด	46120	460715	4607	46
394	หนองอิเฒ่า	ยางตลาด	46120	460708	4607	46
395	หัวงัว	ยางตลาด	46120	460702	4607	46
396	หัวนาคำ	ยางตลาด	46120	460707	4607	46
397	อิตื้อ	ยางตลาด	46120	460706	4607	46
398	อุ่มเม่า	ยางตลาด	46120	460703	4607	46
399	เขาพระนอน	ยางตลาด	46120	460712	4607	46
400	เว่อ	ยางตลาด	46120	460705	4607	46
401	โนนสูง	ยางตลาด	46120	460714	4607	46
402	ร่องคำ	ร่องคำ	46210	460401	4604	46
403	สามัคคี	ร่องคำ	46210	460402	4604	46
404	เหล่าอ้อย	ร่องคำ	46210	460403	4604	46
405	ผาเสวย	สมเด็จ	46150	461306	4613	46
406	มหาไชย	สมเด็จ	46150	461304	4613	46
407	ลำห้วยหลัว	สมเด็จ	46150	461308	4613	46
408	ศรีสมเด็จ	สมเด็จ	46150	461307	4613	46
409	สมเด็จ	สมเด็จ	46150	461301	4613	46
410	หนองแวง	สมเด็จ	46150	461302	4613	46
411	หมูม่น	สมเด็จ	46150	461305	4613	46
412	แซงบาดาล	สมเด็จ	46150	461303	4613	46
413	นามะเขือ	สหัสขันธ์	46140	460903	4609	46
414	นิคม	สหัสขันธ์	46140	460905	4609	46
415	ภูสิงห์	สหัสขันธ์	46140	460901	4609	46
416	สหัสขันธ์	สหัสขันธ์	46140	460902	4609	46
417	โนนน้ำเกลี้ยง	สหัสขันธ์	46140	460908	4609	46
418	โนนบุรี	สหัสขันธ์	46140	460907	4609	46
419	โนนศิลา	สหัสขันธ์	46140	460312	4609	46
420	โนนแหลมทอง	สหัสขันธ์	46140	460906	4609	46
421	คำสร้างเที่ยง	สามชัย	46180	461008	4615	46
422	สำราญ	สามชัย	46180	460998	4615	46
423	สำราญใต้	สามชัย	46180	461004	4615	46
424	หนองช้าง	สามชัย	46180	461010	4615	46
425	ดงมูล	หนองกุงศรี	46220	461207	4612	46
426	ลำหนองแสน	หนองกุงศรี	46220	461208	4612	46
427	หนองกุงศรี	หนองกุงศรี	46220	461201	4612	46
428	หนองบัว	หนองกุงศรี	46220	460205	4612	46
429	หนองสรวง	หนองกุงศรี	46220	461204	4612	46
430	หนองหิน	หนองกุงศรี	46220	461209	4612	46
431	หนองใหญ่	หนองกุงศรี	46220	461206	4612	46
432	เสาเล้า	หนองกุงศรี	46220	461205	4612	46
433	โคกเครือ	หนองกุงศรี	46220	461198	4612	46
434	คำบง	ห้วยผึ้ง	46240	461401	4614	46
435	นิคมห้วยผึ้ง	ห้วยผึ้ง	46240	461403	4614	46
436	หนองอีบุตร	ห้วยผึ้ง	46240	461404	4614	46
437	ไค้นุ่น	ห้วยผึ้ง	46240	461402	4614	46
438	กุดโดน	ห้วยเม็ก	46170	460803	4608	46
439	คำเหมือดแก้ว	ห้วยเม็ก	46170	460807	4608	46
440	คำใหญ่	ห้วยเม็ก	46170	460802	4608	46
441	ทรายทอง	ห้วยเม็ก	46170	460809	4608	46
442	บึงนาเรียง	ห้วยเม็ก	46170	460804	4608	46
443	พิมูล	ห้วยเม็ก	46170	460806	4608	46
444	หัวหิน	ห้วยเม็ก	46170	460805	4608	46
445	ห้วยเม็ก	ห้วยเม็ก	46170	460801	4608	46
446	โนนสะอาด	ห้วยเม็ก	46170	460808	4608	46
447	กุดปลาค้าว	เขาวง	46160	460611	4606	46
448	กุดสิมคุ้มใหม่	เขาวง	46160	460606	4606	46
449	คุ้มเก่า	เขาวง	46160	460601	4606	46
450	สงเปลือย	เขาวง	46160	460203	4606	46
451	สระพังทอง	เขาวง	46160	460608	4606	46
452	หนองผือ	เขาวง	46160	460603	4606	46
453	กลางหมื่น	เมืองกาฬสินธุ์	46000	460116	4601	46
454	กาฬสินธุ์	เมืองกาฬสินธุ์	46000	460101	4601	46
455	ขมิ้น	เมืองกาฬสินธุ์	46000	460117	4601	46
456	นาจารย์	เมืองกาฬสินธุ์	46000	460120	4601	46
457	บึงวิชัย	เมืองกาฬสินธุ์	46000	460108	4601	46
458	ภูดิน	เมืองกาฬสินธุ์	46000	460113	4601	46
459	ภูปอ	เมืองกาฬสินธุ์	46000	460111	4601	46
460	ลำคลอง	เมืองกาฬสินธุ์	46000	460121	4601	46
461	ลำปาว	เมืองกาฬสินธุ์	46000	460105	4601	46
462	ลำพาน	เมืองกาฬสินธุ์	46000	460106	4601	46
463	หนองกุง	เมืองกาฬสินธุ์	46000	460115	4601	46
464	หลุบ	เมืองกาฬสินธุ์	46000	460103	4601	46
465	ห้วยโพธิ์	เมืองกาฬสินธุ์	46000	460109	4601	46
466	เชียงเครือ	เมืองกาฬสินธุ์	46000	460107	4601	46
467	เหนือ	เมืองกาฬสินธุ์	46000	460102	4601	46
468	โพนทอง	เมืองกาฬสินธุ์	46000	460119	4601	46
469	ไผ่	เมืองกาฬสินธุ์	46000	460104	4601	46
470	ดอนแตง	ขาณุวรลักษบุรี	62140	620408	6204	62
471	บ่อถ้ำ	ขาณุวรลักษบุรี	62140	620407	6204	62
472	ปางมะค่า	ขาณุวรลักษบุรี	62140	620411	6204	62
473	ป่าพุทรา	ขาณุวรลักษบุรี	62130	620404	6204	62
474	ยางสูง	ขาณุวรลักษบุรี	62130	620403	6204	62
475	วังชะพลู	ขาณุวรลักษบุรี	62140	620409	6204	62
476	วังหามแห	ขาณุวรลักษบุรี	62140	620412	6204	62
477	สลกบาตร	ขาณุวรลักษบุรี	62140	620406	6204	62
478	เกาะตาล	ขาณุวรลักษบุรี	62130	620413	6204	62
479	แสนตอ	ขาณุวรลักษบุรี	62130	620405	6204	62
480	โค้งไผ่	ขาณุวรลักษบุรี	62140	620410	6204	62
481	คลองขลุง	คลองขลุง	62120	620501	6205	62
482	คลองสมบูรณ์	คลองขลุง	62120	620516	6205	62
483	ท่าพุทรา	คลองขลุง	62120	620504	6205	62
484	ท่ามะเขือ	คลองขลุง	62120	620502	6205	62
485	วังบัว	คลองขลุง	62120	620513	6205	62
486	วังยาง	คลองขลุง	62120	620506	6205	62
487	วังแขม	คลองขลุง	62120	620507	6205	62
488	วังไทร	คลองขลุง	62120	620509	6205	62
489	หัวถนน	คลองขลุง	62120	620508	6205	62
490	แม่ลาด	คลองขลุง	62120	620505	6205	62
491	คลองน้ำไหล	คลองลาน	62180	620301	6203	62
492	คลองลานพัฒนา	คลองลาน	62180	620303	6203	62
493	สักงาม	คลองลาน	62180	620304	6203	62
494	โป่งน้ำร้อน	คลองลาน	62180	620198	6203	62
495	ถาวรวัฒนา	ทรายทองวัฒนา	62190	620803	6208	62
496	ทุ่งทราย	ทรายทองวัฒนา	62190	620599	6208	62
497	ทุ่งทอง	ทรายทองวัฒนา	62190	620514	6208	62
498	บึงสามัคคี	บึงสามัคคี	62210	620414	6210	62
499	ระหาน	บึงสามัคคี	62210	620402	6210	62
500	วังชะโอน	บึงสามัคคี	62210	620401	6210	62
501	เทพนิมิต	บึงสามัคคี	62210	621004	6210	62
502	ปางตาไว	ปางศิลาทอง	62120	620511	6209	62
503	หินดาต	ปางศิลาทอง	62120	620515	6209	62
504	โพธิ์ทอง	ปางศิลาทอง	62120	620510	6209	62
505	คลองพิไกร	พรานกระต่าย	62110	620608	6206	62
506	คุยบ้านโอง	พรานกระต่าย	62110	620607	6206	62
507	ถ้ำกระต่ายทอง	พรานกระต่าย	62110	620609	6206	62
508	ท่าไม้	พรานกระต่าย	62110	620603	6206	62
509	พรานกระต่าย	พรานกระต่าย	62110	620601	6206	62
510	วังควง	พรานกระต่าย	62110	620604	6206	62
511	วังตะแบก	พรานกระต่าย	62110	620605	6206	62
512	หนองหัววัว	พรานกระต่าย	62110	620602	6206	62
513	ห้วยยั้ง	พรานกระต่าย	62110	620610	6206	62
514	เขาคีริส	พรานกระต่าย	62110	620606	6206	62
515	จันทิมา	ลานกระบือ	62170	620707	6207	62
516	ช่องลม	ลานกระบือ	62170	620702	6207	62
517	บึงทับแรต	ลานกระบือ	62170	620706	6207	62
518	ประชาสุขสันต์	ลานกระบือ	62170	620705	6207	62
519	ลานกระบือ	ลานกระบือ	62170	620701	6207	62
520	หนองหลวง	ลานกระบือ	62170	620703	6207	62
521	โนนพลวง	ลานกระบือ	62170	620704	6207	62
522	คณฑี	เมืองกำแพงเพชร	62000	620111	6201	62
523	คลองแม่ลาย	เมืองกำแพงเพชร	62000	620117	6201	62
524	ทรงธรรม	เมืองกำแพงเพชร	62000	620106	6201	62
525	ท่าขุนราม	เมืองกำแพงเพชร	62000	620115	6201	62
526	ธำมรงค์	เมืองกำแพงเพชร	62160	620118	6201	62
527	นครชุม	เมืองกำแพงเพชร	62000	620105	6201	62
528	นาบ่อคำ	เมืองกำแพงเพชร	62000	620104	6201	62
529	นิคมทุ่งโพธิ์ทะเล	เมืองกำแพงเพชร	62000	620112	6201	62
530	ลานดอกไม้	เมืองกำแพงเพชร	62000	620107	6201	62
531	วังทอง	เมืองกำแพงเพชร	62000	620114	6201	62
532	สระแก้ว	เมืองกำแพงเพชร	62000	620119	6201	62
533	หนองปลิง	เมืองกำแพงเพชร	62000	620110	6201	62
534	อ่างทอง	เมืองกำแพงเพชร	62000	620103	6201	62
535	เทพนคร	เมืองกำแพงเพชร	62000	620113	6201	62
536	ในเมือง	เมืองกำแพงเพชร	62000	620101	6201	62
537	ไตรตรึงษ์	เมืองกำแพงเพชร	62160	620102	6201	62
538	ลานดอกไม้ตก	โกสัมพีนคร	62000	620108	6211	62
539	เพชรชมภู	โกสัมพีนคร	62000	620116	6211	62
540	โกสัมพี	โกสัมพีนคร	62000	620109	6211	62
541	พานทอง	ไทรงาม	62150	620206	6202	62
542	มหาชัย	ไทรงาม	62150	620205	6202	62
543	หนองคล้า	ไทรงาม	62150	620197	6202	62
544	หนองทอง	ไทรงาม	62150	620203	6202	62
545	หนองแม่แตง	ไทรงาม	62150	620207	6202	62
546	หนองไม้กอง	ไทรงาม	62150	620204	6202	62
547	ไทรงาม	ไทรงาม	62150	620199	6202	62
548	ดูนสาด	กระนวน	40170	400909	4009	40
549	น้ำอ้อม	กระนวน	40170	400911	4009	40
550	บ้านฝาง	กระนวน	40170	400206	4009	40
551	หนองกุงใหญ่	กระนวน	40170	400902	4009	40
552	หนองโก	กระนวน	40170	400901	4009	40
553	หนองโน	กระนวน	40170	400910	4009	40
554	หัวนาคำ	กระนวน	40170	400912	4009	40
555	ห้วยยาง	กระนวน	40170	400906	4009	40
556	ห้วยโจด	กระนวน	40170	400905	4009	40
557	กุดเพียขอม	ชนบท	40180	401802	4018	40
558	ชนบท	ชนบท	40180	401801	4018	40
559	บ้านแท่น	ชนบท	40180	401805	4018	40
560	ปอแดง	ชนบท	40180	401808	4018	40
561	วังแสง	ชนบท	40180	401803	4018	40
562	ศรีบุญเรือง	ชนบท	40180	401806	4018	40
563	ห้วยแก	ชนบท	40180	401804	4018	40
564	โนนพะยอม	ชนบท	40180	401807	4018	40
565	ขัวเรียง	ชุมแพ	40130	400505	4005	40
566	ชุมแพ	ชุมแพ	40130	400501	4005	40
567	นาหนองทุ่ม	ชุมแพ	40290	400503	4005	40
568	นาเพียง	ชุมแพ	40130	400509	4005	40
569	วังหินลาด	ชุมแพ	40130	400508	4005	40
570	หนองเขียด	ชุมแพ	40290	400510	4005	40
571	หนองเสาเล้า	ชุมแพ	40130	400511	4005	40
572	หนองไผ่	ชุมแพ	40130	400506	4005	40
573	โนนสะอาด	ชุมแพ	40290	400409	4005	40
574	โนนหัน	ชุมแพ	40290	400502	4005	40
575	โนนอุดม	ชุมแพ	40130	400504	4005	40
576	ไชยสอ	ชุมแพ	40130	400507	4005	40
577	กระนวน	ซำสูง	40170	400903	4021	40
578	คำแมด	ซำสูง	40170	400908	4021	40
579	คูคำ	ซำสูง	40170	400913	4021	40
580	บ้านโนน	ซำสูง	40170	400904	4021	40
581	ห้วยเตย	ซำสูง	40170	400914	4021	40
582	กุดน้ำใส	น้ำพอง	40310	400712	4007	40
583	ทรายมูล	น้ำพอง	40140	400709	4007	40
584	ท่ากระเสริม	น้ำพอง	40140	400710	4007	40
585	น้ำพอง	น้ำพอง	40140	400701	4007	40
586	บัวเงิน	น้ำพอง	40140	400708	4007	40
587	บัวใหญ่	น้ำพอง	40140	400704	4007	40
588	บ้านขาม	น้ำพอง	40140	400707	4007	40
589	พังทุย	น้ำพอง	40140	400711	4007	40
590	ม่วงหวาน	น้ำพอง	40310	400706	4007	40
591	วังชัย	น้ำพอง	40140	400702	4007	40
592	สะอาด	น้ำพอง	40310	400705	4007	40
593	หนองกุง	น้ำพอง	40140	400703	4007	40
594	บ้านฝาง	บ้านฝาง	40270	400206	4002	40
595	บ้านเหล่า	บ้านฝาง	40270	400204	4002	40
596	ป่ามะนาว	บ้านฝาง	40270	400205	4002	40
597	ป่าหวายนั่ง	บ้านฝาง	40270	400202	4002	40
598	หนองบัว	บ้านฝาง	40270	400199	4002	40
599	โคกงาม	บ้านฝาง	40270	400207	4002	40
600	โนนฆ้อง	บ้านฝาง	40270	400203	4002	40
601	บ้านแฮด	บ้านแฮด	40110	401003	4024	40
602	หนองแซง	บ้านแฮด	40110	401012	4024	40
603	โคกสำราญ	บ้านแฮด	40110	401004	4024	40
604	โนนสมบูรณ์	บ้านแฮด	40110	401015	4024	40
605	บ้านลาน	บ้านไผ่	40110	401009	4010	40
606	บ้านไผ่	บ้านไผ่	40110	401001	4010	40
607	ป่าปอ	บ้านไผ่	40110	401013	4010	40
608	ภูเหล็ก	บ้านไผ่	40110	401011	4010	40
609	หนองน้ำใส	บ้านไผ่	40110	401016	4010	40
610	หัวหนอง	บ้านไผ่	40110	401017	4010	40
611	หินตั้ง	บ้านไผ่	40110	401014	4010	40
612	เมืองเพีย	บ้านไผ่	40110	401005	4010	40
613	แคนเหนือ	บ้านไผ่	40110	401010	4010	40
614	ในเมือง	บ้านไผ่	40110	400101	4010	40
615	ขามป้อม	พระยืน	40320	400305	4003	40
616	บ้านโต้น	พระยืน	40320	400198	4003	40
617	พระบุ	พระยืน	40320	400302	4003	40
618	พระยืน	พระยืน	40320	400301	4003	40
619	หนองแวง	พระยืน	40320	400304	4003	40
620	ลอมคอม	พล	40120	401210	4012	40
621	หนองมะเขือ	พล	40120	401205	4012	40
622	หนองแวงนางเบ้า	พล	40120	401209	4012	40
623	หนองแวงโสกพระ	พล	40120	401206	4012	40
624	หัวทุ่ง	พล	40120	401213	4012	40
625	เก่างิ้ว	พล	40120	401204	4012	40
626	เพ็กใหญ่	พล	40120	401207	4012	40
627	เมืองพล	พล	40120	401201	4012	40
628	โคกสง่า	พล	40120	401208	4012	40
629	โจดหนองแก	พล	40120	401203	4012	40
630	โนนข่า	พล	40120	401211	4012	40
631	โสกนกเต็น	พล	40120	401212	4012	40
632	นาฝาย	ภูผาม่าน	40350	402002	4020	40
633	ภูผาม่าน	ภูผาม่าน	40350	402003	4020	40
634	วังสวาบ	ภูผาม่าน	40350	402004	4020	40
635	ห้วยม่วง	ภูผาม่าน	40350	402005	4020	40
636	โนนคอม	ภูผาม่าน	40350	402001	4020	40
637	กุดขอนแก่น	ภูเวียง	40150	401605	4016	40
638	ดินดำ	ภูเวียง	40150	401616	4016	40
639	ทุ่งชมพู	ภูเวียง	40150	401614	4016	40
640	นาชุมแสง	ภูเวียง	40150	401606	4016	40
641	นาหว้า	ภูเวียง	40150	401607	4016	40
642	บ้านเรือ	ภูเวียง	40150	401601	4016	40
643	ภูเวียง	ภูเวียง	40150	401617	4016	40
644	สงเปือย	ภูเวียง	40150	401613	4016	40
645	หนองกุงธนสาร	ภูเวียง	40150	401610	4016	40
646	หนองกุงเซิน	ภูเวียง	40150	401612	4016	40
647	หว้าทอง	ภูเวียง	40150	401604	4016	40
648	เขาน้อย	เวียงเก่า	40150	401608	4029	40
649	เมืองเก่าพัฒนา	เวียงเก่า	40150	401615	4029	40
650	ในเมือง	เวียงเก่า	40150	400101	4029	40
651	กุดเค้า	มัญจาคีรี	40160	401701	4017	40
652	คำแคน	มัญจาคีรี	40160	401705	4017	40
653	ท่าศาลา	มัญจาคีรี	40160	401710	4017	40
654	นาข่า	มัญจาคีรี	40160	401706	4017	40
655	นางาม	มัญจาคีรี	40160	401707	4017	40
656	สวนหม่อน	มัญจาคีรี	40160	401702	4017	40
657	หนองแปน	มัญจาคีรี	40160	401703	4017	40
658	โพนเพ็ก	มัญจาคีรี	40160	401704	4017	40
659	ซำยาง	สีชมพู	40220	400605	4006	40
660	ดงลาน	สีชมพู	40220	400607	4006	40
661	นาจาน	สีชมพู	40220	400603	4006	40
662	บริบูรณ์	สีชมพู	40220	400608	4006	40
663	บ้านใหม่	สีชมพู	40220	400609	4006	40
664	ภูห่าน	สีชมพู	40220	400610	4006	40
665	วังเพิ่ม	สีชมพู	40220	400604	4006	40
666	ศรีสุข	สีชมพู	40220	400602	4006	40
667	สีชมพู	สีชมพู	40220	400601	4006	40
668	หนองแดง	สีชมพู	40220	400606	4006	40
669	กุดธาตุ	หนองนาคำ	40150	401609	4023	40
670	ขนวน	หนองนาคำ	40150	401611	4023	40
671	บ้านโคก	หนองนาคำ	40150	401603	4023	40
672	คึมชาด	หนองสองห้อง	40190	401502	4015	40
673	ดงเค็ง	หนองสองห้อง	40190	401508	4015	40
674	ดอนดั่ง	หนองสองห้อง	40190	401510	4015	40
675	ดอนดู่	หนองสองห้อง	40190	401507	4015	40
676	ตะกั่วป่า	หนองสองห้อง	40190	401504	4015	40
677	วังหิน	หนองสองห้อง	40190	401511	4015	40
678	สำโรง	หนองสองห้อง	40190	401505	4015	40
679	หนองสองห้อง	หนองสองห้อง	40190	401501	4015	40
680	หนองเม็ก	หนองสองห้อง	40190	401506	4015	40
681	หนองไผ่ล้อม	หนองสองห้อง	40190	401512	4015	40
682	หันโจด	หนองสองห้อง	40190	401509	4015	40
683	โนนธาตุ	หนองสองห้อง	40190	401503	4015	40
684	กุดกว้าง	หนองเรือ	40210	400407	4004	40
685	จระเข้	หนองเรือ	40240	400405	4004	40
686	บ้านกง	หนองเรือ	40240	400403	4004	40
687	บ้านผือ	หนองเรือ	40240	400410	4004	40
688	บ้านเม็ง	หนองเรือ	40210	400402	4004	40
689	ยางคำ	หนองเรือ	40240	400404	4004	40
690	หนองเรือ	หนองเรือ	40210	400401	4004	40
691	โนนทอง	หนองเรือ	40210	400406	4004	40
692	โนนทัน	หนองเรือ	40210	400408	4004	40
693	โนนสะอาด	หนองเรือ	40210	400409	4004	40
694	ทุ่งโป่ง	อุบลรัตน์	40250	400806	4008	40
695	นาคำ	อุบลรัตน์	40250	400804	4008	40
696	บ้านดง	อุบลรัตน์	40250	400802	4008	40
697	ศรีสุขสำราญ	อุบลรัตน์	40250	400805	4008	40
698	เขื่อนอุบลรัตน์	อุบลรัตน์	40250	400803	4008	40
699	โคกสูง	อุบลรัตน์	40250	400801	4008	40
700	คำม่วง	เขาสวนกวาง	40280	401905	4019	40
701	ดงเมืองแอม	เขาสวนกวาง	40280	401902	4019	40
702	นางิ้ว	เขาสวนกวาง	40280	401903	4019	40
703	เขาสวนกวาง	เขาสวนกวาง	40280	401901	4019	40
704	โนนสมบูรณ์	เขาสวนกวาง	40280	401015	4019	40
705	ขามป้อม	เปือยน้อย	40340	400305	4011	40
706	วังม่วง	เปือยน้อย	40340	401098	4011	40
707	สระแก้ว	เปือยน้อย	40340	401096	4011	40
708	เปือยน้อย	เปือยน้อย	40340	401099	4011	40
709	ดอนช้าง	เมืองขอนแก่น	40000	400112	4001	40
710	ดอนหัน	เมืองขอนแก่น	40260	400113	4001	40
711	ท่าพระ	เมืองขอนแก่น	40260	400104	4001	40
712	บึงเนียม	เมืองขอนแก่น	40000	400117	4001	40
713	บ้านค้อ	เมืองขอนแก่น	40000	400110	4001	40
714	บ้านทุ่ม	เมืองขอนแก่น	40000	400105	4001	40
715	บ้านหว้า	เมืองขอนแก่น	40000	400109	4001	40
716	บ้านเป็ด	เมืองขอนแก่น	40000	400115	4001	40
717	พระลับ	เมืองขอนแก่น	40000	400107	4001	40
718	ศิลา	เมืองขอนแก่น	40000	400114	4001	40
719	สาวะถี	เมืองขอนแก่น	40000	400108	4001	40
720	สำราญ	เมืองขอนแก่น	40000	400102	4001	40
721	หนองตูม	เมืองขอนแก่น	40000	400116	4001	40
722	เมืองเก่า	เมืองขอนแก่น	40000	400106	4001	40
723	แดงใหญ่	เมืองขอนแก่น	40000	400111	4001	40
724	โคกสี	เมืองขอนแก่น	40000	400103	4001	40
725	โนนท่อน	เมืองขอนแก่น	40000	400118	4001	40
726	ในเมือง	เมืองขอนแก่น	40000	400101	4001	40
727	ก้านเหลือง	แวงน้อย	40230	401294	4014	40
728	ทางขวาง	แวงน้อย	40230	401290	4014	40
729	ท่านางแนว	แวงน้อย	40230	401403	4014	40
730	ท่าวัด	แวงน้อย	40230	401291	4014	40
731	ละหานนา	แวงน้อย	40230	401404	4014	40
732	แวงน้อย	แวงน้อย	40230	401293	4014	40
733	คอนฉิม	แวงใหญ่	40330	401299	4013	40
734	แวงใหญ่	แวงใหญ่	40330	401296	4013	40
735	โนนทอง	แวงใหญ่	40330	400406	4013	40
736	โนนสะอาด	แวงใหญ่	40330	400409	4013	40
737	ใหม่นาเพียง	แวงใหญ่	40330	401298	4013	40
738	ซับสมบูรณ์	โคกโพธิ์ไชย	40160	401711	4022	40
739	นาแพง	โคกโพธิ์ไชย	40160	401712	4022	40
740	บ้านโคก	โคกโพธิ์ไชย	40160	401603	4022	40
741	โพธิ์ไชย	โคกโพธิ์ไชย	40160	401709	4022	40
742	บ้านหัน	โนนศิลา	40110	401008	4025	40
743	หนองปลาหมอ	โนนศิลา	40110	401020	4025	40
744	เปือยใหญ่	โนนศิลา	40110	401006	4025	40
745	โนนศิลา	โนนศิลา	40110	401007	4025	40
746	โนนแดง	โนนศิลา	40110	401019	4025	40
747	ขลุง	ขลุง	22110	220201	2202	22
748	ซึ้ง	ขลุง	22110	220207	2202	22
749	ตกพรม	ขลุง	22110	220211	2202	22
750	ตรอกนอง	ขลุง	22110	220210	2202	22
751	ตะปอน	ขลุง	22110	220204	2202	22
752	บางชัน	ขลุง	22110	220205	2202	22
753	บ่อ	ขลุง	22110	220202	2202	22
754	บ่อเวฬุ	ขลุง	22150	220212	2202	22
755	มาบไพ	ขลุง	22110	220208	2202	22
756	วังสรรพรส	ขลุง	22110	220209	2202	22
757	วันยาว	ขลุง	22110	220206	2202	22
758	เกวียนหัก	ขลุง	22110	220203	2202	22
759	คลองขุด	ท่าใหม่	22120	220314	2203	22
760	ตะกาดเง้า	ท่าใหม่	22120	220313	2203	22
761	ทุ่งเบญจา	ท่าใหม่	22170	220309	2203	22
762	ท่าใหม่	ท่าใหม่	22120	220301	2203	22
763	บ่อพุ	ท่าใหม่	22120	220304	2203	22
764	พลอยแหวน	ท่าใหม่	22120	220305	2203	22
765	ยายร้า	ท่าใหม่	22120	220302	2203	22
766	รำพัน	ท่าใหม่	22170	220311	2203	22
767	สองพี่น้อง	ท่าใหม่	22120	220308	2203	22
768	สีพยา	ท่าใหม่	22120	220303	2203	22
769	เขาบายศรี	ท่าใหม่	22120	220307	2203	22
770	เขาวัว	ท่าใหม่	22120	220306	2203	22
771	เขาแก้ว	ท่าใหม่	22170	220324	2203	22
772	โขมง	ท่าใหม่	22170	220312	2203	22
773	กระแจะ	นายายอาม	22170	220315	2209	22
774	ช้างข้าม	นายายอาม	22160	220317	2209	22
775	นายายอาม	นายายอาม	22160	220318	2209	22
776	วังโตนด	นายายอาม	22170	220310	2209	22
777	วังใหม่	นายายอาม	22170	220906	2209	22
778	สนามไชย	นายายอาม	22170	220316	2209	22
779	ฉมัน	มะขาม	22150	220506	2205	22
780	ท่าหลวง	มะขาม	22150	220502	2205	22
781	ปัถวี	มะขาม	22150	220503	2205	22
782	มะขาม	มะขาม	22150	220501	2205	22
783	วังแซ้ม	มะขาม	22150	220504	2205	22
784	อ่างคีรี	มะขาม	22150	220508	2205	22
785	ทรายขาว	สอยดาว	22180	220403	2207	22
786	ทับช้าง	สอยดาว	22180	220408	2207	22
787	ทุ่งขนาน	สอยดาว	22180	220406	2207	22
788	ปะตง	สอยดาว	22180	220405	2207	22
789	สะตอน	สอยดาว	22180	220407	2207	22
790	คลองพลู	เขาคิชฌกูฏ	22210	220509	2210	22
791	จันทเขลม	เขาคิชฌกูฏ	22210	221005	2210	22
792	ชากไทย	เขาคิชฌกูฏ	22210	221001	2210	22
793	ตะเคียนทอง	เขาคิชฌกูฏ	22210	220507	2210	22
794	พลวง	เขาคิชฌกูฏ	22210	220505	2210	22
795	คมบาง	เมืองจันทบุรี	22000	220105	2201	22
796	คลองนารายณ์	เมืองจันทบุรี	22000	220103	2201	22
797	จันทนิมิต	เมืองจันทบุรี	22000	220107	2201	22
798	ตลาด	เมืองจันทบุรี	22000	220101	2201	22
799	ท่าช้าง	เมืองจันทบุรี	22000	220106	2201	22
800	บางกะจะ	เมืองจันทบุรี	22000	220108	2201	22
801	พลับพลา	เมืองจันทบุรี	22000	220111	2201	22
802	วัดใหม่	เมืองจันทบุรี	22000	220102	2201	22
803	หนองบัว	เมืองจันทบุรี	22000	220110	2201	22
804	เกาะขวาง	เมืองจันทบุรี	22000	220104	2201	22
805	แสลง	เมืองจันทบุรี	22000	220109	2201	22
806	ขุนซ่อง	แก่งหางแมว	22160	220323	2208	22
807	พวา	แก่งหางแมว	22160	220322	2208	22
808	สามพี่น้อง	แก่งหางแมว	22160	220320	2208	22
809	เขาวงกต	แก่งหางแมว	22160	220321	2208	22
810	แก่งหางแมว	แก่งหางแมว	22160	220319	2208	22
811	คลองน้ำเค็ม	แหลมสิงห์	22190	220605	2206	22
812	บางกะไชย	แหลมสิงห์	22120	220607	2206	22
813	บางสระเก้า	แหลมสิงห์	22190	220606	2206	22
814	ปากน้ำแหลมสิงห์	แหลมสิงห์	22130	220601	2206	22
815	พลิ้ว	แหลมสิงห์	22190	220604	2206	22
816	หนองชิ่ม	แหลมสิงห์	22130	220603	2206	22
817	เกาะเปริด	แหลมสิงห์	22130	220602	2206	22
818	คลองใหญ่	โป่งน้ำร้อน	22140	220410	2204	22
819	ทับไทร	โป่งน้ำร้อน	22140	220401	2204	22
820	หนองตาคง	โป่งน้ำร้อน	22140	220404	2204	22
821	เทพนิมิต	โป่งน้ำร้อน	22140	220409	2204	22
822	โป่งน้ำร้อน	โป่งน้ำร้อน	22140	220402	2204	22
823	ก้อนแก้ว	คลองเขื่อน	24000	240202	2411	24
824	คลองเขื่อน	คลองเขื่อน	24000	240203	2411	24
825	บางตลาด	คลองเขื่อน	24110	240207	2411	24
826	บางเล่า	คลองเขื่อน	24000	240205	2411	24
827	บางโรง	คลองเขื่อน	24000	240206	2411	24
828	คลองตะเกรา	ท่าตะเกียบ	24160	240806	2410	24
829	ท่าตะเกียบ	ท่าตะเกียบ	24160	240804	2410	24
830	ท่าทองหลาง	บางคล้า	24110	240210	2402	24
831	บางกระเจ็ด	บางคล้า	24110	240208	2402	24
832	บางคล้า	บางคล้า	24110	240201	2402	24
833	บางสวน	บางคล้า	24110	240204	2402	24
834	ปากน้ำ	บางคล้า	24110	240209	2402	24
835	สาวชะโงก	บางคล้า	24110	240211	2402	24
836	หัวไทร	บางคล้า	24110	240214	2402	24
837	เสม็ดเหนือ	บางคล้า	24110	240212	2402	24
838	เสม็ดใต้	บางคล้า	24110	240213	2402	24
839	ดอนฉิมพลี	บางน้ำเปรี้ยว	24170	240308	2403	24
840	ดอนเกาะกา	บางน้ำเปรี้ยว	24170	240306	2403	24
841	บางขนาก	บางน้ำเปรี้ยว	24150	240302	2403	24
842	บางน้ำเปรี้ยว	บางน้ำเปรี้ยว	24150	240301	2403	24
843	บึงน้ำรักษ์	บางน้ำเปรี้ยว	24170	240305	2403	24
844	ศาลาแดง	บางน้ำเปรี้ยว	24000	240309	2403	24
845	สิงโตทอง	บางน้ำเปรี้ยว	24150	240303	2403	24
846	หมอนทอง	บางน้ำเปรี้ยว	24150	240304	2403	24
847	โพรงอากาศ	บางน้ำเปรี้ยว	24150	240310	2403	24
848	โยธะกา	บางน้ำเปรี้ยว	24150	240307	2403	24
849	ท่าข้าม	บางปะกง	24130	240410	2404	24
850	ท่าสะอ้าน	บางปะกง	24130	240402	2404	24
851	บางปะกง	บางปะกง	24130	240401	2404	24
852	บางผึ้ง	บางปะกง	24130	240405	2404	24
853	บางวัว	บางปะกง	24130	240403	2404	24
854	บางสมัคร	บางปะกง	24180	240404	2404	24
855	บางเกลือ	บางปะกง	24180	240406	2404	24
856	พิมพา	บางปะกง	24180	240409	2404	24
857	สองคลอง	บางปะกง	24130	240407	2404	24
858	หนองจอก	บางปะกง	24130	240408	2404	24
859	หอมศีล	บางปะกง	24180	240411	2404	24
860	เขาดิน	บางปะกง	24130	240412	2404	24
861	คลองขุด	บ้านโพธิ์	24140	240503	2405	24
862	คลองบ้านโพธิ์	บ้านโพธิ์	24140	240504	2405	24
863	คลองประเวศ	บ้านโพธิ์	24140	240505	2405	24
864	ดอนทราย	บ้านโพธิ์	24140	240506	2405	24
865	ท่าพลับ	บ้านโพธิ์	24140	240508	2405	24
866	บางกรูด	บ้านโพธิ์	24140	240512	2405	24
867	บางซ่อน	บ้านโพธิ์	24140	240511	2405	24
868	บ้านโพธิ์	บ้านโพธิ์	24140	240501	2405	24
869	ลาดขวาง	บ้านโพธิ์	24140	240514	2405	24
870	สนามจันทร์	บ้านโพธิ์	24140	240515	2405	24
871	สิบเอ็ดศอก	บ้านโพธิ์	24140	240517	2405	24
872	หนองตีนนก	บ้านโพธิ์	24140	240509	2405	24
873	หนองบัว	บ้านโพธิ์	24140	240510	2405	24
874	เกาะไร่	บ้านโพธิ์	24140	240502	2405	24
875	เทพราช	บ้านโพธิ์	24140	240507	2405	24
876	แสนภูดาษ	บ้านโพธิ์	24140	240516	2405	24
877	แหลมประดู่	บ้านโพธิ์	24140	240513	2405	24
878	ท่าถ่าน	พนมสารคาม	24120	240606	2406	24
879	บ้านซ่อง	พนมสารคาม	24120	240602	2406	24
880	พนมสารคาม	พนมสารคาม	24120	240603	2406	24
881	หนองยาว	พนมสารคาม	24120	240605	2406	24
882	หนองแหน	พนมสารคาม	24120	240607	2406	24
883	เกาะขนุน	พนมสารคาม	24120	240601	2406	24
884	เขาหินซ้อน	พนมสารคาม	24120	240608	2406	24
885	เมืองเก่า	พนมสารคาม	24120	240604	2406	24
886	ดงน้อย	ราชสาส์น	24120	240703	2407	24
887	บางคา	ราชสาส์น	24120	240701	2407	24
888	เมืองใหม่	ราชสาส์น	24120	240702	2407	24
889	คู้ยายหมี	สนามชัยเขต	24160	240801	2408	24
890	ทุ่งพระยา	สนามชัยเขต	24160	240803	2408	24
891	ท่ากระดาน	สนามชัยเขต	24160	240802	2408	24
892	ลาดกระทิง	สนามชัยเขต	24160	240805	2408	24
893	คลองจุกกระเฌอ	เมืองฉะเชิงเทรา	24000	240107	2401	24
894	คลองนครเนื่องเขต	เมืองฉะเชิงเทรา	24000	240110	2401	24
895	คลองนา	เมืองฉะเชิงเทรา	24000	240104	2401	24
896	คลองหลวงแพ่ง	เมืองฉะเชิงเทรา	24000	240118	2401	24
897	คลองอุดมชลจร	เมืองฉะเชิงเทรา	24000	240117	2401	24
898	คลองเปรง	เมืองฉะเชิงเทรา	24000	240116	2401	24
899	ท่าไข่	เมืองฉะเชิงเทรา	24000	240102	2401	24
900	บางกะไห	เมืองฉะเชิงเทรา	24000	240114	2401	24
901	บางขวัญ	เมืองฉะเชิงเทรา	24000	240109	2401	24
902	บางตีนเป็ด	เมืองฉะเชิงเทรา	24000	240105	2401	24
903	บางพระ	เมืองฉะเชิงเทรา	24000	240113	2401	24
904	บางเตย	เมืองฉะเชิงเทรา	24000	240119	2401	24
905	บางแก้ว	เมืองฉะเชิงเทรา	24000	240108	2401	24
906	บางไผ่	เมืองฉะเชิงเทรา	24000	240106	2401	24
907	บ้านใหม่	เมืองฉะเชิงเทรา	24000	240103	2401	24
908	วังตะเคียน	เมืองฉะเชิงเทรา	24000	240111	2401	24
909	หนามแดง	เมืองฉะเชิงเทรา	24000	240115	2401	24
910	หน้าเมือง	เมืองฉะเชิงเทรา	24000	240101	2401	24
911	โสธร	เมืองฉะเชิงเทรา	24000	240112	2401	24
912	วังเย็น	แปลงยาว	24190	240902	2409	24
913	หนองไม้แก่น	แปลงยาว	24190	240904	2409	24
914	หัวสำโรง	แปลงยาว	24190	240903	2409	24
915	แปลงยาว	แปลงยาว	24190	240901	2409	24
916	ตะเคียนเตี้ย	บางละมุง	20150	200407	2004	20
917	นาเกลือ	บางละมุง	20150	200408	2004	20
918	บางละมุง	บางละมุง	20150	200401	2004	20
919	หนองปรือ	บางละมุง	20150	200402	2004	20
920	หนองปลาไหล	บางละมุง	20150	200403	2004	20
921	ห้วยใหญ่	บางละมุง	20150	200406	2004	20
922	เขาไม้แก้ว	บางละมุง	20150	200405	2004	20
923	โป่ง	บางละมุง	20150	200404	2004	20
924	ธาตุทอง	บ่อทอง	20270	201004	2010	20
925	บ่อกวางทอง	บ่อทอง	20270	200697	2010	20
926	บ่อทอง	บ่อทอง	20270	200699	2010	20
927	พลวงทอง	บ่อทอง	20270	201006	2010	20
928	วัดสุวรรณ	บ่อทอง	20270	200698	2010	20
929	เกษตรสุวรรณ	บ่อทอง	20270	201005	2010	20
930	คลองกิ่ว	บ้านบึง	20220	200202	2002	20
931	บ้านบึง	บ้านบึง	20170	200201	2002	20
932	มาบไผ่	บ้านบึง	20170	200203	2002	20
933	หนองชาก	บ้านบึง	20170	200206	2002	20
934	หนองซ้ำซาก	บ้านบึง	20170	200204	2002	20
935	หนองบอนแดง	บ้านบึง	20170	200205	2002	20
936	หนองอิรุณ	บ้านบึง	20220	200207	2002	20
937	หนองไผ่แก้ว	บ้านบึง	20220	200208	2002	20
938	กุฎโง้ง	พนัสนิคม	20140	200609	2006	20
939	ทุ่งขวาง	พนัสนิคม	20140	200615	2006	20
940	ท่าข้าม	พนัสนิคม	20140	200611	2006	20
941	นามะตูม	พนัสนิคม	20140	200622	2006	20
942	นาวังหิน	พนัสนิคม	20140	200617	2006	20
943	นาเริก	พนัสนิคม	20140	200605	2006	20
944	บ้านช้าง	พนัสนิคม	20140	200618	2006	20
945	บ้านเซิด	พนัสนิคม	20140	200604	2006	20
946	พนัสนิคม	พนัสนิคม	20140	200601	2006	20
947	วัดหลวง	พนัสนิคม	20140	200603	2006	20
948	วัดโบสถ์	พนัสนิคม	20140	200608	2006	20
949	สระสี่เหลี่ยม	พนัสนิคม	20140	200607	2006	20
950	หนองขยาด	พนัสนิคม	20140	200614	2006	20
951	หนองปรือ	พนัสนิคม	20140	200402	2006	20
952	หนองเหียง	พนัสนิคม	20140	200616	2006	20
953	หน้าพระธาตุ	พนัสนิคม	20140	200602	2006	20
954	หมอนนาง	พนัสนิคม	20140	200606	2006	20
955	หัวถนน	พนัสนิคม	20140	200610	2006	20
956	โคกเพลาะ	พนัสนิคม	20140	200620	2006	20
957	ไร่หลักทอง	พนัสนิคม	20140	200621	2006	20
958	บางนาง	พานทอง	20160	200509	2005	20
959	บางหัก	พานทอง	20160	200511	2005	20
960	บ้านเก่า	พานทอง	20160	200507	2005	20
961	พานทอง	พานทอง	20160	200501	2005	20
962	มาบโป่ง	พานทอง	20160	200503	2005	20
963	หนองกะขะ	พานทอง	20160	200504	2005	20
964	หนองตำลึง	พานทอง	20160	200502	2005	20
965	หนองหงษ์	พานทอง	20160	200505	2005	20
966	หน้าประดู่	พานทอง	20160	200508	2005	20
967	เกาะลอย	พานทอง	20160	200510	2005	20
968	โคกขี้หนอน	พานทอง	20160	200506	2005	20
969	ทุ่งสุขลา	ศรีราชา	20230	200703	2007	20
970	บางพระ	ศรีราชา	20110	200707	2007	20
971	บึง	ศรีราชา	20230	200704	2007	20
972	บ่อวิน	ศรีราชา	20230	200708	2007	20
973	ศรีราชา	ศรีราชา	20110	200701	2007	20
974	สุรศักดิ์	ศรีราชา	20110	200702	2007	20
975	หนองขาม	ศรีราชา	20230	200705	2007	20
976	เขาคันทรง	ศรีราชา	20110	200706	2007	20
977	นาจอมเทียน	สัตหีบ	20250	200902	2009	20
978	บางเสร่	สัตหีบ	20250	200904	2009	20
979	พลูตาหลวง	สัตหีบ	20180	200903	2009	20
980	สัตหีบ	สัตหีบ	20180	200901	2009	20
981	แสมสาร	สัตหีบ	20180	200905	2009	20
982	คลองพลู	หนองใหญ่	20190	200298	2003	20
983	หนองเสือช้าง	หนองใหญ่	20190	200297	2003	20
984	หนองใหญ่	หนองใหญ่	20190	200299	2003	20
985	ห้างสูง	หนองใหญ่	20190	200304	2003	20
986	เขาซก	หนองใหญ่	20190	200305	2003	20
987	ท่าบุญมี	เกาะจันทร์	20240	200612	2011	20
988	เกาะจันทร์	เกาะจันทร์	20240	200619	2011	20
989	ท่าเทววงษ์	เกาะสีชัง	20120	200799	2008	20
990	คลองตำหรุ	เมืองชลบุรี	20000	200112	2001	20
991	ดอนหัวฬ่อ	เมืองชลบุรี	20000	200109	2001	20
992	นาป่า	เมืองชลบุรี	20000	200107	2001	20
993	บางทราย	เมืองชลบุรี	20000	200111	2001	20
994	บางปลาสร้อย	เมืองชลบุรี	20000	200101	2001	20
995	บ้านปึก	เมืองชลบุรี	20130	200114	2001	20
996	บ้านสวน	เมืองชลบุรี	20000	200105	2001	20
997	บ้านโขด	เมืองชลบุรี	20000	200103	2001	20
998	มะขามหย่ง	เมืองชลบุรี	20000	200102	2001	20
999	สำนักบก	เมืองชลบุรี	20000	200118	2001	20
1000	หนองข้างคอก	เมืองชลบุรี	20000	200108	2001	20
1001	หนองรี	เมืองชลบุรี	20000	200106	2001	20
1002	หนองไม้แดง	เมืองชลบุรี	20000	200110	2001	20
1003	ห้วยกะปิ	เมืองชลบุรี	20000	200115	2001	20
1004	อ่างศิลา	เมืองชลบุรี	20000	200117	2001	20
1005	เสม็ด	เมืองชลบุรี	20000	200116	2001	20
1006	เหมือง	เมืองชลบุรี	20130	200113	2001	20
1007	แสนสุข	เมืองชลบุรี	20130	200104	2001	20
1008	คุ้งสำเภา	มโนรมย์	17110	180201	1802	18
1009	ท่าฉนวน	มโนรมย์	17110	180204	1802	18
1010	วัดโคก	มโนรมย์	17110	180202	1802	18
1011	ศิลาดาน	มโนรมย์	17110	180203	1802	18
1012	หางน้ำสาคร	มโนรมย์	17170	180205	1802	18
1013	อู่ตะเภา	มโนรมย์	17170	180207	1802	18
1014	ไร่พัฒนา	มโนรมย์	17170	180206	1802	18
1015	บ่อแร่	วัดสิงห์	17120	180307	1803	18
1016	มะขามเฒ่า	วัดสิงห์	17120	180302	1803	18
1017	วังหมัน	วัดสิงห์	17120	180311	1803	18
1018	วัดสิงห์	วัดสิงห์	17120	180301	1803	18
1019	หนองขุ่น	วัดสิงห์	17120	180306	1803	18
1020	หนองน้อย	วัดสิงห์	17120	180303	1803	18
1021	หนองบัว	วัดสิงห์	17120	180304	1803	18
1022	ดงคอน	สรรคบุรี	17140	180506	1805	18
1023	ดอนกำ	สรรคบุรี	17140	180507	1805	18
1024	บางขุด	สรรคบุรี	17140	180505	1805	18
1025	ห้วยกรด	สรรคบุรี	17140	180503	1805	18
1026	ห้วยกรดพัฒนา	สรรคบุรี	17140	180508	1805	18
1027	เที่ยงแท้	สรรคบุรี	17140	180502	1805	18
1028	แพรกศรีราชา	สรรคบุรี	17140	180501	1805	18
1029	โพงาม	สรรคบุรี	17140	180504	1805	18
1030	ตลุก	สรรพยา	17150	180402	1804	18
1031	บางหลวง	สรรพยา	17150	180406	1804	18
1032	สรรพยา	สรรพยา	17150	180401	1804	18
1033	หาดอาษา	สรรพยา	17150	180407	1804	18
1034	เขาแก้ว	สรรพยา	17150	180403	1804	18
1035	โพนางดำตก	สรรพยา	17150	180404	1804	18
1036	โพนางดำออก	สรรพยา	17150	180405	1804	18
1037	กุดจอก	หนองมะโมง	17120	180308	1807	18
1038	วังตะเคียน	หนองมะโมง	17120	180309	1807	18
1039	สะพานหิน	หนองมะโมง	17120	180310	1807	18
1040	หนองมะโมง	หนองมะโมง	17120	180305	1807	18
1041	บ้านเชี่ยน	หันคา	17130	180602	1806	18
1042	วังไก่เถื่อน	หันคา	17130	180608	1806	18
1043	สามง่ามท่าโบสถ์	หันคา	17160	180611	1806	18
1044	หนองแซง	หันคา	17160	180606	1806	18
1045	หันคา	หันคา	17130	180601	1806	18
1046	ห้วยงู	หันคา	17160	180607	1806	18
1047	เด่นใหญ่	หันคา	17130	180609	1806	18
1048	ไพรนกยูง	หันคา	17130	180605	1806	18
1049	กะบกเตี้ย	เนินขาม	17130	180610	1808	18
1050	สุขเดือนห้า	เนินขาม	17130	180604	1808	18
1051	เนินขาม	เนินขาม	17130	180603	1808	18
1052	ชัยนาท	เมืองชัยนาท	17000	180104	1801	18
1053	ท่าชัย	เมืองชัยนาท	17000	180103	1801	18
1054	ธรรมามูล	เมืองชัยนาท	17000	180107	1801	18
1055	นางลือ	เมืองชัยนาท	17000	180109	1801	18
1056	บ้านกล้วย	เมืองชัยนาท	17000	180102	1801	18
1057	หาดท่าเสา	เมืองชัยนาท	17120	180106	1801	18
1058	เขาท่าพระ	เมืองชัยนาท	17000	180105	1801	18
1059	เสือโฮก	เมืองชัยนาท	17000	180108	1801	18
1060	ในเมือง	เมืองชัยนาท	17000	180101	1801	18
1061	คอนสวรรค์	คอนสวรรค์	36140	360301	3603	36
1062	ช่องสามหมอ	คอนสวรรค์	36140	360303	3603	36
1063	บ้านโสก	คอนสวรรค์	36140	360306	3603	36
1064	ยางหวาย	คอนสวรรค์	36140	360302	3603	36
1065	ศรีสำราญ	คอนสวรรค์	36140	360309	3603	36
1066	หนองขาม	คอนสวรรค์	36140	360308	3603	36
1067	ห้วยไร่	คอนสวรรค์	36140	360305	3603	36
1220	เกาะเอียง	ปะทิว		false	8603	86
1068	โคกมั่งงอย	คอนสวรรค์	36140	360307	3603	36
1069	โนนสะอาด	คอนสวรรค์	36140	360304	3603	36
1070	คอนสาร	คอนสาร	36180	361301	3613	36
1071	ดงกลาง	คอนสาร	36180	361308	3613	36
1072	ดงบัง	คอนสาร	36180	361306	3613	36
1073	ทุ่งนาเลา	คอนสาร	36180	361307	3613	36
1074	ทุ่งพระ	คอนสาร	36180	361302	3613	36
1075	ทุ่งลุยลาย	คอนสาร	36180	361305	3613	36
1076	ห้วยยาง	คอนสาร	36180	361304	3613	36
1077	โนนคูณ	คอนสาร	36180	361303	3613	36
1078	กุดน้ำใส	จัตุรัส	36130	360605	3606	36
1079	บ้านกอก	จัตุรัส	36130	360601	3606	36
1080	บ้านขาม	จัตุรัส	36130	360603	3606	36
1081	ละหาน	จัตุรัส	36130	360607	3606	36
1082	ส้มป่อย	จัตุรัส	36130	360613	3606	36
1083	หนองบัวบาน	จัตุรัส	36130	360602	3606	36
1084	หนองบัวโคก	จัตุรัส	36220	360611	3606	36
1085	หนองบัวใหญ่	จัตุรัส	36130	360610	3606	36
1086	หนองโดน	จัตุรัส	36130	360606	3606	36
1087	ซับใหญ่	ซับใหญ่	36130	360614	3616	36
1088	ตะโกทอง	ซับใหญ่	36130	360616	3616	36
1089	ท่ากูบ	ซับใหญ่	36130	360612	3616	36
1090	บ้านชวน	บำเหน็จณรงค์	36160	360701	3607	36
1091	บ้านตาล	บำเหน็จณรงค์	36220	360703	3607	36
1092	บ้านเพชร	บำเหน็จณรงค์	36160	360702	3607	36
1093	หัวทะเล	บำเหน็จณรงค์	36220	360704	3607	36
1094	เกาะมะนาว	บำเหน็จณรงค์	36160	360706	3607	36
1095	โคกเพชรพัฒนา	บำเหน็จณรงค์	36160	360707	3607	36
1096	โคกเริงรมย์	บำเหน็จณรงค์	36160	360705	3607	36
1097	ชีบน	บ้านเขว้า	36170	360204	3602	36
1098	ตลาดแร้ง	บ้านเขว้า	36170	360202	3602	36
1099	บ้านเขว้า	บ้านเขว้า	36170	360201	3602	36
1100	ภูแลนคา	บ้านเขว้า	36170	360205	3602	36
1101	ลุ่มลำชี	บ้านเขว้า	36170	360203	3602	36
1102	โนนแดง	บ้านเขว้า	36170	360206	3602	36
1103	บ้านเต่า	บ้านแท่น	36190	361104	3611	36
1104	บ้านแท่น	บ้านแท่น	36190	361101	3611	36
1105	สระพัง	บ้านแท่น	36190	361103	3611	36
1106	สามสวน	บ้านแท่น	36190	361102	3611	36
1107	หนองคู	บ้านแท่น	36190	361105	3611	36
1108	บ้านเจียง	ภักดีชุมพล	36260	360199	3614	36
1109	วังทอง	ภักดีชุมพล	36260	360510	3614	36
1110	เจาทอง	ภักดีชุมพล	36260	360198	3614	36
1111	แหลมทอง	ภักดีชุมพล	36260	361404	3614	36
1112	กวางโจน	ภูเขียว	36110	361002	3610	36
1113	กุดยม	ภูเขียว	36110	361005	3610	36
1114	ธาตุทอง	ภูเขียว	36110	361010	3610	36
1115	บ้านดอน	ภูเขียว	36110	361011	3610	36
1116	บ้านเพชร	ภูเขียว	36110	360702	3610	36
1117	บ้านแก้ง	ภูเขียว	36110	361004	3610	36
1118	ผักปัง	ภูเขียว	36110	361001	3610	36
1119	หนองคอนไทย	ภูเขียว	36110	361003	3610	36
1120	หนองตูม	ภูเขียว	36110	361008	3610	36
1121	โคกสะอาด	ภูเขียว	36110	360804	3610	36
1122	โอโล	ภูเขียว	36110	361009	3610	36
1123	วังตะเฆ่	หนองบัวระเหว	36250	360802	3608	36
1124	หนองบัวระเหว	หนองบัวระเหว	36250	360801	3608	36
1125	ห้วยแย้	หนองบัวระเหว	36250	360803	3608	36
1126	โคกสะอาด	หนองบัวระเหว	36250	360804	3608	36
1127	โสกปลาดุก	หนองบัวระเหว	36250	360805	3608	36
1128	กุดชุมแสง	หนองบัวแดง	36210	360502	3605	36
1129	คูเมือง	หนองบัวแดง	36210	360508	3605	36
1130	ถ้ำวัวแดง	หนองบัวแดง	36210	360503	3605	36
1131	ท่าใหญ่	หนองบัวแดง	36210	360509	3605	36
1132	นางแดด	หนองบัวแดง	36210	360504	3605	36
1133	วังชมภู	หนองบัวแดง	36210	360511	3605	36
1134	หนองบัวแดง	หนองบัวแดง	36210	360501	3605	36
1135	หนองแวง	หนองบัวแดง	36210	360507	3605	36
1136	กุดเลาะ	เกษตรสมบูรณ์	36120	360405	3604	36
1137	บ้านบัว	เกษตรสมบูรณ์	36120	360410	3604	36
1138	บ้านยาง	เกษตรสมบูรณ์	36120	360401	3604	36
1139	บ้านหัน	เกษตรสมบูรณ์	36120	360402	3604	36
1140	บ้านเดื่อ	เกษตรสมบูรณ์	36120	360403	3604	36
1141	บ้านเป้า	เกษตรสมบูรณ์	36120	360404	3604	36
1142	สระโพนทอง	เกษตรสมบูรณ์	36120	360407	3604	36
1143	หนองข่า	เกษตรสมบูรณ์	36120	360408	3604	36
1144	หนองโพนงาม	เกษตรสมบูรณ์	36120	360409	3604	36
1145	โนนกอก	เกษตรสมบูรณ์	36120	360406	3604	36
1146	โนนทอง	เกษตรสมบูรณ์	36120	360412	3604	36
1147	นายางกลัก	เทพสถิต	36230	360797	3609	36
1148	บ้านไร่	เทพสถิต	36230	360796	3609	36
1149	วะตะแบก	เทพสถิต	36230	360799	3609	36
1150	ห้วยยายจิ๋ว	เทพสถิต	36230	360798	3609	36
1151	โป่งนก	เทพสถิต	36230	360905	3609	36
1152	กะฮาด	เนินสง่า	36130	360609	3615	36
1153	ตาเนิน	เนินสง่า	36130	360608	3615	36
1154	รังงาม	เนินสง่า	36130	360615	3615	36
1155	หนองฉิม	เนินสง่า	36130	360604	3615	36
1156	กุดตุ้ม	เมืองชัยภูมิ	36000	360106	3601	36
1157	ชีลอง	เมืองชัยภูมิ	36000	360107	3601	36
1158	ซับสีทอง	เมืองชัยภูมิ	36000	360119	3601	36
1159	ท่าหินโงม	เมืองชัยภูมิ	36000	360113	3601	36
1160	นาฝาย	เมืองชัยภูมิ	36000	360104	3601	36
1161	นาเสียว	เมืองชัยภูมิ	36000	360109	3601	36
1162	บุ่งคล้า	เมืองชัยภูมิ	36000	360118	3601	36
1163	บ้านค่าย	เมืองชัยภูมิ	36240	360105	3601	36
1164	บ้านเล่า	เมืองชัยภูมิ	36000	360108	3601	36
1165	รอบเมือง	เมืองชัยภูมิ	36000	360102	3601	36
1166	ลาดใหญ่	เมืองชัยภูมิ	36000	360111	3601	36
1167	หนองนาแซง	เมืองชัยภูมิ	36000	360110	3601	36
1168	หนองไผ่	เมืองชัยภูมิ	36240	360112	3601	36
1169	ห้วยต้อน	เมืองชัยภูมิ	36000	360114	3601	36
1170	ห้วยบง	เมืองชัยภูมิ	36000	360115	3601	36
1171	โคกสูง	เมืองชัยภูมิ	36000	360117	3601	36
1172	โนนสำราญ	เมืองชัยภูมิ	36240	360116	3601	36
1173	โพนทอง	เมืองชัยภูมิ	36000	360103	3601	36
1174	ในเมือง	เมืองชัยภูมิ	36000	360101	3601	36
1175	ช่องสามหมอ	แก้งคร้อ	36150	360303	3612	36
1176	ท่ามะไฟหวาน	แก้งคร้อ	36150	361209	3612	36
1177	นาหนองทุ่ม	แก้งคร้อ	36150	361203	3612	36
1178	บ้านแก้ง	แก้งคร้อ	36150	361004	3612	36
1179	หนองขาม	แก้งคร้อ	36150	360308	3612	36
1180	หนองสังข์	แก้งคร้อ	36150	361205	3612	36
1181	หนองไผ่	แก้งคร้อ	36150	360112	3612	36
1182	หลุบคา	แก้งคร้อ	36150	361206	3612	36
1183	เก่าย่าดี	แก้งคร้อ	36150	361208	3612	36
1184	โคกกุง	แก้งคร้อ	36150	361207	3612	36
1185	ช่องไม้แก้ว	ทุ่งตะโก	86220	860804	8608	86
1186	ตะโก	ทุ่งตะโก	86220	860803	8608	86
1187	ทุ่งตะไคร	ทุ่งตะโก	86220	860802	8608	86
1188	ปากตะโก	ทุ่งตะโก	86220	860801	8608	86
1189	หมู่เกาะศรีอบยา	ทุ่งตะโก		false	8608	86
1190	เกาะขี้นก	ทุ่งตะโก		false	8608	86
1191	เกาะคราม	ทุ่งตะโก		false	8608	86
1192	เกาะคางสือ	ทุ่งตะโก		false	8608	86
1193	เกาะมะพร้าว	ทุ่งตะโก		false	8608	86
1194	เกาะมุก	ทุ่งตะโก		false	8608	86
1195	เกาะยอ	ทุ่งตะโก		false	8608	86
1196	เกาะรางบรรทัด	ทุ่งตะโก		false	8608	86
1197	เกาะสูบ	ทุ่งตะโก		false	8608	86
1198	คุริง	ท่าแซะ	86140	860202	8602	86
1199	ทรัพย์อนันต์	ท่าแซะ	86140	860209	8602	86
1200	ท่าข้าม	ท่าแซะ	86140	860206	8602	86
1201	ท่าแซะ	ท่าแซะ	86140	860201	8602	86
1202	นากระตาม	ท่าแซะ	86140	860204	8602	86
1203	รับร่อ	ท่าแซะ	86190	860205	8602	86
1204	สลุย	ท่าแซะ	86140	860203	8602	86
1205	สองพี่น้อง	ท่าแซะ	86140	860210	8602	86
1206	หงษ์เจริญ	ท่าแซะ	86140	860207	8602	86
1207	หินแก้ว	ท่าแซะ	86190	860208	8602	86
1208	ชุมโค	ปะทิว	86160	860304	8603	86
1209	ดอนยาง	ปะทิว	86210	860305	8603	86
1210	ทะเลทรัพย์	ปะทิว	86160	860302	8603	86
1211	บางสน	ปะทิว	86160	860301	8603	86
1212	ปากคลอง	ปะทิว	86210	860306	8603	86
1213	สะพลี	ปะทิว	86230	860303	8603	86
1214	เกาะซีกง	ปะทิว		false	8603	86
1215	เกาะพระ	ปะทิว		false	8603	86
1216	เกาะยอ	ปะทิว		false	8603	86
1217	เกาะรัง	ปะทิว		false	8603	86
1218	เกาะร้านเป็ด	ปะทิว		false	8603	86
1219	เกาะร้านไก่	ปะทิว		false	8603	86
1221	เกาะไข่	ปะทิว		false	8603	86
1222	เขาไชยราช	ปะทิว	86210	860307	8603	86
1223	ปังหวาน	พะโต๊ะ	86180	860603	8606	86
1224	ปากทรง	พะโต๊ะ	86180	860602	8606	86
1225	พระรักษ์	พะโต๊ะ	86180	860604	8606	86
1226	พะโต๊ะ	พะโต๊ะ	86180	860601	8606	86
1227	ทุ่งคาวัด	ละแม	86170	860504	8605	86
1228	ทุ่งหลวง	ละแม	86170	860502	8605	86
1229	ละแม	ละแม	86170	860501	8605	86
1230	สวนแตง	ละแม	86170	860503	8605	86
1231	ครน	สวี	86130	860707	8607	86
1232	ด่านสวี	สวี	86130	860706	8607	86
1233	ทุ่งระยะ	สวี	86130	860703	8607	86
1234	ท่าหิน	สวี	86130	860704	8607	86
1235	นาสัก	สวี	86130	860709	8607	86
1236	นาโพธิ์	สวี	86130	860701	8607	86
1237	ปากแพรก	สวี	86130	860705	8607	86
1238	วิสัยใต้	สวี	86130	860708	8607	86
1239	สวี	สวี	86130	860702	8607	86
1240	เกาะกระ	สวี		false	8607	86
1241	เกาะกุลา	สวี		false	8607	86
1242	เกาะทองแก้ว	สวี		false	8607	86
1243	เกาะบาตร์	สวี		false	8607	86
1244	เกาะพัดหวายเล็ก	สวี		false	8607	86
1245	เกาะพัดหวายใหญ่	สวี		false	8607	86
1246	เกาะยูง	สวี		false	8607	86
1247	เกาะหนู	สวี		false	8607	86
1248	เกาะแมว	สวี		false	8607	86
1249	เกาะแรด	สวี		false	8607	86
1250	เขาค่าย	สวี	86130	860711	8607	86
1251	เขาทะลุ	สวี	86130	860710	8607	86
1252	ขันเงิน	หลังสวน	86110	860402	8604	86
1253	ท่ามะพลา	หลังสวน	86110	860403	8604	86
1254	นาขา	หลังสวน	86110	860404	8604	86
1255	นาพญา	หลังสวน	86110	860405	8604	86
1256	บางน้ำจืด	หลังสวน	86150	860408	8604	86
1257	บางมะพร้าว	หลังสวน	86110	860407	8604	86
1258	บ้านควน	หลังสวน	86110	860406	8604	86
1259	ปากน้ำ	หลังสวน	86150	860102	8604	86
1260	พ้อแดง	หลังสวน	86110	860410	8604	86
1261	วังตะกอ	หลังสวน	86110	860412	8604	86
1262	หลังสวน	หลังสวน	86110	860401	8604	86
1263	หาดยาย	หลังสวน	86110	860413	8604	86
1264	เกาะพิทักษ์	หลังสวน		false	8604	86
1265	แหลมทราย	หลังสวน	86110	860411	8604	86
1266	ขุนกระทิง	เมืองชุมพร	86190	860113	8601	86
1267	ตากแดด	เมืองชุมพร	86000	860107	8601	86
1268	ถ้ำสิงห์	เมืองชุมพร	86100	860117	8601	86
1269	ทุ่งคา	เมืองชุมพร	86100	860114	8601	86
1270	ท่าตะเภา	เมืองชุมพร	86000	860101	8601	86
1271	ท่ายาง	เมืองชุมพร	86000	860103	8601	86
1272	นาชะอัง	เมืองชุมพร	86000	860106	8601	86
1273	นาทุ่ง	เมืองชุมพร	86000	860105	8601	86
1274	บางลึก	เมืองชุมพร	86000	860108	8601	86
1275	บางหมาก	เมืองชุมพร	86000	860104	8601	86
1276	บ้านนา	เมืองชุมพร	86190	860112	8601	86
1277	ปากน้ำ	เมืองชุมพร	86120	860102	8601	86
1278	วังใหม่	เมืองชุมพร	86190	860111	8601	86
1279	วังไผ่	เมืองชุมพร	86000	860110	8601	86
1280	วิสัยเหนือ	เมืองชุมพร	86100	860115	8601	86
1281	หาดทรายรี	เมืองชุมพร	86120	860116	8601	86
1282	หาดพันไกร	เมืองชุมพร	86000	860109	8601	86
1283	เกาะกา	เมืองชุมพร		false	8601	86
1284	เกาะกินหลักง้ำ	เมืองชุมพร		false	8601	86
1285	เกาะงามเล็ก	เมืองชุมพร		false	8601	86
1286	เกาะงามใหญ่	เมืองชุมพร		false	8601	86
1287	เกาะทองหลาง	เมืองชุมพร		false	8601	86
1288	เกาะทะลุ	เมืองชุมพร		false	8601	86
1289	เกาะมะพร้าว	เมืองชุมพร		false	8601	86
1290	เกาะมัตโพน	เมืองชุมพร		false	8601	86
1291	เกาะมาตรา	เมืองชุมพร		false	8601	86
1292	เกาะรังกาจิว	เมืองชุมพร		false	8601	86
1293	เกาะละวะ	เมืองชุมพร		false	8601	86
1294	เกาะสาก	เมืองชุมพร		false	8601	86
1295	เกาะหลักแรด	เมืองชุมพร		false	8601	86
1296	เกาะอีแรด	เมืองชุมพร		false	8601	86
1297	เกาะเสม็ด	เมืองชุมพร		false	8601	86
1298	กันตัง	กันตัง	92110	920201	9202	92
1299	กันตังใต้	กันตัง	92110	920206	9202	92
1300	คลองชีล้อม	กันตัง	92110	920214	9202	92
1301	คลองลุ	กันตัง	92110	920208	9202	92
1302	ควนธานี	กันตัง	92110	920202	9202	92
1303	นาเกลือ	กันตัง	92110	920212	9202	92
1304	บางสัก	กันตัง	92110	920211	9202	92
1305	บางหมาก	กันตัง	92110	920203	9202	92
1306	บางเป้า	กันตัง	92110	920204	9202	92
1307	บ่อน้ำร้อน	กันตัง	92110	920210	9202	92
1308	ย่านซื่อ	กันตัง	92110	920209	9202	92
1309	วังวน	กันตัง	92110	920205	9202	92
1310	เกาะลิบง	กันตัง	92110	920213	9202	92
1311	โคกยาง	กันตัง	92110	920207	9202	92
1312	ช่อง	นาโยง	92170	920121	9208	92
1313	นาข้าวเสีย	นาโยง	92170	920111	9208	92
1314	นาหมื่นศรี	นาโยง	92170	920112	9208	92
1315	นาโยงเหนือ	นาโยง	92170	920116	9208	92
1316	ละมอ	นาโยง	92170	920103	9208	92
1317	โคกสะบ้า	นาโยง	92170	920102	9208	92
1318	ทุ่งยาว	ปะเหลียน	92180	920402	9204	92
1319	ท่าข้าม	ปะเหลียน	92120	920401	9204	92
1320	ท่าพญา	ปะเหลียน	92140	920412	9204	92
1321	บางด้วน	ปะเหลียน	92140	920404	9204	92
1322	บ้านนา	ปะเหลียน	92140	920407	9204	92
1323	ปะเหลียน	ปะเหลียน	92180	920403	9204	92
1324	ลิพัง	ปะเหลียน	92180	920410	9204	92
1325	สุโสะ	ปะเหลียน	92120	920409	9204	92
1326	เกาะสุกร	ปะเหลียน	92120	920411	9204	92
1327	แหลมสอม	ปะเหลียน	92180	920413	9204	92
1328	ทุ่งกระบือ	ย่านตาขาว	92140	920306	9203	92
1329	ทุ่งค่าย	ย่านตาขาว	92140	920307	9203	92
1330	นาชุมเห็ด	ย่านตาขาว	92140	920303	9203	92
1331	ย่านตาขาว	ย่านตาขาว	92140	920301	9203	92
1332	หนองบ่อ	ย่านตาขาว	92140	920302	9203	92
1333	เกาะเปียะ	ย่านตาขาว	92140	920308	9203	92
1334	โพรงจระเข้	ย่านตาขาว	92140	920305	9203	92
1335	ในควน	ย่านตาขาว	92140	920304	9203	92
1336	คลองปาง	รัษฎา	92160	920612	9209	92
1337	ควนเมา	รัษฎา	92160	920613	9209	92
1338	หนองบัว	รัษฎา	92160	920604	9209	92
1339	หนองปรือ	รัษฎา	92130	920603	9209	92
1340	เขาไพร	รัษฎา	92160	920618	9209	92
1341	ท่าสะบ้า	วังวิเศษ	92000	920595	9207	92
1342	วังมะปราง	วังวิเศษ	92220	920598	9207	92
1343	วังมะปรางเหนือ	วังวิเศษ	92220	920705	9207	92
1344	อ่าวตง	วังวิเศษ	92220	920597	9207	92
1345	เขาวิเศษ	วังวิเศษ	92220	920599	9207	92
1346	กะลาเส	สิเกา	92150	920503	9205	92
1347	นาเมืองเพชร	สิเกา	92000	920505	9205	92
1348	บ่อหิน	สิเกา	92150	920501	9205	92
1349	เขาไม้แก้ว	สิเกา	92150	920502	9205	92
1350	ไม้ฝาด	สิเกา	92150	920504	9205	92
1351	ตะเสะ	หาดสำราญ	92120	920406	9210	92
1352	บ้าหวี	หาดสำราญ	92120	920408	9210	92
1353	หาดสำราญ	หาดสำราญ	92120	920405	9210	92
1354	ทุ่งต่อ	ห้วยยอด	92130	920620	9206	92
1355	ท่างิ้ว	ห้วยยอด	92130	920614	9206	92
1356	นาวง	ห้วยยอด	92210	920616	9206	92
1357	บางกุ้ง	ห้วยยอด	92210	920606	9206	92
1358	บางดี	ห้วยยอด	92210	920605	9206	92
1359	ปากคม	ห้วยยอด	92130	920611	9206	92
1360	ปากแจ่ม	ห้วยยอด	92190	920610	9206	92
1361	ลำภูรา	ห้วยยอด	92190	920615	9206	92
1362	วังคีรี	ห้วยยอด	92210	920621	9206	92
1363	หนองช้างแล่น	ห้วยยอด	92130	920602	9206	92
1364	ห้วยนาง	ห้วยยอด	92130	920617	9206	92
1365	ห้วยยอด	ห้วยยอด	92130	920601	9206	92
1366	เขากอบ	ห้วยยอด	92130	920607	9206	92
1367	เขาขาว	ห้วยยอด	92130	920608	9206	92
1368	เขาปูน	ห้วยยอด	92130	920609	9206	92
1369	ในเตา	ห้วยยอด	92130	920619	9206	92
1370	ควนปริง	เมืองตรัง	92000	920107	9201	92
1371	ทับเที่ยง	เมืองตรัง	92000	920101	9201	92
1372	นาตาล่วง	เมืองตรัง	92000	920117	9201	92
1373	นาท่ามเหนือ	เมืองตรัง	92190	920119	9201	92
1374	นาท่ามใต้	เมืองตรัง	92190	920120	9201	92
1375	นาบินหลา	เมืองตรัง	92170	920106	9201	92
1376	นาพละ	เมืองตรัง	92000	920104	9201	92
1377	นาโต๊ะหมิง	เมืองตรัง	92000	920113	9201	92
1378	นาโยงใต้	เมืองตรัง	92170	920108	9201	92
1379	น้ำผุด	เมืองตรัง	92000	920115	9201	92
1380	บางรัก	เมืองตรัง	92000	920109	9201	92
1381	บ้านควน	เมืองตรัง	92000	920105	9201	92
1382	บ้านโพธิ์	เมืองตรัง	92000	920118	9201	92
1383	หนองตรุด	เมืองตรัง	92000	920114	9201	92
1384	โคกหล่อ	เมืองตรัง	92000	920110	9201	92
1385	คลองใหญ่	คลองใหญ่	23110	230201	2302	23
1386	หาดเล็ก	คลองใหญ่	23110	230203	2302	23
1387	ไม้รูด	คลองใหญ่	23110	230202	2302	23
1388	ช้างทูน	บ่อไร่	23140	230398	2304	23
1389	ด่านชุมพล	บ่อไร่	23140	230396	2304	23
1390	นนทรีย์	บ่อไร่	23140	230405	2304	23
1391	บ่อพลอย	บ่อไร่	23140	230399	2304	23
1392	หนองบอน	บ่อไร่	23140	230397	2304	23
1393	เกาะกูด	เกาะกูด	23000	230506	2306	23
1394	เกาะหมาก	เกาะกูด	23000	230505	2306	23
1395	เกาะช้าง	เกาะช้าง	23170	230504	2307	23
1396	เกาะช้างใต้	เกาะช้าง	23170	230508	2307	23
1397	ทุ่งนนทรี	เขาสมิง	23130	230308	2303	23
1398	ท่าโสม	เขาสมิง	23150	230304	2303	23
1399	ประณีต	เขาสมิง	23150	230306	2303	23
1400	วังตะเคียน	เขาสมิง	23130	230303	2303	23
1401	สะตอ	เขาสมิง	23150	230305	2303	23
1402	เขาสมิง	เขาสมิง	23130	230301	2303	23
1403	เทพนิมิต	เขาสมิง	23150	230307	2303	23
1404	แสนตุ้ง	เขาสมิง	23150	230302	2303	23
1405	ชำราก	เมืองตราด	23000	230113	2301	23
1406	ตะกาง	เมืองตราด	23000	230112	2301	23
1407	ท่ากุ่ม	เมืองตราด	23000	230111	2301	23
1408	ท่าพริก	เมืองตราด	23000	230110	2301	23
1409	บางพระ	เมืองตราด	23000	230101	2301	23
1410	วังกระแจะ	เมืองตราด	23000	230107	2301	23
1411	หนองคันทรง	เมืองตราด	23000	230104	2301	23
1412	หนองเสม็ด	เมืองตราด	23000	230102	2301	23
1413	หนองโสน	เมืองตราด	23000	230103	2301	23
1414	ห้วงน้ำขาว	เมืองตราด	23000	230105	2301	23
1415	ห้วยแร้ง	เมืองตราด	23000	230108	2301	23
1416	อ่าวใหญ่	เมืองตราด	23000	230106	2301	23
1417	เนินทราย	เมืองตราด	23000	230109	2301	23
1418	แหลมกลัด	เมืองตราด	23000	230114	2301	23
1419	คลองใหญ่	แหลมงอบ	23120	230201	2305	23
1420	น้ำเชี่ยว	แหลมงอบ	23120	230502	2305	23
1421	บางปิด	แหลมงอบ	23120	230503	2305	23
1422	แหลมงอบ	แหลมงอบ	23120	230501	2305	23
1423	ท่าสองยาง	ท่าสองยาง	63150	630501	6305	63
1424	แม่ต้าน	ท่าสองยาง	63150	630502	6305	63
1425	แม่วะหลวง	ท่าสองยาง	63150	630505	6305	63
1426	แม่สอง	ท่าสองยาง	63150	630503	6305	63
1427	แม่หละ	ท่าสองยาง	63150	630504	6305	63
1428	แม่อุสุ	ท่าสองยาง	63150	630506	6305	63
1429	ตากตก	บ้านตาก	63120	630204	6302	63
1430	ตากออก	บ้านตาก	63120	630201	6302	63
1431	ทุ่งกระเชาะ	บ้านตาก	63120	630206	6302	63
1432	ท้องฟ้า	บ้านตาก	63120	630207	6302	63
1433	สมอโคน	บ้านตาก	63120	630202	6302	63
1434	เกาะตะเภา	บ้านตาก	63120	630205	6302	63
1435	แม่สลิด	บ้านตาก	63120	630203	6302	63
1436	คีรีราษฎร์	พบพระ	63160	630703	6307	63
1437	ช่องแคบ	พบพระ	63160	630702	6307	63
1438	พบพระ	พบพระ	63160	630701	6307	63
1439	รวมไทยพัฒนา	พบพระ	63160	630705	6307	63
1440	วาเล่ย์	พบพระ	63160	630704	6307	63
1441	นาโบสถ์	วังเจ้า	63180	630116	6309	63
1442	ประดาง	วังเจ้า	63180	630117	6309	63
1443	เชียงทอง	วังเจ้า	63180	630110	6309	63
1444	บ้านนา	สามเงา	63130	630305	6303	63
1445	ยกกระบัตร	สามเงา	63130	630303	6303	63
1446	ย่านรี	สามเงา	63130	630304	6303	63
1447	วังจันทร์	สามเงา	63130	630306	6303	63
1448	วังหมัน	สามเงา	63130	630302	6303	63
1449	สามเงา	สามเงา	63130	630301	6303	63
1450	หนองหลวง	อุ้มผาง	63170	630102	6308	63
1451	อุ้มผาง	อุ้มผาง	63170	630801	6308	63
1452	แม่กลอง	อุ้มผาง	63170	630806	6308	63
1453	แม่จัน	อุ้มผาง	63170	630804	6308	63
1454	แม่ละมุ้ง	อุ้มผาง	63170	630805	6308	63
1455	โมโกร	อุ้มผาง	63170	630803	6308	63
1456	ตลุกกลางทุ่ง	เมืองตาก	63000	630115	6301	63
1457	น้ำรึม	เมืองตาก	63000	630108	6301	63
1458	ป่ามะม่วง	เมืองตาก	63000	630112	6301	63
1459	ระแหง	เมืองตาก	63000	630101	6301	63
1460	วังประจบ	เมืองตาก	63000	630114	6301	63
1461	วังหิน	เมืองตาก	63000	630109	6301	63
1462	หนองบัวเหนือ	เมืองตาก	63000	630105	6301	63
1463	หนองบัวใต้	เมืองตาก	63000	630113	6301	63
1464	หนองหลวง	เมืองตาก	63000	630102	6301	63
1465	หัวเดียด	เมืองตาก	63000	630104	6301	63
1466	เชียงเงิน	เมืองตาก	63000	630103	6301	63
1467	แม่ท้อ	เมืองตาก	63000	630111	6301	63
1468	โป่งแดง	เมืองตาก	63000	630107	6301	63
1469	ไม้งาม	เมืองตาก	63000	630106	6301	63
1470	ขะเนจื้อ	แม่ระมาด	63140	630403	6304	63
1471	พระธาตุ	แม่ระมาด	63140	630406	6304	63
1472	สามหมื่น	แม่ระมาด	63140	630405	6304	63
1473	แม่จะเรา	แม่ระมาด	63140	630402	6304	63
1474	แม่ตื่น	แม่ระมาด	63140	630404	6304	63
1475	แม่ระมาด	แม่ระมาด	63140	630401	6304	63
1476	ด่านแม่ละเมา	แม่สอด	63110	630609	6306	63
1477	ท่าสายลวด	แม่สอด	63110	630606	6306	63
1478	พระธาตุผาแดง	แม่สอด	63110	630610	6306	63
1479	พะวอ	แม่สอด	63110	630603	6306	63
1480	มหาวัน	แม่สอด	63110	630608	6306	63
1481	แม่กาษา	แม่สอด	63110	630605	6306	63
1482	แม่กุ	แม่สอด	63110	630602	6306	63
1483	แม่ตาว	แม่สอด	63110	630604	6306	63
1484	แม่ปะ	แม่สอด	63110	630607	6306	63
1485	แม่สอด	แม่สอด	63110	630601	6306	63
1486	ทองหลาง	บ้านนา	26110	260305	2603	26
1487	บางอ้อ	บ้านนา	26110	260306	2603	26
1488	บ้านนา	บ้านนา	26110	260301	2603	26
1489	บ้านพริก	บ้านนา	26110	260303	2603	26
1490	บ้านพร้าว	บ้านนา	26110	260302	2603	26
1491	ป่าขะ	บ้านนา	26110	260308	2603	26
1492	พิกุลออก	บ้านนา	26110	260307	2603	26
1493	ศรีกะอาง	บ้านนา	26110	260310	2603	26
1494	อาษา	บ้านนา	26110	260304	2603	26
1495	เขาเพิ่ม	บ้านนา	26110	260309	2603	26
1496	ท่าเรือ	ปากพลี	26130	260205	2602	26
1497	นาหินลาด	ปากพลี	26130	260207	2602	26
1498	ปากพลี	ปากพลี	26130	260203	2602	26
1499	หนองแสง	ปากพลี	26130	260206	2602	26
1500	เกาะหวาย	ปากพลี	26130	260201	2602	26
1501	เกาะโพธิ์	ปากพลี	26130	260202	2602	26
1502	โคกกรวด	ปากพลี	26130	260204	2602	26
1503	คลองใหญ่	องครักษ์	26120	260411	2604	26
1504	ชุมพล	องครักษ์	26120	260410	2604	26
1505	ทรายมูล	องครักษ์	26120	260406	2604	26
1506	บางปลากด	องครักษ์	26120	260407	2604	26
1507	บางลูกเสือ	องครักษ์	26120	260408	2604	26
1508	บางสมบูรณ์	องครักษ์	26120	260405	2604	26
1509	บึงศาล	องครักษ์	26120	260402	2604	26
1510	พระอาจารย์	องครักษ์	26120	260401	2604	26
1511	ศีรษะกระบือ	องครักษ์	26120	260403	2604	26
1512	องครักษ์	องครักษ์	26120	260409	2604	26
1513	โพธิ์แทน	องครักษ์	26120	260404	2604	26
1514	ดงละคร	เมืองนครนายก	26000	260108	2601	26
1515	ดอนยอ	เมืองนครนายก	26000	260106	2601	26
1516	ท่าช้าง	เมืองนครนายก	26000	260102	2601	26
1517	ท่าทราย	เมืองนครนายก	26000	260105	2601	26
1518	นครนายก	เมืองนครนายก	26000	260101	2601	26
1519	บ้านใหญ่	เมืองนครนายก	26000	260103	2601	26
1520	พรหมณี	เมืองนครนายก	26000	260113	2601	26
1521	วังกระโจม	เมืองนครนายก	26000	260104	2601	26
1522	ศรีจุฬา	เมืองนครนายก	26000	260107	2601	26
1523	ศรีนาวา	เมืองนครนายก	26000	260109	2601	26
1524	สาริกา	เมืองนครนายก	26000	260110	2601	26
1525	หินตั้ง	เมืองนครนายก	26000	260111	2601	26
1526	เขาพระ	เมืองนครนายก	26000	260112	2601	26
1527	กระตีบ	กำแพงแสน	73180	730202	7302	73
1528	กำแพงแสน	กำแพงแสน	73140	730212	7302	73
1529	ดอนข่อย	กำแพงแสน	73140	730208	7302	73
1530	ทุ่งกระพังโหม	กำแพงแสน	73140	730201	7302	73
1531	ทุ่งขวาง	กำแพงแสน	73140	730205	7302	73
1532	ทุ่งบัว	กำแพงแสน	73140	730207	7302	73
1533	ทุ่งลูกนก	กำแพงแสน	73140	730203	7302	73
1534	รางพิกุล	กำแพงแสน	73140	730213	7302	73
1535	วังน้ำเขียว	กำแพงแสน	73140	730215	7302	73
1536	สระพัฒนา	กำแพงแสน	73180	730209	7302	73
1537	สระสี่มุม	กำแพงแสน	73140	730206	7302	73
1538	หนองกระทุ่ม	กำแพงแสน	73140	730214	7302	73
1539	ห้วยขวาง	กำแพงแสน	73140	730204	7302	73
1540	ห้วยม่วง	กำแพงแสน	73180	730211	7302	73
1541	ห้วยหมอนทอง	กำแพงแสน	73140	730210	7302	73
1542	ดอนพุทรา	ดอนตูม	73150	730404	7304	73
1543	ดอนรวก	ดอนตูม	73150	730406	7304	73
1544	บ้านหลวง	ดอนตูม	73150	730405	7304	73
1545	ลำลูกบัว	ดอนตูม	73150	730408	7304	73
1546	ลำเหย	ดอนตูม	73150	730403	7304	73
1547	สามง่าม	ดอนตูม	73150	730401	7304	73
1548	ห้วยด้วน	ดอนตูม	73150	730407	7304	73
1549	ห้วยพระ	ดอนตูม	73150	730402	7304	73
1550	ขุนแก้ว	นครชัยศรี	73120	730307	7303	73
1551	งิ้วราย	นครชัยศรี	73120	730323	7303	73
1552	ดอนแฝก	นครชัยศรี	73120	730317	7303	73
1553	ท่ากระชับ	นครชัยศรี	73120	730306	7303	73
1554	ท่าตำหนัก	นครชัยศรี	73120	730304	7303	73
1555	ท่าพระยา	นครชัยศรี	73120	730308	7303	73
1556	นครชัยศรี	นครชัยศรี	73120	730301	7303	73
1557	บางกระเบา	นครชัยศรี	73120	730302	7303	73
1558	บางพระ	นครชัยศรี	73120	730320	7303	73
1559	บางระกำ	นครชัยศรี	73120	730310	7303	73
1560	บางแก้ว	นครชัยศรี	73120	730305	7303	73
1561	บางแก้วฟ้า	นครชัยศรี	73120	730321	7303	73
1562	พะเนียด	นครชัยศรี	73120	730309	7303	73
1563	ลานตากฟ้า	นครชัยศรี	73120	730322	7303	73
1564	วัดละมุด	นครชัยศรี	73120	730319	7303	73
1565	วัดสำโรง	นครชัยศรี	73120	730316	7303	73
1566	วัดแค	นครชัยศรี	73120	730303	7303	73
1567	ศรีมหาโพธิ์	นครชัยศรี	73120	730314	7303	73
1568	ศรีษะทอง	นครชัยศรี	73120	730312	7303	73
1569	สัมปทวน	นครชัยศรี	73120	730315	7303	73
1570	ห้วยพลู	นครชัยศรี	73120	730318	7303	73
1571	แหลมบัว	นครชัยศรี	73120	730313	7303	73
1572	โคกพระเจดีย์	นครชัยศรี	73120	730311	7303	73
1573	ไทยาวาส	นครชัยศรี	73120	730324	7303	73
1574	คลองนกกระทุง	บางเลน	73130	730512	7305	73
1575	ดอนตูม	บางเลน	73130	730509	7305	73
1576	นราภิรมย์	บางเลน	73130	730513	7305	73
1577	นิลเพชร	บางเลน	73130	730510	7305	73
1578	บัวปากท่า	บางเลน	73130	730511	7305	73
1579	บางปลา	บางเลน	73130	730502	7305	73
1580	บางภาษี	บางเลน	73130	730504	7305	73
1581	บางระกำ	บางเลน	73130	730310	7305	73
1582	บางหลวง	บางเลน	73190	730503	7305	73
1583	บางเลน	บางเลน	73130	730501	7305	73
1584	บางไทรป่า	บางเลน	73130	730506	7305	73
1585	ลำพญา	บางเลน	73130	730514	7305	73
1586	หินมูล	บางเลน	73190	730507	7305	73
1587	ไทรงาม	บางเลน	73130	730508	7305	73
1588	ไผ่หูช้าง	บางเลน	73130	730515	7305	73
1589	คลองโยง	พุทธมณฑล	73170	730327	7307	73
1590	มหาสวัสดิ์	พุทธมณฑล	73170	730326	7307	73
1591	ศาลายา	พุทธมณฑล	73170	730325	7307	73
1592	กระทุ่มล้ม	สามพราน	73220	730610	7306	73
1593	คลองจินดา	สามพราน	73110	730613	7306	73
1594	คลองใหม่	สามพราน	73110	730611	7306	73
1595	ตลาดจินดา	สามพราน	73110	730612	7306	73
1596	ทรงคนอง	สามพราน	73210	730602	7306	73
1597	ท่าข้าม	สามพราน	73110	730601	7306	73
1598	ท่าตลาด	สามพราน	73110	730609	7306	73
1599	บางกระทึก	สามพราน	73210	730604	7306	73
1600	บางช้าง	สามพราน	73110	730607	7306	73
1601	บางเตย	สามพราน	73210	730605	7306	73
1602	บ้านใหม่	สามพราน	73110	730615	7306	73
1603	ยายชา	สามพราน	73110	730614	7306	73
1604	สามพราน	สามพราน	73110	730606	7306	73
1605	หอมเกร็ด	สามพราน	73110	730603	7306	73
1606	อ้อมใหญ่	สามพราน	73160	730616	7306	73
1607	ไร่ขิง	สามพราน	73210	730608	7306	73
1608	ดอนยายหอม	เมืองนครปฐม	73000	730108	7301	73
1609	ตาก้อง	เมืองนครปฐม	73000	730105	7301	73
1610	ถนนขาด	เมืองนครปฐม	73000	730109	7301	73
1611	ทัพหลวง	เมืองนครปฐม	73000	730123	7301	73
1612	ทุ่งน้อย	เมืองนครปฐม	73000	730115	7301	73
1613	ธรรมศาลา	เมืองนครปฐม	73000	730104	7301	73
1772	หนองพลวง	จักราช	30230	300607	3006	30
1614	นครปฐม	เมืองนครปฐม	73000	730111	7301	73
1615	บางแขม	เมืองนครปฐม	73000	730102	7301	73
1616	บ่อพลับ	เมืองนครปฐม	73000	730110	7301	73
1617	บ้านยาง	เมืองนครปฐม	73000	730125	7301	73
1618	พระปฐมเจดีย์	เมืองนครปฐม	73000	730101	7301	73
1619	พระประโทน	เมืองนครปฐม	73000	730103	7301	73
1620	มาบแค	เมืองนครปฐม	73000	730106	7301	73
1621	ลำพยา	เมืองนครปฐม	73000	730119	7301	73
1622	วังตะกู	เมืองนครปฐม	73000	730112	7301	73
1623	วังเย็น	เมืองนครปฐม	73000	730117	7301	73
1624	สนามจันทร์	เมืองนครปฐม	73000	730107	7301	73
1625	สระกะเทียม	เมืองนครปฐม	73000	730120	7301	73
1626	สวนป่าน	เมืองนครปฐม	73000	730121	7301	73
1627	สามควายเผือก	เมืองนครปฐม	73000	730114	7301	73
1628	หนองงูเหลือม	เมืองนครปฐม	73000	730124	7301	73
1629	หนองดินแดง	เมืองนครปฐม	73000	730116	7301	73
1630	หนองปากโลง	เมืองนครปฐม	73000	730113	7301	73
1631	ห้วยจรเข้	เมืองนครปฐม	73000	730122	7301	73
1632	โพรงมะเดื่อ	เมืองนครปฐม	73000	730118	7301	73
1633	ท่าจำปา	ท่าอุเทน	48120	480303	4803	48
1634	ท่าอุเทน	ท่าอุเทน	48120	480301	4803	48
1635	พนอม	ท่าอุเทน	48120	480305	4803	48
1636	พะทาย	ท่าอุเทน	48120	480306	4803	48
1637	รามราช	ท่าอุเทน	48120	480312	4803	48
1638	หนองเทา	ท่าอุเทน	48120	480314	4803	48
1639	เวินพระบาท	ท่าอุเทน	48120	480311	4803	48
1640	โนนตาล	ท่าอุเทน	48120	480302	4803	48
1641	ไชยบุรี	ท่าอุเทน	48120	480304	4803	48
1642	กุดฉิม	ธาตุพนม	48110	480511	4805	48
1643	ดอนนางหงส์	ธาตุพนม	48110	480507	4805	48
1644	ธาตุพนม	ธาตุพนม	48110	480501	4805	48
1645	ธาตุพนมเหนือ	ธาตุพนม	48110	480512	4805	48
1646	นาถ่อน	ธาตุพนม	48110	480505	4805	48
1647	นาหนาด	ธาตุพนม	48110	480510	4805	48
1648	น้ำก่ำ	ธาตุพนม	48110	480508	4805	48
1649	ฝั่งแดง	ธาตุพนม	48110	480502	4805	48
1650	พระกลางทุ่ง	ธาตุพนม	48110	480504	4805	48
1651	อุ่มเหม้า	ธาตุพนม	48110	480509	4805	48
1652	แสนพัน	ธาตุพนม	48110	480506	4805	48
1653	โพนแพง	ธาตุพนม	48110	480503	4805	48
1654	ดอนเตย	นาทม	48140	480407	4811	48
1655	นาทม	นาทม	48140	480405	4811	48
1656	หนองซน	นาทม	48140	480406	4811	48
1657	ท่าเรือ	นาหว้า	48180	480906	4809	48
1658	นาคูณใหญ่	นาหว้า	48180	480904	4809	48
1659	นางัว	นาหว้า	48180	480408	4809	48
1660	นาหว้า	นาหว้า	48180	480901	4809	48
1661	บ้านเสียว	นาหว้า	48180	480903	4809	48
1662	เหล่าพัฒนา	นาหว้า	48180	480905	4809	48
1663	ก้านเหลือง	นาแก	48130	480707	4807	48
1664	คำพี้	นาแก	48130	480713	4807	48
1665	นาคู่	นาแก	48130	480704	4807	48
1666	นาเลียง	นาแก	48130	480709	4807	48
1667	นาแก	นาแก	48130	480701	4807	48
1668	บ้านแก้ง	นาแก	48130	480712	4807	48
1669	พระซอง	นาแก	48130	480702	4807	48
1670	พิมาน	นาแก	48130	480705	4807	48
1671	พุ่มแก	นาแก	48130	480706	4807	48
1672	สีชมพู	นาแก	48130	480715	4807	48
1673	หนองบ่อ	นาแก	48130	480708	4807	48
1674	หนองสังข์	นาแก	48130	480703	4807	48
1675	นางัว	บ้านแพง	48140	480408	4804	48
1676	นาเข	บ้านแพง	48140	480409	4804	48
1677	บ้านแพง	บ้านแพง	48140	480401	4804	48
1678	หนองแวง	บ้านแพง	48140	480404	4804	48
1679	โพนทอง	บ้านแพง	48140	480403	4804	48
1680	ไผ่ล้อม	บ้านแพง	48140	480402	4804	48
1681	กุตาไก้	ปลาปาก	48160	480203	4802	48
1682	นามะเขือ	ปลาปาก	48160	480207	4802	48
1683	ปลาปาก	ปลาปาก	48160	480201	4802	48
1684	มหาชัย	ปลาปาก	48160	480206	4802	48
1685	หนองฮี	ปลาปาก	48160	480202	4802	48
1686	หนองเทาใหญ่	ปลาปาก	48160	480208	4802	48
1687	โคกสว่าง	ปลาปาก	48160	480204	4802	48
1688	โคกสูง	ปลาปาก	48160	480205	4802	48
1689	ยอดชาด	วังยาง	48130	480714	4812	48
1690	วังยาง	วังยาง	48130	480711	4812	48
1691	หนองโพธิ์	วังยาง	48130	480716	4812	48
1692	โคกสี	วังยาง	48130	480710	4812	48
1693	ท่าบ่อสงคราม	ศรีสงคราม	48150	480805	4808	48
1694	นาคำ	ศรีสงคราม	48150	480807	4808	48
1695	นาเดื่อ	ศรีสงคราม	48150	480802	4808	48
1696	บ้านข่า	ศรีสงคราม	48150	480806	4808	48
1697	บ้านเอื้อง	ศรีสงคราม	48150	480803	4808	48
1698	ศรีสงคราม	ศรีสงคราม	48150	480801	4808	48
1699	สามผง	ศรีสงคราม	48150	480804	4808	48
1700	หาดแพง	ศรีสงคราม	48150	480809	4808	48
1701	โพนสว่าง	ศรีสงคราม	48150	480808	4808	48
1702	กุรุคุ	เมืองนครพนม	48000	480105	4801	48
1703	ขามเฒ่า	เมืองนครพนม	48000	480108	4801	48
1704	คำเตย	เมืองนครพนม	48000	480111	4801	48
1705	ดงขวาง	เมืองนครพนม	48000	480113	4801	48
1706	ท่าค้อ	เมืองนครพนม	48000	480110	4801	48
1707	นาทราย	เมืองนครพนม	48000	480103	4801	48
1708	นาราชควาย	เมืองนครพนม	48000	480104	4801	48
1709	บ้านกลาง	เมืองนครพนม	48000	480109	4801	48
1710	บ้านผึ้ง	เมืองนครพนม	48000	480106	4801	48
1711	วังตามัว	เมืองนครพนม	48000	480114	4801	48
1712	หนองญาติ	เมืองนครพนม	48000	480112	4801	48
1713	หนองแสง	เมืองนครพนม	48000	480102	4801	48
1714	อาจสามารถ	เมืองนครพนม	48000	480107	4801	48
1715	โพธิ์ตาก	เมืองนครพนม	48000	480115	4801	48
1716	ในเมือง	เมืองนครพนม	48000	480101	4801	48
1717	ท่าลาด	เรณูนคร	48170	480603	4806	48
1718	นาขาม	เรณูนคร	48170	480609	4806	48
1719	นางาม	เรณูนคร	48170	480604	4806	48
1720	หนองย่างชิ้น	เรณูนคร	48170	480607	4806	48
1721	เรณู	เรณูนคร	48170	480601	4806	48
1722	เรณูใต้	เรณูนคร	48170	480608	4806	48
1723	โคกหินแฮ่	เรณูนคร	48170	480605	4806	48
1724	โพนทอง	เรณูนคร	48170	480403	4806	48
1725	นาขมิ้น	โพนสวรรค์	48190	480307	4810	48
1726	นาหัวบ่อ	โพนสวรรค์	48190	480313	4810	48
1727	นาใน	โพนสวรรค์	48190	481007	4810	48
1728	บ้านค้อ	โพนสวรรค์	48190	480310	4810	48
1729	โพนจาน	โพนสวรรค์	48190	481006	4810	48
1730	โพนบก	โพนสวรรค์	48190	480308	4810	48
1731	โพนสวรรค์	โพนสวรรค์	48190	480309	4810	48
1732	ขามทะเลสอ	ขามทะเลสอ	30280	301901	3019	30
1733	บึงอ้อ	ขามทะเลสอ	30280	301905	3019	30
1734	พันดุง	ขามทะเลสอ	30280	301903	3019	30
1735	หนองสรวง	ขามทะเลสอ	30280	301904	3019	30
1736	โป่งแดง	ขามทะเลสอ	30280	301902	3019	30
1737	ขามสะแกแสง	ขามสะแกแสง	30290	301101	3011	30
1738	ชีวึก	ขามสะแกแสง	30290	301104	3011	30
1739	พะงาด	ขามสะแกแสง	30290	301105	3011	30
1740	หนองหัวฟาน	ขามสะแกแสง	30290	301106	3011	30
1741	เมืองนาท	ขามสะแกแสง	30290	301103	3011	30
1742	เมืองเกษตร	ขามสะแกแสง	30290	301107	3011	30
1743	โนนเมือง	ขามสะแกแสง	30290	301102	3011	30
1744	ขามสมบูรณ์	คง	30260	300410	3004	30
1745	คูขาด	คง	30260	300402	3004	30
1746	ดอนใหญ่	คง	30260	300409	3004	30
1747	ตาจั่น	คง	30260	300404	3004	30
1748	บ้านปรางค์	คง	30260	300405	3004	30
1749	หนองบัว	คง	30260	300407	3004	30
1750	หนองมะนาว	คง	30260	300406	3004	30
1751	เทพาลัย	คง	30260	300403	3004	30
1752	เมืองคง	คง	30260	300401	3004	30
1753	โนนเต็ง	คง	30260	300408	3004	30
1754	ครบุรี	ครบุรี	30250	300203	3002	30
1755	ครบุรีใต้	ครบุรี	30250	300210	3002	30
1756	จระเข้หิน	ครบุรี	30250	300205	3002	30
1757	ตะแบกบาน	ครบุรี	30250	300211	3002	30
1758	บ้านใหม่	ครบุรี	30250	300113	3002	30
1759	มาบตะโกเอน	ครบุรี	30250	300206	3002	30
1760	ลำเพียก	ครบุรี	30250	300209	3002	30
1761	สระว่านพระยา	ครบุรี	30250	300212	3002	30
1762	อรพิมพ์	ครบุรี	30250	300207	3002	30
1763	เฉลียง	ครบุรี	30250	300202	3002	30
1764	แชะ	ครบุรี	30250	300201	3002	30
1765	โคกกระชาย	ครบุรี	30250	300204	3002	30
1766	คลองเมือง	จักราช	30230	300611	3006	30
1767	จักราช	จักราช	30230	300601	3006	30
1768	ทองหลาง	จักราช	30230	300603	3006	30
1769	ศรีละกอ	จักราช	30230	300610	3006	30
1770	สีสุก	จักราช	30230	300604	3006	30
1771	หนองขาม	จักราช	30230	300605	3006	30
1773	หินโคน	จักราช	30230	300613	3006	30
1774	ชุมพวง	ชุมพวง	30270	301701	3017	30
1775	ตลาดไทร	ชุมพวง	30270	301306	3017	30
1776	ท่าลาด	ชุมพวง	30270	301703	3017	30
1777	ประสุข	ชุมพวง	30270	301702	3017	30
1778	สาหร่าย	ชุมพวง	30270	301704	3017	30
1779	หนองหลัก	ชุมพวง	30270	301714	3017	30
1780	โนนตูม	ชุมพวง	30270	301716	3017	30
1781	โนนยอ	ชุมพวง	30270	301717	3017	30
1782	โนนรัง	ชุมพวง	30270	301710	3017	30
1783	กุดพิมาน	ด่านขุนทด	30210	300801	3008	30
1784	ด่านขุนทด	ด่านขุนทด	30210	300802	3008	30
1785	ด่านนอก	ด่านขุนทด	30210	300803	3008	30
1786	ด่านใน	ด่านขุนทด	30210	300804	3008	30
1787	ตะเคียน	ด่านขุนทด	30210	300805	3008	30
1788	บ้านเก่า	ด่านขุนทด	30210	300806	3008	30
1789	บ้านแปรง	ด่านขุนทด	36220	300807	3008	30
1790	พันชนะ	ด่านขุนทด	30210	300808	3008	30
1791	สระจรเข้	ด่านขุนทด	30210	300809	3008	30
1792	หนองกราด	ด่านขุนทด	30210	300810	3008	30
1793	หนองบัวตะเกียด	ด่านขุนทด	30210	300811	3008	30
1794	หนองบัวละคร	ด่านขุนทด	30210	300812	3008	30
1795	หนองไทร	ด่านขุนทด	36220	300818	3008	30
1796	หินดาด	ด่านขุนทด	30210	300813	3008	30
1797	ห้วยบง	ด่านขุนทด	30210	300815	3008	30
1798	โนนเมืองพัฒนา	ด่านขุนทด	30210	300817	3008	30
1799	บัวลาย	บัวลาย	30120	301210	3030	30
1800	หนองหว้า	บัวลาย	30120	301209	3030	30
1801	เมืองพะไล	บัวลาย	30120	301222	3030	30
1802	โนนจาน	บัวลาย	30120	301216	3030	30
1803	กุดจอก	บัวใหญ่	30120	301214	3012	30
1804	ขุนทอง	บัวใหญ่	30120	301220	3012	30
1805	ดอนตะหนิน	บัวใหญ่	30120	301206	3012	30
1806	ด่านช้าง	บัวใหญ่	30120	301215	3012	30
1807	บัวใหญ่	บัวใหญ่	30120	301201	3012	30
1808	หนองบัวสะอาด	บัวใหญ่	30120	301207	3012	30
1809	หนองแจ้งใหญ่	บัวใหญ่	30120	301224	3012	30
1810	ห้วยยาง	บัวใหญ่	30120	301203	3012	30
1811	เสมาใหญ่	บัวใหญ่	30120	301204	3012	30
1812	โนนทองหลาง	บัวใหญ่	30120	301208	3012	30
1813	ช่อระกา	บ้านเหลื่อม	30350	300504	3005	30
1814	บ้านเหลื่อม	บ้านเหลื่อม	30350	300501	3005	30
1815	วังโพธิ์	บ้านเหลื่อม	30350	300502	3005	30
1816	โคกกระเบื้อง	บ้านเหลื่อม	30350	300503	3005	30
1817	กระทุ่มราย	ประทาย	30180	301303	3013	30
1818	ดอนมัน	ประทาย	30180	301310	3013	30
1819	ตลาดไทร	ประทาย	30180	301306	3013	30
1820	ทุ่งสว่าง	ประทาย	30180	301315	3013	30
1821	นางรำ	ประทาย	30180	301313	3013	30
1822	ประทาย	ประทาย	30180	301301	3013	30
1823	วังไม้แดง	ประทาย	30180	301304	3013	30
1824	หนองค่าย	ประทาย	30180	301308	3013	30
1825	หนองพลวง	ประทาย	30180	300607	3013	30
1826	หันห้วยทราย	ประทาย	30180	301309	3013	30
1827	เมืองโดน	ประทาย	30180	301318	3013	30
1828	โคกกลาง	ประทาย	30180	301317	3013	30
1829	โนนเพ็ด	ประทาย	30180	301314	3013	30
1830	งิ้ว	ปักธงชัย	30150	301410	3014	30
1831	ดอน	ปักธงชัย	30150	301407	3014	30
1832	ตะขบ	ปักธงชัย	30150	301405	3014	30
1833	ตะคุ	ปักธงชัย	30150	301402	3014	30
1834	ตูม	ปักธงชัย	30150	301409	3014	30
1835	ธงชัยเหนือ	ปักธงชัย	30150	301417	3014	30
1836	นกออก	ปักธงชัย	30150	301406	3014	30
1837	บ่อปลาทอง	ปักธงชัย	30150	301420	3014	30
1838	ภูหลวง	ปักธงชัย	30150	301416	3014	30
1839	ลำนางแก้ว	ปักธงชัย	30150	301412	3014	30
1840	สะแกราช	ปักธงชัย	30150	301411	3014	30
1841	สำโรง	ปักธงชัย	30150	300904	3014	30
1842	สุขเกษม	ปักธงชัย	30150	301418	3014	30
1843	เกษมทรัพย์	ปักธงชัย	30150	301419	3014	30
1844	เมืองปัก	ปักธงชัย	30150	301401	3014	30
1845	โคกไทย	ปักธงชัย	30150	301403	3014	30
1846	กลางดง	ปากช่อง	30320	302102	3021	30
1847	ขนงพระ	ปากช่อง	30130	302107	3021	30
1848	คลองม่วง	ปากช่อง	30130	302109	3021	30
1849	จันทึก	ปากช่อง	30130	302103	3021	30
1850	ปากช่อง	ปากช่อง	30130	302101	3021	30
1851	พญาเย็น	ปากช่อง	30320	302112	3021	30
1852	วังกะทะ	ปากช่อง	30130	302104	3021	30
1853	วังไทร	ปากช่อง	30130	302111	3021	30
1854	หนองน้ำแดง	ปากช่อง	30130	302110	3021	30
1855	หนองสาหร่าย	ปากช่อง	30130	302106	3021	30
1856	หมูสี	ปากช่อง	30130	302105	3021	30
1857	โป่งตาลอง	ปากช่อง	30130	302108	3021	30
1858	ทัพรั้ง	พระทองคำ	30220	300912	3028	30
1859	พังเทียม	พระทองคำ	30220	300910	3028	30
1860	มาบกราด	พระทองคำ	30220	300915	3028	30
1861	สระพระ	พระทองคำ	30220	300911	3028	30
1862	หนองหอย	พระทองคำ	30220	300913	3028	30
1863	กระชอน	พิมาย	30110	301509	3015	30
1864	กระเบื้องใหญ่	พิมาย	30110	301504	3015	30
1865	ชีวาน	พิมาย	30110	301507	3015	30
1866	ดงใหญ่	พิมาย	30110	301510	3015	30
1867	ท่าหลวง	พิมาย	30110	301505	3015	30
1868	ธารละหลอด	พิมาย	30110	301511	3015	30
1869	นิคมสร้างตนเอง	พิมาย	30110	301508	3015	30
1870	รังกาใหญ่	พิมาย	30110	301506	3015	30
1871	สัมฤทธิ์	พิมาย	30110	301502	3015	30
1872	หนองระเวียง	พิมาย	30110	300106	3015	30
1873	โบสถ์	พิมาย	30110	301503	3015	30
1874	ในเมือง	พิมาย	30110	300101	3015	30
1875	ขุย	ลำทะเมนชัย	30270	301707	3029	30
1876	ช่องแมว	ลำทะเมนชัย	30270	301706	3029	30
1877	บ้านยาง	ลำทะเมนชัย	30270	301711	3029	30
1878	ไพล	ลำทะเมนชัย	30270	301715	3029	30
1879	ระเริง	วังน้ำเขียว	30150	301414	3025	30
1880	วังน้ำเขียว	วังน้ำเขียว	30370	301408	3025	30
1881	วังหมี	วังน้ำเขียว	30370	301413	3025	30
1882	อุดมทรัพย์	วังน้ำเขียว	30370	301415	3025	30
1883	ไทยสามัคคี	วังน้ำเขียว	30370	302505	3025	30
1884	กฤษณา	สีคิ้ว	30140	302003	3020	30
1885	กุดน้อย	สีคิ้ว	30140	302006	3020	30
1886	คลองไผ่	สีคิ้ว	30340	302010	3020	30
1887	ดอนเมือง	สีคิ้ว	30140	302011	3020	30
1888	บ้านหัน	สีคิ้ว	30140	302002	3020	30
1889	มิตรภาพ	สีคิ้ว	30140	302009	3020	30
1890	ลาดบัวขาว	สีคิ้ว	30340	302004	3020	30
1891	วังโรงใหญ่	สีคิ้ว	30140	302008	3020	30
1892	สีคิ้ว	สีคิ้ว	30140	302001	3020	30
1893	หนองน้ำใส	สีคิ้ว	30140	302007	3020	30
1894	หนองบัวน้อย	สีคิ้ว	30140	302012	3020	30
1895	หนองหญ้าขาว	สีคิ้ว	30140	302005	3020	30
1896	สามเมือง	สีดา	30430	301218	3031	30
1897	สีดา	สีดา	30430	301211	3031	30
1898	หนองตาดใหญ่	สีดา	30430	301221	3031	30
1899	โนนประดู่	สีดา	30430	301223	3031	30
1900	โพนทอง	สีดา	30430	301212	3031	30
1901	กุดจิก	สูงเนิน	30380	301811	3018	30
1902	นากลาง	สูงเนิน	30380	301809	3018	30
1903	บุ่งขี้เหล็ก	สูงเนิน	30170	301804	3018	30
1904	มะเกลือเก่า	สูงเนิน	30170	301807	3018	30
1905	มะเกลือใหม่	สูงเนิน	30170	301808	3018	30
1906	สูงเนิน	สูงเนิน	30170	301801	3018	30
1907	หนองตะไก้	สูงเนิน	30380	301810	3018	30
1908	เสมา	สูงเนิน	30170	301802	3018	30
1909	โคราช	สูงเนิน	30170	301803	3018	30
1910	โค้งยาง	สูงเนิน	30170	301806	3018	30
1911	โนนค่า	สูงเนิน	30170	301805	3018	30
1912	บ้านใหม่	หนองบุญมาก	30410	300113	3022	30
1913	ลุงเขว้า	หนองบุญมาก	30410	302207	3022	30
1914	สารภี	หนองบุญมาก	30410	302202	3022	30
1915	หนองตะไก้	หนองบุญมาก	30410	301810	3022	30
1916	หนองบุนนาก	หนองบุญมาก	30410	302201	3022	30
1917	หนองหัวแรต	หนองบุญมาก	30410	302204	3022	30
1918	หนองไม้ไผ่	หนองบุญมาก	30410	302208	3022	30
1919	แหลมทอง	หนองบุญมาก	30410	302205	3022	30
1920	ไทยเจริญ	หนองบุญมาก	30410	302203	3022	30
1921	กงรถ	ห้วยแถลง	30240	301607	3016	30
1922	งิ้ว	ห้วยแถลง	30240	301410	3016	30
1923	ตะโก	ห้วยแถลง	30240	301609	3016	30
1924	ทับสวาย	ห้วยแถลง	30240	301602	3016	30
1925	หลุ่งตะเคียน	ห้วยแถลง	30240	301604	3016	30
1926	หลุ่งประดู่	ห้วยแถลง	30240	301608	3016	30
1927	หินดาด	ห้วยแถลง	30240	300813	3016	30
1928	ห้วยแคน	ห้วยแถลง	30240	301610	3016	30
1929	ห้วยแถลง	ห้วยแถลง	30240	301601	3016	30
1930	เมืองพลับพลา	ห้วยแถลง	30240	301603	3016	30
1931	ช้างทอง	เฉลิมพระเกียรติ	30230	300612	3032	30
1932	ท่าช้าง	เฉลิมพระเกียรติ	30230	300602	3032	30
1933	พระพุทธ	เฉลิมพระเกียรติ	30230	300609	3032	30
1934	หนองงูเหลือม	เฉลิมพระเกียรติ	30000	300606	3032	30
1935	หนองยาง	เฉลิมพระเกียรติ	30230	300608	3032	30
1936	บึงปรือ	เทพารักษ์	30210	300819	3026	30
1937	วังยายทอง	เทพารักษ์	30210	302604	3026	30
1938	สำนักตะคร้อ	เทพารักษ์	30210	300814	3026	30
1939	หนองแวง	เทพารักษ์	30210	300816	3026	30
1940	จอหอ	เมืองนครราชสีมา	30310	300116	3001	30
1941	ตลาด	เมืองนครราชสีมา	30310	300122	3001	30
1942	บ้านเกาะ	เมืองนครราชสีมา	30000	300112	3001	30
1943	บ้านโพธิ์	เมืองนครราชสีมา	30310	300115	3001	30
1944	บ้านใหม่	เมืองนครราชสีมา	30000	300113	3001	30
1945	ปรุใหญ่	เมืองนครราชสีมา	30000	300107	3001	30
1946	พลกรัง	เมืองนครราชสีมา	30000	300109	3001	30
1947	พะเนา	เมืองนครราชสีมา	30000	300123	3001	30
1948	พุดซา	เมืองนครราชสีมา	30000	300114	3001	30
1949	มะเริง	เมืองนครราชสีมา	30000	300105	3001	30
1950	สีมุม	เมืองนครราชสีมา	30000	300121	3001	30
1951	สุรนารี	เมืองนครราชสีมา	30000	300120	3001	30
1952	หนองกระทุ่ม	เมืองนครราชสีมา	30000	300124	3001	30
1953	หนองจะบก	เมืองนครราชสีมา	30000	300103	3001	30
1954	หนองบัวศาลา	เมืองนครราชสีมา	30000	300119	3001	30
1955	หนองระเวียง	เมืองนครราชสีมา	30000	300106	3001	30
1956	หนองไข่น้ำ	เมืองนครราชสีมา	30310	300125	3001	30
1957	หนองไผ่ล้อม	เมืองนครราชสีมา	30000	300110	3001	30
1958	หมื่นไวย	เมืองนครราชสีมา	30000	300108	3001	30
1959	หัวทะเล	เมืองนครราชสีมา	30000	300111	3001	30
1960	โคกกรวด	เมืองนครราชสีมา	30280	300117	3001	30
1961	โคกสูง	เมืองนครราชสีมา	30310	300104	3001	30
1962	โพธิ์กลาง	เมืองนครราชสีมา	30000	300102	3001	30
1963	ในเมือง	เมืองนครราชสีมา	30000	300101	3001	30
1964	ไชยมงคล	เมืองนครราชสีมา	30000	300118	3001	30
1965	กระเบื้องนอก	เมืองยาง	30270	301708	3027	30
1966	ละหานปลาค้าว	เมืองยาง	30270	301712	3027	30
1967	เมืองยาง	เมืองยาง	30270	301709	3027	30
1968	โนนอุดม	เมืองยาง	30270	301713	3027	30
1969	กุดโบสถ์	เสิงสาง	30330	300304	3003	30
1970	บ้านราษฎร์	เสิงสาง	30330	300306	3003	30
1971	สระตะเคียน	เสิงสาง	30330	300302	3003	30
1972	สุขไพบูลย์	เสิงสาง	30330	300305	3003	30
1973	เสิงสาง	เสิงสาง	30330	300301	3003	30
1974	โนนสมบูรณ์	เสิงสาง	30330	300303	3003	30
1975	บึงพะไล	แก้งสนามนาง	30440	301205	3023	30
1976	บึงสำโรง	แก้งสนามนาง	30440	302305	3023	30
1977	สีสุก	แก้งสนามนาง	30440	300604	3023	30
1978	แก้งสนามนาง	แก้งสนามนาง	30440	301213	3023	30
1979	โนนสำราญ	แก้งสนามนาง	30440	301219	3023	30
1980	กระโทก	โชคชัย	30190	300701	3007	30
1981	ด่านเกวียน	โชคชัย	30190	300710	3007	30
1982	ทุ่งอรุณ	โชคชัย	30190	300704	3007	30
1983	ท่าจะหลุง	โชคชัย	30190	300706	3007	30
1984	ท่าลาดขาว	โชคชัย	30190	300705	3007	30
1985	ท่าอ่าง	โชคชัย	30190	300703	3007	30
1986	ท่าเยี่ยม	โชคชัย	30190	300707	3007	30
1987	พลับพลา	โชคชัย	30190	300702	3007	30
1988	ละลมใหม่พัฒนา	โชคชัย	30190	300709	3007	30
1989	โชคชัย	โชคชัย	30190	300708	3007	30
1990	ขามเฒ่า	โนนสูง	30160	301011	3010	30
1991	จันอัด	โนนสูง	30160	301010	3010	30
1992	ดอนชมพู	โนนสูง	30160	301005	3010	30
1993	ดอนหวาย	โนนสูง	30160	301015	3010	30
1994	ด่านคล้า	โนนสูง	30160	301012	3010	30
1995	ธารปราสาท	โนนสูง	30420	301006	3010	30
1996	บิง	โนนสูง	30160	301004	3010	30
1997	พลสงคราม	โนนสูง	30160	301009	3010	30
1998	มะค่า	โนนสูง	30160	300914	3010	30
1999	ลำคอหงษ์	โนนสูง	30160	301013	3010	30
2000	ลำมูล	โนนสูง	30160	301016	3010	30
2001	หลุมข้าว	โนนสูง	30160	301007	3010	30
2002	เมืองปราสาท	โนนสูง	30160	301014	3010	30
2003	โตนด	โนนสูง	30160	301003	3010	30
2004	โนนสูง	โนนสูง	30160	301001	3010	30
2005	ใหม่	โนนสูง	30160	301002	3010	30
2006	ดอนยาวใหญ่	โนนแดง	30360	301316	3024	30
2007	วังหิน	โนนแดง	30360	301305	3024	30
2008	สำพะเนียง	โนนแดง	30360	301312	3024	30
2009	โนนตาเถร	โนนแดง	30360	301311	3024	30
2010	โนนแดง	โนนแดง	30360	301302	3024	30
2011	กำปัง	โนนไทย	30220	300903	3009	30
2012	ค้างพลู	โนนไทย	30220	300905	3009	30
2013	ด่านจาก	โนนไทย	30220	300902	3009	30
2014	ถนนโพธิ์	โนนไทย	30220	300909	3009	30
2015	บัลลังก์	โนนไทย	30220	300907	3009	30
2016	บ้านวัง	โนนไทย	30220	300906	3009	30
2017	มะค่า	โนนไทย	30220	300914	3009	30
2018	สายออ	โนนไทย	30220	300908	3009	30
2019	สำโรง	โนนไทย	30220	300904	3009	30
2020	โนนไทย	โนนไทย	30220	300901	3009	30
2021	ขนอม	ขนอม	80210	801501	8015	80
2022	ควนทอง	ขนอม	80210	801502	8015	80
2023	ท้องเนียน	ขนอม	80210	801503	8015	80
2024	ควนหนองคว้า	จุฬาภรณ์	80130	801311	8019	80
2025	ทุ่งโพธิ์	จุฬาภรณ์	80130	801310	8019	80
2026	นาหมอบุญ	จุฬาภรณ์	80130	801309	8019	80
2027	บ้านควนมุด	จุฬาภรณ์	80180	800712	8019	80
2028	บ้านชะอวด	จุฬาภรณ์	80180	800713	8019	80
2029	สามตำบล	จุฬาภรณ์	80130	801307	8019	80
2030	กะเปียด	ฉวาง	80260	800406	8004	80
2031	จันดี	ฉวาง	80250	800416	8004	80
2032	ฉวาง	ฉวาง	80150	800401	8004	80
2033	นากะชะ	ฉวาง	80150	800407	8004	80
2034	นาเขลียง	ฉวาง	80260	800415	8004	80
2035	นาแว	ฉวาง	80260	800404	8004	80
2036	ละอาย	ฉวาง	80250	800403	8004	80
2037	ห้วยปริก	ฉวาง	80260	800409	8004	80
2038	ไม้เรียง	ฉวาง	80260	800405	8004	80
2039	ไสหร้า	ฉวาง	80150	800410	8004	80
2040	ขอนหาด	ชะอวด	80180	800707	8007	80
2041	ควนหนองหงษ์	ชะอวด	80180	800709	8007	80
2042	ชะอวด	ชะอวด	80180	800701	8007	80
2043	ท่าประจะ	ชะอวด	80180	800703	8007	80
2044	ท่าเสม็ด	ชะอวด	80180	800702	8007	80
2045	นางหลง	ชะอวด	80180	800711	8007	80
2046	บ้านตูล	ชะอวด	80180	800706	8007	80
2047	วังอ่าง	ชะอวด	80180	800705	8007	80
2048	เกาะขันธ์	ชะอวด	80180	800708	8007	80
2049	เขาพระทอง	ชะอวด	80180	800710	8007	80
2050	เคร็ง	ชะอวด	80180	800704	8007	80
2051	ช้างกลาง	ช้างกลาง	80250	800402	8022	80
2052	สวนขัน	ช้างกลาง	80250	800412	8022	80
2053	หลักช้าง	ช้างกลาง	80250	800411	8022	80
2054	คลองเส	ถ้ำพรรณรา	80260	800413	8018	80
2055	ดุสิต	ถ้ำพรรณรา	80260	800414	8018	80
2056	ถ้ำพรรณรา	ถ้ำพรรณรา	80260	800408	8018	80
2057	กะปาง	ทุ่งสง	80310	800908	8009	80
2058	ควนกรด	ทุ่งสง	80110	800904	8009	80
2059	ชะมาย	ทุ่งสง	80110	800902	8009	80
2060	ถ้ำใหญ่	ทุ่งสง	80110	800911	8009	80
2061	ที่วัง	ทุ่งสง	80110	800909	8009	80
2062	นาหลวงเสน	ทุ่งสง	80110	800906	8009	80
2063	นาโพธิ์	ทุ่งสง	80110	800912	8009	80
2064	นาไม้ไผ่	ทุ่งสง	80110	800905	8009	80
2065	น้ำตก	ทุ่งสง	80110	800910	8009	80
2066	ปากแพรก	ทุ่งสง	80110	800901	8009	80
2067	หนองหงส์	ทุ่งสง	80110	800903	8009	80
2068	เขาขาว	ทุ่งสง	80110	800913	8009	80
2069	เขาโร	ทุ่งสง	80110	800907	8009	80
2070	กรุงหยัน	ทุ่งใหญ่	80240	801107	8011	80
2071	กุแหระ	ทุ่งใหญ่	80240	801104	8011	80
2072	ทุ่งสัง	ทุ่งใหญ่	80240	801102	8011	80
2073	ทุ่งใหญ่	ทุ่งใหญ่	80240	801103	8011	80
2074	ท่ายาง	ทุ่งใหญ่	80240	801101	8011	80
2075	บางรูป	ทุ่งใหญ่	80240	801106	8011	80
2076	ปริก	ทุ่งใหญ่	80240	801105	8011	80
2077	กลาย	ท่าศาลา	80160	800802	8008	80
2078	ดอนตะโก	ท่าศาลา	80160	800810	8008	80
2079	ตลิ่งชัน	ท่าศาลา	80160	800811	8008	80
2080	ท่าขึ้น	ท่าศาลา	80160	800803	8008	80
2081	ท่าศาลา	ท่าศาลา	80160	800801	8008	80
2082	สระแก้ว	ท่าศาลา	80160	800806	8008	80
2083	หัวตะพาน	ท่าศาลา	80160	800804	8008	80
2084	โพธิ์ทอง	ท่าศาลา	80160	800813	8008	80
2085	โมคลาน	ท่าศาลา	80160	800807	8008	80
2086	ไทยบุรี	ท่าศาลา	80160	800809	8008	80
2087	กรุงชิง	นบพิตำ	80160	800812	8021	80
2088	กะหรอ	นบพิตำ	80160	800805	8021	80
2089	นบพิตำ	นบพิตำ	80160	800808	8021	80
2090	นาเหรง	นบพิตำ	80160	800814	8021	80
2091	ทุ่งสง	นาบอน	80220	800998	8010	80
2092	นาบอน	นาบอน	80220	800999	8010	80
2093	แก้วแสน	นาบอน	80220	800997	8010	80
2094	บางขัน	บางขัน	80360	800996	8017	80
2095	บ้านนิคม	บางขัน	80360	801704	8017	80
2096	บ้านลำนาว	บางขัน	80360	800995	8017	80
2097	วังหิน	บางขัน	80360	800994	8017	80
2098	ขนาบนาก	ปากพนัง	80140	801218	8012	80
2099	คลองกระบือ	ปากพนัง	80370	801205	8012	80
2100	คลองน้อย	ปากพนัง	80330	801202	8012	80
2101	ชะเมา	ปากพนัง	80330	801204	8012	80
2102	ท่าพยา	ปากพนัง	80140	801216	8012	80
2103	บางตะพง	ปากพนัง	80370	801213	8012	80
2104	บางพระ	ปากพนัง	80140	801212	8012	80
2105	บางศาลา	ปากพนัง	80370	801211	8012	80
2106	บ้านเพิง	ปากพนัง	80140	801215	8012	80
2107	บ้านใหม่	ปากพนัง	80370	801207	8012	80
2108	ปากพนัง	ปากพนัง	80140	801201	8012	80
2109	ปากพนังฝั่งตะวันตก	ปากพนัง	80370	801210	8012	80
2110	ปากพนังฝั่งตะวันออก	ปากพนัง	80140	801214	8012	80
2111	ปากแพรก	ปากพนัง	80140	800901	8012	80
2112	ป่าระกำ	ปากพนัง	80370	801203	8012	80
2113	หูล่อง	ปากพนัง	80370	801208	8012	80
2114	เกาะทวด	ปากพนัง	80330	801206	8012	80
2115	แหลมตะลุมพุก	ปากพนัง	80140	801209	8012	80
2116	ทอนหงส์	พรหมคีรี	80320	800204	8002	80
2117	นาเรียง	พรหมคีรี	80320	800205	8002	80
2118	บ้านเกาะ	พรหมคีรี	80320	800199	8002	80
2119	พรหมโลก	พรหมคีรี	80320	800196	8002	80
2120	อินคีรี	พรหมคีรี	80320	800195	8002	80
2121	ช้างซ้าย	พระพรหม	80000	800110	8020	80
2122	ท้ายสำเภา	พระพรหม	80000	800117	8020	80
2123	นาพรุ	พระพรหม	80000	800109	8020	80
2124	นาสาร	พระพรหม	80000	800111	8020	80
2125	กะทูน	พิปูน	80270	800502	8005	80
2126	ควนกลาง	พิปูน	80270	800505	8005	80
2127	พิปูน	พิปูน	80270	800501	8005	80
2128	ยางค้อม	พิปูน	80270	800504	8005	80
2129	เขาพระ	พิปูน	80270	800503	8005	80
2130	ควนชุม	ร่อนพิบูลย์	80130	801306	8013	80
2131	ควนพัง	ร่อนพิบูลย์	80130	801305	8013	80
2132	ควนเกย	ร่อนพิบูลย์	80130	801304	8013	80
2133	ร่อนพิบูลย์	ร่อนพิบูลย์	80130	801301	8013	80
2134	หินตก	ร่อนพิบูลย์	80350	801302	8013	80
2135	เสาธง	ร่อนพิบูลย์	80350	801303	8013	80
2136	กำโลน	ลานสกา	80230	800304	8003	80
2137	ขุนทะเล	ลานสกา	80230	800305	8003	80
2138	ท่าดี	ลานสกา	80230	800303	8003	80
2139	ลานสกา	ลานสกา	80230	800302	8003	80
2140	เขาแก้ว	ลานสกา	80230	800301	8003	80
2141	ฉลอง	สิชล	80120	801403	8014	80
2142	ทุ่งปรัง	สิชล	80120	801402	8014	80
2143	ทุ่งใส	สิชล	80120	801409	8014	80
2144	สิชล	สิชล	80120	801401	8014	80
2145	สี่ขีด	สิชล	80120	801406	8014	80
2146	เขาน้อย	สิชล	80120	801408	8014	80
2147	เทพราช	สิชล	80340	801407	8014	80
2148	เปลี่ยน	สิชล	80120	801405	8014	80
2149	เสาเภา	สิชล	80340	801404	8014	80
2150	ควนชะลิก	หัวไทร	80170	801609	8016	80
2151	ทรายขาว	หัวไทร	80170	801603	8016	80
2152	ท่าซอม	หัวไทร	80170	801608	8016	80
2153	บางนบ	หัวไทร	80170	801607	8016	80
2154	บ้านราม	หัวไทร	80170	801606	8016	80
2155	รามแก้ว	หัวไทร	80170	801610	8016	80
2156	หน้าสตน	หัวไทร	80170	801602	8016	80
2157	หัวไทร	หัวไทร	80170	801601	8016	80
2158	เกาะเพชร	หัวไทร	80170	801611	8016	80
2159	เขาพังไกร	หัวไทร	80170	801605	8016	80
2160	แหลม	หัวไทร	80170	801604	8016	80
2161	ดอนตรอ	เฉลิมพระเกียรติ	80290	800608	8023	80
2162	ทางพูน	เฉลิมพระเกียรติ	80290	801308	8023	80
2163	สวนหลวง	เฉลิมพระเกียรติ	80190	800609	8023	80
2164	เชียรเขา	เฉลิมพระเกียรติ	80190	800602	8023	80
2165	การะเกด	เชียรใหญ่	80190	800611	8006	80
2166	ท่าขนาน	เชียรใหญ่	80190	800603	8006	80
2167	ท้องลำเจียก	เชียรใหญ่	80190	800607	8006	80
2168	บ้านกลาง	เชียรใหญ่	80190	800604	8006	80
2169	บ้านเนิน	เชียรใหญ่	80190	800605	8006	80
2170	เขาพระบาท	เชียรใหญ่	80190	800612	8006	80
2171	เชียรใหญ่	เชียรใหญ่	80190	800601	8006	80
2172	เสือหึง	เชียรใหญ่	80190	800610	8006	80
2173	แม่เจ้าอยู่หัว	เชียรใหญ่	80190	800613	8006	80
2174	ไสหมาก	เชียรใหญ่	80190	800606	8006	80
2175	กำแพงเซา	เมืองนครศรีธรรมราช	80280	800112	8001	80
2176	คลัง	เมืองนครศรีธรรมราช	80000	800103	8001	80
2177	ท่างิ้ว	เมืองนครศรีธรรมราช	80280	800116	8001	80
2178	ท่าซัก	เมืองนครศรีธรรมราช	80000	800121	8001	80
2179	ท่าวัง	เมืองนครศรีธรรมราช	80000	800102	8001	80
2180	ท่าเรือ	เมืองนครศรีธรรมราช	80000	800122	8001	80
2181	ท่าไร่	เมืองนครศรีธรรมราช	80000	800106	8001	80
2182	นาทราย	เมืองนครศรีธรรมราช	80280	800108	8001	80
2183	นาเคียน	เมืองนครศรีธรรมราช	80000	800115	8001	80
2184	บางจาก	เมืองนครศรีธรรมราช	80330	800119	8001	80
2185	ปากนคร	เมืองนครศรีธรรมราช	80000	800107	8001	80
2186	ปากพูน	เมืองนครศรีธรรมราช	80000	800120	8001	80
2187	มะม่วงสองต้น	เมืองนครศรีธรรมราช	80000	800114	8001	80
2188	โพธิ์เสด็จ	เมืองนครศรีธรรมราช	80000	800118	8001	80
2189	ในเมือง	เมืองนครศรีธรรมราช	80000	800101	8001	80
2190	ไชยมนตรี	เมืองนครศรีธรรมราช	80000	800113	8001	80
2191	ชุมตาบง	ชุมตาบง	60150	601308	6015	60
2192	ปางสวรรค์	ชุมตาบง	60150	601306	6015	60
2193	ฆะมัง	ชุมแสง	60120	600311	6003	60
2194	ชุมแสง	ชุมแสง	60120	600301	6003	60
2195	ทับกฤช	ชุมแสง	60250	600302	6003	60
2196	ทับกฤชใต้	ชุมแสง	60250	600312	6003	60
2197	ท่าไม้	ชุมแสง	60120	600305	6003	60
2198	บางเคียน	ชุมแสง	60120	600306	6003	60
2199	พันลาน	ชุมแสง	60250	600308	6003	60
2200	พิกุล	ชุมแสง	60120	600303	6003	60
2201	หนองกระเจา	ชุมแสง	60120	600307	6003	60
2202	เกยไชย	ชุมแสง	60120	600304	6003	60
2203	โคกหม้อ	ชุมแสง	60120	600309	6003	60
2204	ไผ่สิงห์	ชุมแสง	60120	600310	6003	60
2205	ตากฟ้า	ตากฟ้า	60190	601201	6012	60
2206	พุนกยูง	ตากฟ้า	60190	601205	6012	60
2207	ลำพยนต์	ตากฟ้า	60190	601202	6012	60
2208	สุขสำราญ	ตากฟ้า	60190	601203	6012	60
2209	หนองพิกุล	ตากฟ้า	60190	601204	6012	60
2210	อุดมธัญญา	ตากฟ้า	60190	601206	6012	60
2211	เขาชายธง	ตากฟ้า	60190	601207	6012	60
2212	จันเสน	ตาคลี	60260	600703	6007	60
2213	ช่องแค	ตาคลี	60210	600702	6007	60
2214	ตาคลี	ตาคลี	60140	600701	6007	60
2215	พรหมนิมิต	ตาคลี	60210	600710	6007	60
2216	ลาดทิพรส	ตาคลี	60260	600709	6007	60
2217	สร้อยทอง	ตาคลี	60210	600708	6007	60
2218	หนองหม้อ	ตาคลี	60140	600707	6007	60
2219	หนองโพ	ตาคลี	60140	600706	6007	60
2220	หัวหวาย	ตาคลี	60140	600705	6007	60
2221	ห้วยหอม	ตาคลี	60210	600704	6007	60
2222	ดอนคา	ท่าตะโก	60160	600806	6008	60
2223	ทำนบ	ท่าตะโก	60160	600807	6008	60
2224	ท่าตะโก	ท่าตะโก	60160	600801	6008	60
2225	พนมรอก	ท่าตะโก	60160	600802	6008	60
2226	พนมเศษ	ท่าตะโก	60160	600809	6008	60
2227	วังมหากร	ท่าตะโก	60160	600805	6008	60
2228	วังใหญ่	ท่าตะโก	60160	600808	6008	60
2229	สายลำโพง	ท่าตะโก	60160	600804	6008	60
2230	หนองหลวง	ท่าตะโก	60160	600810	6008	60
2231	หัวถนน	ท่าตะโก	60160	600803	6008	60
2232	ด่านช้าง	บรรพตพิสัย	60180	600509	6005	60
2233	ตาขีด	บรรพตพิสัย	60180	600507	6005	60
2234	ตาสัง	บรรพตพิสัย	60180	600508	6005	60
2235	ท่างิ้ว	บรรพตพิสัย	60180	600501	6005	60
2236	บางตาหงาย	บรรพตพิสัย	60180	600502	6005	60
2237	บางแก้ว	บรรพตพิสัย	60180	600506	6005	60
2238	บึงปลาทู	บรรพตพิสัย	60180	600512	6005	60
2239	บ้านแดน	บรรพตพิสัย	60180	600505	6005	60
2240	หนองกรด	บรรพตพิสัย	60180	600114	6005	60
2241	หนองตางู	บรรพตพิสัย	60180	600511	6005	60
2242	หูกวาง	บรรพตพิสัย	60180	600503	6005	60
2243	อ่างทอง	บรรพตพิสัย	60180	600504	6005	60
2244	เจริญผล	บรรพตพิสัย	60180	600513	6005	60
2245	ท่าน้ำอ้อย	พยุหะคีรี	60130	601008	6010	60
2246	นิคมเขาบ่อแก้ว	พยุหะคีรี	60130	601003	6010	60
2247	น้ำทรง	พยุหะคีรี	60130	601009	6010	60
2248	พยุหะ	พยุหะคีรี	60130	601001	6010	60
2249	ม่วงหัก	พยุหะคีรี	60130	601004	6010	60
2250	ยางขาว	พยุหะคีรี	60130	601005	6010	60
2251	ย่านมัทรี	พยุหะคีรี	60130	601006	6010	60
2252	สระทะเล	พยุหะคีรี	60130	601011	6010	60
2253	เขากะลา	พยุหะคีรี	60130	601010	6010	60
2254	เขาทอง	พยุหะคีรี	60130	601007	6010	60
2255	เนินมะกอก	พยุหะคีรี	60130	601002	6010	60
2256	บ้านไร่	ลาดยาว	60150	601109	6011	60
2257	มาบแก	ลาดยาว	60150	601106	6011	60
2258	ลาดยาว	ลาดยาว	60150	601101	6011	60
2259	วังม้า	ลาดยาว	60150	601103	6011	60
2260	วังเมือง	ลาดยาว	60150	601104	6011	60
2261	ศาลเจ้าไก่ต่อ	ลาดยาว	60150	601116	6011	60
2262	สระแก้ว	ลาดยาว	60150	601117	6011	60
2263	สร้อยละคร	ลาดยาว	60150	601105	6011	60
2264	หนองนมวัว	ลาดยาว	60150	601108	6011	60
2265	หนองยาว	ลาดยาว	60150	601107	6011	60
2266	ห้วยน้ำหอม	ลาดยาว	60150	601102	6011	60
2267	เนินขี้เหล็ก	ลาดยาว	60150	601110	6011	60
2268	ทุ่งทอง	หนองบัว	60110	600408	6004	60
2269	ธารทหาร	หนองบัว	60110	600403	6004	60
2270	วังบ่อ	หนองบัว	60110	600409	6004	60
2271	หนองกลับ	หนองบัว	60110	600402	6004	60
2272	หนองบัว	หนองบัว	60110	600401	6004	60
2273	ห้วยถั่วเหนือ	หนองบัว	60110	600406	6004	60
2274	ห้วยถั่วใต้	หนองบัว	60110	600405	6004	60
2275	ห้วยร่วม	หนองบัว	60110	600404	6004	60
2276	ห้วยใหญ่	หนองบัว	60110	600407	6004	60
2277	มหาโพธิ	เก้าเลี้ยว	60230	600601	6006	60
2278	หนองเต่า	เก้าเลี้ยว	60230	600603	6006	60
2279	หัวดง	เก้าเลี้ยว	60230	600605	6006	60
2280	เก้าเลี้ยว	เก้าเลี้ยว	60230	600602	6006	60
2281	เขาดิน	เก้าเลี้ยว	60230	600604	6006	60
2282	กลางแดด	เมืองนครสวรรค์	60000	600102	6001	60
2283	ตะเคียนเลื่อน	เมืองนครสวรรค์	60000	600105	6001	60
2284	นครสวรรค์ตก	เมืองนครสวรรค์	60000	600106	6001	60
2285	นครสวรรค์ออก	เมืองนครสวรรค์	60000	600107	6001	60
2286	บางพระหลวง	เมืองนครสวรรค์	60000	600108	6001	60
2287	บางม่วง	เมืองนครสวรรค์	60000	600109	6001	60
2288	บึงเสนาท	เมืองนครสวรรค์	60000	600117	6001	60
2289	บ้านมะเกลือ	เมืองนครสวรรค์	60000	600110	6001	60
2290	บ้านแก่ง	เมืองนครสวรรค์	60000	600111	6001	60
2291	ปากน้ำโพ	เมืองนครสวรรค์	60000	600101	6001	60
2292	พระนอน	เมืองนครสวรรค์	60000	600112	6001	60
2293	วัดไทรย์	เมืองนครสวรรค์	60000	false	6001	60
2294	หนองกรด	เมืองนครสวรรค์	60240	600114	6001	60
2295	หนองกระโดน	เมืองนครสวรรค์	60240	600115	6001	60
2296	หนองปลิง	เมืองนครสวรรค์	60000	600116	6001	60
2297	เกรียงไกร	เมืองนครสวรรค์	60000	600103	6001	60
2298	แควใหญ่	เมืองนครสวรรค์	60000	600104	6001	60
2299	วังซ่าน	แม่วงก์	60150	601304	6013	60
2300	เขาชนกัน	แม่วงก์	60150	601305	6013	60
2301	แม่วงก์	แม่วงก์	60150	601301	6013	60
2302	แม่เล่ย์	แม่วงก์	60150	601303	6013	60
2303	แม่เปิน	แม่เปิน	60150	601307	6014	60
2304	นากลาง	โกรกพระ	60170	600205	6002	60
2305	บางประมุง	โกรกพระ	60170	600204	6002	60
2306	บางมะฝ่อ	โกรกพระ	60170	600203	6002	60
2307	ยางตาล	โกรกพระ	60170	600202	6002	60
2308	ศาลาแดง	โกรกพระ	60170	600206	6002	60
2309	หาดสูง	โกรกพระ	60170	600209	6002	60
2310	เนินกว้าว	โกรกพระ	60170	600207	6002	60
2311	เนินศาลา	โกรกพระ	60170	600208	6002	60
2312	โกรกพระ	โกรกพระ	60170	600201	6002	60
2313	ตะคร้อ	ไพศาลี	60220	600904	6009	60
2314	นาขอม	ไพศาลี	60220	600907	6009	60
2315	วังข่อย	ไพศาลี	60220	600906	6009	60
2316	วังน้ำลัด	ไพศาลี	60220	600903	6009	60
2317	สำโรงชัย	ไพศาลี	60220	600902	6009	60
2318	โคกเดื่อ	ไพศาลี	60220	600901	6009	60
2319	โพธิ์ประสาท	ไพศาลี	60220	600905	6009	60
2320	ไพศาลี	ไพศาลี	60220	600908	6009	60
2321	บางกรวย	บางกรวย	11130	120202	1202	12
2322	บางขนุน	บางกรวย	11130	120204	1202	12
2323	บางขุนกอง	บางกรวย	11130	120205	1202	12
2324	บางคูเวียง	บางกรวย	11130	120206	1202	12
2325	บางสีทอง	บางกรวย	11130	120203	1202	12
2326	ปลายบาง	บางกรวย	11130	120208	1202	12
2327	มหาสวัสดิ์	บางกรวย	11130	120207	1202	12
2328	วัดชลอ	บางกรวย	11130	120201	1202	12
2329	ศาลากลาง	บางกรวย	11130	120209	1202	12
2330	บางคูรัด	บางบัวทอง	11110	120404	1204	12
2331	บางบัวทอง	บางบัวทอง	11110	120402	1204	12
2332	บางรักพัฒนา	บางบัวทอง	11110	120408	1204	12
2333	บางรักใหญ่	บางบัวทอง	11110	120403	1204	12
2334	พิมลราช	บางบัวทอง	11110	120407	1204	12
2335	ละหาร	บางบัวทอง	11110	120405	1204	12
2336	ลำโพ	บางบัวทอง	11110	120406	1204	12
2337	โสนลอย	บางบัวทอง	11110	120401	1204	12
2338	บางม่วง	บางใหญ่	11140	120301	1203	12
2339	บางเลน	บางใหญ่	11140	120303	1203	12
2340	บางแม่นาง	บางใหญ่	11140	120302	1203	12
2341	บางใหญ่	บางใหญ่	11140	120305	1203	12
2342	บ้านใหม่	บางใหญ่	11140	120306	1203	12
2343	เสาธงหิน	บางใหญ่	11140	120304	1203	12
2344	คลองข่อย	ปากเกร็ด	11120	120610	1206	12
2345	คลองพระอุดม	ปากเกร็ด	11120	120606	1206	12
2346	คลองเกลือ	ปากเกร็ด	11120	120612	1206	12
2347	ท่าอิฐ	ปากเกร็ด	11120	120607	1206	12
2348	บางตลาด	ปากเกร็ด	11120	120602	1206	12
2349	บางตะไนย์	ปากเกร็ด	11120	120605	1206	12
2350	บางพลับ	ปากเกร็ด	11120	120611	1206	12
2351	บางพูด	ปากเกร็ด	11120	120604	1206	12
2352	บ้านใหม่	ปากเกร็ด	11120	120306	1206	12
2353	ปากเกร็ด	ปากเกร็ด	11120	120601	1206	12
2354	อ้อมเกร็ด	ปากเกร็ด	11120	120609	1206	12
2355	เกาะเกร็ด	ปากเกร็ด	11120	120608	1206	12
2356	ตลาดขวัญ	เมืองนนทบุรี	11000	120102	1201	12
2357	ท่าทราย	เมืองนนทบุรี	11000	120105	1201	12
2358	บางกระสอ	เมืองนนทบุรี	11000	120104	1201	12
2359	บางกร่าง	เมืองนนทบุรี	11000	120108	1201	12
2360	บางรักน้อย	เมืองนนทบุรี	11000	120110	1201	12
2361	บางศรีเมือง	เมืองนนทบุรี	11000	120107	1201	12
2362	บางเขน	เมืองนนทบุรี	11000	120103	1201	12
2363	บางไผ่	เมืองนนทบุรี	11000	120106	1201	12
2364	สวนใหญ่	เมืองนนทบุรี	11000	120101	1201	12
2365	ไทรม้า	เมืองนนทบุรี	11000	120109	1201	12
2366	ขุนศรี	ไทรน้อย	11150	120505	1205	12
2367	คลองขวาง	ไทรน้อย	11150	120506	1205	12
2368	ทวีวัฒนา	ไทรน้อย	11150	120507	1205	12
2369	ราษฎร์นิยม	ไทรน้อย	11150	120502	1205	12
2370	หนองเพรางาย	ไทรน้อย	11150	120503	1205	12
2371	ไทรน้อย	ไทรน้อย	11150	120501	1205	12
2372	ไทรใหญ่	ไทรน้อย	11150	120504	1205	12
2373	จะแนะ	จะแนะ	96220	960599	9612	96
2374	ช้างเผือก	จะแนะ	96220	961204	9612	96
2375	ดุซงญอ	จะแนะ	96220	960598	9612	96
2376	ผดุงมาตร	จะแนะ	96220	961203	9612	96
2377	นานาค	ตากใบ	96110	960207	9602	96
2378	บางขุนทอง	ตากใบ	96110	960205	9602	96
2379	พร่อน	ตากใบ	96110	960203	9602	96
2380	ศาลาใหม่	ตากใบ	96110	960204	9602	96
2381	เกาะสะท้อน	ตากใบ	96110	960206	9602	96
2382	เจ๊ะเห	ตากใบ	96110	960201	9602	96
2383	โฆษิต	ตากใบ	96110	960208	9602	96
2384	ไพรวัน	ตากใบ	96110	960202	9602	96
2385	กาเยาะมาตี	บาเจาะ	96170	960303	9603	96
2386	บาเจาะ	บาเจาะ	96170	960301	9603	96
2387	บาเระเหนือ	บาเจาะ	96170	960305	9603	96
2388	บาเระใต้	บาเจาะ	96170	960306	9603	96
2389	ปะลุกาสาเมาะ	บาเจาะ	96170	960304	9603	96
2390	ลุโบะสาวอ	บาเจาะ	96170	960302	9603	96
2391	จอเบาะ	ยี่งอ	96180	960403	9604	96
2392	ตะปอเยาะ	ยี่งอ	96180	960406	9604	96
2393	ยี่งอ	ยี่งอ	96180	960401	9604	96
2394	ละหาร	ยี่งอ	96180	960402	9604	96
2395	ลุโบะบายะ	ยี่งอ	96180	960404	9604	96
2396	ลุโบะบือซา	ยี่งอ	96180	960405	9604	96
2397	กาลิซา	ระแงะ	96130	960507	9605	96
2398	ตันหยงมัส	ระแงะ	96130	960501	9605	96
2399	ตันหยงลิมอ	ระแงะ	96130	960502	9605	96
2400	บองอ	ระแงะ	96220	960506	9605	96
2401	บาโงสะโต	ระแงะ	96130	960508	9605	96
2402	มะรือโบตก	ระแงะ	96130	960510	9605	96
2403	เฉลิม	ระแงะ	96130	960509	9605	96
2404	บาตง	รือเสาะ	96150	960605	9606	96
2405	รือเสาะ	รือเสาะ	96150	960601	9606	96
2406	รือเสาะออก	รือเสาะ	96150	960607	9606	96
2407	ลาโละ	รือเสาะ	96150	960606	9606	96
2408	สามัคคี	รือเสาะ	96150	960604	9606	96
2409	สาวอ	รือเสาะ	96150	960602	9606	96
2410	สุวารี	รือเสาะ	96150	960609	9606	96
2411	เรียง	รือเสาะ	96150	960603	9606	96
2412	โคกสะตอ	รือเสาะ	96150	960608	9606	96
2413	กาหลง	ศรีสาคร	96210	960705	9607	96
2414	ซากอ	ศรีสาคร	96210	960701	9607	96
2415	ตะมะยูง	ศรีสาคร	96210	960698	9607	96
2416	ศรีบรรพต	ศรีสาคร	96210	960706	9607	96
2417	ศรีสาคร	ศรีสาคร	96210	960703	9607	96
2418	เชิงคีรี	ศรีสาคร	96210	960704	9607	96
2419	ภูเขาทอง	สุคิริน	96190	960904	9609	96
2420	มาโมง	สุคิริน	96190	960901	9609	96
2421	ร่มไทร	สุคิริน	96190	960905	9609	96
2422	สุคิริน	สุคิริน	96190	960902	9609	96
2423	เกียร์	สุคิริน	96190	960903	9609	96
2424	กาวะ	สุไหงปาดี	96140	961106	9611	96
2425	ปะลุรู	สุไหงปาดี	96140	961101	9611	96
2426	ริโก๋	สุไหงปาดี	96140	961105	9611	96
2427	สากอ	สุไหงปาดี	96140	961104	9611	96
2428	สุไหงปาดี	สุไหงปาดี	96140	961102	9611	96
2429	โต๊ะเด็ง	สุไหงปาดี	96140	961103	9611	96
2430	ปาเสมัส	สุไหงโก-ลก	96120	961002	9610	96
2431	ปูโยะ	สุไหงโก-ลก	96120	961004	9610	96
2432	มูโนะ	สุไหงโก-ลก	96120	961003	9610	96
2433	สุไหงโก-ลก	สุไหงโก-ลก	96120	961001	9610	96
2434	จวบ	เจาะไอร้อง	96130	960503	9613	96
2435	บูกิต	เจาะไอร้อง	96130	960505	9613	96
2436	มะรือโบออก	เจาะไอร้อง	96130	961303	9613	96
2437	กะลุวอ	เมืองนราธิวาส	96000	960105	9601	96
2438	กะลุวอเหนือ	เมืองนราธิวาส	96000	960106	9601	96
2439	บางนาค	เมืองนราธิวาส	96000	960101	9601	96
2440	บางปอ	เมืองนราธิวาส	96000	960104	9601	96
2441	มะนังตายอ	เมืองนราธิวาส	96000	960103	9601	96
2442	ลำภู	เมืองนราธิวาส	96000	960102	9601	96
2443	โคกเคียน	เมืองนราธิวาส	96000	960107	9601	96
2444	กายูคละ	แว้ง	96160	960802	9608	96
2445	ฆอเลาะ	แว้ง	96160	960803	9608	96
2446	เอราวัณ	แว้ง	96160	960806	9608	96
2447	แม่ดง	แว้ง	96160	960805	9608	96
2448	แว้ง	แว้ง	96160	960801	9608	96
2449	โละจูด	แว้ง	96160	960804	9608	96
2450	งอบ	ทุ่งช้าง	55130	550802	5508	55
2451	ทุ่งช้าง	ทุ่งช้าง	55130	550804	5508	55
2452	ปอน	ทุ่งช้าง	55130	550801	5508	55
2453	และ	ทุ่งช้าง	55130	550803	5508	55
2454	จอมพระ	ท่าวังผา	55140	550607	5506	55
2455	ตาลชุม	ท่าวังผา	55140	550605	5506	55
2456	ท่าวังผา	ท่าวังผา	55140	550609	5506	55
2457	ป่าคา	ท่าวังผา	55140	550602	5506	55
2458	ผาตอ	ท่าวังผา	55140	550603	5506	55
2459	ผาทอง	ท่าวังผา	55140	550610	5506	55
2460	ยม	ท่าวังผา	55140	550604	5506	55
2461	ริม	ท่าวังผา	55140	550601	5506	55
2462	ศรีภูมิ	ท่าวังผา	55140	550606	5506	55
2463	แสนทอง	ท่าวังผา	55140	550608	5506	55
2464	นาน้อย	นาน้อย	55150	550401	5504	55
2465	น้ำตก	นาน้อย	55150	550407	5504	55
2466	บัวใหญ่	นาน้อย	55150	550406	5504	55
2467	ศรีษะเกษ	นาน้อย	55150	550403	5504	55
2468	สถาน	นาน้อย	55150	550404	5504	55
2469	สันทะ	นาน้อย	55150	550405	5504	55
2470	เชียงของ	นาน้อย	55150	550402	5504	55
2471	นาทะนุง	นาหมื่น	55180	551001	5510	55
2472	บ่อแก้ว	นาหมื่น	55180	551002	5510	55
2473	ปิงหลวง	นาหมื่น	55180	551004	5510	55
2474	เมืองลี	นาหมื่น	55180	551003	5510	55
2475	ดงพญา	บ่อเกลือ	55220	551205	5512	55
2476	บ่อเกลือเหนือ	บ่อเกลือ	55220	550507	5512	55
2477	บ่อเกลือใต้	บ่อเกลือ	55220	550508	5512	55
2478	ภูฟ้า	บ่อเกลือ	55220	551204	5512	55
2479	บ้านพี้	บ้านหลวง	55190	550304	5503	55
2480	บ้านฟ้า	บ้านหลวง	55190	550198	5503	55
2481	ป่าคาหลวง	บ้านหลวง	55190	550196	5503	55
2482	สวด	บ้านหลวง	55190	550303	5503	55
2483	ปัว	ปัว	55120	550501	5505	55
2484	ป่ากลาง	ปัว	55120	550513	5505	55
2485	ภูคา	ปัว	55120	550511	5505	55
2486	วรนคร	ปัว	55120	550514	5505	55
2487	ศิลาเพชร	ปัว	55120	550505	5505	55
2488	ศิลาแลง	ปัว	55120	550504	5505	55
2489	สกาด	ปัว	55120	550512	5505	55
2490	สถาน	ปัว	55120	550404	5505	55
2491	อวน	ปัว	55120	550506	5505	55
2492	เจดีย์ชัย	ปัว	55120	550510	5505	55
2493	แงง	ปัว	55120	550502	5505	55
2494	ไชยวัฒนา	ปัว	55120	550509	5505	55
2495	ท่าน้าว	ภูเพียง	55000	550112	5514	55
2496	นาปัง	ภูเพียง	55000	550113	5514	55
2497	น้ำเกี๋ยน	ภูเพียง	55000	550118	5514	55
2498	น้ำแก่น	ภูเพียง	55000	550115	5514	55
2499	ฝายแก้ว	ภูเพียง	55000	550110	5514	55
2500	ม่วงตึ๊ด	ภูเพียง	55000	550111	5514	55
2501	เมืองจัง	ภูเพียง	55000	550114	5514	55
2502	ชนแดน	สองแคว	55160	551302	5513	55
2503	นาไร่หลวง	สองแคว	55160	550998	5513	55
2504	ยอด	สองแคว	55160	550999	5513	55
2505	ดู่พงษ์	สันติสุข	55210	550199	5511	55
2506	ป่าแลวหลวง	สันติสุข	55210	551102	5511	55
2507	พงษ์	สันติสุข	55210	550201	5511	55
2508	ขุนน่าน	เฉลิมพระเกียรติ	55130	551203	5515	55
2509	ห้วยโก๋น	เฉลิมพระเกียรติ	55130	550805	5515	55
2510	พญาแก้ว	เชียงกลาง	55160	550908	5509	55
2511	พระธาตุ	เชียงกลาง	55160	550904	5509	55
2512	พระพุทธบาท	เชียงกลาง	55160	550909	5509	55
2513	เชียงกลาง	เชียงกลาง	55160	550899	5509	55
2514	เชียงคาน	เชียงกลาง	55160	550903	5509	55
2515	เปือ	เชียงกลาง	55160	550898	5509	55
2516	กองควาย	เมืองน่าน	55000	550109	5501	55
2517	ดู่ใต้	เมืองน่าน	55000	550108	5501	55
2518	ถืมตอง	เมืองน่าน	55000	550105	5501	55
2519	นาซาว	เมืองน่าน	55000	550107	5501	55
2520	บ่อ	เมืองน่าน	55000	550102	5501	55
2521	ผาสิงห์	เมืองน่าน	55000	550103	5501	55
2522	สวก	เมืองน่าน	55000	550116	5501	55
2523	สะเนียน	เมืองน่าน	55000	550117	5501	55
2524	เรือง	เมืองน่าน	55000	550106	5501	55
2525	ในเวียง	เมืองน่าน	55000	550101	5501	55
2526	ไชยสถาน	เมืองน่าน	55000	550104	5501	55
2527	กลางเวียง	เวียงสา	55110	550701	5507	55
2528	ขึ่ง	เวียงสา	55110	550702	5507	55
2529	จอมจันทร์	เวียงสา	55110	550715	5507	55
2530	ตาลชุม	เวียงสา	55110	550605	5507	55
2531	ทุ่งศรีทอง	เวียงสา	55110	550717	5507	55
2532	นาเหลือง	เวียงสา	55110	550705	5507	55
2533	น้ำปั้ว	เวียงสา	55110	550708	5507	55
2534	น้ำมวบ	เวียงสา	55110	550707	5507	55
2535	ปงสนุก	เวียงสา	55110	550710	5507	55
2536	ยาบหัวนา	เวียงสา	55110	550709	5507	55
2537	ส้าน	เวียงสา	55110	550706	5507	55
2538	ส้านนาหนองใหม่	เวียงสา	55110	550712	5507	55
2539	อ่ายนาไลย	เวียงสา	55110	550711	5507	55
2540	แม่ขะนิง	เวียงสา	55110	550713	5507	55
2541	แม่สา	เวียงสา	55110	550716	5507	55
2542	แม่สาคร	เวียงสา	55110	550714	5507	55
2543	ไหล่น่าน	เวียงสา	55110	550703	5507	55
2544	น้ำปาย	แม่จริม	55170	550205	5502	55
2545	น้ำพาง	แม่จริม	55170	550204	5502	55
2546	หนองแดง	แม่จริม	55170	550202	5502	55
2547	หมอเมือง	แม่จริม	55170	550197	5502	55
2548	แม่จริม	แม่จริม	55170	550206	5502	55
2549	ดงบัง	บึงโขงหลง	38220	false	false	38
2550	ท่าดอกคำ	บึงโขงหลง	38220	false	false	38
2551	บึงโขงหลง	บึงโขงหลง	38220	false	false	38
2552	โพธิ์หมากแข้ง	บึงโขงหลง	38220	false	false	38
2553	บุ่งคล้า	บุ่งคล้า	38000	false	false	38
2554	หนองเดิ่น	บุ่งคล้า	38000	false	false	38
2555	โคกกว้าง	บุ่งคล้า	38000	false	false	38
2556	นากั้ง	ปากคาด	38190	false	false	38
2557	นาดง	ปากคาด	38190	false	false	38
2558	ปากคาด	ปากคาด	38190	false	false	38
2559	สมสนุก	ปากคาด	38190	false	false	38
2560	หนองยอง	ปากคาด	38190	false	false	38
2561	โนนศิลา	ปากคาด	38190	false	false	38
2562	ดอนหญ้านาง	พรเจริญ	38180	false	false	38
2563	ป่าแฝก	พรเจริญ	38180	false	false	38
2564	พรเจริญ	พรเจริญ	38180	false	false	38
2565	วังชมภู	พรเจริญ	38180	false	false	38
2566	ศรีชมภู	พรเจริญ	38180	false	false	38
2567	ศรีสำราญ	พรเจริญ	38180	false	false	38
2568	หนองหัวช้าง	พรเจริญ	38180	false	false	38
2569	ชุมภูพร	ศรีวิไล	38210	false	false	38
2570	นาสะแบง	ศรีวิไล	38210	false	false	38
2571	นาสิงห์	ศรีวิไล	38210	false	false	38
2572	นาแสง	ศรีวิไล	38210	false	false	38
2573	ศรีวิไล	ศรีวิไล	38210	false	false	38
2574	ซาง	เซกา	38150	false	false	38
2575	ท่ากกแดง	เซกา	38150	false	false	38
2576	ท่าสะอาด	เซกา	38150	false	false	38
2577	น้ำจั้น	เซกา	38150	false	false	38
2578	บ้านต้อง	เซกา	38150	false	false	38
2579	ป่งไฮ	เซกา	38150	false	false	38
2580	หนองทุ่ม	เซกา	38150	false	false	38
2581	เซกา	เซกา	38150	false	false	38
2582	โสกก่าม	เซกา	38150	false	false	38
2583	คำนาดี	เมืองบึงกาฬ	38000	false	false	38
2584	ชัยพร	เมืองบึงกาฬ	38000	false	false	38
2585	นาสวรรค์	เมืองบึงกาฬ	38000	false	false	38
2586	บึงกาฬ	เมืองบึงกาฬ	38000	false	false	38
2587	วิศิษฐ์	เมืองบึงกาฬ	38000	false	false	38
2588	โนนสว่าง	เมืองบึงกาฬ	38000	false	false	38
2589	หนองเลิง	เมืองบึงกาฬ	38000	false	false	38
2590	หอคำ	เมืองบึงกาฬ	38000	false	false	38
2591	โคกก่อง	เมืองบึงกาฬ	38000	false	false	38
2592	โนนสมบูรณ์	เมืองบึงกาฬ	38000	false	false	38
2593	โป่งเปือย	เมืองบึงกาฬ	38000	false	false	38
2594	ไคสี	เมืองบึงกาฬ	38000	false	false	38
2595	คำแก้ว	โซ่พิสัย	38170	false	false	38
2596	ถ้ำเจริญ	โซ่พิสัย	38170	false	false	38
2597	บัวตูม	โซ่พิสัย	38170	false	false	38
2598	ศรีชมภู	โซ่พิสัย	38170	false	false	38
2599	หนองพันทา	โซ่พิสัย	38170	false	false	38
2600	เหล่าทอง	โซ่พิสัย	38170	false	false	38
2601	โซ่	โซ่พิสัย	38170	false	false	38
2602	กระสัง	กระสัง	31160	310127	3103	31
2603	กันทรารมย์	กระสัง	31160	310310	3103	31
2604	ชุมแสง	กระสัง	31160	310307	3103	31
2605	บ้านปรือ	กระสัง	31160	310308	3103	31
2606	ลำดวน	กระสัง	31160	310302	3103	31
2607	ศรีภูมิ	กระสัง	31160	310311	3103	31
2608	สองชั้น	กระสัง	31160	310303	3103	31
2609	สูงเนิน	กระสัง	31160	310304	3103	31
2610	หนองเต็ง	กระสัง	31160	310305	3103	31
2611	ห้วยสำราญ	กระสัง	31160	310309	3103	31
2612	เมืองไผ่	กระสัง	31160	310306	3103	31
2613	คูเมือง	คูเมือง	31190	310201	3102	31
2614	ตูมใหญ่	คูเมือง	31190	310206	3102	31
2615	บ้านแพ	คูเมือง	31190	310203	3102	31
2616	ปะเคียบ	คูเมือง	31190	310198	3102	31
2617	พรสำราญ	คูเมือง	31190	310204	3102	31
2618	หนองขมาร	คูเมือง	31190	310207	3102	31
2619	หินเหล็กไฟ	คูเมือง	31190	310205	3102	31
2620	ชำนิ	ชำนิ	31110	310404	3118	31
2621	ช่อผกา	ชำนิ	31110	310422	3118	31
2622	ละลวด	ชำนิ	31110	310423	3118	31
2623	หนองปล่อง	ชำนิ	31110	310407	3118	31
2624	เมืองยาง	ชำนิ	31110	310410	3118	31
2625	โคกสนวน	ชำนิ	31110	311806	3118	31
2626	ก้านเหลือง	นางรอง	31110	310415	3104	31
2627	ชุมแสง	นางรอง	31110	310307	3104	31
2628	ถนนหัก	นางรอง	31110	310413	3104	31
2629	ทรัพย์พระยา	นางรอง	31110	310418	3104	31
2630	ทุ่งแสงทอง	นางรอง	31110	310426	3104	31
2631	นางรอง	นางรอง	31110	310401	3104	31
2632	บ้านสิงห์	นางรอง	31110	310416	3104	31
2633	ลำไทรโยง	นางรอง	31110	310417	3104	31
2634	สะเดา	นางรอง	31110	310403	3104	31
2635	หนองกง	นางรอง	31110	310408	3104	31
2864	ชัยเกษม	บางสะพาน	77190	770405	7704	77
2636	หนองยายพิมพ์	นางรอง	31110	310424	3104	31
2637	หนองโบสถ์	นางรอง	31110	310406	3104	31
2638	หนองโสน	นางรอง	31110	310427	3104	31
2639	หนองไทร	นางรอง	31110	310414	3104	31
2640	หัวถนน	นางรอง	31110	310425	3104	31
2641	ดอนกอก	นาโพธิ์	31230	311304	3113	31
2642	นาโพธิ์	นาโพธิ์	31230	311301	3113	31
2643	บ้านคู	นาโพธิ์	31230	311302	3113	31
2644	บ้านดู่	นาโพธิ์	31230	311303	3113	31
2645	ศรีสว่าง	นาโพธิ์	31230	311305	3113	31
2646	จันทบเพชร	บ้านกรวด	31180	310808	3108	31
2647	บึงเจริญ	บ้านกรวด	31180	310807	3108	31
2648	บ้านกรวด	บ้านกรวด	31180	310801	3108	31
2649	ปราสาท	บ้านกรวด	31180	310111	3108	31
2650	สายตะกู	บ้านกรวด	31180	310805	3108	31
2651	หนองไม้งาม	บ้านกรวด	31180	310803	3108	31
2652	หินลาด	บ้านกรวด	31180	310806	3108	31
2653	เขาดินเหนือ	บ้านกรวด	31180	310809	3108	31
2654	โนนเจริญ	บ้านกรวด	31180	310802	3108	31
2655	บ้านด่าน	บ้านด่าน	31000	310109	3121	31
2656	ปราสาท	บ้านด่าน	31000	310111	3121	31
2657	วังเหนือ	บ้านด่าน	31000	310123	3121	31
2658	โนนขวาง	บ้านด่าน	31000	310115	3121	31
2659	กู่สวนแตง	บ้านใหม่ไชยพจน์	31120	310911	3119	31
2660	ทองหลาง	บ้านใหม่ไชยพจน์	31120	310905	3119	31
2661	หนองเยือง	บ้านใหม่ไชยพจน์	31120	310912	3119	31
2662	หนองแวง	บ้านใหม่ไชยพจน์	31120	310607	3119	31
2663	แดงใหญ่	บ้านใหม่ไชยพจน์	31120	311903	3119	31
2664	จรเข้มาก	ประโคนชัย	31140	310706	3107	31
2665	ตะโกตาพิ	ประโคนชัย	31140	310714	3107	31
2666	บ้านไทร	ประโคนชัย	31140	310703	3107	31
2667	ประทัดบุ	ประโคนชัย	31140	310720	3107	31
2668	ประโคนชัย	ประโคนชัย	31140	310701	3107	31
2669	ปังกู	ประโคนชัย	31140	310707	3107	31
2670	ละเวี้ย	ประโคนชัย	31140	310705	3107	31
2671	สี่เหลี่ยม	ประโคนชัย	31140	310721	3107	31
2672	หนองบอน	ประโคนชัย	31140	310716	3107	31
2673	เขาคอก	ประโคนชัย	31140	310715	3107	31
2674	แสลงโทน	ประโคนชัย	31140	310702	3107	31
2675	โคกตูม	ประโคนชัย	31140	310719	3107	31
2676	โคกมะขาม	ประโคนชัย	31140	310718	3107	31
2677	โคกม้า	ประโคนชัย	31140	310710	3107	31
2678	โคกย่าง	ประโคนชัย	31140	310708	3107	31
2679	ไพศาล	ประโคนชัย	31140	310713	3107	31
2680	ปะคำ	ปะคำ	31220	311201	3112	31
2681	หนองบัว	ปะคำ	31220	311203	3112	31
2682	หูทำนบ	ปะคำ	31220	311205	3112	31
2683	โคกมะม่วง	ปะคำ	31220	311204	3112	31
2684	ไทยเจริญ	ปะคำ	31220	310699	3112	31
2685	จันดุม	พลับพลาชัย	31250	310704	3115	31
2686	ป่าชัน	พลับพลาชัย	31250	310711	3115	31
2687	สะเดา	พลับพลาชัย	31250	310403	3115	31
2688	สำโรง	พลับพลาชัย	31250	310717	3115	31
2689	โคกขมิ้น	พลับพลาชัย	31250	310709	3115	31
2690	บ้านจาน	พุทไธสง	31120	310903	3109	31
2691	บ้านยาง	พุทไธสง	31120	310108	3109	31
2692	บ้านเป้า	พุทไธสง	31120	310906	3109	31
2693	บ้านแวง	พุทไธสง	31120	310907	3109	31
2694	พุทไธสง	พุทไธสง	31120	310901	3109	31
2695	มะเฟือง	พุทไธสง	31120	310902	3109	31
2696	หายโศก	พุทไธสง	31120	310910	3109	31
2697	ตาจง	ละหานทราย	31170	310603	3106	31
2698	ละหานทราย	ละหานทราย	31170	310601	3106	31
2699	สำโรงใหม่	ละหานทราย	31170	310604	3106	31
2700	หนองตะครอง	ละหานทราย	31170	310610	3106	31
2701	หนองแวง	ละหานทราย	31170	310607	3106	31
2702	โคกว่าน	ละหานทราย	31170	310611	3106	31
2703	ตลาดโพธิ์	ลำปลายมาศ	31130	311005	3110	31
2704	ทะเมนชัย	ลำปลายมาศ	31130	311004	3110	31
2705	บุโพธิ์	ลำปลายมาศ	31130	311015	3110	31
2706	บ้านยาง	ลำปลายมาศ	31130	310108	3110	31
2707	ผไทรินทร์	ลำปลายมาศ	31130	311011	3110	31
2708	ลำปลายมาศ	ลำปลายมาศ	31130	311001	3110	31
2709	หนองกะทิง	ลำปลายมาศ	31130	311006	3110	31
2710	หนองคู	ลำปลายมาศ	31130	311002	3110	31
2711	หนองบัวโคก	ลำปลายมาศ	31130	311014	3110	31
2712	หนองโดน	ลำปลายมาศ	31130	311016	3110	31
2713	หินโคน	ลำปลายมาศ	31130	311013	3110	31
2714	เมืองแฝก	ลำปลายมาศ	31130	311009	3110	31
2715	แสลงพัน	ลำปลายมาศ	31130	311003	3110	31
2716	โคกกลาง	ลำปลายมาศ	31130	311007	3110	31
2717	โคกล่าม	ลำปลายมาศ	31130	311012	3110	31
2718	โคกสะอาด	ลำปลายมาศ	31130	311008	3110	31
2719	กระสัง	สตึก	31150	310127	3111	31
2720	ชุมแสง	สตึก	31150	310307	3111	31
2721	ดอนมนต์	สตึก	31150	311109	3111	31
2722	ทุ่งวัง	สตึก	31150	311103	3111	31
2723	ท่าม่วง	สตึก	31150	311111	3111	31
2724	นิคม	สตึก	31150	311102	3111	31
2725	ร่อนทอง	สตึก	31150	311106	3111	31
2726	สตึก	สตึก	31150	311101	3111	31
2727	สนามชัย	สตึก	31150	311114	3111	31
2728	สะแก	สตึก	31150	311112	3111	31
2729	หนองใหญ่	สตึก	31150	311105	3111	31
2730	เมืองแก	สตึก	31150	311104	3111	31
2731	ดอนอะราง	หนองกี่	31210	310496	3105	31
2732	ทุ่งกระตาดพัฒนา	หนองกี่	31210	310506	3105	31
2733	ทุ่งกระเต็น	หนองกี่	31210	310507	3105	31
2734	ท่าโพธิ์ชัย	หนองกี่	31210	310508	3105	31
2735	บุกระสัง	หนองกี่	31210	310510	3105	31
2736	หนองกี่	หนองกี่	31210	310499	3105	31
2737	เมืองไผ่	หนองกี่	31210	310306	3105	31
2738	เย้ยปราสาท	หนองกี่	31210	310498	3105	31
2739	โคกสว่าง	หนองกี่	31210	310505	3105	31
2740	โคกสูง	หนองกี่	31210	310509	3105	31
2741	สระทอง	หนองหงส์	31240	311407	3114	31
2742	สระแก้ว	หนองหงส์	31240	311099	3114	31
2743	หนองชัยศรี	หนองหงส์	31240	311404	3114	31
2744	ห้วยหิน	หนองหงส์	31240	311098	3114	31
2745	เมืองฝ้าย	หนองหงส์	31240	311406	3114	31
2746	เสาเดียว	หนองหงส์	31240	311405	3114	31
2747	ไทยสามัคคี	หนองหงส์	31240	311097	3114	31
2748	ตาเสา	ห้วยราช	31000	310116	3116	31
2749	บ้านตะโก	ห้วยราช	31000	310124	3116	31
2750	สนวน	ห้วยราช	31000	310121	3116	31
2751	สามแวง	ห้วยราช	31000	310110	3116	31
2752	ห้วยราช	ห้วยราช	31000	310107	3116	31
2753	ห้วยราชา	ห้วยราช	31000	311608	3116	31
2754	เมืองโพธิ์	ห้วยราช	31000	311607	3116	31
2755	โคกเหล็ก	ห้วยราช	31000	311606	3116	31
2756	ตาเป๊ก	เฉลิมพระเกียรติ	31110	310402	3123	31
2757	ถาวร	เฉลิมพระเกียรติ	31170	310602	3123	31
2758	ยายแย้มวัฒนา	เฉลิมพระเกียรติ	31170	310606	3123	31
2759	อีสานเขต	เฉลิมพระเกียรติ	31110	310419	3123	31
2760	เจริญสุข	เฉลิมพระเกียรติ	31110	310411	3123	31
2761	กระสัง	เมืองบุรีรัมย์	31000	310127	3101	31
2762	กลันทา	เมืองบุรีรัมย์	31000	310126	3101	31
2763	ชุมเห็ด	เมืองบุรีรัมย์	31000	310120	3101	31
2764	ถลุงเหล็ก	เมืองบุรีรัมย์	31000	310113	3101	31
2765	บัวทอง	เมืองบุรีรัมย์	31000	310119	3101	31
2766	บ้านบัว	เมืองบุรีรัมย์	31000	310104	3101	31
2767	บ้านยาง	เมืองบุรีรัมย์	31000	310108	3101	31
2768	พระครู	เมืองบุรีรัมย์	31000	310112	3101	31
2769	ลุมปุ๊ก	เมืองบุรีรัมย์	31000	310117	3101	31
2770	สวายจีก	เมืองบุรีรัมย์	31000	310106	3101	31
2771	สองห้อง	เมืองบุรีรัมย์	31000	310118	3101	31
2772	สะแกซำ	เมืองบุรีรัมย์	31000	310125	3101	31
2773	สะแกโพรง	เมืองบุรีรัมย์	31000	310105	3101	31
2774	หนองตาด	เมืองบุรีรัมย์	31000	310114	3101	31
2775	หลักเขต	เมืองบุรีรัมย์	31000	310122	3101	31
2776	อิสาณ	เมืองบุรีรัมย์	31000	310102	3101	31
2777	เมืองฝาง	เมืองบุรีรัมย์	31000	310128	3101	31
2778	เสม็ด	เมืองบุรีรัมย์	31000	310103	3101	31
2779	ในเมือง	เมืองบุรีรัมย์	31000	310101	3101	31
2780	ดงพลอง	แคนดง	31150	311108	3122	31
2781	สระบัว	แคนดง	31150	311113	3122	31
2782	หัวฝาย	แคนดง	31150	311116	3122	31
2783	แคนดง	แคนดง	31150	311107	3122	31
2784	ลำนางรอง	โนนดินแดง	31260	310608	3120	31
2785	ส้มป่อย	โนนดินแดง	31260	310609	3120	31
2786	โนนดินแดง	โนนดินแดง	31260	310605	3120	31
2787	ดงอีจาน	โนนสุวรรณ	31110	310420	3117	31
2788	ทุ่งจังหัน	โนนสุวรรณ	31110	310409	3117	31
2789	โกรกแก้ว	โนนสุวรรณ	31110	310421	3117	31
2790	โนนสุวรรณ	โนนสุวรรณ	31110	310412	3117	31
2791	คลองสอง	คลองหลวง	12120	130202	1302	13
2792	คลองสาม	คลองหลวง	12120	130203	1302	13
2793	คลองสี่	คลองหลวง	12120	130204	1302	13
2794	คลองหก	คลองหลวง	12120	130206	1302	13
2795	คลองหนึ่ง	คลองหลวง	12120	130201	1302	13
2796	คลองห้า	คลองหลวง	12120	130205	1302	13
2797	คลองเจ็ด	คลองหลวง	12120	130207	1302	13
2798	บึงน้ำรักษ์	ธัญบุรี	12110	130306	1303	13
2799	บึงยี่โถ	ธัญบุรี	12130	130302	1303	13
2800	บึงสนั่น	ธัญบุรี	12110	130305	1303	13
2801	ประชาธิปัตย์	ธัญบุรี	12130	130301	1303	13
2802	รังสิต	ธัญบุรี	12110	130303	1303	13
2803	ลำผักกูด	ธัญบุรี	12110	130304	1303	13
2804	คลองพระอุดม	ลาดหลุมแก้ว	12140	130505	1305	13
2805	คูขวาง	ลาดหลุมแก้ว	12140	130504	1305	13
2806	คูบางหลวง	ลาดหลุมแก้ว	12140	130503	1305	13
2807	บ่อเงิน	ลาดหลุมแก้ว	12140	130506	1305	13
2808	ระแหง	ลาดหลุมแก้ว	12140	130501	1305	13
2809	ลาดหลุมแก้ว	ลาดหลุมแก้ว	12140	130502	1305	13
2810	หน้าไม้	ลาดหลุมแก้ว	12140	130507	1305	13
2811	คูคต	ลำลูกกา	12130	130601	1306	13
2812	บึงคอไห	ลำลูกกา	12150	130607	1306	13
2813	บึงคำพร้อย	ลำลูกกา	12150	130603	1306	13
2814	บึงทองหลาง	ลำลูกกา	12150	130605	1306	13
2815	พืชอุดม	ลำลูกกา	12150	130608	1306	13
2816	ลาดสวาย	ลำลูกกา	12150	130602	1306	13
2817	ลำลูกกา	ลำลูกกา	12150	130604	1306	13
2818	ลำไทร	ลำลูกกา	12150	130606	1306	13
2819	กระแชง	สามโคก	12160	130704	1307	13
2820	คลองควาย	สามโคก	12160	130702	1307	13
2821	ท้ายเกาะ	สามโคก	12160	130711	1307	13
2822	บางกระบือ	สามโคก	12160	130710	1307	13
2823	บางเตย	สามโคก	12160	130701	1307	13
2824	บางโพธิ์เหนือ	สามโคก	12160	130705	1307	13
2825	บ้านงิ้ว	สามโคก	12160	130708	1307	13
2826	บ้านปทุม	สามโคก	12160	130707	1307	13
2827	สามโคก	สามโคก	12160	130703	1307	13
2828	เชียงรากน้อย	สามโคก	12160	130709	1307	13
2829	เชียงรากใหญ่	สามโคก	12160	130706	1307	13
2830	นพรัตน์	หนองเสือ	12170	130407	1304	13
2831	บึงกาสาม	หนองเสือ	12170	130403	1304	13
2832	บึงชำอ้อ	หนองเสือ	12170	130404	1304	13
2833	บึงบอน	หนองเสือ	12170	130402	1304	13
2834	บึงบา	หนองเสือ	12170	130401	1304	13
2835	ศาลาครุ	หนองเสือ	12170	130406	1304	13
2836	หนองสามวัง	หนองเสือ	12170	130405	1304	13
2837	บางกะดี	เมืองปทุมธานี	12000	130112	1301	13
2838	บางขะแยง	เมืองปทุมธานี	12000	130106	1301	13
2839	บางคูวัด	เมืองปทุมธานี	12000	130107	1301	13
2840	บางปรอก	เมืองปทุมธานี	12000	130101	1301	13
2841	บางพูด	เมืองปทุมธานี	12000	130110	1301	13
2842	บางพูน	เมืองปทุมธานี	12000	130111	1301	13
2843	บางหลวง	เมืองปทุมธานี	12000	130108	1301	13
2844	บางเดื่อ	เมืองปทุมธานี	12000	130109	1301	13
2845	บ้านกระแชง	เมืองปทุมธานี	12000	130105	1301	13
2846	บ้านกลาง	เมืองปทุมธานี	12000	130103	1301	13
2847	บ้านฉาง	เมืองปทุมธานี	12000	130104	1301	13
2848	บ้านใหม่	เมืองปทุมธานี	12000	130102	1301	13
2849	สวนพริกไทย	เมืองปทุมธานี	12000	130113	1301	13
2850	หลักหก	เมืองปทุมธานี	12000	130114	1301	13
2851	กุยบุรี	กุยบุรี	77150	770201	7702	77
2852	กุยเหนือ	กุยบุรี	77150	770202	7702	77
2853	ดอนยายหนู	กุยบุรี	77150	770204	7702	77
2854	สามกระทาย	กุยบุรี	77150	770206	7702	77
2855	หาดขาม	กุยบุรี	77150	770207	7702	77
2856	เขาแดง	กุยบุรี	77150	770203	7702	77
2857	ทับสะแก	ทับสะแก	77130	770301	7703	77
2858	นาหูกวาง	ทับสะแก	77130	770303	7703	77
2859	ห้วยยาง	ทับสะแก	77130	770305	7703	77
2860	อ่างทอง	ทับสะแก	77130	770302	7703	77
2861	เขาล้าน	ทับสะแก	77130	770304	7703	77
2862	แสงอรุณ	ทับสะแก	77130	770306	7703	77
2863	กำเนิดนพคุณ	บางสะพาน	77140	770401	7704	77
2865	ทองมงคล	บางสะพาน	77230	770406	7704	77
2866	ธงชัย	บางสะพาน	77190	770404	7704	77
2867	พงศ์ประศาสน์	บางสะพาน	77140	770402	7704	77
2868	ร่อนทอง	บางสะพาน	77230	770403	7704	77
2869	แม่รำพึง	บางสะพาน	77140	770407	7704	77
2870	ช้างแรก	บางสะพานน้อย	77170	770504	7705	77
2871	ทรายทอง	บางสะพานน้อย	77170	770503	7705	77
2872	บางสะพาน	บางสะพานน้อย	77170	770502	7705	77
2873	ปากแพรก	บางสะพานน้อย	77170	770501	7705	77
2874	ไชยราช	บางสะพานน้อย	77170	770505	7705	77
2875	ปราณบุรี	ปราณบุรี	77120	770601	7706	77
2876	ปราณบุรี	ปราณบุรี	77160	770601	7706	77
2877	ปากน้ำปราณ	ปราณบุรี	77220	770604	7706	77
2878	วังก์พง	ปราณบุรี	77120	770608	7706	77
2879	วังก์พง	ปราณบุรี	77160	770608	7706	77
2880	หนองตาแต้ม	ปราณบุรี	77120	770607	7706	77
2881	หนองตาแต้ม	ปราณบุรี	77160	770607	7706	77
2882	เขาจ้าว	ปราณบุรี	77120	770609	7706	77
2883	เขาจ้าว	ปราณบุรี	77160	770609	7706	77
2884	เขาน้อย	ปราณบุรี	77120	770602	7706	77
2885	เขาน้อย	ปราณบุรี	77160	770602	7706	77
2886	ศาลาลัย	สามร้อยยอด	77180	770804	7708	77
2887	ศิลาลอย	สามร้อยยอด	77180	770603	7708	77
2888	สามร้อยยอด	สามร้อยยอด	77120	770605	7708	77
2889	สามร้อยยอด	สามร้อยยอด	77160	770605	7708	77
2890	ไร่เก่า	สามร้อยยอด	77180	770606	7708	77
2891	ไร่ใหม่	สามร้อยยอด	77180	770205	7708	77
2892	ทับใต้	หัวหิน	77110	770705	7707	77
2893	บึงนคร	หัวหิน	77110	770707	7707	77
2894	หนองพลับ	หัวหิน	77110	770704	7707	77
2895	หนองแก	หัวหิน	77110	770702	7707	77
2896	หัวหิน	หัวหิน	77110	770701	7707	77
2897	หินเหล็กไฟ	หัวหิน	77110	770703	7707	77
2898	ห้วยสัตว์ใหญ่	หัวหิน	77110	770706	7707	77
2899	คลองวาฬ	เมืองประจวบคีรีขันธ์	77000	770103	7701	77
2900	บ่อนอก	เมืองประจวบคีรีขันธ์	77210	770106	7701	77
2901	ประจวบคีรีขันธ์	เมืองประจวบคีรีขันธ์	77000	770101	7701	77
2902	ห้วยทราย	เมืองประจวบคีรีขันธ์	77000	770104	7701	77
2903	อ่าวน้อย	เมืองประจวบคีรีขันธ์	77210	770105	7701	77
2904	เกาะหลัก	เมืองประจวบคีรีขันธ์	77000	770102	7701	77
2905	กบินทร์	กบินทร์บุรี	25110	250201	2502	25
2906	นนทรี	กบินทร์บุรี	25110	250204	2502	25
2907	นาแขม	กบินทร์บุรี	25110	250212	2502	25
2908	บ่อทอง	กบินทร์บุรี	25110	250210	2502	25
2909	บ้านนา	กบินทร์บุรี	25110	250209	2502	25
2910	ย่านรี	กบินทร์บุรี	25110	250205	2502	25
2911	ลาดตะเคียน	กบินทร์บุรี	25110	250208	2502	25
2912	วังดาล	กบินทร์บุรี	25110	250203	2502	25
2913	วังตะเคียน	กบินทร์บุรี	25110	250206	2502	25
2914	วังท่าช้าง	กบินทร์บุรี	25110	250214	2502	25
2915	หนองกี่	กบินทร์บุรี	25110	250211	2502	25
2916	หาดนางแก้ว	กบินทร์บุรี	25110	250207	2502	25
2917	เขาไม้แก้ว	กบินทร์บุรี	25110	250213	2502	25
2918	เมืองเก่า	กบินทร์บุรี	25240	250202	2502	25
2919	ทุ่งโพธิ์	นาดี	25220	250299	2503	25
2920	นาดี	นาดี	25220	250297	2503	25
2921	บุพราหมณ์	นาดี	25220	250306	2503	25
2922	สะพานหิน	นาดี	25220	250296	2503	25
2923	สำพันตา	นาดี	25220	250302	2503	25
2924	แก่งดินสอ	นาดี	25220	250305	2503	25
2925	กระทุ่มแพ้ว	บ้านสร้าง	25150	250609	2506	25
2926	บางกระเบา	บ้านสร้าง	25150	250602	2506	25
2927	บางขาม	บ้านสร้าง	25150	250608	2506	25
2928	บางปลาร้า	บ้านสร้าง	25150	250607	2506	25
2929	บางพลวง	บ้านสร้าง	25150	250606	2506	25
2930	บางยาง	บ้านสร้าง	25150	250604	2506	25
2931	บางเตย	บ้านสร้าง	25150	250603	2506	25
2932	บางแตน	บ้านสร้าง	25150	250605	2506	25
2933	บ้านสร้าง	บ้านสร้าง	25150	250601	2506	25
2934	คำโตนด	ประจันตคาม	25130	250706	2507	25
2935	ดงบัง	ประจันตคาม	25130	250705	2507	25
2936	บุฝ้าย	ประจันตคาม	25130	250707	2507	25
2937	บ้านหอย	ประจันตคาม	25130	250703	2507	25
3095	คลองสะแก	นครหลวง	13260	140310	1403	14
2938	ประจันตคาม	ประจันตคาม	25130	250701	2507	25
2939	หนองแก้ว	ประจันตคาม	25130	250708	2507	25
2940	หนองแสง	ประจันตคาม	25130	250704	2507	25
2941	เกาะลอย	ประจันตคาม	25130	250702	2507	25
2942	โพธิ์งาม	ประจันตคาม	25130	250709	2507	25
2943	กรอกสมบูรณ์	ศรีมหาโพธิ	25140	250810	2508	25
2944	ดงกระทงยาม	ศรีมหาโพธิ	25140	250806	2508	25
2945	ท่าตูม	ศรีมหาโพธิ	25140	250804	2508	25
2946	บางกุ้ง	ศรีมหาโพธิ	25140	250805	2508	25
2947	บ้านทาม	ศรีมหาโพธิ	25140	250803	2508	25
2948	ศรีมหาโพธิ	ศรีมหาโพธิ	25140	250801	2508	25
2949	สัมพันธ์	ศรีมหาโพธิ	25140	250802	2508	25
2950	หนองโพรง	ศรีมหาโพธิ	25140	250807	2508	25
2951	หัวหว้า	ศรีมหาโพธิ	25140	250808	2508	25
2952	หาดยาง	ศรีมหาโพธิ	25140	250809	2508	25
2953	คู้ลำพัน	ศรีมโหสถ	25190	250896	2509	25
2954	โคกปีบ	ศรีมโหสถ	25190	250897	2509	25
2955	โคกไทย	ศรีมโหสถ	25190	250898	2509	25
2956	ไผ่ชะเลือด	ศรีมโหสถ	25190	250899	2509	25
2957	ดงขี้เหล็ก	เมืองปราจีนบุรี	25000	250111	2501	25
2958	ดงพระราม	เมืองปราจีนบุรี	25000	250107	2501	25
2959	ท่างาม	เมืองปราจีนบุรี	25000	250105	2501	25
2960	บางบริบูรณ์	เมืองปราจีนบุรี	25000	250106	2501	25
2961	บางเดชะ	เมืองปราจีนบุรี	25000	250104	2501	25
2962	บ้านพระ	เมืองปราจีนบุรี	25230	250108	2501	25
2963	รอบเมือง	เมืองปราจีนบุรี	25000	250102	2501	25
2964	วัดโบสถ์	เมืองปราจีนบุรี	25000	250103	2501	25
2965	หน้าเมือง	เมืองปราจีนบุรี	25000	250101	2501	25
2966	เนินหอม	เมืองปราจีนบุรี	25230	250112	2501	25
2967	โคกไม้ลาย	เมืองปราจีนบุรี	25230	250109	2501	25
2968	โนนห้อม	เมืองปราจีนบุรี	25000	250113	2501	25
2969	ไม้เค็ด	เมืองปราจีนบุรี	25230	250110	2501	25
2970	กะรุบี	กะพ้อ	94230	941101	9411	94
2971	ตะโละดือรามัน	กะพ้อ	94230	941102	9411	94
2972	ปล่องหอย	กะพ้อ	94230	941103	9411	94
2973	ตะโละแมะนา	ทุ่งยางแดง	94140	940601	9406	94
2974	น้ำดำ	ทุ่งยางแดง	94140	940603	9406	94
2975	ปากู	ทุ่งยางแดง	94140	940604	9406	94
2976	พิเทน	ทุ่งยางแดง	94140	940602	9406	94
2977	ควน	ปะนาเระ	94190	940405	9404	94
2978	คอกกระบือ	ปะนาเระ	94130	940407	9404	94
2979	ดอน	ปะนาเระ	94190	940404	9404	94
2980	ท่าข้าม	ปะนาเระ	94130	940402	9404	94
2981	ท่าน้ำ	ปะนาเระ	94130	940406	9404	94
2982	บ้านกลาง	ปะนาเระ	94130	940409	9404	94
2983	บ้านนอก	ปะนาเระ	94130	940403	9404	94
2984	บ้านน้ำบ่อ	ปะนาเระ	94130	940410	9404	94
2985	ปะนาเระ	ปะนาเระ	94130	940401	9404	94
2986	พ่อมิ่ง	ปะนาเระ	94130	940408	9404	94
2987	กระหวะ	มายอ	94190	940504	9405	94
2988	กระเสาะ	มายอ	94140	940507	9405	94
2989	ตรัง	มายอ	94140	940503	9405	94
2990	ถนน	มายอ	94140	940502	9405	94
2991	ปะโด	มายอ	94140	940509	9405	94
2992	ปานัน	มายอ	94140	940513	9405	94
2993	มายอ	มายอ	94140	940501	9405	94
2994	ลางา	มายอ	94190	940506	9405	94
2995	ลุโบะยิไร	มายอ	94140	940505	9405	94
2996	สะกำ	มายอ	94140	940512	9405	94
2997	สาคอบน	มายอ	94140	940510	9405	94
2998	สาคอใต้	มายอ	94140	940511	9405	94
2999	เกาะจัน	มายอ	94140	940508	9405	94
3000	กระโด	ยะรัง	94160	941008	9410	94
3001	กอลำ	ยะรัง	94160	941011	9410	94
3002	คลองใหม่	ยะรัง	94160	941009	9410	94
3003	ประจัน	ยะรัง	94160	941003	9410	94
3004	ปิตูมุดี	ยะรัง	94160	941006	9410	94
3005	ยะรัง	ยะรัง	94160	941001	9410	94
3006	ระแว้ง	ยะรัง	94160	941005	9410	94
3007	วัด	ยะรัง	94160	941007	9410	94
3008	สะดาวา	ยะรัง	94160	941002	9410	94
3009	สะนอ	ยะรัง	94160	941004	9410	94
3010	เขาตูม	ยะรัง	94160	941012	9410	94
3011	เมาะมาวี	ยะรัง	94160	941010	9410	94
3012	จะรัง	ยะหริ่ง	94150	940917	9409	94
3013	ตอหลัง	ยะหริ่ง	94150	940905	9409	94
3014	ตะโละ	ยะหริ่ง	94150	940901	9409	94
3015	ตะโละกาโปร์	ยะหริ่ง	94150	940902	9409	94
3016	ตันหยงจึงงา	ยะหริ่ง	94190	940904	9409	94
3017	ตันหยงดาลอ	ยะหริ่ง	94150	940903	9409	94
3018	ตาลีอายร์	ยะหริ่ง	94150	940907	9409	94
3019	ตาแกะ	ยะหริ่ง	94150	940906	9409	94
3020	บางปู	ยะหริ่ง	94150	940909	9409	94
3021	บาโลย	ยะหริ่ง	94190	940913	9409	94
3022	ปิยามุมัง	ยะหริ่ง	94150	940911	9409	94
3023	ปุลากง	ยะหริ่ง	94150	940912	9409	94
3024	มะนังยง	ยะหริ่ง	94150	940915	9409	94
3025	ยามู	ยะหริ่ง	94150	940908	9409	94
3026	ราตาปันยัง	ยะหริ่ง	94150	940916	9409	94
3027	สาบัน	ยะหริ่ง	94150	940914	9409	94
3028	หนองแรต	ยะหริ่ง	94150	940910	9409	94
3029	แหลมโพธิ์	ยะหริ่ง	94150	940918	9409	94
3030	กะดุนง	สายบุรี	94110	940707	9407	94
3031	ตะบิ้ง	สายบุรี	94110	940702	9407	94
3032	ตะลุบัน	สายบุรี	94110	940701	9407	94
3033	ทุ่งคล้า	สายบุรี	94190	940711	9407	94
3034	บางเก่า	สายบุรี	94110	940704	9407	94
3035	บือเระ	สายบุรี	94110	940705	9407	94
3036	ปะเสยะวอ	สายบุรี	94110	940703	9407	94
3037	มะนังดาลำ	สายบุรี	94110	940709	9407	94
3038	ละหาร	สายบุรี	94110	940708	9407	94
3039	เตราะบอน	สายบุรี	94110	940706	9407	94
3040	แป้น	สายบุรี	94110	940710	9407	94
3041	คอลอตันหยง	หนองจิก	94170	940302	9403	94
3042	ดอนรัก	หนองจิก	94170	940303	9403	94
3043	ดาโต๊ะ	หนองจิก	94170	940304	9403	94
3044	ตุยง	หนองจิก	94170	940305	9403	94
3045	ท่ากำชำ	หนองจิก	94170	940306	9403	94
3046	บางตาวา	หนองจิก	94170	940309	9403	94
3047	บางเขา	หนองจิก	94170	940308	9403	94
3048	บ่อทอง	หนองจิก	94170	940307	9403	94
3049	ปุโละปุโย	หนองจิก	94170	940310	9403	94
3050	ยาบี	หนองจิก	94170	940311	9403	94
3051	ลิปะสะโง	หนองจิก	94170	940312	9403	94
3052	เกาะเปาะ	หนองจิก	94170	940301	9403	94
3053	กะมิยอ	เมืองปัตตานี	94000	940107	9401	94
3054	คลองมานิง	เมืองปัตตานี	94000	940106	9401	94
3055	จะบังติกอ	เมืองปัตตานี	94000	940103	9401	94
3056	ตะลุโบะ	เมืองปัตตานี	94000	940111	9401	94
3057	ตันหยงลุโละ	เมืองปัตตานี	94000	940105	9401	94
3058	บานา	เมืองปัตตานี	94000	940104	9401	94
3059	บาราเฮาะ	เมืองปัตตานี	94000	940112	9401	94
3060	บาราโหม	เมืองปัตตานี	94000	940108	9401	94
3061	ปะกาฮะรัง	เมืองปัตตานี	94000	940109	9401	94
3062	ปุยุด	เมืองปัตตานี	94000	940113	9401	94
3063	รูสะมิแล	เมืองปัตตานี	94000	940110	9401	94
3064	สะบารัง	เมืองปัตตานี	94000	940101	9401	94
3065	อาเนาะรู	เมืองปัตตานี	94000	940102	9401	94
3066	ป่าไร่	แม่ลาน	94180	940210	9412	94
3067	ม่วงเตี้ย	แม่ลาน	94180	940212	9412	94
3068	แม่ลาน	แม่ลาน	94180	940209	9412	94
3069	ควนโนรี	โคกโพธิ์	94180	940214	9402	94
3070	ช้างให้ตก	โคกโพธิ์	94120	940215	9402	94
3071	ทรายขาว	โคกโพธิ์	94120	940205	9402	94
3072	ทุ่งพลา	โคกโพธิ์	94180	940208	9402	94
3073	ท่าเรือ	โคกโพธิ์	94120	940211	9402	94
3074	นาประดู่	โคกโพธิ์	94180	940206	9402	94
3075	นาเกตุ	โคกโพธิ์	94120	940213	9402	94
3076	บางโกระ	โคกโพธิ์	94120	940203	9402	94
3077	ปากล่อ	โคกโพธิ์	94180	940207	9402	94
3078	ป่าบอน	โคกโพธิ์	94120	940204	9402	94
3079	มะกรูด	โคกโพธิ์	94120	940202	9402	94
3080	โคกโพธิ์	โคกโพธิ์	94120	940201	9402	94
3081	ดอนทราย	ไม้แก่น	94220	940804	9408	94
3082	ตะโละไกรทอง	ไม้แก่น	94220	940803	9408	94
3083	ไทรทอง	ไม้แก่น	94220	940801	9408	94
3084	ไม้แก่น	ไม้แก่น	94220	940802	9408	94
3085	จำปา	ท่าเรือ	13130	140199	1402	14
3086	ท่าหลวง	ท่าเรือ	18270	140203	1402	14
3087	ท่าเจ้าสนุก	ท่าเรือ	13130	140210	1402	14
3088	ท่าเรือ	ท่าเรือ	13130	140201	1402	14
3089	บ้านร่อม	ท่าเรือ	13130	140204	1402	14
3090	ปากท่า	ท่าเรือ	13130	140208	1402	14
3091	วังแดง	ท่าเรือ	13130	140206	1402	14
3092	ศาลาลอย	ท่าเรือ	13130	140205	1402	14
3093	หนองขนาก	ท่าเรือ	13130	140209	1402	14
3094	โพธิ์เอน	ท่าเรือ	13130	140207	1402	14
3096	ท่าช้าง	นครหลวง	13260	140302	1403	14
3097	นครหลวง	นครหลวง	13260	140301	1403	14
3098	บางพระครู	นครหลวง	13260	140307	1403	14
3099	บางระกำ	นครหลวง	13260	140306	1403	14
3100	บ่อโพง	นครหลวง	13260	140303	1403	14
3101	บ้านชุ้ง	นครหลวง	13260	140304	1403	14
3102	ปากจั่น	นครหลวง	13260	140305	1403	14
3103	พระนอน	นครหลวง	13260	140312	1403	14
3104	สามไถ	นครหลวง	13260	140311	1403	14
3105	หนองปลิง	นครหลวง	13260	140309	1403	14
3106	แม่ลา	นครหลวง	13260	140308	1403	14
3107	บางซ้าย	บางซ้าย	13270	141301	1413	14
3108	ปลายกลัด	บางซ้าย	13270	141304	1413	14
3109	วังพัฒนา	บางซ้าย	13270	141306	1413	14
3110	เต่าเล่า	บางซ้าย	13270	141303	1413	14
3111	เทพมงคล	บางซ้าย	13270	141305	1413	14
3112	แก้วฟ้า	บางซ้าย	13270	141302	1413	14
3113	กบเจา	บางบาล	13250	140506	1405	14
3114	ทางช้าง	บางบาล	13250	140510	1405	14
3115	น้ำเต้า	บางบาล	13250	140509	1405	14
3116	บางชะนี	บางบาล	13250	140515	1405	14
3117	บางบาล	บางบาล	13250	140501	1405	14
3118	บางหลวง	บางบาล	13250	140512	1405	14
3119	บางหลวงโดด	บางบาล	13250	140513	1405	14
3120	บางหัก	บางบาล	13250	140514	1405	14
3121	บ้านกุ่ม	บางบาล	13250	140516	1405	14
3122	บ้านคลัง	บางบาล	13250	140507	1405	14
3123	พระขาว	บางบาล	13250	140508	1405	14
3124	มหาพราหมณ์	บางบาล	13250	140505	1405	14
3125	วัดตะกู	บางบาล	13250	140511	1405	14
3126	วัดยม	บางบาล	13250	140502	1405	14
3127	สะพานไทย	บางบาล	13250	140504	1405	14
3128	ไทรน้อย	บางบาล	13250	140503	1405	14
3129	ขยาย	บางปะหัน	13220	140702	1407	14
3130	ขวัญเมือง	บางปะหัน	13220	140712	1407	14
3131	ตานิม	บางปะหัน	13220	140709	1407	14
3132	ตาลเอน	บางปะหัน	13220	140716	1407	14
3133	ทับน้ำ	บางปะหัน	13220	140710	1407	14
3134	ทางกลาง	บางปะหัน	13220	140705	1407	14
3135	บางนางร้า	บางปะหัน	13220	140708	1407	14
3136	บางปะหัน	บางปะหัน	13220	140701	1407	14
3137	บางเดื่อ	บางปะหัน	13220	140703	1407	14
3138	บางเพลิง	บางปะหัน	13220	140706	1407	14
3139	บ้านขล้อ	บางปะหัน	13220	140717	1407	14
3140	บ้านม้า	บางปะหัน	13220	140417	1407	14
3141	บ้านลี่	บางปะหัน	13220	140713	1407	14
3142	พุทเลา	บางปะหัน	13220	140715	1407	14
3143	หันสัง	บางปะหัน	13220	140707	1407	14
3144	เสาธง	บางปะหัน	13220	140704	1407	14
3145	โพธิ์สามต้น	บางปะหัน	13220	140714	1407	14
3146	ขนอนหลวง	บางปะอิน	13160	140618	1406	14
3147	คลองจิก	บางปะอิน	13160	140606	1406	14
3148	คุ้งลาน	บางปะอิน	13160	140614	1406	14
3149	ตลาดเกรียบ	บางปะอิน	13160	140617	1406	14
3150	ตลิ่งชัน	บางปะอิน	13160	140615	1406	14
3151	บางกระสั้น	บางปะอิน	13160	140605	1406	14
3152	บางประแดง	บางปะอิน	13160	140609	1406	14
3153	บ้านกรด	บางปะอิน	13160	140604	1406	14
3154	บ้านพลับ	บางปะอิน	13160	140612	1406	14
3155	บ้านสร้าง	บางปะอิน	13170	140616	1406	14
3156	บ้านหว้า	บางปะอิน	13160	140607	1406	14
3157	บ้านเลน	บางปะอิน	13160	140601	1406	14
3158	บ้านแป้ง	บางปะอิน	13160	140404	1406	14
3159	บ้านโพ	บางปะอิน	13160	140603	1406	14
3160	วัดยม	บางปะอิน	13160	140502	1406	14
3161	สามเรือน	บางปะอิน	13160	140610	1406	14
3162	เกาะเกิด	บางปะอิน	13160	140611	1406	14
3163	เชียงรากน้อย	บางปะอิน	13180	140422	1406	14
3164	กกแก้วบูรพา	บางไทร	13190	140415	1404	14
3165	กระแชง	บางไทร	13190	140410	1404	14
3166	ช่างเหล็ก	บางไทร	13190	140409	1404	14
3167	ช้างน้อย	บางไทร	13190	140412	1404	14
3168	ช้างใหญ่	บางไทร	13290	140420	1404	14
3169	บางพลี	บางไทร	13190	140402	1404	14
3170	บางยี่โท	บางไทร	13190	140406	1404	14
3171	บางไทร	บางไทร	13190	140401	1404	14
3172	บ้านกลึง	บางไทร	13190	140411	1404	14
3173	บ้านม้า	บางไทร	13190	140417	1404	14
3174	บ้านเกาะ	บางไทร	13190	140116	1404	14
3175	บ้านแป้ง	บางไทร	13190	140404	1404	14
3176	ราชคราม	บางไทร	13290	140419	1404	14
3177	สนามชัย	บางไทร	13190	140403	1404	14
3178	หน้าไม้	บางไทร	13190	140405	1404	14
3179	ห่อหมก	บางไทร	13190	140413	1404	14
3180	เชียงรากน้อย	บางไทร	13290	140422	1404	14
3181	แคตก	บางไทร	13190	140408	1404	14
3182	แคออก	บางไทร	13190	140407	1404	14
3183	โคกช้าง	บางไทร	13190	140423	1404	14
3184	โพแตง	บางไทร	13290	140421	1404	14
3185	ไผ่พระ	บางไทร	13190	140414	1404	14
3186	ไม้ตรา	บางไทร	13190	140416	1404	14
3187	คลองน้อย	บ้านแพรก	13240	141604	1416	14
3188	บ้านแพรก	บ้านแพรก	13240	141601	1416	14
3189	บ้านใหม่	บ้านแพรก	13240	140115	1416	14
3190	สองห้อง	บ้านแพรก	13240	141605	1416	14
3191	สำพะเนียง	บ้านแพรก	13240	141603	1416	14
3192	กุฎี	ผักไห่	13120	140809	1408	14
3193	จักราช	ผักไห่	13280	140812	1408	14
3194	ดอนลาน	ผักไห่	13280	140807	1408	14
3195	ตาลาน	ผักไห่	13120	140805	1408	14
3196	ท่าดินแดง	ผักไห่	13120	140806	1408	14
3197	นาคู	ผักไห่	13280	140808	1408	14
3198	บ้านแค	ผักไห่	13120	140803	1408	14
3199	บ้านใหญ่	ผักไห่	13120	140816	1408	14
3200	ผักไห่	ผักไห่	13120	140801	1408	14
3201	ลาดชิด	ผักไห่	13120	140814	1408	14
3202	ลาดน้ำเค็ม	ผักไห่	13120	140804	1408	14
3203	ลำตะเคียน	ผักไห่	13280	140810	1408	14
3204	หนองน้ำใหญ่	ผักไห่	13280	140813	1408	14
3205	หน้าโคก	ผักไห่	13120	140815	1408	14
3206	อมฤต	ผักไห่	13120	140802	1408	14
3207	โคกช้าง	ผักไห่	13120	140423	1408	14
3208	กะมัง	พระนครศรีอยุธยา	13000	140102	1401	14
3209	คลองตะเคียน	พระนครศรีอยุธยา	13000	140111	1401	14
3210	คลองสระบัว	พระนครศรีอยุธยา	13000	140118	1401	14
3211	คลองสวนพลู	พระนครศรีอยุธยา	13000	140117	1401	14
3212	ท่าวาสุกรี	พระนครศรีอยุธยา	13000	140105	1401	14
3213	บ้านป้อม	พระนครศรีอยุธยา	13000	140120	1401	14
3214	บ้านรุน	พระนครศรีอยุธยา	13000	140121	1401	14
3215	บ้านเกาะ	พระนครศรีอยุธยา	13000	140116	1401	14
3216	บ้านใหม่	พระนครศรีอยุธยา	13000	140115	1401	14
3217	ประตูชัย	พระนครศรีอยุธยา	13000	140101	1401	14
3218	ปากกราน	พระนครศรีอยุธยา	13000	140107	1401	14
3219	ภูเขาทอง	พระนครศรีอยุธยา	13000	140108	1401	14
3220	ลุมพลี	พระนครศรีอยุธยา	13000	140114	1401	14
3221	วัดตูม	พระนครศรีอยุธยา	13000	140112	1401	14
3222	สวนพริก	พระนครศรีอยุธยา	13000	140110	1401	14
3223	สำเภาล่ม	พระนครศรีอยุธยา	13000	140109	1401	14
3224	หอรัตนไชย	พระนครศรีอยุธยา	13000	140103	1401	14
3225	หันตรา	พระนครศรีอยุธยา	13000	140113	1401	14
3226	หัวรอ	พระนครศรีอยุธยา	13000	140104	1401	14
3227	เกาะเรียน	พระนครศรีอยุธยา	13000	140119	1401	14
3228	ไผ่ลิง	พระนครศรีอยุธยา	13000	140106	1401	14
3229	กระจิว	ภาชี	13140	140907	1409	14
3230	ดอนหญ้านาง	ภาชี	13140	140905	1409	14
3231	พระแก้ว	ภาชี	13140	140908	1409	14
3232	ภาชี	ภาชี	13140	140901	1409	14
3233	ระโสม	ภาชี	13140	140903	1409	14
3234	หนองน้ำใส	ภาชี	13140	140904	1409	14
3235	โคกม่วง	ภาชี	13140	140902	1409	14
3236	ไผ่ล้อม	ภาชี	13140	140906	1409	14
3237	กะทุ่ม	มหาราช	13150	141502	1415	14
3238	ท่าตอ	มหาราช	13150	141511	1415	14
3239	น้ำเต้า	มหาราช	13150	140509	1415	14
3240	บางนา	มหาราช	13150	141505	1415	14
3241	บ้านขวาง	มหาราช	13150	141510	1415	14
3242	บ้านนา	มหาราช	13150	141509	1415	14
3243	บ้านใหม่	มหาราช	13150	140115	1415	14
3244	พิตเพียน	มหาราช	13150	141508	1415	14
3245	มหาราช	มหาราช	13150	141503	1415	14
3246	หัวไผ่	มหาราช	13150	141501	1415	14
3247	เจ้าปลุก	มหาราช	13150	141507	1415	14
3248	โรงช้าง	มหาราช	13150	141506	1415	14
3249	คลองพระยาบันลือ	ลาดบัวหลวง	13230	141007	1410	14
3250	คู้สลอด	ลาดบัวหลวง	13230	141006	1410	14
3251	พระยาบันลือ	ลาดบัวหลวง	13230	141004	1410	14
3252	ลาดบัวหลวง	ลาดบัวหลวง	13230	141001	1410	14
3253	สามเมือง	ลาดบัวหลวง	13230	141003	1410	14
3254	สิงหนาท	ลาดบัวหลวง	13230	141005	1410	14
3255	หลักชัย	ลาดบัวหลวง	13230	141002	1410	14
3256	ข้าวงาม	วังน้อย	13170	141109	1411	14
3257	ชะแมบ	วังน้อย	13170	141110	1411	14
3258	บ่อตาโล่	วังน้อย	13170	141102	1411	14
3259	พยอม	วังน้อย	13170	141106	1411	14
3260	ลำตาเสา	วังน้อย	13170	141101	1411	14
3261	ลำไทร	วังน้อย	13170	141104	1411	14
3262	วังจุฬา	วังน้อย	13170	141108	1411	14
3263	วังน้อย	วังน้อย	13170	141103	1411	14
3264	สนับทึบ	วังน้อย	13170	141105	1411	14
3265	หันตะเภา	วังน้อย	13170	141107	1411	14
3266	ข้าวเม่า	อุทัย	13210	141411	1414	14
3267	คานหาม	อุทัย	13210	141401	1414	14
3268	ธนู	อุทัย	13210	141410	1414	14
3269	บ้านช้าง	อุทัย	13210	141402	1414	14
3270	บ้านหีบ	อุทัย	13210	141404	1414	14
3271	สามบัณฑิต	อุทัย	13210	141403	1414	14
3272	หนองน้ำส้ม	อุทัย	13210	141408	1414	14
3273	หนองไม้ซุง	อุทัย	13210	141405	1414	14
3274	อุทัย	อุทัย	13210	141406	1414	14
3275	เสนา	อุทัย	13210	141201	1414	14
3276	โพสาวหาญ	อุทัย	13210	141409	1414	14
3277	ชายนา	เสนา	13110	141212	1412	14
3278	ดอนทอง	เสนา	13110	141215	1412	14
3279	บางนมโค	เสนา	13110	141205	1412	14
3280	บ้านกระทุ่ม	เสนา	13110	141210	1412	14
3281	บ้านหลวง	เสนา	13110	141216	1412	14
3282	บ้านแถว	เสนา	13110	141211	1412	14
3283	บ้านแพน	เสนา	13110	141202	1412	14
3284	บ้านโพธิ์	เสนา	13110	141208	1412	14
3285	มารวิชัย	เสนา	13110	141207	1412	14
3286	รางจรเข้	เสนา	13110	141209	1412	14
3287	ลาดงา	เสนา	13110	141214	1412	14
3288	สามกอ	เสนา	13110	141204	1412	14
3289	สามตุ่ม	เสนา	13110	141213	1412	14
3290	หัวเวียง	เสนา	13110	141206	1412	14
3291	เจ้าเจ็ด	เสนา	13110	141203	1412	14
3292	เจ้าเสด็จ	เสนา	13110	141217	1412	14
3293	เสนา	เสนา	13110	141201	1412	14
3294	จุน	จุน	56150	560202	5602	56
3295	ทุ่งรวงทอง	จุน	56150	560205	5602	56
3296	พระธาตุขิงแกง	จุน	56150	560207	5602	56
3297	ลอ	จุน	56150	560203	5602	56
3298	หงส์หิน	จุน	56150	560204	5602	56
3299	ห้วยข้าวก่ำ	จุน	56150	560201	5602	56
3300	ห้วยยางขาม	จุน	56150	560206	5602	56
3301	คือเวียง	ดอกคำใต้	56120	560512	5605	56
3302	ดงสุวรรณ	ดอกคำใต้	56120	560509	5605	56
3303	ดอกคำใต้	ดอกคำใต้	56120	560501	5605	56
3304	ดอนศรีชุม	ดอกคำใต้	56120	560502	5605	56
3305	บุญเกิด	ดอกคำใต้	56120	560510	5605	56
3306	บ้านถ้ำ	ดอกคำใต้	56120	560503	5605	56
3307	บ้านปิน	ดอกคำใต้	56120	560504	5605	56
3308	ป่าซาง	ดอกคำใต้	56120	560507	5605	56
3309	สว่างอารมณ์	ดอกคำใต้	56120	560511	5605	56
3310	สันโค้ง	ดอกคำใต้	56120	560506	5605	56
3311	หนองหล่ม	ดอกคำใต้	56120	560508	5605	56
3312	ห้วยลาน	ดอกคำใต้	56120	560505	5605	56
3313	ขุนควร	ปง	56140	560607	5606	56
3314	ควร	ปง	56140	560602	5606	56
3315	งิม	ปง	56140	560604	5606	56
3316	นาปรัง	ปง	56140	560606	5606	56
3317	ปง	ปง	56140	560601	5606	56
3318	ผาช้างน้อย	ปง	56140	560605	5606	56
3319	ออย	ปง	56140	560603	5606	56
3320	ดงเจน	ภูกามยาว	56000	560103	5609	56
3321	ห้วยแก้ว	ภูกามยาว	56000	560109	5609	56
3322	แม่อิง	ภูกามยาว	56000	560117	5609	56
3323	ทุ่งกล้วย	ภูซาง	56110	560302	5608	56
3324	ป่าสัก	ภูซาง	56110	560315	5608	56
3325	ภูซาง	ภูซาง	56110	560305	5608	56
3326	สบบง	ภูซาง	56110	560303	5608	56
3327	เชียงแรง	ภูซาง	56110	560304	5608	56
3328	ทุ่งผาสุข	เชียงคำ	56110	560314	5603	56
3329	น้ำแวน	เชียงคำ	56110	560306	5603	56
3330	ฝายกวาง	เชียงคำ	56110	560308	5603	56
3331	ร่มเย็น	เชียงคำ	56110	560310	5603	56
3332	หย่วน	เชียงคำ	56110	560301	5603	56
3333	อ่างทอง	เชียงคำ	56110	560313	5603	56
3334	เจดีย์คำ	เชียงคำ	56110	560309	5603	56
3335	เชียงบาน	เชียงคำ	56110	560311	5603	56
3336	เวียง	เชียงคำ	56110	560101	5603	56
3337	แม่ลาว	เชียงคำ	56110	560312	5603	56
3338	บ้านมาง	เชียงม่วน	56160	560402	5604	56
3339	สระ	เชียงม่วน	56160	560403	5604	56
3340	เชียงม่วน	เชียงม่วน	56160	560401	5604	56
3341	จำป่าหวาย	เมืองพะเยา	56000	560112	5601	56
3342	ท่าจำปี	เมืองพะเยา	56000	560116	5601	56
3343	ท่าวังทอง	เมืองพะเยา	56000	560113	5601	56
3344	บ้านตุ่น	เมืองพะเยา	56000	560105	5601	56
3345	บ้านต๊ำ	เมืองพะเยา	56000	560106	5601	56
3346	บ้านต๋อม	เมืองพะเยา	56000	560107	5601	56
3347	บ้านสาง	เมืองพะเยา	56000	560115	5601	56
3348	บ้านใหม่	เมืองพะเยา	56000	560111	5601	56
3349	สันป่าม่วง	เมืองพะเยา	56000	560118	5601	56
3350	เวียง	เมืองพะเยา	56000	560101	5601	56
3351	แม่กา	เมืองพะเยา	56000	560110	5601	56
3352	แม่ต๋ำ	เมืองพะเยา	56000	560102	5601	56
3353	แม่นาเรือ	เมืองพะเยา	56000	560104	5601	56
3354	แม่ปืม	เมืองพะเยา	56000	560108	5601	56
3355	แม่ใส	เมืองพะเยา	56000	560114	5601	56
3356	บ้านเหล่า	แม่ใจ	56130	560705	5607	56
3357	ป่าแฝก	แม่ใจ	56130	560704	5607	56
3358	ศรีถ้อย	แม่ใจ	56130	560702	5607	56
3359	เจริญราษฎร์	แม่ใจ	56130	560706	5607	56
3360	แม่สุก	แม่ใจ	56130	560703	5607	56
3361	แม่ใจ	แม่ใจ	56130	560701	5607	56
3362	กะปง	กะปง	82170	820301	8203	82
3363	ท่านา	กะปง	82170	820302	8203	82
3364	รมณีย์	กะปง	82170	820305	8203	82
3365	เหมาะ	กะปง	82170	820303	8203	82
3366	เหล	กะปง	82170	820304	8203	82
3367	คุระ	คุระบุรี	82150	820601	8206	82
3368	บางวัน	คุระบุรี	82150	820602	8206	82
3369	เกาะพระทอง	คุระบุรี	82150	820603	8206	82
3370	แม่นางขาว	คุระบุรี	82150	820605	8206	82
3371	กระโสม	ตะกั่วทุ่ง	82130	820402	8204	82
3372	กะไหล	ตะกั่วทุ่ง	82130	820403	8204	82
3373	คลองเคียน	ตะกั่วทุ่ง	82130	820407	8204	82
3374	ถ้ำ	ตะกั่วทุ่ง	82130	820401	8204	82
3375	ท่าอยู่	ตะกั่วทุ่ง	82130	820404	8204	82
3376	หล่อยูง	ตะกั่วทุ่ง	82140	820405	8204	82
3377	โคกกลอย	ตะกั่วทุ่ง	82140	820406	8204	82
3378	คึกคัก	ตะกั่วป่า	82220	820507	8205	82
3379	ตะกั่วป่า	ตะกั่วป่า	82110	820501	8205	82
3380	ตำตัว	ตะกั่วป่า	82110	820505	8205	82
3381	บางนายสี	ตะกั่วป่า	82110	820502	8205	82
3382	บางม่วง	ตะกั่วป่า	82190	820504	8205	82
3383	บางไทร	ตะกั่วป่า	82110	820503	8205	82
3384	เกาะคอเขา	ตะกั่วป่า	82190	820508	8205	82
3385	โคกเคียน	ตะกั่วป่า	82110	820506	8205	82
3386	ถ้ำทองหลาง	ทับปุด	82180	820704	8207	82
3387	ทับปุด	ทับปุด	82180	820701	8207	82
3388	บางเหรียง	ทับปุด	82180	820706	8207	82
3389	บ่อแสน	ทับปุด	82180	820703	8207	82
3390	มะรุ่ย	ทับปุด	82180	820702	8207	82
3391	โคกเจริญ	ทับปุด	82180	820705	8207	82
3392	ทุ่งมะพร้าว	ท้ายเหมือง	82120	820804	8208	82
3393	ท้ายเหมือง	ท้ายเหมือง	82120	820801	8208	82
3394	นาเตย	ท้ายเหมือง	82120	820802	8208	82
3395	บางทอง	ท้ายเหมือง	82120	820803	8208	82
3396	ลำภี	ท้ายเหมือง	82120	820805	8208	82
3397	ลำแก่น	ท้ายเหมือง	82210	820806	8208	82
3398	พรุใน	เกาะยาว	83000	820203	8202	82
3399	เกาะยาวน้อย	เกาะยาว	82160	820199	8202	82
3400	เกาะยาวใหญ่	เกาะยาว	82160	820198	8202	82
3401	ตากแดด	เมืองพังงา	82000	820105	8201	82
3402	ถ้ำน้ำผุด	เมืองพังงา	82000	820103	8201	82
3403	ทุ่งคาโงก	เมืองพังงา	82000	820107	8201	82
3404	ท้ายช้าง	เมืองพังงา	82000	820101	8201	82
3405	นบปริง	เมืองพังงา	82000	820102	8201	82
3406	บางเตย	เมืองพังงา	82000	820104	8201	82
3407	ป่ากอ	เมืองพังงา	82000	820109	8201	82
3408	สองแพรก	เมืองพังงา	82000	820106	8201	82
3409	เกาะปันหยี	เมืองพังงา	82000	820108	8201	82
3410	กงหรา	กงหรา	93180	930201	9302	93
3411	คลองทรายขาว	กงหรา	93180	930204	9302	93
3412	คลองเฉลิม	กงหรา	93180	930203	9302	93
3413	ชะรัด	กงหรา	93000	930202	9302	93
3414	สมหวัง	กงหรา	93000	930205	9302	93
3415	ควนขนุน	ควนขนุน	93110	930302	9305	93
3416	ชะมวง	ควนขนุน	93110	930513	9305	93
3417	ดอนทราย	ควนขนุน	93110	930510	9305	93
3418	ทะเลน้อย	ควนขนุน	93150	930502	9305	93
3419	นาขยาด	ควนขนุน	93110	930504	9305	93
3420	ปันแต	ควนขนุน	93110	930508	9305	93
3421	พนมวังก์	ควนขนุน	93110	930505	9305	93
3422	พนางตุง	ควนขนุน	93150	930512	9305	93
3423	มะกอกเหนือ	ควนขนุน	93150	930511	9305	93
3424	แพรกหา	ควนขนุน	93110	930516	9305	93
3425	แหลมโตนด	ควนขนุน	93110	930506	9305	93
3426	โตนดด้วน	ควนขนุน	93110	930509	9305	93
3427	คลองใหญ่	ตะโหมด	93160	930396	9304	93
3428	ตะโหมด	ตะโหมด	93160	930397	9304	93
3429	แม่ขรี	ตะโหมด	93160	930399	9304	93
3430	ท่ามะเดื่อ	บางแก้ว	93140	930303	9309	93
3431	นาปะขอ	บางแก้ว	93140	930304	9309	93
3432	โคกสัก	บางแก้ว	93140	930308	9309	93
3433	ดอนทราย	ปากพะยูน	93120	930510	9306	93
3434	ดอนประดู่	ปากพะยูน	93120	930602	9306	93
3435	ปากพะยูน	ปากพะยูน	93120	930601	9306	93
3436	ฝาละมี	ปากพะยูน	93120	930605	9306	93
3437	หารเทา	ปากพะยูน	93120	930606	9306	93
3438	เกาะนางคำ	ปากพะยูน	93120	930603	9306	93
3439	เกาะหมาก	ปากพะยูน	93120	930604	9306	93
3440	ทุ่งนารี	ป่าบอน	93170	930804	9308	93
3441	ป่าบอน	ป่าบอน	93170	930699	9308	93
3442	วังใหม่	ป่าบอน	93170	930806	9308	93
3443	หนองธง	ป่าบอน	93170	930803	9308	93
3444	โคกทราย	ป่าบอน	93170	930698	9308	93
3445	บ้านพร้าว	ป่าพะยอม	93210	930514	9310	93
3446	ป่าพะยอม	ป่าพะยอม	93210	930507	9310	93
3447	ลานข่อย	ป่าพะยอม	93210	930515	9310	93
3448	เกาะเต่า	ป่าพะยอม	93210	930503	9310	93
3449	ชุมพล	ศรีนครินทร์	93000	930118	9311	93
3450	บ้านนา	ศรีนครินทร์	93000	930102	9311	93
3451	ลำสินธุ์	ศรีนครินทร์	93000	930116	9311	93
3452	อ่างทอง	ศรีนครินทร์	93000	930117	9311	93
3453	ตะแพน	ศรีบรรพต	93190	930703	9307	93
3454	เขาปู่	ศรีบรรพต	93190	930702	9307	93
3455	เขาย่า	ศรีบรรพต	93190	930701	9307	93
3456	ควนขนุน	เขาชัยสน	93130	930302	9303	93
3457	จองถนน	เขาชัยสน	93130	930305	9303	93
3458	หานโพธิ์	เขาชัยสน	93130	930306	9303	93
3459	เขาชัยสน	เขาชัยสน	93130	930301	9303	93
3460	โคกม่วง	เขาชัยสน	93130	930307	9303	93
3461	ควนมะพร้าว	เมืองพัทลุง	93000	930111	9301	93
3462	คูหาสวรรค์	เมืองพัทลุง	93000	930101	9301	93
3463	ชัยบุรี	เมืองพัทลุง	93000	930113	9301	93
3464	ตำนาน	เมืองพัทลุง	93000	930110	9301	93
3465	ท่ามิหรำ	เมืองพัทลุง	93000	930104	9301	93
3466	ท่าแค	เมืองพัทลุง	93000	930108	9301	93
3467	นาท่อม	เมืองพัทลุง	93000	930106	9301	93
3468	นาโหนด	เมืองพัทลุง	93000	930114	9301	93
3469	ปรางหมู่	เมืองพัทลุง	93000	930107	9301	93
3470	พญาขัน	เมืองพัทลุง	93000	930115	9301	93
3471	ร่มเมือง	เมืองพัทลุง	93000	930112	9301	93
3472	ลำปำ	เมืองพัทลุง	93000	930109	9301	93
3473	เขาเจียก	เมืองพัทลุง	93000	930103	9301	93
3474	โคกชะงาย	เมืองพัทลุง	93000	930105	9301	93
3475	วังงิ้ว	ดงเจริญ	66210	660513	6611	66
3476	วังงิ้วใต้	ดงเจริญ	66210	660515	6611	66
3477	สำนักขุนเณร	ดงเจริญ	66210	660510	6611	66
3478	ห้วยพุก	ดงเจริญ	66210	660511	6611	66
3479	ห้วยร่วม	ดงเจริญ	66210	660512	6611	66
3480	คลองคูณ	ตะพานหิน	66110	660408	6604	66
3481	งิ้วราย	ตะพานหิน	66110	660402	6604	66
3482	ดงตะขบ	ตะพานหิน	66110	660407	6604	66
3483	ตะพานหิน	ตะพานหิน	66110	660401	6604	66
3484	ทับหมัน	ตะพานหิน	66110	660412	6604	66
3485	ทุ่งโพธิ์	ตะพานหิน	66150	660406	6604	66
3486	วังสำโรง	ตะพานหิน	66110	660409	6604	66
3487	วังหลุม	ตะพานหิน	66150	660411	6604	66
3488	วังหว้า	ตะพานหิน	66110	660410	6604	66
3489	หนองพยอม	ตะพานหิน	66110	660405	6604	66
3490	ห้วยเกตุ	ตะพานหิน	66110	660403	6604	66
3491	ไทรโรงโขน	ตะพานหิน	66110	660404	6604	66
3492	ไผ่หลวง	ตะพานหิน	66110	660413	6604	66
3493	ทับคล้อ	ทับคล้อ	66150	660499	6608	66
3494	ท้ายทุ่ง	ทับคล้อ	66150	660496	6608	66
3495	เขาทราย	ทับคล้อ	66230	660498	6608	66
3496	เขาเจ็ดลูก	ทับคล้อ	66230	660497	6608	66
3497	บางมูลนาก	บางมูลนาก	66120	660501	6605	66
3498	บางไผ่	บางมูลนาก	66120	660502	6605	66
3499	ภูมิ	บางมูลนาก	66120	660506	6605	66
3500	ลำประดา	บางมูลนาก	66120	660514	6605	66
3501	วังกรด	บางมูลนาก	66120	660507	6605	66
3502	วังตะกู	บางมูลนาก	66210	660509	6605	66
3503	วังสำโรง	บางมูลนาก	66120	660409	6605	66
3504	หอไกร	บางมูลนาก	66120	660503	6605	66
3505	ห้วยเขน	บางมูลนาก	66120	660508	6605	66
3506	เนินมะกอก	บางมูลนาก	66120	660504	6605	66
3507	บางลาย	บึงนาราง	66130	660609	6610	66
3508	บึงนาราง	บึงนาราง	66130	660610	6610	66
3509	ห้วยแก้ว	บึงนาราง	66130	660616	6610	66
3510	แหลมรัง	บึงนาราง	66130	660615	6610	66
3511	โพธิ์ไทรงาม	บึงนาราง	66130	660614	6610	66
3512	บึงบัว	วชิรบารมี	66140	660709	6612	66
3513	บ้านนา	วชิรบารมี	66140	660705	6612	66
3514	วังโมกข์	วชิรบารมี	66140	660708	6612	66
3515	หนองหลุม	วชิรบารมี	66220	660704	6612	66
3516	วังทรายพูน	วังทรายพูน	66180	660199	6602	66
3517	หนองปลาไหล	วังทรายพูน	66180	660198	6602	66
3518	หนองปล้อง	วังทรายพูน	66180	660114	6602	66
3519	หนองพระ	วังทรายพูน	66180	660197	6602	66
3520	คลองทราย	สากเหล็ก	66160	660118	6609	66
3521	ท่าเยี่ยม	สากเหล็ก	66160	660117	6609	66
3522	วังทับไทร	สากเหล็ก	66160	660905	6609	66
3523	สากเหล็ก	สากเหล็ก	66160	660116	6609	66
3524	หนองหญ้าไทร	สากเหล็ก	66160	660904	6609	66
3525	กำแพงดิน	สามง่าม	66220	660702	6607	66
3526	รังนก	สามง่าม	66140	660703	6607	66
3527	สามง่าม	สามง่าม	66140	660701	6607	66
3528	หนองโสน	สามง่าม	66140	660707	6607	66
3529	เนินปอ	สามง่าม	66140	660706	6607	66
3530	คลองคะเชนทร์	เมืองพิจิตร	66000	660106	6601	66
3531	ฆะมัง	เมืองพิจิตร	66000	660111	6601	66
3532	ดงกลาง	เมืองพิจิตร	66170	660120	6601	66
3533	ดงป่าคำ	เมืองพิจิตร	66170	660112	6601	66
3534	ท่าหลวง	เมืองพิจิตร	66000	660109	6601	66
3535	ท่าฬ่อ	เมืองพิจิตร	66000	660104	6601	66
3536	บ้านบุ่ง	เมืองพิจิตร	66000	660110	6601	66
3537	ปากทาง	เมืองพิจิตร	66000	660105	6601	66
3538	ป่ามะคาบ	เมืองพิจิตร	66000	660115	6601	66
3539	ย่านยาว	เมืองพิจิตร	66000	660103	6601	66
3540	สายคำโห้	เมืองพิจิตร	66000	660119	6601	66
3541	หัวดง	เมืองพิจิตร	66170	660113	6601	66
3542	เมืองเก่า	เมืองพิจิตร	66000	660108	6601	66
3543	โรงช้าง	เมืองพิจิตร	66000	660107	6601	66
3544	ในเมือง	เมืองพิจิตร	66000	660101	6601	66
3545	ไผ่ขวาง	เมืองพิจิตร	66000	660102	6601	66
3546	ทะนง	โพทะเล	66130	660603	6606	66
3547	ทุ่งน้อย	โพทะเล	66130	660605	6606	66
3548	ท่าขมิ้น	โพทะเล	66130	660606	6606	66
3549	ท่านั่ง	โพทะเล	66130	660611	6606	66
3550	ท่าบัว	โพทะเล	66130	660604	6606	66
3551	ท่าเสา	โพทะเล	66130	660607	6606	66
3552	ท้ายน้ำ	โพทะเล	66130	660602	6606	66
3553	บางคลาน	โพทะเล	66130	660608	6606	66
3554	บ้านน้อย	โพทะเล	66130	660612	6606	66
3555	วัดขวาง	โพทะเล	66130	660613	6606	66
3556	โพทะเล	โพทะเล	66130	660601	6606	66
3557	ดงเสือเหลือง	โพธิ์ประทับช้าง	66190	660305	6603	66
3558	ทุ่งใหญ่	โพธิ์ประทับช้าง	66190	660307	6603	66
3559	วังจิก	โพธิ์ประทับช้าง	66190	660193	6603	66
3560	เนินสว่าง	โพธิ์ประทับช้าง	66190	660306	6603	66
3561	โพธิ์ประทับช้าง	โพธิ์ประทับช้าง	66190	660194	6603	66
3562	ไผ่ท่าโพ	โพธิ์ประทับช้าง	66190	660195	6603	66
3563	ไผ่รอบ	โพธิ์ประทับช้าง	66190	660192	6603	66
3564	ชาติตระการ	ชาติตระการ	65170	650302	6503	65
3565	ท่าสะแก	ชาติตระการ	65170	650306	6503	65
3566	บ่อภาค	ชาติตระการ	65170	650305	6503	65
3567	บ้านดง	ชาติตระการ	65170	650304	6503	65
3724	หนองม่วง	บรบือ	44130	440605	4406	44
3568	ป่าแดง	ชาติตระการ	65170	650301	6503	65
3569	สวนเมี่ยง	ชาติตระการ	65170	650303	6503	65
3570	นครชุม	นครไทย	65120	650206	6502	65
3571	นครไทย	นครไทย	65120	650201	6502	65
3572	นาบัว	นครไทย	65120	650205	6502	65
3573	น้ำกุ่ม	นครไทย	65120	650207	6502	65
3574	บ่อโพธิ์	นครไทย	65120	650209	6502	65
3575	บ้านพร้าว	นครไทย	65120	650210	6502	65
3576	บ้านแยง	นครไทย	65120	650203	6502	65
3577	ยางโกลน	นครไทย	65120	650208	6502	65
3578	หนองกะท้าว	นครไทย	65120	650202	6502	65
3579	ห้วยเฮี้ย	นครไทย	65120	650211	6502	65
3580	เนินเพิ่ม	นครไทย	65120	650204	6502	65
3581	ท่าตาล	บางกระทุ่ม	65110	650505	6505	65
3582	นครป่าหมาก	บางกระทุ่ม	65110	650507	6505	65
3583	บางกระทุ่ม	บางกระทุ่ม	65110	650501	6505	65
3584	บ้านไร่	บางกระทุ่ม	65110	650502	6505	65
3585	วัดตายม	บางกระทุ่ม	65210	650509	6505	65
3586	สนามคลี	บางกระทุ่ม	65110	650504	6505	65
3587	เนินกุ่ม	บางกระทุ่ม	65210	650508	6505	65
3588	โคกสลุด	บางกระทุ่ม	65110	650503	6505	65
3589	ไผ่ล้อม	บางกระทุ่ม	65110	650506	6505	65
3590	คุยม่วง	บางระกำ	65240	650411	6504	65
3591	ชุมแสงสงคราม	บางระกำ	65240	650407	6504	65
3592	ท่านางงาม	บางระกำ	65140	650410	6504	65
3593	นิคมพัฒนา	บางระกำ	65140	650408	6504	65
3594	บางระกำ	บางระกำ	65140	650401	6504	65
3595	บึงกอก	บางระกำ	65140	650405	6504	65
3596	บ่อทอง	บางระกำ	65140	650409	6504	65
3597	ปลักแรด	บางระกำ	65140	650402	6504	65
3598	พันเสา	บางระกำ	65140	650403	6504	65
3599	วังอิทก	บางระกำ	65140	650404	6504	65
3600	หนองกุลา	บางระกำ	65140	650406	6504	65
3601	ดงประคำ	พรหมพิราม	65180	650612	6506	65
3602	ตลุกเทียม	พรหมพิราม	65180	650607	6506	65
3603	ทับยายเชียง	พรหมพิราม	65150	650611	6506	65
3604	ท่าช้าง	พรหมพิราม	65150	650602	6506	65
3605	พรหมพิราม	พรหมพิราม	65150	650601	6506	65
3606	มะตูม	พรหมพิราม	65150	650604	6506	65
3607	มะต้อง	พรหมพิราม	65180	650610	6506	65
3608	วงฆ้อง	พรหมพิราม	65180	650603	6506	65
3609	วังวน	พรหมพิราม	65150	650608	6506	65
3610	ศรีภิรมย์	พรหมพิราม	65180	650606	6506	65
3611	หนองแขม	พรหมพิราม	65150	650609	6506	65
3612	หอกลอง	พรหมพิราม	65150	650605	6506	65
3613	ชัยนาม	วังทอง	65130	650810	6508	65
3614	ดินทอง	วังทอง	65130	650811	6508	65
3615	ท่าหมื่นราม	วังทอง	65130	650807	6508	65
3616	บ้านกลาง	วังทอง	65220	650804	6508	65
3617	พันชาลี	วังทอง	65130	650802	6508	65
3618	วังทอง	วังทอง	65130	650801	6508	65
3619	วังนกแอ่น	วังทอง	65130	650808	6508	65
3620	วังพิกุล	วังทอง	65130	650805	6508	65
3621	หนองพระ	วังทอง	65130	650809	6508	65
3622	แก่งโสภา	วังทอง	65220	650806	6508	65
3623	แม่ระกา	วังทอง	65130	650803	6508	65
3624	คันโช้ง	วัดโบสถ์	65160	650706	6507	65
3625	ท่างาม	วัดโบสถ์	65160	650702	6507	65
3626	ท้อแท้	วัดโบสถ์	65160	650703	6507	65
3627	บ้านยาง	วัดโบสถ์	65160	650704	6507	65
3628	วัดโบสถ์	วัดโบสถ์	65160	650701	6507	65
3629	หินลาด	วัดโบสถ์	65160	650705	6507	65
3630	ชมพู	เนินมะปราง	65190	650899	6509	65
3631	บ้านน้อยซุ้มขี้เหล็ก	เนินมะปราง	65190	650895	6509	65
3632	บ้านมุง	เนินมะปราง	65190	650898	6509	65
3633	วังยาง	เนินมะปราง	65190	650907	6509	65
3634	วังโพรง	เนินมะปราง	65190	650896	6509	65
3635	เนินมะปราง	เนินมะปราง	65190	650906	6509	65
3636	ไทรย้อย	เนินมะปราง	65190	650897	6509	65
3637	งิ้วงาม	เมืองพิษณุโลก	65230	650120	6501	65
3638	จอมทอง	เมืองพิษณุโลก	65000	650112	6501	65
3639	ดอนทอง	เมืองพิษณุโลก	65000	650108	6501	65
3640	ท่าทอง	เมืองพิษณุโลก	65000	650105	6501	65
3641	ท่าโพธิ์	เมืองพิษณุโลก	65000	650106	6501	65
3642	บึงพระ	เมืองพิษณุโลก	65000	650118	6501	65
3643	บ้านกร่าง	เมืองพิษณุโลก	65000	650113	6501	65
3644	บ้านคลอง	เมืองพิษณุโลก	65000	650114	6501	65
3645	บ้านป่า	เมืองพิษณุโลก	65000	650109	6501	65
3646	ปากโทก	เมืองพิษณุโลก	65000	650110	6501	65
3647	พลายชุมพล	เมืองพิษณุโลก	65000	650115	6501	65
3648	มะขามสูง	เมืองพิษณุโลก	65000	650116	6501	65
3649	วังน้ำคู้	เมืองพิษณุโลก	65230	650102	6501	65
3650	วัดจันทร์	เมืองพิษณุโลก	65000	650103	6501	65
3651	วัดพริก	เมืองพิษณุโลก	65230	650104	6501	65
3652	สมอแข	เมืองพิษณุโลก	65000	650107	6501	65
3653	หัวรอ	เมืองพิษณุโลก	65000	650111	6501	65
3654	อรัญญิก	เมืองพิษณุโลก	65000	650117	6501	65
3655	ในเมือง	เมืองพิษณุโลก	65000	650101	6501	65
3656	ไผ่ขอดอน	เมืองพิษณุโลก	65000	650119	6501	65
3657	กมลา	กะทู้	83120	830203	8302	83
3658	กะทู้	กะทู้	83120	830201	8302	83
3659	ป่าตอง	กะทู้	83150	830202	8302	83
3660	ป่าคลอก	ถลาง	83110	830304	8303	83
3661	ศรีสุนทร	ถลาง	83110	830302	8303	83
3662	สาคู	ถลาง	83110	830306	8303	83
3663	เชิงทะเล	ถลาง	83110	830303	8303	83
3664	เทพกระษัตรี	ถลาง	83110	830301	8303	83
3665	ไม้ขาว	ถลาง	83110	830305	8303	83
3666	กะรน	เมืองภูเก็ต	83100	830108	8301	83
3667	ฉลอง	เมืองภูเก็ต	83000	830106	8301	83
3668	ฉลอง	เมืองภูเก็ต	83130	830106	8301	83
3669	ตลาดเหนือ	เมืองภูเก็ต	83000	830102	8301	83
3670	ตลาดใหญ่	เมืองภูเก็ต	83000	830101	8301	83
3671	รัษฎา	เมืองภูเก็ต	83000	830104	8301	83
3672	ราไวย์	เมืองภูเก็ต	83100	830107	8301	83
3673	ราไวย์	เมืองภูเก็ต	83130	830107	8301	83
3674	วิชิต	เมืองภูเก็ต	83000	830105	8301	83
3675	เกาะแก้ว	เมืองภูเก็ต	83000	830103	8301	83
3676	กุดใส้จ่อ	กันทรวิชัย	44150	440409	4404	44
3677	ขามเฒ่าพัฒนา	กันทรวิชัย	44150	440410	4404	44
3678	ขามเรียง	กันทรวิชัย	44150	440406	4404	44
3679	คันธารราษฎร์	กันทรวิชัย	44150	440402	4404	44
3680	ท่าขอนยาง	กันทรวิชัย	44150	440404	4404	44
3681	นาสีนวน	กันทรวิชัย	44150	440405	4404	44
3682	มะค่า	กันทรวิชัย	44150	440403	4404	44
3683	ศรีสุข	กันทรวิชัย	44150	440408	4404	44
3684	เขวาใหญ่	กันทรวิชัย	44150	440407	4404	44
3685	โคกพระ	กันทรวิชัย	44150	440401	4404	44
3686	กุดรัง	กุดรัง	44130	440603	4412	44
3687	นาโพธิ์	กุดรัง	44130	440612	4412	44
3688	หนองแวง	กุดรัง	44130	440614	4412	44
3689	ห้วยเตย	กุดรัง	44130	440617	4412	44
3690	เลิงแฝก	กุดรัง	44130	440609	4412	44
3691	กุดปลาดุก	ชื่นชม	44160	440509	4413	44
3692	ชื่นชม	ชื่นชม	44160	440502	4413	44
3693	หนองกุง	ชื่นชม	44160	440204	4413	44
3694	เหล่าดอกไม้	ชื่นชม	44160	440504	4413	44
3695	กู่สันตรัตน์	นาดูน	44180	441008	4410	44
3696	ดงดวน	นาดูน	44180	441005	4410	44
3697	ดงบัง	นาดูน	44180	441004	4410	44
3698	ดงยาง	นาดูน	44180	441007	4410	44
3699	นาดูน	นาดูน	44180	440998	4410	44
3700	พระธาตุ	นาดูน	44180	441009	4410	44
3701	หนองคู	นาดูน	44180	440999	4410	44
3702	หนองไผ่	นาดูน	44180	440997	4410	44
3703	หัวดง	นาดูน	44180	441006	4410	44
3704	นาเชือก	นาเชือก	44170	440701	4407	44
3705	ปอพาน	นาเชือก	44170	440706	4407	44
3706	สันป่าตอง	นาเชือก	44170	440710	4407	44
3707	สำโรง	นาเชือก	44170	440702	4407	44
3708	หนองกุง	นาเชือก	44170	440204	4407	44
3709	หนองเม็ก	นาเชือก	44170	440707	4407	44
3710	หนองเรือ	นาเชือก	44170	440708	4407	44
3711	หนองแดง	นาเชือก	44170	440703	4407	44
3712	หนองโพธิ์	นาเชือก	44170	440705	4407	44
3713	เขวาไร่	นาเชือก	44170	440304	4407	44
3714	กำพี้	บรบือ	44130	440606	4406	44
3715	ดอนงัว	บรบือ	44130	440620	4406	44
3716	บรบือ	บรบือ	44130	440601	4406	44
3717	บัวมาศ	บรบือ	44130	440611	4406	44
3718	บ่อใหญ่	บรบือ	44130	440602	4406	44
3719	ยาง	บรบือ	44130	440616	4406	44
3720	วังใหม่	บรบือ	44130	440615	4406	44
3721	วังไชย	บรบือ	44130	440604	4406	44
3722	หนองคูขาด	บรบือ	44130	440613	4406	44
3723	หนองจิก	บรบือ	44130	440610	4406	44
3725	หนองสิม	บรบือ	44130	440618	4406	44
3726	หนองโก	บรบือ	44130	440619	4406	44
3727	โนนราษี	บรบือ	44130	440607	4406	44
3728	โนนแดง	บรบือ	44130	440608	4406	44
3729	ก้ามปู	พยัคฆภูมิพิสัย	44110	440802	4408	44
3730	นาสีนวล	พยัคฆภูมิพิสัย	44110	440805	4408	44
3731	ปะหลาน	พยัคฆภูมิพิสัย	44110	440801	4408	44
3732	ภารแอ่น	พยัคฆภูมิพิสัย	44110	440820	4408	44
3733	ราษฎร์พัฒนา	พยัคฆภูมิพิสัย	44110	440818	4408	44
3734	ราษฎร์เจริญ	พยัคฆภูมิพิสัย	44110	440809	4408	44
3735	ลานสะแก	พยัคฆภูมิพิสัย	44110	440815	4408	44
3736	หนองบัว	พยัคฆภูมิพิสัย	44110	440308	4408	44
3737	หนองบัวแก้ว	พยัคฆภูมิพิสัย	44110	440810	4408	44
3738	เมืองเตา	พยัคฆภูมิพิสัย	44110	440812	4408	44
3739	เมืองเสือ	พยัคฆภูมิพิสัย	44110	440819	4408	44
3740	เม็กดำ	พยัคฆภูมิพิสัย	44110	440804	4408	44
3741	เวียงชัย	พยัคฆภูมิพิสัย	44110	440816	4408	44
3742	เวียงสะอาด	พยัคฆภูมิพิสัย	44110	440803	4408	44
3743	ขามเรียน	ยางสีสุราช	44210	440808	4411	44
3744	ดงเมือง	ยางสีสุราช	44210	440806	4411	44
3745	นาภู	ยางสีสุราช	44210	440811	4411	44
3746	บ้านกู่	ยางสีสุราช	44210	440813	4411	44
3747	ยางสีสุราช	ยางสีสุราช	44210	440814	4411	44
3748	หนองบัวสันตุ	ยางสีสุราช	44210	441107	4411	44
3749	แวงดง	ยางสีสุราช	44210	440807	4411	44
3750	ขามป้อม	วาปีปทุม	44120	440902	4409	44
3751	งัวบา	วาปีปทุม	44120	440908	4409	44
3752	ดงใหญ่	วาปีปทุม	44120	440904	4409	44
3753	นาข่า	วาปีปทุม	44120	440909	4409	44
3754	บ้านหวาย	วาปีปทุม	44120	440910	4409	44
3755	ประชาพัฒนา	วาปีปทุม	44120	440912	4409	44
3756	หนองทุ่ม	วาปีปทุม	44120	440913	4409	44
3757	หนองแสง	วาปีปทุม	44120	440901	4409	44
3758	หนองแสน	วาปีปทุม	44120	440914	4409	44
3759	หนองไฮ	วาปีปทุม	44120	440911	4409	44
3760	หัวเรือ	วาปีปทุม	44120	440906	4409	44
3761	เสือโก้ก	วาปีปทุม	44120	440903	4409	44
3762	แคน	วาปีปทุม	44120	440907	4409	44
3763	โคกสีทองหลาง	วาปีปทุม	44120	440915	4409	44
3764	โพธิ์ชัย	วาปีปทุม	44120	440905	4409	44
3765	กู่ทอง	เชียงยืน	44160	440506	4405	44
3766	ดอนเงิน	เชียงยืน	44160	440505	4405	44
3767	นาทอง	เชียงยืน	44160	440507	4405	44
3768	หนองซอน	เชียงยืน	44160	440503	4405	44
3769	เชียงยืน	เชียงยืน	44160	440501	4405	44
3770	เสือเฒ่า	เชียงยืน	44160	440508	4405	44
3771	เหล่าบัวบาน	เชียงยืน	44160	440512	4405	44
3772	โพนทอง	เชียงยืน	44160	440511	4405	44
3773	ดอนหว่าน	เมืองมหาสารคาม	44000	440106	4401	44
3774	ตลาด	เมืองมหาสารคาม	44000	440101	4401	44
3775	ท่าตูม	เมืองมหาสารคาม	44000	440103	4401	44
3776	ท่าสองคอน	เมืองมหาสารคาม	44000	440109	4401	44
3777	บัวค้อ	เมืองมหาสารคาม	44000	440114	4401	44
3778	ลาดพัฒนา	เมืองมหาสารคาม	44000	440110	4401	44
3779	หนองปลิง	เมืองมหาสารคาม	44000	440111	4401	44
3780	หนองโน	เมืองมหาสารคาม	44000	440113	4401	44
3781	ห้วยแอ่ง	เมืองมหาสารคาม	44000	440112	4401	44
3782	เกิ้ง	เมืองมหาสารคาม	44000	440107	4401	44
3783	เขวา	เมืองมหาสารคาม	44000	440102	4401	44
3784	แก่งเลิงจาน	เมืองมหาสารคาม	44000	440108	4401	44
3785	แวงน่าง	เมืองมหาสารคาม	44000	440104	4401	44
3786	โคกก่อ	เมืองมหาสารคาม	44000	440105	4401	44
3787	มิตรภาพ	แกดำ	44190	440203	4402	44
3788	วังแสง	แกดำ	44190	440202	4402	44
3789	หนองกุง	แกดำ	44190	440204	4402	44
3790	แกดำ	แกดำ	44190	440201	4402	44
3791	โนนภิบาล	แกดำ	44190	440205	4402	44
3792	ดอนกลาง	โกสุมพิสัย	44140	440317	4403	44
3793	ยางท่าแจ้ง	โกสุมพิสัย	44140	440313	4403	44
3794	ยางน้อย	โกสุมพิสัย	44140	440302	4403	44
3795	วังยาว	โกสุมพิสัย	44140	440303	4403	44
3796	หนองกุงสวรรค์	โกสุมพิสัย	44140	440315	4403	44
3797	หนองบอน	โกสุมพิสัย	44140	440311	4403	44
3798	หนองบัว	โกสุมพิสัย	44140	440308	4403	44
3799	หนองเหล็ก	โกสุมพิสัย	44140	440307	4403	44
3800	หัวขวาง	โกสุมพิสัย	44140	440301	4403	44
3801	เขวาไร่	โกสุมพิสัย	44140	440304	4403	44
3802	เขื่อน	โกสุมพิสัย	44140	440310	4403	44
3803	เลิงใต้	โกสุมพิสัย	44140	440316	4403	44
3804	เหล่า	โกสุมพิสัย	44140	440309	4403	44
3805	แก้งแก	โกสุมพิสัย	44140	440306	4403	44
3806	แพง	โกสุมพิสัย	44140	440305	4403	44
3807	แห่ใต้	โกสุมพิสัย	44140	440314	4403	44
3808	โพนงาม	โกสุมพิสัย	44140	440312	4403	44
3809	คำชะอี	คำชะอี	49110	490504	4905	49
3810	คำบก	คำชะอี	49110	490512	4905	49
3811	น้ำเที่ยง	คำชะอี	49110	490514	4905	49
3812	บ้านค้อ	คำชะอี	49110	490506	4905	49
3813	บ้านซ่ง	คำชะอี	49110	490503	4905	49
3814	บ้านเหล่า	คำชะอี	49110	490507	4905	49
3815	หนองเอี่ยน	คำชะอี	49110	490505	4905	49
3816	เหล่าสร้างถ่อ	คำชะอี	49110	490511	4905	49
3817	โพนงาม	คำชะอี	49110	490508	4905	49
3818	กกตูม	ดงหลวง	49140	490403	4904	49
3819	ชะโนดน้อย	ดงหลวง	49140	490405	4904	49
3820	ดงหลวง	ดงหลวง	49140	490401	4904	49
3821	พังแดง	ดงหลวง	49140	490406	4904	49
3822	หนองบัว	ดงหลวง	49140	490402	4904	49
3823	หนองแคน	ดงหลวง	49140	490404	4904	49
3824	ดอนตาล	ดอนตาล	49120	490301	4903	49
3825	นาสะเม็ง	ดอนตาล	49120	490306	4903	49
3826	บ้านบาก	ดอนตาล	49120	490305	4903	49
3827	บ้านแก้ง	ดอนตาล	49120	490307	4903	49
3828	ป่าไร่	ดอนตาล	49120	490303	4903	49
3829	เหล่าหมี	ดอนตาล	49120	490304	4903	49
3830	โพธิ์ไทร	ดอนตาล	49120	490302	4903	49
3831	กกแดง	นิคมคำสร้อย	49130	490195	4902	49
3832	นากอก	นิคมคำสร้อย	49130	490196	4902	49
3833	นาอุดม	นิคมคำสร้อย	49130	490205	4902	49
3834	นิคมคำสร้อย	นิคมคำสร้อย	49130	490201	4902	49
3835	ร่มเกล้า	นิคมคำสร้อย	49130	490207	4902	49
3836	หนองแวง	นิคมคำสร้อย	49130	490194	4902	49
3837	โชคชัย	นิคมคำสร้อย	49130	490206	4902	49
3838	บ้านเป้า	หนองสูง	49160	490510	4907	49
3839	ภูวง	หนองสูง	49160	490513	4907	49
3840	หนองสูง	หนองสูง	49160	490502	4907	49
3841	หนองสูงเหนือ	หนองสูง	49160	490706	4907	49
3842	หนองสูงใต้	หนองสูง	49160	490501	4907	49
3843	โนนยาง	หนองสูง	49160	490509	4907	49
3844	ชะโนด	หว้านใหญ่	49150	490604	4906	49
3845	ดงหมู	หว้านใหญ่	49150	490605	4906	49
3846	บางทรายน้อย	หว้านใหญ่	49150	490198	4906	49
3847	ป่งขาม	หว้านใหญ่	49150	490602	4906	49
3848	หว้านใหญ่	หว้านใหญ่	49150	490199	4906	49
3849	กุดแข้	เมืองมุกดาหาร	49000	490113	4901	49
3850	คำป่าหลาย	เมืองมุกดาหาร	49000	490109	4901	49
3851	คำอาฮวน	เมืองมุกดาหาร	49000	490110	4901	49
3852	ดงมอน	เมืองมุกดาหาร	49000	490112	4901	49
3853	ดงเย็น	เมืองมุกดาหาร	49000	490111	4901	49
3854	นาสีนวน	เมืองมุกดาหาร	49000	490108	4901	49
3855	นาโสก	เมืองมุกดาหาร	49000	490107	4901	49
3856	บางทรายใหญ่	เมืองมุกดาหาร	49000	490104	4901	49
3857	บ้านโคก	เมืองมุกดาหาร	49000	490103	4901	49
3858	ผึ่งแดด	เมืองมุกดาหาร	49000	490106	4901	49
3859	มุกดาหาร	เมืองมุกดาหาร	49000	490101	4901	49
3860	ศรีบุญเรือง	เมืองมุกดาหาร	49000	490102	4901	49
3861	โพนทราย	เมืองมุกดาหาร	49000	490105	4901	49
3862	กรงปินัง	กรงปินัง	95000	950113	9508	95
3863	ปุโรง	กรงปินัง	95000	950105	9508	95
3864	สะเอะ	กรงปินัง	95000	950107	9508	95
3865	ห้วยกระทิง	กรงปินัง	95000	950117	9508	95
3866	กาบัง	กาบัง	95120	950505	9507	95
3867	บาละ	กาบัง	95120	950509	9507	95
3868	คีรีเขต	ธารโต	95150	950404	9504	95
3869	ธารโต	ธารโต	95150	950399	9504	95
3870	บ้านแหร	ธารโต	95150	950398	9504	95
3871	แม่หวาด	ธารโต	95170	950397	9504	95
3872	ตลิ่งชัน	บันนังสตา	95130	950305	9503	95
3873	ตาเนาะปูเต๊ะ	บันนังสตา	95130	950303	9503	95
3874	ถ้ำทะลุ	บันนังสตา	95130	950304	9503	95
3875	บันนังสตา	บันนังสตา	95130	950301	9503	95
3876	บาเจาะ	บันนังสตา	95130	950302	9503	95
3877	เขื่อนบางลาง	บันนังสตา	95130	950306	9503	95
3878	กาตอง	ยะหา	95120	950508	9505	95
3879	ตาชี	ยะหา	95120	950506	9505	95
3880	บาโงยซิแน	ยะหา	95120	950507	9505	95
3881	บาโร๊ะ	ยะหา	95120	950504	9505	95
3882	ปะแต	ยะหา	95120	950503	9505	95
3883	ยะหา	ยะหา	95120	950501	9505	95
3884	ละแอ	ยะหา	95120	950502	9505	95
3885	กอตอตือร๊ะ	รามัน	95140	950604	9506	95
3886	กายูบอเกาะ	รามัน	95140	950601	9506	95
3887	กาลอ	รามัน	95140	950603	9506	95
3888	กาลูปัง	รามัน	95140	950602	9506	95
3889	จะกว๊ะ	รามัน	95140	950607	9506	95
3890	ตะโล๊ะหะลอ	รามัน	95140	950616	9506	95
3891	ท่าธง	รามัน	95140	950608	9506	95
3892	บาลอ	รามัน	95140	950610	9506	95
3893	บาโงย	รามัน	95140	950611	9506	95
3894	บือมัง	รามัน	95140	950612	9506	95
3895	ยะต๊ะ	รามัน	95140	950613	9506	95
3896	วังพญา	รามัน	95140	950614	9506	95
3897	อาซ่อง	รามัน	95140	950615	9506	95
3898	เกะรอ	รามัน	95140	950606	9506	95
3899	เนินงาม	รามัน	95140	950609	9506	95
3900	โกตาบารู	รามัน	95140	950605	9506	95
3901	ตาเนาะแมเราะ	เบตง	95110	950203	9502	95
3902	ธารน้ำทิพย์	เบตง	95110	950205	9502	95
3903	ยะรม	เบตง	95110	950202	9502	95
3904	อัยเยอร์เวง	เบตง	95110	950204	9502	95
3905	เบตง	เบตง	95110	950201	9502	95
3906	ตาเซะ	เมืองยะลา	95000	950118	9501	95
3907	ท่าสาป	เมืองยะลา	95000	950108	9501	95
3908	บันนังสาเรง	เมืองยะลา	95000	950115	9501	95
3909	บุดี	เมืองยะลา	95000	950102	9501	95
3910	พร่อน	เมืองยะลา	95160	950114	9501	95
3911	ยะลา	เมืองยะลา	95000	950106	9501	95
3912	ยุโป	เมืองยะลา	95000	950103	9501	95
3913	ลำพะยา	เมืองยะลา	95160	950111	9501	95
3914	ลำใหม่	เมืองยะลา	95160	950109	9501	95
3915	ลิดล	เมืองยะลา	95160	950104	9501	95
3916	สะเตง	เมืองยะลา	95000	950101	9501	95
3917	สะเตงนอก	เมืองยะลา	95000	950116	9501	95
3918	หน้าถ้ำ	เมืองยะลา	95000	950110	9501	95
3919	เปาะเส้ง	เมืองยะลา	95000	950112	9501	95
3920	กำแมด	กุดชุม	35140	350303	3503	35
3921	กุดชุม	กุดชุม	35140	350301	3503	35
3922	คำน้ำสร้าง	กุดชุม	35140	350308	3503	35
3923	นาโส่	กุดชุม	35140	350304	3503	35
3924	หนองหมี	กุดชุม	35140	350306	3503	35
3925	หนองแหน	กุดชุม	35140	350309	3503	35
3926	ห้วยแก้ง	กุดชุม	35140	350305	3503	35
3927	โนนเปือย	กุดชุม	35140	350302	3503	35
3928	โพนงาม	กุดชุม	35140	350307	3503	35
3929	กุดกุง	คำเขื่อนแก้ว	35110	350410	3504	35
3930	กู่จาน	คำเขื่อนแก้ว	35110	350408	3504	35
3931	ดงเจริญ	คำเขื่อนแก้ว	35110	350413	3504	35
3932	ดงแคนใหญ่	คำเขื่อนแก้ว	35180	350407	3504	35
3933	ทุ่งมน	คำเขื่อนแก้ว	35110	350405	3504	35
3934	นาคำ	คำเขื่อนแก้ว	35180	350406	3504	35
3935	นาแก	คำเขื่อนแก้ว	35180	350409	3504	35
3936	ย่อ	คำเขื่อนแก้ว	35110	350402	3504	35
3937	ลุมพุก	คำเขื่อนแก้ว	35110	350401	3504	35
3938	สงเปือย	คำเขื่อนแก้ว	35110	350403	3504	35
3939	เหล่าไฮ	คำเขื่อนแก้ว	35110	350411	3504	35
3940	แคนน้อย	คำเขื่อนแก้ว	35180	350412	3504	35
3941	โพนทัน	คำเขื่อนแก้ว	35110	350404	3504	35
3942	กุดน้ำใส	ค้อวัง	35160	350698	3507	35
3943	ค้อวัง	ค้อวัง	35160	350696	3507	35
3944	น้ำอ้อม	ค้อวัง	35160	350697	3507	35
3945	ฟ้าห่วน	ค้อวัง	35160	350699	3507	35
3946	ดงมะไฟ	ทรายมูล	35170	350197	3502	35
3947	ดู่ลาด	ทรายมูล	35170	350202	3502	35
3948	ทรายมูล	ทรายมูล	35170	350199	3502	35
3949	นาเวียง	ทรายมูล	35170	350196	3502	35
3950	ไผ่	ทรายมูล	35170	350205	3502	35
3951	กระจาย	ป่าติ้ว	35150	350502	3505	35
3952	ศรีฐาน	ป่าติ้ว	35150	350505	3505	35
3953	เชียงเพ็ง	ป่าติ้ว	35150	350504	3505	35
3954	โคกนาโก	ป่าติ้ว	35150	350503	3505	35
3955	โพธิ์ไทร	ป่าติ้ว	35150	350501	3505	35
3956	คูเมือง	มหาชนะชัย	35130	350603	3506	35
3957	บากเรือ	มหาชนะชัย	35130	350605	3506	35
3958	บึงแก	มหาชนะชัย	35130	350608	3506	35
3959	ผือฮี	มหาชนะชัย	35130	350604	3506	35
3960	พระเสาร์	มหาชนะชัย	35130	350609	3506	35
3961	ฟ้าหยาด	มหาชนะชัย	35130	350601	3506	35
3962	ม่วง	มหาชนะชัย	35130	350606	3506	35
3963	สงยาง	มหาชนะชัย	35130	350610	3506	35
3964	หัวเมือง	มหาชนะชัย	35130	350602	3506	35
3965	โนนทราย	มหาชนะชัย	35130	350607	3506	35
3966	ขั้นไดใหญ่	เมืองยโสธร	35000	350108	3501	35
3967	ขุมเงิน	เมืองยโสธร	35000	350115	3501	35
3968	ค้อเหนือ	เมืองยโสธร	35000	350105	3501	35
3969	ดู่ทุ่ง	เมืองยโสธร	35000	350106	3501	35
3970	ตาดทอง	เมืองยโสธร	35000	350103	3501	35
3971	ทุ่งนางโอก	เมืองยโสธร	35000	350116	3501	35
3972	ทุ่งแต้	เมืองยโสธร	35000	350109	3501	35
3973	นาสะไมย์	เมืองยโสธร	35000	350111	3501	35
3974	น้ำคำใหญ่	เมืองยโสธร	35000	350102	3501	35
3975	สำราญ	เมืองยโสธร	35000	350104	3501	35
3976	สิงห์	เมืองยโสธร	35000	350110	3501	35
3977	หนองคู	เมืองยโสธร	35000	350114	3501	35
3978	หนองหิน	เมืองยโสธร	35000	350113	3501	35
3979	หนองเป็ด	เมืองยโสธร	35000	350118	3501	35
3980	หนองเรือ	เมืองยโสธร	35000	350117	3501	35
3981	เขื่องคำ	เมืองยโสธร	35000	350112	3501	35
3982	เดิด	เมืองยโสธร	35000	350107	3501	35
3983	ในเมือง	เมืองยโสธร	35000	350101	3501	35
3984	กุดเชียงหมี	เลิงนกทา	35120	350807	3508	35
3985	กุดแห่	เลิงนกทา	35120	350811	3508	35
3986	บุ่งค้า	เลิงนกทา	35120	350802	3508	35
3987	ศรีแก้ว	เลิงนกทา	35120	350814	3508	35
3988	สร้างมิ่ง	เลิงนกทา	35120	350813	3508	35
3989	สวาท	เลิงนกทา	35120	350803	3508	35
3990	สามัคคี	เลิงนกทา	35120	350806	3508	35
3991	สามแยก	เลิงนกทา	35120	350810	3508	35
3992	ห้องแซง	เลิงนกทา	35120	350805	3508	35
3993	โคกสำราญ	เลิงนกทา	35120	350812	3508	35
3994	คำเตย	ไทยเจริญ	35120	350808	3509	35
3995	คำไผ่	ไทยเจริญ	35120	350809	3509	35
3996	น้ำคำ	ไทยเจริญ	35120	350801	3509	35
3997	ส้มผ่อ	ไทยเจริญ	35120	350804	3509	35
3998	ไทยเจริญ	ไทยเจริญ	35120	350815	3509	35
3999	จ.ป.ร.	กระบุรี	85110	850406	8504	85
4000	น้ำจืด	กระบุรี	85110	850401	8504	85
4001	น้ำจืดน้อย	กระบุรี	85110	850402	8504	85
4002	บางใหญ่	กระบุรี	85110	850407	8504	85
4003	ปากจั่น	กระบุรี	85110	850404	8504	85
4004	มะมุ	กระบุรี	85110	850403	8504	85
4005	ลำเลียง	กระบุรี	85110	850405	8504	85
4006	กะเปอร์	กะเปอร์	85120	850302	8503	85
4007	บางหิน	กะเปอร์	85120	850305	8503	85
4008	บ้านนา	กะเปอร์	85120	850304	8503	85
4009	ม่วงกลวง	กะเปอร์	85120	850301	8503	85
4010	เชี่ยวเหลียง	กะเปอร์	85120	850303	8503	85
4011	บางพระเหนือ	ละอุ่น	85130	850204	8502	85
4012	บางพระใต้	ละอุ่น	85130	850203	8502	85
4013	บางแก้ว	ละอุ่น	85130	850205	8502	85
4014	ละอุ่นเหนือ	ละอุ่น	85130	850202	8502	85
4015	ละอุ่นใต้	ละอุ่น	85130	850201	8502	85
4016	ในวงเหนือ	ละอุ่น	85130	850206	8502	85
4017	ในวงใต้	ละอุ่น	85130	850207	8502	85
4018	กำพวน	สุขสำราญ	85120	850307	8505	85
4019	นาคา	สุขสำราญ	85120	850306	8505	85
4020	ทรายแดง	เมืองระนอง	85130	850108	8501	85
4021	บางนอน	เมืองระนอง	85000	850106	8501	85
4022	บางริ้น	เมืองระนอง	85000	850104	8501	85
4023	ปากน้ำ	เมืองระนอง	85000	850105	8501	85
4024	ราชกรูด	เมืองระนอง	85000	850102	8501	85
4025	หงาว	เมืองระนอง	85000	850103	8501	85
4026	หาดส้มแป้น	เมืองระนอง	85000	850107	8501	85
4027	เกาะพยาม	เมืองระนอง	85000	850109	8501	85
4028	เขานิเวศน์	เมืองระนอง	85000	850101	8501	85
4029	นิคมพัฒนา	นิคมพัฒนา	21180	210510	2108	21
4030	พนานิคม	นิคมพัฒนา	21180	210509	2108	21
4031	มะขามคู่	นิคมพัฒนา	21180	210511	2108	21
4032	มาบข่า	นิคมพัฒนา	21180	210508	2108	21
4033	ชากบก	บ้านค่าย	21120	210507	2105	21
4034	ตาขัน	บ้านค่าย	21120	210504	2105	21
4035	บางบุตร	บ้านค่าย	21120	210505	2105	21
4036	บ้านค่าย	บ้านค่าย	21120	210501	2105	21
4037	หนองตะพาน	บ้านค่าย	21120	210503	2105	21
4038	หนองบัว	บ้านค่าย	21120	210506	2105	21
4039	หนองละลอก	บ้านค่าย	21120	210502	2105	21
4040	บ้านฉาง	บ้านฉาง	21130	210203	2102	21
4041	พลา	บ้านฉาง	21130	210199	2102	21
4042	สำนักท้อน	บ้านฉาง	21130	210198	2102	21
4043	ตาสิทธิ์	ปลวกแดง	21140	210598	2106	21
4044	ปลวกแดง	ปลวกแดง	21140	210599	2106	21
4045	มาบยางพร	ปลวกแดง	21140	210595	2106	21
4046	ละหาร	ปลวกแดง	21140	210597	2106	21
4047	หนองไร่	ปลวกแดง	21140	210594	2106	21
4048	แม่น้ำคู้	ปลวกแดง	21140	210596	2106	21
4049	ชุมแสง	วังจันทร์	21210	210398	2104	21
4050	ป่ายุบใน	วังจันทร์	21210	210403	2104	21
4051	พลงตาเอี่ยม	วังจันทร์	21210	210404	2104	21
4052	วังจันทร์	วังจันทร์	21210	210399	2104	21
4053	ชำฆ้อ	เขาชะเมา	21110	210315	2107	21
4054	น้ำเป็น	เขาชะเมา	21110	210314	2107	21
4055	ห้วยทับมอญ	เขาชะเมา	21110	210316	2107	21
4056	เขาน้อย	เขาชะเมา	21110	210319	2107	21
4057	กะเฉด	เมืองระยอง	21100	210110	2101	21
4058	ตะพง	เมืองระยอง	21000	210103	2101	21
4059	ทับมา	เมืองระยอง	21000	210111	2101	21
4060	ท่าประดู่	เมืองระยอง	21000	210101	2101	21
4061	นาตาขวัญ	เมืองระยอง	21000	210108	2101	21
4062	น้ำคอก	เมืองระยอง	21000	210112	2101	21
4063	บ้านแลง	เมืองระยอง	21000	210107	2101	21
4064	ปากน้ำ	เมืองระยอง	21000	210104	2101	21
4065	มาบตาพุด	เมืองระยอง	21150	210114	2101	21
4066	สำนักทอง	เมืองระยอง	21100	210115	2101	21
4067	ห้วยโป่ง	เมืองระยอง	21150	210113	2101	21
4068	เชิงเนิน	เมืองระยอง	21000	210102	2101	21
4069	เนินพระ	เมืองระยอง	21000	210109	2101	21
4070	เนินพระ	เมืองระยอง	21150	210109	2101	21
4071	เพ	เมืองระยอง	21160	210105	2101	21
4072	แกลง	เมืองระยอง	21160	210106	2101	21
4073	กระแสบน	แกลง	21110	210307	2103	21
4074	กร่ำ	แกลง	21190	210305	2103	21
4075	กองดิน	แกลง	22160	210310	2103	21
4076	คลองปูน	แกลง	21170	210311	2103	21
4077	ชากพง	แกลง	21190	210306	2103	21
4078	ชากโดน	แกลง	21110	210303	2103	21
4079	ทางเกวียน	แกลง	21110	210301	2103	21
4080	ทุ่งควายกิน	แกลง	21110	210309	2103	21
4081	บ้านนา	แกลง	21110	210308	2103	21
4082	ปากน้ำกระแส	แกลง	21170	210313	2103	21
4083	พังราด	แกลง	21170	210312	2103	21
4084	วังหว้า	แกลง	21110	210302	2103	21
4085	สองสลึง	แกลง	21110	210318	2103	21
4086	ห้วยยาง	แกลง	21110	210317	2103	21
4087	เนินฆ้อ	แกลง	21110	210304	2103	21
4088	จอมบึง	จอมบึง	70150	700201	7002	70
4089	ด่านทับตะโก	จอมบึง	70150	700204	7002	70
4090	ปากช่อง	จอมบึง	70150	700202	7002	70
4091	รางบัว	จอมบึง	70150	700206	7002	70
4092	เบิกไพร	จอมบึง	70150	700203	7002	70
4093	แก้มอ้น	จอมบึง	70150	700205	7002	70
4094	ขุนพิทักษ์	ดำเนินสะดวก	70130	700412	7004	70
4095	ดอนกรวย	ดำเนินสะดวก	70130	700405	7004	70
4096	ดอนคลัง	ดำเนินสะดวก	70130	700406	7004	70
4097	ดอนไผ่	ดำเนินสะดวก	70130	700413	7004	70
4098	ดำเนินสะดวก	ดำเนินสะดวก	70130	700401	7004	70
4099	ตาหลวง	ดำเนินสะดวก	70130	700404	7004	70
4100	ท่านัด	ดำเนินสะดวก	70130	700411	7004	70
4101	บัวงาม	ดำเนินสะดวก	70210	700407	7004	70
4102	บ้านไร่	ดำเนินสะดวก	70130	700122	7004	70
4103	ประสาทสิทธิ์	ดำเนินสะดวก	70210	700402	7004	70
4104	ศรีสุราษฎร์	ดำเนินสะดวก	70130	700403	7004	70
4105	สี่หมื่น	ดำเนินสะดวก	70130	700410	7004	70
4106	แพงพวย	ดำเนินสะดวก	70130	700409	7004	70
4107	ดอนคา	บางแพ	70160	700606	7006	70
4108	ดอนใหญ่	บางแพ	70160	700605	7006	70
4109	บางแพ	บางแพ	70160	700601	7006	70
4110	วังเย็น	บางแพ	70160	700602	7006	70
4111	วัดแก้ว	บางแพ	70160	700604	7006	70
4112	หัวโพ	บางแพ	70160	700603	7006	70
4113	โพหัก	บางแพ	70160	700607	7006	70
4114	บ้านคา	บ้านคา	70180	700305	7010	70
4115	บ้านบึง	บ้านคา	70180	700303	7010	70
4116	หนองพันจันทร์	บ้านคา	70180	700306	7010	70
4117	กรับใหญ่	บ้านโป่ง	70190	700503	7005	70
4118	คุ้งพยอม	บ้านโป่ง	70110	700511	7005	70
4119	ดอนกระเบื้อง	บ้านโป่ง	70110	700507	7005	70
4120	ท่าผา	บ้านโป่ง	70110	700502	7005	70
4121	นครชุมน์	บ้านโป่ง	70110	700509	7005	70
4122	บ้านม่วง	บ้านโป่ง	70110	700510	7005	70
4123	บ้านโป่ง	บ้านโป่ง	70110	700501	7005	70
4124	ปากแรต	บ้านโป่ง	70110	700504	7005	70
4125	ลาดบัวขาว	บ้านโป่ง	70110	700515	7005	70
4126	สวนกล้วย	บ้านโป่ง	70110	700508	7005	70
4127	หนองกบ	บ้านโป่ง	70110	700505	7005	70
4128	หนองปลาหมอ	บ้านโป่ง	70110	700512	7005	70
4129	หนองอ้อ	บ้านโป่ง	70110	700506	7005	70
4130	เขาขลุง	บ้านโป่ง	70110	700513	7005	70
4131	เบิกไพร	บ้านโป่ง	70110	700203	7005	70
4132	ดอนทราย	ปากท่อ	70140	700708	7008	70
4133	ทุ่งหลวง	ปากท่อ	70140	700801	7008	70
4134	บ่อกระดาน	ปากท่อ	70140	700809	7008	70
4135	ปากท่อ	ปากท่อ	70140	700805	7008	70
4136	ป่าไก่	ปากท่อ	70140	700806	7008	70
4137	ยางหัก	ปากท่อ	70140	700810	7008	70
4138	วังมะนาว	ปากท่อ	70140	700802	7008	70
4139	วัดยางงาม	ปากท่อ	70140	700807	7008	70
4140	วันดาว	ปากท่อ	70140	700811	7008	70
4141	หนองกระทุ่ม	ปากท่อ	70140	700804	7008	70
4142	ห้วยยางโทน	ปากท่อ	70140	700812	7008	70
4143	อ่างหิน	ปากท่อ	70140	700808	7008	70
4144	จอมประทัด	วัดเพลง	70170	700902	7009	70
4145	วัดเพลง	วัดเพลง	70170	700903	7009	70
4146	เกาะศาลพระ	วัดเพลง	70170	700901	7009	70
4147	ตะนาวศรี	สวนผึ้ง	70180	700307	7003	70
4148	ท่าเคย	สวนผึ้ง	70180	700304	7003	70
4149	ป่าหวาย	สวนผึ้ง	70180	700297	7003	70
4150	สวนผึ้ง	สวนผึ้ง	70180	700299	7003	70
4151	คุ้งกระถิน	เมืองราชบุรี	70000	700107	7001	70
4152	คุ้งน้ำวน	เมืองราชบุรี	70000	700106	7001	70
4153	คูบัว	เมืองราชบุรี	70000	700120	7001	70
4154	ดอนตะโก	เมืองราชบุรี	70000	700103	7001	70
4155	ดอนแร่	เมืองราชบุรี	70000	700113	7001	70
4156	ท่าราบ	เมืองราชบุรี	70000	700121	7001	70
4157	น้ำพุ	เมืองราชบุรี	70000	700112	7001	70
4158	บางป่า	เมืองราชบุรี	70000	700118	7001	70
4159	บ้านไร่	เมืองราชบุรี	70000	700122	7001	70
4160	พงสวาย	เมืองราชบุรี	70000	700119	7001	70
4161	พิกุลทอง	เมืองราชบุรี	70000	700111	7001	70
4162	สามเรือน	เมืองราชบุรี	70000	700110	7001	70
4163	หนองกลางนา	เมืองราชบุรี	70000	700104	7001	70
4164	หน้าเมือง	เมืองราชบุรี	70000	700101	7001	70
4165	หลุมดิน	เมืองราชบุรี	70000	700117	7001	70
4166	หินกอง	เมืองราชบุรี	70000	700114	7001	70
4167	ห้วยไผ่	เมืองราชบุรี	70000	700105	7001	70
4168	อ่างทอง	เมืองราชบุรี	70000	700108	7001	70
4169	เกาะพลับพลา	เมืองราชบุรี	70000	700116	7001	70
4170	เขาแร้ง	เมืองราชบุรี	70000	700115	7001	70
4171	เจดีย์หัก	เมืองราชบุรี	70000	700102	7001	70
4172	โคกหม้อ	เมืองราชบุรี	70000	700109	7001	70
4173	คลองข่อย	โพธาราม	70120	700710	7007	70
4174	คลองตาคต	โพธาราม	70120	700705	7007	70
4175	ชำแระ	โพธาราม	70120	700711	7007	70
4176	ดอนกระเบื้อง	โพธาราม	70120	700507	7007	70
4177	ดอนทราย	โพธาราม	70120	700708	7007	70
4178	ท่าชุมพล	โพธาราม	70120	700713	7007	70
4179	ธรรมเสน	โพธาราม	70120	700717	7007	70
4180	นางแก้ว	โพธาราม	70120	700716	7007	70
4181	บางโตนด	โพธาราม	70120	700714	7007	70
4182	บ้านฆ้อง	โพธาราม	70120	700706	7007	70
4183	บ้านสิงห์	โพธาราม	70120	700707	7007	70
4184	บ้านเลือก	โพธาราม	70120	700704	7007	70
4185	สร้อยฟ้า	โพธาราม	70120	700712	7007	70
4186	หนองกวาง	โพธาราม	70120	700719	7007	70
4187	หนองโพ	โพธาราม	70120	700703	7007	70
4188	เขาชะงุ้ม	โพธาราม	70120	700718	7007	70
4189	เจ็ดเสมียน	โพธาราม	70120	700709	7007	70
4190	เตาปูน	โพธาราม	70120	700715	7007	70
4191	โพธาราม	โพธาราม	70120	700701	7007	70
4192	ดงกลาง	จตุรพักตรพิมาน	45180	450407	false	45
4193	ดงแดง	จตุรพักตรพิมาน	45180	450406	false	45
4194	ดู่น้อย	จตุรพักตรพิมาน	45180	450411	false	45
4195	น้ำใส	จตุรพักตรพิมาน	45180	450405	false	45
4196	ป่าสังข์	จตุรพักตรพิมาน	45180	450408	false	45
4197	ลิ้นฟ้า	จตุรพักตรพิมาน	45180	450410	false	45
4198	ศรีโคตร	จตุรพักตรพิมาน	45180	450412	false	45
4199	หนองผือ	จตุรพักตรพิมาน	45180	450402	false	45
4200	หัวช้าง	จตุรพักตรพิมาน	45180	450401	false	45
4201	อีง่อง	จตุรพักตรพิมาน	45180	450409	false	45
4202	เมืองหงส์	จตุรพักตรพิมาน	45180	450403	false	45
4203	โคกล่าม	จตุรพักตรพิมาน	45180	450404	false	45
4204	จังหาร	จังหาร	45000	450115	4517	45
4205	ดงสิงห์	จังหาร	45000	450111	4517	45
4206	ดินดำ	จังหาร	45000	450116	4517	45
4207	ปาฝา	จังหาร	45000	450107	4517	45
4208	ผักแว่น	จังหาร	45000	451707	4517	45
4209	ม่วงลาด	จังหาร	45000	450113	4517	45
4210	ยางใหญ่	จังหาร	45000	451706	4517	45
4211	แสนชาติ	จังหาร	45000	451708	4517	45
4212	ทุ่งเขาหลวง	ทุ่งเขาหลวง	45170	450523	4520	45
4213	บึงงาม	ทุ่งเขาหลวง	45170	450512	4520	45
4214	มะบ้า	ทุ่งเขาหลวง	45170	450509	4520	45
4215	เทอดไทย	ทุ่งเขาหลวง	45170	450516	4520	45
4216	เหล่า	ทุ่งเขาหลวง	45170	450508	4520	45
4217	ธงธานี	ธวัชบุรี	45170	450502	4505	45
4218	ธวัชบุรี	ธวัชบุรี	45170	450504	4505	45
4219	นิเวศน์	ธวัชบุรี	45170	450501	4505	45
4220	บึงนคร	ธวัชบุรี	45170	450520	4505	45
4221	มะอึ	ธวัชบุรี	45170	450507	4505	45
4222	ราชธานี	ธวัชบุรี	45170	450522	4505	45
4223	หนองพอก	ธวัชบุรี	45170	450524	4505	45
4224	หนองไผ่	ธวัชบุรี	45170	450503	4505	45
4225	อุ่มเม้า	ธวัชบุรี	45170	450506	4505	45
4226	เขวาทุ่ง	ธวัชบุรี	45170	450510	4505	45
4227	เมืองน้อย	ธวัชบุรี	45170	450517	4505	45
4228	ไพศาล	ธวัชบุรี	45170	450515	4505	45
4229	ขี้เหล็ก	ปทุมรัตต์	45190	450308	4503	45
4230	ดอกล้ำ	ปทุมรัตต์	45190	450302	4503	45
4231	บัวแดง	ปทุมรัตต์	45190	450301	4503	45
4232	สระบัว	ปทุมรัตต์	45190	450306	4503	45
4233	หนองแคน	ปทุมรัตต์	45190	450303	4503	45
4234	โนนสง่า	ปทุมรัตต์	45190	450307	4503	45
4235	โนนสวรรค์	ปทุมรัตต์	45190	450305	4503	45
4236	โพนสูง	ปทุมรัตต์	45190	450304	4503	45
4237	กุดน้ำใส	พนมไพร	45140	450603	4506	45
4238	คำไฮ	พนมไพร	45140	450613	4506	45
4239	ค้อใหญ่	พนมไพร	45140	450615	4506	45
4240	ชานุวรรณ	พนมไพร	45140	450617	4506	45
4241	นานวล	พนมไพร	45140	450612	4506	45
4242	พนมไพร	พนมไพร	45140	450601	4506	45
4243	วารีสวัสดิ์	พนมไพร	45140	450606	4506	45
4244	สระแก้ว	พนมไพร	45140	450614	4506	45
4245	หนองทัพไทย	พนมไพร	45140	450604	4506	45
4246	แสนสุข	พนมไพร	45140	450602	4506	45
4247	โคกสว่าง	พนมไพร	45140	450607	4506	45
4248	โพธิ์ชัย	พนมไพร	45140	450611	4506	45
4249	โพธิ์ใหญ่	พนมไพร	45140	450605	4506	45
4250	บ้านบาก	ศรีสมเด็จ	45000	451608	4516	45
4251	ศรีสมเด็จ	ศรีสมเด็จ	45000	450119	4516	45
4252	สวนจิก	ศรีสมเด็จ	45280	450112	4516	45
4253	หนองแวงควง	ศรีสมเด็จ	45000	451607	4516	45
4254	หนองใหญ่	ศรีสมเด็จ	45000	450121	4516	45
4255	เมืองเปลือย	ศรีสมเด็จ	45000	450122	4516	45
4256	โพธิ์ทอง	ศรีสมเด็จ	45000	450114	4516	45
4257	โพธิ์สัย	ศรีสมเด็จ	45280	451606	4516	45
4258	จำปาขัน	สุวรรณภูมิ	45130	451115	4511	45
4259	ช้างเผือก	สุวรรณภูมิ	45130	451112	4511	45
4260	ดอกไม้	สุวรรณภูมิ	45130	451102	4511	45
4261	ทุ่งกุลา	สุวรรณภูมิ	45130	451113	4511	45
4262	ทุ่งศรีเมือง	สุวรรณภูมิ	45130	451114	4511	45
4263	ทุ่งหลวง	สุวรรณภูมิ	45130	451108	4511	45
4264	นาใหญ่	สุวรรณภูมิ	45130	451103	4511	45
4265	น้ำคำ	สุวรรณภูมิ	45130	451110	4511	45
4266	บ่อพันขัน	สุวรรณภูมิ	45130	451107	4511	45
4267	สระคู	สุวรรณภูมิ	45130	451101	4511	45
4268	หัวช้าง	สุวรรณภูมิ	45130	450401	4511	45
4269	หัวโทน	สุวรรณภูมิ	45130	451106	4511	45
4270	หินกอง	สุวรรณภูมิ	45130	451104	4511	45
4271	ห้วยหินลาด	สุวรรณภูมิ	45130	451111	4511	45
4272	เมืองทุ่ง	สุวรรณภูมิ	45130	451105	4511	45
4273	กกโพธิ์	หนองพอก	45210	450904	4509	45
4274	ท่าสีดา	หนองพอก	45210	450909	4509	45
4275	บึงงาม	หนองพอก	45210	450512	4509	45
4276	ผาน้ำย้อย	หนองพอก	45210	450908	4509	45
4277	ภูเขาทอง	หนองพอก	45210	450903	4509	45
4278	รอบเมือง	หนองพอก	45210	450102	4509	45
4279	หนองขุ่นใหญ่	หนองพอก	45210	450906	4509	45
4280	หนองพอก	หนองพอก	45210	450524	4509	45
4281	โคกสว่าง	หนองพอก	45210	450607	4509	45
4282	ดูกอึ่ง	หนองฮี	45140	450610	4519	45
4283	สาวแห	หนองฮี	45140	450616	4519	45
4284	หนองฮี	หนองฮี	45140	450608	4519	45
4285	เด่นราษฎร์	หนองฮี	45140	450609	4519	45
4286	ขี้เหล็ก	อาจสามารถ	45160	450308	4514	45
4287	บ้านดู่	อาจสามารถ	45160	451410	4514	45
4288	บ้านแจ้ง	อาจสามารถ	45160	451403	4514	45
4289	หนองขาม	อาจสามารถ	45160	451406	4514	45
4290	หนองบัว	อาจสามารถ	45160	451408	4514	45
4291	หนองหมื่นถ่าน	อาจสามารถ	45160	451405	4514	45
4292	หน่อม	อาจสามารถ	45160	451404	4514	45
4293	อาจสามารถ	อาจสามารถ	45160	451401	4514	45
4294	โพนเมือง	อาจสามารถ	45160	451402	4514	45
4295	โหรา	อาจสามารถ	45160	451407	4514	45
4296	กำแพง	เกษตรวิสัย	45150	450208	4502	45
4297	กู่กาสิงห์	เกษตรวิสัย	45150	450209	4502	45
4298	ดงครั่งน้อย	เกษตรวิสัย	45150	450213	4502	45
4299	ดงครั่งใหญ่	เกษตรวิสัย	45150	450205	4502	45
4300	ทุ่งทอง	เกษตรวิสัย	45150	450212	4502	45
4301	น้ำอ้อม	เกษตรวิสัย	45150	450210	4502	45
4302	บ้านฝาง	เกษตรวิสัย	45150	450206	4502	45
4303	สิงห์โคก	เกษตรวิสัย	45150	450204	4502	45
4304	หนองแวง	เกษตรวิสัย	45150	450118	4502	45
4305	เกษตรวิสัย	เกษตรวิสัย	45150	450201	4502	45
4306	เมืองบัว	เกษตรวิสัย	45150	450202	4502	45
4307	เหล่าหลวง	เกษตรวิสัย	45150	450203	4502	45
4308	โนนสว่าง	เกษตรวิสัย	45150	450211	4502	45
4309	บ้านเขือง	เชียงขวัญ	45000	450513	4518	45
4310	พระธาตุ	เชียงขวัญ	45000	450511	4518	45
4311	พระเจ้า	เชียงขวัญ	45000	450514	4518	45
4312	พลับพลา	เชียงขวัญ	45170	450521	4518	45
4313	หมูม้น	เชียงขวัญ	45170	450505	4518	45
4314	เชียงขวัญ	เชียงขวัญ	45000	450519	4518	45
4315	ชมสะอาด	เมยวดี	45250	451504	4515	45
4316	ชุมพร	เมยวดี	45250	450794	4515	45
4317	บุ่งเลิศ	เมยวดี	45250	451503	4515	45
4318	เมยวดี	เมยวดี	45250	450795	4515	45
4319	ขอนแก่น	เมืองร้อยเอ็ด	45000	450104	4501	45
4320	ดงลาน	เมืองร้อยเอ็ด	45000	450120	4501	45
4321	นาโพธิ์	เมืองร้อยเอ็ด	45000	450105	4501	45
4322	ปอภาร	เมืองร้อยเอ็ด	45000	false	4501	45
4323	รอบเมือง	เมืองร้อยเอ็ด	45000	450102	4501	45
4324	สะอาดสมบูรณ์	เมืองร้อยเอ็ด	45000	450106	4501	45
4325	สีแก้ว	เมืองร้อยเอ็ด	45000	450108	4501	45
4326	หนองแก้ว	เมืองร้อยเอ็ด	45000	450117	4501	45
4327	หนองแวง	เมืองร้อยเอ็ด	45000	450118	4501	45
4328	เมืองทอง	เมืองร้อยเอ็ด	45000	450125	4501	45
4329	เหนือเมือง	เมืองร้อยเอ็ด	45000	450103	4501	45
4330	แคนใหญ่	เมืองร้อยเอ็ด	45000	450123	4501	45
4331	โนนตาล	เมืองร้อยเอ็ด	45000	450124	4501	45
4332	โนนรัง	เมืองร้อยเอ็ด	45000	450110	4501	45
4333	ในเมือง	เมืองร้อยเอ็ด	45000	450101	4501	45
4334	กกกุง	เมืองสรวง	45220	451204	4512	45
4335	คูเมือง	เมืองสรวง	45220	451203	4512	45
4336	หนองผือ	เมืองสรวง	45220	450402	4512	45
4337	หนองหิน	เมืองสรวง	45220	451202	4512	45
4338	เมืองสรวง	เมืองสรวง	45220	451205	4512	45
4339	กลาง	เสลภูมิ	45120	451001	4510	45
4340	ขวัญเมือง	เสลภูมิ	45120	451017	4510	45
4341	ขวาว	เสลภูมิ	45120	451008	4510	45
4342	ท่าม่วง	เสลภูมิ	45120	451007	4510	45
4343	นางาม	เสลภูมิ	45120	451002	4510	45
4344	นาเมือง	เสลภูมิ	45120	451005	4510	45
4345	นาเลิง	เสลภูมิ	45120	451012	4510	45
4346	นาแซง	เสลภูมิ	45120	451004	4510	45
4347	บึงเกลือ	เสลภูมิ	45120	451018	4510	45
4348	พรสวรรค์	เสลภูมิ	45120	451016	4510	45
4349	ภูเงิน	เสลภูมิ	45120	451010	4510	45
4350	วังหลวง	เสลภูมิ	45120	451006	4510	45
4351	ศรีวิลัย	เสลภูมิ	45120	451014	4510	45
4352	หนองหลวง	เสลภูมิ	45120	451015	4510	45
4353	เกาะแก้ว	เสลภูมิ	45120	451011	4510	45
4354	เมืองไพร	เสลภูมิ	45120	451003	4510	45
4355	เหล่าน้อย	เสลภูมิ	45120	451013	4510	45
4356	โพธิ์ทอง	เสลภูมิ	45120	450114	4510	45
4357	ขามเปี้ย	โพธิ์ชัย	45230	450801	4508	45
4358	คำพอุง	โพธิ์ชัย	45230	450806	4508	45
4359	ดอนโอง	โพธิ์ชัย	45230	450808	4508	45
4360	บัวคำ	โพธิ์ชัย	45230	450803	4508	45
4361	สะอาด	โพธิ์ชัย	45230	450805	4508	45
4362	หนองตาไก้	โพธิ์ชัย	45230	450807	4508	45
4363	อัคคะคำ	โพธิ์ชัย	45230	450797	4508	45
4364	เชียงใหม่	โพธิ์ชัย	45230	450798	4508	45
4365	โพธิ์ศรี	โพธิ์ชัย	45230	450809	4508	45
4366	ท่าหาดยาว	โพนทราย	45240	451305	4513	45
4367	ยางคำ	โพนทราย	45240	451304	4513	45
4368	ศรีสว่าง	โพนทราย	45240	451303	4513	45
4369	สามขา	โพนทราย	45240	451302	4513	45
4370	โพนทราย	โพนทราย	45240	451301	4513	45
4371	คำนาดี	โพนทอง	45110	450710	4507	45
4372	นาอุดม	โพนทอง	45110	450703	4507	45
4373	พรมสวรรค์	โพนทอง	45110	450711	4507	45
4374	วังสามัคคี	โพนทอง	45110	450713	4507	45
4375	สระนกแก้ว	โพนทอง	45110	450712	4507	45
4376	สว่าง	โพนทอง	45110	450704	4507	45
4377	หนองใหญ่	โพนทอง	45110	450121	4507	45
4378	อุ่มเม่า	โพนทอง	45110	450709	4507	45
4379	แวง	โพนทอง	45110	450701	4507	45
4380	โคกกกม่วง	โพนทอง	45110	450702	4507	45
4381	โคกสูง	โพนทอง	45110	450714	4507	45
4382	โนนชัยศรี	โพนทอง	45110	450707	4507	45
4383	โพธิ์ทอง	โพนทอง	45110	450114	4507	45
4384	โพธิ์ศรีสว่าง	โพนทอง	45110	450708	4507	45
4385	ชัยนารายณ์	ชัยบาดาล	15130	160402	1604	16
4386	ชัยบาดาล	ชัยบาดาล	15230	160418	1604	16
4387	ซับตะเคียน	ชัยบาดาล	15130	160409	1604	16
4388	ท่าดินดำ	ชัยบาดาล	15130	160407	1604	16
4389	ท่ามะนาว	ชัยบาดาล	15130	160414	1604	16
4390	นาโสม	ชัยบาดาล	15190	160410	1604	16
4391	นิคมลำนารายณ์	ชัยบาดาล	15130	160417	1604	16
4392	บัวชุม	ชัยบาดาล	15130	160406	1604	16
4393	บ้านใหม่สามัคคี	ชัยบาดาล	15130	160419	1604	16
4394	มะกอกหวาน	ชัยบาดาล	15230	160408	1604	16
4395	ม่วงค่อม	ชัยบาดาล	15230	160405	1604	16
4396	ลำนารายณ์	ชัยบาดาล	15130	160401	1604	16
4397	ศิลาทิพย์	ชัยบาดาล	15130	160403	1604	16
4398	หนองยายโต๊ะ	ชัยบาดาล	15130	160411	1604	16
4399	ห้วยหิน	ชัยบาดาล	15130	160404	1604	16
4400	เกาะรัง	ชัยบาดาล	15130	160412	1604	16
4401	เขาแหลม	ชัยบาดาล	15130	160422	1604	16
4402	ท่าวุ้ง	ท่าวุ้ง	15150	160501	1605	16
4403	บางคู้	ท่าวุ้ง	15150	160502	1605	16
4404	บางงา	ท่าวุ้ง	15150	160505	1605	16
4405	บางลี่	ท่าวุ้ง	15150	160504	1605	16
4406	บ้านเบิก	ท่าวุ้ง	15150	160510	1605	16
4407	มุจลินท์	ท่าวุ้ง	15150	160511	1605	16
4408	ลาดสาลี่	ท่าวุ้ง	15150	160509	1605	16
4409	หัวสำโรง	ท่าวุ้ง	15150	160508	1605	16
4410	เขาสมอคอน	ท่าวุ้ง	15180	160507	1605	16
4411	โคกสลุด	ท่าวุ้ง	15150	160506	1605	16
4412	โพตลาดแก้ว	ท่าวุ้ง	15150	160503	1605	16
4413	ซับจำปา	ท่าหลวง	15230	160497	1607	16
4414	ทะเลวังวัด	ท่าหลวง	15230	160705	1607	16
4415	ท่าหลวง	ท่าหลวง	15230	160499	1607	16
4416	หนองผักแว่น	ท่าหลวง	15230	160496	1607	16
4417	หัวลำ	ท่าหลวง	15230	160706	1607	16
4418	แก่งผักกูด	ท่าหลวง	15230	160498	1607	16
4419	ชอนม่วง	บ้านหมี่	15110	160615	1606	16
4420	ดงพลับ	บ้านหมี่	15110	160604	1606	16
4421	ดอนดึง	บ้านหมี่	15110	160614	1606	16
4422	บางกะพี้	บ้านหมี่	15110	160610	1606	16
4423	บางขาม	บ้านหมี่	15180	160613	1606	16
4424	บางพึ่ง	บ้านหมี่	15110	160608	1606	16
4425	บ้านกล้วย	บ้านหมี่	15110	160603	1606	16
4426	บ้านชี	บ้านหมี่	15180	160605	1606	16
4427	บ้านทราย	บ้านหมี่	15110	160602	1606	16
4428	บ้านหมี่	บ้านหมี่	15110	160619	1606	16
4429	พุคา	บ้านหมี่	15110	160606	1606	16
4430	มหาสอน	บ้านหมี่	15110	160618	1606	16
4431	สนามแจง	บ้านหมี่	15110	160622	1606	16
4432	สายห้วยแก้ว	บ้านหมี่	15110	160617	1606	16
4433	หนองกระเบียน	บ้านหมี่	15110	160616	1606	16
4434	หนองทรายขาว	บ้านหมี่	15110	160609	1606	16
4435	หนองเต่า	บ้านหมี่	15110	160611	1606	16
4436	หนองเมือง	บ้านหมี่	15110	160621	1606	16
4437	หินปัก	บ้านหมี่	15110	160607	1606	16
4438	เชียงงา	บ้านหมี่	15110	160620	1606	16
4439	โพนทอง	บ้านหมี่	15110	160612	1606	16
4440	ไผ่ใหญ่	บ้านหมี่	15110	160601	1606	16
4441	ชอนน้อย	พัฒนานิคม	15140	160206	1602	16
4442	ช่องสาริกา	พัฒนานิคม	15220	160202	1602	16
4443	ดีลัง	พัฒนานิคม	15220	160204	1602	16
4444	น้ำสุด	พัฒนานิคม	15140	160209	1602	16
4445	พัฒนานิคม	พัฒนานิคม	15140	160201	1602	16
4446	มะนาวหวาน	พัฒนานิคม	15140	160203	1602	16
4447	หนองบัว	พัฒนานิคม	15140	160207	1602	16
4448	ห้วยขุนราม	พัฒนานิคม	18220	160208	1602	16
4449	โคกสลุง	พัฒนานิคม	15140	160205	1602	16
4450	กุดตาเพชร	ลำสนธิ	15190	160415	1610	16
4451	ซับสมบูรณ์	ลำสนธิ	15190	160420	1610	16
4452	ลำสนธิ	ลำสนธิ	15190	160416	1610	16
4453	หนองรี	ลำสนธิ	15190	160413	1610	16
4454	เขาน้อย	ลำสนธิ	15130	161006	1610	16
4455	เขารวก	ลำสนธิ	15190	160421	1610	16
4456	ทุ่งท่าช้าง	สระโบสถ์	15240	160397	1608	16
4457	นิยมชัย	สระโบสถ์	15240	160805	1608	16
4458	มหาโพธิ	สระโบสถ์	15240	160802	1608	16
4459	สระโบสถ์	สระโบสถ์	15240	160399	1608	16
4460	ห้วยใหญ่	สระโบสถ์	15240	160804	1608	16
4461	ชอนสมบูรณ์	หนองม่วง	15170	160315	1611	16
4462	ชอนสารเดช	หนองม่วง	15170	160311	1611	16
4463	ดงดินแดง	หนองม่วง	15170	160319	1611	16
4464	บ่อทอง	หนองม่วง	15170	160313	1611	16
4465	ยางโทน	หนองม่วง	15170	160314	1611	16
4466	หนองม่วง	หนองม่วง	15170	160312	1611	16
4467	กกโก	เมืองลพบุรี	15000	160103	1601	16
4468	งิ้วราย	เมืองลพบุรี	15000	160110	1601	16
4469	ดอนโพธิ์	เมืองลพบุรี	15000	160111	1601	16
4470	ตะลุง	เมืองลพบุรี	15000	160112	1601	16
4471	ถนนใหญ่	เมืองลพบุรี	15000	160125	1601	16
4472	ทะเลชุบศร	เมืองลพบุรี	15000	160101	1601	16
4473	ท่าศาลา	เมืองลพบุรี	15000	160115	1601	16
4474	ท่าหิน	เมืองลพบุรี	15000	160102	1601	16
4475	ท่าแค	เมืองลพบุรี	15000	160114	1601	16
4476	ท้ายตลาด	เมืองลพบุรี	15000	160119	1601	16
4477	นิคมสร้างตนเอง	เมืองลพบุรี	15000	160116	1601	16
4478	บางขันหมาก	เมืองลพบุรี	15000	160117	1601	16
4479	บ้านข่อย	เมืองลพบุรี	15000	160118	1601	16
4480	ป่าตาล	เมืองลพบุรี	15000	160120	1601	16
4481	พรหมมาสตร์	เมืองลพบุรี	15000	160121	1601	16
4482	สี่คลอง	เมืองลพบุรี	15000	160124	1601	16
4483	เขาพระงาม	เมืองลพบุรี	15160	160105	1601	16
4484	เขาสามยอด	เมืองลพบุรี	15000	160106	1601	16
4485	โก่งธนู	เมืองลพบุรี	13240	160104	1601	16
4486	โคกกะเทียม	เมืองลพบุรี	15160	160107	1601	16
4487	โคกตูม	เมืองลพบุรี	15210	160109	1601	16
4488	โคกลำพาน	เมืองลพบุรี	15000	160108	1601	16
4489	โพธิ์ตรุ	เมืองลพบุรี	15000	160123	1601	16
4490	โพธิ์เก้าต้น	เมืองลพบุรี	15000	160122	1601	16
4491	คลองเกตุ	โคกสำโรง	15120	160306	1603	16
4492	ดงมะรุม	โคกสำโรง	15120	160310	1603	16
4493	ถลุงเหล็ก	โคกสำโรง	15120	160303	1603	16
4494	วังขอนขว้าง	โคกสำโรง	15120	160318	1603	16
4495	วังจั่น	โคกสำโรง	15120	160320	1603	16
4496	วังเพลิง	โคกสำโรง	15120	160309	1603	16
4497	สะแกราบ	โคกสำโรง	15120	160307	1603	16
4498	หนองแขม	โคกสำโรง	15120	160322	1603	16
4499	หลุมข้าว	โคกสำโรง	15120	160304	1603	16
4500	ห้วยโป่ง	โคกสำโรง	15120	160305	1603	16
4501	เกาะแก้ว	โคกสำโรง	15120	160302	1603	16
4502	เพนียด	โคกสำโรง	15120	160308	1603	16
4503	โคกสำโรง	โคกสำโรง	15120	160301	1603	16
4504	ยางราก	โคกเจริญ	15250	160317	1609	16
4505	วังทอง	โคกเจริญ	15250	160323	1609	16
4506	หนองมะค่า	โคกเจริญ	15250	160321	1609	16
4507	โคกเจริญ	โคกเจริญ	15250	160316	1609	16
4508	โคกแสมสาร	โคกเจริญ	15250	160905	1609	16
4509	นาแก	งาว	52110	520506	5205	52
4510	บ้านร้อง	งาว	52110	520504	5205	52
4511	บ้านหวด	งาว	52110	520509	5205	52
4512	บ้านอ้อน	งาว	52110	520507	5205	52
4513	บ้านแหง	งาว	52110	520508	5205	52
4514	บ้านโป่ง	งาว	52110	520503	5205	52
4515	ปงเตา	งาว	52110	520505	5205	52
4516	หลวงเหนือ	งาว	52110	520501	5205	52
4517	หลวงใต้	งาว	52110	520502	5205	52
4518	แม่ตีบ	งาว	52110	520510	5205	52
4519	ทุ่งฮั้ว	วังเหนือ	52140	520701	5207	52
4520	ร่องเคาะ	วังเหนือ	52140	520704	5207	52
4521	วังซ้าย	วังเหนือ	52140	520706	5207	52
4522	วังทรายคำ	วังเหนือ	52140	520708	5207	52
4523	วังทอง	วังเหนือ	52140	520705	5207	52
4524	วังเหนือ	วังเหนือ	52140	520702	5207	52
4525	วังแก้ว	วังเหนือ	52140	520707	5207	52
4526	วังใต้	วังเหนือ	52140	520703	5207	52
4527	นายาง	สบปราบ	52170	521104	5211	52
4528	สบปราบ	สบปราบ	52170	521101	5211	52
4529	สมัย	สบปราบ	52170	521102	5211	52
4530	แม่กัวะ	สบปราบ	52170	521103	5211	52
4531	ปงยางคก	ห้างฉัตร	52190	521204	5212	52
4532	วอแก้ว	ห้างฉัตร	52190	521207	5212	52
4533	หนองหล่ม	ห้างฉัตร	52190	521202	5212	52
4534	ห้างฉัตร	ห้างฉัตร	52190	521201	5212	52
4535	เมืองยาว	ห้างฉัตร	52190	521203	5212	52
4536	เวียงตาล	ห้างฉัตร	52190	521205	5212	52
4537	แม่สัน	ห้างฉัตร	52190	521206	5212	52
4538	ท่าผา	เกาะคา	52130	520308	5203	52
4539	นาแก้ว	เกาะคา	52130	520302	5203	52
4540	นาแส่ง	เกาะคา	52130	520307	5203	52
4541	ลำปางหลวง	เกาะคา	52130	520301	5203	52
4542	วังพร้าว	เกาะคา	52130	520304	5203	52
4543	ศาลา	เกาะคา	52130	520305	5203	52
4544	เกาะคา	เกาะคา	52130	520306	5203	52
4545	ใหม่พัฒนา	เกาะคา	52130	520309	5203	52
4546	ไหล่หิน	เกาะคา	52130	520303	5203	52
4547	นาโป่ง	เถิน	52160	520806	5208	52
4548	ล้อมแรด	เถิน	52160	520801	5208	52
4549	เถินบุรี	เถิน	52160	520808	5208	52
4550	เวียงมอก	เถิน	52160	520805	5208	52
4551	แม่ถอด	เถิน	52160	520807	5208	52
4552	แม่ปะ	เถิน	52160	520803	5208	52
4553	แม่มอก	เถิน	52160	520804	5208	52
4554	แม่วะ	เถิน	52230	520802	5208	52
4555	ทุ่งกว๋าว	เมืองปาน	52240	520697	5213	52
4556	บ้านขอ	เมืองปาน	52240	520698	5213	52
4557	หัวเมือง	เมืองปาน	52240	521305	5213	52
4558	เมืองปาน	เมืองปาน	52240	520699	5213	52
4559	แจ้ซ้อน	เมืองปาน	52240	520696	5213	52
4560	กล้วยแพะ	เมืองลำปาง	52000	520107	5201	52
4561	ชมพู	เมืองลำปาง	52100	520106	5201	52
4562	ต้นธงชัย	เมืองลำปาง	52000	520117	5201	52
4563	ทุ่งฝาย	เมืองลำปาง	52000	520112	5201	52
4564	นิคมพัฒนา	เมืองลำปาง	52000	520118	5201	52
4565	บุญนาคพัฒนา	เมืองลำปาง	52000	520119	5201	52
4566	บ่อแฮ้ว	เมืองลำปาง	52100	520116	5201	52
4567	บ้านค่า	เมืองลำปาง	52100	520115	5201	52
4568	บ้านเป้า	เมืองลำปาง	52100	520114	5201	52
4569	บ้านเสด็จ	เมืองลำปาง	52000	520110	5201	52
4570	บ้านเอื้อม	เมืองลำปาง	52100	520113	5201	52
4571	บ้านแลง	เมืองลำปาง	52000	520109	5201	52
4572	ปงแสนทอง	เมืองลำปาง	52100	520108	5201	52
4573	พระบาท	เมืองลำปาง	52000	520105	5201	52
4574	พิชัย	เมืองลำปาง	52000	520111	5201	52
4575	สบตุ๋ย	เมืองลำปาง	52100	520104	5201	52
4576	สวนดอก	เมืองลำปาง	52100	520103	5201	52
4577	หัวเวียง	เมืองลำปาง	52000	520102	5201	52
4578	เวียงเหนือ	เมืองลำปาง	52000	520101	5201	52
4579	ทุ่งงาม	เสริมงาม	52210	520401	5204	52
4580	เสริมกลาง	เสริมงาม	52210	520404	5204	52
4581	เสริมขวา	เสริมงาม	52210	520402	5204	52
4582	เสริมซ้าย	เสริมงาม	52210	520403	5204	52
4583	ทุ่งผึ้ง	แจ้ห่ม	52120	520606	5206	52
4584	บ้านสา	แจ้ห่ม	52120	520602	5206	52
4585	ปงดอน	แจ้ห่ม	52120	520603	5206	52
4586	วิเชตนคร	แจ้ห่ม	52120	520607	5206	52
4587	เมืองมาย	แจ้ห่ม	52120	520605	5206	52
4588	แจ้ห่ม	แจ้ห่ม	52120	520601	5206	52
4589	แม่สุก	แจ้ห่ม	52120	520604	5206	52
4590	ดอนไฟ	แม่ทะ	52150	521007	5210	52
4591	นาครัว	แม่ทะ	52150	521002	5210	52
4592	น้ำโจ้	แม่ทะ	52150	521006	5210	52
4593	บ้านกิ่ว	แม่ทะ	52150	521004	5210	52
4594	บ้านบอม	แม่ทะ	52150	521005	5210	52
4595	ป่าตัน	แม่ทะ	52150	521003	5210	52
4596	วังเงิน	แม่ทะ	52150	521010	5210	52
4597	สันดอนแก้ว	แม่ทะ	52150	521011	5210	52
4598	หัวเสือ	แม่ทะ	52150	521008	5210	52
4599	แม่ทะ	แม่ทะ	52150	521001	5210	52
4600	ผาปัง	แม่พริก	52180	520902	5209	52
4601	พระบาทวังตวง	แม่พริก	52230	520904	5209	52
4602	แม่ปุ	แม่พริก	52180	520903	5209	52
4603	แม่พริก	แม่พริก	52180	520901	5209	52
4604	จางเหนือ	แม่เมาะ	52220	520203	5202	52
4605	นาสัก	แม่เมาะ	52220	520198	5202	52
4606	บ้านดง	แม่เมาะ	52220	520199	5202	52
4607	สบป้าด	แม่เมาะ	52220	520205	5202	52
4608	แม่เมาะ	แม่เมาะ	52220	520204	5202	52
4609	ตะเคียนปม	ทุ่งหัวช้าง	51160	510503	5105	51
4610	ทุ่งหัวช้าง	ทุ่งหัวช้าง	51160	510499	5105	51
4611	บ้านปวง	ทุ่งหัวช้าง	51160	510498	5105	51
4612	บ้านธิ	บ้านธิ	51180	510114	5107	51
4613	ห้วยยาบ	บ้านธิ	51180	510115	5107	51
4614	บ้านโฮ่ง	บ้านโฮ่ง	51130	510301	5103	51
4615	ป่าพลู	บ้านโฮ่ง	51130	510302	5103	51
4616	ศรีเตี้ย	บ้านโฮ่ง	51130	510304	5103	51
4617	หนองปลาสะวาย	บ้านโฮ่ง	51130	510305	5103	51
4618	เหล่ายาว	บ้านโฮ่ง	51130	510303	5103	51
4619	ท่าตุ้ม	ป่าซาง	51120	510607	5106	51
4620	นครเจดีย์	ป่าซาง	51120	510611	5106	51
4621	น้ำดิบ	ป่าซาง	51120	510608	5106	51
4622	บ้านเรือน	ป่าซาง	51120	510605	5106	51
4623	ปากบ่อง	ป่าซาง	51120	510601	5106	51
4624	ป่าซาง	ป่าซาง	51120	510602	5106	51
4625	มะกอก	ป่าซาง	51120	510606	5106	51
4626	ม่วงน้อย	ป่าซาง	51120	510604	5106	51
4627	แม่แรง	ป่าซาง	51120	510603	5106	51
4628	ก้อ	ลี้	51110	510405	5104	51
4629	ดงดำ	ลี้	51110	510404	5104	51
4630	นาทราย	ลี้	51110	510403	5104	51
4631	ป่าไผ่	ลี้	51110	510408	5104	51
4632	ลี้	ลี้	51110	510401	5104	51
4633	ศรีวิชัย	ลี้	51110	510409	5104	51
4634	แม่ตืน	ลี้	51110	510402	5104	51
4635	แม่ลาน	ลี้	51110	510406	5104	51
4636	ต้นธง	เมืองลำพูน	51000	510107	5101	51
4637	บ้านกลาง	เมืองลำพูน	51000	510112	5101	51
4638	บ้านแป้น	เมืองลำพูน	51000	510108	5101	51
4639	ประตูป่า	เมืองลำพูน	51000	510105	5101	51
4640	ป่าสัก	เมืองลำพูน	51000	510110	5101	51
4641	มะเขือแจ้	เมืองลำพูน	51000	510113	5101	51
4642	ริมปิง	เมืองลำพูน	51000	510106	5101	51
4643	ศรีบัวบาน	เมืองลำพูน	51000	510116	5101	51
4644	หนองช้างคืน	เมืองลำพูน	51150	510104	5101	51
4645	หนองหนาม	เมืองลำพูน	51000	510117	5101	51
4646	อุโมงค์	เมืองลำพูน	51150	510103	5101	51
4647	เวียงยอง	เมืองลำพูน	51000	510111	5101	51
4648	เหมืองง่า	เมืองลำพูน	51000	510102	5101	51
4649	เหมืองจี้	เมืองลำพูน	51000	510109	5101	51
4650	ในเมือง	เมืองลำพูน	51000	510101	5101	51
4651	วังผาง	เวียงหนองล่อง	51120	510609	5108	51
4652	หนองยวง	เวียงหนองล่อง	51120	510612	5108	51
4653	หนองล่อง	เวียงหนองล่อง	51120	510610	5108	51
4654	ทากาศ	แม่ทา	51170	510203	5102	51
4655	ทาขุมเงิน	แม่ทา	51170	510204	5102	51
4656	ทาทุ่งหลวง	แม่ทา	51170	510205	5102	51
4657	ทาปลาดุก	แม่ทา	51140	510201	5102	51
4658	ทาสบเส้า	แม่ทา	51140	510202	5102	51
4659	ทาแม่ลอบ	แม่ทา	51170	510206	5102	51
4660	กระแชง	กันทรลักษ์	33110	330414	3304	33
4661	กุดเสลา	กันทรลักษ์	33110	330402	3304	33
4662	ขนุน	กันทรลักษ์	33110	330420	3304	33
4663	จานใหญ่	กันทรลักษ์	33110	330411	3304	33
4664	ชำ	กันทรลักษ์	33110	330413	3304	33
4665	ตระกาจ	กันทรลักษ์	33110	330409	3304	33
4666	ทุ่งใหญ่	กันทรลักษ์	33110	330424	3304	33
4667	น้ำอ้อม	กันทรลักษ์	33110	330406	3304	33
4668	บึงมะลู	กันทรลักษ์	33110	330401	3304	33
4669	ภูผาหมอก	กันทรลักษ์	33110	330425	3304	33
4670	ภูเงิน	กันทรลักษ์	33110	330412	3304	33
4671	รุง	กันทรลักษ์	33110	330408	3304	33
4672	ละลาย	กันทรลักษ์	33110	330407	3304	33
4673	สวนกล้วย	กันทรลักษ์	33110	330421	3304	33
4674	สังเม็ก	กันทรลักษ์	33110	330405	3304	33
4675	หนองหญ้าลาด	กันทรลักษ์	33110	330416	3304	33
4676	เมือง	กันทรลักษ์	33110	330403	3304	33
4677	เวียงเหนือ	กันทรลักษ์	33110	330423	3304	33
4678	เสาธงชัย	กันทรลักษ์	33110	330419	3304	33
4679	โนนสำราญ	กันทรลักษ์	33110	330415	3304	33
4680	คำเนียม	กันทรารมย์	33130	330320	3303	33
4681	จาน	กันทรารมย์	33130	330105	3303	33
4682	ดูน	กันทรารมย์	33130	330301	3303	33
4683	ดู่	กันทรารมย์	33130	330313	3303	33
4684	ทาม	กันทรารมย์	33130	330307	3303	33
4685	บัวน้อย	กันทรารมย์	33130	330311	3303	33
4686	ผักแพว	กันทรารมย์	33130	330314	3303	33
4687	ยาง	กันทรารมย์	33130	330304	3303	33
4688	ละทาย	กันทรารมย์	33130	330308	3303	33
4689	หนองบัว	กันทรารมย์	33130	330312	3303	33
4690	หนองหัวช้าง	กันทรารมย์	33130	330303	3303	33
4691	หนองแก้ว	กันทรารมย์	33130	330121	3303	33
4692	หนองแวง	กันทรารมย์	33130	330305	3303	33
4693	อีปาด	กันทรารมย์	33130	330310	3303	33
4694	เมืองน้อย	กันทรารมย์	33130	330309	3303	33
4695	โนนสัง	กันทรารมย์	33130	330302	3303	33
4696	กฤษณา	ขุขันธ์	33140	330524	3305	33
4697	กันทรารมย์	ขุขันธ์	33140	330501	3305	33
4698	จะกง	ขุขันธ์	33140	330502	3305	33
4699	ดองกำเม็ด	ขุขันธ์	33140	330504	3305	33
4700	ตะเคียน	ขุขันธ์	33140	330513	3305	33
4701	ตาอุด	ขุขันธ์	33140	330508	3305	33
4702	นิคมพัฒนา	ขุขันธ์	33140	330515	3305	33
4703	ปราสาท	ขุขันธ์	33140	330518	3305	33
4704	ปรือใหญ่	ขุขันธ์	33140	330506	3305	33
4705	ลมศักดิ์	ขุขันธ์	33140	330525	3305	33
4706	ศรีตระกูล	ขุขันธ์	33140	330527	3305	33
4707	ศรีสะอาด	ขุขันธ์	33140	330528	3305	33
4708	สะเดาใหญ่	ขุขันธ์	33140	330507	3305	33
4709	สำโรงตาเจ็น	ขุขันธ์	33140	330521	3305	33
4710	หนองฉลอง	ขุขันธ์	33140	330526	3305	33
4711	หัวเสือ	ขุขันธ์	33140	330511	3305	33
4712	ห้วยสำราญ	ขุขันธ์	33140	330522	3305	33
4713	ห้วยเหนือ	ขุขันธ์	33140	330509	3305	33
4714	ห้วยใต้	ขุขันธ์	33140	330510	3305	33
4715	โคกเพชร	ขุขันธ์	33140	330517	3305	33
4716	โสน	ขุขันธ์	33140	330505	3305	33
4717	ใจดี	ขุขันธ์	33140	330503	3305	33
4718	กระหวัน	ขุนหาญ	33150	330806	3308	33
4719	กันทรอม	ขุนหาญ	33150	330809	3308	33
4720	ขุนหาญ	ขุนหาญ	33150	330807	3308	33
4721	บักดอง	ขุนหาญ	33150	330802	3308	33
4722	พราน	ขุนหาญ	33150	330803	3308	33
4723	ภูฝ้าย	ขุนหาญ	33150	330810	3308	33
4724	สิ	ขุนหาญ	33150	330801	3308	33
4725	ห้วยจันทร์	ขุนหาญ	33150	330812	3308	33
4726	โนนสูง	ขุนหาญ	33150	330808	3308	33
4727	โพธิ์กระสังข์	ขุนหาญ	33150	330811	3308	33
4728	โพธิ์วงศ์	ขุนหาญ	33150	330804	3308	33
4729	ไพร	ขุนหาญ	33150	330805	3308	33
4730	คูบ	น้ำเกลี้ยง	33130	331506	3315	33
4731	ตองปิด	น้ำเกลี้ยง	33130	330394	3315	33
4732	น้ำเกลี้ยง	น้ำเกลี้ยง	33130	330318	3315	33
4733	รุ่งระวี	น้ำเกลี้ยง	33130	331505	3315	33
4734	ละเอาะ	น้ำเกลี้ยง	33130	330317	3315	33
4735	เขิน	น้ำเกลี้ยง	33130	330319	3315	33
4736	บึงบูรพ์	บึงบูรพ์	33220	331102	3311	33
4737	เป๊าะ	บึงบูรพ์	33220	331099	3311	33
4738	กู่	ปรางค์กู่	33170	330702	3307	33
4739	ดู่	ปรางค์กู่	33170	330313	3307	33
4740	ตูม	ปรางค์กู่	33170	330499	3307	33
4741	พิมาย	ปรางค์กู่	33170	330701	3307	33
4742	พิมายเหนือ	ปรางค์กู่	33170	330710	3307	33
4743	สมอ	ปรางค์กู่	33170	330705	3307	33
4744	สวาย	ปรางค์กู่	33170	330709	3307	33
4745	สำโรงปราสาท	ปรางค์กู่	33170	330707	3307	33
4746	หนองเชียงทูน	ปรางค์กู่	33170	330703	3307	33
4747	โพธิ์ศรี	ปรางค์กู่	33170	330706	3307	33
4748	ตำแย	พยุห์	33230	330114	3320	33
4749	พยุห์	พยุห์	33230	330110	3320	33
4750	พรหมสวัสดิ์	พยุห์	33230	330109	3320	33
4751	หนองค้า	พยุห์	33230	330128	3320	33
4752	โนนเพ็ก	พยุห์	33230	330108	3320	33
4753	ดงรัก	ภูสิงห์	33140	330523	3317	33
4754	ตะเคียนราม	ภูสิงห์	33140	330519	3317	33
4755	ละลม	ภูสิงห์	33140	330512	3317	33
4756	ห้วยตามอญ	ภูสิงห์	33140	330516	3317	33
4757	ห้วยตึ๊กชู	ภูสิงห์	33140	331703	3317	33
4758	โคกตาล	ภูสิงห์	33140	330514	3317	33
4759	ไพรพัฒนา	ภูสิงห์	33140	331707	3317	33
4760	กุดเมืองฮาม	ยางชุมน้อย	33190	330205	3302	33
4761	คอนกาม	ยางชุมน้อย	33190	330199	3302	33
4762	บึงบอน	ยางชุมน้อย	33190	330206	3302	33
4763	ยางชุมน้อย	ยางชุมน้อย	33190	330201	3302	33
4764	ยางชุมใหญ่	ยางชุมน้อย	33190	330207	3302	33
4765	ลิ้นฟ้า	ยางชุมน้อย	33190	330202	3302	33
4766	โนนคูณ	ยางชุมน้อย	33190	330204	3302	33
4767	จิกสังข์ทอง	ราษีไศล	33160	330906	3309	33
4768	ดู่	ราษีไศล	33160	330313	3309	33
4769	ด่าน	ราษีไศล	33160	330907	3309	33
4770	บัวหุ่ง	ราษีไศล	33160	330910	3309	33
4771	สร้างปี่	ราษีไศล	33160	330915	3309	33
4772	ส้มป่อย	ราษีไศล	33160	330912	3309	33
4773	หนองหมี	ราษีไศล	33160	330913	3309	33
4774	หนองอึ่ง	ราษีไศล	33160	330909	3309	33
4775	หนองแค	ราษีไศล	33160	330903	3309	33
4776	หว้านคำ	ราษีไศล	33160	330914	3309	33
4777	เมืองคง	ราษีไศล	33160	330901	3309	33
4778	เมืองแคน	ราษีไศล	33160	330902	3309	33
4779	ไผ่	ราษีไศล	33160	330911	3309	33
4780	ดวนใหญ่	วังหิน	33270	330120	3316	33
4781	ทุ่งสว่าง	วังหิน	33270	331606	3316	33
4782	ธาตุ	วังหิน	33270	330113	3316	33
4783	บุสูง	วังหิน	33270	330117	3316	33
4784	บ่อแก้ว	วังหิน	33270	330125	3316	33
4785	วังหิน	วังหิน	33270	331607	3316	33
4786	ศรีสำราญ	วังหิน	33270	330126	3316	33
4787	โพนยาง	วังหิน	33270	331608	3316	33
4788	ตูม	ศรีรัตนะ	33240	330499	3314	33
4789	พิงพวย	ศรีรัตนะ	33240	330497	3314	33
4790	ศรีแก้ว	ศรีรัตนะ	33240	330498	3314	33
4791	ศรีโนนงาม	ศรีรัตนะ	33240	331406	3314	33
4792	สระเยาว์	ศรีรัตนะ	33240	330496	3314	33
4793	สะพุง	ศรีรัตนะ	33240	331407	3314	33
4794	เสื่องข้าว	ศรีรัตนะ	33240	331405	3314	33
4795	กุง	ศิลาลาด	33160	330904	3322	33
4796	คลีกลิ้ง	ศิลาลาด	33160	330905	3322	33
4797	หนองบัวดง	ศิลาลาด	33160	330917	3322	33
4798	โจดม่วง	ศิลาลาด	33160	330916	3322	33
4799	กล้วยกว้าง	ห้วยทับทัน	33210	331097	3312	33
4800	จานแสนไชย	ห้วยทับทัน	33210	331205	3312	33
4801	ปราสาท	ห้วยทับทัน	33210	330518	3312	33
4802	ผักไหม	ห้วยทับทัน	33210	331096	3312	33
4803	ห้วยทับทัน	ห้วยทับทัน	33210	331098	3312	33
4804	เมืองหลวง	ห้วยทับทัน	33210	331202	3312	33
4805	กำแพง	อุทุมพรพิสัย	33120	331001	3310	33
4806	ก้านเหลือง	อุทุมพรพิสัย	33120	331003	3310	33
4807	ขะยูง	อุทุมพรพิสัย	33120	331008	3310	33
4808	ตาเกษ	อุทุมพรพิสัย	33120	331010	3310	33
4809	ทุ่งไชย	อุทุมพรพิสัย	33120	331004	3310	33
4810	ปะอาว	อุทุมพรพิสัย	33120	331017	3310	33
4811	รังแร้ง	อุทุมพรพิสัย	33120	331012	3310	33
4812	สระกำแพงใหญ่	อุทุมพรพิสัย	33120	331022	3310	33
4813	สำโรง	อุทุมพรพิสัย	33120	331005	3310	33
4814	หนองห้าง	อุทุมพรพิสัย	33120	331018	3310	33
4815	หนองไฮ	อุทุมพรพิสัย	33120	330119	3310	33
4816	หัวช้าง	อุทุมพรพิสัย	33120	331011	3310	33
4817	อี่หล่ำ	อุทุมพรพิสัย	33120	331002	3310	33
4818	แขม	อุทุมพรพิสัย	33120	331006	3310	33
4819	แข้	อุทุมพรพิสัย	33120	331015	3310	33
4820	แต้	อุทุมพรพิสัย	33120	331014	3310	33
4821	โคกจาน	อุทุมพรพิสัย	33120	331025	3310	33
4822	โคกหล่าม	อุทุมพรพิสัย	33120	331024	3310	33
4823	โพธิ์ชัย	อุทุมพรพิสัย	33120	331016	3310	33
4824	ท่าคล้อ	เบญจลักษ์	33110	330418	3319	33
4825	หนองงูเหลือม	เบญจลักษ์	33110	330417	3319	33
4826	หนองหว้า	เบญจลักษ์	33110	330404	3319	33
4827	หนองฮาง	เบญจลักษ์	33110	330422	3319	33
4828	เสียว	เบญจลักษ์	33110	330410	3319	33
4829	ตาโกน	เมืองจันทร์	33120	331009	3318	33
4830	หนองใหญ่	เมืองจันทร์	33120	331023	3318	33
4831	เมืองจันทร์	เมืองจันทร์	33120	331013	3318	33
4832	คูซอด	เมืองศรีสะเกษ	33000	330103	3301	33
4833	จาน	เมืองศรีสะเกษ	33000	330105	3301	33
4834	ซำ	เมืองศรีสะเกษ	33000	330104	3301	33
4835	ตะดอบ	เมืองศรีสะเกษ	33000	330106	3301	33
4836	ทุ่ม	เมืองศรีสะเกษ	33000	330118	3301	33
4837	น้ำคำ	เมืองศรีสะเกษ	33000	330122	3301	33
4838	หญ้าปล้อง	เมืองศรีสะเกษ	33000	330116	3301	33
4839	หนองครก	เมืองศรีสะเกษ	33000	330107	3301	33
4840	หนองแก้ว	เมืองศรีสะเกษ	33000	330121	3301	33
4841	หนองไผ่	เมืองศรีสะเกษ	33000	330127	3301	33
4842	หนองไฮ	เมืองศรีสะเกษ	33000	330119	3301	33
4843	หมากเขียบ	เมืองศรีสะเกษ	33000	330124	3301	33
4844	เมืองเหนือ	เมืองศรีสะเกษ	33000	330101	3301	33
4845	เมืองใต้	เมืองศรีสะเกษ	33000	330102	3301	33
4846	โพธิ์	เมืองศรีสะเกษ	33000	330123	3301	33
4847	โพนข่า	เมืองศรีสะเกษ	33000	330111	3301	33
4848	โพนค้อ	เมืองศรีสะเกษ	33000	330112	3301	33
4849	โพนเขวา	เมืองศรีสะเกษ	33000	330115	3301	33
4850	บก	โนนคูณ	33250	330398	3313	33
4851	หนองกุง	โนนคูณ	33250	330396	3313	33
4852	เหล่ากวาง	โนนคูณ	33250	331305	3313	33
4853	โนนค้อ	โนนคูณ	33250	330399	3313	33
4854	โพธิ์	โนนคูณ	33250	330123	3313	33
4855	ผือใหญ่	โพธิ์ศรีสุวรรณ	33120	331026	3321	33
4856	หนองม้า	โพธิ์ศรีสุวรรณ	33120	331021	3321	33
4857	อีเซ	โพธิ์ศรีสุวรรณ	33120	331027	3321	33
4858	เสียว	โพธิ์ศรีสุวรรณ	33120	330410	3321	33
4859	โดด	โพธิ์ศรีสุวรรณ	33120	331019	3321	33
4860	ดินแดง	ไพรบึง	33180	330602	3306	33
4861	ปราสาทเยอ	ไพรบึง	33180	330603	3306	33
4862	สำโรงพลัน	ไพรบึง	33180	330604	3306	33
4863	สุขสวัสดิ์	ไพรบึง	33180	330605	3306	33
4864	โนนปูน	ไพรบึง	33180	330606	3306	33
4865	ไพรบึง	ไพรบึง	33180	330601	3306	33
4866	กุดบาก	กุดบาก	47180	470301	4703	47
4867	กุดไห	กุดบาก	47180	470305	4703	47
4868	นาม่อง	กุดบาก	47180	470303	4703	47
4869	กุสุมาลย์	กุสุมาลย์	47210	470201	4702	47
4870	นาเพียง	กุสุมาลย์	47230	470203	4702	47
4871	นาโพธิ์	กุสุมาลย์	47210	470202	4702	47
4872	อุ่มจาน	กุสุมาลย์	47230	470205	4702	47
4873	โพธิ์ไพศาล	กุสุมาลย์	47210	false	4702	47
4874	คำตากล้า	คำตากล้า	47250	470901	4709	47
4875	นาแต้	คำตากล้า	47250	470903	4709	47
4876	หนองบัวสิม	คำตากล้า	47250	470902	4709	47
4877	แพด	คำตากล้า	47250	470904	4709	47
4878	นิคมน้ำอูน	นิคมน้ำอูน	47270	470701	4707	47
4879	สุวรรณคาม	นิคมน้ำอูน	47270	470704	4707	47
4880	หนองบัว	นิคมน้ำอูน	47270	470703	4707	47
4881	หนองปลิง	นิคมน้ำอูน	47270	470702	4707	47
4882	ดงหม้อทอง	บ้านม่วง	47140	471003	4710	47
4883	ดงหม้อทองใต้	บ้านม่วง	47140	471005	4710	47
4884	ดงเหนือ	บ้านม่วง	47140	471004	4710	47
4885	บ่อแก้ว	บ้านม่วง	47140	471009	4710	47
4886	มาย	บ้านม่วง	47140	471002	4710	47
4887	ม่วง	บ้านม่วง	47140	471001	4710	47
4888	หนองกวั่ง	บ้านม่วง	47140	471008	4710	47
4889	ห้วยหลัว	บ้านม่วง	47140	471006	4710	47
4890	โนนสะอาด	บ้านม่วง	47140	471007	4710	47
4891	ช้างมิ่ง	พรรณานิคม	47130	470406	4704	47
4892	นาหัวบ่อ	พรรณานิคม	47220	470404	4704	47
4893	นาใน	พรรณานิคม	47130	470407	4704	47
4894	บะฮี	พรรณานิคม	47130	470409	4704	47
4895	พรรณา	พรรณานิคม	47130	470401	4704	47
4896	พอกน้อย	พรรณานิคม	47220	470403	4704	47
4897	วังยาง	พรรณานิคม	47130	470402	4704	47
4898	สว่าง	พรรณานิคม	47130	470408	4704	47
4899	เชิงชุม	พรรณานิคม	47130	470410	4704	47
4900	ไร่	พรรณานิคม	47130	470405	4704	47
4901	ต้นผึ้ง	พังโคน	47160	470505	4705	47
4902	พังโคน	พังโคน	47160	470501	4705	47
4903	ม่วงไข่	พังโคน	47160	470502	4705	47
4904	แร่	พังโคน	47160	470503	4705	47
4905	ไฮหย่อง	พังโคน	47160	470504	4705	47
4906	กกปลาซิว	ภูพาน	47180	470110	4718	47
4907	สร้างค้อ	ภูพาน	47180	470304	4718	47
4908	หลุบเลา	ภูพาน	47180	470306	4718	47
4909	โคกภู	ภูพาน	47180	470302	4718	47
4910	กุดเรือคำ	วานรนิวาส	47120	470813	4708	47
4911	ขัวก่าย	วานรนิวาส	47120	470803	4708	47
4912	คอนสวรรค์	วานรนิวาส	47120	470812	4708	47
4913	คูสะคาม	วานรนิวาส	47120	470805	4708	47
4914	ธาตุ	วานรนิวาส	47120	470806	4708	47
4915	นาคำ	วานรนิวาส	47120	470811	4708	47
4916	นาซอ	วานรนิวาส	47120	470809	4708	47
4917	วานรนิวาส	วานรนิวาส	47120	470801	4708	47
4918	ศรีวิชัย	วานรนิวาส	47120	470808	4708	47
4919	หนองสนม	วานรนิวาส	47120	470804	4708	47
4920	หนองแวง	วานรนิวาส	47120	470807	4708	47
4921	หนองแวงใต้	วานรนิวาส	47120	470814	4708	47
4922	อินทร์แปลง	วานรนิวาส	47120	470810	4708	47
4923	เดื่อศรีคันไชย	วานรนิวาส	47120	470802	4708	47
4924	คำบ่อ	วาริชภูมิ	47150	470604	4706	47
4925	ค้อเขียว	วาริชภูมิ	47150	470605	4706	47
4926	ปลาโหล	วาริชภูมิ	47150	470602	4706	47
4927	วาริชภูมิ	วาริชภูมิ	47150	470601	4706	47
4928	หนองลาด	วาริชภูมิ	47150	470118	4706	47
4929	คำสะอาด	สว่างแดนดิน	47110	471203	4712	47
4930	ค้อใต้	สว่างแดนดิน	47110	471212	4712	47
4931	ตาลเนิ้ง	สว่างแดนดิน	47240	471217	4712	47
4932	ตาลโกน	สว่างแดนดิน	47240	471216	4712	47
4933	ทรายมูล	สว่างแดนดิน	47110	471215	4712	47
4934	ธาตุทอง	สว่างแดนดิน	47240	471220	4712	47
4935	บงเหนือ	สว่างแดนดิน	47110	471206	4712	47
4936	บงใต้	สว่างแดนดิน	47110	471211	4712	47
4937	บ้านต้าย	สว่างแดนดิน	47110	471204	4712	47
4938	บ้านถ่อน	สว่างแดนดิน	47110	471221	4712	47
4939	พันนา	สว่างแดนดิน	47240	471213	4712	47
4940	สว่างแดนดิน	สว่างแดนดิน	47110	471201	4712	47
4941	หนองหลวง	สว่างแดนดิน	47110	471210	4712	47
4942	แวง	สว่างแดนดิน	47240	471214	4712	47
4943	โคกสี	สว่างแดนดิน	47110	471208	4712	47
4944	โพนสูง	สว่างแดนดิน	47110	471207	4712	47
4945	ท่าศิลา	ส่องดาว	47190	471302	4713	47
4946	ปทุมวาปี	ส่องดาว	47190	471304	4713	47
4947	วัฒนา	ส่องดาว	47190	471303	4713	47
4948	ส่องดาว	ส่องดาว	47190	471301	4713	47
4949	ท่าก้อน	อากาศอำนวย	47170	471105	4711	47
4950	นาฮี	อากาศอำนวย	47170	471106	4711	47
4951	บะหว้า	อากาศอำนวย	47170	471107	4711	47
4952	วาใหญ่	อากาศอำนวย	47170	471103	4711	47
4953	สามัคคีพัฒนา	อากาศอำนวย	47170	471108	4711	47
4954	อากาศ	อากาศอำนวย	47170	471101	4711	47
4955	โพนงาม	อากาศอำนวย	47170	471104	4711	47
4956	โพนแพง	อากาศอำนวย	47170	471102	4711	47
4957	ทุ่งแก	เจริญศิลป์	47290	471209	4716	47
4958	บ้านเหล่า	เจริญศิลป์	47290	471202	4716	47
5037	ตะเครียะ	ระโนด	90140	900703	9007	90
4959	หนองแปน	เจริญศิลป์	47290	471219	4716	47
4960	เจริญศิลป์	เจริญศิลป์	47290	471205	4716	47
4961	โคกศิลา	เจริญศิลป์	47290	471218	4716	47
4962	จันทร์เพ็ญ	เต่างอย	47260	471404	4714	47
4963	นาตาล	เต่างอย	47260	471403	4714	47
4964	บึงทวาย	เต่างอย	47260	471402	4714	47
4965	เต่างอย	เต่างอย	47260	470199	4714	47
4966	ขมิ้น	เมืองสกลนคร	47220	470102	4701	47
4967	งิ้วด่อน	เมืองสกลนคร	47000	470103	4701	47
4968	ดงชน	เมืองสกลนคร	47000	470111	4701	47
4969	ดงมะไฟ	เมืองสกลนคร	47000	470115	4701	47
4970	ท่าแร่	เมืองสกลนคร	47230	470107	4701	47
4971	ธาตุนาเวง	เมืองสกลนคร	47000	470116	4701	47
4972	ธาตุเชิงชุม	เมืองสกลนคร	47000	470101	4701	47
4973	พังขว้าง	เมืองสกลนคร	47000	470113	4701	47
4974	ม่วงลาย	เมืองสกลนคร	47000	470109	4701	47
4975	หนองลาด	เมืองสกลนคร	47220	470118	4701	47
4976	ห้วยยาง	เมืองสกลนคร	47000	470112	4701	47
4977	ฮางโฮง	เมืองสกลนคร	47000	470120	4701	47
4978	เชียงเครือ	เมืองสกลนคร	47000	470106	4701	47
4979	เหล่าปอแดง	เมืองสกลนคร	47000	470117	4701	47
4980	โคกก่อง	เมืองสกลนคร	47000	470121	4701	47
4981	โนนหอม	เมืองสกลนคร	47000	470104	4701	47
4982	ด่านม่วงคำ	โคกศรีสุพรรณ	47280	471503	4715	47
4983	ตองโขบ	โคกศรีสุพรรณ	47280	470198	4715	47
4984	เหล่าโพนค้อ	โคกศรีสุพรรณ	47280	470197	4715	47
4985	แมดนาท่ม	โคกศรีสุพรรณ	47280	471504	4715	47
4986	นาตงวัฒนา	โพนนาแก้ว	47230	470105	4717	47
4987	นาแก้ว	โพนนาแก้ว	47230	470114	4717	47
4988	บ้านแป้น	โพนนาแก้ว	47230	470119	4717	47
4989	บ้านโพน	โพนนาแก้ว	47230	470108	4717	47
4990	เชียงสือ	โพนนาแก้ว	47230	471705	4717	47
4991	กระแสสินธุ์	กระแสสินธุ์	90270	900804	9008	90
4992	เกาะใหญ่	กระแสสินธุ์	90270	900799	9008	90
4993	เชิงแส	กระแสสินธุ์	90270	900797	9008	90
4994	โรง	กระแสสินธุ์	90270	900798	9008	90
4995	คลองหลา	คลองหอยโข่ง	90115	901604	9016	90
4996	คลองหอยโข่ง	คลองหอยโข่ง	90230	901106	9016	90
4997	ทุ่งลาน	คลองหอยโข่ง	90230	901109	9016	90
4998	โคกม่วง	คลองหอยโข่ง	90230	901121	9016	90
4999	โคกม่วง	คลองหอยโข่ง	90115	901121	9016	90
5000	ควนโส	ควนเนียง	90220	900905	9013	90
5001	บางเหรียง	ควนเนียง	90220	900907	9013	90
5002	รัตภูมิ	ควนเนียง	90220	900906	9013	90
5003	ห้วยลึก	ควนเนียง	90220	900908	9013	90
5004	ขุนตัดหวาย	จะนะ	90130	900308	9003	90
5005	คลองเปียะ	จะนะ	90130	900313	9003	90
5006	คู	จะนะ	90130	900311	9003	90
5007	จะโหนง	จะนะ	90130	900310	9003	90
5008	ตลิ่งชัน	จะนะ	90130	900314	9003	90
5009	ท่าหมอไทร	จะนะ	90130	900309	9003	90
5010	นาทับ	จะนะ	90130	900306	9003	90
5011	นาหว้า	จะนะ	90130	900305	9003	90
5012	น้ำขาว	จะนะ	90130	900307	9003	90
5013	บ้านนา	จะนะ	90130	900301	9003	90
5014	ป่าชิง	จะนะ	90130	900302	9003	90
5015	สะกอม	จะนะ	90130	900304	9003	90
5016	สะพานไม้แก่น	จะนะ	90130	900303	9003	90
5017	แค	จะนะ	90130	900312	9003	90
5018	คลองกวาง	นาทวี	90160	900410	9004	90
5019	คลองทราย	นาทวี	90160	900404	9004	90
5020	ฉาง	นาทวี	90160	900402	9004	90
5021	ทับช้าง	นาทวี	90160	900408	9004	90
5022	ท่าประดู่	นาทวี	90160	900406	9004	90
5023	นาทวี	นาทวี	90160	900401	9004	90
5024	นาหมอศรี	นาทวี	90160	900403	9004	90
5025	ประกอบ	นาทวี	90160	900409	9004	90
5026	ปลักหนู	นาทวี	90160	900405	9004	90
5027	สะท้อน	นาทวี	90160	900407	9004	90
5028	คลองหรัง	นาหม่อม	90310	901196	9012	90
5029	ทุ่งขมิ้น	นาหม่อม	90310	901197	9012	90
5030	นาหม่อม	นาหม่อม	90310	901199	9012	90
5031	พิจิตร	นาหม่อม	90310	901198	9012	90
5032	ท่าช้าง	บางกล่ำ	90110	901110	9014	90
5033	บางกล่ำ	บางกล่ำ	90110	901115	9014	90
5034	บ้านหาร	บางกล่ำ	90110	901117	9014	90
5035	แม่ทอม	บางกล่ำ	90110	901119	9014	90
5036	คลองแดน	ระโนด	90140	900702	9007	90
5038	ท่าบอน	ระโนด	90140	900704	9007	90
5039	บ่อตรุ	ระโนด	90140	900706	9007	90
5040	บ้านขาว	ระโนด	90140	900711	9007	90
5041	บ้านใหม่	ระโนด	90140	900705	9007	90
5042	ปากแตระ	ระโนด	90140	900707	9007	90
5043	พังยาง	ระโนด	90140	900708	9007	90
5044	ระวะ	ระโนด	90140	900709	9007	90
5045	ระโนด	ระโนด	90140	900701	9007	90
5046	วัดสน	ระโนด	90140	900710	9007	90
5047	แดนสงวน	ระโนด	90140	900712	9007	90
5048	กำแพงเพชร	รัตภูมิ	90180	900901	9009	90
5049	ควนรู	รัตภูมิ	90220	900904	9009	90
5050	คูหาใต้	รัตภูมิ	90180	900903	9009	90
5051	ท่าชะมวง	รัตภูมิ	90180	900902	9009	90
5052	เขาพระ	รัตภูมิ	90180	900909	9009	90
5053	กระดังงา	สทิงพระ	90190	900202	9002	90
5054	คลองรี	สทิงพระ	90190	900206	9002	90
5055	คูขุด	สทิงพระ	90190	900207	9002	90
5056	จะทิ้งพระ	สทิงพระ	90190	900201	9002	90
5057	ชุมพล	สทิงพระ	90190	900205	9002	90
5058	ดีหลวง	สทิงพระ	90190	900204	9002	90
5059	ท่าหิน	สทิงพระ	90190	900208	9002	90
5060	บ่อดาน	สทิงพระ	90190	900211	9002	90
5061	บ่อแดง	สทิงพระ	90190	900210	9002	90
5062	วัดจันทร์	สทิงพระ	90190	900209	9002	90
5063	สนามชัย	สทิงพระ	90190	900203	9002	90
5064	คูหา	สะบ้าย้อย	90210	900606	9006	90
5065	จะแหน	สะบ้าย้อย	90210	900605	9006	90
5066	ทุ่งพอ	สะบ้าย้อย	90210	900602	9006	90
5067	ธารคีรี	สะบ้าย้อย	90210	900609	9006	90
5068	บาโหย	สะบ้าย้อย	90210	900608	9006	90
5069	บ้านโหนด	สะบ้าย้อย	90210	900604	9006	90
5070	สะบ้าย้อย	สะบ้าย้อย	90210	900601	9006	90
5071	เขาแดง	สะบ้าย้อย	90210	900607	9006	90
5072	เปียน	สะบ้าย้อย	90210	900603	9006	90
5073	ทุ่งหมอ	สะเดา	90240	901005	9010	90
5074	ท่าโพธิ์	สะเดา	90170	901006	9010	90
5075	ปริก	สะเดา	90120	901002	9010	90
5076	ปาดังเบซาร์	สะเดา	90240	901007	9010	90
5077	พังลา	สะเดา	90170	901003	9010	90
5078	สะเดา	สะเดา	90120	901001	9010	90
5079	สำนักขาม	สะเดา	90320	901008	9010	90
5080	สำนักแต้ว	สะเดา	90120	901004	9010	90
5081	เขามีเกียรติ	สะเดา	90170	901009	9010	90
5082	ชะแล้	สิงหนคร	90330	900112	9015	90
5083	ชิงโค	สิงหนคร	90280	900107	9015	90
5084	ทำนบ	สิงหนคร	90280	900109	9015	90
5085	บางเขียด	สิงหนคร	90330	900116	9015	90
5086	ปากรอ	สิงหนคร	90330	900113	9015	90
5087	ป่าขาด	สิงหนคร	90330	900114	9015	90
5088	ม่วงงาม	สิงหนคร	90330	900117	9015	90
5089	รำแดง	สิงหนคร	90330	900110	9015	90
5090	วัดขนุน	สิงหนคร	90330	900111	9015	90
5091	สทิงหม้อ	สิงหนคร	90280	900108	9015	90
5092	หัวเขา	สิงหนคร	90280	900115	9015	90
5093	คลองอู่ตะเภา	หาดใหญ่	90110	901107	9011	90
5094	คลองแห	หาดใหญ่	90110	901105	9011	90
5095	ควนลัง	หาดใหญ่	90110	901102	9011	90
5096	คอหงส์	หาดใหญ่	90110	901104	9011	90
5097	คูเต่า	หาดใหญ่	90110	901103	9011	90
5098	ฉลุง	หาดใหญ่	90110	901108	9011	90
5099	ทุ่งตำเสา	หาดใหญ่	90110	901112	9011	90
5100	ทุ่งใหญ่	หาดใหญ่	90110	901111	9011	90
5101	ท่าข้าม	หาดใหญ่	90110	901113	9011	90
5102	น้ำน้อย	หาดใหญ่	90110	901114	9011	90
5103	บ้านพรุ	หาดใหญ่	90250	901116	9011	90
5104	พะตง	หาดใหญ่	90230	901118	9011	90
5105	หาดใหญ่	หาดใหญ่	90110	901101	9011	90
5106	ท่าม่วง	เทพา	90150	900505	9005	90
5107	ปากบาง	เทพา	90150	900502	9005	90
5108	ลำไพล	เทพา	90260	900504	9005	90
5109	วังใหญ่	เทพา	90260	900506	9005	90
5110	สะกอม	เทพา	90150	900304	9005	90
5111	เกาะสะบ้า	เทพา	90150	900503	9005	90
5112	เทพา	เทพา	90150	900501	9005	90
5113	ทุ่งหวัง	เมืองสงขลา	90000	900105	9001	90
5114	บ่อยาง	เมืองสงขลา	90000	900101	9001	90
5115	พะวง	เมืองสงขลา	90100	900104	9001	90
5116	เกาะยอ	เมืองสงขลา	90100	900106	9001	90
5117	เกาะแต้ว	เมืองสงขลา	90000	900103	9001	90
5118	เขารูปช้าง	เมืองสงขลา	90000	900102	9001	90
5119	ควนกาหลง	ควนกาหลง	91130	910302	9103	91
5120	ทุ่งนุ้ย	ควนกาหลง	91130	910301	9103	91
5121	อุไดเจริญ	ควนกาหลง	91130	false	9103	91
5122	ควนสตอ	ควนโดน	91160	910202	9102	91
5123	ควนโดน	ควนโดน	91160	910201	9102	91
5124	ย่านซื่อ	ควนโดน	91160	910203	9102	91
5125	วังประจัน	ควนโดน	91160	910204	9102	91
5126	ขอนคลาน	ทุ่งหว้า	91120	910603	9106	91
5127	ทุ่งบุหลัง	ทุ่งหว้า	91120	910604	9106	91
5128	ทุ่งหว้า	ทุ่งหว้า	91120	910601	9106	91
5129	นาทอน	ทุ่งหว้า	91120	910602	9106	91
5130	ป่าแก่บ่อหิน	ทุ่งหว้า	91120	910605	9106	91
5131	ท่าเรือ	ท่าแพ	91150	910404	9104	91
5132	ท่าแพ	ท่าแพ	91150	910199	9104	91
5133	สาคร	ท่าแพ	91150	910403	9104	91
5134	แป-ระ	ท่าแพ	91150	910402	9104	91
5135	นิคมพัฒนา	มะนัง	91130	910304	9107	91
5136	ปาล์มพัฒนา	มะนัง	91130	910305	9107	91
5137	กำแพง	ละงู	91110	910501	9105	91
5138	น้ำผุด	ละงู	91110	910505	9105	91
5139	ปากน้ำ	ละงู	91110	910504	9105	91
5140	ละงู	ละงู	91110	910502	9105	91
5141	เขาขาว	ละงู	91110	910503	9105	91
5142	แหลมสน	ละงู	91110	910506	9105	91
5143	คลองขุด	เมืองสตูล	91000	910102	9101	91
5144	ควนขัน	เมืองสตูล	91000	910103	9101	91
5145	ควนโพธิ์	เมืองสตูล	91140	910111	9101	91
5146	ฉลุง	เมืองสตูล	91140	910105	9101	91
5147	ตันหยงโป	เมืองสตูล	91000	910107	9101	91
5148	ตำมะลัง	เมืองสตูล	91000	910109	9101	91
5149	บ้านควน	เมืองสตูล	91140	910104	9101	91
5150	ปูยู	เมืองสตูล	91000	910110	9101	91
5151	พิมาน	เมืองสตูล	91000	910101	9101	91
5152	เกตรี	เมืองสตูล	91140	910112	9101	91
5153	เกาะสาหร่าย	เมืองสตูล	91000	910106	9101	91
5154	เจ๊ะบิลัง	เมืองสตูล	91000	910108	9101	91
5155	คลองด่าน	บางบ่อ	10550	110205	1102	11
5156	คลองนิยมยาตรา	บางบ่อ	10560	110208	1102	11
5157	คลองสวน	บางบ่อ	10560	110206	1102	11
5158	บางบ่อ	บางบ่อ	10560	110201	1102	11
5159	บางพลีน้อย	บางบ่อ	10560	110203	1102	11
5160	บางเพรียง	บางบ่อ	10560	110204	1102	11
5161	บ้านระกาศ	บางบ่อ	10560	110202	1102	11
5162	เปร็ง	บางบ่อ	10560	110207	1102	11
5163	บางปลา	บางพลี	10540	110303	1103	11
5164	บางพลีใหญ่	บางพลี	10540	110301	1103	11
5165	บางแก้ว	บางพลี	10540	110302	1103	11
5166	บางโฉลง	บางพลี	10540	110304	1103	11
5167	ราชาเทวะ	บางพลี	10540	110308	1103	11
5168	หนองปรือ	บางพลี	10540	110309	1103	11
5169	บางเสาธง	บางเสาธง	10570	110305	1106	11
5170	ศีรษะจรเข้น้อย	บางเสาธง	10570	110602	1106	11
5171	ศีรษะจรเข้ใหญ่	บางเสาธง	10570	110603	1106	11
5172	ตลาด	พระประแดง	10130	110401	1104	11
5173	ทรงคนอง	พระประแดง	10130	110413	1104	11
5174	บางกระสอบ	พระประแดง	10130	110411	1104	11
5175	บางกอบัว	พระประแดง	10130	110412	1104	11
5176	บางกะเจ้า	พระประแดง	10130	110409	1104	11
5177	บางครุ	พระประแดง	10130	110404	1104	11
5178	บางจาก	พระประแดง	10130	110403	1104	11
5179	บางน้ำผึ้ง	พระประแดง	10130	110410	1104	11
5180	บางพึ่ง	พระประแดง	10130	110402	1104	11
5181	บางยอ	พระประแดง	10130	110408	1104	11
5182	บางหญ้าแพรก	พระประแดง	10130	110405	1104	11
5183	บางหัวเสือ	พระประแดง	10130	110406	1104	11
5184	สำโรง	พระประแดง	10130	110414	1104	11
5185	สำโรงกลาง	พระประแดง	10130	110415	1104	11
5186	สำโรงใต้	พระประแดง	10130	110407	1104	11
5187	นาเกลือ	พระสมุทรเจดีย์	10290	110105	1105	11
5188	บ้านคลองสวน	พระสมุทรเจดีย์	10290	110198	1105	11
5189	ปากคลองบางปลากด	พระสมุทรเจดีย์	10290	110109	1105	11
5190	แหลมฟ้าผ่า	พระสมุทรเจดีย์	10290	110106	1105	11
5191	ในคลองบางปลากด	พระสมุทรเจดีย์	10290	110107	1105	11
5192	ท้ายบ้าน	เมืองสมุทรปราการ	10280	110104	1101	11
5193	ท้ายบ้านใหม่	เมืองสมุทรปราการ	10280	110116	1101	11
5194	บางด้วน	เมืองสมุทรปราการ	10270	110113	1101	11
5195	บางปู	เมืองสมุทรปราการ	10280	110112	1101	11
5196	บางปูใหม่	เมืองสมุทรปราการ	10280	110108	1101	11
5197	บางเมือง	เมืองสมุทรปราการ	10270	110103	1101	11
5198	บางเมืองใหม่	เมืองสมุทรปราการ	10270	110114	1101	11
5199	บางโปรง	เมืองสมุทรปราการ	10270	110111	1101	11
5200	ปากน้ำ	เมืองสมุทรปราการ	10270	110101	1101	11
5201	สำโรงเหนือ	เมืองสมุทรปราการ	10270	110102	1101	11
5202	เทพารักษ์	เมืองสมุทรปราการ	10270	110115	1101	11
5203	แพรกษา	เมืองสมุทรปราการ	10280	110110	1101	11
5204	แพรกษาใหม่	เมืองสมุทรปราการ	10280	110117	1101	11
5205	กระดังงา	บางคนที	75120	750201	7502	75
5206	จอมปลวก	บางคนที	75120	750209	7502	75
5207	ดอนมะโนรา	บางคนที	75120	750206	7502	75
5208	บางกระบือ	บางคนที	75120	750212	7502	75
5209	บางกุ้ง	บางคนที	75120	750208	7502	75
5210	บางคนที	บางคนที	75120	750205	7502	75
5211	บางนกแขวก	บางคนที	75120	750210	7502	75
5212	บางพรม	บางคนที	75120	750207	7502	75
5213	บางยี่รงค์	บางคนที	75120	750203	7502	75
5214	บางสะแก	บางคนที	75120	750202	7502	75
5215	บ้านปราโมทย์	บางคนที	75120	750213	7502	75
5216	ยายแพง	บางคนที	75120	750211	7502	75
5217	โรงหีบ	บางคนที	75120	750204	7502	75
5218	ท่าคา	อัมพวา	75110	750303	7503	75
5219	บางช้าง	อัมพวา	75110	750306	7503	75
5220	บางนางลี่	อัมพวา	75110	750312	7503	75
5221	บางแค	อัมพวา	75110	750309	7503	75
5222	ปลายโพงพาง	อัมพวา	75110	750308	7503	75
5223	ยี่สาร	อัมพวา	75110	750311	7503	75
5224	วัดประดู่	อัมพวา	75110	750304	7503	75
5225	สวนหลวง	อัมพวา	75110	750302	7503	75
5226	อัมพวา	อัมพวา	75110	750301	7503	75
5227	เหมืองใหม่	อัมพวา	75110	750305	7503	75
5228	แควอ้อม	อัมพวา	75110	750307	7503	75
5229	แพรกหนามแดง	อัมพวา	75110	750310	7503	75
5230	คลองเขิน	เมืองสมุทรสงคราม	75000	750108	7501	75
5231	คลองโคน	เมืองสมุทรสงคราม	75000	750109	7501	75
5232	ท้ายหาด	เมืองสมุทรสงคราม	75000	750106	7501	75
5233	นางตะเคียน	เมืองสมุทรสงคราม	75000	750110	7501	75
5234	บางขันแตก	เมืองสมุทรสงคราม	75000	750102	7501	75
5235	บางจะเกร็ง	เมืองสมุทรสงคราม	75000	750111	7501	75
5236	บางแก้ว	เมืองสมุทรสงคราม	75000	750105	7501	75
5237	บ้านปรก	เมืองสมุทรสงคราม	75000	750104	7501	75
5238	ลาดใหญ่	เมืองสมุทรสงคราม	75000	750103	7501	75
5239	แม่กลอง	เมืองสมุทรสงคราม	75000	750101	7501	75
5240	แหลมใหญ่	เมืองสมุทรสงคราม	75000	750107	7501	75
5241	คลองมะเดื่อ	กระทุ่มแบน	74110	740206	7402	74
5242	ดอนไก่ดี	กระทุ่มแบน	74110	740208	7402	74
5243	ตลาดกระทุ่มแบน	กระทุ่มแบน	74110	740201	7402	74
5244	ท่าเสา	กระทุ่มแบน	74110	740210	7402	74
5245	ท่าไม้	กระทุ่มแบน	74110	740203	7402	74
5246	บางยาง	กระทุ่มแบน	74110	740205	7402	74
5247	สวนหลวง	กระทุ่มแบน	74110	740204	7402	74
5248	หนองนกไข่	กระทุ่มแบน	74110	740207	7402	74
5249	อ้อมน้อย	กระทุ่มแบน	74130	740202	7402	74
5250	แคราย	กระทุ่มแบน	74110	740209	7402	74
5251	คลองตัน	บ้านแพ้ว	74120	740309	7403	74
5252	บ้านแพ้ว	บ้านแพ้ว	74120	740301	7403	74
5253	ยกกระบัตร	บ้านแพ้ว	74120	740303	7403	74
5254	สวนส้ม	บ้านแพ้ว	74120	740311	7403	74
5255	หนองบัว	บ้านแพ้ว	74120	740306	7403	74
5256	หนองสองห้อง	บ้านแพ้ว	74120	740305	7403	74
5257	หลักสอง	บ้านแพ้ว	74120	740307	7403	74
5258	หลักสาม	บ้านแพ้ว	74120	740302	7403	74
5259	อำแพง	บ้านแพ้ว	74120	740310	7403	74
5260	เกษตรพัฒนา	บ้านแพ้ว	74120	740312	7403	74
5261	เจ็ดริ้ว	บ้านแพ้ว	74120	740308	7403	74
5262	โรงเข้	บ้านแพ้ว	74120	740304	7403	74
5263	กาหลง	เมืองสมุทรสาคร	74000	740106	7401	74
5264	คอกกระบือ	เมืองสมุทรสาคร	74000	740111	7401	74
5265	ชัยมงคล	เมืองสมุทรสาคร	74000	740118	7401	74
5266	ท่าจีน	เมืองสมุทรสาคร	74000	740108	7401	74
5267	ท่าฉลอม	เมืองสมุทรสาคร	74000	740102	7401	74
5268	ท่าทราย	เมืองสมุทรสาคร	74000	740110	7401	74
5269	นาดี	เมืองสมุทรสาคร	74000	740109	7401	74
5270	นาโคก	เมืองสมุทรสาคร	74000	740107	7401	74
5271	บางกระเจ้า	เมืองสมุทรสาคร	74000	740116	7401	74
5272	บางน้ำจืด	เมืองสมุทรสาคร	74000	740112	7401	74
5273	บางหญ้าแพรก	เมืองสมุทรสาคร	74000	740117	7401	74
5274	บางโทรัด	เมืองสมุทรสาคร	74000	740105	7401	74
5275	บ้านบ่อ	เมืองสมุทรสาคร	74000	740104	7401	74
5276	บ้านเกาะ	เมืองสมุทรสาคร	74000	740115	7401	74
5277	พันท้ายนรสิงห์	เมืองสมุทรสาคร	74000	740113	7401	74
5278	มหาชัย	เมืองสมุทรสาคร	74000	740101	7401	74
5279	โกรกกราก	เมืองสมุทรสาคร	74000	740103	7401	74
5280	โคกขาม	เมืองสมุทรสาคร	74000	740114	7401	74
5281	ดงตะงาว	ดอนพุด	18210	190696	1907	19
5282	ดอนพุด	ดอนพุด	18210	190699	1907	19
5283	บ้านหลวง	ดอนพุด	18210	190697	1907	19
5284	ไผ่หลิ่ว	ดอนพุด	18210	190698	1907	19
5285	ตลาดน้อย	บ้านหมอ	18130	190604	1906	19
5286	บางโขมด	บ้านหมอ	18130	190602	1906	19
5287	บ้านครัว	บ้านหมอ	18270	190608	1906	19
5288	บ้านหมอ	บ้านหมอ	18130	190601	1906	19
5289	สร่างโศก	บ้านหมอ	18130	190603	1906	19
5290	หนองบัว	บ้านหมอ	18130	190609	1906	19
5291	หรเทพ	บ้านหมอ	18130	190605	1906	19
5292	โคกใหญ่	บ้านหมอ	18130	190606	1906	19
5293	ไผ่ขวาง	บ้านหมอ	18130	190607	1906	19
5294	ขุนโขลน	พระพุทธบาท	18120	190902	1909	19
5295	ธารเกษม	พระพุทธบาท	18120	190903	1909	19
5296	นายาว	พระพุทธบาท	18120	190904	1909	19
5297	พระพุทธบาท	พระพุทธบาท	18120	190901	1909	19
5298	พุกร่าง	พระพุทธบาท	18120	190908	1909	19
5299	พุคำจาน	พระพุทธบาท	18120	190905	1909	19
5300	หนองแก	พระพุทธบาท	18120	190909	1909	19
5301	ห้วยป่าหวาย	พระพุทธบาท	18120	190907	1909	19
5302	เขาวง	พระพุทธบาท	18120	190906	1909	19
5303	ซับสนุ่น	มวกเหล็ก	18220	191109	1911	19
5304	มวกเหล็ก	มวกเหล็ก	18180	191101	1911	19
5305	มิตรภาพ	มวกเหล็ก	18180	191102	1911	19
5306	ลำพญากลาง	มวกเหล็ก	30130	191107	1911	19
5307	ลำสมพุง	มวกเหล็ก	30130	191105	1911	19
5308	หนองย่างเสือ	มวกเหล็ก	18180	191104	1911	19
5309	คำพราน	วังม่วง	18220	191106	1912	19
5310	วังม่วง	วังม่วง	18220	191108	1912	19
5311	แสลงพัน	วังม่วง	18220	191103	1912	19
5312	คลองเรือ	วิหารแดง	18150	190403	1904	19
5313	บ้านลำ	วิหารแดง	18150	190402	1904	19
5314	วิหารแดง	วิหารแดง	18150	190404	1904	19
5315	หนองสรวง	วิหารแดง	18150	190405	1904	19
5316	หนองหมู	วิหารแดง	18150	190401	1904	19
5317	เจริญธรรม	วิหารแดง	18150	190406	1904	19
5318	กุ่มหัก	หนองแค	18140	190302	1903	19
5319	คชสิทธิ์	หนองแค	18250	190303	1903	19
5320	บัวลอย	หนองแค	18230	190306	1903	19
5321	หนองจรเข้	หนองแค	18140	190314	1903	19
5322	หนองจิก	หนองแค	18230	190313	1903	19
5323	หนองนาก	หนองแค	18230	190315	1903	19
5324	หนองปลาหมอ	หนองแค	18140	190316	1903	19
5325	หนองปลิง	หนองแค	18140	190317	1903	19
5326	หนองแขม	หนองแค	18140	190312	1903	19
5327	หนองแค	หนองแค	18140	190301	1903	19
5328	หนองโรง	หนองแค	18140	190318	1903	19
5329	หนองไข่น้ำ	หนองแค	18140	190311	1903	19
5330	ห้วยขมิ้น	หนองแค	18230	190309	1903	19
5331	ห้วยทราย	หนองแค	18230	190310	1903	19
5332	โคกตูม	หนองแค	18250	190304	1903	19
5333	โคกแย้	หนองแค	18230	190305	1903	19
5334	โพนทอง	หนองแค	18250	190308	1903	19
5335	ไผ่ต่ำ	หนองแค	18140	190307	1903	19
5336	ม่วงหวาน	หนองแซง	18170	190508	1905	19
5337	หนองกบ	หนองแซง	18170	190505	1905	19
5338	หนองควายโซ	หนองแซง	18170	190502	1905	19
5339	หนองสีดา	หนองแซง	18170	190504	1905	19
5340	หนองหัวโพ	หนองแซง	18170	190503	1905	19
5341	หนองแซง	หนองแซง	18170	190501	1905	19
5342	เขาดิน	หนองแซง	18170	190509	1905	19
5343	โคกสะอาด	หนองแซง	18170	190507	1905	19
5344	ไก่เส่า	หนองแซง	18170	190506	1905	19
5345	ดอนทอง	หนองโดน	18190	190803	1908	19
5346	บ้านกลับ	หนองโดน	18190	190802	1908	19
5347	บ้านโปร่ง	หนองโดน	18190	190804	1908	19
5348	หนองโดน	หนองโดน	18190	190801	1908	19
5349	บ้านแก้ง	เฉลิมพระเกียรติ	18000	190115	1913	19
5350	ผึ้งรวง	เฉลิมพระเกียรติ	18000	190116	1913	19
5351	พุแค	เฉลิมพระเกียรติ	18240	190103	1913	19
5352	หน้าพระลาน	เฉลิมพระเกียรติ	18240	190102	1913	19
5353	ห้วยบง	เฉลิมพระเกียรติ	18000	190104	1913	19
5354	เขาดินพัฒนา	เฉลิมพระเกียรติ	18000	190117	1913	19
5355	กุดนกเปล้า	เมืองสระบุรี	18000	190112	1901	19
5356	ดาวเรือง	เมืองสระบุรี	18000	190105	1901	19
5357	ตลิ่งชัน	เมืองสระบุรี	18000	190113	1901	19
5358	ตะกุด	เมืองสระบุรี	18000	190114	1901	19
5359	นาโฉง	เมืองสระบุรี	18000	190106	1901	19
5360	ปากข้าวสาร	เมืองสระบุรี	18000	190110	1901	19
5361	ปากเพรียว	เมืองสระบุรี	18000	190101	1901	19
5362	หนองปลาไหล	เมืองสระบุรี	18000	190111	1901	19
5363	หนองยาว	เมืองสระบุรี	18000	190109	1901	19
5364	หนองโน	เมืองสระบุรี	18000	190108	1901	19
5365	โคกสว่าง	เมืองสระบุรี	18000	190107	1901	19
5366	งิ้วงาม	เสาไห้	18160	191004	1910	19
5367	ต้นตาล	เสาไห้	18160	191006	1910	19
5368	ท่าช้าง	เสาไห้	18160	191007	1910	19
5369	บ้านยาง	เสาไห้	18160	191002	1910	19
5370	พระยาทด	เสาไห้	18160	191008	1910	19
5371	ม่วงงาม	เสาไห้	18160	191009	1910	19
5372	ศาลารีไทย	เสาไห้	18160	191005	1910	19
5373	สวนดอกไม้	เสาไห้	18160	191012	1910	19
5374	หัวปลวก	เสาไห้	18160	191003	1910	19
5375	เมืองเก่า	เสาไห้	18160	191011	1910	19
5376	เริงราง	เสาไห้	18160	191010	1910	19
5377	เสาไห้	เสาไห้	18160	191001	1910	19
5378	ชะอม	แก่งคอย	18110	190210	1902	19
5379	ชำผักแพว	แก่งคอย	18110	190213	1902	19
5380	ตาลเดี่ยว	แก่งคอย	18110	190203	1902	19
5381	ทับกวาง	แก่งคอย	18260	190202	1902	19
5382	ท่าคล้อ	แก่งคอย	18110	190205	1902	19
5383	ท่าตูม	แก่งคอย	18110	190209	1902	19
5384	ท่ามะปราง	แก่งคอย	18110	190215	1902	19
5385	บ้านธาตุ	แก่งคอย	18110	190207	1902	19
5386	บ้านป่า	แก่งคอย	18110	190208	1902	19
5387	สองคอน	แก่งคอย	18110	190211	1902	19
5388	หินซ้อน	แก่งคอย	18110	190206	1902	19
5389	ห้วยแห้ง	แก่งคอย	18110	190204	1902	19
5390	เตาปูน	แก่งคอย	18110	190212	1902	19
5391	แก่งคอย	แก่งคอย	18110	190201	1902	19
5392	คลองหาด	คลองหาด	27260	270201	2702	27
5393	คลองไก่เถื่อน	คลองหาด	27260	270205	2702	27
5394	ซับมะกรูด	คลองหาด	27260	270203	2702	27
5395	เบญจขร	คลองหาด	27260	270206	2702	27
5396	ไทยอุดม	คลองหาด	27260	270202	2702	27
5397	ไทรทอง	คลองหาด	27260	270207	2702	27
5398	ไทรเดี่ยว	คลองหาด	27260	270204	2702	27
5399	ตาพระยา	ตาพระยา	27180	270301	2703	27
5400	ทัพราช	ตาพระยา	27180	270306	2703	27
5401	ทัพเสด็จ	ตาพระยา	27180	270302	2703	27
5402	ทัพไทย	ตาพระยา	27180	270307	2703	27
5403	โคคลาน	ตาพระยา	27180	270309	2703	27
5404	คลองหินปูน	วังน้ำเย็น	27210	270405	2704	27
5405	ตาหลังใน	วังน้ำเย็น	27210	270403	2704	27
5406	ทุ่งมหาเจริญ	วังน้ำเย็น	27210	270406	2704	27
5407	วังน้ำเย็น	วังน้ำเย็น	27210	270401	2704	27
5408	วังทอง	วังสมบูรณ์	27250	270407	2709	27
5409	วังสมบูรณ์	วังสมบูรณ์	27250	270402	2709	27
5410	วังใหม่	วังสมบูรณ์	27250	270404	2709	27
5411	ช่องกุ่ม	วัฒนานคร	27160	270506	2705	27
5412	ท่าเกวียน	วัฒนานคร	27160	270502	2705	27
5413	ผักขะ	วัฒนานคร	27160	270503	2705	27
5414	วัฒนานคร	วัฒนานคร	27160	270501	2705	27
5415	หนองตะเคียนบอน	วัฒนานคร	27160	270510	2705	27
5416	หนองน้ำใส	วัฒนานคร	27160	270505	2705	27
5417	หนองหมากฝ้าย	วัฒนานคร	27160	270509	2705	27
5418	หนองแวง	วัฒนานคร	27160	270304	2705	27
5419	ห้วยโจด	วัฒนานคร	27160	270511	2705	27
5420	แซร์ออ	วัฒนานคร	27160	270508	2705	27
5421	โนนหมากเค็ง	วัฒนานคร	27160	270504	2705	27
5422	คลองทับจันทร์	อรัญประเทศ	27120	270611	2706	27
5423	คลองน้ำใส	อรัญประเทศ	27120	270604	2706	27
5424	ทับพริก	อรัญประเทศ	27120	270607	2706	27
5425	ท่าข้าม	อรัญประเทศ	27120	270605	2706	27
5426	บ้านด่าน	อรัญประเทศ	27120	270613	2706	27
5427	บ้านใหม่หนองไทร	อรัญประเทศ	27120	270608	2706	27
5428	ป่าไร่	อรัญประเทศ	27120	270606	2706	27
5429	ผ่านศึก	อรัญประเทศ	27120	270609	2706	27
5430	ฟากห้วย	อรัญประเทศ	27120	270612	2706	27
5431	หนองสังข์	อรัญประเทศ	27120	270610	2706	27
5432	หันทราย	อรัญประเทศ	27120	270603	2706	27
5433	อรัญประเทศ	อรัญประเทศ	27120	270601	2706	27
5434	เมืองไผ่	อรัญประเทศ	27120	270602	2706	27
5435	พระเพลิง	เขาฉกรรจ์	27000	270110	2707	27
5436	หนองหว้า	เขาฉกรรจ์	27000	270109	2707	27
5437	เขาฉกรรจ์	เขาฉกรรจ์	27000	270107	2707	27
5438	เขาสามสิบ	เขาฉกรรจ์	27000	270112	2707	27
5439	ท่าเกษม	เมืองสระแก้ว	27000	270106	2701	27
5440	ท่าแยก	เมืองสระแก้ว	27000	270105	2701	27
5441	บ้านแก้ง	เมืองสระแก้ว	27000	270102	2701	27
5442	ศาลาลำดวน	เมืองสระแก้ว	27000	270103	2701	27
5443	สระขวัญ	เมืองสระแก้ว	27000	270108	2701	27
5444	สระแก้ว	เมืองสระแก้ว	27000	270101	2701	27
5445	หนองบอน	เมืองสระแก้ว	27000	270111	2701	27
5446	โคกปี่ฆ้อง	เมืองสระแก้ว	27000	270104	2701	27
5447	หนองม่วง	โคกสูง	27180	270305	2708	27
5448	หนองแวง	โคกสูง	27180	270304	2708	27
5449	โคกสูง	โคกสูง	27120	270303	2708	27
5450	โนนหมากมุ่น	โคกสูง	27120	270308	2708	27
5451	คอทราย	ค่ายบางระจัน	16150	170305	1703	17
5452	ท่าข้าม	ค่ายบางระจัน	16150	170304	1703	17
5453	บางระจัน	ค่ายบางระจัน	16150	170302	1703	17
5454	หนองกระทุ่ม	ค่ายบางระจัน	16150	170306	1703	17
5455	โพทะเล	ค่ายบางระจัน	16150	170301	1703	17
5456	โพสังโฆ	ค่ายบางระจัน	16150	170303	1703	17
5457	ถอนสมอ	ท่าช้าง	16140	170501	1705	17
5458	พิกุลทอง	ท่าช้าง	16140	170504	1705	17
5459	วิหารขาว	ท่าช้าง	16140	170503	1705	17
5460	โพประจักษ์	ท่าช้าง	16140	170502	1705	17
5461	บ้านจ่า	บางระจัน	16130	170206	1702	17
5462	พักทัน	บางระจัน	16130	170207	1702	17
5463	สระแจง	บางระจัน	16130	170208	1702	17
5464	สิงห์	บางระจัน	16130	170201	1702	17
5465	เชิงกลัด	บางระจัน	16130	170203	1702	17
5466	แม่ลา	บางระจัน	16130	170205	1702	17
5467	โพชนไก่	บางระจัน	16130	170204	1702	17
5468	ไม้ดัด	บางระจัน	16130	170202	1702	17
5469	บางน้ำเชี่ยว	พรหมบุรี	16120	170403	1704	17
5470	บ้านหม้อ	พรหมบุรี	16120	170404	1704	17
5471	บ้านแป้ง	พรหมบุรี	16120	170405	1704	17
5472	พรหมบุรี	พรหมบุรี	16160	170402	1704	17
5473	พระงาม	พรหมบุรี	16120	170401	1704	17
5474	หัวป่า	พรหมบุรี	16120	170406	1704	17
5475	โรงช้าง	พรหมบุรี	16120	170407	1704	17
5476	งิ้วราย	อินทร์บุรี	16110	170604	1706	17
5477	ชีน้ำร้าย	อินทร์บุรี	16110	170605	1706	17
5478	ทองเอน	อินทร์บุรี	16110	170608	1706	17
5479	ทับยา	อินทร์บุรี	16110	170603	1706	17
5480	ท่างาม	อินทร์บุรี	16110	170606	1706	17
5481	น้ำตาล	อินทร์บุรี	16110	170607	1706	17
5482	ประศุก	อินทร์บุรี	16110	170602	1706	17
5483	ห้วยชัน	อินทร์บุรี	16110	170609	1706	17
5484	อินทร์บุรี	อินทร์บุรี	16110	170601	1706	17
5485	โพธิ์ชัย	อินทร์บุรี	16110	170610	1706	17
5486	จักรสีห์	เมืองสิงห์บุรี	16000	170107	1701	17
5487	ต้นโพธิ์	เมืองสิงห์บุรี	16000	170106	1701	17
5488	บางกระบือ	เมืองสิงห์บุรี	16000	170108	1701	17
5489	บางพุทรา	เมืองสิงห์บุรี	16000	170101	1701	17
5490	บางมัญ	เมืองสิงห์บุรี	16000	170102	1701	17
5491	ม่วงหมู่	เมืองสิงห์บุรี	16000	170104	1701	17
5492	หัวไผ่	เมืองสิงห์บุรี	16000	170105	1701	17
5493	โพกรวม	เมืองสิงห์บุรี	16000	170103	1701	17
5494	ดอนเจดีย์	ดอนเจดีย์	72170	720601	7206	72
5495	ทะเลบก	ดอนเจดีย์	72250	720605	7206	72
5496	สระกระโจม	ดอนเจดีย์	72250	720604	7206	72
5497	หนองสาหร่าย	ดอนเจดีย์	72170	720602	7206	72
5498	ไร่รถ	ดอนเจดีย์	72170	720603	7206	72
5499	ด่านช้าง	ด่านช้าง	72180	720298	7203	72
5500	นิคมกระเสียว	ด่านช้าง	72180	720306	7203	72
5501	วังคัน	ด่านช้าง	72180	720305	7203	72
5502	วังยาว	ด่านช้าง	72180	720307	7203	72
5503	หนองมะค่าโมง	ด่านช้าง	72180	720299	7203	72
5504	ห้วยขมิ้น	ด่านช้าง	72180	720297	7203	72
5505	องค์พระ	ด่านช้าง	72180	720296	7203	72
5506	กฤษณา	บางปลาม้า	72150	720405	7204	72
5507	จรเข้ใหญ่	บางปลาม้า	72150	720409	7204	72
5508	ตะค่า	บางปลาม้า	72150	720403	7204	72
5509	บางปลาม้า	บางปลาม้า	72150	720402	7204	72
5510	บางใหญ่	บางปลาม้า	72150	720404	7204	72
5511	บ้านแหลม	บางปลาม้า	72150	720410	7204	72
5512	มะขามล้ม	บางปลาม้า	72150	720411	7204	72
5513	วังน้ำเย็น	บางปลาม้า	72150	720412	7204	72
5514	วัดดาว	บางปลาม้า	72150	720414	7204	72
5515	วัดโบสถ์	บางปลาม้า	72150	720413	7204	72
5516	สาลี	บางปลาม้า	72150	720406	7204	72
5517	องครักษ์	บางปลาม้า	72150	720408	7204	72
5518	โคกคราม	บางปลาม้า	72150	720401	7204	72
5519	ไผ่กองดิน	บางปลาม้า	72150	720407	7204	72
5520	ดอนปรู	ศรีประจันต์	72140	720505	7205	72
5521	บางงาม	ศรีประจันต์	72140	720504	7205	72
5522	บ้านกร่าง	ศรีประจันต์	72140	720502	7205	72
5523	ปลายนา	ศรีประจันต์	72140	720506	7205	72
5524	มดแดง	ศรีประจันต์	72140	720503	7205	72
5525	วังน้ำซับ	ศรีประจันต์	72140	720508	7205	72
5526	วังยาง	ศรีประจันต์	72140	720509	7205	72
5527	วังหว้า	ศรีประจันต์	72140	720507	7205	72
5528	ศรีประจันต์	ศรีประจันต์	72140	720501	7205	72
5529	ดอนมะนาว	สองพี่น้อง	72110	720715	7207	72
5530	ต้นตาล	สองพี่น้อง	72110	720710	7207	72
5531	ทุ่งคอก	สองพี่น้อง	72110	720712	7207	72
5532	บางตะเคียน	สองพี่น้อง	72110	720704	7207	72
5533	บางตาเถร	สองพี่น้อง	72110	720703	7207	72
5534	บางพลับ	สองพี่น้อง	72110	720707	7207	72
5535	บางเลน	สองพี่น้อง	72110	720702	7207	72
5536	บ่อสุพรรณ	สองพี่น้อง	72190	720714	7207	72
5537	บ้านกุ่ม	สองพี่น้อง	72110	720705	7207	72
5538	บ้านช้าง	สองพี่น้อง	72110	720709	7207	72
5539	ศรีสำราญ	สองพี่น้อง	72110	720711	7207	72
5540	สองพี่น้อง	สองพี่น้อง	72110	720701	7207	72
5541	หนองบ่อ	สองพี่น้อง	72190	720713	7207	72
5542	หัวโพธิ์	สองพี่น้อง	72110	720706	7207	72
5543	เนินพระปรางค์	สองพี่น้อง	72110	720708	7207	72
5544	กระเสียว	สามชุก	72130	720807	7208	72
5545	บ้านสระ	สามชุก	72130	720805	7208	72
5546	ย่านยาว	สามชุก	72130	720801	7208	72
5547	วังลึก	สามชุก	72130	720802	7208	72
5548	สามชุก	สามชุก	72130	720803	7208	72
5549	หนองผักนาก	สามชุก	72130	720804	7208	72
5550	หนองสะเดา	สามชุก	72130	720806	7208	72
5551	ทัพหลวง	หนองหญ้าไซ	72240	721006	7210	72
5552	หนองขาม	หนองหญ้าไซ	72240	721005	7210	72
5553	หนองราชวัตร	หนองหญ้าไซ	72240	720898	7210	72
5554	หนองหญ้าไซ	หนองหญ้าไซ	72240	720899	7210	72
5555	หนองโพธิ์	หนองหญ้าไซ	72240	720897	7210	72
5556	แจงงาม	หนองหญ้าไซ	72240	720896	7210	72
5557	กระจัน	อู่ทอง	72160	720913	7209	72
5558	จรเข้สามพัน	อู่ทอง	71170	720903	7209	72
5559	ดอนคา	อู่ทอง	72160	720908	7209	72
5560	ดอนมะเกลือ	อู่ทอง	72220	720906	7209	72
5561	บ้านดอน	อู่ทอง	72160	720904	7209	72
5562	บ้านโข้ง	อู่ทอง	72160	720910	7209	72
5563	พลับพลาไชย	อู่ทอง	72160	720909	7209	72
5564	ยุ้งทะลาย	อู่ทอง	72160	720905	7209	72
5565	สระพังลาน	อู่ทอง	72220	720912	7209	72
5566	สระยายโสม	อู่ทอง	72220	720902	7209	72
5567	หนองโอ่ง	อู่ทอง	72160	720907	7209	72
5568	อู่ทอง	อู่ทอง	72160	720901	7209	72
5569	เจดีย์	อู่ทอง	72160	720911	7209	72
5570	ทุ่งคลี	เดิมบางนางบวช	72120	720206	7202	72
5571	นางบวช	เดิมบางนางบวช	72120	720203	7202	72
5572	บ่อกรุ	เดิมบางนางบวช	72120	720210	7202	72
5573	ปากน้ำ	เดิมบางนางบวช	72120	720205	7202	72
5574	ป่าสะแก	เดิมบางนางบวช	72120	720212	7202	72
5575	ยางนอน	เดิมบางนางบวช	72120	720213	7202	72
5576	วังศรีราช	เดิมบางนางบวช	72120	720211	7202	72
5577	หนองกระทุ่ม	เดิมบางนางบวช	72120	720214	7202	72
5578	หัวนา	เดิมบางนางบวช	72120	720209	7202	72
5579	หัวเขา	เดิมบางนางบวช	72120	720208	7202	72
5580	เขาดิน	เดิมบางนางบวช	72120	720204	7202	72
5581	เขาพระ	เดิมบางนางบวช	72120	720201	7202	72
5582	เดิมบาง	เดิมบางนางบวช	72120	720202	7202	72
5583	โคกช้าง	เดิมบางนางบวช	72120	720207	7202	72
5584	ดอนกำยาน	เมืองสุพรรณบุรี	72000	720110	7201	72
5585	ดอนตาล	เมืองสุพรรณบุรี	72000	720107	7201	72
5586	ดอนมะสังข์	เมืองสุพรรณบุรี	72000	720108	7201	72
5587	ดอนโพธิ์ทอง	เมืองสุพรรณบุรี	72000	720111	7201	72
5588	ตลิ่งชัน	เมืองสุพรรณบุรี	72230	720114	7201	72
5589	ทับตีเหล็ก	เมืองสุพรรณบุรี	72000	720103	7201	72
5590	ท่าพี่เลี้ยง	เมืองสุพรรณบุรี	72000	720101	7201	72
5591	ท่าระหัด	เมืองสุพรรณบุรี	72000	720104	7201	72
5592	บางกุ้ง	เมืองสุพรรณบุรี	72210	720115	7201	72
5593	บ้านโพธิ์	เมืองสุพรรณบุรี	72000	720112	7201	72
5594	พิหารแดง	เมืองสุพรรณบุรี	72000	720109	7201	72
5595	รั้วใหญ่	เมืองสุพรรณบุรี	72000	720102	7201	72
5596	ศาลาขาว	เมืองสุพรรณบุรี	72210	720116	7201	72
5597	สนามคลี	เมืองสุพรรณบุรี	72230	720120	7201	72
5598	สนามชัย	เมืองสุพรรณบุรี	72000	720118	7201	72
5599	สระแก้ว	เมืองสุพรรณบุรี	72230	720113	7201	72
5600	สวนแตง	เมืองสุพรรณบุรี	72210	720117	7201	72
5601	โคกโคเฒ่า	เมืองสุพรรณบุรี	72000	720106	7201	72
5602	โพธิ์พระยา	เมืองสุพรรณบุรี	72000	720119	7201	72
5603	ไผ่ขวาง	เมืองสุพรรณบุรี	72000	720105	7201	72
5604	กรูด	กาญจนดิษฐ์	84160	840205	8402	84
5605	กะแดะ	กาญจนดิษฐ์	84160	840203	8402	84
5606	คลองสระ	กาญจนดิษฐ์	84160	840213	8402	84
5607	ช้างขวา	กาญจนดิษฐ์	84160	840210	8402	84
5608	ช้างซ้าย	กาญจนดิษฐ์	84160	840206	8402	84
5609	ตะเคียนทอง	กาญจนดิษฐ์	84160	840209	8402	84
5610	ทุ่งกง	กาญจนดิษฐ์	84290	840204	8402	84
5611	ทุ่งรัง	กาญจนดิษฐ์	84290	840212	8402	84
5612	ท่าทอง	กาญจนดิษฐ์	84160	840202	8402	84
5613	ท่าทองใหม่	กาญจนดิษฐ์	84290	840201	8402	84
5614	ท่าอุแท	กาญจนดิษฐ์	84160	840211	8402	84
5615	ป่าร่อน	กาญจนดิษฐ์	84160	840208	8402	84
5616	พลายวาส	กาญจนดิษฐ์	84160	840207	8402	84
5617	กะเปา	คีรีรัฐนิคม	84180	840806	8408	84
5618	ถ้ำสิงขร	คีรีรัฐนิคม	84180	840809	8408	84
5619	ท่ากระดาน	คีรีรัฐนิคม	84180	840807	8408	84
5620	ท่าขนอน	คีรีรัฐนิคม	84180	840801	8408	84
5621	น้ำหัก	คีรีรัฐนิคม	84180	840803	8408	84
5622	บ้านทำเนียบ	คีรีรัฐนิคม	84180	840810	8408	84
5623	บ้านยาง	คีรีรัฐนิคม	84180	840802	8408	84
5624	ย่านยาว	คีรีรัฐนิคม	84180	840808	8408	84
5625	คลองน้อย	ชัยบุรี	84350	840107	8418	84
5626	ชัยบุรี	ชัยบุรี	84350	841698	8418	84
5627	สองแพรก	ชัยบุรี	84350	841699	8418	84
5628	ไทรทอง	ชัยบุรี	84350	841804	8418	84
5629	ชลคราม	ดอนสัก	84160	840302	8403	84
5630	ดอนสัก	ดอนสัก	84220	840301	8403	84
5631	ปากแพรก	ดอนสัก	84340	840304	8403	84
5632	ไชยคราม	ดอนสัก	84220	840303	8403	84
5633	คลองไทร	ท่าฉาง	84150	841103	8411	84
5634	ท่าฉาง	ท่าฉาง	84150	841101	8411	84
5635	ท่าเคย	ท่าฉาง	84150	841102	8411	84
5636	ปากฉลุย	ท่าฉาง	84150	841106	8411	84
5637	เขาถ่าน	ท่าฉาง	84150	841104	8411	84
5638	เสวียด	ท่าฉาง	84150	841105	8411	84
5639	คลองพา	ท่าชนะ	84170	840706	8407	84
5640	คันธุลี	ท่าชนะ	84170	840704	8407	84
5641	ท่าชนะ	ท่าชนะ	84170	840701	8407	84
5642	ประสงค์	ท่าชนะ	84170	840703	8407	84
5643	วัง	ท่าชนะ	84170	840705	8407	84
5644	สมอทอง	ท่าชนะ	84170	840702	8407	84
5645	พรุไทย	บ้านตาขุน	84230	840903	8409	84
5646	พะแสง	บ้านตาขุน	84230	840902	8409	84
5647	เขาพัง	บ้านตาขุน	84230	840904	8409	84
5648	เขาวง	บ้านตาขุน	84230	840901	8409	84
5649	คลองปราบ	บ้านนาสาร	84120	841208	8412	84
5650	ควนศรี	บ้านนาสาร	84270	841206	8412	84
5651	ควนสุบรรณ	บ้านนาสาร	84120	841207	8412	84
5652	ทุ่งเตา	บ้านนาสาร	84120	841203	8412	84
5653	ทุ่งเตาใหม่	บ้านนาสาร	84120	841210	8412	84
5654	ท่าชี	บ้านนาสาร	84120	841205	8412	84
5655	นาสาร	บ้านนาสาร	84120	841201	8412	84
5656	น้ำพุ	บ้านนาสาร	84120	841209	8412	84
5657	พรุพี	บ้านนาสาร	84270	841202	8412	84
5658	ลำพูน	บ้านนาสาร	84120	841204	8412	84
5659	เพิ่มพูนทรัพย์	บ้านนาสาร	84120	841211	8412	84
5660	ทรัพย์ทวี	บ้านนาเดิม	84240	841303	8413	84
5661	ท่าเรือ	บ้านนาเดิม	84240	841298	8413	84
5662	นาใต้	บ้านนาเดิม	84240	841304	8413	84
5663	บ้านนา	บ้านนาเดิม	84240	841299	8413	84
5664	คลองชะอุ่น	พนม	84250	841006	8410	84
5665	คลองศก	พนม	84250	841003	8410	84
5666	ต้นยวน	พนม	84250	841002	8410	84
5667	พนม	พนม	84250	841001	8410	84
5668	พลูเถื่อน	พนม	84250	841004	8410	84
5669	พังกาญจน์	พนม	84250	841005	8410	84
5670	บางสวรรค์	พระแสง	84210	841603	8416	84
5671	สาคู	พระแสง	84210	841607	8416	84
5672	สินปุน	พระแสง	84210	841602	8416	84
5673	สินเจริญ	พระแสง	84210	841605	8416	84
5674	อิปัน	พระแสง	84210	841601	8416	84
5675	ไทรขึง	พระแสง	84210	841604	8416	84
5676	ไทรโสภา	พระแสง	84210	841606	8416	84
5677	กรูด	พุนพิน	84130	840205	8417	84
5678	ตะปาน	พุนพิน	84130	841716	8417	84
5679	ท่าข้าม	พุนพิน	84130	841701	8417	84
5680	ท่าสะท้อน	พุนพิน	84130	841702	8417	84
5681	ท่าโรงช้าง	พุนพิน	84130	841706	8417	84
5682	น้ำรอบ	พุนพิน	84130	841711	8417	84
5683	บางงอน	พุนพิน	84130	841709	8417	84
5684	บางมะเดื่อ	พุนพิน	84130	841704	8417	84
5685	บางเดือน	พุนพิน	84130	841705	8417	84
5686	พุนพิน	พุนพิน	84130	841708	8417	84
5687	มะลวน	พุนพิน	84130	841712	8417	84
5688	ลีเล็ด	พุนพิน	84130	841703	8417	84
5689	ศรีวิชัย	พุนพิน	84130	841710	8417	84
5690	หนองไทร	พุนพิน	84130	841714	8417	84
5691	หัวเตย	พุนพิน	84130	841713	8417	84
5692	เขาหัวควาย	พุนพิน	84130	841715	8417	84
5693	ตะกุกเหนือ	วิภาวดี	84180	840805	8419	84
5694	ตะกุกใต้	วิภาวดี	84180	840804	8419	84
5695	บ้านใต้	เกาะพะงัน	84280	840502	8405	84
5696	เกาะพะงัน	เกาะพะงัน	84280	840501	8405	84
5697	เกาะเต่า	เกาะพะงัน	84280	840503	8405	84
5698	เกาะเต่า	เกาะพะงัน	84360	840503	8405	84
5699	ตลิ่งงาม	เกาะสมุย	84140	840403	8404	84
5700	บ่อผุด	เกาะสมุย	84320	840406	8404	84
5701	มะเร็ต	เกาะสมุย	84310	840405	8404	84
5702	ลิปะน้อย	เกาะสมุย	84140	840402	8404	84
5703	หน้าเมือง	เกาะสมุย	84140	840404	8404	84
5704	อ่างทอง	เกาะสมุย	84140	840401	8404	84
5705	แม่น้ำ	เกาะสมุย	84330	840407	8404	84
5706	บ้านเสด็จ	เคียนซา	84260	841405	8414	84
5707	พ่วงพรมคร	เคียนซา	84210	841402	8414	84
5708	อรัญคามวารี	เคียนซา	84260	841404	8414	84
5709	เขาตอก	เคียนซา	84260	841403	8414	84
5710	เคียนซา	เคียนซา	84260	841401	8414	84
5711	ขุนทะเล	เมืองสุราษฎร์ธานี	84100	840104	8401	84
5712	คลองฉนาก	เมืองสุราษฎร์ธานี	84000	840111	8401	84
5713	คลองน้อย	เมืองสุราษฎร์ธานี	84000	840107	8401	84
5714	ตลาด	เมืองสุราษฎร์ธานี	84000	840101	8401	84
5715	บางกุ้ง	เมืองสุราษฎร์ธานี	84000	840110	8401	84
5716	บางชนะ	เมืองสุราษฎร์ธานี	84000	840106	8401	84
5717	บางโพธิ์	เมืองสุราษฎร์ธานี	84000	840109	8401	84
5800	ทับใหญ่	รัตนบุรี	32130	320716	3207	32
5718	บางใบไม้	เมืองสุราษฎร์ธานี	84000	840105	8401	84
5719	บางไทร	เมืองสุราษฎร์ธานี	84000	840108	8401	84
5720	มะขามเตี้ย	เมืองสุราษฎร์ธานี	84000	840102	8401	84
5721	วัดประดู่	เมืองสุราษฎร์ธานี	84000	840103	8401	84
5722	คลองฉนวน	เวียงสระ	84190	841503	8415	84
5723	ทุ่งหลวง	เวียงสระ	84190	841504	8415	84
5724	บ้านส้อง	เวียงสระ	84190	841502	8415	84
5725	เขานิพันธ์	เวียงสระ	84190	841505	8415	84
5726	เวียงสระ	เวียงสระ	84190	841501	8415	84
5727	ตลาดไชยา	ไชยา	84110	840601	8406	84
5728	ตะกรบ	ไชยา	84110	840607	8406	84
5729	ทุ่ง	ไชยา	84110	840605	8406	84
5730	ปากหมาก	ไชยา	84110	840609	8406	84
5731	ป่าเว	ไชยา	84110	840606	8406	84
5732	พุมเรียง	ไชยา	84110	840602	8406	84
5733	เลม็ด	ไชยา	84110	840603	8406	84
5734	เวียง	ไชยา	84110	840604	8406	84
5735	โมถ่าย	ไชยา	84110	840608	8406	84
5736	กาบเชิง	กาบเชิง	32210	320599	3206	32
5737	คูตัน	กาบเชิง	32210	320596	3206	32
5738	ด่าน	กาบเชิง	32210	320595	3206	32
5739	ตะเคียน	กาบเชิง	32210	320610	3206	32
5740	แนงมุด	กาบเชิง	32210	320606	3206	32
5741	โคกตะเคียน	กาบเชิง	32210	320607	3206	32
5742	กระหาด	จอมพระ	32180	320403	3204	32
5743	จอมพระ	จอมพระ	32180	320401	3204	32
5744	ชุมแสง	จอมพระ	32180	320408	3204	32
5745	บุแกรง	จอมพระ	32180	320404	3204	32
5746	บ้านผือ	จอมพระ	32180	320406	3204	32
5747	ลุ่มระวี	จอมพระ	32180	320407	3204	32
5748	หนองสนิท	จอมพระ	32180	320405	3204	32
5749	เป็นสุข	จอมพระ	32180	320409	3204	32
5750	เมืองลีง	จอมพระ	32180	320402	3204	32
5751	กระเบื้อง	ชุมพลบุรี	32190	320208	3202	32
5752	ชุมพลบุรี	ชุมพลบุรี	32190	320201	3202	32
5753	นาหนองไผ่	ชุมพลบุรี	32190	320202	3202	32
5754	ยะวึก	ชุมพลบุรี	32190	320205	3202	32
5755	ศรีณรงค์	ชุมพลบุรี	32190	320204	3202	32
5756	สระขุด	ชุมพลบุรี	32190	320207	3202	32
5757	หนองเรือ	ชุมพลบุรี	32190	320209	3202	32
5758	เมืองบัว	ชุมพลบุรี	32190	320206	3202	32
5759	ไพรขลา	ชุมพลบุรี	32190	320203	3202	32
5760	กระโพ	ท่าตูม	32120	320302	3203	32
5761	ทุ่งกุลา	ท่าตูม	32120	320310	3203	32
5762	ท่าตูม	ท่าตูม	32120	320301	3203	32
5763	บะ	ท่าตูม	32120	320306	3203	32
5764	บัวโคก	ท่าตูม	32120	320308	3203	32
5765	พรมเทพ	ท่าตูม	32120	320303	3203	32
5766	หนองบัว	ท่าตูม	32120	320307	3203	32
5767	หนองเมธี	ท่าตูม	32120	320309	3203	32
5768	เมืองแก	ท่าตูม	32120	320305	3203	32
5769	โพนครก	ท่าตูม	32120	320304	3203	32
5770	จรัส	บัวเชด	32230	321303	3213	32
5771	ตาวัง	บัวเชด	32230	321304	3213	32
5772	บัวเชด	บัวเชด	32230	321301	3213	32
5773	สะเดา	บัวเชด	32230	321302	3213	32
5774	สำเภาลูน	บัวเชด	32230	321306	3213	32
5775	อาโพน	บัวเชด	32230	321305	3213	32
5776	กังแอน	ปราสาท	32140	320501	3205	32
5777	กันตวจระมวล	ปราสาท	32140	320516	3205	32
5778	ตานี	ปราสาท	32140	320514	3205	32
5779	ตาเบา	ปราสาท	32140	320506	3205	32
5780	ทมอ	ปราสาท	32140	320502	3205	32
5781	ทุ่งมน	ปราสาท	32140	320505	3205	32
5782	บ้านพลวง	ปราสาท	32140	320515	3205	32
5783	บ้านไทร	ปราสาท	32140	320510	3205	32
5784	ประทัดบุ	ปราสาท	32140	320518	3205	32
5785	ปราสาททนง	ปราสาท	32140	320513	3205	32
5786	ปรือ	ปราสาท	32140	320504	3205	32
5787	สมุด	ปราสาท	32140	320517	3205	32
5788	หนองใหญ่	ปราสาท	32140	320507	3205	32
5789	เชื้อเพลิง	ปราสาท	32140	320512	3205	32
5790	โคกยาง	ปราสาท	32140	320508	3205	32
5791	โคกสะอาด	ปราสาท	32140	320509	3205	32
5792	โชคนาสาม	ปราสาท	32140	320511	3205	32
5793	ไพล	ปราสาท	32140	320503	3205	32
5794	จีกแดก	พนมดงรัก	32140	320609	3214	32
5795	ตาเมียง	พนมดงรัก	32140	320608	3214	32
5796	บักได	พนมดงรัก	32140	320598	3214	32
5797	โคกกลาง	พนมดงรัก	32140	320597	3214	32
5798	กุดขาคีม	รัตนบุรี	32130	320714	3207	32
5799	ดอนแรด	รัตนบุรี	32130	320704	3207	32
5801	ธาตุ	รัตนบุรี	32130	320702	3207	32
5802	น้ำเขียว	รัตนบุรี	32130	320713	3207	32
5803	ยางสว่าง	รัตนบุรี	32130	320715	3207	32
5804	รัตนบุรี	รัตนบุรี	32130	320701	3207	32
5805	หนองบัวทอง	รัตนบุรี	32130	320705	3207	32
5806	หนองบัวบาน	รัตนบุรี	32130	320706	3207	32
5807	เบิด	รัตนบุรี	32130	320711	3207	32
5808	แก	รัตนบุรี	32130	320703	3207	32
5809	ไผ่	รัตนบุรี	32130	320709	3207	32
5810	ตระเปียงเตีย	ลำดวน	32220	321105	3211	32
5811	ตรำดม	ลำดวน	32220	321104	3211	32
5812	ลำดวน	ลำดวน	32220	321101	3211	32
5813	อู่โลก	ลำดวน	32220	321103	3211	32
5814	โชคเหนือ	ลำดวน	32220	321102	3211	32
5815	ณรงค์	ศรีณรงค์	32150	321003	3215	32
5816	ตรวจ	ศรีณรงค์	32150	321005	3215	32
5817	ศรีสุข	ศรีณรงค์	32150	321014	3215	32
5818	หนองแวง	ศรีณรงค์	32150	321016	3215	32
5819	แจนแวน	ศรีณรงค์	32150	321004	3215	32
5820	กุดหวาย	ศีขรภูมิ	32110	320911	3209	32
5821	ขวาวใหญ่	ศีขรภูมิ	32110	320912	3209	32
5822	คาละแมะ	ศีขรภูมิ	32110	320907	3209	32
5823	จารพัต	ศีขรภูมิ	32110	320903	3209	32
5824	ช่างปี่	ศีขรภูมิ	32110	320910	3209	32
5825	ตรมไพร	ศีขรภูมิ	32110	320914	3209	32
5826	ตรึม	ศีขรภูมิ	32110	320902	3209	32
5827	นารุ่ง	ศีขรภูมิ	32110	320913	3209	32
5828	ผักไหม	ศีขรภูมิ	32110	320915	3209	32
5829	ยาง	ศีขรภูมิ	32110	320904	3209	32
5830	ระแงง	ศีขรภูมิ	32110	320901	3209	32
5831	หนองขวาว	ศีขรภูมิ	32110	320909	3209	32
5832	หนองบัว	ศีขรภูมิ	32110	320307	3209	32
5833	หนองเหล็ก	ศีขรภูมิ	32110	320908	3209	32
5834	แตล	ศีขรภูมิ	32110	320905	3209	32
5835	นานวน	สนม	32160	320797	3208	32
5836	สนม	สนม	32160	320795	3208	32
5837	หนองระฆัง	สนม	32160	320796	3208	32
5838	หนองอียอ	สนม	32160	320807	3208	32
5839	หัวงัว	สนม	32160	320806	3208	32
5840	แคน	สนม	32160	320799	3208	32
5841	โพนโก	สนม	32160	320798	3208	32
5842	กระเทียม	สังขะ	32150	321009	3210	32
5843	ขอนแตก	สังขะ	32150	321002	3210	32
5844	ดม	สังขะ	32150	321006	3210	32
5845	ตาคง	สังขะ	32150	321013	3210	32
5846	ตาตุม	สังขะ	32150	321011	3210	32
5847	ทับทัน	สังขะ	32150	321012	3210	32
5848	บ้านจารย์	สังขะ	32150	321008	3210	32
5849	บ้านชบ	สังขะ	32150	321015	3210	32
5850	พระแก้ว	สังขะ	32150	321007	3210	32
5851	สะกาด	สังขะ	32150	321010	3210	32
5852	สังขะ	สังขะ	32150	321001	3210	32
5853	เทพรักษา	สังขะ	32150	321017	3210	32
5854	กระออม	สำโรงทาบ	32170	321203	3212	32
5855	ประดู่	สำโรงทาบ	32170	321210	3212	32
5856	ศรีสุข	สำโรงทาบ	32170	321014	3212	32
5857	สะโน	สำโรงทาบ	32170	321209	3212	32
5858	สำโรงทาบ	สำโรงทาบ	32170	321201	3212	32
5859	หนองฮะ	สำโรงทาบ	32170	321204	3212	32
5860	หนองไผ่ล้อม	สำโรงทาบ	32170	321202	3212	32
5861	หมื่นศรี	สำโรงทาบ	32170	321207	3212	32
5862	เกาะแก้ว	สำโรงทาบ	32170	321206	3212	32
5863	เสม็จ	สำโรงทาบ	32170	321208	3212	32
5864	ตากูก	เขวาสินรินทร์	32000	320108	3216	32
5865	บึง	เขวาสินรินทร์	32000	320115	3216	32
5866	บ้านแร่	เขวาสินรินทร์	32000	320123	3216	32
5867	ปราสาททอง	เขวาสินรินทร์	32000	320124	3216	32
5868	เขวาสินรินทร์	เขวาสินรินทร์	32000	320117	3216	32
5869	กาเกาะ	เมืองสุรินทร์	32000	320126	3201	32
5870	คอโค	เมืองสุรินทร์	32000	320112	3201	32
5871	ตระแสง	เมืองสุรินทร์	32000	320122	3201	32
5872	ตั้งใจ	เมืองสุรินทร์	32000	320102	3201	32
5873	ตาอ็อง	เมืองสุรินทร์	32000	320107	3201	32
5874	ท่าสว่าง	เมืองสุรินทร์	32000	320105	3201	32
5875	นอกเมือง	เมืองสุรินทร์	32000	320111	3201	32
5876	นาดี	เมืองสุรินทร์	32000	320104	3201	32
5877	นาบัว	เมืองสุรินทร์	32000	320118	3201	32
5878	บุฤาษี	เมืองสุรินทร์	32000	320121	3201	32
5879	ราม	เมืองสุรินทร์	32000	320120	3201	32
5880	สลักได	เมืองสุรินทร์	32000	320106	3201	32
5881	สวาย	เมืองสุรินทร์	32000	320113	3201	32
5882	สำโรง	เมืองสุรินทร์	32000	320109	3201	32
5883	เฉนียง	เมืองสุรินทร์	32000	320114	3201	32
5884	เทนมีย์	เมืองสุรินทร์	32000	320116	3201	32
5885	เพี้ยราม	เมืองสุรินทร์	32000	320103	3201	32
5886	เมืองที	เมืองสุรินทร์	32000	320119	3201	32
5887	แกใหญ่	เมืองสุรินทร์	32000	320110	3201	32
5888	แสลงพันธ์	เมืองสุรินทร์	32000	320125	3201	32
5889	ในเมือง	เมืองสุรินทร์	32000	320101	3201	32
5890	คำผง	โนนนารายณ์	32130	320717	3217	32
5891	ระเวียง	โนนนารายณ์	32130	320712	3217	32
5892	หนองหลวง	โนนนารายณ์	32130	320707	3217	32
5893	หนองเทพ	โนนนารายณ์	32130	320708	3217	32
5894	โนน	โนนนารายณ์	32130	320710	3217	32
5895	กกแรต	กงไกรลาศ	64170	640408	6404	64
5896	กง	กงไกรลาศ	64170	640401	6404	64
5897	ดงเดือย	กงไกรลาศ	64170	640406	6404	64
5898	ท่าฉนวน	กงไกรลาศ	64170	640409	6404	64
5899	บ้านกร่าง	กงไกรลาศ	64170	640402	6404	64
5900	บ้านใหม่สุขเกษม	กงไกรลาศ	64170	640411	6404	64
5901	ป่าแฝก	กงไกรลาศ	64170	640407	6404	64
5902	หนองตูม	กงไกรลาศ	64170	640410	6404	64
5903	ไกรกลาง	กงไกรลาศ	64170	640404	6404	64
5904	ไกรนอก	กงไกรลาศ	64170	640403	6404	64
5905	ไกรใน	กงไกรลาศ	64170	640405	6404	64
5906	ทุ่งยางเมือง	คีรีมาศ	64160	640310	6403	64
5907	ทุ่งหลวง	คีรีมาศ	64160	640302	6403	64
5908	นาเชิงคีรี	คีรีมาศ	64160	640307	6403	64
5909	บ้านน้ำพุ	คีรีมาศ	64160	640309	6403	64
5910	บ้านป้อม	คีรีมาศ	64160	640303	6403	64
5911	ศรีคีรีมาศ	คีรีมาศ	64160	640305	6403	64
5912	สามพวง	คีรีมาศ	64160	640304	6403	64
5913	หนองกระดิ่ง	คีรีมาศ	64160	640308	6403	64
5914	หนองจิก	คีรีมาศ	64160	640306	6403	64
5915	โตนด	คีรีมาศ	64160	640301	6403	64
5916	กลางดง	ทุ่งเสลี่ยม	64150	640904	6409	64
5917	ทุ่งเสลี่ยม	ทุ่งเสลี่ยม	64150	640903	6409	64
5918	บ้านใหม่ไชยมงคล	ทุ่งเสลี่ยม	64230	640901	6409	64
5919	เขาแก้วศรีสมบูรณ์	ทุ่งเสลี่ยม	64230	640905	6409	64
5920	ไทยชนะศึก	ทุ่งเสลี่ยม	64150	640902	6409	64
5921	ตลิ่งชัน	บ้านด่านลานหอย	64140	640205	6402	64
5922	บ้านด่าน	บ้านด่านลานหอย	64140	640202	6402	64
5923	ลานหอย	บ้านด่านลานหอย	64140	640201	6402	64
5924	วังตะคร้อ	บ้านด่านลานหอย	64140	640203	6402	64
5925	วังน้ำขาว	บ้านด่านลานหอย	64140	640204	6402	64
5926	วังลึก	บ้านด่านลานหอย	64140	640207	6402	64
5927	หนองหญ้าปล้อง	บ้านด่านลานหอย	64140	640206	6402	64
5928	คลองมะพลับ	ศรีนคร	64180	640796	6408	64
5929	นครเดิฐ	ศรีนคร	64180	640798	6408	64
5930	น้ำขุม	ศรีนคร	64180	640797	6408	64
5931	ศรีนคร	ศรีนคร	64180	640799	6408	64
5932	หนองบัว	ศรีนคร	64180	640805	6408	64
5933	ดงคู่	ศรีสัชนาลัย	64130	640509	6405	64
5934	ท่าชัย	ศรีสัชนาลัย	64190	640507	6405	64
5935	บ้านตึก	ศรีสัชนาลัย	64130	640505	6405	64
5936	บ้านแก่ง	ศรีสัชนาลัย	64130	640510	6405	64
5937	ป่างิ้ว	ศรีสัชนาลัย	64130	640502	6405	64
5938	ศรีสัชนาลัย	ศรีสัชนาลัย	64190	640508	6405	64
5939	สารจิตร	ศรีสัชนาลัย	64130	640511	6405	64
5940	หนองอ้อ	ศรีสัชนาลัย	64130	640506	6405	64
5941	หาดเสี้ยว	ศรีสัชนาลัย	64130	640501	6405	64
5942	แม่สำ	ศรีสัชนาลัย	64130	640503	6405	64
5943	แม่สิน	ศรีสัชนาลัย	64130	640504	6405	64
5944	คลองตาล	ศรีสำโรง	64120	640601	6406	64
5945	ทับผึ้ง	ศรีสำโรง	64120	640610	6406	64
5946	นาขุนไกร	ศรีสำโรง	64120	640606	6406	64
5947	บ้านซ่าน	ศรีสำโรง	64120	640611	6406	64
5948	บ้านนา	ศรีสำโรง	64120	640604	6406	64
5949	บ้านไร่	ศรีสำโรง	64120	640609	6406	64
5950	ราวต้นจันทร์	ศรีสำโรง	64120	640613	6406	64
5951	วังทอง	ศรีสำโรง	64120	640605	6406	64
5952	วังลึก	ศรีสำโรง	64120	640207	6406	64
5953	วังใหญ่	ศรีสำโรง	64120	640612	6406	64
5954	วัดเกาะ	ศรีสำโรง	64120	640608	6406	64
5955	สามเรือน	ศรีสำโรง	64120	640603	6406	64
5956	เกาะตาเลี้ยง	ศรีสำโรง	64120	640607	6406	64
5957	คลองกระจง	สวรรคโลก	64110	640703	6407	64
5958	คลองยาง	สวรรคโลก	64110	640708	6407	64
5959	ท่าทอง	สวรรคโลก	64110	640710	6407	64
5960	นาทุ่ง	สวรรคโลก	64110	640707	6407	64
5961	ปากน้ำ	สวรรคโลก	64110	640711	6407	64
5962	ป่ากุมเกาะ	สวรรคโลก	64110	640712	6407	64
5963	ย่านยาว	สวรรคโลก	64110	640706	6407	64
5964	วังพิณพาทย์	สวรรคโลก	64110	640704	6407	64
5965	วังไม้ขอน	สวรรคโลก	64110	640705	6407	64
5966	หนองกลับ	สวรรคโลก	64110	640714	6407	64
5967	เมืองบางขลัง	สวรรคโลก	64110	640713	6407	64
5968	เมืองบางยม	สวรรคโลก	64110	640709	6407	64
5969	เมืองสวรรคโลก	สวรรคโลก	64110	640701	6407	64
5970	ในเมือง	สวรรคโลก	64110	640702	6407	64
5971	ตาลเตี้ย	เมืองสุโขทัย	64220	640108	6401	64
5972	ธานี	เมืองสุโขทัย	64000	640101	6401	64
5973	บ้านกล้วย	เมืองสุโขทัย	64000	640106	6401	64
5974	บ้านสวน	เมืองสุโขทัย	64220	640102	6401	64
5975	บ้านหลุม	เมืองสุโขทัย	64000	640107	6401	64
5976	ปากพระ	เมืองสุโขทัย	64000	640109	6401	64
5977	ปากแคว	เมืองสุโขทัย	64000	640104	6401	64
5978	ยางซ้าย	เมืองสุโขทัย	64000	640105	6401	64
5979	วังทองแดง	เมืองสุโขทัย	64210	640110	6401	64
5980	เมืองเก่า	เมืองสุโขทัย	64210	640103	6401	64
5981	กองนาง	ท่าบ่อ	43110	430203	4302	43
5982	ท่าบ่อ	ท่าบ่อ	43110	430201	4302	43
5983	นาข่า	ท่าบ่อ	43110	430208	4302	43
5984	น้ำโมง	ท่าบ่อ	43110	430202	4302	43
5985	บ้านถ่อน	ท่าบ่อ	43110	430206	4302	43
5986	บ้านว่าน	ท่าบ่อ	43110	430207	4302	43
5987	บ้านเดื่อ	ท่าบ่อ	43110	430109	4302	43
5988	หนองนาง	ท่าบ่อ	43110	430210	4302	43
5989	โคกคอน	ท่าบ่อ	43110	430204	4302	43
5990	โพนสา	ท่าบ่อ	43110	430209	4302	43
5991	นาทับไฮ	รัตนวาปี	43120	430514	4316	43
5992	บ้านต้อน	รัตนวาปี	43120	430520	4316	43
5993	พระบาทนาสิงห์	รัตนวาปี	43120	430516	4316	43
5994	รัตนวาปี	รัตนวาปี	43120	430505	4316	43
5995	โพนแพง	รัตนวาปี	43120	430511	4316	43
5996	บ้านหม้อ	ศรีเชียงใหม่	43130	430703	4307	43
5997	พระพุทธบาท	ศรีเชียงใหม่	43130	430704	4307	43
5998	พานพร้าว	ศรีเชียงใหม่	43130	430701	4307	43
5999	หนองปลาปาก	ศรีเชียงใหม่	43130	430705	4307	43
6000	คอกช้าง	สระใคร	43100	430115	4314	43
6001	บ้านฝาง	สระใคร	43100	430114	4314	43
6002	สระใคร	สระใคร	43100	430112	4314	43
6003	นางิ้ว	สังคม	43160	430804	4308	43
6004	บ้านม่วง	สังคม	43160	430803	4308	43
6005	ผาตั้ง	สังคม	43160	430802	4308	43
6006	สังคม	สังคม	43160	430805	4308	43
6007	แก้งไก่	สังคม	43160	430801	4308	43
6008	นาดี	เฝ้าไร่	43120	430518	4315	43
6009	วังหลวง	เฝ้าไร่	43120	430515	4315	43
6010	หนองหลวง	เฝ้าไร่	43120	430510	4315	43
6011	อุดมพร	เฝ้าไร่	43120	430517	4315	43
6012	เฝ้าไร่	เฝ้าไร่	43120	430512	4315	43
6013	กวนวัน	เมืองหนองคาย	43000	430104	4301	43
6014	ค่ายบกหวาน	เมืองหนองคาย	43100	430110	4301	43
6015	บ้านเดื่อ	เมืองหนองคาย	43000	430109	4301	43
6016	ปะโค	เมืองหนองคาย	43000	430117	4301	43
6017	พระธาตุบังพวน	เมืองหนองคาย	43100	430113	4301	43
6018	มีชัย	เมืองหนองคาย	43000	430102	4301	43
6019	วัดธาตุ	เมืองหนองคาย	43000	430106	4301	43
6020	สองห้อง	เมืองหนองคาย	43100	430111	4301	43
6021	สีกาย	เมืองหนองคาย	43000	430119	4301	43
6022	หนองกอมเกาะ	เมืองหนองคาย	43000	430116	4301	43
6023	หาดคำ	เมืองหนองคาย	43000	430107	4301	43
6024	หินโงม	เมืองหนองคาย	43000	430108	4301	43
6025	เมืองหมี	เมืองหนองคาย	43000	430118	4301	43
6026	เวียงคุก	เมืองหนองคาย	43000	430105	4301	43
6027	โพธิ์ชัย	เมืองหนองคาย	43000	430103	4301	43
6028	ในเมือง	เมืองหนองคาย	43000	430101	4301	43
6029	ด่านศรีสุข	โพธิ์ตาก	43130	430707	4317	43
6030	โพธิ์ตาก	โพธิ์ตาก	43130	430702	4317	43
6031	โพนทอง	โพธิ์ตาก	43130	430706	4317	43
6032	กุดบง	โพนพิสัย	43120	430503	4305	43
6033	จุมพล	โพนพิสัย	43120	430501	4305	43
6034	ชุมช้าง	โพนพิสัย	43120	430504	4305	43
6035	ทุ่งหลวง	โพนพิสัย	43120	430506	4305	43
6036	นาหนัง	โพนพิสัย	43120	430508	4305	43
6037	บ้านผือ	โพนพิสัย	43120	430521	4305	43
6038	บ้านโพธิ์	โพนพิสัย	43120	430513	4305	43
6039	วัดหลวง	โพนพิสัย	43120	430502	4305	43
6040	สร้างนางขาว	โพนพิสัย	43120	430522	4305	43
6041	เซิม	โพนพิสัย	43120	430509	4305	43
6042	เหล่าต่างคำ	โพนพิสัย	43120	430507	4305	43
6043	กุดดินจี่	นากลาง	39350	390205	3902	39
6044	กุดแห่	นากลาง	39170	390213	3902	39
6045	ดงสวรรค์	นากลาง	39350	390211	3902	39
6046	ด่านช้าง	นากลาง	39170	390202	3902	39
6047	นากลาง	นากลาง	39170	390201	3902	39
6048	ฝั่งแดง	นากลาง	39170	390206	3902	39
6049	อุทัยสวรรค์	นากลาง	39170	390210	3902	39
6050	เก่ากลอย	นากลาง	39350	390207	3902	39
6051	โนนเมือง	นากลาง	39170	390209	3902	39
6052	นาเหล่า	นาวัง	39170	390203	3906	39
6053	นาแก	นาวัง	39170	390204	3906	39
6054	วังทอง	นาวัง	39170	390208	3906	39
6055	วังปลาป้อม	นาวัง	39170	390212	3906	39
6056	เทพคีรี	นาวัง	39170	390214	3906	39
6057	กุดสะเทียน	ศรีบุญเรือง	39180	390404	3904	39
6058	ทรายทอง	ศรีบุญเรือง	39180	390411	3904	39
6059	นากอก	ศรีบุญเรือง	39180	390405	3904	39
6060	ยางหล่อ	ศรีบุญเรือง	39180	390407	3904	39
6061	ศรีบุญเรือง	ศรีบุญเรือง	39180	390402	3904	39
6062	หนองกุงแก้ว	ศรีบุญเรือง	39180	390409	3904	39
6063	หนองบัวใต้	ศรีบุญเรือง	39180	390403	3904	39
6064	หนองแก	ศรีบุญเรือง	39180	390410	3904	39
6065	หันนางาม	ศรีบุญเรือง	39180	390412	3904	39
6066	เมืองใหม่	ศรีบุญเรือง	39180	390401	3904	39
6067	โนนม่วง	ศรีบุญเรือง	39180	390408	3904	39
6068	โนนสะอาด	ศรีบุญเรือง	39180	390406	3904	39
6069	กุดผึ้ง	สุวรรณคูหา	39270	390508	3905	39
6070	ดงมะไฟ	สุวรรณคูหา	39270	390505	3905	39
6071	นาดี	สุวรรณคูหา	39270	390296	3905	39
6072	นาด่าน	สุวรรณคูหา	39270	390504	3905	39
6073	นาสี	สุวรรณคูหา	39270	390297	3905	39
6074	บุญทัน	สุวรรณคูหา	39270	390507	3905	39
6075	บ้านโคก	สุวรรณคูหา	39270	390298	3905	39
6076	สุวรรณคูหา	สุวรรณคูหา	39270	390506	3905	39
6077	กุดจิก	เมืองหนองบัวลำภู	39000	390111	3901	39
6078	นาคำไฮ	เมืองหนองบัวลำภู	39000	390113	3901	39
6079	นามะเฟือง	เมืองหนองบัวลำภู	39000	390107	3901	39
6080	บ้านขาม	เมืองหนองบัวลำภู	39000	390106	3901	39
6081	บ้านพร้าว	เมืองหนองบัวลำภู	39000	390108	3901	39
6082	ป่าไม้งาม	เมืองหนองบัวลำภู	39000	390114	3901	39
6083	ลำภู	เมืองหนองบัวลำภู	39000	390110	3901	39
6084	หนองบัว	เมืองหนองบัวลำภู	39000	390101	3901	39
6085	หนองภัยศูนย์	เมืองหนองบัวลำภู	39000	390102	3901	39
6086	หนองสวรรค์	เมืองหนองบัวลำภู	39000	390104	3901	39
6087	หนองหว้า	เมืองหนองบัวลำภู	39000	390115	3901	39
6088	หัวนา	เมืองหนองบัวลำภู	39000	390105	3901	39
6089	โนนขมิ้น	เมืองหนองบัวลำภู	39000	390109	3901	39
6090	โนนทัน	เมืองหนองบัวลำภู	39000	390112	3901	39
6091	โพธิ์ชัย	เมืองหนองบัวลำภู	39000	390103	3901	39
6092	กุดดู่	โนนสัง	39140	390304	3903	39
6093	นิคมพัฒนา	โนนสัง	39140	390309	3903	39
6094	บ้านค้อ	โนนสัง	39140	390305	3903	39
6095	บ้านถิ่น	โนนสัง	39140	390302	3903	39
6096	ปางกู่	โนนสัง	39140	390310	3903	39
6097	หนองเรือ	โนนสัง	39140	390303	3903	39
6098	โคกม่วง	โนนสัง	39140	390308	3903	39
6099	โคกใหญ่	โนนสัง	39140	390307	3903	39
6100	โนนสัง	โนนสัง	39140	390301	3903	39
6101	โนนเมือง	โนนสัง	39140	390209	3903	39
6102	คำเขื่อนแก้ว	ชานุมาน	37210	370203	3702	37
6103	ชานุมาน	ชานุมาน	37210	370201	3702	37
6104	ป่าก่อ	ชานุมาน	37210	370205	3702	37
6105	โคกก่ง	ชานุมาน	37210	370204	3702	37
6106	โคกสาร	ชานุมาน	37210	370202	3702	37
6107	คำโพน	ปทุมราชวงศา	37110	370302	3703	37
6108	นาป่าแซง	ปทุมราชวงศา	37110	370307	3703	37
6109	นาหว้า	ปทุมราชวงศา	37110	370303	3703	37
6110	ลือ	ปทุมราชวงศา	37110	370304	3703	37
6111	หนองข่า	ปทุมราชวงศา	37110	370299	3703	37
6112	ห้วย	ปทุมราชวงศา	37110	370305	3703	37
6113	โนนงาม	ปทุมราชวงศา	37110	370306	3703	37
6114	จานลาน	พนา	37180	370402	3704	37
6115	พนา	พนา	37180	370401	3704	37
6116	พระเหลา	พนา	37180	370404	3704	37
6117	ไม้กลอน	พนา	37180	370403	3704	37
6118	ดงบัง	ลืออำนาจ	37120	370199	3707	37
6119	ดงมะยาง	ลืออำนาจ	37120	370191	3707	37
6120	อำนาจ	ลืออำนาจ	37120	370198	3707	37
6121	เปือย	ลืออำนาจ	37120	370192	3707	37
6122	แมด	ลืออำนาจ	37120	370706	3707	37
6123	โคกกลาง	ลืออำนาจ	37120	370707	3707	37
6124	ไร่ขี	ลืออำนาจ	37120	370195	3707	37
6125	คำพระ	หัวตะพาน	37240	370602	3706	37
6126	จิกดู่	หัวตะพาน	37240	370607	3706	37
6127	รัตนวารี	หัวตะพาน	37240	370608	3706	37
6128	สร้างถ่อน้อย	หัวตะพาน	37240	370606	3706	37
6129	หนองแก้ว	หัวตะพาน	37240	370604	3706	37
6130	หัวตะพาน	หัวตะพาน	37240	370601	3706	37
6131	เค็งใหญ่	หัวตะพาน	37240	370603	3706	37
6132	โพนเมืองน้อย	หัวตะพาน	37240	370605	3706	37
6133	กุดปลาดุก	เมืองอำนาจเจริญ	37000	370116	3701	37
6134	คึมใหญ่	เมืองอำนาจเจริญ	37000	370107	3701	37
6135	ดอนเมย	เมืองอำนาจเจริญ	37000	370117	3701	37
6136	นาจิก	เมืองอำนาจเจริญ	37000	370103	3701	37
6137	นาผือ	เมืองอำนาจเจริญ	37000	370108	3701	37
6138	นายม	เมืองอำนาจเจริญ	37000	370118	3701	37
6139	นาวัง	เมืองอำนาจเจริญ	37000	370110	3701	37
6140	นาหมอม้า	เมืองอำนาจเจริญ	37000	370111	3701	37
6141	นาแต้	เมืองอำนาจเจริญ	37000	370119	3701	37
6142	น้ำปลีก	เมืองอำนาจเจริญ	37000	370109	3701	37
6143	บุ่ง	เมืองอำนาจเจริญ	37000	370101	3701	37
6144	ปลาค้าว	เมืองอำนาจเจริญ	37000	370104	3701	37
6145	สร้างนกทา	เมืองอำนาจเจริญ	37000	370106	3701	37
6146	หนองมะแซว	เมืองอำนาจเจริญ	37000	370115	3701	37
6147	ห้วยไร่	เมืองอำนาจเจริญ	37000	370114	3701	37
6148	เหล่าพรวน	เมืองอำนาจเจริญ	37000	370105	3701	37
6149	โนนหนามแท่ง	เมืองอำนาจเจริญ	37000	370113	3701	37
6150	โนนโพธิ์	เมืองอำนาจเจริญ	37000	370112	3701	37
6151	ไก่คำ	เมืองอำนาจเจริญ	37000	370102	3701	37
6152	นาเวียง	เสนางคนิคม	37290	370194	3705	37
6153	หนองสามสี	เสนางคนิคม	37290	370506	3705	37
6154	หนองไฮ	เสนางคนิคม	37290	370193	3705	37
6155	เสนางคนิคม	เสนางคนิคม	37290	370197	3705	37
6156	โพนทอง	เสนางคนิคม	37290	370190	3705	37
6157	ไร่สีสุก	เสนางคนิคม	37290	370196	3705	37
6158	กุดจับ	กุดจับ	41250	410198	4102	41
6159	ขอนยูง	กุดจับ	41250	410190	4102	41
6160	ตาลเลียน	กุดจับ	41250	410207	4102	41
6161	ปะโค	กุดจับ	41250	410191	4102	41
6162	สร้างก่อ	กุดจับ	41250	410205	4102	41
6163	เชียงเพ็ง	กุดจับ	41250	410197	4102	41
6164	เมืองเพีย	กุดจับ	41250	410206	4102	41
6165	กุมภวาปี	กุมภวาปี	41110	410415	4104	41
6166	ตูมใต้	กุมภวาปี	41110	410401	4104	41
6167	ท่าลี่	กุมภวาปี	41110	410414	4104	41
6168	ปะโค	กุมภวาปี	41370	410191	4104	41
6169	ผาสุก	กุมภวาปี	41370	410413	4104	41
6170	พันดอน	กุมภวาปี	41370	410402	4104	41
6171	สีออ	กุมภวาปี	41110	410410	4104	41
6172	หนองหว้า	กุมภวาปี	41110	410194	4104	41
6173	ห้วยเกิ้ง	กุมภวาปี	41110	410407	4104	41
6174	เชียงแหว	กุมภวาปี	41110	410406	4104	41
6175	เวียงคำ	กุมภวาปี	41110	410403	4104	41
6176	เสอเพลอ	กุมภวาปี	41370	410409	4104	41
6177	แชแล	กุมภวาปี	41110	410404	4104	41
6178	คอนสาย	กู่แก้ว	41130	410603	4124	41
6179	ค้อใหญ่	กู่แก้ว	41130	410616	4124	41
6180	บ้านจีต	กู่แก้ว	41130	410604	4124	41
6181	โนนทองอินทร์	กู่แก้ว	41130	410619	4124	41
6182	ทุ่งฝน	ทุ่งฝน	41310	410697	4107	41
6183	ทุ่งใหญ่	ทุ่งฝน	41310	410696	4107	41
6184	นาชุมแสง	ทุ่งฝน	41310	410703	4107	41
6185	นาทม	ทุ่งฝน	41310	410704	4107	41
6186	นายูง	นายูง	41380	410906	4122	41
6187	นาแค	นายูง	41380	411804	4122	41
6188	บ้านก้อง	นายูง	41380	411809	4122	41
6189	โนนทอง	นายูง	41380	411705	4122	41
6190	นางัว	น้ำโสม	41210	411801	4118	41
6191	น้ำโสม	น้ำโสม	41210	411802	4118	41
6192	บ้านหยวก	น้ำโสม	41210	411806	4118	41
6193	ศรีสำราญ	น้ำโสม	41210	411810	4118	41
6194	สามัคคี	น้ำโสม	41210	411812	4118	41
6195	หนองแวง	น้ำโสม	41210	411713	4118	41
6196	โสมเยี่ยม	น้ำโสม	41210	411807	4118	41
6197	ดงเย็น	บ้านดุง	41190	411103	4111	41
6198	ถ่อนนาลับ	บ้านดุง	41190	411109	4111	41
6199	นาคำ	บ้านดุง	41190	411113	4111	41
6200	นาไหม	บ้านดุง	41190	411108	4111	41
6201	บ้านจันทร์	บ้านดุง	41190	false	4111	41
6202	บ้านชัย	บ้านดุง	41190	411107	4111	41
6203	บ้านดุง	บ้านดุง	41190	411102	4111	41
6204	บ้านตาด	บ้านดุง	41190	410105	4111	41
6205	บ้านม่วง	บ้านดุง	41190	411111	4111	41
6206	วังทอง	บ้านดุง	41190	411110	4111	41
6207	ศรีสุทโธ	บ้านดุง	41190	411101	4111	41
6208	อ้อมกอ	บ้านดุง	41190	411105	4111	41
6209	โพนสูง	บ้านดุง	41190	410698	4111	41
6210	กลางใหญ่	บ้านผือ	41160	411708	4117	41
6211	ข้าวสาร	บ้านผือ	41160	411706	4117	41
6212	คำด้วง	บ้านผือ	41160	411710	4117	41
6213	คำบง	บ้านผือ	41160	411704	4117	41
6214	จำปาโมง	บ้านผือ	41160	411707	4117	41
6215	บ้านค้อ	บ้านผือ	41160	411605	4117	41
6216	บ้านผือ	บ้านผือ	41160	411701	4117	41
6217	หนองหัวคู	บ้านผือ	41160	411711	4117	41
6218	หนองแวง	บ้านผือ	41160	411713	4117	41
6219	หายโศก	บ้านผือ	41160	411702	4117	41
6220	เขือน้ำ	บ้านผือ	41160	411703	4117	41
6221	เมืองพาน	บ้านผือ	41160	411709	4117	41
6222	โนนทอง	บ้านผือ	41160	411705	4117	41
6223	นาม่วง	ประจักษ์ศิลปาคม	41110	410412	4125	41
6224	ห้วยสามพาด	ประจักษ์ศิลปาคม	41110	410408	4125	41
6225	อุ่มจาน	ประจักษ์ศิลปาคม	41110	410405	4125	41
6226	ดอนกลอย	พิบูลย์รักษ์	41130	410613	4123	41
6227	นาทราย	พิบูลย์รักษ์	41130	410615	4123	41
6228	บ้านแดง	พิบูลย์รักษ์	41130	410608	4123	41
6229	คำโคกสูง	วังสามหมอ	41280	411005	4110	41
6230	บะยาว	วังสามหมอ	41280	411003	4110	41
6231	ผาสุก	วังสามหมอ	41280	410413	4110	41
6232	วังสามหมอ	วังสามหมอ	41280	411006	4110	41
6233	หนองกุงทับม้า	วังสามหมอ	41280	411001	4110	41
6234	หนองหญ้าไซ	วังสามหมอ	41280	411002	4110	41
6235	จำปี	ศรีธาตุ	41230	410902	4109	41
6236	ตาดทอง	ศรีธาตุ	41230	410907	4109	41
6237	นายูง	ศรีธาตุ	41230	410906	4109	41
6238	บ้านโปร่ง	ศรีธาตุ	41230	410903	4109	41
6239	ศรีธาตุ	ศรีธาตุ	41230	410901	4109	41
6240	หนองนกเขียน	ศรีธาตุ	41230	410905	4109	41
6241	หัวนาคำ	ศรีธาตุ	41230	410904	4109	41
6242	นาสะอาด	สร้างคอม	41260	412005	4120	41
6243	บ้านยวด	สร้างคอม	41260	411998	4120	41
6244	บ้านหินโงม	สร้างคอม	41260	412006	4120	41
6245	บ้านโคก	สร้างคอม	41260	411498	4120	41
6246	สร้างคอม	สร้างคอม	41260	411999	4120	41
6247	เชียงดา	สร้างคอม	41260	411997	4120	41
6248	กุดหมากไฟ	หนองวัวซอ	41220	410304	4103	41
6249	น้ำพ่น	หนองวัวซอ	41360	410305	4103	41
6250	หนองบัวบาน	หนองวัวซอ	41360	410306	4103	41
6251	หนองวัวซอ	หนองวัวซอ	41360	410308	4103	41
6252	หนองอ้อ	หนองวัวซอ	41220	410302	4103	41
6253	หมากหญ้า	หนองวัวซอ	41360	410301	4103	41
6254	อูบมุง	หนองวัวซอ	41220	410303	4103	41
6255	โนนหวาย	หนองวัวซอ	41220	410307	4103	41
6256	ดอนหายโศก	หนองหาน	41130	410617	4106	41
6257	บ้านยา	หนองหาน	41320	410610	4106	41
6258	บ้านเชียง	หนองหาน	41320	410609	4106	41
6259	ผักตบ	หนองหาน	41130	410612	4106	41
6260	พังงู	หนองหาน	41130	410605	4106	41
6261	สร้อยพร้าว	หนองหาน	41130	410607	4106	41
6262	สะแบง	หนองหาน	41130	410606	4106	41
6263	หนองสระปลา	หนองหาน	41320	410618	4106	41
6264	หนองหาน	หนองหาน	41130	410601	4106	41
6265	หนองเม็ก	หนองหาน	41130	410602	4106	41
6266	หนองไผ่	หนองหาน	41130	410121	4106	41
6267	โพนงาม	หนองหาน	41130	410611	4106	41
6268	ทับกุง	หนองแสง	41340	412104	4121	41
6269	นาดี	หนองแสง	41340	410111	4121	41
6270	หนองแสง	หนองแสง	41340	410498	4121	41
6271	แสงสว่าง	หนองแสง	41340	410499	4121	41
6272	จอมศรี	เพ็ญ	41150	411908	4119	41
6273	นาบัว	เพ็ญ	41150	411906	4119	41
6274	นาพู่	เพ็ญ	41150	411903	4119	41
6275	บ้านธาตุ	เพ็ญ	41150	411902	4119	41
6276	บ้านเหล่า	เพ็ญ	41150	411907	4119	41
6277	สร้างแป้น	เพ็ญ	41150	411911	4119	41
6278	สุมเส้า	เพ็ญ	41150	411905	4119	41
6279	เชียงหวาง	เพ็ญ	41150	411904	4119	41
6280	เตาไห	เพ็ญ	41150	411909	4119	41
6281	เพ็ญ	เพ็ญ	41150	411901	4119	41
6282	โคกกลาง	เพ็ญ	41150	410506	4119	41
6283	กุดสระ	เมืองอุดรธานี	41000	410110	4101	41
6284	นากว้าง	เมืองอุดรธานี	41000	410120	4101	41
6285	นาข่า	เมืองอุดรธานี	41000	410116	4101	41
6286	นาดี	เมืองอุดรธานี	41000	410111	4101	41
6287	นิคมสงเคราะห์	เมืองอุดรธานี	41000	410102	4101	41
6288	บ้านขาว	เมืองอุดรธานี	41000	410103	4101	41
6289	บ้านจั่น	เมืองอุดรธานี	41000	410117	4101	41
6290	บ้านตาด	เมืองอุดรธานี	41000	410105	4101	41
6291	บ้านเลื่อม	เมืองอุดรธานี	41000	410112	4101	41
6292	สามพร้าว	เมืองอุดรธานี	41000	410114	4101	41
6293	หนองขอนกว้าง	เมืองอุดรธานี	41000	410118	4101	41
6294	หนองนาคำ	เมืองอุดรธานี	41000	410109	4101	41
6295	หนองบัว	เมืองอุดรธานี	41000	410104	4101	41
6296	หนองไผ่	เมืองอุดรธานี	41330	410121	4101	41
6297	หนองไฮ	เมืองอุดรธานี	41000	410115	4101	41
6298	หมากแข้ง	เมืองอุดรธานี	41000	410101	4101	41
6299	หมูม่น	เมืองอุดรธานี	41000	410107	4101	41
6300	เชียงพิณ	เมืองอุดรธานี	41000	410113	4101	41
6301	เชียงยืน	เมืองอุดรธานี	41000	410108	4101	41
6302	โคกสะอาด	เมืองอุดรธานี	41000	410119	4101	41
6303	โนนสูง	เมืองอุดรธานี	41330	410106	4101	41
6304	ทมนางาม	โนนสะอาด	41240	410504	4105	41
6305	บุ่งแก้ว	โนนสะอาด	41240	410497	4105	41
6306	หนองกุงศรี	โนนสะอาด	41240	410505	4105	41
6307	โคกกลาง	โนนสะอาด	41240	410506	4105	41
6308	โนนสะอาด	โนนสะอาด	41240	410495	4105	41
6309	โพธิ์ศรีสำราญ	โนนสะอาด	41240	410496	4105	41
6310	คำเลาะ	ไชยวาน	41290	410803	4108	41
6311	หนองหลัก	ไชยวาน	41290	410694	4108	41
6312	โพนสูง	ไชยวาน	41290	410698	4108	41
6313	ไชยวาน	ไชยวาน	41290	410699	4108	41
6314	ข่อยสูง	ตรอน	53140	530205	5302	53
6315	น้ำอ่าง	ตรอน	53140	530204	5302	53
6316	บ้านแก่ง	ตรอน	53140	530202	5302	53
6317	วังแดง	ตรอน	53140	530201	5302	53
6318	หาดสองแคว	ตรอน	53140	530203	5302	53
6319	น้ำพี้	ทองแสนขัน	53230	530296	5309	53
6320	บ่อทอง	ทองแสนขัน	53230	530297	5309	53
6321	ป่าคาย	ทองแสนขัน	53230	530299	5309	53
6322	ผักขวง	ทองแสนขัน	53230	530298	5309	53
6323	จริม	ท่าปลา	53150	530304	5303	53
6324	ท่าปลา	ท่าปลา	53150	530301	5303	53
6325	ท่าแฝก	น้ำปาด	53110	530306	5303	53
6326	นางพญา	ท่าปลา	53150	530307	5303	53
6327	น้ำหมัน	ท่าปลา	53150	530305	5303	53
6328	ผาเลือด	ท่าปลา	53190	530303	5303	53
6329	ร่วมจิต	ท่าปลา	53190	530308	5303	53
6330	หาดล้า	ท่าปลา	53190	530302	5303	53
6331	น้ำไคร้	น้ำปาด	53110	530404	5304	53
6332	น้ำไผ่	น้ำปาด	53110	530405	5304	53
6333	บ้านฝาย	น้ำปาด	53110	530402	5304	53
6334	ห้วยมุ่น	น้ำปาด	53110	530406	5304	53
6335	เด่นเหล็ก	น้ำปาด	53110	530403	5304	53
6336	แสนตอ	น้ำปาด	53110	530114	5304	53
6337	นาขุม	บ้านโคก	53180	530603	5306	53
6338	บ่อเบี้ย	บ้านโคก	53180	530604	5306	53
6339	บ้านโคก	บ้านโคก	53180	530602	5306	53
6340	ม่วงเจ็ดต้น	บ้านโคก	53180	530601	5306	53
6341	คอรุม	พิชัย	53120	530705	5307	53
6342	ท่ามะเฟือง	พิชัย	53120	530707	5307	53
6343	ท่าสัก	พิชัย	53220	530704	5307	53
6344	นายาง	พิชัย	53120	530711	5307	53
6345	นาอิน	พิชัย	53120	530710	5307	53
6346	บ้านดารา	พิชัย	53220	530702	5307	53
6347	บ้านหม้อ	พิชัย	53120	530706	5307	53
6348	บ้านโคน	พิชัย	53120	530708	5307	53
6349	พญาแมน	พิชัย	53120	530709	5307	53
6350	ในเมือง	พิชัย	53120	530701	5307	53
6351	ไร่อ้อย	พิชัย	53120	530703	5307	53
6352	บ้านเสี้ยว	ฟากท่า	53160	530503	5305	53
6353	ฟากท่า	ฟากท่า	53160	530501	5305	53
6354	สองคอน	ฟากท่า	53160	530502	5305	53
6355	สองห้อง	ฟากท่า	53160	530504	5305	53
6356	ชัยจุมพล	ลับแล	53130	530805	5308	53
6357	ด่านแม่คำมัน	ลับแล	53210	530808	5308	53
6358	ทุ่งยั้ง	ลับแล	53210	530807	5308	53
6359	นานกกก	ลับแล	53130	530803	5308	53
6360	ฝายหลวง	ลับแล	53130	530804	5308	53
6361	ศรีพนมมาศ	ลับแล	53130	530801	5308	53
6362	แม่พูล	ลับแล	53130	530802	5308	53
6363	ไผ่ล้อม	ลับแล	53210	530806	5308	53
6364	ขุนฝาง	เมืองอุตรดิตถ์	53000	530116	5301	53
6365	คุ้งตะเภา	เมืองอุตรดิตถ์	53000	530105	5301	53
6366	งิ้วงาม	เมืองอุตรดิตถ์	53000	530109	5301	53
6367	ถ้ำฉลอง	เมืองอุตรดิตถ์	53000	530117	5301	53
6368	ท่าอิฐ	เมืองอุตรดิตถ์	53000	530101	5301	53
6369	ท่าเสา	เมืองอุตรดิตถ์	53000	530102	5301	53
6370	น้ำริด	เมืองอุตรดิตถ์	53000	530108	5301	53
6371	บ้านด่าน	เมืองอุตรดิตถ์	53000	530111	5301	53
6372	บ้านด่านนาขาม	เมืองอุตรดิตถ์	53000	530110	5301	53
6373	บ้านเกาะ	เมืองอุตรดิตถ์	53000	530103	5301	53
6374	ป่าเซ่า	เมืองอุตรดิตถ์	53000	530104	5301	53
6375	ผาจุก	เมืองอุตรดิตถ์	53000	530112	5301	53
6376	วังกะพี้	เมืองอุตรดิตถ์	53170	530106	5301	53
6377	วังดิน	เมืองอุตรดิตถ์	53000	530113	5301	53
6378	หาดกรวด	เมืองอุตรดิตถ์	53000	530107	5301	53
6379	หาดงิ้ว	เมืองอุตรดิตถ์	53000	530115	5301	53
6380	แสนตอ	เมืองอุตรดิตถ์	53000	530114	5301	53
6381	ตลุกดู่	ทัพทัน	61120	610210	6102	61
6382	ทัพทัน	ทัพทัน	61120	610201	6102	61
6383	ทุ่งนาไทย	ทัพทัน	61120	610202	6102	61
6384	หนองกระทุ่ม	ทัพทัน	61120	610208	6102	61
6385	หนองกลางดง	ทัพทัน	61120	610207	6102	61
6386	หนองยายดา	ทัพทัน	61120	610206	6102	61
6387	หนองสระ	ทัพทัน	61120	610209	6102	61
6388	หนองหญ้าปล้อง	ทัพทัน	61120	610204	6102	61
6389	เขาขี้ฝอย	ทัพทัน	61120	610203	6102	61
6390	โคกหม้อ	ทัพทัน	61120	610205	6102	61
6391	คอกควาย	บ้านไร่	61140	610604	6106	61
6392	ทัพหลวง	บ้านไร่	61140	610602	6106	61
6393	บ้านบึง	บ้านไร่	61140	610611	6106	61
6394	บ้านใหม่คลองเคียน	บ้านไร่	61180	610612	6106	61
6395	บ้านไร่	บ้านไร่	61140	610601	6106	61
6396	วังหิน	บ้านไร่	61180	610605	6106	61
6397	หนองจอก	บ้านไร่	61180	610609	6106	61
6398	หนองบ่มกล้วย	บ้านไร่	61180	610613	6106	61
6399	หูช้าง	บ้านไร่	61180	610610	6106	61
6400	ห้วยแห้ง	บ้านไร่	61140	610603	6106	61
6401	เจ้าวัด	บ้านไร่	61150	610614	6106	61
6402	เมืองการุ้ง	บ้านไร่	61180	610606	6106	61
6403	แก่นมะกรูด	บ้านไร่	61140	610607	6106	61
6404	ทุ่งนางาม	ลานสัก	61160	610706	6107	61
6405	น้ำรอบ	ลานสัก	61160	610705	6107	61
6406	ประดู่ยืน	ลานสัก	61160	610698	6107	61
6407	ป่าอ้อ	ลานสัก	61160	610697	6107	61
6408	ระบำ	ลานสัก	61160	610704	6107	61
6409	ลานสัก	ลานสัก	61160	610699	6107	61
6410	บ่อยาง	สว่างอารมณ์	61150	610305	6103	61
6411	พลวงสองนาง	สว่างอารมณ์	61150	610303	6103	61
6412	สว่างอารมณ์	สว่างอารมณ์	61150	610301	6103	61
6413	หนองหลวง	สว่างอารมณ์	61150	610302	6103	61
6414	ไผ่เขียว	สว่างอารมณ์	61150	610304	6103	61
6415	ดงขวาง	หนองขาหย่าง	61130	610509	6105	61
6416	ดอนกลอย	หนองขาหย่าง	61130	610503	6105	61
6417	ทุ่งพึ่ง	หนองขาหย่าง	61130	610505	6105	61
6418	ท่าโพ	หนองขาหย่าง	61130	610506	6105	61
6419	หนองขาหย่าง	หนองขาหย่าง	61130	610501	6105	61
6420	หนองไผ่	หนองขาหย่าง	61130	610502	6105	61
6421	หมกแถว	หนองขาหย่าง	61130	610507	6105	61
6422	หลุมเข้า	หนองขาหย่าง	61130	610508	6105	61
6423	ห้วยรอบ	หนองขาหย่าง	61130	610504	6105	61
6424	ทุ่งพง	หนองฉาง	61110	610408	6104	61
6425	ทุ่งโพ	หนองฉาง	61110	610407	6104	61
6426	บ้านเก่า	หนองฉาง	61110	610405	6104	61
6427	หนองฉาง	หนองฉาง	61110	610401	6104	61
6428	หนองนางนวล	หนองฉาง	61110	610403	6104	61
6429	หนองยาง	หนองฉาง	61110	610402	6104	61
6430	หนองสรวง	หนองฉาง	61110	610404	6104	61
6431	อุทัยเก่า	หนองฉาง	61110	610406	6104	61
6432	เขากวางทอง	หนองฉาง	61110	610410	6104	61
6433	เขาบางแกรก	หนองฉาง	61170	610409	6104	61
6434	ทองหลาง	ห้วยคต	61170	610802	6108	61
6435	สุขฤทัย	ห้วยคต	61170	610696	6108	61
6436	ห้วยคต	ห้วยคต	61170	610695	6108	61
6437	ดอนขวาง	เมืองอุทัยธานี	61000	610104	6101	61
6438	ทุ่งใหญ่	เมืองอุทัยธานี	61000	610113	6101	61
6439	ท่าซุง	เมืองอุทัยธานี	61000	610107	6101	61
6440	น้ำซึม	เมืองอุทัยธานี	61000	610102	6101	61
6441	สะแกกรัง	เมืองอุทัยธานี	61000	610103	6101	61
6442	หนองพังค่า	เมืองอุทัยธานี	61000	610112	6101	61
6443	หนองเต่า	เมืองอุทัยธานี	61000	610110	6101	61
6444	หนองแก	เมืองอุทัยธานี	61000	610108	6101	61
6445	หนองไผ่แบน	เมืองอุทัยธานี	61000	610111	6101	61
6446	หาดทนง	เมืองอุทัยธานี	61000	610105	6101	61
6447	อุทัยใหม่	เมืองอุทัยธานี	61000	610101	6101	61
6448	เกาะเทโพ	เมืองอุทัยธานี	61000	610106	6101	61
6449	เนินแจง	เมืองอุทัยธานี	61000	610114	6101	61
6450	โนนเหล็ก	เมืองอุทัยธานี	61000	610109	6101	61
6451	กาบิน	กุดข้าวปุ้น	34270	341204	3412	34
6452	ข้าวปุ้น	กุดข้าวปุ้น	34270	341201	3412	34
6453	หนองทันน้ำ	กุดข้าวปุ้น	34270	341205	3412	34
6454	แก่งเค็ง	กุดข้าวปุ้น	34270	341203	3412	34
6455	โนนสวาง	กุดข้าวปุ้น	34270	341202	3412	34
6456	คำไฮใหญ่	ดอนมดแดง	34000	340110	3424	34
6457	ดอนมดแดง	ดอนมดแดง	34000	340106	3424	34
6458	ท่าเมือง	ดอนมดแดง	34000	340103	3424	34
6459	เหล่าแดง	ดอนมดแดง	34000	340114	3424	34
6460	กระเดียน	ตระการพืชผล	34130	341102	3411	34
6461	กุดยาลวน	ตระการพืชผล	34130	341121	3411	34
6462	กุศกร	ตระการพืชผล	34130	341104	3411	34
6463	ขามเปี้ย	ตระการพืชผล	34130	341105	3411	34
6464	ขุหลุ	ตระการพืชผล	34130	341101	3411	34
6465	คอนสาย	ตระการพืชผล	34130	341106	3411	34
6466	คำเจริญ	ตระการพืชผล	34130	341123	3411	34
6467	ตระการ	ตระการพืชผล	34130	341111	3411	34
6468	ตากแดด	ตระการพืชผล	34130	341112	3411	34
6469	ถ้ำแข้	ตระการพืชผล	34130	341118	3411	34
6470	ท่าหลวง	ตระการพืชผล	34130	341119	3411	34
6471	นาพิน	ตระการพืชผล	34130	341108	3411	34
6472	นาสะไม	ตระการพืชผล	34130	341109	3411	34
6473	บ้านแดง	ตระการพืชผล	34130	341122	3411	34
6474	สะพือ	ตระการพืชผล	34130	341116	3411	34
6475	หนองเต่า	ตระการพืชผล	34130	341117	3411	34
6476	ห้วยฝ้ายพัฒนา	ตระการพืชผล	34130	341120	3411	34
6477	เกษม	ตระการพืชผล	34130	341103	3411	34
6478	เซเป็ด	ตระการพืชผล	34130	341115	3411	34
6479	เป้า	ตระการพืชผล	34130	341114	3411	34
6480	โคกจาน	ตระการพืชผล	34130	341107	3411	34
6481	โนนกุง	ตระการพืชผล	34130	341110	3411	34
6482	ไหล่ทุ่ง	ตระการพืชผล	34130	341113	3411	34
6483	คำหว้า	ตาลสุม	34330	342006	3420	34
6484	จิกเทิง	ตาลสุม	34330	342003	3420	34
6485	ตาลสุม	ตาลสุม	34330	342001	3420	34
6486	นาคาย	ตาลสุม	34330	342005	3420	34
6487	สำโรง	ตาลสุม	34330	341513	3420	34
6488	หนองกุง	ตาลสุม	34330	342004	3420	34
6489	กุดเรือ	ทุ่งศรีอุดม	34160	340718	3426	34
6490	นาห่อม	ทุ่งศรีอุดม	34160	342606	3426	34
6491	นาเกษม	ทุ่งศรีอุดม	34160	340714	3426	34
6492	หนองอ้ม	ทุ่งศรีอุดม	34160	340707	3426	34
6493	โคกชำแระ	ทุ่งศรีอุดม	34160	340722	3426	34
6494	นาจะหลวย	นาจะหลวย	34280	340801	3408	34
6495	บ้านตูม	นาจะหลวย	34280	340804	3408	34
6496	พรสวรรค์	นาจะหลวย	34280	340803	3408	34
6497	โนนสมบูรณ์	นาจะหลวย	34280	340723	3408	34
6498	โนนสวรรค์	นาจะหลวย	34280	340806	3408	34
6499	โสกแสง	นาจะหลวย	34280	340805	3408	34
6500	กองโพน	นาตาล	34170	340502	3430	34
6501	นาตาล	นาตาล	34170	340506	3430	34
6502	พะลาน	นาตาล	34170	340509	3430	34
6503	พังเคน	นาตาล	34170	340505	3430	34
6504	นาดี	นาเยีย	34160	340719	3429	34
6505	นาเยีย	นาเยีย	34160	340703	3429	34
6506	นาเรือง	นาเยีย	34160	340705	3429	34
6507	ขี้เหล็ก	น้ำขุ่น	34260	340119	3433	34
6508	ตาเกา	น้ำขุ่น	34260	340902	3433	34
6509	โคกสะอาด	น้ำขุ่น	34260	340910	3433	34
6510	ไพบูลย์	น้ำขุ่น	34260	340908	3433	34
6511	บุเปือย	น้ำยืน	34260	340906	3409	34
6512	ยาง	น้ำยืน	34260	340903	3409	34
6513	ยางใหญ่	น้ำยืน	34260	340909	3409	34
6514	สีวิเชียร	น้ำยืน	34260	340907	3409	34
6515	เก่าขาม	น้ำยืน	34260	340911	3409	34
6516	โซง	น้ำยืน	34260	340901	3409	34
6517	โดมประดิษฐ์	น้ำยืน	34260	340904	3409	34
6518	คอแลน	บุณฑริก	34230	341003	3410	34
6519	นาโพธิ์	บุณฑริก	34230	341004	3410	34
6520	บัวงาม	บุณฑริก	34230	340715	3410	34
6521	บ้านแมด	บุณฑริก	34230	341008	3410	34
6522	หนองสะโน	บุณฑริก	34230	341005	3410	34
6523	ห้วยข่า	บุณฑริก	34230	341002	3410	34
6524	โนนค้อ	บุณฑริก	34230	341006	3410	34
6525	โพนงาม	บุณฑริก	34230	340720	3410	34
6526	กุดชมภู	พิบูลมังสาหาร	34110	341902	3419	34
6527	ดอนจิก	พิบูลมังสาหาร	34110	341904	3419	34
6528	ทรายมูล	พิบูลมังสาหาร	34110	341905	3419	34
6529	นาโพธิ์	พิบูลมังสาหาร	34110	341004	3419	34
6530	บ้านแขม	พิบูลมังสาหาร	34110	341919	3419	34
6531	พิบูล	พิบูลมังสาหาร	34110	341901	3419	34
6532	ระเว	พิบูลมังสาหาร	34110	341911	3419	34
6533	หนองบัวฮี	พิบูลมังสาหาร	34110	341913	3419	34
6534	อ่างศิลา	พิบูลมังสาหาร	34110	341914	3419	34
6535	โนนกลาง	พิบูลมังสาหาร	34110	341907	3419	34
6536	โนนกาหลง	พิบูลมังสาหาร	34110	341918	3419	34
6537	โพธิ์ศรี	พิบูลมังสาหาร	34110	341910	3419	34
6538	โพธิ์ไทร	พิบูลมังสาหาร	34110	341909	3419	34
6539	ไร่ใต้	พิบูลมังสาหาร	34110	341912	3419	34
6540	ดุมใหญ่	ม่วงสามสิบ	34140	341403	3414	34
6541	นาเลิง	ม่วงสามสิบ	34140	341413	3414	34
6542	ม่วงสามสิบ	ม่วงสามสิบ	34140	341401	3414	34
6543	ยางสักกระโพหลุ่ม	ม่วงสามสิบ	34140	341407	3414	34
6544	ยางโยภาพ	ม่วงสามสิบ	34140	341411	3414	34
6545	หนองช้างใหญ่	ม่วงสามสิบ	34140	341404	3414	34
6546	หนองฮาง	ม่วงสามสิบ	34140	341410	3414	34
6547	หนองเมือง	ม่วงสามสิบ	34140	341405	3414	34
6548	หนองเหล่า	ม่วงสามสิบ	34140	340418	3414	34
6549	หนองไข่นก	ม่วงสามสิบ	34140	341408	3414	34
6550	เตย	ม่วงสามสิบ	34140	341406	3414	34
6551	เหล่าบก	ม่วงสามสิบ	34140	341402	3414	34
6552	โพนแพง	ม่วงสามสิบ	34140	341414	3414	34
6553	ไผ่ใหญ่	ม่วงสามสิบ	34140	341412	3414	34
6554	คำขวาง	วารินชำราบ	34190	341515	3415	34
6555	คำน้ำแซบ	วารินชำราบ	34190	341510	3415	34
6556	คูเมือง	วารินชำราบ	34190	341507	3415	34
6557	ท่าลาด	วารินชำราบ	34310	341504	3415	34
6558	ธาตุ	วารินชำราบ	34190	341502	3415	34
6559	บุ่งหวาย	วารินชำราบ	34310	341511	3415	34
6560	บุ่งไหม	วารินชำราบ	34190	341526	3415	34
6561	วารินชำราบ	วารินชำราบ	34190	341501	3415	34
6562	สระสมิง	วารินชำราบ	34190	341508	3415	34
6563	หนองกินเพล	วารินชำราบ	34190	341520	3415	34
6564	ห้วยขะยูง	วารินชำราบ	34310	341524	3415	34
6565	เมืองศรีไค	วารินชำราบ	34190	341522	3415	34
6566	แสนสุข	วารินชำราบ	34190	341518	3415	34
6567	โนนผึ้ง	วารินชำราบ	34190	341521	3415	34
6568	โนนโหนน	วารินชำราบ	34190	341505	3415	34
6569	โพธิ์ใหญ่	วารินชำราบ	34190	341516	3415	34
6570	คำไหล	ศรีเมืองใหม่	34250	340208	3402	34
6571	ดอนใหญ่	ศรีเมืองใหม่	34250	340211	3402	34
6572	ตะบ่าย	ศรีเมืองใหม่	34250	340207	3402	34
6573	นาคำ	ศรีเมืองใหม่	34250	340201	3402	34
6574	นาเลิน	ศรีเมืองใหม่	34250	340210	3402	34
6575	ลาดควาย	ศรีเมืองใหม่	34250	340205	3402	34
6576	วาริน	ศรีเมืองใหม่	34250	340204	3402	34
6577	สงยาง	ศรีเมืองใหม่	34250	340206	3402	34
6578	หนามแท่ง	ศรีเมืองใหม่	34250	340209	3402	34
6579	เอือดใหญ่	ศรีเมืองใหม่	34250	340203	3402	34
6580	แก้งกอก	ศรีเมืองใหม่	34250	340202	3402	34
6581	ท่าช้าง	สว่างวีระวงศ์	34190	341503	3432	34
6582	บุ่งมะแลง	สว่างวีระวงศ์	34190	341523	3432	34
6583	สว่าง	สว่างวีระวงศ์	34190	341514	3432	34
6584	แก่งโดม	สว่างวีระวงศ์	34190	341525	3432	34
6585	ขามป้อม	สำโรง	34360	340503	3422	34
6586	ค้อน้อย	สำโรง	34360	341509	3422	34
6587	บอน	สำโรง	34360	342208	3422	34
6588	สำโรง	สำโรง	34360	341513	3422	34
6589	หนองไฮ	สำโรง	34360	341512	3422	34
6590	โคกก่อง	สำโรง	34360	341517	3422	34
6591	โคกสว่าง	สำโรง	34360	341519	3422	34
6592	โนนกลาง	สำโรง	34360	341907	3422	34
6593	โนนกาเล็น	สำโรง	34360	341506	3422	34
6594	คันไร่	สิรินธร	34350	341903	3425	34
6595	คำเขื่อนแก้ว	สิรินธร	34350	340306	3425	34
6596	ช่องเม็ก	สิรินธร	34350	341916	3425	34
6597	นิคมสร้างตนเองลำโดมน้อย	สิรินธร	34350	342504	3425	34
6598	ฝางคำ	สิรินธร	34350	341908	3425	34
6599	โนนก่อ	สิรินธร	34350	341917	3425	34
6600	ขามป้อม	เขมราฐ	34170	340503	3405	34
6601	นาแวง	เขมราฐ	34170	340508	3405	34
6602	หนองนกทา	เขมราฐ	34170	340511	3405	34
6603	หนองผือ	เขมราฐ	34170	340507	3405	34
6604	หนองสิม	เขมราฐ	34170	340512	3405	34
6605	หัวนา	เขมราฐ	34170	340513	3405	34
6606	เขมราฐ	เขมราฐ	34170	340501	3405	34
6607	เจียด	เขมราฐ	34170	340504	3405	34
6608	แก้งเหนือ	เขมราฐ	34170	340510	3405	34
6609	กลางใหญ่	เขื่องใน	34320	340413	3404	34
6610	ก่อเอ้	เขื่องใน	34150	340404	3404	34
6611	ค้อทอง	เขื่องใน	34150	340403	3404	34
6612	ชีทวน	เขื่องใน	34150	340406	3404	34
6613	ท่าไห	เขื่องใน	34150	340407	3404	34
6614	ธาตุน้อย	เขื่องใน	34150	340410	3404	34
6615	นาคำใหญ่	เขื่องใน	34150	340408	3404	34
6616	บ้านกอก	เขื่องใน	34320	340412	3404	34
6617	บ้านไทย	เขื่องใน	34320	340411	3404	34
6618	ยางขี้นก	เขื่องใน	34150	340415	3404	34
6619	ศรีสุข	เขื่องใน	34150	340416	3404	34
6620	สร้างถ่อ	เขื่องใน	34150	340402	3404	34
6621	สหธาตุ	เขื่องใน	34150	340417	3404	34
6622	หนองเหล่า	เขื่องใน	34150	340418	3404	34
6623	หัวดอน	เขื่องใน	34150	340405	3404	34
6624	เขื่องใน	เขื่องใน	34150	340401	3404	34
6625	แดงหม้อ	เขื่องใน	34150	340409	3404	34
6626	โนนรัง	เขื่องใน	34320	340414	3404	34
6627	กลาง	เดชอุดม	34160	340711	3407	34
6628	กุดประทาย	เดชอุดม	34160	340709	3407	34
6629	คำครั่ง	เดชอุดม	34160	340716	3407	34
6630	ตบหู	เดชอุดม	34160	340710	3407	34
6631	ทุ่งเทิง	เดชอุดม	34160	340706	3407	34
6632	ท่าโพธิ์ศรี	เดชอุดม	34160	340713	3407	34
6633	นากระแซง	เดชอุดม	34160	340717	3407	34
6634	นาส่วง	เดชอุดม	34160	340702	3407	34
6635	นาเจริญ	เดชอุดม	34160	340704	3407	34
6636	บัวงาม	เดชอุดม	34160	340715	3407	34
6637	ป่าโมง	เดชอุดม	34160	340721	3407	34
6638	สมสะอาด	เดชอุดม	34160	340708	3407	34
6639	เมืองเดช	เดชอุดม	34160	340701	3407	34
6640	แก้ง	เดชอุดม	34160	340712	3407	34
6641	โนนสมบูรณ์	เดชอุดม	34160	340723	3407	34
6642	โพนงาม	เดชอุดม	34160	340720	3407	34
6643	กระโสบ	เมืองอุบลราชธานี	34000	340113	3401	34
6644	กุดลาด	เมืองอุบลราชธานี	34000	340116	3401	34
6645	ขามใหญ่	เมืองอุบลราชธานี	34000	340108	3401	34
6646	ขี้เหล็ก	เมืองอุบลราชธานี	34000	340119	3401	34
6647	ปทุม	เมืองอุบลราชธานี	34000	340107	3401	34
6648	ปะอาว	เมืองอุบลราชธานี	34000	340120	3401	34
6649	หนองขอน	เมืองอุบลราชธานี	34000	340105	3401	34
6650	หนองบ่อ	เมืองอุบลราชธานี	34000	340111	3401	34
6651	หัวเรือ	เมืองอุบลราชธานี	34000	340104	3401	34
6652	แจระแม	เมืองอุบลราชธานี	34000	340109	3401	34
6653	ในเมือง	เมืองอุบลราชธานี	34000	340101	3401	34
6654	ไร่น้อย	เมืองอุบลราชธานี	34000	340112	3401	34
6655	หนองบก	เหล่าเสือโก้ก	34000	340117	3431	34
6656	เหล่าเสือโก้ก	เหล่าเสือโก้ก	34000	340115	3431	34
6657	แพงใหญ่	เหล่าเสือโก้ก	34000	340118	3431	34
6658	โพนเมือง	เหล่าเสือโก้ก	34000	340102	3431	34
6659	นาโพธิ์กลาง	โขงเจียม	34220	340303	3403	34
6660	หนองแสงใหญ่	โขงเจียม	34220	340304	3403	34
6661	ห้วยยาง	โขงเจียม	34220	340302	3403	34
6662	ห้วยไผ่	โขงเจียม	34220	340305	3403	34
6663	โขงเจียม	โขงเจียม	34220	340301	3403	34
6664	ม่วงใหญ่	โพธิ์ไทร	34340	342102	3421	34
6665	สองคอน	โพธิ์ไทร	34340	342104	3421	34
6666	สารภี	โพธิ์ไทร	34340	342105	3421	34
6667	สำโรง	โพธิ์ไทร	34340	341513	3421	34
6668	เหล่างาม	โพธิ์ไทร	34340	342106	3421	34
6669	โพธิ์ไทร	โพธิ์ไทร	34340	341909	3421	34
6670	นรสิงห์	ป่าโมก	14130	150306	1503	15
6671	บางปลากด	ป่าโมก	14130	150301	1503	15
6672	บางเสด็จ	ป่าโมก	14130	150305	1503	15
6673	ป่าโมก	ป่าโมก	14130	150302	1503	15
6674	สายทอง	ป่าโมก	14130	150303	1503	15
6675	เอกราช	ป่าโมก	14130	150307	1503	15
6676	โผงเผง	ป่าโมก	14130	150308	1503	15
6677	โรงช้าง	ป่าโมก	14130	150304	1503	15
6678	คลองขนาก	วิเศษชัยชาญ	14110	150609	1506	15
6679	ตลาดใหม่	วิเศษชัยชาญ	14110	150615	1506	15
6680	ท่าช้าง	วิเศษชัยชาญ	14110	150605	1506	15
6681	บางจัก	วิเศษชัยชาญ	14110	150607	1506	15
6682	ม่วงเตี้ย	วิเศษชัยชาญ	14110	150612	1506	15
6683	ยี่ล้น	วิเศษชัยชาญ	14110	150606	1506	15
6684	ศาลเจ้าโรงทอง	วิเศษชัยชาญ	14110	150602	1506	15
6685	สาวร้องไห้	วิเศษชัยชาญ	14110	150604	1506	15
6686	สี่ร้อย	วิเศษชัยชาญ	14110	150611	1506	15
6687	หลักแก้ว	วิเศษชัยชาญ	14110	150614	1506	15
6688	หัวตะพาน	วิเศษชัยชาญ	14110	150613	1506	15
6689	ห้วยคันแหลน	วิเศษชัยชาญ	14110	150608	1506	15
6690	ไผ่จำศีล	วิเศษชัยชาญ	14110	false	1506	15
6691	ไผ่ดำพัฒนา	วิเศษชัยชาญ	14110	150603	1506	15
6692	ไผ่วง	วิเศษชัยชาญ	14110	150610	1506	15
6693	มงคลธรรมนิมิต	สามโก้	14160	150705	1507	15
6694	ราษฎรพัฒนา	สามโก้	14160	150702	1507	15
6695	สามโก้	สามโก้	14160	150701	1507	15
6696	อบทม	สามโก้	14160	150703	1507	15
6697	โพธิ์ม่วงพันธ์	สามโก้	14160	150704	1507	15
6698	คลองวัว	เมืองอ่างทอง	14000	150113	1501	15
6699	จำปาหล่อ	เมืองอ่างทอง	14000	150110	1501	15
6700	ตลาดกรวด	เมืองอ่างทอง	14000	150106	1501	15
6701	ตลาดหลวง	เมืองอ่างทอง	14000	150101	1501	15
6702	บางแก้ว	เมืองอ่างทอง	14000	150102	1501	15
6703	บ้านรี	เมืองอ่างทอง	14000	150112	1501	15
6704	บ้านอิฐ	เมืองอ่างทอง	14000	150108	1501	15
6705	บ้านแห	เมืองอ่างทอง	14000	150105	1501	15
6706	ป่างิ้ว	เมืองอ่างทอง	14000	150104	1501	15
6707	มหาดไทย	เมืองอ่างทอง	14000	150107	1501	15
6708	ย่านซื่อ	เมืองอ่างทอง	14000	150114	1501	15
6709	ศาลาแดง	เมืองอ่างทอง	14000	150103	1501	15
6710	หัวไผ่	เมืองอ่างทอง	14000	150109	1501	15
6711	โพสะ	เมืองอ่างทอง	14000	150111	1501	15
6712	จำลอง	แสวงหา	14150	150507	1505	15
6713	บ้านพราน	แสวงหา	14150	150503	1505	15
6714	วังน้ำเย็น	แสวงหา	14150	150504	1505	15
6715	ศรีพราน	แสวงหา	14150	150502	1505	15
6716	สีบัวทอง	แสวงหา	14150	150505	1505	15
6717	ห้วยไผ่	แสวงหา	14150	150506	1505	15
6718	แสวงหา	แสวงหา	14150	150501	1505	15
6719	คำหยาด	โพธิ์ทอง	14120	150415	1504	15
6720	ทางพระ	โพธิ์ทอง	14120	150412	1504	15
6721	บางพลับ	โพธิ์ทอง	14120	150403	1504	15
6722	บางระกำ	โพธิ์ทอง	14120	150406	1504	15
6723	บางเจ้าฉ่า	โพธิ์ทอง	14120	150414	1504	15
6724	บ่อแร่	โพธิ์ทอง	14120	150411	1504	15
6725	ยางช้าย	โพธิ์ทอง	14120	150410	1504	15
6726	รำมะสัก	โพธิ์ทอง	14120	150405	1504	15
6727	สามง่าม	โพธิ์ทอง	14120	150413	1504	15
6728	หนองแม่ไก่	โพธิ์ทอง	14120	150404	1504	15
6729	องครักษ์	โพธิ์ทอง	14120	150408	1504	15
6730	อินทประมูล	โพธิ์ทอง	14120	150402	1504	15
6731	อ่างแก้ว	โพธิ์ทอง	14120	150401	1504	15
6732	โคกพุทรา	โพธิ์ทอง	14120	150409	1504	15
6733	โพธิ์รังนก	โพธิ์ทอง	14120	150407	1504	15
6734	จรเข้ร้อง	ไชโย	14140	150201	1502	15
6735	ชะไว	ไชโย	14140	150208	1502	15
6736	ชัยฤทธิ์	ไชโย	14140	150203	1502	15
6737	ตรีณรงค์	ไชโย	14140	150209	1502	15
6738	ราชสถิตย์	ไชโย	14140	150205	1502	15
6739	หลักฟ้า	ไชโย	14140	150207	1502	15
6740	เทวราช	ไชโย	14140	150204	1502	15
6741	ไชยภูมิ	ไชโย	14140	150202	1502	15
6742	ไชโย	ไชโย	14140	150206	1502	15
6743	ต้า	ขุนตาล	57340	570496	5714	57
6744	ป่าตาล	ขุนตาล	57340	570499	5714	57
6745	ยางฮอม	ขุนตาล	57340	570497	5714	57
6746	ปงน้อย	ดอยหลวง	57110	570707	5718	57
6747	หนองป่าก่อ	ดอยหลวง	57110	570709	5718	57
6748	โชคชัย	ดอยหลวง	57110	570717	5718	57
6749	ป่าแงะ	ป่าแดด	57190	570597	5706	57
6750	ป่าแดด	ป่าแดด	57190	570599	5706	57
6751	ศรีโพธิ์เงิน	ป่าแดด	57190	570606	5706	57
6752	สันมะค่า	ป่าแดด	57190	570598	5706	57
6753	โรงช้าง	ป่าแดด	57190	570605	5706	57
6754	ตาดควัน	พญาเม็งราย	57290	571205	5712	57
6755	เม็งราย	พญาเม็งราย	57290	571204	5712	57
6756	แม่ต๋ำ	พญาเม็งราย	57290	571202	5712	57
6757	แม่เปา	พญาเม็งราย	57290	570498	5712	57
6758	ไม้ยา	พญาเม็งราย	57290	571203	5712	57
6759	ดอยงาม	พาน	57120	570505	5705	57
6760	ทรายขาว	พาน	57120	570510	5705	57
6761	ทานตะวัน	พาน	57280	570514	5705	57
6762	ธารทอง	พาน	57250	570503	5705	57
6763	ป่าหุ่ง	พาน	57120	570508	5705	57
6764	ม่วงคำ	พาน	57120	570509	5705	57
6765	สันกลาง	พาน	57120	570511	5705	57
6766	สันติสุข	พาน	57120	570504	5705	57
6767	สันมะเค็ด	พาน	57120	570501	5705	57
6768	หัวง้ม	พาน	57120	570506	5705	57
6769	เจริญเมือง	พาน	57120	570507	5705	57
6770	เมืองพาน	พาน	57120	570513	5705	57
6771	เวียงห้าว	พาน	57120	570515	5705	57
6772	แม่อ้อ	พาน	57120	570502	5705	57
6773	แม่เย็น	พาน	57280	570512	5705	57
6774	ครึ่ง	เชียงของ	57140	570303	5703	57
6775	บุญเรือง	เชียงของ	57140	570304	5703	57
6776	ริมโขง	เชียงของ	57140	570310	5703	57
6777	ศรีดอนชัย	เชียงของ	57140	570308	5703	57
6778	สถาน	เชียงของ	57140	570302	5703	57
6779	ห้วยซ้อ	เชียงของ	57140	570305	5703	57
6780	เวียง	เชียงของ	57140	570101	5703	57
6781	บ้านแซว	เชียงแสน	57150	570803	5708	57
6782	ป่าสัก	เชียงแสน	57150	570802	5708	57
6783	ศรีดอนมูล	เชียงแสน	57150	570804	5708	57
6784	เวียง	เชียงแสน	57150	570101	5708	57
6785	แม่เงิน	เชียงแสน	57150	570805	5708	57
6786	โยนก	เชียงแสน	57150	570806	5708	57
6787	งิ้ว	เทิง	57160	570402	5704	57
6788	ตับเต่า	เทิง	57160	570409	5704	57
6789	ปล้อง	เทิง	57230	570403	5704	57
6790	ศรีดอนไชย	เทิง	57230	570412	5704	57
6791	สันทรายงาม	เทิง	57160	570411	5704	57
6792	หงาว	เทิง	57160	570410	5704	57
6793	หนองแรด	เทิง	57230	570413	5704	57
6794	เชียงเคี่ยน	เทิง	57230	570405	5704	57
6795	เวียง	เทิง	57160	570101	5704	57
6796	แม่ลอย	เทิง	57230	570404	5704	57
6797	ดอยลาน	เมืองเชียงราย	57000	570115	5701	57
6798	ดอยฮาง	เมืองเชียงราย	57000	570120	5701	57
6799	ท่าสาย	เมืองเชียงราย	57000	570118	5701	57
6800	ท่าสุด	เมืองเชียงราย	57100	570121	5701	57
6801	นางแล	เมืองเชียงราย	57100	570104	5701	57
6802	บ้านดู่	เมืองเชียงราย	57100	570103	5701	57
6803	ป่าอ้อดอนชัย	เมืองเชียงราย	57000	570116	5701	57
6804	รอบเวียง	เมืองเชียงราย	57000	570102	5701	57
6805	ริมกก	เมืองเชียงราย	57100	570114	5701	57
6806	สันทราย	เมืองเชียงราย	57000	570107	5701	57
6807	ห้วยชมภู	เมืองเชียงราย	57000	570112	5701	57
6808	ห้วยสัก	เมืองเชียงราย	57000	570113	5701	57
6809	เวียง	เมืองเชียงราย	57000	570101	5701	57
6810	แม่กรณ์	เมืองเชียงราย	57000	570111	5701	57
6811	แม่ข้าวต้ม	เมืองเชียงราย	57100	570105	5701	57
6812	แม่ยาว	เมืองเชียงราย	57100	570106	5701	57
6813	ดอนศิลา	เวียงชัย	57210	570206	5702	57
6814	ผางาม	เวียงชัย	57210	570197	5702	57
6815	เมืองชุม	เวียงชัย	57210	570208	5702	57
6816	เวียงชัย	เวียงชัย	57210	570198	5702	57
6817	เวียงเหนือ	เวียงชัย	57210	570196	5702	57
6818	บ้านโป่ง	เวียงป่าเป้า	57170	571103	5711	57
6819	ป่างิ้ว	เวียงป่าเป้า	57170	571104	5711	57
6820	สันสลี	เวียงป่าเป้า	57170	571101	5711	57
6821	เวียง	เวียงป่าเป้า	57170	570101	5711	57
6822	เวียงกาหลง	เวียงป่าเป้า	57260	571105	5711	57
6823	แม่เจดีย์	เวียงป่าเป้า	57260	571106	5711	57
6824	แม่เจดีย์ใหม่	เวียงป่าเป้า	57260	571107	5711	57
6825	ดงมหาวัน	เวียงเชียงรุ้ง	57210	570207	5717	57
6826	ทุ่งก่อ	เวียงเชียงรุ้ง	57210	570192	5717	57
6827	ป่าซาง	เวียงเชียงรุ้ง	57210	570205	5717	57
6828	ท่าข้าม	เวียงแก่น	57310	571304	5713	57
6829	ปอ	เวียงแก่น	57310	570307	5713	57
6830	ม่วงยาย	เวียงแก่น	57310	570306	5713	57
6831	หล่ายงาว	เวียงแก่น	57310	570309	5713	57
6832	จอมสวรรค์	แม่จัน	57110	570713	5707	57
6833	จันจว้า	แม่จัน	57270	570702	5707	57
6834	จันจว้าใต้	แม่จัน	57270	570712	5707	57
6835	ท่าข้าวเปลือก	แม่จัน	57110	570706	5707	57
6836	ป่าซาง	แม่จัน	57110	570205	5707	57
6837	ป่าตึง	แม่จัน	57110	570708	5707	57
6838	ศรีค้ำ	แม่จัน	57110	570711	5707	57
6839	สันทราย	แม่จัน	57110	570107	5707	57
6840	แม่คำ	แม่จัน	57240	570703	5707	57
6841	แม่จัน	แม่จัน	57110	570701	5707	57
6842	แม่ไร่	แม่จัน	57240	570710	5707	57
6843	เทอดไทย	แม่ฟ้าหลวง	57240	571501	5715	57
6844	แม่ฟ้าหลวง	แม่ฟ้าหลวง	57240	571504	5715	57
6845	แม่สลองนอก	แม่ฟ้าหลวง	57110	570716	5715	57
6846	แม่สลองใน	แม่ฟ้าหลวง	57110	571502	5715	57
6847	จอมหมอกแก้ว	แม่ลาว	57250	570117	5716	57
6848	ดงมะดะ	แม่ลาว	57250	570109	5716	57
6849	บัวสลี	แม่ลาว	57250	570108	5716	57
6850	ป่าก่อดำ	แม่ลาว	57250	570110	5716	57
6851	โป่งแพร่	แม่ลาว	57000	570119	5716	57
6852	ท่าก๊อ	แม่สรวย	57180	571005	5710	57
6853	ป่าแดด	แม่สรวย	57180	570599	5710	57
6854	วาวี	แม่สรวย	57180	571006	5710	57
6855	ศรีถ้อย	แม่สรวย	57180	571004	5710	57
6856	เจดีย์หลวง	แม่สรวย	57180	571007	5710	57
6857	แม่พริก	แม่สรวย	57180	571003	5710	57
6858	แม่สรวย	แม่สรวย	57180	571001	5710	57
6859	บ้านด้าย	แม่สาย	57220	570908	5709	57
6860	ศรีเมืองชุม	แม่สาย	57130	570905	5709	57
6861	ห้วยไคร้	แม่สาย	57220	570902	5709	57
6862	เกาะช้าง	แม่สาย	57130	570903	5709	57
6863	เวียงพางคำ	แม่สาย	57130	570906	5709	57
6864	แม่สาย	แม่สาย	57130	570901	5709	57
6865	โป่งงาม	แม่สาย	57130	570909	5709	57
6866	โป่งผา	แม่สาย	57130	570904	5709	57
6867	บ้านจันทร์	กัลยาณิวัฒนา	58130	500306	false	50
6868	แจ่มหลวง	กัลยาณิวัฒนา	58130	500310	false	50
6869	แม่แดด	กัลยาณิวัฒนา	58130	500309	false	50
6870	ข่วงเปา	จอมทอง	50160	500204	5002	50
6871	ดอยแก้ว	จอมทอง	50160	500207	5002	50
6872	บ้านหลวง	จอมทอง	50160	500203	5002	50
6873	บ้านแปะ	จอมทอง	50240	500206	5002	50
6874	สบเตี๊ยะ	จอมทอง	50160	500205	5002	50
6875	แม่สอย	จอมทอง	50240	500209	5002	50
6876	ตลาดขวัญ	ดอยสะเก็ด	50220	500507	5005	50
6877	ตลาดใหญ่	ดอยสะเก็ด	50220	500510	5005	50
6878	ป่าป้อง	ดอยสะเก็ด	50220	500504	5005	50
6879	ป่าลาน	ดอยสะเก็ด	50220	500506	5005	50
6880	ป่าเมี่ยง	ดอยสะเก็ด	50220	500513	5005	50
6881	ลวงเหนือ	ดอยสะเก็ด	50220	500503	5005	50
6882	สง่าบ้าน	ดอยสะเก็ด	50220	500505	5005	50
6883	สันปูเลย	ดอยสะเก็ด	50220	500502	5005	50
6884	สำราญราษฎร์	ดอยสะเก็ด	50220	500508	5005	50
6885	เชิงดอย	ดอยสะเก็ด	50220	500501	5005	50
6886	เทพเสด็จ	ดอยสะเก็ด	50220	500514	5005	50
6887	แม่คือ	ดอยสะเก็ด	50220	500509	5005	50
6888	แม่ฮ้อยเงิน	ดอยสะเก็ด	50220	500511	5005	50
6889	แม่โป่ง	ดอยสะเก็ด	50220	500512	5005	50
6890	ดอยหล่อ	ดอยหล่อ	50160	500208	5024	50
6891	ยางคราม	ดอยหล่อ	50160	500201	5024	50
6892	สองแคว	ดอยหล่อ	50160	500202	5024	50
6893	สันติสุข	ดอยหล่อ	50160	500210	5024	50
6894	ดอยเต่า	ดอยเต่า	50260	501701	5017	50
6895	ท่าเดื่อ	ดอยเต่า	50260	501702	5017	50
6896	บงตัน	ดอยเต่า	50260	501705	5017	50
6897	บ้านแอ่น	ดอยเต่า	50260	501704	5017	50
6898	มืดกา	ดอยเต่า	50260	501703	5017	50
6899	โปงทุ่ง	ดอยเต่า	50260	501706	5017	50
6900	ม่อนปิ่น	ฝาง	50110	500903	5009	50
6901	สันทราย	ฝาง	50110	500906	5009	50
6902	เวียง	ฝาง	50110	500901	5009	50
6903	แม่ข่า	ฝาง	50320	500911	5009	50
6904	แม่คะ	ฝาง	50110	500910	5009	50
6905	แม่งอน	ฝาง	50320	500904	5009	50
6906	แม่สูน	ฝาง	50110	500905	5009	50
6907	โป่งน้ำร้อน	ฝาง	50110	500912	5009	50
6908	ทุ่งหลวง	พร้าว	50190	501102	5011	50
6909	น้ำแพร่	พร้าว	50190	501107	5011	50
6910	บ้านโป่ง	พร้าว	50190	501106	5011	50
6911	ป่าตุ้ม	พร้าว	50190	501103	5011	50
6912	ป่าไหน่	พร้าว	50190	501104	5011	50
6913	สันทราย	พร้าว	50190	500906	5011	50
6914	เขื่อนผาก	พร้าว	50190	501108	5011	50
6915	เวียง	พร้าว	50190	500901	5011	50
6916	แม่ปั๋ง	พร้าว	50190	501110	5011	50
6917	แม่แวน	พร้าว	50190	501109	5011	50
6918	โหล่งขอด	พร้าว	50190	501111	5011	50
6919	บ่อแก้ว	สะเมิง	50250	500804	5008	50
6920	ยั้งเมิน	สะเมิง	50250	500805	5008	50
6921	สะเมิงเหนือ	สะเมิง	50250	500802	5008	50
6922	สะเมิงใต้	สะเมิง	50250	500801	5008	50
6923	แม่สาบ	สะเมิง	50250	500803	5008	50
6924	ต้นเปา	สันกำแพง	50130	501312	5013	50
6925	ทรายมูล	สันกำแพง	50130	501302	5013	50
6926	บวกค้าง	สันกำแพง	50130	501304	5013	50
6927	ร้องวัวแดง	สันกำแพง	50130	501303	5013	50
6928	สันกลาง	สันกำแพง	50130	501202	5013	50
6929	สันกำแพง	สันกำแพง	50130	501301	5013	50
6930	ห้วยทราย	สันกำแพง	50130	500706	5013	50
6931	ออนใต้	สันกำแพง	50130	501306	5013	50
6932	แช่ช้าง	สันกำแพง	50130	501305	5013	50
6933	แม่ปูคา	สันกำแพง	50130	501310	5013	50
6934	ป่าไผ่	สันทราย	50210	501412	5014	50
6935	สันทรายน้อย	สันทราย	50210	501402	5014	50
6936	สันทรายหลวง	สันทราย	50210	501401	5014	50
6937	สันนาเม็ง	สันทราย	50210	501404	5014	50
6938	สันป่าเปา	สันทราย	50210	501405	5014	50
6939	สันพระเนตร	สันทราย	50210	501403	5014	50
6940	หนองจ๊อม	สันทราย	50210	501407	5014	50
6941	หนองหาร	สันทราย	50290	501408	5014	50
6942	หนองแหย่ง	สันทราย	50210	501406	5014	50
6943	เมืองเล็น	สันทราย	50210	501411	5014	50
6944	แม่แฝก	สันทราย	50290	501409	5014	50
6945	แม่แฝกใหม่	สันทราย	50290	501410	5014	50
6946	ทุ่งต้อม	สันป่าตอง	50120	501210	5012	50
6947	ทุ่งสะโตก	สันป่าตอง	50120	501208	5012	50
6948	ท่าวังพร้าว	สันป่าตอง	50120	501203	5012	50
6949	น้ำบ่อหลวง	สันป่าตอง	50120	501214	5012	50
6950	บ้านกลาง	สันป่าตอง	50120	501207	5012	50
6951	บ้านแม	สันป่าตอง	50120	501206	5012	50
6952	มะขามหลวง	สันป่าตอง	50120	501204	5012	50
6953	มะขุนหวาน	สันป่าตอง	50120	501215	5012	50
6954	ยุหว่า	สันป่าตอง	50120	501201	5012	50
6955	สันกลาง	สันป่าตอง	50120	501202	5012	50
6956	แม่ก๊า	สันป่าตอง	50120	501205	5012	50
6957	ขัวมุง	สารภี	50140	501905	5019	50
6958	ชมภู	สารภี	50140	501903	5019	50
6959	ดอนแก้ว	สารภี	50140	500710	5019	50
6960	ท่ากว้าง	สารภี	50140	501908	5019	50
6961	ท่าวังตาล	สารภี	50140	501910	5019	50
6962	ป่าบง	สารภี	50140	501912	5019	50
6963	ยางเนิ้ง	สารภี	50140	501901	5019	50
6964	สันทราย	สารภี	50140	500906	5019	50
6965	สารภี	สารภี	50140	501902	5019	50
6966	หนองผึ้ง	สารภี	50140	501907	5019	50
6967	หนองแฝก	สารภี	50140	501906	5019	50
6968	ไชยสถาน	สารภี	50140	501904	5019	50
6969	ขุนคง	หางดง	50230	501505	5015	50
6970	น้ำแพร่	หางดง	50230	501107	5015	50
6971	บ้านปง	หางดง	50230	501510	5015	50
6972	บ้านแหวน	หางดง	50230	501507	5015	50
6973	สบแม่ข่า	หางดง	50230	501506	5015	50
6974	สันผักหวาน	หางดง	50230	501508	5015	50
6975	หนองควาย	หางดง	50230	501509	5015	50
6976	หนองตอง	หางดง	50340	501504	5015	50
6977	หนองแก๋ว	หางดง	50230	501502	5015	50
6978	หางดง	หางดง	50230	501501	5015	50
6979	หารแก้ว	หางดง	50230	501503	5015	50
6980	นาเกียน	อมก๋อย	50310	501806	5018	50
6981	ม่อนจอง	อมก๋อย	50310	501804	5018	50
6982	ยางเปียง	อมก๋อย	50310	501802	5018	50
6983	สบโขง	อมก๋อย	50310	501805	5018	50
6984	อมก๋อย	อมก๋อย	50310	501801	5018	50
6985	แม่ตื่น	อมก๋อย	50310	501803	5018	50
6986	นาคอเรือ	ฮอด	50240	501606	5016	50
6987	บ่อสลี	ฮอด	50240	501605	5016	50
6988	บ่อหลวง	ฮอด	50240	501604	5016	50
6989	บ้านตาล	ฮอด	50240	501603	5016	50
6990	หางดง	ฮอด	50240	501501	5016	50
6991	ฮอด	ฮอด	50240	501602	5016	50
6992	ทุ่งข้าวพวง	เชียงดาว	50170	500407	5004	50
6993	ปิงโค้ง	เชียงดาว	50170	500406	5004	50
6994	เชียงดาว	เชียงดาว	50170	500401	5004	50
6995	เมืองคอง	เชียงดาว	50170	500405	5004	50
6996	เมืองงาย	เชียงดาว	50170	500403	5004	50
6997	เมืองนะ	เชียงดาว	50170	500402	5004	50
6998	แม่นะ	เชียงดาว	50170	500404	5004	50
6999	ช้างคลาน	เมืองเชียงใหม่	50100	500105	5001	50
7000	ช้างม่อย	เมืองเชียงใหม่	50300	500104	5001	50
7001	ช้างเผือก	เมืองเชียงใหม่	50300	500107	5001	50
7002	ท่าศาลา	เมืองเชียงใหม่	50000	500112	5001	50
7003	ป่าตัน	เมืองเชียงใหม่	50300	500115	5001	50
7004	ป่าแดด	เมืองเชียงใหม่	50100	500110	5001	50
7005	พระสิงห์	เมืองเชียงใหม่	50200	500102	5001	50
7006	ฟ้าฮ่าม	เมืองเชียงใหม่	50000	500114	5001	50
7007	วัดเกต	เมืองเชียงใหม่	50000	500106	5001	50
7008	ศรีภูมิ	เมืองเชียงใหม่	50200	500101	5001	50
7009	สันผีเสื้อ	เมืองเชียงใหม่	50300	500116	5001	50
7010	สุเทพ	เมืองเชียงใหม่	50200	500108	5001	50
7011	หนองป่าครั่ง	เมืองเชียงใหม่	50000	500113	5001	50
7012	หนองหอย	เมืองเชียงใหม่	50000	500111	5001	50
7013	หายยา	เมืองเชียงใหม่	50100	500103	5001	50
7014	แม่เหียะ	เมืองเชียงใหม่	50100	500109	5001	50
7015	เปียงหลวง	เวียงแหง	50350	502002	5020	50
7016	เมืองแหง	เวียงแหง	50350	502001	5020	50
7017	แสนไห	เวียงแหง	50350	502003	5020	50
7018	ขี้เหล็ก	แม่ริม	50180	500603	5007	50
7019	ดอนแก้ว	แม่ริม	50180	500710	5007	50
7020	ริมเหนือ	แม่ริม	50180	500702	5007	50
7021	ริมใต้	แม่ริม	50180	500701	5007	50
7022	สะลวง	แม่ริม	50330	500705	5007	50
7023	สันโป่ง	แม่ริม	50180	500703	5007	50
7024	ห้วยทราย	แม่ริม	50180	500706	5007	50
7025	เหมืองแก้ว	แม่ริม	50180	500711	5007	50
7026	แม่สา	แม่ริม	50180	500709	5007	50
7027	แม่แรม	แม่ริม	50180	500707	5007	50
7028	โป่งแยง	แม่ริม	50180	500708	5007	50
7029	ดอนเปา	แม่วาง	50360	502205	5022	50
7030	ทุ่งปี้	แม่วาง	50360	501209	5022	50
7031	ทุ่งรวงทอง	แม่วาง	50360	501213	5022	50
7032	บ้านกาด	แม่วาง	50360	501211	5022	50
7033	แม่วิน	แม่วาง	50360	501212	5022	50
7034	ทาเหนือ	แม่ออน	50130	501315	5023	50
7035	บ้านสหกรณ์	แม่ออน	50130	501308	5023	50
7036	ห้วยแก้ว	แม่ออน	50130	501309	5023	50
7037	ออนกลาง	แม่ออน	50130	501316	5023	50
7038	ออนเหนือ	แม่ออน	50130	501307	5023	50
7039	แม่ทา	แม่ออน	50130	501314	5023	50
7040	ท่าตอน	แม่อาย	50280	501005	5010	50
7041	บ้านหลวง	แม่อาย	50280	500203	5010	50
7042	มะลิกา	แม่อาย	50280	501007	5010	50
7043	สันต้นหมื้อ	แม่อาย	50280	501003	5010	50
7044	แม่นาวาง	แม่อาย	50280	500995	5010	50
7045	แม่สาว	แม่อาย	50280	500996	5010	50
7046	แม่อาย	แม่อาย	50280	500997	5010	50
7047	กองแขก	แม่แจ่ม	50270	500308	5003	50
7048	ช่างเคิ่ง	แม่แจ่ม	50270	500301	5003	50
7049	ท่าผา	แม่แจ่ม	50270	500302	5003	50
7050	บ้านทับ	แม่แจ่ม	50270	500303	5003	50
7051	ปางหินฝน	แม่แจ่ม	50270	500307	5003	50
7052	แม่นาจร	แม่แจ่ม	50270	500305	5003	50
7053	แม่ศึก	แม่แจ่ม	50270	500304	5003	50
7054	กื้ดช้าง	แม่แตง	50150	500612	5006	50
7055	ขี้เหล็ก	แม่แตง	50150	500603	5006	50
7056	ช่อแล	แม่แตง	50150	500604	5006	50
7057	บ้านช้าง	แม่แตง	50150	500611	5006	50
7058	บ้านเป้า	แม่แตง	50150	500607	5006	50
7059	ป่าแป๋	แม่แตง	50150	500609	5006	50
7060	สบเปิง	แม่แตง	50150	500606	5006	50
7061	สันป่ายาง	แม่แตง	50330	500608	5006	50
7062	สันมหาพน	แม่แตง	50150	500601	5006	50
7063	อินทขิล	แม่แตง	50150	500613	5006	50
7064	เมืองก๋าย	แม่แตง	50150	500610	5006	50
7065	แม่หอพระ	แม่แตง	50150	500605	5006	50
7066	แม่แตง	แม่แตง	50150	500602	5006	50
7067	ปงตำ	ไชยปราการ	50320	500902	5021	50
7068	ศรีดงเย็น	ไชยปราการ	50320	500907	5021	50
7069	หนองบัว	ไชยปราการ	50320	500909	5021	50
7070	แม่ทะลบ	ไชยปราการ	50320	500908	5021	50
7071	ชะอำ	ชะอำ	76120	760401	7604	76
7072	ดอนขุนห้วย	ชะอำ	76120	760409	7604	76
7073	นายาง	ชะอำ	76120	760403	7604	76
7074	บางเก่า	ชะอำ	76120	760402	7604	76
7075	สามพระยา	ชะอำ	76120	760408	7604	76
7076	หนองศาลา	ชะอำ	76120	760405	7604	76
7077	ห้วยทรายเหนือ	ชะอำ	76120	760406	7604	76
7078	เขาใหญ่	ชะอำ	76120	760404	7604	76
7079	ไร่ใหม่พัฒนา	ชะอำ	76120	760407	7604	76
7080	กลัดหลวง	ท่ายาง	76130	760511	7605	76
7081	ท่าคอย	ท่ายาง	76130	760502	7605	76
7082	ท่ายาง	ท่ายาง	76130	760501	7605	76
7083	ท่าแลง	ท่ายาง	76130	760514	7605	76
7084	ท่าไม้รวก	ท่ายาง	76130	760506	7605	76
7085	บ้านในดง	ท่ายาง	76130	760515	7605	76
7086	ปึกเตียน	ท่ายาง	76130	760512	7605	76
7087	มาบปลาเค้า	ท่ายาง	76130	760505	7605	76
7088	ยางหย่อง	ท่ายาง	76130	760503	7605	76
7089	วังไคร้	ท่ายาง	76130	760507	7605	76
7090	หนองจอก	ท่ายาง	76130	760504	7605	76
7091	เขากระปุก	ท่ายาง	76130	760513	7605	76
7092	ตำหรุ	บ้านลาด	76150	760604	7606	76
7093	ถ้ำรงค์	บ้านลาด	76150	760617	7606	76
7094	ท่าช้าง	บ้านลาด	76150	760616	7606	76
7095	ท่าเสน	บ้านลาด	76150	760607	7606	76
7096	บ้านทาน	บ้านลาด	76150	760603	7606	76
7097	บ้านลาด	บ้านลาด	76150	760601	7606	76
7098	บ้านหาด	บ้านลาด	76150	760602	7606	76
7099	ลาดโพธิ์	บ้านลาด	76150	760610	7606	76
7100	สมอพลือ	บ้านลาด	76150	760605	7606	76
7101	สะพานไกร	บ้านลาด	76150	760611	7606	76
7102	หนองกระเจ็ด	บ้านลาด	76150	760608	7606	76
7103	หนองกะปุ	บ้านลาด	76150	760609	7606	76
7104	ห้วยข้อง	บ้านลาด	76150	760615	7606	76
7105	ห้วยลึก	บ้านลาด	76150	760618	7606	76
7106	โรงเข้	บ้านลาด	76150	760613	7606	76
7107	ไร่มะขาม	บ้านลาด	76150	760606	7606	76
7108	ไร่สะท้อน	บ้านลาด	76150	760614	7606	76
7109	ไร่โคก	บ้านลาด	76150	760612	7606	76
7110	ท่าแร้ง	บ้านแหลม	76110	760709	7607	76
7111	ท่าแร้งออก	บ้านแหลม	76110	760710	7607	76
7112	บางขุนไทร	บ้านแหลม	76110	760702	7607	76
7113	บางครก	บ้านแหลม	76110	760708	7607	76
7114	บางตะบูน	บ้านแหลม	76110	760706	7607	76
7115	บางตะบูนออก	บ้านแหลม	76110	760707	7607	76
7116	บางแก้ว	บ้านแหลม	76110	760704	7607	76
7117	บ้านแหลม	บ้านแหลม	76110	760701	7607	76
7118	ปากทะเล	บ้านแหลม	76110	760703	7607	76
7119	แหลมผักเบี้ย	บ้านแหลม	76100	760705	7607	76
7120	ท่าตะคร้อ	หนองหญ้าปล้อง	76160	760304	7603	76
7121	ยางน้ำกลัดเหนือ	หนองหญ้าปล้อง	76160	760302	7603	76
7122	ยางน้ำกลัดใต้	หนองหญ้าปล้อง	76160	760303	7603	76
7123	หนองหญ้าปล้อง	หนองหญ้าปล้อง	76160	760299	7603	76
7124	ทับคาง	เขาย้อย	76140	760204	7602	76
7125	บางเค็ม	เขาย้อย	76140	760203	7602	76
7126	สระพัง	เขาย้อย	76140	760202	7602	76
7127	หนองชุมพล	เขาย้อย	76140	760207	7602	76
7128	หนองชุมพลเหนือ	เขาย้อย	76140	760210	7602	76
7129	หนองปรง	เขาย้อย	76140	760206	7602	76
7130	หนองปลาไหล	เขาย้อย	76140	760205	7602	76
7131	ห้วยท่าช้าง	เขาย้อย	76140	760209	7602	76
7132	ห้วยโรง	เขาย้อย	76140	760208	7602	76
7133	เขาย้อย	เขาย้อย	76140	760201	7602	76
7134	คลองกระแชง	เมืองเพชรบุรี	76000	760102	7601	76
7135	ช่องสะแก	เมืองเพชรบุรี	76000	760113	7601	76
7136	ดอนยาง	เมืองเพชรบุรี	76000	760122	7601	76
7137	ต้นมะพร้าว	เมืองเพชรบุรี	76000	760119	7601	76
7138	ต้นมะม่วง	เมืองเพชรบุรี	76000	760112	7601	76
7139	ท่าราบ	เมืองเพชรบุรี	76000	760101	7601	76
7140	ธงชัย	เมืองเพชรบุรี	76000	760105	7601	76
7141	นาพันสาม	เมืองเพชรบุรี	76000	760104	7601	76
7142	นาวุ้ง	เมืองเพชรบุรี	76000	760114	7601	76
7143	บางจาก	เมืองเพชรบุรี	76000	760110	7601	76
7144	บางจาน	เมืองเพชรบุรี	76000	760103	7601	76
7145	บ้านกุ่ม	เมืองเพชรบุรี	76000	760106	7601	76
7146	บ้านหม้อ	เมืองเพชรบุรี	76000	760111	7601	76
7147	วังตะโก	เมืองเพชรบุรี	76000	760120	7601	76
7148	สำมะโรง	เมืองเพชรบุรี	76000	760115	7601	76
7149	หนองขนาน	เมืองเพชรบุรี	76000	760123	7601	76
7150	หนองพลับ	เมืองเพชรบุรี	76000	760124	7601	76
7151	หนองโสน	เมืองเพชรบุรี	76000	760107	7601	76
7152	หัวสะพาน	เมืองเพชรบุรี	76000	760118	7601	76
7153	หาดเจ้าสำราญ	เมืองเพชรบุรี	76100	760117	7601	76
7154	เวียงคอย	เมืองเพชรบุรี	76000	760109	7601	76
7155	โพพระ	เมืองเพชรบุรี	76000	760116	7601	76
7156	โพไร่หวาน	เมืองเพชรบุรี	76000	760121	7601	76
7157	ไร่ส้ม	เมืองเพชรบุรี	76000	760108	7601	76
7158	ป่าเด็ง	แก่งกระจาน	76170	760804	7608	76
7159	พุสวรรค์	แก่งกระจาน	76170	760805	7608	76
7160	วังจันทร์	แก่งกระจาน	76170	760508	7608	76
7161	สองพี่น้อง	แก่งกระจาน	76170	760509	7608	76
7162	ห้วยแม่เพรียง	แก่งกระจาน	76170	760806	7608	76
7163	แก่งกระจาน	แก่งกระจาน	76170	760510	7608	76
7164	ชนแดน	ชนแดน	67150	670201	6702	67
7165	ซับพุทรา	ชนแดน	67150	670208	6702	67
7166	ดงขุย	ชนแดน	67190	670202	6702	67
7167	ตะกุดไร	ชนแดน	67190	670209	6702	67
7168	ท่าข้าม	ชนแดน	67150	670203	6702	67
7169	บ้านกล้วย	ชนแดน	67190	670206	6702	67
7170	พุทธบาท	ชนแดน	67150	670204	6702	67
7171	ลาดแค	ชนแดน	67150	670205	6702	67
7172	ศาลาลาย	ชนแดน	67150	670210	6702	67
7173	น้ำหนาว	น้ำหนาว	67260	670499	6709	67
7174	วังกวาง	น้ำหนาว	67260	670903	6709	67
7175	หลักด่าน	น้ำหนาว	67260	670902	6709	67
7176	โคกมน	น้ำหนาว	67260	670904	6709	67
7177	กันจุ	บึงสามพัน	67160	670804	6708	67
7178	ซับสมอทอด	บึงสามพัน	67160	670801	6708	67
7179	ซับไม้แดง	บึงสามพัน	67160	670802	6708	67
7180	บึงสามพัน	บึงสามพัน	67160	670809	6708	67
7181	พญาวัง	บึงสามพัน	67160	670806	6708	67
7182	วังพิกุล	บึงสามพัน	67230	670805	6708	67
7183	ศรีมงคล	บึงสามพัน	67160	670807	6708	67
7184	สระแก้ว	บึงสามพัน	67160	670808	6708	67
7185	หนองแจง	บึงสามพัน	67160	670803	6708	67
7186	ซับเปิบ	วังโป่ง	67240	671003	6710	67
7187	ท้ายดง	วังโป่ง	67240	670298	6710	67
7188	วังศาล	วังโป่ง	67240	671005	6710	67
7189	วังหิน	วังโป่ง	67240	671004	6710	67
7190	วังโป่ง	วังโป่ง	67240	670299	6710	67
7191	ซับน้อย	วิเชียรบุรี	67180	670514	6705	67
7192	ซับสมบูรณ์	วิเชียรบุรี	67180	670510	6705	67
7193	ท่าโรง	วิเชียรบุรี	67130	670501	6705	67
7194	น้ำร้อน	วิเชียรบุรี	67130	670114	6705	67
7195	บึงกระจับ	วิเชียรบุรี	67130	670511	6705	67
7196	บ่อรัง	วิเชียรบุรี	67130	670506	6705	67
7197	พุขาม	วิเชียรบุรี	67180	670508	6705	67
7198	พุเตย	วิเชียรบุรี	67180	670507	6705	67
7199	ภูน้ำหยด	วิเชียรบุรี	67180	670509	6705	67
7200	ยางสาว	วิเชียรบุรี	67130	670513	6705	67
7201	วังใหญ่	วิเชียรบุรี	67180	670512	6705	67
7202	สระประดู่	วิเชียรบุรี	67130	670502	6705	67
7203	สามแยก	วิเชียรบุรี	67130	670503	6705	67
7204	โคกปรง	วิเชียรบุรี	67130	670504	6705	67
7205	คลองกระจัง	ศรีเทพ	67170	670597	6706	67
7206	นาสนุ่น	ศรีเทพ	67170	670595	6706	67
7207	ประดู่งาม	ศรีเทพ	67170	670607	6706	67
7208	ศรีเทพ	ศรีเทพ	67170	670599	6706	67
7209	สระกรวด	ศรีเทพ	67170	670598	6706	67
7210	หนองย่างทอย	ศรีเทพ	67170	670606	6706	67
7211	โคกสะอาด	ศรีเทพ	67170	670605	6706	67
7212	กองทูล	หนองไผ่	67140	670701	6707	67
7213	ท่าด้วง	หนองไผ่	67140	670713	6707	67
7214	ท่าแดง	หนองไผ่	67140	670704	6707	67
7215	นาเฉลียง	หนองไผ่	67220	670702	6707	67
7216	บัววัฒนา	หนองไผ่	67140	670709	6707	67
7217	บ่อไทย	หนองไผ่	67140	670706	6707	67
7218	บ้านโภชน์	หนองไผ่	67140	670703	6707	67
7219	ยางงาม	หนองไผ่	67220	670712	6707	67
7220	วังท่าดี	หนองไผ่	67140	670708	6707	67
7221	วังโบสถ์	หนองไผ่	67140	670711	6707	67
7222	หนองไผ่	หนองไผ่	67140	670710	6707	67
7223	ห้วยโป่ง	หนองไผ่	67220	670707	6707	67
7224	เพชรละคร	หนองไผ่	67140	670705	6707	67
7225	ช้างตะลูด	หล่มสัก	67110	670320	6703	67
7226	ตาลเดี่ยว	หล่มสัก	67110	670303	6703	67
7227	ท่าอิบุญ	หล่มสัก	67110	670308	6703	67
7228	น้ำก้อ	หล่มสัก	67110	670312	6703	67
7229	น้ำชุน	หล่มสัก	67110	670314	6703	67
7230	น้ำเฮี้ย	หล่มสัก	67110	670306	6703	67
7231	บุ่งคล้า	หล่มสัก	67110	670317	6703	67
7232	บุ่งน้ำเต้า	หล่มสัก	67110	670318	6703	67
7233	บ้านกลาง	หล่มสัก	67110	670319	6703	67
7234	บ้านติ้ว	หล่มสัก	67110	670310	6703	67
7235	บ้านหวาย	หล่มสัก	67110	670323	6703	67
7236	บ้านโสก	หล่มสัก	67110	670309	6703	67
7237	บ้านไร่	หล่มสัก	67110	670321	6703	67
7238	ปากช่อง	หล่มสัก	67110	670313	6703	67
7239	ปากดุก	หล่มสัก	67110	670322	6703	67
7240	ฝายนาแซง	หล่มสัก	67110	670304	6703	67
7241	ลานบ่า	หล่มสัก	67110	670316	6703	67
7242	วัดป่า	หล่มสัก	67110	670302	6703	67
7243	สักหลง	หล่มสัก	67110	670307	6703	67
7244	หนองสว่าง	หล่มสัก	67110	670305	6703	67
7245	หนองไขว่	หล่มสัก	67110	670315	6703	67
7246	หล่มสัก	หล่มสัก	67110	670301	6703	67
7247	ห้วยไร่	หล่มสัก	67110	670311	6703	67
7248	ตาดกลอย	หล่มเก่า	67120	670409	6704	67
7249	นาซำ	หล่มเก่า	67120	670402	6704	67
7250	นาเกาะ	หล่มเก่า	67120	670408	6704	67
7251	นาแซง	หล่มเก่า	67120	670406	6704	67
7252	บ้านเนิน	หล่มเก่า	67120	670404	6704	67
7253	วังบาล	หล่มเก่า	67120	670407	6704	67
7254	ศิลา	หล่มเก่า	67120	670405	6704	67
7255	หล่มเก่า	หล่มเก่า	67120	670401	6704	67
7256	หินฮาว	หล่มเก่า	67120	670403	6704	67
7257	ทุ่งสมอ	เขาค้อ	67270	671101	6711	67
7258	ริมสีม่วง	เขาค้อ	67270	671104	6711	67
7259	สะเดาะพง	เขาค้อ	67270	671105	6711	67
7260	หนองแม่นา	เขาค้อ	67270	671106	6711	67
7261	เขาค้อ	เขาค้อ	67270	671103	6711	67
7262	เข็กน้อย	เขาค้อ	67280	671107	6711	67
7263	แคมป์สน	เขาค้อ	67280	670399	6711	67
7264	ชอนไพร	เมืองเพชรบูรณ์	67000	670110	6701	67
7265	ดงมูลเหล็ก	เมืองเพชรบูรณ์	67000	670108	6701	67
7266	ตะเบาะ	เมืองเพชรบูรณ์	67000	670102	6701	67
7267	ท่าพล	เมืองเพชรบูรณ์	67250	670107	6701	67
7268	นางั่ว	เมืองเพชรบูรณ์	67000	670106	6701	67
7269	นาป่า	เมืองเพชรบูรณ์	67000	670111	6701	67
7270	นายม	เมืองเพชรบูรณ์	67210	670112	6701	67
7271	น้ำร้อน	เมืองเพชรบูรณ์	67000	670114	6701	67
7272	บ้านโคก	เมืองเพชรบูรณ์	67000	670109	6701	67
7273	บ้านโตก	เมืองเพชรบูรณ์	67000	670103	6701	67
7274	ป่าเลา	เมืองเพชรบูรณ์	67000	670105	6701	67
7275	ระวิง	เมืองเพชรบูรณ์	67210	670117	6701	67
7276	วังชมภู	เมืองเพชรบูรณ์	67210	670113	6701	67
7277	สะเดียง	เมืองเพชรบูรณ์	67000	670104	6701	67
7278	ห้วยสะแก	เมืองเพชรบูรณ์	67210	670115	6701	67
7279	ห้วยใหญ่	เมืองเพชรบูรณ์	67000	670116	6701	67
7280	ในเมือง	เมืองเพชรบูรณ์	67000	670101	6701	67
7281	กกสะทอน	ด่านซ้าย	42120	420507	4205	42
7282	ด่านซ้าย	ด่านซ้าย	42120	420501	4205	42
7283	นาดี	ด่านซ้าย	42120	420503	4205	42
7284	นาหอ	ด่านซ้าย	42120	420510	4205	42
7285	ปากหมัน	ด่านซ้าย	42120	420502	4205	42
7286	วังยาว	ด่านซ้าย	42120	420509	4205	42
7287	อิปุ่ม	ด่านซ้าย	42120	420506	4205	42
7288	โคกงาม	ด่านซ้าย	42120	420504	4205	42
7289	โป่ง	ด่านซ้าย	42120	420508	4205	42
7290	โพนสูง	ด่านซ้าย	42120	420505	4205	42
7291	ท่าลี่	ท่าลี่	42140	420801	4208	42
7292	น้ำทูน	ท่าลี่	42140	420806	4208	42
7293	น้ำแคม	ท่าลี่	42140	420804	4208	42
7294	หนองผือ	ท่าลี่	42140	420802	4208	42
7295	อาฮี	ท่าลี่	42140	420803	4208	42
7296	โคกใหญ่	ท่าลี่	42140	420805	4208	42
7297	ท่าสวรรค์	นาด้วง	42210	420204	4202	42
7298	ท่าสะอาด	นาด้วง	42210	420203	4202	42
7299	นาดอกคำ	นาด้วง	42210	420202	4202	42
7300	นาด้วง	นาด้วง	42210	420201	4202	42
7301	นาพึง	นาแห้ว	42170	420603	4206	42
7302	นามาลา	นาแห้ว	42170	420604	4206	42
7303	นาแห้ว	นาแห้ว	42170	420599	4206	42
7304	เหล่ากอหก	นาแห้ว	42170	420605	4206	42
7305	แสงภา	นาแห้ว	42170	420594	4206	42
7306	ชมเจริญ	ปากชม	42150	420406	4204	42
7307	ปากชม	ปากชม	42150	420401	4204	42
7308	หาดคัมภีร์	ปากชม	42150	420403	4204	42
7309	ห้วยบ่อซืน	ปากชม	42150	420404	4204	42
7310	ห้วยพิชัย	ปากชม	42150	420405	4204	42
7311	เชียงกลม	ปากชม	42150	420402	4204	42
7312	ท่าช้างคล้อง	ผาขาว	42240	421003	4212	42
7313	บ้านเพิ่ม	ผาขาว	42240	421205	4212	42
7314	ผาขาว	ผาขาว	42240	421004	4212	42
7315	โนนปอแดง	ผาขาว	42240	421009	4212	42
7316	โนนป่าซาง	ผาขาว	42240	421006	4212	42
7317	ผานกเค้า	ภูกระดึง	42180	421005	4210	42
7318	ภูกระดึง	ภูกระดึง	42180	421007	4210	42
7319	ศรีฐาน	ภูกระดึง	42180	421001	4210	42
7320	ห้วยส้ม	ภูกระดึง	42180	421010	4210	42
7321	ภูหอ	ภูหลวง	42230	420999	4211	42
7322	หนองคัน	ภูหลวง	42230	420998	4211	42
7323	ห้วยสีเสียด	ภูหลวง	42230	421104	4211	42
7324	เลยวังไสย์	ภูหลวง	42230	421105	4211	42
7325	แก่งศรีภูมิ	ภูหลวง	42230	421106	4211	42
7326	ท่าศาลา	ภูเรือ	42160	420597	4207	42
7327	ปลาบ่า	ภูเรือ	42160	420595	4207	42
7328	ร่องจิก	ภูเรือ	42160	420593	4207	42
7329	ลาดค่าง	ภูเรือ	42160	420705	4207	42
7330	สานตม	ภูเรือ	42160	420706	4207	42
7331	หนองบัว	ภูเรือ	42160	420598	4207	42
7332	ทรายขาว	วังสะพุง	42130	420902	4209	42
7333	ปากปวน	วังสะพุง	42130	420905	4209	42
7334	ผาน้อย	วังสะพุง	42130	420906	4209	42
7335	ผาบิ้ง	วังสะพุง	42130	420910	4209	42
7336	วังสะพุง	วังสะพุง	42130	420901	4209	42
7337	ศรีสงคราม	วังสะพุง	42130	420913	4209	42
7338	หนองงิ้ว	วังสะพุง	42130	420904	4209	42
7339	หนองหญ้าปล้อง	วังสะพุง	42130	420903	4209	42
7340	เขาหลวง	วังสะพุง	42130	420911	4209	42
7341	โคกขมิ้น	วังสะพุง	42130	420912	4209	42
7342	ตาดข่า	หนองหิน	42190	421011	4214	42
7343	ปวนพุ	หนองหิน	42190	421002	4214	42
7344	หนองหิน	หนองหิน	42190	421008	4214	42
7345	จอมศรี	เชียงคาน	42110	420307	4203	42
7346	ธาตุ	เชียงคาน	42110	420302	4203	42
7347	นาซ่าว	เชียงคาน	42110	420303	4203	42
7348	บุฮม	เชียงคาน	42110	420306	4203	42
7349	ปากตม	เชียงคาน	42110	420305	4203	42
7350	หาดทรายขาว	เชียงคาน	42110	420308	4203	42
7351	เขาแก้ว	เชียงคาน	42110	420304	4203	42
7352	เชียงคาน	เชียงคาน	42110	420301	4203	42
7353	กกดู่	เมืองเลย	42000	420104	4201	42
7354	กกทอง	เมืองเลย	42000	420114	4201	42
7355	กุดป่อง	เมืองเลย	42000	420101	4201	42
7356	ชัยพฤกษ์	เมืองเลย	42000	420111	4201	42
7357	นาดินดำ	เมืองเลย	42000	420109	4201	42
7358	นาอาน	เมืองเลย	42000	420107	4201	42
7359	นาอ้อ	เมืองเลย	42100	420103	4201	42
7360	นาแขม	เมืองเลย	42000	420112	4201	42
7361	นาโป่ง	เมืองเลย	42000	420108	4201	42
7362	น้ำสวย	เมืองเลย	42000	420110	4201	42
7363	น้ำหมาน	เมืองเลย	42000	420105	4201	42
7364	ศรีสองรัก	เมืองเลย	42100	420113	4201	42
7365	เมือง	เมืองเลย	42000	420102	4201	42
7366	เสี้ยว	เมืองเลย	42000	420106	4201	42
7367	ทรัพย์ไพวัลย์	เอราวัณ	42220	420914	4213	42
7368	ผาสามยอด	เอราวัณ	42220	420909	4213	42
7369	ผาอินทร์แปลง	เอราวัณ	42220	420908	4213	42
7370	เอราวัณ	เอราวัณ	42220	420907	4213	42
7371	ทุ่งศรี	ร้องกวาง	54140	540207	5402	54
7372	น้ำเลา	ร้องกวาง	54140	540205	5402	54
7373	บ้านเวียง	ร้องกวาง	54140	540206	5402	54
7374	ร้องกวาง	ร้องกวาง	54140	540201	5402	54
7375	ร้องเข็ม	ร้องกวาง	54140	540204	5402	54
7376	ห้วยโรง	ร้องกวาง	54140	540213	5402	54
7377	แม่ทราย	ร้องกวาง	54140	540214	5402	54
7378	แม่ยางตาล	ร้องกวาง	54140	540208	5402	54
7379	แม่ยางร้อง	ร้องกวาง	54140	540215	5402	54
7380	แม่ยางฮ่อ	ร้องกวาง	54140	540209	5402	54
7381	ไผ่โทน	ร้องกวาง	54140	540210	5402	54
7382	ต้าผามอก	ลอง	54150	540303	5403	54
7383	ทุ่งแล้ง	ลอง	54150	540307	5403	54
7384	บ่อเหล็กลอง	ลอง	54150	540308	5403	54
7385	บ้านปิน	ลอง	54150	540302	5403	54
7386	ปากกาง	ลอง	54150	540305	5403	54
7387	หัวทุ่ง	ลอง	54150	540306	5403	54
7388	ห้วยอ้อ	ลอง	54150	540301	5403	54
7389	เวียงต้า	ลอง	54150	540304	5403	54
7390	แม่ปาน	ลอง	54150	540309	5403	54
7391	นาพูน	วังชิ้น	54160	540704	5407	54
7392	ป่าสัก	วังชิ้น	54160	540706	5407	54
7393	วังชิ้น	วังชิ้น	54160	540701	5407	54
7394	สรอย	วังชิ้น	54160	540702	5407	54
7395	แม่ป้าก	วังชิ้น	54160	540703	5407	54
7396	แม่พุง	วังชิ้น	54160	540705	5407	54
7397	แม่เกิ๋ง	วังชิ้น	54160	540707	5407	54
7398	ทุ่งน้าว	สอง	54120	540608	5406	54
7399	บ้านกลาง	สอง	54120	540602	5406	54
7400	บ้านหนุน	สอง	54120	540601	5406	54
7401	สะเอียบ	สอง	54120	540606	5406	54
7402	หัวเมือง	สอง	54120	540605	5406	54
7403	ห้วยหม้าย	สอง	54120	540603	5406	54
7404	เตาปูน	สอง	54120	540604	5406	54
7405	แดนชุมพล	สอง	54120	540607	5406	54
7406	ดอนมูล	สูงเม่น	54130	540404	5404	54
7407	น้ำชำ	สูงเม่น	54130	540103	5404	54
7408	บ้านกวาง	สูงเม่น	54130	540406	5404	54
7409	บ้านกาศ	สูงเม่น	54130	540408	5404	54
7410	บ้านปง	สูงเม่น	54130	540407	5404	54
7411	บ้านเหล่า	สูงเม่น	54130	540405	5404	54
7412	พระหลวง	สูงเม่น	54130	540412	5404	54
7413	ร่องกาศ	สูงเม่น	54130	540409	5404	54
7414	สบสาย	สูงเม่น	54130	540410	5404	54
7415	สูงเม่น	สูงเม่น	54130	540401	5404	54
7416	หัวฝาย	สูงเม่น	54130	540403	5404	54
7417	เวียงทอง	สูงเม่น	54000	540411	5404	54
7418	ตำหนักธรรม	หนองม่วงไข่	54170	540805	5408	54
7419	ทุ่งแค้ว	หนองม่วงไข่	54170	540806	5408	54
7420	น้ำรัด	หนองม่วงไข่	54170	540211	5408	54
7421	วังหลวง	หนองม่วงไข่	54170	540212	5408	54
7422	หนองม่วงไข่	หนองม่วงไข่	54170	540202	5408	54
7423	แม่คำมี	หนองม่วงไข่	54170	540114	5408	54
7424	ปงป่าหวาย	เด่นชัย	54110	540505	5405	54
7425	ห้วยไร่	เด่นชัย	54110	540504	5405	54
7426	เด่นชัย	เด่นชัย	54110	540501	5405	54
7427	แม่จั๊วะ	เด่นชัย	54110	540502	5405	54
7428	ไทรย้อย	เด่นชัย	54110	540503	5405	54
7429	กาญจนา	เมืองแพร่	54000	540120	5401	54
7430	ช่อแฮ	เมืองแพร่	54000	540118	5401	54
7431	ทุ่งกวาว	เมืองแพร่	54000	540115	5401	54
7432	ทุ่งโฮ้ง	เมืองแพร่	54000	540105	5401	54
7433	ท่าข้าม	เมืองแพร่	54000	540116	5401	54
7434	นาจักร	เมืองแพร่	54000	540102	5401	54
7435	น้ำชำ	เมืองแพร่	54000	540103	5401	54
7436	บ้านถิ่น	เมืองแพร่	54000	540111	5401	54
7437	ป่าแดง	เมืองแพร่	54000	540104	5401	54
7438	ป่าแมต	เมืองแพร่	54000	540110	5401	54
7439	ร่องฟอง	เมืองแพร่	54000	540119	5401	54
7440	วังธง	เมืองแพร่	54000	540107	5401	54
7441	วังหงษ์	เมืองแพร่	54000	false	5401	54
7442	สวนเขื่อน	เมืองแพร่	54000	540112	5401	54
7443	ห้วยม้า	เมืองแพร่	54000	540109	5401	54
7444	เหมืองหม้อ	เมืองแพร่	54000	540106	5401	54
7445	แม่คำมี	เมืองแพร่	54000	540114	5401	54
7446	แม่ยม	เมืองแพร่	54000	540117	5401	54
7447	แม่หล่าย	เมืองแพร่	54000	540108	5401	54
7448	ในเวียง	เมืองแพร่	54000	540101	5401	54
7449	ขุนยวม	ขุนยวม	58140	580201	5802	58
7450	เมืองปอน	ขุนยวม	58140	580203	5802	58
7451	แม่กิ๊	ขุนยวม	58140	580205	5802	58
7452	แม่ยวมน้อย	ขุนยวม	58140	580204	5802	58
7453	แม่อูคอ	ขุนยวม	58140	580206	5802	58
7454	แม่เงา	ขุนยวม	58140	580202	5802	58
7455	ถ้ำลอด	ปางมะผ้า	58150	580703	5807	58
7456	นาปู่ป้อม	ปางมะผ้า	58150	580704	5807	58
7457	ปางมะผ้า	ปางมะผ้า	58150	580107	5807	58
7458	สบป่อง	ปางมะผ้า	58150	580108	5807	58
7459	ทุ่งยาว	ปาย	58130	580305	5803	58
7460	เมืองแปง	ปาย	58130	580306	5803	58
7461	เวียงเหนือ	ปาย	58130	580302	5803	58
7462	เวียงใต้	ปาย	58130	580301	5803	58
7463	แม่นาเติง	ปาย	58130	580303	5803	58
7464	แม่ฮี้	ปาย	58130	580304	5803	58
7465	โป่งสา	ปาย	58130	580307	5803	58
7466	กองก๋อย	สบเมย	58110	580603	5806	58
7467	ป่าโปง	สบเมย	58110	580605	5806	58
7468	สบเมย	สบเมย	58110	580499	5806	58
7469	แม่คะตวน	สบเมย	58110	580498	5806	58
7470	แม่สวด	สบเมย	58110	580604	5806	58
7471	แม่สามแลบ	สบเมย	58110	580606	5806	58
7472	จองคำ	เมืองแม่ฮ่องสอน	58000	580101	5801	58
7473	ปางหมู	เมืองแม่ฮ่องสอน	58000	580104	5801	58
7474	ผาบ่อง	เมืองแม่ฮ่องสอน	58000	580103	5801	58
7475	หมอกจำแป่	เมืองแม่ฮ่องสอน	58000	580105	5801	58
7476	ห้วยปูลิง	เมืองแม่ฮ่องสอน	58000	580109	5801	58
7477	ห้วยผา	เมืองแม่ฮ่องสอน	58000	580106	5801	58
7478	ห้วยโป่ง	เมืองแม่ฮ่องสอน	58000	580102	5801	58
7479	ขุนแม่ลาน้อย	แม่ลาน้อย	58120	580508	5805	58
7480	ท่าผาปุ้ม	แม่ลาน้อย	58120	580503	5805	58
7481	สันติคีรี	แม่ลาน้อย	58120	580507	5805	58
7482	ห้วยห้อม	แม่ลาน้อย	58120	580505	5805	58
7483	แม่นาจาง	แม่ลาน้อย	58120	580506	5805	58
7484	แม่ลาน้อย	แม่ลาน้อย	58120	580501	5805	58
7485	แม่ลาหลวง	แม่ลาน้อย	58120	580502	5805	58
7486	แม่โถ	แม่ลาน้อย	58120	580504	5805	58
7487	บ้านกาศ	แม่สะเรียง	58110	580401	5804	58
7488	ป่าแป๋	แม่สะเรียง	58110	580408	5804	58
7489	เสาหิน	แม่สะเรียง	58110	580406	5804	58
7490	แม่คง	แม่สะเรียง	58110	580403	5804	58
7491	แม่ยวม	แม่สะเรียง	58110	580405	5804	58
7492	แม่สะเรียง	แม่สะเรียง	58110	580402	5804	58
7493	แม่เหาะ	แม่สะเรียง	58110	580404	5804	58
\.


--
-- Data for Name: marriedstatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.marriedstatus (id, title) FROM stdin;
1	โสด
2	สมรส
3	หย่า
4	หม้าย
\.


--
-- Data for Name: mortgagesecuritiesperloanoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mortgagesecuritiesperloanoption (id, code, title, score, criteria_no) FROM stdin;
1	1	มูลค่าหลักทรัพย์ค้ำประกันน้อยกว่าวงเงินกู้ หรือไม่มีหลักทรัพย์ค้ำประกัน	1	4
2	4	มูลค่าหลักทรัพย์ค้ำประกัน = วงเงินกู้	4	4
3	5	มูลค่าหลักทรัพย์ค้ำประกัน > วงเงินกู้	5	4
\.


--
-- Data for Name: paydebthistoryoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paydebthistoryoption (id, code, title, score, criteria_no) FROM stdin;
1	0	--กรุณาระบุประวัติการชำระหนี้ของท่าน--	1	1
2	1	มีประวัติค้างชำระ,เบี้ยวหนี้, พฤติกรรมไม่โปร่งใส มากกว่า 3ครั้ง ภายในระยะเวลา 3 ปี	1	1
3	2	มีประวัติค้างชำระ,เบี้ยวหนี้, พฤติกรรมไม่โปร่งใส 3ครั้ง ภายในระยะเวลา 3 ปี	2	1
4	3	มีประวัติค้างชำระ,เบี้ยวหนี้, พฤติกรรมไม่โปร่งใส 2ครั้ง ภายในระยะเวลา 3 ปี	3	1
5	4	มีประวัติค้างชำระ,เบี้ยวหนี้, พฤติกรรมไม่โปร่งใส 1ครั้ง ภายในระยะเวลา 3 ปี	4	1
6	5	ไม่มี ประวัติค้างชำระ,เบี้ยวหนี้, พฤติกรรมไม่โปร่งใส ภายในระยะเวลา 3 ปี 	5	1
\.


--
-- Data for Name: permissionaccess; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissionaccess (id, accessshowloanernewlistadmin, accessshowloanernewlistworker, accessshowloanerinverifylistadmin, accessshowloanerinverifylistworker, accessshowloanerwaitapprovelistadmin, accessshowloanerwaitapprovelistworker, verifyquestionnairebyadmin, verifyquestionnairebyworker, sendtoapprovebyadmin, sendtoapprovebyworker, accessshowloanerhadapprovelistadmin, accessshowloanerhadapprovelistworker, accessshowloanerhaddenylistadmin, accessshowloanerhaddenylistworker, accessshowloanernotmakelistadmin, accessshowloanernotmakelistworker) FROM stdin;
1	t	t	t	t	t	t	t	t	t	f	t	f	t	f	t	f
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (id, code, title, title_en, score, geographyid) FROM stdin;
2	51	ลำพูน	\N	4	1
3	52	ลำปาง	\N	1	1
4	53	อุตรดิตถ์	\N	1	1
5	54	แพร่	\N	1	1
6	55	น่าน	\N	1	1
7	56	พะเยา	\N	1	1
9	58	แม่ฮ่องสอน	\N	1	1
12	18	ชัยนาท	\N	1	2
13	26	นครนายก	\N	1	2
14	73	นครปฐม	\N	1	2
15	60	นครสวรรค์	\N	1	2
16	12	นนทรบุรี	\N	1	2
17	13	ปทุมธานี	\N	1	2
18	14	พระนครศรีอยุธยา	\N	1	2
19	66	พิจิตร	\N	1	2
20	65	พิษณุโลก	\N	1	2
21	16	ลพบุรี	\N	1	2
22	11	สมุทรปราการ	\N	1	2
23	75	สมุทรสงคราม	\N	1	2
24	74	สมุทรสาคร	\N	1	2
25	19	สระบุรี	\N	1	2
26	17	สิงห์บุรี	\N	1	2
27	72	สุพรรณบุรี	\N	1	2
28	64	สุโขทัย	\N	1	2
29	61	อุทัยธานี	\N	1	2
30	15	อ่างทอง	\N	1	2
31	67	เพชรบูรณ์	\N	1	2
33	24	ฉะเชิงเทรา	\N	1	3
34	20	ชลบุรี	\N	1	3
35	23	ตราด	\N	1	3
36	25	ปราจีนบุรี	\N	1	3
37	21	ระยอง	\N	1	3
38	27	สระแก้ว	\N	1	3
39	46	กาฬสินธุ์	\N	1	4
40	40	ขอนแก่น	\N	1	4
41	36	ชัยภูมิ	\N	1	4
42	48	นครพนม	\N	1	4
43	30	นครราชสีมา	\N	1	4
44	38	บึงกาฬ	\N	1	4
45	31	บุรีรัมย์	\N	1	4
46	44	มหาสารคาม	\N	1	4
47	49	มุกดาหาร	\N	1	4
49	45	ร้อยเอ็ด	\N	1	4
50	33	ศรีสะเกษ	\N	1	4
51	47	สกลนคร	\N	1	4
52	32	สุรินทร์	\N	1	4
53	43	หนองคาย	\N	1	4
54	39	หนองบัวลำภู	\N	1	4
55	37	อำนาจเจริญ	\N	1	4
56	41	อุดรธานี	\N	1	4
57	34	อุบลราชธานี	\N	1	4
58	42	เลย	\N	1	4
59	71	กาญจนบุรี	\N	1	5
60	63	ตาก	\N	1	5
61	77	ประจวบตีรีขันธ์	\N	1	5
62	70	ราชบุรี	\N	1	5
64	81	กระบี่	\N	1	6
65	86	ชุมพร	\N	1	6
66	92	ตรัง	\N	1	6
67	80	นครศรีธรรมราช	\N	1	6
68	96	นราธิวาส	\N	1	6
69	94	ปัตตานี	\N	1	6
70	82	พังงา	\N	1	6
71	93	พัทลุง	\N	1	6
72	83	ภูเก็ต	\N	1	6
73	95	ยะลา	\N	1	6
74	85	ระนอง	\N	1	6
75	90	สงขลา	\N	1	6
76	91	สตูล	\N	1	6
77	84	สุราษฎร์ธานี	\N	1	6
10	10	กรุงเทพมหานคร	\N	2	2
8	57	เชียงราย	\N	2	1
11	62	กำแพงเพชร	\N	1	2
63	76	เพชรบุรี	\N	1	5
48	35	ยโสธร	\N	1	4
32	22	จันทบุรี	\N	1	3
1	50	เชียงใหม่	\N	2	1
\.


--
-- Data for Name: questionnaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questionnaire (id, loanerid, updatedby, approveby, statusid, sendat, updatedat, approverate, approvetotal, interest, verifycomment, approvecomment, creditgrade, creditrisk, risklevel, matrixindex, suggest, suggestscore, suggestgivescore, income, loan, debtpermonth, totaldebt, saving, mortgagesecurities, age, job, edu, timejob, frechangename, timeofphonenumber, timeofnameinhouseparticular, paydebthistory, statusinhouseparticular, incomeperdebt, totaldebtperyearincome, savingperloan, mortgagesecuritiesperloan, haveguarantor, iamguarantor, incometrend, loanobject, provincecode, incomew, loanw, debtpermonthw, totaldebtw, savingw, mortgagesecuritiesw, agew, jobw, eduw, timejobw, frechangenamew, timeofphonenumberw, timeofnameinhouseparticularw, paydebthistoryw, statusinhouseparticularw, incomeperdebtw, totaldebtperyearincomew, savingperloanw, mortgagesecuritiesperloanw, haveguarantorw, iamguarantorw, incometrendw, loanobjectw, provincecodew, loanerpayback, suggestw, changeresultcomment) FROM stdin;
17	46	48	\N	3	2020-03-28 11:09:51.152164+07	2020-03-28 11:09:51.152164+07	0	0	0		-	F	5	Very High Risk	F5		0	0	10000	20000	50000	100000	0	0	5	20	4	3	2	2	6	1	2	1	1	1	1	5	3	2	3	41	10000	20000	50000	100000	0	0	5	20	4	3	2	2	6	1	2	1	1	1	1	5	3	2	3	41	\N		
16	42	41	7	6	2020-03-27 15:47:12.281756+07	2020-03-27 15:47:12.281756+07	0	0	0	ส่งอีกรอบ	ทดสอบไม่อนุมัติ	B	3	Medium Risk	B3	กฤษดา ตั้งสุภวง	0	0	21000	31000	8100	110000	210000	0	4	14	5	5	5	5	7	5	5	5	1	5	1	5	5	3	3	35	21000	31000	8100	110000	210000	0	4	14	5	5	5	5	7	5	5	5	1	5	1	5	5	3	3	35	0	กฤษดา นิล	
18	47	41	\N	3	2020-03-28 11:26:58.374576+07	2020-03-28 11:26:58.374576+07	0	0	0		-	C	5	High Risk	C5		0	0	15000	30000	0	0	0	0	4	13	3	4	2	3	4	4	5	5	5	1	1	5	5	2	3	23	15000	30000	0	0	0	0	4	13	3	4	2	3	4	4	5	5	5	1	1	5	5	2	3	23	\N		
19	49	41	7	5	2020-04-17 14:05:24.411252+07	2020-04-17 14:05:24.411252+07	80	32000	11	ทดสอบ3	ทดสอบ4	F	5	Very High Risk	F5		0	0	1000	40000	30000	150000	5000	0	3	2	4	3	2	2	3	3	2	1	1	3	1	1	3	4	2	24	1000	40000	30000	150000	5000	0	3	2	2	2	2	2	3	3	2	1	1	3	1	1	5	3	2	63	35520		อนุมัติ6
15	39	7	7	5	2020-02-25 09:13:42.163359+07	2020-02-25 09:13:42.163359+07	80	28000	16		ทดสอบอนุมัติสินเชื่อ1	B	1	Very Low Risk	B1	วีณา ไกรสรกิตติ	1	2	25000	35000	15000	20000	200000	0	4	18	5	5	5	5	5	5	5	4	5	5	1	5	5	4	3	35	25000	35000	15000	30000	200000	0	4	18	4	4	4	5	7	5	5	4	5	5	1	5	5	3	3	35	32480	วีณา เอราวัณ	
\.


--
-- Data for Name: questionnairestatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questionnairestatus (id, title) FROM stdin;
1	ผู้กู้ทำแบบสอบถาม
2	รอการตรวจสอบข้อมูลจากพนักงาน
3	พนักงานกำลังตรวจสอบข้อมูล
5	อนุมัติ
6	ไม่อนุมัติ
4	รอผลการพิจารณาสินเชื่อ
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, title) FROM stdin;
1	super admin
2	admin
3	employee
4	customer
\.


--
-- Data for Name: savingperloanoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.savingperloanoption (id, code, title, score, criteria_no) FROM stdin;
1	1	ไม่มีเงินเก็บออมหรือทรัพย์สินปลอดภาระหนี้สำรองไว้ยามฉุกเฉิน	1	3
2	2	มีเงินออมหรือทรัพย์สินปลอดภาระหนี้ไว้อย่างน้อย 5-9% ของวงเงินกู้ 	2	3
3	3	มีเงินออมหรือทรัพย์สินปลอดภาระหนี้ไว้ 10-14% ของวงเงินกู้ 	3	3
4	4	เงินออมหรือทรัพย์สินปลอดภาระหนี้ไว้ 15-20% ของวงเงินกู้	4	3
5	5	มีเงินออมหรือทรัพย์สินปลอดภาระหนี้มากกว่า 20% ของวงเงินกู้ 	5	3
\.


--
-- Data for Name: statusinhouseparticularoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statusinhouseparticularoption (id, code, title, score, criteria_no) FROM stdin;
2	1	ไม่มีชื่ออยู่ในทะเบียนบ้านและไม่ใช่เจ้าของที่ดิน	1	1
3	2	เป็นผู้อยู่อาศัยและไม่ใช่เจ้าของที่ดิน	2	1
4	3	เป็นเจ้าบ้านและไม่ใช่เจ้าของที่ดิน หรือ เป็นเจ้าของกรรมสิทธิ์ในที่อยู่อาศัยเช่น คอนโดมิเนี่ยม	3	1
5	4	เป็นผู้อยู่อาศัยในทะเบียนบ้านและเป็นเจ้าของที่ดิน	4	1
6	5	เป็นเจ้าบ้านและเจ้าของที่ดิน	5	1
1	0	--กรุณาระบุสถานะภาพในทะเบียนบ้านของท่าน--	1	1
\.


--
-- Data for Name: timejoboption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timejoboption (id, code, title, score, criteria_no) FROM stdin;
1	0	--กรุณาระบุระยะเวลาที่ทำงานในอาชีพปัจจุบัน--	1	1
2	1	น้อยกว่า 1 ปี	1	1
3	2	ระหว่าง 1-2 ปี	2	1
4	3	ระหว่าง 3-4 ปี	3	1
5	4	ระหว่าง 5-6 ปี	4	1
6	5	มากกว่า 6 ปี	5	1
\.


--
-- Data for Name: timeofnameinhouseparticularoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timeofnameinhouseparticularoption (id, code, title, score, criteria_no) FROM stdin;
1	0	--กรุณาระบุระยะเวลาที่ท่านอยู่อาศัยในทะเบียนบ้านปัจจุบัน--	1	1
2	1	ต่ำกว่า 1 ปี	1	1
3	2	ระหว่าง 1-2 ปี	1	1
4	3	ระหว่าง 2-4 ปี	2	1
5	4	ระหว่าง 4-6 ปี	3	1
6	5	ระหว่าง 6-7 ปี	3	1
7	6	ระหว่าง 7-8 ปี	4	1
8	7	มากกว่า 8 ปี	5	1
\.


--
-- Data for Name: timeofphonenumberoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timeofphonenumberoption (id, code, title, score, criteria_no) FROM stdin;
1	0	--กรุณาระบุระยะเวลาที่ท่านใช้เบอร์มือถือเบอร์ปัจจุบัน--	1	1
2	1	น้อยกว่า 1 ปี	1	1
3	2	1-2 ปี	2	1
4	3	2-5 ปี	3	1
5	4	5-10 ปี	4	1
6	5	มากกว่า 10 ปี หรือ เบอร์ขึ้นต้น 081 หรือ 089	5	1
\.


--
-- Data for Name: totaldebtperyearincomeoption; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.totaldebtperyearincomeoption (id, code, title, score, criteria_no) FROM stdin;
1	1	ยอดผ่อนชำระหนี้สินต่างๆ> 40 % ของรายได้	1	2
2	2	ยอดผ่อนชำระหนี้สินต่างๆ= 40 % ของรายได้	2	2
3	3	ยอดผ่อนชำระหนี้สินต่างๆ < 40 % ของรายได้	3	2
4	4	ยอดผ่อนชำระหนี้สินต่างๆ < 30-39 % ของรายได้	4	2
5	5	ยอดผ่อนชำระหนี้สินต่างๆ < 0-29 % ของรายได้	5	2
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, roleid, citizenid, email, password, name, surname, genderid, marriedid, religion, birthday, phone, child, facebook, ig, line, address1_home, address2_home, subdistrict_home, district_home, provincecode_home, zipcode_home, office_name, address1_office, address2_office, subdistrict_office, district_office, provincecode_office, zipcode_office, forgotpasswordquestionid, forgotpasswordans) FROM stdin;
39	4	3100201509110	helloerawan@gmail.com	$2a$11$0NZIvcdxGJuxTl0mGw4RHOyvpih3rsR9rPCvXjngUNY1yneheajOO	ฉัตรชัย	ไกรสรกิตติกุล	1	2	คริสต์	01/03/1977	0874738888	0			tum7545	18/7 หมู่ 10	-	เขาบายศรี	ท่าใหม่	22	22120	บริษัท คำเขื่อนแก้วธุรกิจ จำกัด	79/1 หมู่ 9 ถ.แจ้งสนิท	-	เขื่องคำ	เมืองยโสธร	35	35000	\N	
42	4	1234567890124	hellotum@gmail.com	$2a$11$gISlKeuiTodLbrjUTvP2BOQktDKzxQROx9tDDoxhHio5FwHiUsfFG	ทยากร	ไกรสรกิติ	2	1	คริสต์	02/02/1979	0811111111	0	tum	tummm	tumm	18 ม.9	111	เขาบายศรี	ท่าใหม่	22	22120	บริษัท พาวเวอร์พิโก จำกัด	95/2	ถนนพิชิตรังสรรค์	ในเมือง	เมืองอุบลราชธานี	34	34000	2	mook
46	4	1472583692583	fon@gmail.com	$2a$11$FfqO.55bUrO9E7InGCae5O0.6HNJBcICBfG2Ej3L.BL6.gpVaHON.	จิราวรรณ	ศรีบุญเรือง	2	1	พุทธ	19/07/1982	0811234567	0				111	-	วัดใหม่	เมืองจันทบุรี	22	22000	บริษัท พาวเวอร์เรนเจอร์ จำกัด	77 หมู่ 5	ถนนแจ้งสนิท	ตาดทอง	เมืองยโสธร	35	35000	1	pizza
47	4	7418529633692	toi@gmail.com	$2a$11$d4saY45wPDU3URJyClSJdeGGnnUqlVUMIs68TemHu9Hx3wpR5iSJ2	ศศิ	ไหลไป	1	2	ฮินดู	01/06/1983	0808887745	0				111	-	หนองปลาไหล	เมืองสระบุรี	19	18000	\N	\N	\N	\N	\N	\N	\N	2	mook
49	4	8885552221321	ploy@hotmail.com	$2a$11$CUTf5xG..luS0aBcB.PO6OV16F5ZtKDTN4hRw.KNCeMxhLWTzItcy	ญดา	เอราวัณ	2	2	พุทธ	16/06/1988	0818114567	0	testployfb	testployins	testployline	เอราวัณยโสธร	112 ม.5	วงศ์สว่าง	บางซื่อ	10	10800	บจก.พาวเวอร์อุลตร้าพลอย	456 ม.9	ถนนประดิรักษ์	จตุจักร	จตุจักร	10	10900	2	mook
7	1	\N	superadmin@gmail.com	$2a$11$L7llLcZ9wSOvsA96TLr7MexvR.FhRBdzW7BLw4cuH7uWxjj2zwHmm	superAdmin_name	superAdmin_surname	1	1	-	06/06/1993	0918650000	\N	facebookAdmin	IG-Admin	lineAdmin	410 ถ.วงศ์สว่าง	-	บางซื่อ	บางซื่อ	10	10800	บริษัท คำเขื่อนแก้วธุรกิจ จำกัด	-	-	เขื่องคำ	เมืองยโสธร	35	35000	2	mook
41	2	9876543210011	weenaja2321@gmail.com	$2a$11$acfQC3LAAAza2ZPXNbmSMuEHEP7DH/rsyzP7tsoA/ajRxNf9uNMR2	วีณา	ไกรสรกิตติกุล	2	2	คริสต์	02/03/1980	0897747545	\N	weena	weenain	weenal	77 ม.7	ถ.แจ้งสนิท	เขื่องคำ	เมืองยโสธร	35	35000	บริษัท คำเขื่อนแก้ว จำกัด	79 ม.9	ถ.แจ้งสนิท	เขื่องคำ	เมืองยโสธร	35	35000	1	pizza
48	3	1111112223333	weenaja@hotmail.com	$2a$11$7.HO9PPwzitiiPQ01X5rkutHVHmCRo4I2vnzEaeHqJkZmX9eBtnX6	วีณา	เอราวัณ	2	1		15/09/1982	0897730160	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2	mook
\.


--
-- Name: ageoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ageoption_id_seq', 6, true);


--
-- Name: criteria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.criteria_id_seq', 5, true);


--
-- Name: eduoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.eduoption_id_seq', 6, true);


--
-- Name: forgotpasswordquestionoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forgotpasswordquestionoption_id_seq', 33, true);


--
-- Name: frechangenameoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.frechangenameoption_id_seq', 6, true);


--
-- Name: funcallow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.funcallow_id_seq', 1, false);


--
-- Name: haveguarantoroption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.haveguarantoroption_id_seq', 3, true);


--
-- Name: iamguarantoroption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iamguarantoroption_id_seq', 3, true);


--
-- Name: incomeperdebtoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incomeperdebtoption_id_seq', 5, true);


--
-- Name: incometrendoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incometrendoption_id_seq', 6, true);


--
-- Name: joboption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.joboption_id_seq', 21, true);


--
-- Name: loanobjectoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loanobjectoption_id_seq', 6, true);


--
-- Name: mortgagesecuritiesperloanoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mortgagesecuritiesperloanoption_id_seq', 3, true);


--
-- Name: paydebthistoryoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paydebthistoryoption_id_seq', 6, true);


--
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 77, true);


--
-- Name: questionnaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questionnaire_id_seq', 19, true);


--
-- Name: savingperloanoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.savingperloanoption_id_seq', 5, true);


--
-- Name: statusinhouseparticularoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statusinhouseparticularoption_id_seq', 6, true);


--
-- Name: timejoboption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timejoboption_id_seq', 6, true);


--
-- Name: timeofnameinhouseparticularoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timeofnameinhouseparticularoption_id_seq', 6, true);


--
-- Name: timeofphonenumberoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timeofphonenumberoption_id_seq', 6, true);


--
-- Name: totaldebtperyearincomeoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.totaldebtperyearincomeoption_id_seq', 5, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 49, true);


--
-- Name: ageoption ageoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ageoption
    ADD CONSTRAINT ageoption_pkey PRIMARY KEY (id);


--
-- Name: criteria criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criteria
    ADD CONSTRAINT criteria_pkey PRIMARY KEY (id);


--
-- Name: eduoption eduoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eduoption
    ADD CONSTRAINT eduoption_pkey PRIMARY KEY (id);


--
-- Name: forgotpasswordquestionoption forgotpasswordquestionoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forgotpasswordquestionoption
    ADD CONSTRAINT forgotpasswordquestionoption_pkey PRIMARY KEY (id);


--
-- Name: frechangenameoption frechangenameoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.frechangenameoption
    ADD CONSTRAINT frechangenameoption_pkey PRIMARY KEY (id);


--
-- Name: funcallow funcallow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcallow
    ADD CONSTRAINT funcallow_pkey PRIMARY KEY (id);


--
-- Name: genderstatus genderstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genderstatus
    ADD CONSTRAINT genderstatus_pkey PRIMARY KEY (id);


--
-- Name: geography geography_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.geography
    ADD CONSTRAINT geography_pkey PRIMARY KEY (id);


--
-- Name: haveguarantoroption haveguarantoroption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.haveguarantoroption
    ADD CONSTRAINT haveguarantoroption_pkey PRIMARY KEY (id);


--
-- Name: iamguarantoroption iamguarantoroption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iamguarantoroption
    ADD CONSTRAINT iamguarantoroption_pkey PRIMARY KEY (id);


--
-- Name: incomeperdebtoption incomeperdebtoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incomeperdebtoption
    ADD CONSTRAINT incomeperdebtoption_pkey PRIMARY KEY (id);


--
-- Name: incometrendoption incometrendoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incometrendoption
    ADD CONSTRAINT incometrendoption_pkey PRIMARY KEY (id);


--
-- Name: joboption joboption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joboption
    ADD CONSTRAINT joboption_pkey PRIMARY KEY (id);


--
-- Name: loanobjectoption loanobjectoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanobjectoption
    ADD CONSTRAINT loanobjectoption_pkey PRIMARY KEY (id);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (id);


--
-- Name: marriedstatus marriedstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marriedstatus
    ADD CONSTRAINT marriedstatus_pkey PRIMARY KEY (id);


--
-- Name: mortgagesecuritiesperloanoption mortgagesecuritiesperloanoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mortgagesecuritiesperloanoption
    ADD CONSTRAINT mortgagesecuritiesperloanoption_pkey PRIMARY KEY (id);


--
-- Name: paydebthistoryoption paydebthistoryoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paydebthistoryoption
    ADD CONSTRAINT paydebthistoryoption_pkey PRIMARY KEY (id);


--
-- Name: permissionaccess permissionaccess_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissionaccess
    ADD CONSTRAINT permissionaccess_pkey PRIMARY KEY (id);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: questionnaire questionnaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_pkey PRIMARY KEY (id);


--
-- Name: questionnairestatus questionnairestatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnairestatus
    ADD CONSTRAINT questionnairestatus_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: savingperloanoption savingperloanoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.savingperloanoption
    ADD CONSTRAINT savingperloanoption_pkey PRIMARY KEY (id);


--
-- Name: statusinhouseparticularoption statusinhouseparticularoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statusinhouseparticularoption
    ADD CONSTRAINT statusinhouseparticularoption_pkey PRIMARY KEY (id);


--
-- Name: timejoboption timejoboption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timejoboption
    ADD CONSTRAINT timejoboption_pkey PRIMARY KEY (id);


--
-- Name: timeofnameinhouseparticularoption timeofnameinhouseparticularoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timeofnameinhouseparticularoption
    ADD CONSTRAINT timeofnameinhouseparticularoption_pkey PRIMARY KEY (id);


--
-- Name: timeofphonenumberoption timeofphonenumberoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timeofphonenumberoption
    ADD CONSTRAINT timeofphonenumberoption_pkey PRIMARY KEY (id);


--
-- Name: totaldebtperyearincomeoption totaldebtperyearincomeoption_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.totaldebtperyearincomeoption
    ADD CONSTRAINT totaldebtperyearincomeoption_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ageoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ageoption_code_idx ON public.ageoption USING btree (code);


--
-- Name: criteria_criteria_no_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX criteria_criteria_no_idx ON public.criteria USING btree (criteria_no);


--
-- Name: eduoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX eduoption_code_idx ON public.eduoption USING btree (code);


--
-- Name: frechangenameoption_code_asc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX frechangenameoption_code_asc ON public.frechangenameoption USING btree (code);


--
-- Name: frechangenameoption_code_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX frechangenameoption_code_id ON public.frechangenameoption USING btree (id);


--
-- Name: frechangenameoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX frechangenameoption_code_idx ON public.frechangenameoption USING btree (code);


--
-- Name: funcallow_funcno_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX funcallow_funcno_idx ON public.funcallow USING btree (funcno);


--
-- Name: haveguarantoroption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX haveguarantoroption_code_idx ON public.haveguarantoroption USING btree (code);


--
-- Name: iamguarantoroption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX iamguarantoroption_code_idx ON public.iamguarantoroption USING btree (code);


--
-- Name: incomeperdebtoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX incomeperdebtoption_code_idx ON public.incomeperdebtoption USING btree (code);


--
-- Name: incometrendoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX incometrendoption_code_idx ON public.incometrendoption USING btree (code);


--
-- Name: joboption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX joboption_code_idx ON public.joboption USING btree (code);


--
-- Name: loanobjectoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX loanobjectoption_code_idx ON public.loanobjectoption USING btree (code);


--
-- Name: mortgagesecuritiesperloanoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX mortgagesecuritiesperloanoption_code_idx ON public.mortgagesecuritiesperloanoption USING btree (code);


--
-- Name: paydebthistoryoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX paydebthistoryoption_code_idx ON public.paydebthistoryoption USING btree (code);


--
-- Name: province_code_inx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX province_code_inx ON public.provinces USING btree (code);


--
-- Name: questionnaire_loanerid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX questionnaire_loanerid_idx ON public.questionnaire USING btree (loanerid);


--
-- Name: questionnairestatus_id_asc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX questionnairestatus_id_asc ON public.questionnairestatus USING btree (id);


--
-- Name: savingperloanoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX savingperloanoption_code_idx ON public.savingperloanoption USING btree (code);


--
-- Name: statusinhouseparticularoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX statusinhouseparticularoption_code_idx ON public.statusinhouseparticularoption USING btree (code);


--
-- Name: timejoboption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX timejoboption_code_idx ON public.timejoboption USING btree (code);


--
-- Name: timeofnameinhouseparticularoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX timeofnameinhouseparticularoption_code_idx ON public.timeofnameinhouseparticularoption USING btree (code);


--
-- Name: timeofphonenumberoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX timeofphonenumberoption_code_idx ON public.timeofphonenumberoption USING btree (code);


--
-- Name: totaldebtperyearincomeoption_code_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX totaldebtperyearincomeoption_code_idx ON public.totaldebtperyearincomeoption USING btree (code);


--
-- Name: users_citizenid_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_citizenid_idx ON public.users USING btree (citizenid);


--
-- Name: users_email_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_idx ON public.users USING btree (email);


--
-- Name: users_phone_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_phone_idx ON public.users USING btree (phone);


--
-- Name: ageoption ageoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ageoption
    ADD CONSTRAINT ageoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: eduoption eduoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.eduoption
    ADD CONSTRAINT eduoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: frechangenameoption frechangenameoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.frechangenameoption
    ADD CONSTRAINT frechangenameoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: haveguarantoroption haveguarantoroption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.haveguarantoroption
    ADD CONSTRAINT haveguarantoroption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: iamguarantoroption iamguarantoroption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iamguarantoroption
    ADD CONSTRAINT iamguarantoroption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: incomeperdebtoption incomeperdebtoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incomeperdebtoption
    ADD CONSTRAINT incomeperdebtoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: incometrendoption incometrendoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incometrendoption
    ADD CONSTRAINT incometrendoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: joboption joboption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.joboption
    ADD CONSTRAINT joboption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: loanobjectoption loanobjectoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loanobjectoption
    ADD CONSTRAINT loanobjectoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: location location_province_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_province_code_fkey FOREIGN KEY (province_code) REFERENCES public.provinces(code);


--
-- Name: mortgagesecuritiesperloanoption mortgagesecuritiesperloanoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mortgagesecuritiesperloanoption
    ADD CONSTRAINT mortgagesecuritiesperloanoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: paydebthistoryoption paydebthistoryoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paydebthistoryoption
    ADD CONSTRAINT paydebthistoryoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: provinces provinces_geographyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_geographyid_fkey FOREIGN KEY (geographyid) REFERENCES public.geography(id);


--
-- Name: questionnaire questionnaire_age_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_age_fkey FOREIGN KEY (age) REFERENCES public.ageoption(code);


--
-- Name: questionnaire questionnaire_agew_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_agew_fkey FOREIGN KEY (agew) REFERENCES public.ageoption(code);


--
-- Name: questionnaire questionnaire_edu_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_edu_fkey FOREIGN KEY (edu) REFERENCES public.eduoption(code);


--
-- Name: questionnaire questionnaire_eduw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_eduw_fkey FOREIGN KEY (eduw) REFERENCES public.eduoption(code);


--
-- Name: questionnaire questionnaire_frechangename_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_frechangename_fkey FOREIGN KEY (frechangename) REFERENCES public.frechangenameoption(code);


--
-- Name: questionnaire questionnaire_frechangenamew_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_frechangenamew_fkey FOREIGN KEY (frechangenamew) REFERENCES public.frechangenameoption(code);


--
-- Name: questionnaire questionnaire_haveguarantor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_haveguarantor_fkey FOREIGN KEY (haveguarantor) REFERENCES public.haveguarantoroption(code);


--
-- Name: questionnaire questionnaire_haveguarantorw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_haveguarantorw_fkey FOREIGN KEY (haveguarantorw) REFERENCES public.haveguarantoroption(code);


--
-- Name: questionnaire questionnaire_iamguarantor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_iamguarantor_fkey FOREIGN KEY (iamguarantor) REFERENCES public.iamguarantoroption(code);


--
-- Name: questionnaire questionnaire_iamguarantorw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_iamguarantorw_fkey FOREIGN KEY (iamguarantorw) REFERENCES public.iamguarantoroption(code);


--
-- Name: questionnaire questionnaire_incomeperdebt_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_incomeperdebt_fkey FOREIGN KEY (incomeperdebt) REFERENCES public.incomeperdebtoption(code);


--
-- Name: questionnaire questionnaire_incomeperdebtw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_incomeperdebtw_fkey FOREIGN KEY (incomeperdebtw) REFERENCES public.incomeperdebtoption(code);


--
-- Name: questionnaire questionnaire_incometrend_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_incometrend_fkey FOREIGN KEY (incometrend) REFERENCES public.incometrendoption(code);


--
-- Name: questionnaire questionnaire_incometrendw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_incometrendw_fkey FOREIGN KEY (incometrendw) REFERENCES public.incometrendoption(code);


--
-- Name: questionnaire questionnaire_job_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_job_fkey FOREIGN KEY (job) REFERENCES public.joboption(code);


--
-- Name: questionnaire questionnaire_jobw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_jobw_fkey FOREIGN KEY (jobw) REFERENCES public.joboption(code);


--
-- Name: questionnaire questionnaire_loanerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_loanerid_fkey FOREIGN KEY (loanerid) REFERENCES public.users(id);


--
-- Name: questionnaire questionnaire_loanobject_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_loanobject_fkey FOREIGN KEY (loanobject) REFERENCES public.loanobjectoption(code);


--
-- Name: questionnaire questionnaire_loanobjectw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_loanobjectw_fkey FOREIGN KEY (loanobjectw) REFERENCES public.loanobjectoption(code);


--
-- Name: questionnaire questionnaire_mortgagesecuritiesperloan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_mortgagesecuritiesperloan_fkey FOREIGN KEY (mortgagesecuritiesperloan) REFERENCES public.mortgagesecuritiesperloanoption(code);


--
-- Name: questionnaire questionnaire_mortgagesecuritiesperloanw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_mortgagesecuritiesperloanw_fkey FOREIGN KEY (mortgagesecuritiesperloanw) REFERENCES public.mortgagesecuritiesperloanoption(code);


--
-- Name: questionnaire questionnaire_paydebthistory_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_paydebthistory_fkey FOREIGN KEY (paydebthistory) REFERENCES public.paydebthistoryoption(code);


--
-- Name: questionnaire questionnaire_paydebthistoryw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_paydebthistoryw_fkey FOREIGN KEY (paydebthistoryw) REFERENCES public.paydebthistoryoption(code);


--
-- Name: questionnaire questionnaire_provincecode_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_provincecode_fkey FOREIGN KEY (provincecode) REFERENCES public.provinces(code);


--
-- Name: questionnaire questionnaire_provincecode_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_provincecode_fkey1 FOREIGN KEY (provincecode) REFERENCES public.provinces(code);


--
-- Name: questionnaire questionnaire_provincecodew_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_provincecodew_fkey FOREIGN KEY (provincecodew) REFERENCES public.provinces(code);


--
-- Name: questionnaire questionnaire_savingperloan_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_savingperloan_fkey FOREIGN KEY (savingperloan) REFERENCES public.savingperloanoption(code);


--
-- Name: questionnaire questionnaire_savingperloanw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_savingperloanw_fkey FOREIGN KEY (savingperloanw) REFERENCES public.savingperloanoption(code);


--
-- Name: questionnaire questionnaire_statusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_statusid_fkey FOREIGN KEY (statusid) REFERENCES public.questionnairestatus(id);


--
-- Name: questionnaire questionnaire_statusinhouseparticular_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_statusinhouseparticular_fkey FOREIGN KEY (statusinhouseparticular) REFERENCES public.statusinhouseparticularoption(code);


--
-- Name: questionnaire questionnaire_statusinhouseparticularw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_statusinhouseparticularw_fkey FOREIGN KEY (statusinhouseparticularw) REFERENCES public.statusinhouseparticularoption(code);


--
-- Name: questionnaire questionnaire_timejob_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_timejob_fkey FOREIGN KEY (timejob) REFERENCES public.timejoboption(code);


--
-- Name: questionnaire questionnaire_timejobw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_timejobw_fkey FOREIGN KEY (timejobw) REFERENCES public.timejoboption(code);


--
-- Name: questionnaire questionnaire_timeofnameinhouseparticular_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_timeofnameinhouseparticular_fkey FOREIGN KEY (timeofnameinhouseparticular) REFERENCES public.timeofnameinhouseparticularoption(code);


--
-- Name: questionnaire questionnaire_timeofnameinhouseparticularw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_timeofnameinhouseparticularw_fkey FOREIGN KEY (timeofnameinhouseparticularw) REFERENCES public.timeofnameinhouseparticularoption(code);


--
-- Name: questionnaire questionnaire_timeofphonenumber_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_timeofphonenumber_fkey FOREIGN KEY (timeofphonenumber) REFERENCES public.timeofphonenumberoption(code);


--
-- Name: questionnaire questionnaire_timeofphonenumberw_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_timeofphonenumberw_fkey FOREIGN KEY (timeofphonenumberw) REFERENCES public.timeofphonenumberoption(code);


--
-- Name: questionnaire questionnaire_totaldebtperyearincome_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_totaldebtperyearincome_fkey FOREIGN KEY (totaldebtperyearincome) REFERENCES public.totaldebtperyearincomeoption(code);


--
-- Name: questionnaire questionnaire_totaldebtperyearincomew_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questionnaire
    ADD CONSTRAINT questionnaire_totaldebtperyearincomew_fkey FOREIGN KEY (totaldebtperyearincomew) REFERENCES public.totaldebtperyearincomeoption(code);


--
-- Name: savingperloanoption savingperloanoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.savingperloanoption
    ADD CONSTRAINT savingperloanoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: users sers_forgotpassowordquestionid_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT sers_forgotpassowordquestionid_fk FOREIGN KEY (forgotpasswordquestionid) REFERENCES public.forgotpasswordquestionoption(id);


--
-- Name: statusinhouseparticularoption statusinhouseparticularoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statusinhouseparticularoption
    ADD CONSTRAINT statusinhouseparticularoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: timejoboption timejoboption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timejoboption
    ADD CONSTRAINT timejoboption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: timeofnameinhouseparticularoption timeofnameinhouseparticularoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timeofnameinhouseparticularoption
    ADD CONSTRAINT timeofnameinhouseparticularoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: timeofphonenumberoption timeofphonenumberoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timeofphonenumberoption
    ADD CONSTRAINT timeofphonenumberoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: totaldebtperyearincomeoption totaldebtperyearincomeoption_criteria_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.totaldebtperyearincomeoption
    ADD CONSTRAINT totaldebtperyearincomeoption_criteria_no_fkey FOREIGN KEY (criteria_no) REFERENCES public.criteria(criteria_no);


--
-- Name: users users_genderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_genderid_fkey FOREIGN KEY (genderid) REFERENCES public.genderstatus(id);


--
-- Name: users users_marriedid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_marriedid_fkey FOREIGN KEY (marriedid) REFERENCES public.marriedstatus(id);


--
-- Name: users users_provincecode_home_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_provincecode_home_fkey FOREIGN KEY (provincecode_home) REFERENCES public.provinces(code);


--
-- Name: users users_provincecode_office_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_provincecode_office_fkey FOREIGN KEY (provincecode_office) REFERENCES public.provinces(code);


--
-- Name: users users_roleid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1 (Debian 12.1-1.pgdg100+1)
-- Dumped by pg_dump version 12.1 (Debian 12.1-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

