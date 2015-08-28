--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: average_marks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE average_marks (
    id integer NOT NULL,
    semester_id integer,
    student_id integer,
    value numeric(3,2) DEFAULT 0,
    subject_count integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: average_marks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE average_marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: average_marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE average_marks_id_seq OWNED BY average_marks.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE courses (
    id integer NOT NULL,
    number integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    course_id integer,
    number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: marks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE marks (
    id integer NOT NULL,
    semester_id integer,
    subject_id integer,
    student_id integer,
    value integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: marks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE marks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: marks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE marks_id_seq OWNED BY marks.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: semester_subjects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE semester_subjects (
    id integer NOT NULL,
    semester_id integer,
    subject_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: semester_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE semester_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: semester_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE semester_subjects_id_seq OWNED BY semester_subjects.id;


--
-- Name: semesters; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE semesters (
    id integer NOT NULL,
    group_id integer,
    number integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: semesters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE semesters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: semesters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE semesters_id_seq OWNED BY semesters.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE students (
    id integer NOT NULL,
    group_id integer,
    name character varying,
    surname character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying,
    birthdate date,
    ip character varying,
    registration_time timestamp without time zone,
    characteristic text
);


--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE students_id_seq OWNED BY students.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE subjects (
    id integer NOT NULL,
    title character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE subjects_id_seq OWNED BY subjects.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY average_marks ALTER COLUMN id SET DEFAULT nextval('average_marks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY marks ALTER COLUMN id SET DEFAULT nextval('marks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY semester_subjects ALTER COLUMN id SET DEFAULT nextval('semester_subjects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY semesters ALTER COLUMN id SET DEFAULT nextval('semesters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY subjects ALTER COLUMN id SET DEFAULT nextval('subjects_id_seq'::regclass);


--
-- Name: average_marks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY average_marks
    ADD CONSTRAINT average_marks_pkey PRIMARY KEY (id);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: marks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (id);


--
-- Name: semester_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY semester_subjects
    ADD CONSTRAINT semester_subjects_pkey PRIMARY KEY (id);


--
-- Name: semesters_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY semesters
    ADD CONSTRAINT semesters_pkey PRIMARY KEY (id);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY subjects
    ADD CONSTRAINT subjects_pkey PRIMARY KEY (id);


--
-- Name: index_average_marks_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_average_marks_on_number ON average_marks USING btree (value);


--
-- Name: index_average_marks_on_semester_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_average_marks_on_semester_id ON average_marks USING btree (semester_id);


--
-- Name: index_average_marks_on_student_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_average_marks_on_student_id ON average_marks USING btree (student_id);


--
-- Name: index_groups_on_course_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_groups_on_course_id ON groups USING btree (course_id);


--
-- Name: index_marks_on_semester_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_marks_on_semester_id ON marks USING btree (semester_id);


--
-- Name: index_marks_on_student_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_marks_on_student_id ON marks USING btree (student_id);


--
-- Name: index_marks_on_subject_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_marks_on_subject_id ON marks USING btree (subject_id);


--
-- Name: index_semester_subjects_on_semester_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_semester_subjects_on_semester_id ON semester_subjects USING btree (semester_id);


--
-- Name: index_semester_subjects_on_subject_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_semester_subjects_on_subject_id ON semester_subjects USING btree (subject_id);


--
-- Name: index_semesters_on_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_semesters_on_group_id ON semesters USING btree (group_id);


--
-- Name: index_semesters_on_number; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_semesters_on_number ON semesters USING btree (number);


--
-- Name: index_students_on_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_students_on_group_id ON students USING btree (group_id);


--
-- Name: index_students_on_ip; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_students_on_ip ON students USING btree (ip);


--
-- Name: index_students_on_lowercase_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_students_on_lowercase_name ON students USING btree (lower((name)::text));


--
-- Name: index_students_on_lowercase_surname; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_students_on_lowercase_surname ON students USING btree (lower((surname)::text));


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_1f1e6ffb8e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT fk_rails_1f1e6ffb8e FOREIGN KEY (course_id) REFERENCES courses(id);


--
-- Name: fk_rails_339a7dca38; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY students
    ADD CONSTRAINT fk_rails_339a7dca38 FOREIGN KEY (group_id) REFERENCES groups(id);


--
-- Name: fk_rails_458877e309; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY average_marks
    ADD CONSTRAINT fk_rails_458877e309 FOREIGN KEY (student_id) REFERENCES students(id);


--
-- Name: fk_rails_481581dc88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY semester_subjects
    ADD CONSTRAINT fk_rails_481581dc88 FOREIGN KEY (subject_id) REFERENCES subjects(id);


--
-- Name: fk_rails_655284b209; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY semester_subjects
    ADD CONSTRAINT fk_rails_655284b209 FOREIGN KEY (semester_id) REFERENCES semesters(id);


--
-- Name: fk_rails_7d036e65c3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY marks
    ADD CONSTRAINT fk_rails_7d036e65c3 FOREIGN KEY (semester_id) REFERENCES semesters(id);


--
-- Name: fk_rails_8ca33c5652; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY semesters
    ADD CONSTRAINT fk_rails_8ca33c5652 FOREIGN KEY (group_id) REFERENCES groups(id);


--
-- Name: fk_rails_a7ee45067e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY marks
    ADD CONSTRAINT fk_rails_a7ee45067e FOREIGN KEY (student_id) REFERENCES students(id);


--
-- Name: fk_rails_f4a3867823; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY marks
    ADD CONSTRAINT fk_rails_f4a3867823 FOREIGN KEY (subject_id) REFERENCES subjects(id);


--
-- Name: fk_rails_f611ff5be8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY average_marks
    ADD CONSTRAINT fk_rails_f611ff5be8 FOREIGN KEY (semester_id) REFERENCES semesters(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150827051436');

INSERT INTO schema_migrations (version) VALUES ('20150827051556');

INSERT INTO schema_migrations (version) VALUES ('20150827051643');

INSERT INTO schema_migrations (version) VALUES ('20150827051826');

INSERT INTO schema_migrations (version) VALUES ('20150827051907');

INSERT INTO schema_migrations (version) VALUES ('20150827051954');

INSERT INTO schema_migrations (version) VALUES ('20150827052106');

INSERT INTO schema_migrations (version) VALUES ('20150827092049');

INSERT INTO schema_migrations (version) VALUES ('20150827100359');

INSERT INTO schema_migrations (version) VALUES ('20150827145501');

INSERT INTO schema_migrations (version) VALUES ('20150828111109');

INSERT INTO schema_migrations (version) VALUES ('20150828145818');

INSERT INTO schema_migrations (version) VALUES ('20150828162855');

INSERT INTO schema_migrations (version) VALUES ('20150828163124');

