USE [UltimateTeam]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 5/10/2025 4:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[id] [varchar](50) NOT NULL,
	[userId] [uniqueidentifier] NULL,
	[packId] [uniqueidentifier] NULL,
	[playerId] [varchar](500) NULL,
	[tier] [int] NULL,
	[cardImage] [varchar](5000) NULL,
 CONSTRAINT [PK__Cards__3213E83FE72C2A09] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packs]    Script Date: 5/10/2025 4:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packs](
	[id] [uniqueidentifier] NOT NULL,
	[packName] [varchar](100) NOT NULL,
	[packType] [int] NULL,
	[packImage] [varchar](5000) NULL,
	[status] [bit] NULL,
	[userId] [uniqueidentifier] NULL,
 CONSTRAINT [PK__Packs__3213E83F1E5A9EC4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 5/10/2025 4:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[id] [varchar](500) NOT NULL,
	[teamId] [varchar](50) NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
	[playerImage] [varchar](5000) NULL,
	[age] [varchar](50) NULL,
	[height] [varchar](100) NULL,
	[weight] [varchar](100) NULL,
	[yearsPro] [varchar](50) NULL,
	[playerApiId] [varchar](50) NULL,
	[cardId] [varchar](50) NULL,
	[position] [varchar](50) NULL,
 CONSTRAINT [PK__Players__3213E83FB88F3C9D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stats]    Script Date: 5/10/2025 4:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stats](
	[id] [uniqueidentifier] NOT NULL,
	[playerId] [varchar](500) NOT NULL,
	[PPG] [varchar](100) NULL,
	[APG] [varchar](100) NULL,
	[RPG] [varchar](100) NULL,
	[BPG] [varchar](100) NULL,
	[SPG] [varchar](100) NULL,
	[MPG] [varchar](100) NULL,
	[gamesPlayed] [varchar](100) NULL,
	[statApiId] [varchar](500) NULL,
 CONSTRAINT [PK__Stats__3213E83F3216221B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 5/10/2025 4:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[id] [varchar](50) NOT NULL,
	[teamName] [varchar](50) NULL,
	[conference] [varchar](50) NULL,
	[teamApiId] [varchar](50) NULL,
	[teamLogo] [varchar](5000) NULL,
	[city] [varchar](50) NULL,
	[conferenceType] [int] NULL,
 CONSTRAINT [PK__Teams__3213E83FCB050A0A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/10/2025 4:22:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [uniqueidentifier] NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[customerEmail] [varchar](100) NOT NULL,
	[customerCreation] [datetime] NULL,
	[status] [bit] NULL,
	[googleId] [varchar](100) NULL,
 CONSTRAINT [PK__Users__3213E83F478C48B6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'05FF182F-46C2-4430-ABB8-5E153A7DF6AA', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'cd171356-f0af-46a9-aafa-8fc68320c895', N'BFFC403A-A1E3-4332-A2B4-3388647C7C1D', 4, N'https://preview.redd.it/mokmq0lob7x41.png?auto=webp&s=1d9195248ce1c7adc26a8ca4b80f086e2badf972')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'16069528-3F48-497F-8A48-9992D9C8645B', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'cd171356-f0af-46a9-aafa-8fc68320c895', N'26AC657C-193A-4D09-8567-A3DC5F63309C', 3, N'https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/kyrie-irving-gilang-bogy.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'2F633D12-DC68-4CEA-8F9D-125E5C7FF393', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'cd171356-f0af-46a9-aafa-8fc68320c895', N'67138564-0E55-4676-B04E-5E3220166F33', 4, N'https://pbs.twimg.com/media/E709v_iUUAM4CgN.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'37EAE0DF-803F-456E-921B-B67643ADE1EB', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'cd171356-f0af-46a9-aafa-8fc68320c895', N'91261FBB-2DD0-4681-8282-8A3A4C9FE2DF', 4, N'https://pbs.twimg.com/media/E5GLAhxVkAQ8svw.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'A89295FB-9940-48C8-8CEB-9F8491B70B1D', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'cd171356-f0af-46a9-aafa-8fc68320c895', N'3C77C75A-6CD7-47ED-A9E9-55E66AF71FF8', 3, N'https://i.pinimg.com/originals/cc/25/4c/cc254cbbd2b05a2fbce43ca80826d0d2.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'DAC5F295-D553-4B17-81AB-03E9CB7242BC', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'aa9ba564-5c6b-4a88-a748-a1797ebf945f', N'4F461BFB-9268-4045-A16D-BF1E9FF8D841', 3, N'https://i.pinimg.com/736x/57/2c/b8/572cb86bfb627415e707315efeb4e6a8.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'DB7926F7-AB98-4538-A40E-A6949F1AD420', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'250b8997-3bf3-428b-ac8a-3bcdae614e11', N'482F23AA-F3A3-4B39-A466-D7A65F160EC7', 4, N'https://fanatics.frgimages.com/FFImage/thumb.aspx?i=/productimages/_4582000/ff_4582000-342556643454c1a5fa59_full.jpg&w=600')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'DBFBC406-A832-402B-95A7-4A496E7BE025', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'b0e90c28-f6f8-480f-a29c-6bfca3a1ada5', N'8CBB14E6-8454-47BB-8B45-9FF03E6E1FFE', 4, N'https://i.redd.it/e58hba7bqzs61.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'DC1CE142-AFEA-4A64-865C-8C8FAF365F6D', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'49507fa4-388d-4db6-97a0-75ea9f355e08', N'5D8D1705-BB98-4219-92FB-CB14E69BD062', 1, N'https://w0.peakpx.com/wallpaper/393/219/HD-wallpaper-marcus-smart-2020-boston-celtics-nba-basketball-green-neon-lights-marcus-osmond-smart-usa-marcus-smart-boston-celtics-creative-marcus-smart.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'DC31E424-FF82-4ABC-8488-A0F0ABEBE2A0', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'eab06987-55c1-4fd2-81e4-650709a4b007', N'56', 1, N'https://mir-s3-cdn-cf.behance.net/projects/404/b4a96a125150175.Y3JvcCwyNDAwLDE4NzcsMCw1NTg.png')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'DD6A2986-9313-4282-A216-763EF69C62CA', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'a2062cfa-dd88-417d-b74c-df71abb49683', N'D760CF58-5CCB-4640-B2C6-F8F749D9ED18', 4, N'https://i.pinimg.com/474x/b6/36/8c/b6368cf5cbc09e8872c4ea968545df75.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'DF0186FD-74B8-4FBB-8810-6DF55F9B3C2A', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'05a06025-b99d-496f-b6f1-b52c048b1dde', N'680A6ACF-F858-4E6B-80B4-C86C449C96C9', 2, N'https://besthqwallpapers.com/Uploads/18-3-2019/83868/thumb2-draymond-green-golden-state-warriors-nba-joy-basketball-stars.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'DFC06DF5-EB64-499A-B2A0-0C6B96B196DE', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'250b8997-3bf3-428b-ac8a-3bcdae614e11', N'27C6E57A-6E6C-4F72-B8D7-E355B921B953', 0, N'https://besthqwallpapers.com/Uploads/4-5-2020/131628/thumb2-jordan-poole-nba-golden-state-warriors-blue-stone-background-american-basketball-player.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'E09F466D-C45F-497E-9BB7-84D8EAF761F1', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'55f9718d-c9f5-4153-a174-1572f6c994bc', N'FA02EADF-2800-4367-BFF8-7D96D136EC02', 4, N'https://images.fineartamerica.com/images/artworkimages/medium/1/stephen-curry-golden-state-warriors-oil-art-joe-hamilton.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'E1584855-32B8-4B46-9D54-FD1661A2D5E2', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'eab06987-55c1-4fd2-81e4-650709a4b007', N'BE253B45-79D6-4075-81F8-C233EFC76C26', 3, N'https://pbs.twimg.com/media/E8du0tUWUAUIFs-.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'E3D29E30-43CB-4BB3-9C7D-C5F453EBA816', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'250b8997-3bf3-428b-ac8a-3bcdae614e11', N'195C0CC4-761B-4B17-B2A6-E361334AA6EC', 0, N'https://mir-s3-cdn-cf.behance.net/projects/404/688c6d123757487.60f5732c831cf.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'E64D4F75-E2DC-42CD-A12A-5103726D2732', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'079bafb6-0fbb-4bca-8459-3259a0a9cead', N'099F5AE3-6097-4AE4-9A81-31275A25E849', 3, N'https://i.pinimg.com/736x/4f/f0/2f/4ff02f233debb0fc3c936de116ecf2b8.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'E8320367-08A8-46E2-AD06-B6F7E98BA455', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'35e66a55-c3ec-4305-95f9-bf3d6eb1ba1d', N'0596C1FB-3050-42DC-B301-C32A2658E3AF', 0, N'https://i.ebayimg.com/images/g/fQsAAOSwQNNe~-Kk/s-l300.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'E887FB25-C19B-4C22-8A27-DF8B8F06592C', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'84735168-7879-46be-93b9-0ba5ec75a6bf', N'E3A30258-6D13-4F31-9EEA-F531BF0CD03B', 2, N'https://pbs.twimg.com/media/E70WasoXoAECWwM?format=jpg&name=large')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'E97CE3C1-4149-44EA-B04B-3B17E07AEC60', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'7b58a4f5-99e6-4b41-8326-5f1820e914c6', N'796146D0-38E7-488C-AE0C-D639DD42D7BE', 4, N'https://besthqwallpapers.com/Uploads/8-6-2020/135456/thumb2-og-anunoby-4k-2020-toronto-raptors-nba.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'EBDFD42D-1339-47CD-A48B-265D0CB5671E', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'2b8b1845-90ab-4841-b429-e0d686949fb4', N'AF02C091-3FDA-46E4-9896-25D2A11D632D', 1, N'https://m.media-amazon.com/images/I/61fzGVvXXXL._AC_SY445_.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'F13180BE-9ECA-448F-86FE-EA08964E938B', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'fe114ffb-e2f1-4c37-8d19-e5062e38aff0', N'22E00904-F663-4BF7-9227-F1E07C473331', 1, N'https://sportando.basketball/wp-content/uploads/2021/08/E8r59RQVEAY11Xl.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'F1B797AC-5B17-4B79-9FCB-39B6E84B4223', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'ecf5b91c-57ef-42be-8ad0-67443560c647', N'E98D20CB-D04C-423B-BE8B-CA3442A72D72', 2, N'https://i.ebayimg.com/images/g/L4oAAOSwQpJe~-n7/s-l300.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'F27CC613-8015-40C5-B68D-6FE4FBDE718F', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'079bafb6-0fbb-4bca-8459-3259a0a9cead', N'DFD44551-C7DF-49EA-BF72-FC67A83D4CC8', 2, N'https://i.pinimg.com/originals/97/a9/91/97a991d91f8fcfd082ca50539c2039d7.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'F3C25194-F11D-4F4F-8D42-1925A3D607C8', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'a63d43ec-7b21-4e28-9b2a-fae4c35f943a', N'44E31CC7-8243-49D8-B9C0-0185AEE756D5', 3, N'https://www.nbaanalysis.net/wp-content/uploads/2021/11/Seth-Curry-Reveals-What-Has-Led-To-Breakout-Season.jpeg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'F3EFFEFF-CCA2-4C1A-BE94-3504089E9306', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'55f9718d-c9f5-4153-a174-1572f6c994bc', N'04DAE89A-D921-4077-AF1F-2DF4A775A603', 4, N'https://mir-s3-cdn-cf.behance.net/project_modules/fs/c637b9113942143.6032034478789.png')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'F564EE09-FD5F-40A5-A2D0-A3F75CF8B8D7', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'b0e90c28-f6f8-480f-a29c-6bfca3a1ada5', N'BFA43E5F-ABE9-40F5-9463-CF56F7BF7ECA', 3, N'https://pbs.twimg.com/tweet_video_thumb/E8JA5mcUUAIgaiL?format=jpg&name=large')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'F59E4895-36F4-4242-B178-4B8CDEB451AB', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'6503376c-50ca-4461-b987-f2e90a62b8fb', N'BE79A3E9-08B7-445F-BBB2-05C2B068CAAE', 4, N'https://cconnect.s3.amazonaws.com/wp-content/uploads/2020/01/2019-20-Panini-Court-Kings-Basketball-Cards-Base-Rookies-I-RJ-Barrett-RC.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'F7719201-A828-4419-A424-A7D2E5E6024A', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'7cd6194a-fe6c-440b-9f53-3eea6c1b624c', N'BA66E965-8005-4CEB-9F66-0CAC2BBBC8EC', 0, N'https://pbs.twimg.com/media/DklxZOFV4AEO41S.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'F9570077-8150-4889-A32A-845D01BCE42B', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'84735168-7879-46be-93b9-0ba5ec75a6bf', N'8555CA45-7068-46F9-A1E6-D77CC39FC6FD', 3, N'https://i.pinimg.com/736x/e3/85/94/e3859415da2754349c2bc221e982883a.jpg')
INSERT [dbo].[Cards] ([id], [userId], [packId], [playerId], [tier], [cardImage]) VALUES (N'FDB684A6-F42E-41F2-9703-26B8B38A2AD7', N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'0225f1b5-c452-4035-9537-0bb568135865', N'A3A7D2CC-19B3-41C6-B047-C1B0494511A3', 3, N'https://a57.foxsports.com/statics.foxsports.com/www.foxsports.com/content/uploads/2021/08/1280/1280/8.16.21_Clippers-Acquire-Eric-Bledsoe-16x9.jpg?ve=1&tl=1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'588960ba-dcbd-4b6e-88b4-079db7f7272b', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'84735168-7879-46be-93b9-0ba5ec75a6bf', N'Starter', 0, N'ed0eba80-4043-4d86-8f8c-f021af404fc1', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'0225f1b5-c452-4035-9537-0bb568135865', N'Starter', 0, N'ed0eba80-4043-4d86-8f8c-f021af404fc1', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'67f847a8-503e-4119-bd99-0c0486825d71', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'c4137a40-064e-4dab-9015-0d7faff5e5a2', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'55f9718d-c9f5-4153-a174-1572f6c994bc', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'1292f107-e938-4869-8df4-1804a3f13e9d', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 0, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'21b1476d-6753-45c4-bc3b-233c8cededfb', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpack.png?alt=media&token=b9a4b861-45c1-449d-b27a-f214df34d66f', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'a2df7326-4b32-4104-bc14-25b174c076f5', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'079bafb6-0fbb-4bca-8459-3259a0a9cead', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'549c7075-2064-4d85-9f13-37422ba79b54', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'a977433b-af3d-4b44-b79d-38f305ea3e1a', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/ultimateteam2.png?alt=media&token=2a62f84d-92c4-4380-bdc3-c49347470d38', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'22751942-8631-48f0-81dc-3bb461c9c597', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'250b8997-3bf3-428b-ac8a-3bcdae614e11', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'7cd6194a-fe6c-440b-9f53-3eea6c1b624c', N'Starter', 0, N'ed0eba80-4043-4d86-8f8c-f021af404fc1', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'1cd8dfef-767f-4aa8-ba69-469c2cf2d00b', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'043861f2-5672-491d-b267-46c2e043d84b', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'0e32bf2f-b53f-4ffd-8773-61ce77b6b56f')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'9a15fbf7-0a4f-4c76-807c-4a368567628f', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'a3da9f56-2815-4b1d-979c-53ede5509ebd', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'ba03f003-e112-4dfe-8dca-56a353c400ad', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 0, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'f940cf53-42f7-4f31-aede-57e89715e70e', N'starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'909cc205-21a2-40e4-82be-596af1965dd3', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/holidaypack.png?alt=media&token=c234f932-3320-4bad-b296-8544a00fd222', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'7b58a4f5-99e6-4b41-8326-5f1820e914c6', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'eab06987-55c1-4fd2-81e4-650709a4b007', N'Christmas', 1, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/holidaypack.png?alt=media&token=c234f932-3320-4bad-b296-8544a00fd222', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'ecf5b91c-57ef-42be-8ad0-67443560c647', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'efc95bea-aa0f-4fe2-b845-691f2daf5c91', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpack.png?alt=media&token=b9a4b861-45c1-449d-b27a-f214df34d66f', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'ae6f81d2-d795-43fb-aae9-6b301a44bd8e', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpack.png?alt=media&token=b9a4b861-45c1-449d-b27a-f214df34d66f', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'e0775479-f514-4b2f-ae65-6b44fba75487', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'b0e90c28-f6f8-480f-a29c-6bfca3a1ada5', N'Christmas', 1, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/holidaypack.png?alt=media&token=c234f932-3320-4bad-b296-8544a00fd222', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'12476856-5198-4aae-8bb6-6d063a77cb35', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'2f586ca4-ae39-46fb-87fb-6e98e598c959', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'49507fa4-388d-4db6-97a0-75ea9f355e08', N'starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/holidaypack.png?alt=media&token=c234f932-3320-4bad-b296-8544a00fd222', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'7be41405-345d-44a0-a648-7a66899cf9a4', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'3ad253ed-53b7-4ecb-956e-7a6e67e2d6d7', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'474ecc8e-e991-4c84-a02f-82daf6c6eadd', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'f021a8b6-9585-40d4-9415-8357710e6702', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'071bac78-f30b-4926-8b28-83977bed7c00', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'86ca775e-b6ee-4c25-9978-8afd05d73987', N'Christmas', 1, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'cd171356-f0af-46a9-aafa-8fc68320c895', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'8a2902f0-90a5-406f-8363-9d5bd191472d', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'aa9ba564-5c6b-4a88-a748-a1797ebf945f', N'Starter', 0, N'0e32bf2f-b53f-4ffd-8773-61ce77b6b56f', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'0f4c6812-e200-4264-ad24-aea41c2a1a1f', N'Starter', 0, N'https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/7-giannis-antetokounmpo-raekwon-lim.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'ac7a1cd5-d940-454c-ac1e-b000b2fa157d', N'Starter', 0, N'ed0eba80-4043-4d86-8f8c-f021af404fc1', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'05a06025-b99d-496f-b6f1-b52c048b1dde', N'Christmas', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/holidaypack.png?alt=media&token=c234f932-3320-4bad-b296-8544a00fd222', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'3982b90a-fc98-4583-a307-b5dcc07a5e6a', N'Christmas', 1, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/holidaypack.png?alt=media&token=c234f932-3320-4bad-b296-8544a00fd222', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'a907c34c-123f-42b1-9b07-b6bb12c79706', N'Christmas', 1, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/holidaypackcropped.png?alt=media&token=a0f8cd60-ccbc-4565-a428-eb511ca6af59', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'35e66a55-c3ec-4305-95f9-bf3d6eb1ba1d', N'Starter', 0, N'ed0eba80-4043-4d86-8f8c-f021af404fc1', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'9e237293-662b-4960-8f58-bf4ae8cd4953', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'196a5f77-14a1-4347-855a-c10e2753291b', N'Christmas', 1, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'33efa59a-8e04-421e-b73b-c1cbe5d19b92', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'e6669c9e-97d7-45a8-b472-c8d95f9f34e7', N'starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'fff45e58-584f-4744-abbb-ce337b81a292', N'Christmas', 1, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'ae5f1e63-e24d-4d7b-b23e-d8da616b4670', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'a352dee4-5cde-4b45-9052-dd31d0055e1a', N'Christmas', 1, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'a2062cfa-dd88-417d-b74c-df71abb49683', N'Holiday', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'2b8b1845-90ab-4841-b429-e0d686949fb4', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'a1de2aff-5c30-43c2-9908-e30991987b34', N'Starter', 0, N'ed0eba80-4043-4d86-8f8c-f021af404fc1', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'fe114ffb-e2f1-4c37-8d19-e5062e38aff0', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'cf7e1965-108c-43f0-a6b4-e6d2bec2b984', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'775eea22-4217-430c-8022-f0354d8a6100', N'Christmas', 1, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/holidaypack.png?alt=media&token=c234f932-3320-4bad-b296-8544a00fd222', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'1fe87f72-80df-4be6-8e4d-f1564febee76', N'Starter', 0, N'https://i.pinimg.com/originals/bd/0c/e8/bd0ce881616ae0c2d8ae5828a000e5df.jpg', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'6503376c-50ca-4461-b987-f2e90a62b8fb', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'73d025f0-e75c-4d97-b4ef-f42354af1c3e', N'Starter', 0, N'ed0eba80-4043-4d86-8f8c-f021af404fc1', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Packs] ([id], [packName], [packType], [packImage], [status], [userId]) VALUES (N'a63d43ec-7b21-4e28-9b2a-fae4c35f943a', N'Starter', 0, N'https://firebasestorage.googleapis.com/v0/b/ultimate-team-8034b.appspot.com/o/starterpackcropped.png?alt=media&token=c1b7a67e-3e40-400d-936b-5b15cc1d8da5', 1, N'ed0eba80-4043-4d86-8f8c-f021af404fc1')
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'04DAE89A-D921-4077-AF1F-2DF4A775A603', N'DC6E33EB-74F1-4391-B990-A172A01BC92A', N'Chris', N'Paul', N'https://mir-s3-cdn-cf.behance.net/project_modules/fs/c637b9113942143.6032034478789.png', NULL, NULL, NULL, NULL, N'101108', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'0596C1FB-3050-42DC-B301-C32A2658E3AF', N'FD37F29F-A8C6-4160-A78E-147156AF1FAD', N'Ja', N'Morant', N'https://i.ebayimg.com/images/g/fQsAAOSwQNNe~-Kk/s-l300.jpg', N'', N'', N'', N'', N'1629630', NULL, N'')
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'099F5AE3-6097-4AE4-9A81-31275A25E849', N'80976035-6E5E-4622-9756-31AA6BDF9285', N'Derrick', N'Rose', N'https://i.pinimg.com/736x/4f/f0/2f/4ff02f233debb0fc3c936de116ecf2b8.jpg', NULL, NULL, NULL, NULL, N'201565', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'17DBA265-2EB4-4BC4-9C25-4F4AD59DEBA1', N'D24E96B2-229D-4A45-943C-CB75583D2710', N'De''Aaron', N'Fox', N'https://i.pinimg.com/originals/d5/8e/dc/d58edc495604488894585f4f338a5c32.jpg', NULL, NULL, NULL, NULL, N'1628368', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'195C0CC4-761B-4B17-B2A6-E361334AA6EC', N'7BCBE52D-6427-4F72-960F-CE5DDEB35820', N'Jaylen', N'Brown', N'https://mir-s3-cdn-cf.behance.net/projects/404/688c6d123757487.60f5732c831cf.jpg', NULL, NULL, NULL, NULL, N'1627759', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'1F17751D-5052-4C05-A8D4-F751FAEB8870', N'80976035-6E5E-4622-9756-31AA6BDF9285', N'Julius', N'Randle', N'https://i.pinimg.com/originals/e2/ba/d7/e2bad73182781be805d25907e4311646.png', NULL, NULL, NULL, NULL, N'203944', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'22E00904-F663-4BF7-9227-F1E07C473331', N'28414122-6E50-4677-9890-099D2004AB95', N'Nicolas', N'Batum', N'https://sportando.basketball/wp-content/uploads/2021/08/E8r59RQVEAY11Xl.jpg', NULL, NULL, NULL, NULL, N'201587', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'26AC657C-193A-4D09-8567-A3DC5F63309C', N'67F4AC96-FA97-489D-AE3D-422779FC5844', N'Kyrie', N'Irving', N'https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/kyrie-irving-gilang-bogy.jpg', NULL, NULL, NULL, NULL, N'202681', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'27C6E57A-6E6C-4F72-B8D7-E355B921B953', N'63C55F21-672E-41B8-8506-F6E2A5084618', N'Jordan', N'Poole', N'https://besthqwallpapers.com/Uploads/4-5-2020/131628/thumb2-jordan-poole-nba-golden-state-warriors-blue-stone-background-american-basketball-player.jpg', NULL, NULL, NULL, NULL, N'1629673', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'383E8A75-134C-4D88-A6D1-65BB50AD6F35', N'67F4AC96-FA97-489D-AE3D-422779FC5844', N'James', N'Harden', N'https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/james-harden-ernando-febrian.jpg', NULL, NULL, NULL, NULL, N'201935', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'3C77C75A-6CD7-47ED-A9E9-55E66AF71FF8', N'DC9E1B86-29A8-4610-8E01-5657BD7EECE3', N'Zach', N'Lavine', N'https://i.pinimg.com/originals/cc/25/4c/cc254cbbd2b05a2fbce43ca80826d0d2.jpg', NULL, NULL, NULL, NULL, N'203897', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'44E31CC7-8243-49D8-B9C0-0185AEE756D5', N'FD9BC48A-F52B-408F-B34D-EB592434F3A5', N'Seth', N'Curry', N'https://www.nbaanalysis.net/wp-content/uploads/2021/11/Seth-Curry-Reveals-What-Has-Led-To-Breakout-Season.jpeg', NULL, NULL, NULL, NULL, N'203552', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'482F23AA-F3A3-4B39-A466-D7A65F160EC7', N'67F4AC96-FA97-489D-AE3D-422779FC5844', N'Patty', N'Mills', N'https://fanatics.frgimages.com/FFImage/thumb.aspx?i=/productimages/_4582000/ff_4582000-342556643454c1a5fa59_full.jpg&w=600', NULL, NULL, NULL, NULL, N'201988', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'4F461BFB-9268-4045-A16D-BF1E9FF8D841', N'7BCBE52D-6427-4F72-960F-CE5DDEB35820', N'Jayson', N'Tatum', N'https://i.pinimg.com/736x/57/2c/b8/572cb86bfb627415e707315efeb4e6a8.jpg', NULL, NULL, NULL, NULL, N'1628369', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'56', N'80976035-6E5E-4622-9756-31AA6BDF9285', N'Kemba', N'Walker', N'https://mir-s3-cdn-cf.behance.net/projects/404/b4a96a125150175.Y3JvcCwyNDAwLDE4NzcsMCw1NTg.png', NULL, NULL, NULL, NULL, N'202689', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'59618376-F8B6-4DAE-BB7E-1BC9949A574D', N'67F4AC96-FA97-489D-AE3D-422779FC5844', N'Blake', N'Griffin', N'https://i.ebayimg.com/images/g/5ckAAOSwHtxgRY~7/s-l300.jpg', NULL, NULL, NULL, NULL, N'201933', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'5BAE44F6-7720-40FC-BEC4-22636C72C72E', N'28414122-6E50-4677-9890-099D2004AB95', N'Serge', N'Ibaka', N'https://clutchpoints.com/wp-content/uploads/2020/11/Serge-Ibaka-Clippers-1200x900.jpg', NULL, NULL, NULL, NULL, N'201586', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'5C045462-88B0-4225-9F3A-A8D85EABE32B', N'D24E96B2-229D-4A45-943C-CB75583D2710', N'Buddy', N'Hield', N'https://i.ebayimg.com/images/g/KqEAAOSwWqxe~9bn/s-l300.jpg', NULL, NULL, NULL, NULL, N'1627741', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'5D8D1705-BB98-4219-92FB-CB14E69BD062', N'7BCBE52D-6427-4F72-960F-CE5DDEB35820', N'Marcus', N'Smart', N'https://w0.peakpx.com/wallpaper/393/219/HD-wallpaper-marcus-smart-2020-boston-celtics-nba-basketball-green-neon-lights-marcus-osmond-smart-usa-marcus-smart-boston-celtics-creative-marcus-smart.jpg', NULL, NULL, NULL, NULL, N'203935', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'5FA171BD-EADF-46E1-9024-BD2EB7096434', N'BC1D6388-5124-465A-9A3C-837B0857882D', N'Dwight', N'Howard', N'http://nesn.com/wp-content/uploads/2012/09/6a0115709f071f970b017c3165c8f2970b.jpg', NULL, NULL, NULL, NULL, N'2730', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'67138564-0E55-4676-B04E-5E3220166F33', N'DC6E33EB-74F1-4391-B990-A172A01BC92A', N'JaVale', N'McGee', N'https://pbs.twimg.com/media/E709v_iUUAM4CgN.jpg', NULL, NULL, NULL, NULL, N'201580', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'67E584D0-DB03-414F-9954-9BBE948B403D', N'FD9BC48A-F52B-408F-B34D-EB592434F3A5', N'Joel', N'Embiid', N'https://i.ebayimg.com/images/g/0NYAAOSwiYJe~-SB/s-l300.jpg', NULL, NULL, NULL, NULL, N'203954', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'680A6ACF-F858-4E6B-80B4-C86C449C96C9', N'63C55F21-672E-41B8-8506-F6E2A5084618', N'Draymond', N'Green', N'https://besthqwallpapers.com/Uploads/18-3-2019/83868/thumb2-draymond-green-golden-state-warriors-nba-joy-basketball-stars.jpg', NULL, NULL, NULL, NULL, N'203110', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'6C9840BA-6551-4ECC-9402-76622B40F4C1', N'63C55F21-672E-41B8-8506-F6E2A5084618', N'Andrew', N'Wiggins', N'https://w0.peakpx.com/wallpaper/556/890/HD-wallpaper-andrew-wiggins-grunge-art-nba-golden-state-warriors-basketball-andrew-christian-wiggins-creative-blue-abstract-rays-andrew-wiggins-golden-state-warriors-andrew-wiggins.jpg', NULL, NULL, NULL, NULL, N'203952', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'6C9FA415-ECD8-4E04-A85D-F791FD26424E', N'7BCBE52D-6427-4F72-960F-CE5DDEB35820', N'Enes', N'Freedom', N'https://www.bostonglobe.com/resizer/rnJ49jikGFuQTaH_l2h0oIaiLlc=/arc-anglerfish-arc2-prod-bostonglobe/public/C2ZS5FUXEXSMNTCQPL4JN5XNIE.jpg', NULL, NULL, NULL, NULL, N'202683', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'6FD5F236-0942-4388-99A3-CE664611FA01', N'80976035-6E5E-4622-9756-31AA6BDF9285', N'Alec', N'Burks', N'https://images.contentstack.io/v3/assets/blt2be026723df76578/bltcd088f5fa0f3c9c8/60df3d5248dce53d63b21f8e/Knicks_Alec_Burks_2021-TreatedArt-TEMPLATE_-_BURKS.jpg?width=1200&height=630&crop=1.91%3A1&fit=bounds', NULL, NULL, NULL, NULL, N'202692', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'706084DD-6AFC-4002-8187-4756AB2CE213', N'67F4AC96-FA97-489D-AE3D-422779FC5844', N'Joe', N'Harris', N'https://m.media-amazon.com/images/I/71T7NO9pgsL._AC_SY445_.jpg', NULL, NULL, NULL, NULL, N'203925', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'7702FE5C-A0E3-42EE-B1DC-2591D0F368CA', N'DC6E33EB-74F1-4391-B990-A172A01BC92A', N'Devin', N'Booker', N'https://i.ebayimg.com/images/g/vgsAAOSwXfhe~9uX/s-l300.jpg', NULL, NULL, NULL, NULL, N'1626164', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'796146D0-38E7-488C-AE0C-D639DD42D7BE', N'5A2C18FC-FCF1-4B91-900A-141485FC82F0', N'OG', N'Anuoby', N'https://besthqwallpapers.com/Uploads/8-6-2020/135456/thumb2-og-anunoby-4k-2020-toronto-raptors-nba.jpg', NULL, NULL, NULL, NULL, N'1628384', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'7B5965F0-652E-4537-AB39-DB48B8C9189B', N'5A2C18FC-FCF1-4B91-900A-141485FC82F0', N'Fred', N'Vanfleet', N'https://preview.redd.it/bpo507ky0gi51.jpg?auto=webp&s=b8dc179168cafa9cda91551d26b556e3698cfcc8', NULL, NULL, NULL, NULL, N'1627832', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'80314FBD-5EFA-4806-9B6B-6D2E7CE8E07D', N'28414122-6E50-4677-9890-099D2004AB95', N'Paul', N'George', N'https://mir-s3-cdn-cf.behance.net/project_modules/2800_opt_1/0b9345105508647.5f7b26f73ae6a.jpg', NULL, NULL, NULL, NULL, N'202331', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'8091CCBD-891A-4F5F-AE8E-801AA7CEACD3', N'28414122-6E50-4677-9890-099D2004AB95', N'Terrance', N'Mann', N'https://i.ebayimg.com/00/s/OTAzWDY2MA==/z/uDsAAOSwRL9hmzhr/$_3.JPG', NULL, NULL, NULL, NULL, N'1629611', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'81FC6DD5-48AA-4729-8B99-F33E5457D109', N'DC9E1B86-29A8-4610-8E01-5657BD7EECE3', N'Alex', N'Caruso', N'https://pbs.twimg.com/media/E8bKbDoX0AMaIJp?format=jpg&name=large', NULL, NULL, NULL, NULL, N'1627936', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'8555CA45-7068-46F9-A1E6-D77CC39FC6FD', N'BC1D6388-5124-465A-9A3C-837B0857882D', N'Lebron', N'James', N'https://i.pinimg.com/736x/e3/85/94/e3859415da2754349c2bc221e982883a.jpg', N'', N'', N'', N'', N'2544', NULL, N'')
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'864A5F88-23C7-4D8C-9025-269625B6FC25', N'DC9E1B86-29A8-4610-8E01-5657BD7EECE3', N'DeMar', N'DeRozen', N'https://preview.redd.it/dbwwf29x29181.jpg?auto=webp&s=0617bca22b7243f37dd5d9f7019477a08d31cee0', NULL, NULL, NULL, NULL, N'201942', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'895A5A4E-14A0-4FD8-B399-E069C806DC60', N'FD37F29F-A8C6-4160-A78E-147156AF1FAD', N'Steven', N'Adams', N'https://i.ebayimg.com/images/g/Fb0AAOSwWo1hA7xa/s-l300.jpg', NULL, NULL, NULL, NULL, N'203500', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'8CBB14E6-8454-47BB-8B45-9FF03E6E1FFE', N'12C6400E-8E7C-4E9C-A775-EF28B860A85E', N'Trae', N'Young', N'https://i.redd.it/e58hba7bqzs61.jpg', N'', N'', N'', N'', N'1629027', NULL, N'')
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'91261FBB-2DD0-4681-8282-8A3A4C9FE2DF', N'28414122-6E50-4677-9890-099D2004AB95', N'Reggie', N'Jackson', N'https://pbs.twimg.com/media/E5GLAhxVkAQ8svw.jpg', NULL, NULL, NULL, NULL, N'202704', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'9E9AF560-A42F-4E6B-8C4E-3ADB8354179A', N'80976035-6E5E-4622-9756-31AA6BDF9285', N'Obi', N'Toppin', N'https://m.media-amazon.com/images/I/91Xy1AH3I5S._AC_SY445_.jpg', NULL, NULL, NULL, NULL, N'1630167', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'A0F7A405-B631-4551-91F0-8F750B724347', N'67F4AC96-FA97-489D-AE3D-422779FC5844', N'Paul', N'Millsap', N'https://images.footballfanatics.com/FFImage/thumb.aspx?i=/productimages/_4581000/ff_4581998-3da31d6b61a619e060d5_full.jpg&w=900', NULL, NULL, NULL, NULL, N'200794', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'A2161C1F-64DD-4C0C-BB80-770CFAA41435', N'9F0F087B-57AA-42BC-A23C-C76F41045108', N'Giannis', N'Antetokuoumpo', N'https://i.ebayimg.com/images/g/6FYAAOSwH39e~9~G/s-l400.jpg', NULL, NULL, NULL, NULL, N'203507', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'A3A7D2CC-19B3-41C6-B047-C1B0494511A3', N'28414122-6E50-4677-9890-099D2004AB95', N'Eric', N'Bledsoe', N'https://a57.foxsports.com/statics.foxsports.com/www.foxsports.com/content/uploads/2021/08/1280/1280/8.16.21_Clippers-Acquire-Eric-Bledsoe-16x9.jpg?ve=1&tl=1', NULL, NULL, NULL, NULL, N'202339', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'AF02C091-3FDA-46E4-9896-25D2A11D632D', N'FD9BC48A-F52B-408F-B34D-EB592434F3A5', N'Matisse', N'Thybulle', N'https://m.media-amazon.com/images/I/61fzGVvXXXL._AC_SY445_.jpg', NULL, NULL, NULL, NULL, N'1629680', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'BA66E965-8005-4CEB-9F66-0CAC2BBBC8EC', N'DC6E33EB-74F1-4391-B990-A172A01BC92A', N'Deandre', N'Ayton', N'https://pbs.twimg.com/media/DklxZOFV4AEO41S.jpg', NULL, NULL, NULL, NULL, N'1629028', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'BBFFAB17-CDE4-4ADF-B97E-05AA39575A1C', N'7BCBE52D-6427-4F72-960F-CE5DDEB35820', N'Al', N'Horford', N'https://img.beckett.com/images/items/16358289/marketplace/97094378/front.jpg', NULL, NULL, NULL, NULL, N'201143', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'BE253B45-79D6-4075-81F8-C233EFC76C26', N'7BCBE52D-6427-4F72-960F-CE5DDEB35820', N'Dennis', N'Schroder', N'https://pbs.twimg.com/media/E8du0tUWUAUIFs-.jpg', NULL, NULL, NULL, NULL, N'203471', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'BE79A3E9-08B7-445F-BBB2-05C2B068CAAE', N'80976035-6E5E-4622-9756-31AA6BDF9285', N'RJ', N'Barrett', N'https://cconnect.s3.amazonaws.com/wp-content/uploads/2020/01/2019-20-Panini-Court-Kings-Basketball-Cards-Base-Rookies-I-RJ-Barrett-RC.jpg', NULL, NULL, NULL, NULL, N'1629628', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'BFA43E5F-ABE9-40F5-9463-CF56F7BF7ECA', N'5A2C18FC-FCF1-4B91-900A-141485FC82F0', N'Goran', N'Dragic', N'https://pbs.twimg.com/tweet_video_thumb/E8JA5mcUUAIgaiL?format=jpg&name=large', NULL, NULL, NULL, NULL, N'201609', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'BFFC403A-A1E3-4332-A2B4-3388647C7C1D', N'80976035-6E5E-4622-9756-31AA6BDF9285', N'Mitchell', N'Robinson', N'https://preview.redd.it/mokmq0lob7x41.png?auto=webp&s=1d9195248ce1c7adc26a8ca4b80f086e2badf972', NULL, NULL, NULL, NULL, N'1629011', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'CF5E2B91-7CCC-4A1E-8E1D-039C9AC8C43C', N'5A2C18FC-FCF1-4B91-900A-141485FC82F0', N'Pascal', N'Siakam', N'https://i0.wp.com/www.nbaanalysis.net/wp-content/uploads/2021/08/download-8.jpeg?resize=678%2C381&ssl=1', NULL, NULL, NULL, NULL, N'1627783', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'D760CF58-5CCB-4640-B2C6-F8F749D9ED18', N'BC1D6388-5124-465A-9A3C-837B0857882D', N'Russell', N'Westbrook', N'https://i.pinimg.com/474x/b6/36/8c/b6368cf5cbc09e8872c4ea968545df75.jpg', NULL, NULL, NULL, NULL, N'201566', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'DA3C5E2B-A73F-4490-B150-1AD9B82185D4', N'BC1D6388-5124-465A-9A3C-837B0857882D', N'Carmelo', N'Anthony', N'https://mir-s3-cdn-cf.behance.net/project_modules/fs/fd4f61124959995.610f2e07f0273.png', NULL, NULL, NULL, NULL, N'2546', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'DE8EAAD8-903A-4DDC-BB87-D81997EF940C', N'DC6E33EB-74F1-4391-B990-A172A01BC92A', N'Jae', N'Crowder', N'https://i.redd.it/8bca6sih1y071.jpg', NULL, NULL, NULL, NULL, N'203109', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'DFD44551-C7DF-49EA-BF72-FC67A83D4CC8', N'FD9BC48A-F52B-408F-B34D-EB592434F3A5', N'Tobias', N'Harris', N'https://i.pinimg.com/originals/97/a9/91/97a991d91f8fcfd082ca50539c2039d7.jpg', NULL, NULL, NULL, NULL, N'202699', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'E3A30258-6D13-4F31-9EEA-F531BF0CD03B', N'DC9E1B86-29A8-4610-8E01-5657BD7EECE3', N'Lonzo', N'Ball', N'https://pbs.twimg.com/media/E70WasoXoAECWwM?format=jpg&name=large', NULL, NULL, NULL, NULL, N'1628366', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'E98D20CB-D04C-423B-BE8B-CA3442A72D72', N'67F4AC96-FA97-489D-AE3D-422779FC5844', N'Kevin', N'Durant', N'https://i.ebayimg.com/images/g/L4oAAOSwQpJe~-n7/s-l300.jpg', NULL, NULL, NULL, NULL, N'201142', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'EFB43C82-E2A8-46F0-A3AC-45F47CF2468C', N'BC1D6388-5124-465A-9A3C-837B0857882D', N'Anthony', N'Davis', N'https://i.ebayimg.com/images/g/X2EAAOSwpUlgKkhW/s-l300.jpg', NULL, NULL, NULL, NULL, N'203076', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'F8938775-03DE-401C-89EF-00BAB9FE4C2E', N'D24E96B2-229D-4A45-943C-CB75583D2710', N'Tyrese', N'Haliburton', N'https://i.redd.it/v99iuejzlmy61.jpg', NULL, NULL, NULL, NULL, N'1630169', NULL, NULL)
INSERT [dbo].[Players] ([id], [teamId], [firstName], [lastName], [playerImage], [age], [height], [weight], [yearsPro], [playerApiId], [cardId], [position]) VALUES (N'FA02EADF-2800-4367-BFF8-7D96D136EC02', N'63C55F21-672E-41B8-8506-F6E2A5084618', N'Steph', N'Curry', N'https://images.fineartamerica.com/images/artworkimages/medium/1/stephen-curry-golden-state-warriors-oil-art-joe-hamilton.jpg', NULL, NULL, NULL, NULL, N'201939', NULL, NULL)
INSERT [dbo].[Stats] ([id], [playerId], [PPG], [APG], [RPG], [BPG], [SPG], [MPG], [gamesPlayed], [statApiId]) VALUES (N'293605d9-8c43-4752-8138-9215439608d4', N'0596C1FB-3050-42DC-B301-C32A2658E3AF', N'', N'', N'', N'', N'', N'', N'', NULL)
INSERT [dbo].[Stats] ([id], [playerId], [PPG], [APG], [RPG], [BPG], [SPG], [MPG], [gamesPlayed], [statApiId]) VALUES (N'63846a97-b93c-45fd-b387-c94145639d1a', N'8CBB14E6-8454-47BB-8B45-9FF03E6E1FFE', N'', N'', N'', N'', N'', N'', N'', NULL)
INSERT [dbo].[Stats] ([id], [playerId], [PPG], [APG], [RPG], [BPG], [SPG], [MPG], [gamesPlayed], [statApiId]) VALUES (N'2e6b9dcd-4ce6-48a1-905c-e0a044a9dea2', N'8555CA45-7068-46F9-A1E6-D77CC39FC6FD', N'', N'', N'', N'', N'', N'', N'', NULL)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'000B215C-7B9F-4181-AFB3-75AED594AF68', NULL, NULL, N'1610612757', N'https://1000logos.net/wp-content/uploads/2018/06/Portland-Trail-Blazers-Logo.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'073A143C-7CD8-4DB0-A93A-3013273CBBC3', NULL, NULL, N'1610612765', N'https://1000logos.net/wp-content/uploads/2017/08/Detroit-Pistons-logo.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'12C6400E-8E7C-4E9C-A775-EF28B860A85E', N'', N'', N'1610612737', N'https://az2.hatstoremedia.com/hatstore/images/image-atlanta-hawks-kepsar-2017-02-21-125306273/261/261/0/atlanta-hawks-kepsar.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'28414122-6E50-4677-9890-099D2004AB95', NULL, NULL, N'1610612746', N'https://az1.hatstoremedia.com/hatstore/images/image-la-clippers-kepsar-2017-02-21-125456838/261/261/0/la-clippers-kepsar.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'2A01D11F-8544-4791-9635-63316454FA0C', NULL, NULL, N'1610612739', N'https://logos-world.net/wp-content/uploads/2020/05/Cleveland-Cavaliers-logo.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'2B5B21B4-AB75-4AB5-9E26-A5F1532A2907', NULL, NULL, N'1610612745', N'https://www.nba.com/.element/img/1.0/teamsites/logos/teamlogos_500x500/hou.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'50E92BF4-BD2A-47C9-9679-01B94A9D20E4', NULL, NULL, N'1610612764', N'https://logos-world.net/wp-content/uploads/2020/05/Washington-Wizards-logo.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'5A2C18FC-FCF1-4B91-900A-141485FC82F0', NULL, NULL, N'1610612761', N'https://logos-world.net/wp-content/uploads/2020/05/Toronto-Raptors-logo.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'63C55F21-672E-41B8-8506-F6E2A5084618', NULL, NULL, N'1610612744', N'https://logos-world.net/wp-content/uploads/2020/05/Golden-State-Warriors-logo.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'67F4AC96-FA97-489D-AE3D-422779FC5844', NULL, NULL, N'1610612751', N'https://logos-world.net/wp-content/uploads/2020/05/Brooklyn-Nets-Logo.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'77EBF647-4EE5-4E4C-90ED-7E39EBA17254', NULL, NULL, N'1610612759', N'https://cdn.bleacherreport.net/images/team_logos/328x328/san_antonio_spurs.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'7BCBE52D-6427-4F72-960F-CE5DDEB35820', NULL, NULL, N'1610612738', N'https://logos-world.net/wp-content/uploads/2020/05/Boston-Celtics-logo.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'7E69C111-983E-445F-BBA0-310B33C78C3C', NULL, NULL, N'1610612762', N'https://www.nba.com/.element/img/1.0/teamsites/logos/teamlogos_500x500/uta.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'80976035-6E5E-4622-9756-31AA6BDF9285', NULL, NULL, N'1610612752', N'https://upload.wikimedia.org/wikipedia/en/thumb/2/25/New_York_Knicks_logo.svg/1200px-New_York_Knicks_logo.svg.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'84657143-7791-4AE7-9512-A3D065944186', NULL, NULL, N'1610612754', N'https://cdn.uconnectlabs.com/wp-content/uploads/sites/28/2017/09/indiana.pacers.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'8599B798-FED0-42DF-B522-752EB6B488D2', NULL, NULL, N'1610612766', N'https://marka-logo.com/wp-content/uploads/2020/08/Charlotte-Hornets-Logo.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'8CCF4325-ADE8-4790-92F4-287EA5A2B25F', NULL, NULL, N'1610612750', N'https://logos-world.net/wp-content/uploads/2020/05/Minnesota-Timberwolves-Logo-2017-Present.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'983B56F0-9C90-4D2A-B299-91064C42E399', NULL, NULL, N'1610612743', N'https://www.nba.com/.element/img/1.0/teamsites/logos/teamlogos_500x500/den.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'98DE22F0-338C-4837-9551-116474F3F52A', NULL, NULL, N'1610612742', N'https://logos-world.net/wp-content/uploads/2020/05/Dallas-Mavericks-Logo.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'9F0F087B-57AA-42BC-A23C-C76F41045108', NULL, NULL, N'1610612749', N'https://logos-world.net/wp-content/uploads/2020/05/Milwaukee-Bucks-Symbol-1.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'BC1D6388-5124-465A-9A3C-837B0857882D', N'', N'', N'1610612747', N'http://assets.stickpng.com/images/58419d0aa6515b1e0ad75a6c.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'BCCF5D96-70C7-436A-BD8C-A6828E7359D8', NULL, NULL, N'1610612748', N'https://1000logos.net/wp-content/uploads/2021/04/Miami-Heat-logo.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'CFD885E4-8C5B-462E-9C80-67F260488A0C', NULL, NULL, N'1610612740', N'https://www.nba.com/.element/img/1.0/teamsites/logos/teamlogos_500x500/nop.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'D24E96B2-229D-4A45-943C-CB75583D2710', NULL, NULL, N'1610612758', N'https://logos-world.net/wp-content/uploads/2020/05/Sacramento-Kings-logo.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'DC6E33EB-74F1-4391-B990-A172A01BC92A', NULL, NULL, N'1610612756', N'https://www.gerbenlaw.com/wp-content/uploads/2020/06/Phoenix-Suns-e1591983761686.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'DC9E1B86-29A8-4610-8E01-5657BD7EECE3', NULL, NULL, N'1610612741', N'https://logos-world.net/wp-content/uploads/2020/05/Chicago-Bulls-Symbol.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'F179F079-D311-4901-BAD8-5DB0F748E949', NULL, NULL, N'1610612753', N'https://logos-world.net/wp-content/uploads/2020/05/Orlando-Magic-logo.png', NULL, 0)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'F9656161-5E48-4A42-BA44-349A142503D1', NULL, NULL, N'1610612760', N'https://logos-world.net/wp-content/uploads/2020/05/Oklahoma-City-Thunder-logo.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'FD37F29F-A8C6-4160-A78E-147156AF1FAD', N'', N'', N'1610612763', N'https://logos-world.net/wp-content/uploads/2020/05/Memphis-Grizzlies-Logo-2005-2018.png', NULL, 1)
INSERT [dbo].[Teams] ([id], [teamName], [conference], [teamApiId], [teamLogo], [city], [conferenceType]) VALUES (N'FD9BC48A-F52B-408F-B34D-EB592434F3A5', NULL, NULL, N'1610612755', N'https://logos-world.net/wp-content/uploads/2020/05/Philadelphia-76ers-logo.png', NULL, 0)
INSERT [dbo].[Users] ([id], [firstName], [lastName], [customerEmail], [customerCreation], [status], [googleId]) VALUES (N'0e32bf2f-b53f-4ffd-8773-61ce77b6b56f', N'Jacob', N'Hargreeves', N'hargreevesjacob@gmail.com', NULL, 1, N'Q2Jty9sM4qPlyGt6sjWNHkkE2163')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [customerEmail], [customerCreation], [status], [googleId]) VALUES (N'b9448212-e552-4c9a-b0a3-75e734b5e4b0', N'Nicole', N'Yon', N'nicoleyon.yn@gmail.com', NULL, 1, N'DJKa9Q5XlrMHqe65cQGrbk9090l2')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [customerEmail], [customerCreation], [status], [googleId]) VALUES (N'1a5a3201-8acd-425c-b984-8a5c3e03fca3', N'Rowan', N'Lafontaine', N'rowan@gmail.com', NULL, 1, NULL)
INSERT [dbo].[Users] ([id], [firstName], [lastName], [customerEmail], [customerCreation], [status], [googleId]) VALUES (N'2387ec93-56a9-4f78-9048-8e3626f9cc8c', N'Ricky', N'Bobby', N'RB@gmail.com', NULL, 1, NULL)
INSERT [dbo].[Users] ([id], [firstName], [lastName], [customerEmail], [customerCreation], [status], [googleId]) VALUES (N'9e5bc90b-5189-4adc-95f2-a729a1e3927f', N'Kaja', N'O''Regan', N'kajaoregan@gmail.com', NULL, 1, N'1dIaUsMV30M8JPefTrc9pJp21253')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [customerEmail], [customerCreation], [status], [googleId]) VALUES (N'ad716de5-360f-460f-aa80-abfefe93a780', N'bobert', N'dafsdf', N'asdfa@gmail.com', NULL, 1, NULL)
INSERT [dbo].[Users] ([id], [firstName], [lastName], [customerEmail], [customerCreation], [status], [googleId]) VALUES (N'f3c0fcd3-a023-48b5-ace7-cdb9bb67607c', N'Benjamin', N'Jarrett', N'b.cl.jarrett@gmail.com', NULL, 1, NULL)
INSERT [dbo].[Users] ([id], [firstName], [lastName], [customerEmail], [customerCreation], [status], [googleId]) VALUES (N'29332afe-3281-4146-b3a5-de2e810a85da', N'Cheyenne', N'Bilderback', N'cheyenneRayne@gmail.com', NULL, 1, NULL)
INSERT [dbo].[Users] ([id], [firstName], [lastName], [customerEmail], [customerCreation], [status], [googleId]) VALUES (N'43597813-1283-4e9d-9d1c-decac72c81ff', N'Rick', N'Jarrett', N'b.cl.jarrett.dev.2@gmail.com', NULL, 1, N'AuLPFVAogqc7NuIOKwWxgoB7Feg1')
INSERT [dbo].[Users] ([id], [firstName], [lastName], [customerEmail], [customerCreation], [status], [googleId]) VALUES (N'ed0eba80-4043-4d86-8f8c-f021af404fc1', N'Ben', N'Jarrett', N'b.cl.jarrett@gmail.com', NULL, 1, N'EECgwo9pK6hVVRsOt35W71Jn54B2')
ALTER TABLE [dbo].[Cards] ADD  CONSTRAINT [DF__Cards__id__3B75D760]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Packs] ADD  CONSTRAINT [DF__Packs__id__30F848ED]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Players] ADD  CONSTRAINT [DF__Players__id__33D4B598]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Stats] ADD  CONSTRAINT [DF__Stats__id__37A5467C]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Teams] ADD  CONSTRAINT [DF__Teams__id__2E1BDC42]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__id__2B3F6F97]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Packs] FOREIGN KEY([packId])
REFERENCES [dbo].[Packs] ([id])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Packs]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Players] FOREIGN KEY([playerId])
REFERENCES [dbo].[Players] ([id])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Players]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Users]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Cards] FOREIGN KEY([cardId])
REFERENCES [dbo].[Cards] ([id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Cards]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Teams] FOREIGN KEY([teamId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Teams]
GO
ALTER TABLE [dbo].[Stats]  WITH CHECK ADD  CONSTRAINT [FK_Stats_Players] FOREIGN KEY([playerId])
REFERENCES [dbo].[Players] ([id])
GO
ALTER TABLE [dbo].[Stats] CHECK CONSTRAINT [FK_Stats_Players]
GO
