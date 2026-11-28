--
-- PostgreSQL database dump
--

\restrict Sfp1FOEPmxS0GlyQodAD38E2ksHg7b3BfeyvepscSmES5YV3ZNhZBgRiD65Gdv7

-- Dumped from database version 18.7 (3190d2f)
-- Dumped by pg_dump version 18.7

-- Started on 2026-11-25 21:04:11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: CAMPUS_SHUTTLE_MANAGEMENT; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA "CAMPUS_SHUTTLE_MANAGEMENT";


ALTER SCHEMA "CAMPUS_SHUTTLE_MANAGEMENT" OWNER TO pg_database_owner;

--
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA "CAMPUS_SHUTTLE_MANAGEMENT"; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA "CAMPUS_SHUTTLE_MANAGEMENT" IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 40994)
-- Name: bookings; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".bookings (
    bookingid integer NOT NULL,
    userid integer NOT NULL,
    trip_passid integer CONSTRAINT bookings_tripid_not_null NOT NULL,
    seatsbooked integer NOT NULL,
    bookingdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    tripsid integer NOT NULL
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".bookings OWNER TO neondb_owner;

--
-- TOC entry 221 (class 1259 OID 40993)
-- Name: bookings_bookingid_seq; Type: SEQUENCE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".bookings ALTER COLUMN bookingid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "CAMPUS_SHUTTLE_MANAGEMENT".bookings_bookingid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 235 (class 1259 OID 65547)
-- Name: complaints; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".complaints (
    complaintid integer NOT NULL,
    userid integer NOT NULL,
    tripsid integer NOT NULL,
    complainttype character varying(50) NOT NULL,
    description text NOT NULL,
    status character varying(30) NOT NULL
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".complaints OWNER TO neondb_owner;

--
-- TOC entry 236 (class 1259 OID 65563)
-- Name: driver; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".driver (
    driverid integer NOT NULL,
    name character varying(100) NOT NULL,
    liscenceno character varying(50) NOT NULL,
    phone character varying(30) NOT NULL,
    experienceyears integer,
    CONSTRAINT driver_experienceyears_check CHECK ((experienceyears >= 0))
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".driver OWNER TO neondb_owner;

--
-- TOC entry 237 (class 1259 OID 65577)
-- Name: driver_assignments; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".driver_assignments (
    assignmentid integer NOT NULL,
    driverid integer NOT NULL,
    tripsid integer NOT NULL,
    assigneddate date NOT NULL,
    status character varying(30) NOT NULL
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".driver_assignments OWNER TO neondb_owner;

--
-- TOC entry 240 (class 1259 OID 65614)
-- Name: feedback; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".feedback (
    feedbackid integer NOT NULL,
    userid integer NOT NULL,
    tripsid integer CONSTRAINT feedback_tripid_not_null NOT NULL,
    rating integer NOT NULL,
    comments text,
    studentid integer NOT NULL,
    CONSTRAINT feedback_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".feedback OWNER TO neondb_owner;

--
-- TOC entry 226 (class 1259 OID 41023)
-- Name: passengers; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".passengers (
    passengerid integer NOT NULL,
    studentid integer NOT NULL,
    name character varying(100) NOT NULL,
    contact character varying(20) NOT NULL,
    email character varying(20)
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".passengers OWNER TO neondb_owner;

--
-- TOC entry 225 (class 1259 OID 41022)
-- Name: passengers_passengerid_seq; Type: SEQUENCE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".passengers ALTER COLUMN passengerid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "CAMPUS_SHUTTLE_MANAGEMENT".passengers_passengerid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 238 (class 1259 OID 65587)
-- Name: payments; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".payments (
    paymentid integer NOT NULL,
    bookingid integer NOT NULL,
    amount numeric(10,2) NOT NULL,
    paymentmethod character varying(30) NOT NULL,
    paymentdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT payments_amount_check CHECK ((amount >= (0)::numeric))
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".payments OWNER TO neondb_owner;

--
-- TOC entry 233 (class 1259 OID 57344)
-- Name: routes; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".routes (
    routeid integer NOT NULL,
    routename character varying(100) NOT NULL,
    startloc character varying(100) NOT NULL,
    endloc character varying(100) NOT NULL,
    distance numeric(8,2),
    CONSTRAINT routes_distance_check CHECK ((distance >= (0)::numeric))
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".routes OWNER TO neondb_owner;

