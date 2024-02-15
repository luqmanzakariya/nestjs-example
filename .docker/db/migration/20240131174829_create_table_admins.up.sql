DROP TABLE IF EXISTS public.admins;

CREATE TABLE public.admins (
    id character varying(191) NOT NULL,
    name character varying(100),
    username character varying(191) NOT NULL,
    email character varying(191) NOT NULL,
    phone_number character varying(16),
    password character varying(191),
    status public.admins_status DEFAULT 'active'::public.admins_status,
    remember_token character varying(100),
    forgot_token character varying(500),
    forgot_token_expired_at timestamp without time zone,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.admins OWNER TO postgres;

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_username_key UNIQUE (username);

CREATE INDEX idx_email ON public.admins USING btree (email);

CREATE INDEX idx_name ON public.admins USING btree (name);

CREATE INDEX idx_username ON public.admins USING btree (username);