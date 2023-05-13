USE [master]
GO
/****** Object:  Database [Ap3]    Script Date: 5/9/2023 8:25:40 PM ******/
CREATE DATABASE [Ap3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ap3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Ap3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Ap3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Ap3_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ap3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ap3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ap3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ap3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ap3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ap3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ap3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ap3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ap3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ap3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ap3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ap3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ap3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ap3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ap3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ap3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ap3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ap3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ap3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ap3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ap3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ap3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ap3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ap3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ap3] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ap3] SET  MULTI_USER 
GO
ALTER DATABASE [Ap3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ap3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ap3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ap3] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ap3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ap3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ap3', N'ON'
GO
ALTER DATABASE [Ap3] SET QUERY_STORE = OFF
GO
USE [Ap3]
GO
/****** Object:  Table [dbo].[Adherent_]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adherent_](
	[idAdherent] [int] IDENTITY(1,1) NOT NULL,
	[nomAdherent] [varchar](50) NULL,
	[prenomAdherent] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[identifiant] [varchar](50) NULL,
	[mot_de_passe] [varchar](max) NULL,
	[idTarif] [int] NULL,
	[dateAdhesion] [date] NULL,
	[nb_evenement] [int] NULL,
 CONSTRAINT [PK__Adherent__7FD6B6C3F42CC603] PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CalendrierEntrainement]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalendrierEntrainement](
	[idCalendrier] [int] IDENTITY(1,1) NOT NULL,
	[dateCalendrier] [date] NULL,
	[heureCalendrier] [time](7) NULL,
	[idCategorie] [int] NOT NULL,
	[seance] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCalendrier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorie]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorie](
	[idCategorie] [int] IDENTITY(1,1) NOT NULL,
	[nomCategorie] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategorie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntrainementsJoueurs]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntrainementsJoueurs](
	[idCalendrier] [int] NOT NULL,
	[idAdherent] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_EntrainementsJoueurs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entraineur]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entraineur](
	[idAdherent] [int] NOT NULL,
	[formation] [varchar](50) NULL,
	[tauxHorraire] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evenement_]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evenement_](
	[idEvenement_] [int] IDENTITY(1,1) NOT NULL,
	[nomEvenement] [varchar](50) NULL,
	[dateEvenement] [date] NULL,
	[resultat] [varchar](50) NULL,
	[idAdherent] [int] NOT NULL,
	[idCategorie] [int] NOT NULL,
	[idLieu] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEvenement_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoAdherent]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoAdherent](
	[idHisto] [int] IDENTITY(1,1) NOT NULL,
	[dateHisto] [date] NULL,
	[nom] [varchar](50) NULL,
	[prenom] [varchar](50) NULL,
	[Age] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[identifiant] [varchar](50) NULL,
	[mdp] [varchar](255) NULL,
	[dateAdhesion] [date] NULL,
	[nb_evenemnt] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Joueur]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Joueur](
	[idAdherent] [int] NOT NULL,
	[numero] [varchar](50) NULL,
	[poste] [varchar](50) NULL,
	[idCategorie] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lieu]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lieu](
	[idLieu] [int] IDENTITY(1,1) NOT NULL,
	[nomLieu] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdreDuJour]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdreDuJour](
	[idRéunion] [int] NOT NULL,
	[idOrdre] [int] NOT NULL,
	[nomOrdre] [varchar](50) NULL,
 CONSTRAINT [PK__OrdreDuJ__3F57F7CDA5EDCD56] PRIMARY KEY CLUSTERED 
(
	[idRéunion] ASC,
	[idOrdre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organiser]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organiser](
	[idCalendrier] [int] NOT NULL,
	[idAdherent] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idCalendrier] ASC,
	[idAdherent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participer]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participer](
	[idAdherent] [int] NOT NULL,
	[idCalendrier] [int] NOT NULL,
	[travailRealisé] [varchar](50) NULL,
	[absence] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC,
	[idCalendrier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plannifier]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plannifier](
	[idAdherent] [int] NOT NULL,
	[idRéunion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC,
	[idRéunion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Remplace]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Remplace](
	[idAdherent] [int] NOT NULL,
	[idAdherent_1] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC,
	[idAdherent_1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserver]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserver](
	[idAdherent] [int] NOT NULL,
	[idEvenement_] [int] NOT NULL,
	[dateReservation] [date] NULL,
	[placeReservation] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAdherent] ASC,
	[idEvenement_] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Réunions]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Réunions](
	[idRéunion] [int] IDENTITY(1,1) NOT NULL,
	[objet] [varchar](50) NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRéunion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarifs]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarifs](
	[idTarif] [int] IDENTITY(1,1) NOT NULL,
	[nomTarif] [varchar](50) NULL,
	[prixTarif] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTarif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Adherent_] ADD  CONSTRAINT [DF_Adherent__nb_evenement]  DEFAULT ((0)) FOR [nb_evenement]
GO
ALTER TABLE [dbo].[Adherent_]  WITH CHECK ADD  CONSTRAINT [FK__Adherent___idTar__31EC6D26] FOREIGN KEY([idTarif])
REFERENCES [dbo].[Tarifs] ([idTarif])
GO
ALTER TABLE [dbo].[Adherent_] CHECK CONSTRAINT [FK__Adherent___idTar__31EC6D26]
GO
ALTER TABLE [dbo].[CalendrierEntrainement]  WITH CHECK ADD FOREIGN KEY([idCategorie])
REFERENCES [dbo].[Categorie] ([idCategorie])
GO
ALTER TABLE [dbo].[EntrainementsJoueurs]  WITH CHECK ADD  CONSTRAINT [FK_EntrainementsJoueurs_CalendrierEntrainement] FOREIGN KEY([idCalendrier])
REFERENCES [dbo].[CalendrierEntrainement] ([idCalendrier])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EntrainementsJoueurs] CHECK CONSTRAINT [FK_EntrainementsJoueurs_CalendrierEntrainement]
GO
ALTER TABLE [dbo].[EntrainementsJoueurs]  WITH CHECK ADD  CONSTRAINT [FK_EntrainementsJoueurs_Joueur] FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Joueur] ([idAdherent])
GO
ALTER TABLE [dbo].[EntrainementsJoueurs] CHECK CONSTRAINT [FK_EntrainementsJoueurs_Joueur]
GO
ALTER TABLE [dbo].[Entraineur]  WITH CHECK ADD  CONSTRAINT [FK__Entraineu__idAdh__38996AB5] FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Adherent_] ([idAdherent])
GO
ALTER TABLE [dbo].[Entraineur] CHECK CONSTRAINT [FK__Entraineu__idAdh__38996AB5]
GO
ALTER TABLE [dbo].[Evenement_]  WITH CHECK ADD FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Entraineur] ([idAdherent])
GO
ALTER TABLE [dbo].[Evenement_]  WITH CHECK ADD FOREIGN KEY([idCategorie])
REFERENCES [dbo].[Categorie] ([idCategorie])
GO
ALTER TABLE [dbo].[Evenement_]  WITH CHECK ADD FOREIGN KEY([idLieu])
REFERENCES [dbo].[Lieu] ([idLieu])
GO
ALTER TABLE [dbo].[Joueur]  WITH CHECK ADD  CONSTRAINT [FK__Joueur__idAdhere__34C8D9D1] FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Adherent_] ([idAdherent])
GO
ALTER TABLE [dbo].[Joueur] CHECK CONSTRAINT [FK__Joueur__idAdhere__34C8D9D1]
GO
ALTER TABLE [dbo].[Joueur]  WITH CHECK ADD FOREIGN KEY([idCategorie])
REFERENCES [dbo].[Categorie] ([idCategorie])
GO
ALTER TABLE [dbo].[OrdreDuJour]  WITH CHECK ADD  CONSTRAINT [FK__OrdreDuJo__idRéu__2F10007B] FOREIGN KEY([idRéunion])
REFERENCES [dbo].[Réunions] ([idRéunion])
GO
ALTER TABLE [dbo].[OrdreDuJour] CHECK CONSTRAINT [FK__OrdreDuJo__idRéu__2F10007B]
GO
ALTER TABLE [dbo].[Organiser]  WITH CHECK ADD FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Entraineur] ([idAdherent])
GO
ALTER TABLE [dbo].[Organiser]  WITH CHECK ADD FOREIGN KEY([idCalendrier])
REFERENCES [dbo].[CalendrierEntrainement] ([idCalendrier])
GO
ALTER TABLE [dbo].[Participer]  WITH CHECK ADD  CONSTRAINT [FK__Participe__idAdh__403A8C7D] FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Adherent_] ([idAdherent])
GO
ALTER TABLE [dbo].[Participer] CHECK CONSTRAINT [FK__Participe__idAdh__403A8C7D]
GO
ALTER TABLE [dbo].[Participer]  WITH CHECK ADD  CONSTRAINT [FK__Participe__idCal__412EB0B6] FOREIGN KEY([idCalendrier])
REFERENCES [dbo].[CalendrierEntrainement] ([idCalendrier])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Participer] CHECK CONSTRAINT [FK__Participe__idCal__412EB0B6]
GO
ALTER TABLE [dbo].[Plannifier]  WITH CHECK ADD FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Entraineur] ([idAdherent])
GO
ALTER TABLE [dbo].[Plannifier]  WITH CHECK ADD FOREIGN KEY([idRéunion])
REFERENCES [dbo].[Réunions] ([idRéunion])
GO
ALTER TABLE [dbo].[Remplace]  WITH CHECK ADD FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Entraineur] ([idAdherent])
GO
ALTER TABLE [dbo].[Remplace]  WITH CHECK ADD FOREIGN KEY([idAdherent_1])
REFERENCES [dbo].[Entraineur] ([idAdherent])
GO
ALTER TABLE [dbo].[Reserver]  WITH CHECK ADD  CONSTRAINT [FK__Reserver__idAdhe__440B1D61] FOREIGN KEY([idAdherent])
REFERENCES [dbo].[Adherent_] ([idAdherent])
GO
ALTER TABLE [dbo].[Reserver] CHECK CONSTRAINT [FK__Reserver__idAdhe__440B1D61]
GO
ALTER TABLE [dbo].[Reserver]  WITH CHECK ADD  CONSTRAINT [FK__Reserver__idEven__44FF419A] FOREIGN KEY([idEvenement_])
REFERENCES [dbo].[Evenement_] ([idEvenement_])
GO
ALTER TABLE [dbo].[Reserver] CHECK CONSTRAINT [FK__Reserver__idEven__44FF419A]
GO
/****** Object:  StoredProcedure [dbo].[AdhesionRenouvele]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[AdhesionRenouvele] 
AS
BEGIN
    -- Insert statements for procedure here
	SELECT dateAdhesion
	FROM Adherent_ 
	WHERE YEAR(dateAdhesion) = '2022'; 
END
GO
/****** Object:  StoredProcedure [dbo].[EvenementAdherent]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[EvenementAdherent] @nomAdh varchar(50)
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SELECT nomAdherent, prenomAdherent, absence, travailRealisé, C.idCalendrier
	FROM Adherent_ A, Participer P, CalendrierEntrainement C
	WHERE A.idAdherent = P.idAdherent 
	AND C.idCalendrier = p.idCalendrier 
	AND nomAdherent = @nomAdh;

    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [dbo].[HeureEntrainement]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HeureEntrainement]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	SELECT nomAdherent, prenomAdherent, count(*)*2
FROM Adherent_ A, Participer P, CalendrierEntrainement C
WHERE A.idAdherent = P.idAdherent and C.idCalendrier = p.idCalendrier
group by nomAdherent, prenomAdherent
END


       
    
GO
/****** Object:  StoredProcedure [dbo].[NbEntrainement]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[NbEntrainement]	@nomAdh varchar(50), @dateDeb date, @dateFin date
AS
BEGIN
	select nomAdherent, count(C.idCalendrier) as Entrainements
	from Adherent_ A, Participer P, CalendrierEntrainement C
	WHERE A.idAdherent = P.idAdherent and C.idCalendrier = p.idCalendrier
	and C.dateCalendrier between @dateDeb and @dateFin
	and nomAdherent = @nomAdh
	group by nomAdherent
END
GO
/****** Object:  StoredProcedure [dbo].[OrdreReunion]    Script Date: 5/9/2023 8:25:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[OrdreReunion] @dateReu date 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	

    -- Insert statements for procedure here
	select nomOrdre, objet, R.date
From OrdreDuJour O, Réunions R
Where R.idRéunion = O.idRéunion and R.date = @dateReu
END
GO
USE [master]
GO
ALTER DATABASE [Ap3] SET  READ_WRITE 
GO