--
-- TOC entry 232 (class 1259 OID 49185)
-- Name: schedules; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".schedules (
    scheduleid integer NOT NULL,
    tripsid integer NOT NULL,
    scheduledate date NOT NULL,
    departuretime time without time zone NOT NULL,
    arrivaltime time without time zone NOT NULL
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".schedules OWNER TO neondb_owner;

--
-- TOC entry 234 (class 1259 OID 65536)
-- Name: stops; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".stops (
    stopid integer NOT NULL,
    routeid integer NOT NULL,
    stopname character varying(100) NOT NULL,
    stoporder integer NOT NULL,
    location character varying(100) NOT NULL,
    CONSTRAINT stops_stoporder_check CHECK ((stoporder > 0))
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".stops OWNER TO neondb_owner;

--
-- TOC entry 228 (class 1259 OID 41035)
-- Name: students; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".students (
    studentid integer NOT NULL,
    name character varying(100) NOT NULL,
    department character varying(50) NOT NULL,
    batch character varying(20) NOT NULL,
    phone character varying(20) NOT NULL
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".students OWNER TO neondb_owner;

--
-- TOC entry 227 (class 1259 OID 41034)
-- Name: students_studentid_seq; Type: SEQUENCE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".students ALTER COLUMN studentid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "CAMPUS_SHUTTLE_MANAGEMENT".students_studentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 239 (class 1259 OID 65602)
-- Name: transport_report; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".transport_report (
    reportid integer NOT NULL,
    userid integer NOT NULL,
    reporttype character varying(50) NOT NULL,
    reportdate date NOT NULL,
    generatedby character varying(100) NOT NULL,
    details text
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".transport_report OWNER TO neondb_owner;

--
-- TOC entry 224 (class 1259 OID 41011)
-- Name: trip_passenger; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".trip_passenger (
    trip_passid integer CONSTRAINT trip_passenger_tripid_not_null NOT NULL,
    bookingid integer NOT NULL,
    passengerid integer NOT NULL,
    status character varying(20) NOT NULL,
    checkedin boolean DEFAULT false NOT NULL
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".trip_passenger OWNER TO neondb_owner;

--
-- TOC entry 223 (class 1259 OID 41010)
-- Name: trip_passenger_tripid_seq; Type: SEQUENCE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".trip_passenger ALTER COLUMN trip_passid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "CAMPUS_SHUTTLE_MANAGEMENT".trip_passenger_tripid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 231 (class 1259 OID 49175)
-- Name: trips; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".trips (
    tripsid integer NOT NULL,
    routeid integer NOT NULL,
    vehicleid integer NOT NULL,
    driverid integer NOT NULL,
    departuretime timestamp without time zone NOT NULL
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".trips OWNER TO neondb_owner;

--
-- TOC entry 220 (class 1259 OID 40961)
-- Name: users; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".users (
    userid integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    role character varying(20) NOT NULL
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".users OWNER TO neondb_owner;

--
-- TOC entry 219 (class 1259 OID 40960)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".users ALTER COLUMN userid ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "CAMPUS_SHUTTLE_MANAGEMENT".users_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 230 (class 1259 OID 49165)
-- Name: vehicle_maintainance; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".vehicle_maintainance (
    maintainanceid integer NOT NULL,
    vehicleid integer NOT NULL,
    servicedate date NOT NULL,
    description text,
    nextservicedate date
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".vehicle_maintainance OWNER TO neondb_owner;

--
-- TOC entry 229 (class 1259 OID 49152)
-- Name: vehicles; Type: TABLE; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

CREATE TABLE "CAMPUS_SHUTTLE_MANAGEMENT".vehicles (
    vehicleid integer NOT NULL,
    regno character varying(30) NOT NULL,
    vehicletype character varying(50) NOT NULL,
    capacity integer NOT NULL,
    status character varying(20) NOT NULL,
    CONSTRAINT vehicles_capacity_check CHECK ((capacity > 0))
);


ALTER TABLE "CAMPUS_SHUTTLE_MANAGEMENT".vehicles OWNER TO neondb_owner;

--
-- TOC entry 3565 (class 0 OID 40994)
-- Dependencies: 222
-- Data for Name: bookings; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".bookings (bookingid, userid, trip_passid, seatsbooked, bookingdate, tripsid) FROM stdin;
\.


--
-- TOC entry 3578 (class 0 OID 65547)
-- Dependencies: 235
-- Data for Name: complaints; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".complaints (complaintid, userid, tripsid, complainttype, description, status) FROM stdin;
\.


--
-- TOC entry 3579 (class 0 OID 65563)
-- Dependencies: 236
-- Data for Name: driver; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".driver (driverid, name, liscenceno, phone, experienceyears) FROM stdin;
\.


