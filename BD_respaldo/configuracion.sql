USE [configuracion]
GO
/****** Object:  Table [dbo].[tb_tablas]    Script Date: 09/02/2018 16:02:06 ******/
DROP TABLE [dbo].[tb_tablas]
GO
/****** Object:  Table [dbo].[tb_select]    Script Date: 09/02/2018 16:02:06 ******/
DROP TABLE [dbo].[tb_select]
GO
/****** Object:  Table [dbo].[tb_conexion]    Script Date: 09/02/2018 16:02:06 ******/
DROP TABLE [dbo].[tb_conexion]
GO
/****** Object:  Table [dbo].[tb_coneccion]    Script Date: 09/02/2018 16:02:06 ******/
DROP TABLE [dbo].[tb_coneccion]
GO
/****** Object:  Table [dbo].[tb_condicion]    Script Date: 09/02/2018 16:02:06 ******/
DROP TABLE [dbo].[tb_condicion]
GO
/****** Object:  Table [dbo].[tb_campos]    Script Date: 09/02/2018 16:02:06 ******/
DROP TABLE [dbo].[tb_campos]
GO
/****** Object:  Table [dbo].[tb_base_datos]    Script Date: 09/02/2018 16:02:06 ******/
DROP TABLE [dbo].[tb_base_datos]
GO
USE [master]
GO
/****** Object:  Database [configuracion]    Script Date: 09/02/2018 16:02:06 ******/
DROP DATABASE [configuracion]
GO
/****** Object:  Database [configuracion]    Script Date: 09/02/2018 16:02:06 ******/
CREATE DATABASE [configuracion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'configuracion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MYSQL\MSSQL\DATA\configuracion.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'configuracion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MYSQL\MSSQL\DATA\configuracion_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [configuracion] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [configuracion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [configuracion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [configuracion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [configuracion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [configuracion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [configuracion] SET ARITHABORT OFF 
GO
ALTER DATABASE [configuracion] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [configuracion] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [configuracion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [configuracion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [configuracion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [configuracion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [configuracion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [configuracion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [configuracion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [configuracion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [configuracion] SET  DISABLE_BROKER 
GO
ALTER DATABASE [configuracion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [configuracion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [configuracion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [configuracion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [configuracion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [configuracion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [configuracion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [configuracion] SET RECOVERY FULL 
GO
ALTER DATABASE [configuracion] SET  MULTI_USER 
GO
ALTER DATABASE [configuracion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [configuracion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [configuracion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [configuracion] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'configuracion', N'ON'
GO
USE [configuracion]
GO
/****** Object:  Table [dbo].[tb_base_datos]    Script Date: 09/02/2018 16:02:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_base_datos](
	[id_bd] [nchar](10) NOT NULL,
	[name_bd] [nchar](50) NULL,
	[id_coneccion] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_tb_base_datos] PRIMARY KEY CLUSTERED 
(
	[id_bd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_campos]    Script Date: 09/02/2018 16:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_campos](
	[id_campos] [nchar](10) NOT NULL,
	[id_bd] [nchar](10) NULL,
	[id_tabla] [nchar](10) NULL,
	[d_campos] [varchar](80) NULL,
 CONSTRAINT [PK_tb_campos] PRIMARY KEY CLUSTERED 
(
	[id_campos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_condicion]    Script Date: 09/02/2018 16:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_condicion](
	[id_condicion] [nchar](10) NOT NULL,
	[d_condicion] [varchar](50) NOT NULL,
	[id_tabla] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tb_condicion] PRIMARY KEY CLUSTERED 
(
	[id_condicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_coneccion]    Script Date: 09/02/2018 16:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_coneccion](
	[Id_coneccion] [nchar](10) NOT NULL,
	[name_server] [nchar](50) NULL,
	[puerto] [nchar](10) NULL,
	[usuario] [nchar](10) NULL,
	[password] [nchar](10) NULL,
 CONSTRAINT [PK_tb_con] PRIMARY KEY CLUSTERED 
(
	[Id_coneccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_conexion]    Script Date: 09/02/2018 16:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_conexion](
	[Id_coneccion] [nchar](10) NOT NULL,
	[name_server] [nchar](50) NULL,
	[puerto] [nchar](10) NULL,
	[usuario] [nchar](10) NULL,
	[password] [nchar](10) NULL,
 CONSTRAINT [pk_tb_conexion] PRIMARY KEY CLUSTERED 
(
	[Id_coneccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_select]    Script Date: 09/02/2018 16:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_select](
	[id_select] [nchar](10) NOT NULL,
	[d_select] [nchar](40) NULL,
	[Id_tabla] [int] NULL,
 CONSTRAINT [PK_tb_select] PRIMARY KEY CLUSTERED 
(
	[id_select] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_tablas]    Script Date: 09/02/2018 16:02:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_tablas](
	[id_tabla] [nchar](10) NOT NULL,
	[name_tabla] [nchar](20) NULL,
	[id_bd] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tb_tablas] PRIMARY KEY CLUSTERED 
(
	[id_tabla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tb_base_datos] ([id_bd], [name_bd], [id_coneccion]) VALUES (N'1         ', N'control_visita                                    ', CAST(3 AS Decimal(18, 0)))
INSERT [dbo].[tb_campos] ([id_campos], [id_bd], [id_tabla], [d_campos]) VALUES (N'1         ', N'1         ', N'1         ', N'c_oficina,c_oficina')
INSERT [dbo].[tb_condicion] ([id_condicion], [d_condicion], [id_tabla]) VALUES (N'1         ', N'c_oficina=6', N'1         ')
INSERT [dbo].[tb_coneccion] ([Id_coneccion], [name_server], [puerto], [usuario], [password]) VALUES (N'1         ', N'SAMSUNG-PC                                        ', N'1433      ', N'dbo       ', N'1234      ')
INSERT [dbo].[tb_coneccion] ([Id_coneccion], [name_server], [puerto], [usuario], [password]) VALUES (N'3         ', N'CCG-RRHH-2012\MYSQL                               ', N'1433      ', N'dbo       ', N'1234      ')
INSERT [dbo].[tb_tablas] ([id_tabla], [name_tabla], [id_bd]) VALUES (N'1         ', N'cat_oficina         ', N'1         ')
USE [master]
GO
ALTER DATABASE [configuracion] SET  READ_WRITE 
GO
