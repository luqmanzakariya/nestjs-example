DROP TABLE IF EXISTS public.reasons;

CREATE TABLE public.reasons (
    id smallint NOT NULL,
    context character varying(191),
    parent_id smallint,
    reason_type public.reasons_reason_type DEFAULT 'text'::public.reasons_reason_type,
    key character varying(191),
    value text,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.reasons OWNER TO postgres;

CREATE SEQUENCE public.reasons_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reasons_id_seq OWNER TO postgres;

ALTER SEQUENCE public.reasons_id_seq OWNED BY public.reasons.id;

ALTER TABLE ONLY public.reasons ALTER COLUMN id SET DEFAULT nextval('public.reasons_id_seq'::regclass);

ALTER TABLE ONLY public.reasons
    ADD CONSTRAINT reasons_key_key UNIQUE (key);

ALTER TABLE ONLY public.reasons
    ADD CONSTRAINT reasons_pkey PRIMARY KEY (id);

CREATE INDEX idx_reasons ON public.reasons USING btree (parent_id);
