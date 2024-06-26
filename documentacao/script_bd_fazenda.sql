USE [bd_fazenda_urbana_pim]
GO
/****** Object:  Table [dbo].[tbl_admin_fazenda]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin_fazenda](
	[id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[nome_fazenda] [varchar](50) NOT NULL,
	[cep] [char](8) NOT NULL,
	[num_rua] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_clientes]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_clientes](
	[id] [int] NOT NULL,
	[nome] [varchar](30) NOT NULL,
	[cpf] [char](11) NOT NULL,
	[cep] [char](8) NOT NULL,
	[num_rua] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_contatos]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_contatos](
	[id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[cliente_id] [int] NOT NULL,
	[telefone] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_departamentos]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_departamentos](
	[id] [int] NOT NULL,
	[admin_fazenda_id] [int] NOT NULL,
	[nome_depto] [varchar](20) NOT NULL,
	[qtd_funcionario] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_fornecedores]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_fornecedores](
	[id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[razao_social] [varchar](50) NOT NULL,
	[cnpj] [char](14) NOT NULL,
	[uf] [char](2) NOT NULL,
	[status] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_funcionarios]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_funcionarios](
	[id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[depto_id] [int] NOT NULL,
	[funcao] [varchar](50) NOT NULL,
	[status] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_itens_pedido]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_itens_pedido](
	[id] [int] NOT NULL,
	[pedido_id] [int] NOT NULL,
	[produto_id] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[data_saida] [date] NOT NULL,
	[motivo] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pedidos]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pedidos](
	[id] [int] NOT NULL,
	[cep] [char](8) NOT NULL,
	[data_pedido] [date] NOT NULL,
	[data_entrega] [date] NOT NULL,
	[status] [varchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_produtos]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_produtos](
	[id] [int] NOT NULL,
	[pedido_id] [int] NOT NULL,
	[fornecedor_id] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[descricao] [text] NOT NULL,
	[peso] [float] NOT NULL,
	[preco] [float] NOT NULL,
	[qtd] [int] NOT NULL,
	[estoque_status] [varchar](15) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_relatorios]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_relatorios](
	[id] [int] NOT NULL,
	[funcionario_id] [int] NOT NULL,
	[produto_id] [int] NOT NULL,
	[descricao] [text] NOT NULL,
	[data_criacao] [date] NOT NULL,
	[qtd_produto] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_usuarios]    Script Date: 07/06/2024 00:45:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usuarios](
	[id] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[senha] [text] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_fornecedores] ADD  CONSTRAINT [DF_tbl_fornecedores_status]  DEFAULT ('ativo') FOR [status]
GO
ALTER TABLE [dbo].[tbl_funcionarios] ADD  CONSTRAINT [DF_tbl_funcionarios_status]  DEFAULT ('ativo') FOR [status]
GO
ALTER TABLE [dbo].[tbl_pedidos] ADD  CONSTRAINT [DF_tbl_pedidos_status]  DEFAULT ('em separação') FOR [status]
GO
ALTER TABLE [dbo].[tbl_produtos] ADD  CONSTRAINT [DF_tbl_produtos_estoque_status]  DEFAULT ('sem estoque') FOR [estoque_status]
GO
