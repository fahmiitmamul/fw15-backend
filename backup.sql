PGDMP                         {            postgres    15.2    15.2 N               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3458                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            �            1259    16549 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
    DROP TABLE public.categories;
       public         heap    postgres    false    5            �            1259    16548    categories_id_seq    SEQUENCE     �   ALTER TABLE public.categories ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    220            �            1259    16556    cities    TABLE       CREATE TABLE public.cities (
    id integer NOT NULL,
    picture character varying(255),
    name character varying(255),
    lat integer,
    long integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
    DROP TABLE public.cities;
       public         heap    postgres    false    5            �            1259    16555    cities_id_seq    SEQUENCE     �   ALTER TABLE public.cities ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    222            �            1259    16574    eventCategories    TABLE     �   CREATE TABLE public."eventCategories" (
    id integer NOT NULL,
    "eventId" integer,
    "categoryId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
 %   DROP TABLE public."eventCategories";
       public         heap    postgres    false    5            �            1259    16573    eventCategories_id_seq    SEQUENCE     �   ALTER TABLE public."eventCategories" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."eventCategories_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    226    5            �            1259    16565    events    TABLE     :  CREATE TABLE public.events (
    id integer NOT NULL,
    picture character varying(255),
    title character varying(255),
    date date,
    "cityId" integer,
    description text,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone,
    "createdBy" integer
);
    DROP TABLE public.events;
       public         heap    postgres    false    5            �            1259    16564    events_id_seq    SEQUENCE     �   ALTER TABLE public.events ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    224    5            �            1259    24613    forgotRequest    TABLE     �   CREATE TABLE public."forgotRequest" (
    id integer NOT NULL,
    email character varying(255),
    code character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
 #   DROP TABLE public."forgotRequest";
       public         heap    postgres    false    5            �            1259    24612    forgotRequest_id_seq    SEQUENCE     �   ALTER TABLE public."forgotRequest" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."forgotRequest_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    242    5            �            1259    16581    partners    TABLE     �   CREATE TABLE public.partners (
    id integer NOT NULL,
    picture character varying(255),
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
    DROP TABLE public.partners;
       public         heap    postgres    false    5            �            1259    16580    partners_id_seq    SEQUENCE     �   ALTER TABLE public.partners ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.partners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    228            �            1259    16606    paymentMethod    TABLE     �   CREATE TABLE public."paymentMethod" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
 #   DROP TABLE public."paymentMethod";
       public         heap    postgres    false    5            �            1259    16605    paymentMethod_id_seq    SEQUENCE     �   ALTER TABLE public."paymentMethod" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."paymentMethod_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    234    5            �            1259    16540    profile    TABLE     �  CREATE TABLE public.profile (
    id integer NOT NULL,
    picture character varying(255),
    "fullName" character varying(255),
    "phoneNumber" character varying(255),
    gender boolean,
    profession character varying(255),
    nationality character varying(255),
    "birthDate" date,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
    DROP TABLE public.profile;
       public         heap    postgres    false    5            �            1259    16539    profile_id_seq    SEQUENCE     �   ALTER TABLE public.profile ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    218            �            1259    16590    reservationSections    TABLE     �   CREATE TABLE public."reservationSections" (
    id integer NOT NULL,
    name character varying(255),
    price character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
 )   DROP TABLE public."reservationSections";
       public         heap    postgres    false    5            �            1259    16589    reservationSections_id_seq    SEQUENCE     �   ALTER TABLE public."reservationSections" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationSections_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    230    5            �            1259    16599    reservationStatus    TABLE     �   CREATE TABLE public."reservationStatus" (
    id integer NOT NULL,
    name character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
 '   DROP TABLE public."reservationStatus";
       public         heap    postgres    false    5            �            1259    16598    reservationStatus_id_seq    SEQUENCE     �   ALTER TABLE public."reservationStatus" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationStatus_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    232            �            1259    16613    reservations    TABLE     
  CREATE TABLE public.reservations (
    id integer NOT NULL,
    "eventId" integer,
    "userId" integer,
    "statusId" integer,
    "paymentMethodId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
     DROP TABLE public.reservations;
       public         heap    postgres    false    5            �            1259    16620    reservationsTickets    TABLE     �   CREATE TABLE public."reservationsTickets" (
    id integer NOT NULL,
    "reservationId" integer,
    "sectionId" integer,
    quantity integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
 )   DROP TABLE public."reservationsTickets";
       public         heap    postgres    false    5            �            1259    16619    reservationsTickets_id_seq    SEQUENCE     �   ALTER TABLE public."reservationsTickets" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."reservationsTickets_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    238            �            1259    16612    reservations_id_seq    SEQUENCE     �   ALTER TABLE public.reservations ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    236    5            �            1259    16529    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    password character varying(255),
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false    5            �            1259    16528    users_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    216            �            1259    16627 	   wishlists    TABLE     �   CREATE TABLE public.wishlists (
    id integer NOT NULL,
    "eventId" integer,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT now(),
    "updatedAt" timestamp without time zone
);
    DROP TABLE public.wishlists;
       public         heap    postgres    false    5            �            1259    16626    wishlists_id_seq    SEQUENCE     �   ALTER TABLE public.wishlists ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.wishlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    5    240            f          0    16549 
   categories 
   TABLE DATA           H   COPY public.categories (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    220   ]       h          0    16556    cities 
   TABLE DATA           X   COPY public.cities (id, picture, name, lat, long, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    222   �]       l          0    16574    eventCategories 
   TABLE DATA           b   COPY public."eventCategories" (id, "eventId", "categoryId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    226   ^       j          0    16565    events 
   TABLE DATA           x   COPY public.events (id, picture, title, date, "cityId", description, "createdAt", "updatedAt", "createdBy") FROM stdin;
    public          postgres    false    224   o^       |          0    24613    forgotRequest 
   TABLE DATA           T   COPY public."forgotRequest" (id, email, code, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    242   `       n          0    16581    partners 
   TABLE DATA           O   COPY public.partners (id, picture, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    228   4`       t          0    16606    paymentMethod 
   TABLE DATA           M   COPY public."paymentMethod" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    234   Q`       d          0    16540    profile 
   TABLE DATA           �   COPY public.profile (id, picture, "fullName", "phoneNumber", gender, profession, nationality, "birthDate", "userId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    218   n`       p          0    16590    reservationSections 
   TABLE DATA           Z   COPY public."reservationSections" (id, name, price, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    230   �`       r          0    16599    reservationStatus 
   TABLE DATA           Q   COPY public."reservationStatus" (id, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    232   �`       v          0    16613    reservations 
   TABLE DATA           x   COPY public.reservations (id, "eventId", "userId", "statusId", "paymentMethodId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    236   �`       x          0    16620    reservationsTickets 
   TABLE DATA           u   COPY public."reservationsTickets" (id, "reservationId", "sectionId", quantity, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    238   �`       b          0    16529    users 
   TABLE DATA           X   COPY public.users (id, username, email, password, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216   �`       z          0    16627 	   wishlists 
   TABLE DATA           V   COPY public.wishlists (id, "eventId", "userId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    240   a       �           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 7, true);
          public          postgres    false    219            �           0    0    cities_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.cities_id_seq', 7, true);
          public          postgres    false    221            �           0    0    eventCategories_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."eventCategories_id_seq"', 7, true);
          public          postgres    false    225            �           0    0    events_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.events_id_seq', 7, true);
          public          postgres    false    223            �           0    0    forgotRequest_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."forgotRequest_id_seq"', 1, false);
          public          postgres    false    241            �           0    0    partners_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.partners_id_seq', 1, false);
          public          postgres    false    227            �           0    0    paymentMethod_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."paymentMethod_id_seq"', 1, false);
          public          postgres    false    233            �           0    0    profile_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.profile_id_seq', 1, false);
          public          postgres    false    217            �           0    0    reservationSections_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."reservationSections_id_seq"', 1, false);
          public          postgres    false    229            �           0    0    reservationStatus_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."reservationStatus_id_seq"', 1, false);
          public          postgres    false    231            �           0    0    reservationsTickets_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."reservationsTickets_id_seq"', 1, false);
          public          postgres    false    237            �           0    0    reservations_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.reservations_id_seq', 1, false);
          public          postgres    false    235            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    215            �           0    0    wishlists_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.wishlists_id_seq', 1, false);
          public          postgres    false    239            �           2606    16554    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    220            �           2606    16563    cities cities_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    222            �           2606    16579 $   eventCategories eventCategories_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."eventCategories"
    ADD CONSTRAINT "eventCategories_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."eventCategories" DROP CONSTRAINT "eventCategories_pkey";
       public            postgres    false    226            �           2606    16572    events events_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    224            �           2606    24620     forgotRequest forgotRequest_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."forgotRequest"
    ADD CONSTRAINT "forgotRequest_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."forgotRequest" DROP CONSTRAINT "forgotRequest_pkey";
       public            postgres    false    242            �           2606    16588    partners partners_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.partners DROP CONSTRAINT partners_pkey;
       public            postgres    false    228            �           2606    16611     paymentMethod paymentMethod_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."paymentMethod"
    ADD CONSTRAINT "paymentMethod_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."paymentMethod" DROP CONSTRAINT "paymentMethod_pkey";
       public            postgres    false    234            �           2606    16547    profile profile_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public            postgres    false    218            �           2606    16597 ,   reservationSections reservationSections_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."reservationSections"
    ADD CONSTRAINT "reservationSections_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."reservationSections" DROP CONSTRAINT "reservationSections_pkey";
       public            postgres    false    230            �           2606    16604 (   reservationStatus reservationStatus_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."reservationStatus"
    ADD CONSTRAINT "reservationStatus_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."reservationStatus" DROP CONSTRAINT "reservationStatus_pkey";
       public            postgres    false    232            �           2606    16625 ,   reservationsTickets reservationsTickets_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."reservationsTickets"
    ADD CONSTRAINT "reservationsTickets_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."reservationsTickets" DROP CONSTRAINT "reservationsTickets_pkey";
       public            postgres    false    238            �           2606    16618    reservations reservations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_pkey;
       public            postgres    false    236            �           2606    16538    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    216            �           2606    16536    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �           2606    16632    wishlists wishlists_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.wishlists
    ADD CONSTRAINT wishlists_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.wishlists DROP CONSTRAINT wishlists_pkey;
       public            postgres    false    240            f   s   x�3��--�L�4202�50�5�P04�2��25�3�04�0���2�t,*)&�Șӿ�$%?���B�������
M9��J�2�tK-.�,K�!�М�-�8#3?���=... ��>6      h   t   x�3����J�N,*I1�����X��D��B��������@������(�eR┘�R��N�c���L�T���8&�f���$8?'�(�f %���$x�lCjnbQ"������� �K8      l   H   x���A� ��EE���ZDT�u�2�]��8m��;}�=E׃����<�ʓ��L��,��nfN�.o      j   �  x��Mr�0���)p�X#ɲ�d���鮻lPv1ÿ�D������h�E���M�����b�/�az2�8��?�f2_R� ��pɧ�`�� ���FM
����r�y��JN�XjH���-;vH��U�ݤ	^#z~�[�T��w=bx�7�
1�V�}P�ܰq� �c���q��$g}�j<��t��� /]�pur��
�B?(:*\�'/Yב�Ѥ@�X��oCH�"W����ER��a)7�^�v��E���Jf��Oh�\;���ޔ.��3�ܐ.���H��ې|��� �:�^%�#9?�4?/O��2��e;�i7���q?Nf�诙����6�k��ܣ0�F����/��_3��=�Gs�诙����9o��L�u��v� ����      |      x������ � �      n      x������ � �      t      x������ � �      d      x������ � �      p      x������ � �      r      x������ � �      v      x������ � �      x      x������ � �      b      x������ � �      z      x������ � �     