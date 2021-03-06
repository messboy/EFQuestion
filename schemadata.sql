USE [Test]
GO
/****** Object:  User [OI-PC\OI]    Script Date: 11/09/2015 22:42:24 ******/
CREATE USER [OI-PC\OI] FOR LOGIN [OI-PC\OI] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [oi]    Script Date: 11/09/2015 22:42:24 ******/
CREATE USER [oi] FOR LOGIN [oi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 11/09/2015 22:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [char](36) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Article] ([ArticleID], [Name]) VALUES (N'bbbd02fd-8004-4808-ab4f-9d60f2f71eb1', N'文章2')
INSERT [dbo].[Article] ([ArticleID], [Name]) VALUES (N'd8715582-b8bd-4524-aa65-b815a7a0c13e', N'文章1')
/****** Object:  Table [dbo].[Category]    Script Date: 11/09/2015 22:42:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [char](36) NOT NULL,
	[ArticleID] [char](36) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Category] ([CategoryID], [ArticleID], [CategoryName]) VALUES (N'7cf1800f-0042-439d-9c3e-482f40d96e81', N'd8715582-b8bd-4524-aa65-b815a7a0c13e', N'類別3')
INSERT [dbo].[Category] ([CategoryID], [ArticleID], [CategoryName]) VALUES (N'a2f94cbc-0cd4-444c-acbf-0093b96f5139', N'd8715582-b8bd-4524-aa65-b815a7a0c13e', N'類別1')
INSERT [dbo].[Category] ([CategoryID], [ArticleID], [CategoryName]) VALUES (N'b6eea399-19f1-45d6-a860-ce2f102599a7', N'd8715582-b8bd-4524-aa65-b815a7a0c13e', N'類別2')
/****** Object:  Default [DF_Article_ArticleID]    Script Date: 11/09/2015 22:42:25 ******/
ALTER TABLE [dbo].[Article] ADD  CONSTRAINT [DF_Article_ArticleID]  DEFAULT (lower(newid())) FOR [ArticleID]
GO
/****** Object:  Default [DF_Category_CategoryID]    Script Date: 11/09/2015 22:42:25 ******/
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_CategoryID]  DEFAULT (lower(newid())) FOR [CategoryID]
GO
/****** Object:  ForeignKey [FK_Category_Article]    Script Date: 11/09/2015 22:42:25 ******/
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Article] FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Article]
GO
