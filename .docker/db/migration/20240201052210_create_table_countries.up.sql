DROP TABLE IF EXISTS public.countries;

CREATE TABLE public.countries (
    id integer NOT NULL,
    country character varying(30),
    country_code character varying(3),
    status public.status DEFAULT 'active'::public.status,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.countries OWNER TO postgres;

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_id_seq OWNER TO postgres;

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


CREATE INDEX idx_country_code ON public.countries USING btree (country_code);