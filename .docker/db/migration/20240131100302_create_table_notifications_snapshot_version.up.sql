DROP TABLE IF EXISTS public.notifications_snapshot_version;

CREATE TABLE public.notifications_snapshot_version (
    id bigint NOT NULL,
    user_id character varying(191),
    version character varying(191),
    unread integer,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.notifications_snapshot_version OWNER TO postgres;

CREATE SEQUENCE public.notifications_snapshot_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.notifications_snapshot_version_id_seq OWNER TO postgres;

ALTER SEQUENCE public.notifications_snapshot_version_id_seq OWNED BY public.notifications_snapshot_version.id;

ALTER TABLE ONLY public.notifications_snapshot_version ALTER COLUMN id SET DEFAULT nextval('public.notifications_snapshot_version_id_seq'::regclass);

ALTER TABLE ONLY public.notifications_snapshot_version
    ADD CONSTRAINT notifications_snapshot_version_pkey PRIMARY KEY (id);

CREATE INDEX idx_notifications_snapshot_version ON public.notifications_snapshot_version USING btree (user_id);
