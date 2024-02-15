DROP TABLE IF EXISTS public.posts;

CREATE TABLE public.posts (
    id integer NOT NULL,
    creator_id integer,
    caption text,
    likes integer DEFAULT 0,
    bookmarks integer DEFAULT 0,
    type public.posts_type DEFAULT 'free'::public.posts_type,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp without time zone
);

ALTER TABLE public.posts OWNER TO postgres;

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER SEQUENCE public.posts_id_seq OWNER TO postgres;

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);

CREATE INDEX idx_posts_creator_id ON public.posts USING btree (creator_id);