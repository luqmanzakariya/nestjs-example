DROP TABLE IF EXISTS public.payments;

CREATE TABLE public.payments (
    id integer NOT NULL,
    user_id character varying(191) NOT NULL,
    order_id bigint NOT NULL,
    payment_provider public.payments_provider DEFAULT 'qris'::public.payments_provider,
    status public.payments_status DEFAULT 'unpaid'::public.payments_status,
    total_amount numeric(14,2) DEFAULT 0,
    expired_date timestamp without time zone,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.payments OWNER TO postgres;

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);

CREATE INDEX idx_payment_order_id ON public.payments USING btree (order_id);

CREATE INDEX idx_payment_user ON public.payments USING btree (user_id);
