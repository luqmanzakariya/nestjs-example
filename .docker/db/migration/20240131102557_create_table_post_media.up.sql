DROP TABLE IF EXISTS public.posts_media;

CREATE TABLE public.posts_media (
    id bigint NOT NULL,
    post_id integer,
    media_id bigint,
    type public.posts_media_type DEFAULT 'full'::public.posts_media_type,
    caption text,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp without time zone
);

ALTER TABLE public.posts_media OWNER TO postgres;

CREATE SEQUENCE public.posts_media_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.posts_media_id_seq OWNER TO postgres;

ALTER SEQUENCE public.posts_media_id_seq OWNED BY public.posts_media.id;

ALTER TABLE ONLY public.posts_media ALTER COLUMN id SET DEFAULT nextval('public.posts_media_id_seq'::regclass);

ALTER TABLE ONLY public.posts_media
    ADD CONSTRAINT posts_media_pkey PRIMARY KEY (id);

CREATE INDEX idx_post_media_media_id ON public.posts_media USING btree (media_id);

CREATE INDEX idx_post_media_post_id ON public.posts_media USING btree (post_id);