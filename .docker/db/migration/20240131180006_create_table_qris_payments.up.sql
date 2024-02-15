DROP TABLE IF EXISTS public.qris_payments;

CREATE TABLE public.qris_payments (
    id integer NOT NULL,
    user_id character varying(191) NOT NULL,
    payment_id integer NOT NULL,
    qris_account_id integer NOT NULL,
    amount numeric(14,2) DEFAULT 0,
    status public.qris_payments_status DEFAULT 'unconfirmed'::public.qris_payments_status,
    callback json,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.qris_payments OWNER TO postgres;

CREATE SEQUENCE public.qris_payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.qris_payments_id_seq OWNER TO postgres;

ALTER SEQUENCE public.qris_payments_id_seq OWNED BY public.qris_payments.id;

ALTER TABLE ONLY public.qris_payments ALTER COLUMN id SET DEFAULT nextval('public.qris_payments_id_seq'::regclass);

ALTER TABLE ONLY public.qris_payments
    ADD CONSTRAINT qris_payments_pkey PRIMARY KEY (id);

CREATE INDEX idx_qris_payments_account ON public.qris_payments USING btree (qris_account_id);

CREATE INDEX idx_qris_payments_payment ON public.qris_payments USING btree (payment_id);

CREATE INDEX idx_qris_payments_status ON public.qris_payments USING btree (status);

CREATE INDEX idx_qris_payments_user ON public.qris_payments USING btree (user_id);