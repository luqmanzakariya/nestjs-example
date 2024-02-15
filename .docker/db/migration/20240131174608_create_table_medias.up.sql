DROP TABLE IF EXISTS public.medias;

CREATE TABLE public.medias (
    id bigint NOT NULL,
    key character varying(191) NOT NULL,
    type public.medias_type DEFAULT 'video'::public.medias_type,
    user_id character varying(191),
    mime_type character varying(20) NOT NULL,
    extension character varying(5) NOT NULL,
    meta json,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.medias OWNER TO postgres;

CREATE SEQUENCE public.medias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.medias_id_seq OWNER TO postgres;

ALTER SEQUENCE public.medias_id_seq OWNED BY public.medias.id;

ALTER TABLE ONLY public.medias ALTER COLUMN id SET DEFAULT nextval('public.medias_id_seq'::regclass);

ALTER TABLE ONLY public.medias
    ADD CONSTRAINT medias_pkey PRIMARY KEY (id);

CREATE INDEX idx_medias_type ON public.medias USING btree (type);

CREATE INDEX idx_medias_user ON public.medias USING btree (user_id);