--
-- TOC entry 3580 (class 0 OID 65577)
-- Dependencies: 237
-- Data for Name: driver_assignments; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".driver_assignments (assignmentid, driverid, tripsid, assigneddate, status) FROM stdin;
\.


--
-- TOC entry 3583 (class 0 OID 65614)
-- Dependencies: 240
-- Data for Name: feedback; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".feedback (feedbackid, userid, tripsid, rating, comments, studentid) FROM stdin;
\.


--
-- TOC entry 3569 (class 0 OID 41023)
-- Dependencies: 226
-- Data for Name: passengers; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".passengers (passengerid, studentid, name, contact, email) FROM stdin;
\.


--
-- TOC entry 3581 (class 0 OID 65587)
-- Dependencies: 238
-- Data for Name: payments; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".payments (paymentid, bookingid, amount, paymentmethod, paymentdate) FROM stdin;
\.


--
-- TOC entry 3576 (class 0 OID 57344)
-- Dependencies: 233
-- Data for Name: routes; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".routes (routeid, routename, startloc, endloc, distance) FROM stdin;
\.


--
-- TOC entry 3575 (class 0 OID 49185)
-- Dependencies: 232
-- Data for Name: schedules; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".schedules (scheduleid, tripsid, scheduledate, departuretime, arrivaltime) FROM stdin;
\.


--
-- TOC entry 3577 (class 0 OID 65536)
-- Dependencies: 234
-- Data for Name: stops; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".stops (stopid, routeid, stopname, stoporder, location) FROM stdin;
\.


--
-- TOC entry 3571 (class 0 OID 41035)
-- Dependencies: 228
-- Data for Name: students; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".students (studentid, name, department, batch, phone) FROM stdin;
\.


--
-- TOC entry 3582 (class 0 OID 65602)
-- Dependencies: 239
-- Data for Name: transport_report; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".transport_report (reportid, userid, reporttype, reportdate, generatedby, details) FROM stdin;
\.


--
-- TOC entry 3567 (class 0 OID 41011)
-- Dependencies: 224
-- Data for Name: trip_passenger; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".trip_passenger (trip_passid, bookingid, passengerid, status, checkedin) FROM stdin;
\.


--
-- TOC entry 3574 (class 0 OID 49175)
-- Dependencies: 231
-- Data for Name: trips; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".trips (tripsid, routeid, vehicleid, driverid, departuretime) FROM stdin;
\.


--
-- TOC entry 3563 (class 0 OID 40961)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".users (userid, firstname, lastname, phone, email, role) FROM stdin;
\.


--
-- TOC entry 3573 (class 0 OID 49165)
-- Dependencies: 230
-- Data for Name: vehicle_maintainance; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".vehicle_maintainance (maintainanceid, vehicleid, servicedate, description, nextservicedate) FROM stdin;
\.


--
-- TOC entry 3572 (class 0 OID 49152)
-- Dependencies: 229
-- Data for Name: vehicles; Type: TABLE DATA; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

COPY "CAMPUS_SHUTTLE_MANAGEMENT".vehicles (vehicleid, regno, vehicletype, capacity, status) FROM stdin;
\.


--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 221
-- Name: bookings_bookingid_seq; Type: SEQUENCE SET; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

SELECT pg_catalog.setval('"CAMPUS_SHUTTLE_MANAGEMENT".bookings_bookingid_seq', 1, false);


--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 225
-- Name: passengers_passengerid_seq; Type: SEQUENCE SET; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

SELECT pg_catalog.setval('"CAMPUS_SHUTTLE_MANAGEMENT".passengers_passengerid_seq', 1, false);


--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 227
-- Name: students_studentid_seq; Type: SEQUENCE SET; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

SELECT pg_catalog.setval('"CAMPUS_SHUTTLE_MANAGEMENT".students_studentid_seq', 1, false);


--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 223
-- Name: trip_passenger_tripid_seq; Type: SEQUENCE SET; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

SELECT pg_catalog.setval('"CAMPUS_SHUTTLE_MANAGEMENT".trip_passenger_tripid_seq', 1, false);


--
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

SELECT pg_catalog.setval('"CAMPUS_SHUTTLE_MANAGEMENT".users_userid_seq', 1, false);


--
-- TOC entry 3355 (class 2606 OID 41004)
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (bookingid);


--
-- TOC entry 3379 (class 2606 OID 65559)
-- Name: complaints complaints_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".complaints
    ADD CONSTRAINT complaints_pkey PRIMARY KEY (complaintid);


