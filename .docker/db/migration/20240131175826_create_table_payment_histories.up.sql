DROP TABLE IF EXISTS public.payment_histories;

CREATE TABLE public.payment_histories (
    id integer NOT NULL,
    payment_id integer NOT NULL,
    status character varying(191) NOT NULL,
    callback_response_provider text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.payment_histories OWNER TO postgres;

CREATE SEQUENCE public.payment_histories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.payment_histories_id_seq OWNER TO postgres;

ALTER SEQUENCE public.payment_histories_id_seq OWNED BY public.payment_histories.id;

ALTER TABLE ONLY public.payment_histories ALTER COLUMN id SET DEFAULT nextval('public.payment_histories_id_seq'::regclass);

ALTER TABLE ONLY public.payment_histories
    ADD CONSTRAINT payment_histories_pkey PRIMARY KEY (id);

CREATE INDEX idx_payment_history_payment_id ON public.payment_histories USING btree (payment_id);

CREATE INDEX idx_payment_history_status ON public.payment_histories USING btree (payment_id);