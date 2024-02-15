CREATE TYPE public.status AS ENUM (
    'active',
    'inactive'
);

ALTER TYPE public.status OWNER TO postgres;

CREATE TYPE public.notifications_type AS ENUM (
    'app_notification'
);

ALTER TYPE public.notifications_type OWNER TO postgres;

CREATE TYPE public.notifications_status AS ENUM (
    'pending',
    'success',
    'failed'
);

ALTER TYPE public.notifications_status OWNER TO postgres;

CREATE TYPE public.reasons_reason_type AS ENUM (
    'option',
    'text',
    'checkbox'
);

ALTER TYPE public.reasons_reason_type OWNER TO postgres;

CREATE TYPE public.posts_media_type AS ENUM (
    'trailer',
    'full'
);

ALTER TYPE public.posts_media_type OWNER TO postgres;

CREATE TYPE public.posts_type AS ENUM (
    'premium',
    'free'
);

ALTER TYPE public.posts_type OWNER TO postgres;

CREATE TYPE public.medias_type AS ENUM (
    'image',
    'video'
);

ALTER TYPE public.medias_type OWNER TO postgres;

CREATE TYPE public.admins_status AS ENUM (
    'active',
    'banned',
    'suspended'
);

ALTER TYPE public.admins_status OWNER TO postgres;

CREATE TYPE public.memberships_type AS ENUM (
    'monthly',
    'annually'
);

ALTER TYPE public.memberships_type OWNER TO postgres;

CREATE TYPE public.memberships_status AS ENUM (
    'active',
    'expired'
);

ALTER TYPE public.memberships_status OWNER TO postgres;

CREATE TYPE public.payments_provider AS ENUM (
    'qris'
);

ALTER TYPE public.payments_provider OWNER TO postgres;

CREATE TYPE public.payments_status AS ENUM (
    'unpaid',
    'paid'
);

ALTER TYPE public.payments_status OWNER TO postgres;

CREATE TYPE public.qris_payments_status AS ENUM (
    'unconfirmed',
    'confirmed'
);

ALTER TYPE public.qris_payments_status OWNER TO postgres;

CREATE TYPE public.orders_status AS ENUM (
    'pending',
    'approved'
);

ALTER TYPE public.orders_status OWNER TO postgres;