--
-- TOC entry 3387 (class 2606 OID 65586)
-- Name: driver_assignments driver_assignments_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".driver_assignments
    ADD CONSTRAINT driver_assignments_pkey PRIMARY KEY (assignmentid);


--
-- TOC entry 3381 (class 2606 OID 65574)
-- Name: driver driver_liscenceno_key; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".driver
    ADD CONSTRAINT driver_liscenceno_key UNIQUE (liscenceno);


--
-- TOC entry 3383 (class 2606 OID 65576)
-- Name: driver driver_phone_key; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".driver
    ADD CONSTRAINT driver_phone_key UNIQUE (phone);


--
-- TOC entry 3385 (class 2606 OID 65572)
-- Name: driver driver_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (driverid);


--
-- TOC entry 3393 (class 2606 OID 65625)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (feedbackid);


--
-- TOC entry 3359 (class 2606 OID 41033)
-- Name: passengers passengers_email_key; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".passengers
    ADD CONSTRAINT passengers_email_key UNIQUE (email);


--
-- TOC entry 3361 (class 2606 OID 41031)
-- Name: passengers passengers_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (passengerid);


--
-- TOC entry 3389 (class 2606 OID 65598)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (paymentid);


--
-- TOC entry 3375 (class 2606 OID 57353)
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (routeid);


--
-- TOC entry 3373 (class 2606 OID 49194)
-- Name: schedules schedules_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (scheduleid);


--
-- TOC entry 3377 (class 2606 OID 65546)
-- Name: stops stops_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".stops
    ADD CONSTRAINT stops_pkey PRIMARY KEY (stopid);


--
-- TOC entry 3363 (class 2606 OID 41044)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".students
    ADD CONSTRAINT students_pkey PRIMARY KEY (studentid);


--
-- TOC entry 3391 (class 2606 OID 65613)
-- Name: transport_report transport_report_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".transport_report
    ADD CONSTRAINT transport_report_pkey PRIMARY KEY (reportid);


--
-- TOC entry 3357 (class 2606 OID 41021)
-- Name: trip_passenger trip_passenger_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".trip_passenger
    ADD CONSTRAINT trip_passenger_pkey PRIMARY KEY (trip_passid);


--
-- TOC entry 3371 (class 2606 OID 49184)
-- Name: trips trips_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (tripsid);


--
-- TOC entry 3349 (class 2606 OID 40975)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3351 (class 2606 OID 40973)
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- TOC entry 3353 (class 2606 OID 40971)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 3369 (class 2606 OID 49174)
-- Name: vehicle_maintainance vehicle_maintainance_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".vehicle_maintainance
    ADD CONSTRAINT vehicle_maintainance_pkey PRIMARY KEY (maintainanceid);


--
-- TOC entry 3365 (class 2606 OID 49162)
-- Name: vehicles vehicles_pkey; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (vehicleid);


--
-- TOC entry 3367 (class 2606 OID 49164)
-- Name: vehicles vehicles_regno_key; Type: CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".vehicles
    ADD CONSTRAINT vehicles_regno_key UNIQUE (regno);


