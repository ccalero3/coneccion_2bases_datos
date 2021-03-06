USE [master]
GO
/****** Object:  Database [control_visita]    Script Date: 09/02/2018 16:06:29 ******/
CREATE DATABASE [control_visita]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'control_visita', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MYSQL\MSSQL\DATA\control_visita.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'control_visita_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MYSQL\MSSQL\DATA\control_visita_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [control_visita] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [control_visita].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [control_visita] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [control_visita] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [control_visita] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [control_visita] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [control_visita] SET ARITHABORT OFF 
GO
ALTER DATABASE [control_visita] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [control_visita] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [control_visita] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [control_visita] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [control_visita] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [control_visita] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [control_visita] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [control_visita] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [control_visita] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [control_visita] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [control_visita] SET  DISABLE_BROKER 
GO
ALTER DATABASE [control_visita] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [control_visita] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [control_visita] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [control_visita] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [control_visita] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [control_visita] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [control_visita] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [control_visita] SET RECOVERY FULL 
GO
ALTER DATABASE [control_visita] SET  MULTI_USER 
GO
ALTER DATABASE [control_visita] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [control_visita] SET DB_CHAINING OFF 
GO
ALTER DATABASE [control_visita] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [control_visita] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'control_visita', N'ON'
GO
USE [control_visita]
GO
/****** Object:  Table [dbo].[cat_oficina]    Script Date: 09/02/2018 16:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cat_oficina](
	[c_oficina] [decimal](18, 0) NOT NULL,
	[d_oficina] [nchar](50) NOT NULL,
 CONSTRAINT [PK_cat_oficina] PRIMARY KEY CLUSTERED 
(
	[c_oficina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_cargo]    Script Date: 09/02/2018 16:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_cargo](
	[c_cargo] [decimal](18, 0) NOT NULL,
	[d_cargo] [varchar](50) NULL,
 CONSTRAINT [PK_tc_cargo_1] PRIMARY KEY CLUSTERED 
(
	[c_cargo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_cita]    Script Date: 09/02/2018 16:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cita](
	[id_cita] [decimal](18, 0) NOT NULL,
	[c_visitante] [decimal](18, 0) NULL,
	[c_empleado] [decimal](18, 0) NULL,
	[fecha_cita] [smalldatetime] NULL,
	[hora_cita] [smalldatetime] NULL,
 CONSTRAINT [PK_tb_cita] PRIMARY KEY CLUSTERED 
(
	[id_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_detalle_visita]    Script Date: 09/02/2018 16:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_detalle_visita](
	[c_visitante] [decimal](18, 0) NOT NULL,
	[c_empleado] [decimal](18, 0) NULL,
	[c_tarjeta] [decimal](18, 0) NULL,
	[fecha_vista] [smalldatetime] NULL,
	[hora_inicio] [smalldatetime] NULL,
	[hora_fin] [smalldatetime] NULL,
 CONSTRAINT [PK_tb_detalle_visita] PRIMARY KEY CLUSTERED 
(
	[c_visitante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_empleados]    Script Date: 09/02/2018 16:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_empleados](
	[c_empleado] [decimal](18, 0) NOT NULL,
	[cedula] [varchar](14) NULL,
	[nombre1] [varchar](30) NOT NULL,
	[nombre2] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[apellido2] [varchar](30) NOT NULL,
	[sexo] [nchar](1) NULL,
	[c_cargo] [decimal](18, 0) NULL,
	[c_unidad] [decimal](18, 0) NULL,
	[activo] [nchar](1) NULL,
	[fecha_ingreso] [smalldatetime] NULL,
 CONSTRAINT [PK_tb_empleado] PRIMARY KEY CLUSTERED 
(
	[c_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pase]    Script Date: 09/02/2018 16:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_pase](
	[id_pase] [decimal](18, 0) NOT NULL,
	[status] [nchar](1) NOT NULL,
	[fecha] [smalldatetime] NULL,
 CONSTRAINT [PK_tb_pase] PRIMARY KEY CLUSTERED 
(
	[id_pase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_usuario]    Script Date: 09/02/2018 16:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_usuario](
	[c_usuario] [decimal](18, 0) NOT NULL,
	[nombre] [nchar](15) NULL,
	[password] [nchar](10) NULL,
 CONSTRAINT [PK_tb_usuario] PRIMARY KEY CLUSTERED 
(
	[c_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_visitante]    Script Date: 09/02/2018 16:06:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_visitante](
	[c_visitante] [decimal](18, 0) NOT NULL,
	[cedula] [varchar](14) NULL,
	[nombre1] [varchar](30) NOT NULL,
	[nombre2] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[apellido2] [varchar](30) NOT NULL,
	[sexo] [nchar](1) NULL,
	[foto] [varchar](50) NULL,
	[acceso_permitido] [nchar](1) NULL,
 CONSTRAINT [PK_tb_visitante] PRIMARY KEY CLUSTERED 
(
	[c_visitante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[cat_oficina] ([c_oficina], [d_oficina]) VALUES (CAST(1 AS Decimal(18, 0)), N'Contabilidad                                      ')
INSERT [dbo].[cat_oficina] ([c_oficina], [d_oficina]) VALUES (CAST(2 AS Decimal(18, 0)), N'Serv.Admon                                        ')
INSERT [dbo].[cat_oficina] ([c_oficina], [d_oficina]) VALUES (CAST(3 AS Decimal(18, 0)), N'Direccion de Recursos Humanos                     ')
INSERT [dbo].[cat_oficina] ([c_oficina], [d_oficina]) VALUES (CAST(4 AS Decimal(18, 0)), N'Direccion Financiera                              ')
INSERT [dbo].[cat_oficina] ([c_oficina], [d_oficina]) VALUES (CAST(5 AS Decimal(18, 0)), N'Oficina de Tesoreria                              ')
INSERT [dbo].[cat_oficina] ([c_oficina], [d_oficina]) VALUES (CAST(6 AS Decimal(18, 0)), N'Informatica                                       ')
INSERT [dbo].[tb_cargo] ([c_cargo], [d_cargo]) VALUES (CAST(1 AS Decimal(18, 0)), N'Recepcionista')
INSERT [dbo].[tb_cargo] ([c_cargo], [d_cargo]) VALUES (CAST(2 AS Decimal(18, 0)), N'Encargado de Servicios Auxiliares')
ALTER TABLE [dbo].[tb_cita]  WITH CHECK ADD  CONSTRAINT [FK_tb_cita_tb_empleados] FOREIGN KEY([c_empleado])
REFERENCES [dbo].[tb_empleados] ([c_empleado])
GO
ALTER TABLE [dbo].[tb_cita] CHECK CONSTRAINT [FK_tb_cita_tb_empleados]
GO
ALTER TABLE [dbo].[tb_cita]  WITH CHECK ADD  CONSTRAINT [FK_tb_cita_tb_visitante] FOREIGN KEY([c_visitante])
REFERENCES [dbo].[tb_visitante] ([c_visitante])
GO
ALTER TABLE [dbo].[tb_cita] CHECK CONSTRAINT [FK_tb_cita_tb_visitante]
GO
ALTER TABLE [dbo].[tb_detalle_visita]  WITH CHECK ADD  CONSTRAINT [FK_tb_detalle_visita_tb_empleados] FOREIGN KEY([c_empleado])
REFERENCES [dbo].[tb_empleados] ([c_empleado])
GO
ALTER TABLE [dbo].[tb_detalle_visita] CHECK CONSTRAINT [FK_tb_detalle_visita_tb_empleados]
GO
ALTER TABLE [dbo].[tb_detalle_visita]  WITH CHECK ADD  CONSTRAINT [FK_tb_detalle_visita_tb_visitante] FOREIGN KEY([c_tarjeta])
REFERENCES [dbo].[tb_visitante] ([c_visitante])
GO
ALTER TABLE [dbo].[tb_detalle_visita] CHECK CONSTRAINT [FK_tb_detalle_visita_tb_visitante]
GO
ALTER TABLE [dbo].[tb_empleados]  WITH CHECK ADD  CONSTRAINT [FK_tb_empleados_cat_oficina] FOREIGN KEY([c_unidad])
REFERENCES [dbo].[cat_oficina] ([c_oficina])
GO
ALTER TABLE [dbo].[tb_empleados] CHECK CONSTRAINT [FK_tb_empleados_cat_oficina]
GO
ALTER TABLE [dbo].[tb_empleados]  WITH CHECK ADD  CONSTRAINT [FK_tb_empleados_tb_cargo] FOREIGN KEY([c_cargo])
REFERENCES [dbo].[tb_cargo] ([c_cargo])
GO
ALTER TABLE [dbo].[tb_empleados] CHECK CONSTRAINT [FK_tb_empleados_tb_cargo]
GO
USE [master]
GO
ALTER DATABASE [control_visita] SET  READ_WRITE 
GO
