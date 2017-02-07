--Tabelas auxiliares
insert into tb_regiao_atuacao(co_regiao_atuacao, ds_nome)
	values(nextval('eu_regiao_atuacao_seq'), 'DF');
insert into tb_regiao_atuacao(co_regiao_atuacao, ds_nome)
	values(nextval('eu_regiao_atuacao_seq'), 'DF e entorno');
insert into tb_regiao_atuacao(co_regiao_atuacao, ds_nome)
	values(nextval('eu_regiao_atuacao_seq'), 'Interestadual');

insert into tb_tipo_carroceria(co_tipo_carroceria, ds_descricao)
	values(nextval('eu_tipo_carroceria_seq'), 'Baú');
insert into tb_tipo_carroceria(co_tipo_carroceria, ds_descricao)
	values(nextval('eu_tipo_carroceria_seq'), 'Grade Baixa');
insert into tb_tipo_carroceria(co_tipo_carroceria, ds_descricao)
	values(nextval('eu_tipo_carroceria_seq'), 'Fechada');
insert into tb_tipo_carroceria(co_tipo_carroceria, ds_descricao)
	values(nextval('eu_tipo_carroceria_seq'), 'Baú frigorífico');
insert into tb_tipo_carroceria(co_tipo_carroceria, ds_descricao)
	values(nextval('eu_tipo_carroceria_seq'), 'Sider');
insert into tb_tipo_carroceria(co_tipo_carroceria, ds_descricao)
	values(nextval('eu_tipo_carroceria_seq'), 'Gaiola');
	
insert into tb_tipo_veiculo(co_tipo_veiculo, ds_descricao)
	values(nextval('eu_tipo_veiculo_seq'), 'Caminhonete');
insert into tb_tipo_veiculo(co_tipo_veiculo, ds_descricao)
	values(nextval('eu_tipo_veiculo_seq'), 'Utilitário');
insert into tb_tipo_veiculo(co_tipo_veiculo, ds_descricao)
	values(nextval('eu_tipo_veiculo_seq'), 'VUC/HR');
insert into tb_tipo_veiculo(co_tipo_veiculo, ds_descricao)
	values(nextval('eu_tipo_veiculo_seq'), 'Toco');
insert into tb_tipo_veiculo(co_tipo_veiculo, ds_descricao)
	values(nextval('eu_tipo_veiculo_seq'), '3/4');
insert into tb_tipo_veiculo(co_tipo_veiculo, ds_descricao)
	values(nextval('eu_tipo_veiculo_seq'), 'Furgão');
insert into tb_tipo_veiculo(co_tipo_veiculo, ds_descricao)
	values(nextval('eu_tipo_veiculo_seq'), 'Truck');
insert into tb_tipo_veiculo(co_tipo_veiculo, ds_descricao)
	values(nextval('eu_tipo_veiculo_seq'), 'Bitruck');
	
insert into tb_veiculo_carroceria(co_veiculo_carroceria, co_tipo_veiculo, co_tipo_carroceria)
	values(
		nextval('eu_veiculo_carroceria_seq'),
		(select co_tipo_veiculo from tb_tipo_veiculo where ds_descricao = 'Caminhonete'),
		(select co_tipo_carroceria from tb_tipo_carroceria where ds_descricao = 'Baú')
	);
insert into tb_veiculo_carroceria(co_veiculo_carroceria, co_tipo_veiculo, co_tipo_carroceria)
	values(
		nextval('eu_veiculo_carroceria_seq'),
		(select co_tipo_veiculo from tb_tipo_veiculo where ds_descricao = 'Caminhonete'),
		(select co_tipo_carroceria from tb_tipo_carroceria where ds_descricao = 'Baú frigorífico')
	);	
	
insert into tb_tipo_carroceria(co_tipo_carroceria, ds_descricao)
	values(nextval('eu_tipo_carroceria_seq'), 'Baú');

	
--Permissoes e grupos de acesso
insert into tb_grupo_seg(co_grupo, ds_nome, ds_identificador_unico, ind_administracao)
	values(nextval('eu_grupo_seq'), 'Entregadores', 'ENTREGADORES', true);

insert into tb_permissao_seg(co_permissao, ds_nome, ds_nome_amigavel)
	values(nextval('eu_permissao_seq'), 'ROLE_LEITURA_ENTREGADOR_PAGINA', 'Pode visualizar a página de cadastro de entregador');

insert into tb_permissao_grupo_usuario_seg(co_per_grupo_usuario, co_grupo, co_permissao)
	values(nextval('eu_per_grupo_usuario_seq'), 
		(select co_grupo from tb_grupo_seg where ds_identificador_unico = 'ENTREGADORES'),
		(select co_permissao from tb_permissao_seg where ds_nome = 'ROLE_LEITURA_ENTREGADOR_PAGINA')
	);
	
insert into tb_pessoa(co_pessoa, ds_email, ds_nome, ds_sexo, ds_avatar) 
	values (nextval('eu_pessoa_seq'), '${email}', '${nome}', '${sexo}', '${avatar}');
INSERT INTO tb_usuario_seg(co_usuario, ind_ativo, ind_auto_registro, ind_senha_alterada, ds_login, ds_senha, co_pessoa) 
	VALUES (
		nextval('eu_usuario_seq'), 
		true, 
		false,
		false,
		'${email}', 
		'${senha}',
		(select co_pessoa from tb_pessoa where ds_email = '${email}'));