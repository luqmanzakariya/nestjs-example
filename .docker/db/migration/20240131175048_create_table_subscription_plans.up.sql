DROP TABLE IF EXISTS public.subscription_plans;

CREATE TABLE public.subscription_plans (
    id bigint NOT NULL,
    code character varying(191),
    name character varying(255),
    badge_image_id bigint,
    description text,
    price numeric(14,2) DEFAULT 0,
    status public.status DEFAULT 'active'::public.status,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp without time zone
);


ALTER TABLE public.subscription_plans OWNER TO postgres;

CREATE SEQUENCE public.subscription_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subscription_plans_id_seq OWNER TO postgres;

ALTER SEQUENCE public.subscription_plans_id_seq OWNED BY public.subscription_plans.id;

ALTER TABLE ONLY public.subscription_plans ALTER COLUMN id SET DEFAULT nextval('public.subscription_plans_id_seq'::regclass);


ALTER TABLE ONLY public.subscription_plans
    ADD CONSTRAINT subscription_plans_pkey PRIMARY KEY (id);


CREATE INDEX idx_subscription_plans_badge_image_id ON public.subscription_plans USING btree (badge_image_id);


CREATE INDEX idx_subscription_plans_code ON public.subscription_plans USING btree (code);


CREATE INDEX idx_subscription_plans_name ON public.subscription_plans USING btree (name);
