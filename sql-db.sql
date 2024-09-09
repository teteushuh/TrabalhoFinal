## SQL Cliente, Hospedagem, Chale, Item, Chale_Item

BEGIN;


CREATE TABLE IF NOT EXISTS public.item
(
    "nomeItem" character varying(50),
    "descricaoItem" character varying(50),
    PRIMARY KEY ("nomeItem")
);

CREATE TABLE IF NOT EXISTS public.chale
(
    "codChale" bigserial NOT NULL,
    localizacao character varying(50),
    capacidade integer,
    "valorAltaEstacao" double precision,
    "valorBaixaEstacao" double precision,
    PRIMARY KEY ("codChale")
);

CREATE TABLE IF NOT EXISTS public.chale_item
(
    "chale_codChale" bigint,
    "Item_nomeItem" character varying(50)
);

CREATE TABLE IF NOT EXISTS public.cliente
(
    "codCliente" bigserial NOT NULL,
    nome character varying(100),
    rg character varying(100),
    endereco character varying(100),
    bairro character varying(100),
    cidade character varying(100),
    estado character varying(2),
    cep character varying(8),
    dt_nascimento date,
    PRIMARY KEY ("codCliente")
);

CREATE TABLE IF NOT EXISTS public.hospedagem
(
    "codHospedagem" bigserial NOT NULL,
    estado character varying(2),
    "dataInicio" date,
    "dataFim" date,
    "qtdPessoas" integer,
    desconto double precision,
    "valorFinal" double precision,
    PRIMARY KEY ("codHospedagem")
);

ALTER TABLE IF EXISTS public.chale_item
    ADD FOREIGN KEY ("chale_codChale")
    REFERENCES public.chale ("codChale") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.chale_item
    ADD FOREIGN KEY ("Item_nomeItem")
    REFERENCES public.item ("nomeItem") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.hospedagem
    ADD FOREIGN KEY ("codHospedagem")
    REFERENCES public.cliente ("codCliente") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.hospedagem
    ADD FOREIGN KEY ("codHospedagem")
    REFERENCES public.chale ("codChale") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;








