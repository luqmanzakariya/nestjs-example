DROP TABLE IF EXISTS public.post_bookmarks;

CREATE TABLE public.post_bookmarks (
    id bigint NOT NULL,
    post_id integer,
    user_id character varying(191),
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE public.post_bookmarks OWNER TO postgres;

CREATE SEQUENCE public.post_bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.post_bookmarks_id_seq OWNER TO postgres;

ALTER SEQUENCE public.post_bookmarks_id_seq OWNED BY public.post_bookmarks.id;

ALTER TABLE ONLY public.post_bookmarks ALTER COLUMN id SET DEFAULT nextval('public.post_bookmarks_id_seq'::regclass);

ALTER TABLE ONLY public.post_bookmarks
    ADD CONSTRAINT post_bookmarks_pkey PRIMARY KEY (id);

CREATE INDEX idx_post_bookmarks_post_id ON public.post_bookmarks USING btree (post_id);

CREATE INDEX idx_post_bookmarks_user_id ON public.post_bookmarks USING btree (user_id);