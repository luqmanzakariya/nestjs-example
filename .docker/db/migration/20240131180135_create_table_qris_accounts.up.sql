DROP TABLE IF EXISTS public.qris_accounts;

CREATE TABLE public.qris_accounts (
    id smallint NOT NULL,
    account_name character varying(191) NOT NULL,
    qris_image character varying(191) NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp without time zone
);

ALTER TABLE public.qris_accounts OWNER TO postgres;

CREATE SEQUENCE public.qris_accounts_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.qris_accounts_id_seq OWNER TO postgres;

ALTER SEQUENCE public.qris_accounts_id_seq OWNED BY public.qris_accounts.id;

ALTER TABLE ONLY public.qris_accounts ALTER COLUMN id SET DEFAULT nextval('public.qris_accounts_id_seq'::regclass);

ALTER TABLE ONLY public.qris_accounts
    ADD CONSTRAINT qris_accounts_pkey PRIMARY KEY (id);

CREATE INDEX idx_qris_accounts_account_name ON public.qris_accounts USING btree (account_name);