create table tb_entregador (
    ds_apelido varchar(255),
    co_pessoa int8 not null,
    co_regiao_atuacao int8,
    primary key (co_pessoa)
);
create table tb_grupo_seg (
    co_grupo int8 not null,
    ind_administracao boolean,
    ds_identificador_unico varchar(255),
    ds_nome varchar(255),
    primary key (co_grupo)
);
create table tb_pagina_seg (
    co_pagina int8 not null,
    ind_ativo boolean,
    ds_descricao varchar(255),
    ds_icone varchar(255),
    ds_identificador_unico varchar(255),
    link_barra boolean,
    ds_nome varchar(255),
    ordem int4,
    ind_pode_ser_pagina_padrao boolean,
    ds_url varchar(255),
    co_pagina_pai int8,
    primary key (co_pagina)
);
create table tb_permissao_grupo_usuario_seg (
    co_per_grupo_usuario int8 not null,
    co_grupo int8,
    co_permissao int8,
    co_usuario int8,
    primary key (co_per_grupo_usuario)
);
create table tb_permissao_seg (
    co_permissao int8 not null,
    ds_descricao varchar(255),
    ds_escopo varchar(255),
    ds_nome varchar(255),
    ds_nome_amigavel varchar(255),
    co_pagina int8,
    primary key (co_permissao)
);
create table tb_pessoa (
    co_pessoa int8 not null,
    ds_avatar TEXT,
    ds_email varchar(255) not null,
    ds_nome varchar(255),
    ds_sexo varchar(255),
    ds_telefone varchar(255),
    ds_tenant_id varchar(255),
    primary key (co_pessoa)
);
create table tb_regiao_atuacao (
    co_regiao_atuacao int8 not null,
    ds_nome varchar(255),
    primary key (co_regiao_atuacao)
);
create table tb_tipo_carroceria (
    co_tipo_carroceria int8 not null,
    ds_descricao varchar(255),
    primary key (co_tipo_carroceria)
);
create table tb_tipo_veiculo (
    co_tipo_veiculo int8 not null,
    ds_descricao varchar(255),
    primary key (co_tipo_veiculo)
);
create table tb_usuario_grupo_seg (
    co_usuario_grupo int8 not null,
    co_grupo int8 not null,
    co_usuario int8 not null,
    primary key (co_usuario_grupo)
);
create table tb_usuario_seg (
    co_usuario int8 not null,
    ind_ativo boolean,
    ind_auto_registro boolean,
    ds_login varchar(255) not null,
    ds_senha varchar(255),
    ind_senha_alterada boolean,
    co_pagina int8,
    co_pessoa int8,
    primary key (co_usuario)
);
create table tb_veiculo (
    co_veiculo int8 not null,
    co_pessoa int8,
    co_veiculo_carroceria int8,
    primary key (co_veiculo)
);
create table tb_veiculo_carroceria (
    co_veiculo_carroceria int8 not null,
    co_tipo_carroceria int8,
    co_tipo_veiculo int8,
    primary key (co_veiculo_carroceria)
);
alter table tb_permissao_seg 
    add constraint UK_2dbav7bxbxlfmmiml9nftg3l6  unique (ds_nome);
alter table tb_pessoa 
    add constraint UK_519w51rjyl4xkxgg9f4g8u85o  unique (ds_email);
alter table tb_usuario_seg 
    add constraint UK_8ljssx5akrjpqu6cfe00kw71u  unique (ds_login);
alter table tb_entregador 
    add constraint FK_8bsa2cx8v8j5bu12r7v9hmg9 
    foreign key (co_regiao_atuacao) 
    references tb_regiao_atuacao;
alter table tb_entregador 
    add constraint FK_k6l2ujeq4d7j4ebb3545esyid 
    foreign key (co_pessoa) 
    references tb_pessoa;
alter table tb_pagina_seg 
    add constraint FK_rwuxt1q5al0cn7o3yvhkk9xpv 
    foreign key (co_pagina_pai) 
    references tb_pagina_seg;
alter table tb_permissao_grupo_usuario_seg 
    add constraint FK_e81m6gxwge19907wabe2cx68s 
    foreign key (co_grupo) 
    references tb_grupo_seg;
alter table tb_permissao_grupo_usuario_seg 
    add constraint FK_hw51lbj7gjic6o903edv7tkfe 
    foreign key (co_permissao) 
    references tb_permissao_seg;
alter table tb_permissao_grupo_usuario_seg 
    add constraint FK_a453hfhp3y6fs7i29hv91ng9y 
    foreign key (co_usuario) 
    references tb_usuario_seg;
alter table tb_permissao_seg 
    add constraint FK_d8v751b841dplislxkpnq8r5a 
    foreign key (co_pagina) 
    references tb_pagina_seg;
alter table tb_usuario_grupo_seg 
    add constraint FK_cx1xuldof5hl31nwt0nhoyynt 
    foreign key (co_grupo) 
    references tb_grupo_seg;
alter table tb_usuario_grupo_seg 
    add constraint FK_q9p003tw40ywqussv25i4mnmw 
    foreign key (co_usuario) 
    references tb_usuario_seg;
alter table tb_usuario_seg 
    add constraint FK_le97dvcr91xprrdq0yyghchdw 
    foreign key (co_pagina) 
    references tb_pagina_seg;
alter table tb_usuario_seg 
    add constraint FK_drwqmvpvq7u4j5eetbbadwhab 
    foreign key (co_pessoa) 
    references tb_pessoa;
alter table tb_veiculo 
    add constraint FK_tcqbdchbj9tgcfdrs366bpli0 
    foreign key (co_pessoa) 
    references tb_entregador;
alter table tb_veiculo 
    add constraint FK_24ts2uy9ajnmtgc7hu5crtx43 
    foreign key (co_veiculo_carroceria) 
    references tb_veiculo_carroceria;
alter table tb_veiculo_carroceria 
    add constraint FK_8owafwui0korygk7rxb740p5w 
    foreign key (co_tipo_carroceria) 
    references tb_tipo_carroceria;
alter table tb_veiculo_carroceria 
    add constraint FK_p6mh7x8360fwnxn9o7t75jfb 
    foreign key (co_tipo_veiculo) 
    references tb_tipo_veiculo;
create sequence eu_grupo_seq;
create sequence eu_pagina_seq;
create sequence eu_per_grupo_usuario_seq;
create sequence eu_permissao_seq;
create sequence eu_pessoa_seq;
create sequence eu_regiao_atuacao_seq;
create sequence eu_tipo_carroceria_seq;
create sequence eu_tipo_veiculo_seq;
create sequence eu_usuario_grupo_seq;
create sequence eu_usuario_seq;
create sequence eu_veiculo_carroceria_seq;
create sequence eu_veiculo_seq;