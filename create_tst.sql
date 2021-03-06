USE [tst]
GO
/****** Object:  Table [dbo].[grupa]    Script Date: 25.10.2016 17:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grupa](
	[id] [int] NOT NULL,
	[nazwa] [varchar](50) NOT NULL,
 CONSTRAINT [PK_grupa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[przedmiot]    Script Date: 25.10.2016 17:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[przedmiot](
	[id] [int] NOT NULL,
	[nazwa] [varchar](50) NOT NULL,
	[sylabus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_przedmiot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sala]    Script Date: 25.10.2016 17:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sala](
	[id] [int] NOT NULL,
	[numer] [varchar](3) NOT NULL,
	[budynek] [varchar](2) NOT NULL,
 CONSTRAINT [PK_sala] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[student]    Script Date: 25.10.2016 17:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] NOT NULL,
	[imie] [varchar](50) NOT NULL,
	[nazwisko] [varchar](50) NOT NULL,
	[grupa_id] [int] NOT NULL,
 CONSTRAINT [PK_student] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[terminy]    Script Date: 25.10.2016 17:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[terminy](
	[id] [int] NOT NULL,
	[godzina] [varchar](50) NOT NULL,
	[dzeń] [varchar](50) NOT NULL,
	[grupa_id] [int] NOT NULL,
	[przedmiot_id] [int] NOT NULL,
	[wykładowca_id] [int] NOT NULL,
	[sala_id] [int] NOT NULL,
 CONSTRAINT [PK_terminy] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[wykładowca]    Script Date: 25.10.2016 17:54:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[wykładowca](
	[id] [int] NOT NULL,
	[imie] [varchar](50) NOT NULL,
	[nazwisko] [varbinary](50) NOT NULL,
	[tytuł] [varchar](50) NOT NULL,
 CONSTRAINT [PK_wykładowca] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[grupa] ([id], [nazwa]) VALUES (1, N'Test')
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK_student_student] FOREIGN KEY([grupa_id])
REFERENCES [dbo].[grupa] ([id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK_student_student]
GO
ALTER TABLE [dbo].[terminy]  WITH CHECK ADD  CONSTRAINT [FK_terminy_grupa] FOREIGN KEY([grupa_id])
REFERENCES [dbo].[grupa] ([id])
GO
ALTER TABLE [dbo].[terminy] CHECK CONSTRAINT [FK_terminy_grupa]
GO
ALTER TABLE [dbo].[terminy]  WITH CHECK ADD  CONSTRAINT [FK_terminy_przedmiot] FOREIGN KEY([przedmiot_id])
REFERENCES [dbo].[przedmiot] ([id])
GO
ALTER TABLE [dbo].[terminy] CHECK CONSTRAINT [FK_terminy_przedmiot]
GO
ALTER TABLE [dbo].[terminy]  WITH CHECK ADD  CONSTRAINT [FK_terminy_sala] FOREIGN KEY([sala_id])
REFERENCES [dbo].[sala] ([id])
GO
ALTER TABLE [dbo].[terminy] CHECK CONSTRAINT [FK_terminy_sala]
GO
ALTER TABLE [dbo].[terminy]  WITH CHECK ADD  CONSTRAINT [FK_terminy_wykładowca] FOREIGN KEY([id])
REFERENCES [dbo].[wykładowca] ([id])
GO
ALTER TABLE [dbo].[terminy] CHECK CONSTRAINT [FK_terminy_wykładowca]
GO
