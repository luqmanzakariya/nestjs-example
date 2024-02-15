DROP TABLE IF EXISTS public.notifications;

CREATE TABLE public.notifications (
    id bigint NOT NULL,
    type public.notifications_type DEFAULT 'app_notification'::public.notifications_type,
    version smallint,
    context character varying(191),
    user_id character varying(191),
    notification character varying(191),
    data json,
    show_data boolean,
    status public.notifications_status DEFAULT 'pending'::public.notifications_status,
    callback_success json DEFAULT '{}'::json,
    callback_failure json DEFAULT '{}'::json,
    read_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.notifications OWNER TO postgres;

CREATE SEQUENCE public.notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notifications_id_seq OWNER TO postgres;

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);

CREATE INDEX idx_notifications ON public.notifications USING btree (user_id);
