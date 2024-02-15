DROP TABLE IF EXISTS public.creators;

CREATE TABLE public.creators (
    id integer NOT NULL,
    avatar_id bigint,
    name character varying(191),
    bio text,
    followers integer DEFAULT 0,
    status public.status DEFAULT 'active'::public.status,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.creators OWNER TO postgres;

CREATE SEQUENCE public.creators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.creators_id_seq OWNER TO postgres;

ALTER SEQUENCE public.creators_id_seq OWNED BY public.creators.id;

ALTER TABLE ONLY public.creators ALTER COLUMN id SET DEFAULT nextval('public.creators_id_seq'::regclass);

ALTER TABLE ONLY public.creators
    ADD CONSTRAINT creators_pkey PRIMARY KEY (id);

CREATE INDEX idx_creators ON public.creators USING btree (avatar_id);
