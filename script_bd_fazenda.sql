USE [master]
GO
/****** Object:  Database [bd_fazenda_urbana]    Script Date: 08/05/2024 16:41:17 ******/
CREATE DATABASE [bd_fazenda_urbana]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bd_fazenda_urbana', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\bd_fazenda_urbana.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bd_fazenda_urbana_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\bd_fazenda_urbana_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [bd_fazenda_urbana] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bd_fazenda_urbana].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bd_fazenda_urbana] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET ARITHABORT OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bd_fazenda_urbana] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bd_fazenda_urbana] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bd_fazenda_urbana] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bd_fazenda_urbana] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bd_fazenda_urbana] SET  MULTI_USER 
GO
ALTER DATABASE [bd_fazenda_urbana] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bd_fazenda_urbana] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bd_fazenda_urbana] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bd_fazenda_urbana] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bd_fazenda_urbana] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bd_fazenda_urbana] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bd_fazenda_urbana] SET QUERY_STORE = ON
GO
ALTER DATABASE [bd_fazenda_urbana] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [bd_fazenda_urbana]
GO
/****** Object:  Table [dbo].[tbl_admin_fazenda]    Script Date: 08/05/2024 16:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_admin_fazenda](
	[id] [int] NOT NULL,
	[nome_fazenda] [varchar](50) NOT NULL,
	[cep] [char](8) NOT NULL,
	[num_rua] [int] NOT NULL,
 CONSTRAINT [PK_tbl_admin_fazenda] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_contatos]    Script Date: 08/05/2024 16:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_contatos](
	[id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[telefone] [text] NOT NULL,
 CONSTRAINT [PK_tbl_contatos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_departamentos]    Script Date: 08/05/2024 16:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_departamentos](
	[id] [int] NOT NULL,
	[admin_id] [int] NOT NULL,
	[nome_depto] [varchar](20) NOT NULL,
	[qtd_funcionario] [int] NOT NULL,
 CONSTRAINT [PK_tbl_departamentos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_fornecedores]    Script Date: 08/05/2024 16:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_fornecedores](
	[id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[admin_fazenda_id] [int] NOT NULL,
	[razao_social] [varchar](50) NOT NULL,
	[cnpj] [char](14) NOT NULL,
	[uf] [char](2) NOT NULL,
	[status] [varchar](15) NOT NULL,
 CONSTRAINT [PK_tbl_fornecedores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_funcionarios]    Script Date: 08/05/2024 16:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_funcionarios](
	[id] [int] NOT NULL,
	[usuario_id] [int] NOT NULL,
	[depto_id] [int] NOT NULL,
	[funcao] [varchar](50) NOT NULL,
	[status] [text] NOT NULL,
 CONSTRAINT [PK_tbl_funcionarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_pedidos]    Script Date: 08/05/2024 16:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pedidos](
	[id] [int] NOT NULL,
	[cep] [char](8) NOT NULL,
	[data_pedido] [date] NOT NULL,
	[data_entrega] [date] NOT NULL,
	[qtd] [int] NOT NULL,
	[status] [varchar](15) NULL,
 CONSTRAINT [PK_tbl_pedidos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_produtos]    Script Date: 08/05/2024 16:41:17 ******/
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
	[estoque_status] [varchar](15) NOT NULL,
 CONSTRAINT [PK_tbl_produtos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_relatorios]    Script Date: 08/05/2024 16:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_relatorios](
	[id] [int] NOT NULL,
	[funcionario_id] [int] NOT NULL,
	[data_criacao] [date] NOT NULL,
	[estoque_produto] [int] NOT NULL,
 CONSTRAINT [PK_tbl_relatorios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_saida_produto]    Script Date: 08/05/2024 16:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_saida_produto](
	[id] [int] NOT NULL,
	[produto_id] [int] NOT NULL,
	[data_saida] [date] NOT NULL,
	[motivo] [text] NULL,
	[qtd] [int] NOT NULL,
 CONSTRAINT [PK_tbl_saida_produto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_usuarios]    Script Date: 08/05/2024 16:41:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_usuarios](
	[id] [int] NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[senha] [text] NOT NULL,
 CONSTRAINT [PK_tbl_usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_fornecedores] ADD  CONSTRAINT [DF_tbl_fornecedores_status]  DEFAULT ('ativo') FOR [status]
GO
ALTER TABLE [dbo].[tbl_funcionarios] ADD  CONSTRAINT [DF_tbl_funcionarios_status]  DEFAULT ('ativo') FOR [status]
GO
ALTER TABLE [dbo].[tbl_pedidos] ADD  CONSTRAINT [DF_tbl_pedidos_status]  DEFAULT ('em separação') FOR [status]
GO
ALTER TABLE [dbo].[tbl_produtos] ADD  CONSTRAINT [DF_tbl_produtos_qtd]  DEFAULT ((0)) FOR [qtd]
GO
ALTER TABLE [dbo].[tbl_produtos] ADD  CONSTRAINT [DF_tbl_produtos_estoque_status]  DEFAULT ('sem estoque') FOR [estoque_status]
GO
ALTER TABLE [dbo].[tbl_contatos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_contatos_tbl_usuarios] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[tbl_usuarios] ([id])
GO
ALTER TABLE [dbo].[tbl_contatos] CHECK CONSTRAINT [FK_tbl_contatos_tbl_usuarios]
GO
ALTER TABLE [dbo].[tbl_departamentos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_departamentos_tbl_admin_fazenda] FOREIGN KEY([admin_id])
REFERENCES [dbo].[tbl_admin_fazenda] ([id])
GO
ALTER TABLE [dbo].[tbl_departamentos] CHECK CONSTRAINT [FK_tbl_departamentos_tbl_admin_fazenda]
GO
ALTER TABLE [dbo].[tbl_fornecedores]  WITH CHECK ADD  CONSTRAINT [FK_tbl_fornecedores_tbl_usuarios] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[tbl_usuarios] ([id])
GO
ALTER TABLE [dbo].[tbl_fornecedores] CHECK CONSTRAINT [FK_tbl_fornecedores_tbl_usuarios]
GO
ALTER TABLE [dbo].[tbl_funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_funcionarios_tbl_departamentos] FOREIGN KEY([depto_id])
REFERENCES [dbo].[tbl_departamentos] ([id])
GO
ALTER TABLE [dbo].[tbl_funcionarios] CHECK CONSTRAINT [FK_tbl_funcionarios_tbl_departamentos]
GO
ALTER TABLE [dbo].[tbl_funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_funcionarios_tbl_usuarios] FOREIGN KEY([usuario_id])
REFERENCES [dbo].[tbl_usuarios] ([id])
GO
ALTER TABLE [dbo].[tbl_funcionarios] CHECK CONSTRAINT [FK_tbl_funcionarios_tbl_usuarios]
GO
ALTER TABLE [dbo].[tbl_produtos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_produtos_tbl_fornecedores] FOREIGN KEY([fornecedor_id])
REFERENCES [dbo].[tbl_fornecedores] ([id])
GO
ALTER TABLE [dbo].[tbl_produtos] CHECK CONSTRAINT [FK_tbl_produtos_tbl_fornecedores]
GO
ALTER TABLE [dbo].[tbl_produtos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_produtos_tbl_pedidos] FOREIGN KEY([pedido_id])
REFERENCES [dbo].[tbl_pedidos] ([id])
GO
ALTER TABLE [dbo].[tbl_produtos] CHECK CONSTRAINT [FK_tbl_produtos_tbl_pedidos]
GO
ALTER TABLE [dbo].[tbl_relatorios]  WITH CHECK ADD  CONSTRAINT [FK_tbl_relatorios_tbl_funcionarios] FOREIGN KEY([funcionario_id])
REFERENCES [dbo].[tbl_funcionarios] ([id])
GO
ALTER TABLE [dbo].[tbl_relatorios] CHECK CONSTRAINT [FK_tbl_relatorios_tbl_funcionarios]
GO
ALTER TABLE [dbo].[tbl_saida_produto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_saida_produto_tbl_produtos] FOREIGN KEY([produto_id])
REFERENCES [dbo].[tbl_produtos] ([id])
GO
ALTER TABLE [dbo].[tbl_saida_produto] CHECK CONSTRAINT [FK_tbl_saida_produto_tbl_produtos]
GO
USE [master]
GO
ALTER DATABASE [bd_fazenda_urbana] SET  READ_WRITE 
GO
