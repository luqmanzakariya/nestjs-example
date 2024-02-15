DROP TABLE IF EXISTS public.memberships;

CREATE TABLE public.memberships (
    id bigint NOT NULL,
    user_id character varying(191) NOT NULL,
    type public.memberships_type DEFAULT 'monthly'::public.memberships_type,
    status public.memberships_status DEFAULT 'active'::public.memberships_status,
    expired_date timestamp without time zone DEFAULT (CURRENT_TIMESTAMP + '1 mon'::interval),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.memberships OWNER TO postgres;

CREATE SEQUENCE public.memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.memberships_id_seq OWNER TO postgres;

ALTER SEQUENCE public.memberships_id_seq OWNED BY public.memberships.id;

ALTER TABLE ONLY public.memberships ALTER COLUMN id SET DEFAULT nextval('public.memberships_id_seq'::regclass);

ALTER TABLE ONLY public.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);

CREATE INDEX idx_type ON public.memberships USING btree (type);

CREATE INDEX idx_user ON public.memberships USING btree (user_id);