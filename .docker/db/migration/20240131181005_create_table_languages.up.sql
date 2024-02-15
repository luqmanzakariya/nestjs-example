DROP TABLE IF EXISTS public.languages;

CREATE TABLE public.languages (
    id smallint NOT NULL,
    language character varying(50),
    language_code character varying(10),
    country_code character varying(3),
    status public.status DEFAULT 'active'::public.status,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.languages OWNER TO postgres;

CREATE SEQUENCE public.languages_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.languages_id_seq OWNER TO postgres;

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (id);

CREATE INDEX idx_language_code ON public.languages USING btree (language_code);

CREATE INDEX idx_language_country_code ON public.languages USING btree (country_code);