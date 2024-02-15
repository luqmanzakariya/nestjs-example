DROP TABLE IF EXISTS public.orders;

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id character varying(191) NOT NULL,
    subscription_plan_id bigint NOT NULL,
    order_number character varying(191) NOT NULL,
    total_price numeric(14,2) DEFAULT 0,
    status public.orders_status DEFAULT 'pending'::public.orders_status,
    subcription_date_from timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    subcription_date_expired timestamp without time zone DEFAULT (CURRENT_TIMESTAMP + '1 mon'::interval),
    expired_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.orders OWNER TO postgres;

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_number_key UNIQUE (order_number);

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);

CREATE INDEX idx_orders_account ON public.orders USING btree (order_number);

CREATE INDEX idx_orders_payment ON public.orders USING btree (subscription_plan_id);

CREATE INDEX idx_orders_status ON public.orders USING btree (status);

CREATE INDEX idx_orders_user ON public.orders USING btree (user_id);