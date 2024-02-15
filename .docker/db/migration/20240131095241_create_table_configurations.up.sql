DROP TABLE IF EXISTS public.configurations;

CREATE TABLE public.configurations (
    id integer NOT NULL,
    key character varying(191),
    value json,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp without time zone
);

ALTER TABLE public.configurations OWNER TO postgres;

CREATE SEQUENCE public.configurations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.configurations_id_seq OWNER TO postgres;

ALTER SEQUENCE public.configurations_id_seq OWNED BY public.configurations.id;

ALTER TABLE ONLY public.configurations ALTER COLUMN id SET DEFAULT nextval('public.configurations_id_seq'::regclass);

ALTER TABLE ONLY public.configurations
    ADD CONSTRAINT configurations_key_key UNIQUE (key);

ALTER TABLE ONLY public.configurations
    ADD CONSTRAINT configurations_pkey PRIMARY KEY (id);