--
-- TOC entry 3408 (class 2606 OID 81920)
-- Name: driver_assignments fk_assignments_driver; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".driver_assignments
    ADD CONSTRAINT fk_assignments_driver FOREIGN KEY (driverid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".driver(driverid);


--
-- TOC entry 3409 (class 2606 OID 81925)
-- Name: driver_assignments fk_assignments_trips; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".driver_assignments
    ADD CONSTRAINT fk_assignments_trips FOREIGN KEY (tripsid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".trips(tripsid);


--
-- TOC entry 3394 (class 2606 OID 73733)
-- Name: bookings fk_bookings_trippass; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".bookings
    ADD CONSTRAINT fk_bookings_trippass FOREIGN KEY (trip_passid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".trip_passenger(trip_passid);


--
-- TOC entry 3395 (class 2606 OID 73738)
-- Name: bookings fk_bookings_trips; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".bookings
    ADD CONSTRAINT fk_bookings_trips FOREIGN KEY (tripsid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".trips(tripsid);


--
-- TOC entry 3396 (class 2606 OID 73728)
-- Name: bookings fk_bookings_users; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".bookings
    ADD CONSTRAINT fk_bookings_users FOREIGN KEY (userid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".users(userid);


--
-- TOC entry 3406 (class 2606 OID 90133)
-- Name: complaints fk_compaints_trips; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".complaints
    ADD CONSTRAINT fk_compaints_trips FOREIGN KEY (tripsid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".trips(tripsid);


--
-- TOC entry 3407 (class 2606 OID 90128)
-- Name: complaints fk_compaints_users; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".complaints
    ADD CONSTRAINT fk_compaints_users FOREIGN KEY (userid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".users(userid);


--
-- TOC entry 3412 (class 2606 OID 90123)
-- Name: feedback fk_feedback_students; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".feedback
    ADD CONSTRAINT fk_feedback_students FOREIGN KEY (studentid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".students(studentid);


--
-- TOC entry 3413 (class 2606 OID 90117)
-- Name: feedback fk_feedback_trips; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".feedback
    ADD CONSTRAINT fk_feedback_trips FOREIGN KEY (tripsid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".trips(tripsid);


--
-- TOC entry 3414 (class 2606 OID 90112)
-- Name: feedback fk_feedback_users; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".feedback
    ADD CONSTRAINT fk_feedback_users FOREIGN KEY (userid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".users(userid);


--
-- TOC entry 3400 (class 2606 OID 73758)
-- Name: vehicle_maintainance fk_maintainance_vehicles; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".vehicle_maintainance
    ADD CONSTRAINT fk_maintainance_vehicles FOREIGN KEY (vehicleid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".vehicles(vehicleid);


--
-- TOC entry 3399 (class 2606 OID 73753)
-- Name: passengers fk_passengers_students; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".passengers
    ADD CONSTRAINT fk_passengers_students FOREIGN KEY (studentid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".students(studentid);


--
-- TOC entry 3410 (class 2606 OID 81930)
-- Name: payments fk_payments_bookings; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".payments
    ADD CONSTRAINT fk_payments_bookings FOREIGN KEY (bookingid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".bookings(bookingid);


--
-- TOC entry 3411 (class 2606 OID 81935)
-- Name: transport_report fk_report_users; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".transport_report
    ADD CONSTRAINT fk_report_users FOREIGN KEY (userid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".users(userid);


--
-- TOC entry 3404 (class 2606 OID 73778)
-- Name: schedules fk_schedules_trips; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".schedules
    ADD CONSTRAINT fk_schedules_trips FOREIGN KEY (tripsid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".trips(tripsid);


--
-- TOC entry 3405 (class 2606 OID 73783)
-- Name: stops fk_stops_routes; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".stops
    ADD CONSTRAINT fk_stops_routes FOREIGN KEY (routeid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".routes(routeid);


--
-- TOC entry 3397 (class 2606 OID 73748)
-- Name: trip_passenger fk_trip_passenger; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".trip_passenger
    ADD CONSTRAINT fk_trip_passenger FOREIGN KEY (passengerid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".passengers(passengerid);


--
-- TOC entry 3398 (class 2606 OID 73743)
-- Name: trip_passenger fk_trip_passenger_bookings; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".trip_passenger
    ADD CONSTRAINT fk_trip_passenger_bookings FOREIGN KEY (bookingid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".bookings(bookingid);


--
-- TOC entry 3401 (class 2606 OID 73773)
-- Name: trips fk_trips_drivers; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".trips
    ADD CONSTRAINT fk_trips_drivers FOREIGN KEY (driverid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".driver(driverid);


--
-- TOC entry 3402 (class 2606 OID 73763)
-- Name: trips fk_trips_routes; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".trips
    ADD CONSTRAINT fk_trips_routes FOREIGN KEY (routeid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".routes(routeid);


--
-- TOC entry 3403 (class 2606 OID 73768)
-- Name: trips fk_trips_vehicles; Type: FK CONSTRAINT; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: neondb_owner
--

ALTER TABLE ONLY "CAMPUS_SHUTTLE_MANAGEMENT".trips
    ADD CONSTRAINT fk_trips_vehicles FOREIGN KEY (vehicleid) REFERENCES "CAMPUS_SHUTTLE_MANAGEMENT".vehicles(vehicleid);


--
-- TOC entry 2120 (class 826 OID 16400)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA "CAMPUS_SHUTTLE_MANAGEMENT" GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2121 (class 826 OID 16399)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: CAMPUS_SHUTTLE_MANAGEMENT; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA "CAMPUS_SHUTTLE_MANAGEMENT" GRANT SELECT,INSERT,DELETE,TRUNCATE,MAINTAIN,UPDATE ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2026-11-25 21:05:00

--
-- PostgreSQL database dump complete
--

\unrestrict Sfp1FOEPmxS0GlyQodAD38E2ksHg7b3BfeyvepscSmES5YV3ZNhZBgRiD65Gdv7

