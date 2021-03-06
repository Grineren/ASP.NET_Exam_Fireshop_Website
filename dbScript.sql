USE [C:\USERS\381968\DOCUMENTS\VISUAL STUDIO 2013\WEBSITES\FIRESHOPSVENDEPROVE\APP_DATA\DATABASE.MDF]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 05/10/2016 11:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[A_Id] [int] IDENTITY(1,1) NOT NULL,
	[Brugernavn] [nvarchar](max) NOT NULL,
	[Kodeord] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[A_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Billeder]    Script Date: 05/10/2016 11:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billeder](
	[B_Id] [int] IDENTITY(1,1) NOT NULL,
	[Sti] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[B_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Forside]    Script Date: 05/10/2016 11:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forside](
	[F_Id] [int] IDENTITY(1,1) NOT NULL,
	[Tekst] [text] NOT NULL,
	[Billede] [nvarchar](max) NOT NULL,
	[Overskrift] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[F_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategorier]    Script Date: 05/10/2016 11:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategorier](
	[K_Id] [int] IDENTITY(1,1) NOT NULL,
	[Kategori] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[K_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kontakt]    Script Date: 05/10/2016 11:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kontakt](
	[K_Id] [int] IDENTITY(1,1) NOT NULL,
	[Navn] [nvarchar](50) NOT NULL,
	[Adresse] [nvarchar](50) NOT NULL,
	[PostnrOgBy] [nvarchar](50) NOT NULL,
	[Tlf] [nvarchar](50) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[K_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Maerke]    Script Date: 05/10/2016 11:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maerke](
	[M_Id] [int] IDENTITY(1,1) NOT NULL,
	[Brand] [nvarchar](max) NOT NULL,
	[Fk_KategoriId] [int] NOT NULL,
	[Billede] [nvarchar](max) NULL,
	[Beskrivelse] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[M_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nyheder]    Script Date: 05/10/2016 11:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nyheder](
	[N_Id] [int] IDENTITY(1,1) NOT NULL,
	[Overskrift] [nvarchar](max) NOT NULL,
	[Dato] [datetime] NOT NULL,
	[Tekst] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[N_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tilbud]    Script Date: 05/10/2016 11:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tilbud](
	[T_Id] [int] IDENTITY(1,1) NOT NULL,
	[TildbudPct] [int] NOT NULL,
	[Fk_VareId] [int] NOT NULL,
	[SlutDato] [date] NOT NULL,
	[StartDato] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[T_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vare]    Script Date: 05/10/2016 11:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vare](
	[V_Id] [int] IDENTITY(1,1) NOT NULL,
	[Navn] [nvarchar](max) NOT NULL,
	[Pris] [int] NOT NULL,
	[Beskrivelse] [text] NOT NULL,
	[Fk_BilledeId] [int] NOT NULL,
	[Fk_KategoriId] [int] NOT NULL,
	[Fk_MaerkeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[V_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([A_Id], [Brugernavn], [Kodeord]) VALUES (1, N'Admin', N'164a6288f72243314df94ef5a52afeaa796b18510e4dfa6bf19ee3fe5dc333fd')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Billeder] ON 

INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (17, N'0abfffbc-f26d-435d-adc4-b870f1dfe45b_trailerparkboys.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (18, N'lille_Wiking_Bazic.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (52, N'7fb46934-cc38-472d-80a8-716d26c209c9_stor_Varde_Luxe2.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (53, N'8159791b-4531-4acd-a5aa-280cca552087_stor_Varde_Line9.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (54, N'b7428360-78c0-4500-9fcd-40c485191a4e_stor_Varde_Luxe1.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (55, N'0091c313-1356-4de1-b2fb-c63a11b4874f_stor_Jydepejsen_Trend-Line1.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (56, N'0b3c81d4-6385-45d2-a0d9-7b946a64aca3_stor_Jydepejsen_Trend-Line2.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (57, N'd5df12dd-5f03-406e-a312-419777945b26_stor_Jydepejsen_Comfort.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (58, N'6984ecaa-29a7-4593-bb02-8cdf185f2ee6_stor_Jydepejsen_Focus76.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (59, N'4d977079-adb8-4673-957b-d7be2a4cd207_stor_Wiking_Arctic.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (60, N'051acfae-c461-413f-85a8-9cdfcd2998d5_stor_Wiking_Nordic.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (61, N'8887485b-95be-4d37-91ff-df9e1cdc7f25_stor_Wiking_Cubic.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (62, N'2f0b5d9a-e7b3-4e93-afed-3fb8d34ced78_stor_Wiking_Bazic.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (63, N'63f30219-5f06-459f-b505-ac65a290f1ae_stor_TermaTech_TT1.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (64, N'0d6be6cb-96d2-4bdc-85dc-9df285d0c7a2_stor_TermaTech_TT2.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (65, N'7c0b2a75-4978-4f9e-9f61-2a4b28a46b16_stor_Morsø_6140.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (66, N'ad668841-fabf-463c-b6de-5db22b6a6ee5_stor_Morsø_6148.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (67, N'2c6cc7f2-7b54-4d4b-b3ca-4ff51ad2d4be_stor_BriketSpand.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (68, N'4301a475-3e73-495b-b3e4-0edbf88374d0_stor_Brændespand_Dæk.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (69, N'd1b7796e-1d99-49cc-8b98-7a63f0cbeee5_stor_Quadrat.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (70, N'c26326c4-fb49-4d31-9334-79a5ed186c80_stor_Avant.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (71, N'edf8bbaa-6b95-40e9-8d8c-e7b781e9fd55_stor_CinasCylinder.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (72, N'15ec49b6-01a2-49e1-bddf-dc7f6d7c47a6_stor_CinasCube.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (73, N'5385b96b-643a-4017-b6bb-82a81d4adf94_stor_easyfire.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (74, N'e6104c07-e1eb-4726-b7e6-e97f42c91a45_stor_pejsehandske.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (75, N'3765b180-6557-4598-8b2f-07d4cb446533_stor_FlydOvnssværte.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (76, N'8694a0c1-4a72-49a2-a4af-dacca80fce91_stor_GlasRens.jpg')
INSERT [dbo].[Billeder] ([B_Id], [Sti]) VALUES (77, N'4e0af14b-93f4-4ccb-9468-5ecc036fc89a_stor_SenothermPejsemaling.jpg')
SET IDENTITY_INSERT [dbo].[Billeder] OFF
SET IDENTITY_INSERT [dbo].[Forside] ON 

INSERT [dbo].[Forside] ([F_Id], [Tekst], [Billede], [Overskrift]) VALUES (1, N'Som navnet siger, er vi en brændovnsbutik, som har valgt at ligge butikken på nettet, så du som kunde i fred og ro kan sidde og kigge de mange ovne og tilbehør igennem.

Butikken er aldrig lukket, den har åben alle ugens 7 dage 24 timer i døgnet, og du får varen leveret lige til døren.

Den eneste forskel på denne her butik og en fysisk butik er, at du ikke kan røre ved varerne, men er nødt til at se på de billeder og tekster som er lagt ind.

Som noget nyt har vi lavet en afdeling med reservedele til de forskellige ovne.

Vi vil gøre vores bedste, så du får en god forklaring på de forskellige produkter, og derved kan finde frem til lige det du strår og mangler, skulle der være spørgsmål til de forskellige produkter, er du altid velkommen til at skrive en E-mail, eller kontakte os på telefon 48974544. 
', N'forside_billede.jpg', N'Velkommen til FireShop ApS')
SET IDENTITY_INSERT [dbo].[Forside] OFF
SET IDENTITY_INSERT [dbo].[Kategorier] ON 

INSERT [dbo].[Kategorier] ([K_Id], [Kategori]) VALUES (1, N'Brændeovne')
INSERT [dbo].[Kategorier] ([K_Id], [Kategori]) VALUES (2, N'Tilbehør')
SET IDENTITY_INSERT [dbo].[Kategorier] OFF
SET IDENTITY_INSERT [dbo].[Kontakt] ON 

INSERT [dbo].[Kontakt] ([K_Id], [Navn], [Adresse], [PostnrOgBy], [Tlf], [Mail]) VALUES (1, N'FireShop ApS', N'Ny Kongensgade 11', N'9670 Løgstør ', N'7020 6502', N'info@fireshop.dk ')
SET IDENTITY_INSERT [dbo].[Kontakt] OFF
SET IDENTITY_INSERT [dbo].[Maerke] ON 

INSERT [dbo].[Maerke] ([M_Id], [Brand], [Fk_KategoriId], [Billede], [Beskrivelse]) VALUES (1, N'Wiking', 1, N'lille_Wiking_Bazic.jpg', N'Wiking A/S udvikler, producerer og markedsfører produkter med et enestående særpræg indenfor design, funktion og teknologi. De har 30 års erfaring med produkton af pladejernsovne og er i dag en af Europas største og førende producenter af brændeovne.
Wiking ovnene er en serie konvektionsovne, der opfylder nutidens krav til den moderne brændeovn om en effektiv og miljøvenlig forbrænding samt moderne design.

Alle oven sælges ekskl. skorstensrør og gulvplade, som skal bestilles særskilt.
Husk altid at anføre om ovnen skal være med røgafgang i top eller bagud.
Alle brændeovne leveres fragtfrit til brofaste forbindelser. ')
INSERT [dbo].[Maerke] ([M_Id], [Brand], [Fk_KategoriId], [Billede], [Beskrivelse]) VALUES (2, N'TermaTech', 1, N'lille_TermaTech_TT2.jpg', N'TermaTech AS er en danskejet virksomhed, beliggende i Malling, syd for Århus. Virksomheden blev etableret i sommeren 2003 med henblik på at servicere den professionelle brandeovns-faghandel.
TermaTech´s ovne er kendetagnet ved at have et yderst enkelt og minimalistisk design, nem og simpel betjening og ren forbrænding, idet ovnene opfylder de skrappeste normer mht. godkendelser.
Alle modellerne er konvektionsovne, der får den varme luft til at cirkulere. Herved oplever man i det daglige en mere jævn og blød varme. 
')
INSERT [dbo].[Maerke] ([M_Id], [Brand], [Fk_KategoriId], [Billede], [Beskrivelse]) VALUES (3, N'Morsø', 1, N'lille_Morsø_6140.jpg', N'Morsø har 153 års erfaring med produktion af brændeovne, og vi har altid stået i spidsen, når nye ovntyper skulle udvikles. Du kan altid finde en Morsø-ovn, der lever op til netop dine krav til design, størrelse, ovntype og effektivitet. Der er især nogle områder, hvor Morsø adskiller sig fra andre ovne:

Varmeevnen
Støbejernet afgiver en konstant og ensartet varme. Morsø anvender både stråle- og konvektionsprincippet.

Vedligeholdelse
Let udskiftelige dele, eks. slidtagedele. Garanti for levering af reservedele i minimum 10 år efter modellen er udgået.

Landsdækkende forhandlernet
Gennem snart 150 år har Morsø opbygget et tæt forhandlernet over hele landet. Gennem kurser og løbende produktioninformation uddannes forhandlerne, så du altid får den bedst mulige rådgivning både ved køb og servicering.
')
INSERT [dbo].[Maerke] ([M_Id], [Brand], [Fk_KategoriId], [Billede], [Beskrivelse]) VALUES (4, N'Jydepejsen', 1, N'lille_Jydepejsen_Trend-Line1.jpg', N'Et dansk miljøprodukt.
Jydepejsen arbejder på et solidt fundament af mange års gode, håndværksmæssige traditioner, så der er plads til spændende nytænkning og produktudvikling. Komfortabel betjening, optimal forbrænding, tidløst design og miljøbevidst adfærd. Det basale behov for varme har gennem tiden ændret sig til et behov for behagelig varme og senere et behov for behagelig miljørigtig varme.
Jydepejsen arbejder for stadig at dække dette behov på den mest hensigtmæssige måde. Derfor ses udviklingen af brændeovne som en løbende proces, hvor man hele tiden bestræber sig på at forbedre ovnens fordeling af varme i rummet og samtidig effiktivisere forbrændingsprincippperne.
Hos Jydepejsen er miljøbevisthed en naturlig del af hverdagen såvel i administration som i produktion. Det betyder at produktionen foregår efter strenge kvalitetsnormer og med mindst mulige miljøpåvirkninger endvidere er samtlige Jydepejsen brændeovn til enhver tid testet og godkendt efter de strengeste internationale krav og normer.
Alle oven sælges ekskl. gulvplade og skorstensrør, som skal bestilles særskilt.
Husk altid at anføre om ovnen skal være med røgafgang i top eller bagud.
Alle brændeovne leveres fragtfrit til brofaste forbindelser. ')
INSERT [dbo].[Maerke] ([M_Id], [Brand], [Fk_KategoriId], [Billede], [Beskrivelse]) VALUES (5, N'Varde', 1, N'lille_Varde_Line9.jpg', N'Varde Ovne er en danskejet virksomhed. 
Brændeovnene bliver lavet af ca. 30 ansatte i deres 6000 kvadratmeter store fabrik i Tiset ved Gram i Sønderjylland. 
Det er her, spæde ideer bliver til færdige brændeovne, og der er også her, udvikling og forbedring af ovnene finder sted. Varde Ovne er en af de førende brændeovnsproducenter i Danmark.  Alle oven sælges ekskl. gulvplade og skorstensrør, som skal bestilles særskilt. Husk altid at anføre om ovnen skal være med røgafgang i top eller bagud. Alle brændeovne leveres fragtfrit til brofaste forbindelser. ')
INSERT [dbo].[Maerke] ([M_Id], [Brand], [Fk_KategoriId], [Billede], [Beskrivelse]) VALUES (6, N'Brændespande', 2, N'lille_Quadrat.jpg', NULL)
INSERT [dbo].[Maerke] ([M_Id], [Brand], [Fk_KategoriId], [Billede], [Beskrivelse]) VALUES (7, N'Optænding', 2, N'lille_easyfire.jpg', NULL)
INSERT [dbo].[Maerke] ([M_Id], [Brand], [Fk_KategoriId], [Billede], [Beskrivelse]) VALUES (8, N'Pejsesæt', 2, N'lille_Avant.jpg', NULL)
INSERT [dbo].[Maerke] ([M_Id], [Brand], [Fk_KategoriId], [Billede], [Beskrivelse]) VALUES (9, N'Vedligeholdelse', 2, N'lille_GlasRens.jpg', NULL)
INSERT [dbo].[Maerke] ([M_Id], [Brand], [Fk_KategoriId], [Billede], [Beskrivelse]) VALUES (14, N'saddas', 1, N'0b5d6248-6b05-4167-a159-3e1e638e121b_dastardly.jpg', N'asdas')
SET IDENTITY_INSERT [dbo].[Maerke] OFF
SET IDENTITY_INSERT [dbo].[Nyheder] ON 

INSERT [dbo].[Nyheder] ([N_Id], [Overskrift], [Dato], [Tekst]) VALUES (7, N'Kommende leverandør af “SunBurn” ovne', CAST(N'2006-11-06T10:42:50.000' AS DateTime), N'FireShop.dk kan fra 1. januar også levere de efterspurgte “SubBurn” ovne. Flere af vores kunder her igennem
de sidste par år anmodet os at levere disse ovne, hvilket vi - med glæde - kan tilbyde fra 1.1.2007
')
INSERT [dbo].[Nyheder] ([N_Id], [Overskrift], [Dato], [Tekst]) VALUES (8, N'Ny medarbejder, Jan Pedersen', CAST(N'2006-10-20T10:43:09.000' AS DateTime), N'FireShop.dk har med virkning fra 1.11.2006 ansat Jan Pedersen. Jan skal varetage stillingen som sælger, hvor han primært vil stå for salg til erhverv.

')
INSERT [dbo].[Nyheder] ([N_Id], [Overskrift], [Dato], [Tekst]) VALUES (9, N'Kig forbi stand 29', CAST(N'2006-10-08T10:43:26.000' AS DateTime), N'FireShop.dk vil være repræsenteret på årets største messe for alternative varmekilder “VarmeMessen”, som afholdes i Herning kongescenter fra d. 25.10 til 30.11 - Du finder os på stand 29A
')
INSERT [dbo].[Nyheder] ([N_Id], [Overskrift], [Dato], [Tekst]) VALUES (10, N'Hvad er Lorem Ipsum?', CAST(N'2016-09-29T13:48:53.700' AS DateTime), N'Lorem Ipsum er ganske enkelt fyldtekst fra print- og typografiindustrien. Lorem Ipsum har været standard fyldtekst siden 1500-tallet, hvor en ukendt trykker sammensatte en tilfældig spalte for at trykke en bog til sammenligning af forskellige skrifttyper. Lorem Ipsum har ikke alene overlevet fem århundreder, men har også vundet indpas i elektronisk typografi uden væsentlige ændringer. Sætningen blev gjordt kendt i 1960''erne med lanceringen af Letraset-ark, som indeholdt afsnit med Lorem Ipsum, og senere med layoutprogrammer som Aldus PageMaker, som også indeholdt en udgave af Lorem Ipsum.')
SET IDENTITY_INSERT [dbo].[Nyheder] OFF
SET IDENTITY_INSERT [dbo].[Tilbud] ON 

INSERT [dbo].[Tilbud] ([T_Id], [TildbudPct], [Fk_VareId], [SlutDato], [StartDato]) VALUES (13, 10, 45, CAST(N'2016-10-14' AS Date), CAST(N'2016-09-30' AS Date))
SET IDENTITY_INSERT [dbo].[Tilbud] OFF
SET IDENTITY_INSERT [dbo].[Vare] ON 

INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (41, N'VARDE LUXE 2 - STÅL', 7495, N'<p>Varde Luxe 2 er enkel i sin betjening og design, men bag den elegante st&aring;loverflade gemmer sig en raffineret konstruktion. Varde Luxe 2 er enest&aring;ende i sin klasse og har et suver&aelig;nt forbr&aelig;ndingssystem.<br />
Stolte h&aring;ndv&aelig;rkstraditioner og dansk design g&aring;r h&aring;nd i h&aring;nd. Varde Luxe 2 f&aring;s b&aring;de i gr&aring; og sort st&aring;l og leveres med fedtsten p&aring; toppen.<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* 6 KW (4-9 KW) * 40 - 135 m2.</li>
	<li>* Brandkammer (HxBxD) 36/48 x 36 x 29 cm.</li>
	<li>* R&oslash;gafgang &oslash;15 cm (montageh&oslash;jde top: 96 cm).</li>
	<li>* Afstand til ikke brandbart: 5-10 cm (anbefales).</li>
	<li>* Afstand til brandbart: bag = 20 cm, siden = 45 cm.</li>
	<li>* V&aelig;gt: 175 kg.</li>
</ul>
', 52, 1, 5)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (42, N'VARDE LINE 9 - STÅL ', 8195, N'<p>Med sit 40 centimeter brede brandkammer er Varde Line 9 en rigtig herreg&aring;rdsovn. Den har en formidabel ydeevne og kan varme helt op til 150 kvadratmeter op. Desuden har ovnen et stort bagefag, hvor der er god plads til at holde en tekande varm.<br />
Med sin brede front og kraftige st&oslash;bejernsl&aring;ge udstr&aring;ler Varde Line 9 b&aring;de kraft og en klassisk stil. Ovnen g&oslash;r sig godt som midtpunkt p&aring; en lige v&aelig;g.<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* 7 KW (5-10 KW) ~ 50 - 150 m2.</li>
	<li>* Brandkammer (HxBxD) 35/40 x 40 x 32 cm.</li>
	<li>* R&oslash;gafgang &oslash;15 cm (montageh&oslash;jde top: 115,5 cm).</li>
	<li>* Afstand til ikke brandbart: 5-10 cm (anbefales).</li>
	<li>* Afstand til brandbart: bag = 15 cm, siden = 45 cm.</li>
	<li>* V&aelig;gt 180 kg.</li>
</ul>
', 53, 1, 5)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (43, N'VARDE LUXE 1 - KAKLER', 8995, N'<p><br />
Med kakler bliver Varde Luxe 1 til en enest&aring;ende ovn. Det moderne design f&aring;r pludselig farve, s&aring; det passer ind i dine personlige omgivelser. Og de h&aring;ndlavede kakler fuldender det gode og unikke h&aring;ndv&aelig;rk.<br />
Varde Luxe 1 med kakler er meget mere end en br&aelig;ndeovn, og den passer ind alle steder, hvor varmekilde og design skal smelte sammen til et eksklusivt m&oslash;bel.<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* 7 KW (4-10 KW) ~ 40-150 m2.</li>
	<li>* Brandkammer (HxBxD) 36/48 x 36 x 29 cm.</li>
	<li>* R&oslash;gafgang &oslash;15 cm ( montageh&oslash;jde top: 108,5 cm).</li>
	<li>* Afstand til ikke brandbart: 5-10 cm (anbefales).</li>
	<li>* Afstand til brandbart: bag: 20 cm, siden: 50 cm.</li>
	<li>* V&aelig;gt: 205 kg.</li>
</ul>
', 54, 1, 5)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (44, N'TREND-LINE 1 STÅL', 6995, N'<p>Trend st&aring;r for tidens tendenser, og det er netop med dette udgangspunkt at ovnen har f&aring;et sine former. Den er lille og smart, med de eftertragtede runde former og det store br&aelig;ndkammer. Det s&aelig;rlige design giver mulighed for b&aring;de en v&aelig;g- og hj&oslash;rnemodel, hvor blot toppladen udg&oslash;r denne forskel.<br />
&nbsp;<br />
Produkt detaljer:<br />
Trend-line er f&oslash;dt med kvalitetsdetaljer som inderramme, bund og r&oslash;gstuds i st&oslash;bejern, hvilket giver br&aelig;ndeovnen en lang levetid.</p>

<ul>
	<li>* Sort og gr&aring;</li>
	<li>* Koldt greb</li>
	<li>* R&oslash;gafgang i top og bag</li>
	<li>* H&oslash;jde 925 mm, bredde 489 mm. dybde 458 mm.</li>
	<li>* 5 Kw - opvarmer 40 - 90 m2.</li>
	<li>* V&aelig;gt: 100 kg</li>
</ul>
', 55, 1, 4)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (45, N'TREND-LINE 2', 7795, N'<p>Ud over egenskaberne ved Trend-line 1 har du muligheden for at v&aelig;lge endnu en variant i Trend-line serien - Trend-line 2 med drejesokkel. P&aring; denne variant er br&aelig;nderummet udskiftet med en sokkel, som kan drejes 45 gr. i hver retning. Denne egenskab giver helt unikke indretningsmuligheder.<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* Sort eller gr&aring;.</li>
	<li>* Koldt greb.</li>
	<li>* H&oslash;jde: 1145 mm, Bredde: 489 mm, Dybde: 458 mm.</li>
	<li>* 5 Kw. - opvarmer 40 - 90 m2.</li>
	<li>* V&aelig;gt: 110 kg.</li>
</ul>
', 56, 1, 4)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (46, N'Comfort - stål', 4995, N'<p>Akkurat som navnet antider er denne model komfortabel, og dette i flere henseender. Du f&aring; b&aring;de design, effektivitet og h&oslash;j kvalitet i en og samme ovn. Hvad ang&aring;r indretningsmulighederne er ovnen ogs&aring; fleksibel-den er praktisk og tidl&oslash;s og passer meget fint ind i nutidens boligindretning. &nbsp;<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* Sort eller gr&aring; st&aring;l.</li>
	<li>* R&oslash;gafgang i top eller bag.</li>
	<li>* H&oslash;jde: 90 cm, bredde 49 cm, dybde: 42,5 cm.</li>
	<li>* 5 kW - opvarmer 40 - 90 m2.</li>
	<li>* Br&aelig;ndkammer: h&oslash;jde: 24 cm, bredde: 34 cm, dybde: 29 cm.</li>
	<li>* Afstand til br&aelig;ndbart: siden: 35 cm, bagud: 15 cm, front: 100 cm.</li>
	<li>* DS-godkendt.</li>
	<li>* Tilbeh&oslash;r: fedtsten i bagefag.</li>
	<li>* V&aelig;gt: 90 kg.</li>
</ul>
', 57, 1, 4)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (47, N'Focus 76', 3995, N'<p>Jydepejsens f&oslash;rste br&aelig;ndeovn i komplet st&oslash;bejern. Focus 76 er en klassisk st&oslash;bejdernsbr&aelig;ndeovn af bedste kvalitet, hovr det stilrene look m&aring; betragtes som v&aelig;rende unikt. V&aelig;k er de store h&aelig;ngsler, de uelegante luftskydere og den lille glasrude.Focus 76 er en elegant st&oslash;bejernsovn.</p>

<p><br />
&nbsp;Produkt detaljer:</p>

<ul>
	<li>* Sort og gr&aring;</li>
	<li>* 4 KW - 30 - 70 m2.</li>
	<li>* H&oslash;jde: 760 mm - Bredde: 474 mm - Dybde: 444 mm.</li>
	<li>* R&oslash;gafgang &Oslash; 120 mm</li>
	<li>* Afstand til brandbart: siden: 250 mm, bagud: 300 mm, front: 950 mm.</li>
	<li>* V&aelig;gt: 106 kg.</li>
</ul>
', 58, 1, 4)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (48, N'Wiking Arctic ', 6495, N'<p>Wiking Arctic er br&aelig;ndeovnen med stort indkig til ilden. Ovnen har mange elegante detaljer, f.eks. skjulte h&aelig;ngsler og konvektionsriller integreret i designet. Der er b&aring;de top- og bagudgang og s&aring; lever ovnens rustfir st&aring;lh&aring;ndtag helt op til navnet Wiking Arctic. &nbsp;<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* Sort/gr&aring; st&aring;l.</li>
	<li>* Opvarmer 30 - 120 m2.</li>
	<li>* 6 kW.</li>
	<li>* Br&aelig;ndkammerbredde: for 371 mm, bag 303 mm.</li>
	<li>* Afstand til br&aelig;ndbart: bag 250 mm, siden 400 mm.</li>
	<li>* DS-godkendt.</li>
	<li>* V&aelig;gt: 129 kg.</li>
</ul>
', 59, 1, 1)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (49, N'Wiking Nordic 1', 6995, N'<p>En h&oslash;j og slank panorama ovn.<br />
Det store buede glas g&oslash;r det muligt at opleve ilden fra ethvert hj&oslash;rne af rummet.<br />
Den rundeform giver denne ovn meget alsidge placeringsmuligheder, da den er lige velegnet til opstilling i hj&oslash;rner som mod lige v&aelig;g.<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* Tilbeh&oslash;r fedtsten, eller kakkel over l&aring;ge.</li>
	<li>* R&oslash;gafgang indvendig: &Oslash;150 mm.</li>
	<li>* V&aelig;gt: 102 kg.</li>
	<li>* Gulvplade min. bredde/l&aelig;ngde: 75/96 cm.</li>
	<li>* Afstand til brandbart: siden 35 cm, bag 25 cm.</li>
	<li>* 6 KW.</li>
	<li>* Opvarmer: 30 - 120 m2.</li>
	<li>* DS godkendt.</li>
	<li>* Sort eller gr&aring; med rustfrie greb.</li>
	<li>* Afstand gulv til centrum r&oslash;gafgang bagud: 100,8 cm.</li>
	<li>* Brandkammer: 35 cm forrest og 25 cm bagerst.</li>
	<li>* Leveres med r&oslash;gafgang i top og bag.</li>
	<li>* V&aelig;gt: 102 kg.</li>
</ul>
', 60, 1, 1)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (50, N' Wiking Cubic', 4995, N'<p>Wiking Cubic er en helt ny br&aelig;ndeovn, hvor fleksibilitet, funktionalitet og design er integreret i et og samme produkt.<br />
H&aelig;ng ovnen op, byg den ind i v&aelig;ggen - s&aelig;t den p&aring; gulvet eller p&aring; en plint.<br />
Perfekt til dig, der vil skabe dine egne rammer og have unikke indretningsl&oslash;sninger.<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* Tilbeh&oslash;r: V&aelig;gbeslag og r&oslash;gr&oslash;r m. st&aring;lflapper.</li>
	<li>* R&oslash;gafgang indvendig: &Oslash;150 mm.</li>
	<li>* V&aelig;gt: 99 kg.</li>
	<li>* Afstand til brandbart: siden 35 cm, bag 15 cm.</li>
	<li>* Opvarmer: 30 - 100 m2.</li>
	<li>* 5 KW:</li>
	<li>* DS godkendt.</li>
	<li>* Sort eller gr&aring; med fustfri greb.</li>
	<li>* Afstand gulv til centrum r&oslash;gafgang bagud: 599 mm.</li>
	<li>* Brandkammerbredde: 36 cm.</li>
	<li>* Kan leveres med r&oslash;gafgang i top eller bag.</li>
	<li>* V&aelig;gt: 99 kg.</li>
</ul>
', 61, 1, 1)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (51, N'Wiking Bazic 1', 4495, N'<p>Ideen bag udviklingen af denne nye br&aelig;ndeovn var at skabe en effektiv br&aelig;ndeovn, hvor kvalitet og funktion er helt i top, mens prisen er helt i bund.<br />
Wiking Bazic 1 har flotte afrundede og slebne kanter, som giver ovnen en utrolig flot finish.<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* R&oslash;gafhang indvendig: &Oslash;150 mm.</li>
	<li>* V&aelig;gt: 106 kg.</li>
	<li>* Afstand til brandbart: siden 45 cm, bag 30 cm.</li>
	<li>* 6 KW.</li>
	<li>* Opvarmer: 30 - 130 m2.</li>
	<li>* Sort og gr&aring;.</li>
	<li>* DS godkendt.</li>
	<li>* Brandkammerbredde: 36 mm.</li>
	<li>* Leveres kun med r&oslash;gafgang i top.</li>
	<li>* V&aelig;gt: 106 kg.</li>
</ul>
', 62, 1, 1)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (52, N'TT 1', 9995, N'<p>TT1 er nyt&aelig;nkning indenfor br&aelig;ndeovne i skandinavisk design. De elegante og raffinerede linier fremst&aring;r i et gedigent minimalistisk design. Ovnen er af h&oslash;j h&aring;ndv&aelig;rksm&aelig;ssig kvalitet, og betjenes nemt og enkelt. H&oslash;j kvalitet til en attraktiv pris.<br />
Leveres i sort og gr&aring; og med r&oslash;gafgang i top og bag.<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* Afstand til br&aelig;ndbart:
	<ul>
		<li>- bag: 150 mm</li>
		<li>- sider 350 mm</li>
		<li>- foran 900 mm.</li>
	</ul>
	</li>
	<li>* Nominel ydelse: 5 KW</li>
	<li>* Driftsomr&aring;de: 3 - 7 KW.</li>
	<li>* Opvarmer mellem 30 og 140 m2.</li>
	<li>* DS/EN 13240 godkendt.</li>
	<li>* 4 mm st&aring;l.</li>
	<li>* Br&aelig;ndkammerbund samt inderramme i l&aring;ge er udf&oslash;rt i st&oslash;bejern.</li>
	<li>* V&aelig;gt: 121 kg.</li>
</ul>
', 63, 1, 2)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (53, N'TT 2', 10995, N'<p>TT2 er nyt&aelig;nkning indenfor br&aelig;ndeovne i skandinavisk design. De elegante linier med den buede panorama front, giver dig mulighed for at se ilden fra alle vinkler. Ovnen er af h&oslash;j h&aring;ndv&aelig;rksm&aelig;ssig kvalitet, og betjenes nemt og enkelt.<br />
Leveres i sort og gr&aring; og med r&oslash;gafgang i top og bag.<br />
&nbsp;<br />
Produkt detaljer:</p>

<ul>
	<li>* Afstand til br&aelig;ndbart:
	<ul>
		<li>- Bag: 150 mm</li>
		<li>- Sider: 350 mm</li>
		<li>- Foran: 900 mm</li>
	</ul>
	</li>
	<li>* Nominel ydelse: 5 KW</li>
	<li>* Driftsomr&aring;de: 3 - 7 KW</li>
	<li>* Opvarmer 30 - 140 m2.</li>
	<li>* DS/EN 13240 godkendt.</li>
	<li>* 4 mm st&aring;l.</li>
	<li>* Br&aelig;ndkammerbund samt inderramme i l&aring;ge er udf&oslash;rt i st&oslash;bejern.</li>
	<li>* V&aelig;gt: 121 kg.&nbsp;</li>
</ul>
', 64, 1, 2)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (54, N'Morsø 6140', 9995, N'<p>Mors&oslash; 6140 er en tidl&oslash;s og minimalistisk ovn, hvor den store glasl&aring;ge giver fuldt udsyn til de dansende flammer.</p>

<p>Bag glasset har Mors&oslash; udviklet en forbr&aelig;ndingsteknik, som gennem forvarmet luft sikrer en h&oslash;jere temperatur i br&aelig;ndkammeret, hvor alle r&oslash;ggasser afbr&aelig;ndes. Det betyder, at du f&aring;r b&aring;de en mere milj&oslash;venlig forbr&aelig;nding og en bedre br&aelig;ndsels&oslash;konomi.<br />
Mors&oslash; 6140 er en lille konvektionsovn, der er perfekt, hvor varmebe-hovet ikke er stort, eller som supplement til anden varmeforsyning. Ovnen har et brugervenligt 1-grebs system til at h&aring;ndtere lufttilf&oslash;r-selen. Ovnen er let at betjene og vedligeholde med let udskiftning af sliddele.</p>

<p>Produkt detaljer:</p>

<ul>
	<li>* Konvektionssystem
	<ul>
		<li>- Bag: 170 mm</li>
		<li>- Sider: 360 mm</li>
		<li>- Foran: 754 mm</li>
	</ul>
	</li>
	<li>* Nominel ydelse: 4 KW</li>
	<li>* Driftsomr&aring;de: 3 - 7 KW</li>
	<li>* Opvarmer 45 - 90 m2.</li>
	<li>* DS/EN 13240 godkendt.</li>
	<li>* 4 mm st&aring;l.</li>
	<li>* Br&aelig;ndkammerbund samt inderramme i l&aring;ge er udf&oslash;rt i st&oslash;bejern.</li>
	<li>* V&aelig;gt: 138 kg.&nbsp;</li>
</ul>
', 65, 1, 3)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (55, N' Morsø 6148', 11995, N'<p>Mors&oslash; 6148 er en tidl&oslash;s og minimalistisk ovn, hvor den store glasl&aring;ge giver fuldt udsyn til de dansende flammer.</p>

<p>Bag glasset har Mors&oslash; udviklet en forbr&aelig;ndingsteknik, som gennem forvarmet luft sikrer en h&oslash;jere temperatur i br&aelig;ndkammeret, hvor alle r&oslash;ggasser afbr&aelig;ndes. Det betyder, at du f&aring;r b&aring;de en mere milj&oslash;venlig forbr&aelig;nding og en bedre br&aelig;ndsels&oslash;konomi.<br />
Mors&oslash; 6148 har et brugervenligt 1-grebs system til at h&aring;ndtere lufttilf&oslash;r-selen. Ovnen er let at betjene og vedligeholde med let udskiftning af sliddele.</p>

<p>Tekniske daProdukt detaljer:</p>

<ul>
	<li>* Konvektionssystem
	<ul>
		<li>- Bag: 170 mm</li>
		<li>- Sider: 360 mm</li>
		<li>- Foran: 754 mm</li>
	</ul>
	</li>
	<li>* Nominel ydelse: 6,5 KW</li>
	<li>* Driftsomr&aring;de: 7 - 10 KW</li>
	<li>* Opvarmer 45 - 110 m2.</li>
	<li>* DS/EN 13240 godkendt.</li>
	<li>* 4 mm st&aring;l.</li>
	<li>* Br&aelig;ndkammerbund samt inderramme i l&aring;ge er udf&oslash;rt i st&oslash;bejern.</li>
	<li>* V&aelig;gt: 162 kg.&nbsp;</li>
</ul>
', 66, 1, 3)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (56, N'Briket spand ', 195, N'<p>Briket spand med rustfri greb.<br />
L&aelig;ngde: 42 cm.<br />
Bredde: 21 cm.<br />
Dybde: 18 cm.<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;3,06</p>
', 67, 2, 6)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (57, N'Brændespand "dæk" ', 425, N'<p>Kraftig gummikurv med h&aring;ndtag.<br />
Lavet af gamle bild&aelig;k<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;2,5</p>
', 68, 2, 6)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (58, N'Quadrat ', 395, N'<p>Pulverlakeret, med integrerede h&aring;ndtag.<br />
Sort i 43 x 43 cm H&oslash;jde 29 cm.<br />
Gr&aring; i 38 x 38 cm H&oslash;jde 29 cm.<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;0,00</p>
', 69, 2, 6)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (59, N' "Avant" vægsæt ', 400, N'<p>Pejses&aelig;t til v&aelig;goph&aelig;ng. Med 3 stk. v&aelig;rkt&oslash;j.<br />
Skovl, kost og ild- og askerager.<br />
Rustfrit st&aring;l med sort eller gr&aring;t v&aelig;rkt&oslash;j.<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;4,08</p>
', 70, 2, 8)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (60, N'Cinas "Cylinder"', 550, N'<p>Pejses&aelig;t med ternet m&oslash;nster i sk&aelig;rm.<br />
Rustfri st&aring;l.<br />
S&aelig;ttet indeholder: skovl, kost, tang og ildrager.<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;5,00</p>
', 71, 2, 8)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (61, N'Cinas "Cube" ', 670, N'<p>V&aelig;gh&aelig;ngt pejses&aelig;t i sort.<br />
Pulverlakeret jern.<br />
S&aelig;ttet indeholder: skovl, kost og ildrager.</p>

<p>Bredde 32 cm.<br />
H&oslash;jde 56 cm.<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;8,00</p>
', 72, 2, 8)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (62, N'EasyFire', 70, N'<p>&quot;EasyFire&quot; opt&aelig;ndingblokke.<br />
Til hurtig og sikker opt&aelig;nding af br&aelig;ndeovn, pejs og grill.<br />
Lugtfri og forurener ikke. Br&aelig;ndtid ca. 13 min.</p>

<p>Leveres i pakke af 84 blokke, eller t&oslash;nde med 96 blokke.<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;0,60</p>
', 73, 2, 7)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (63, N' Pejse- og grillhandsker ', 250, N'<p>Passer b&aring;de til h&oslash;jre og venstre h&aring;nd.<br />
Leveres i varmeafvisende alu-handske eller i sort kraftigt skind med bomuldsfoer.<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;0,00</p>
', 74, 2, 7)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (64, N' Flydende ovnssværte ', 90, N'<p>Vandbaseret: Indeholder voks som ved opvarmning flyder sammen og giver en ensartet mat overflade.</p>

<p>Terpentinbaseret: Anvendes hvis man &oslash;nsker en st&aring;lblank changerende overflade som p&aring; gamle ovne. Indeholder graphit.<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;0,14</p>
', 75, 2, 9)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (65, N'Glasrens ', 100, N'<p>Glasrens er et effektivt middel som fjerner sod fra glasset i br&aelig;ndeovnen. Ved j&aelig;vnlig brug undg&aring;r man at skulle skrabe soden af glasset med risiko for at skade glasset.<br />
S&aelig;lges i pumpeflaske med sprayer a&acute; 500 ml.<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;0,60</p>
', 76, 2, 9)
INSERT [dbo].[Vare] ([V_Id], [Navn], [Pris], [Beskrivelse], [Fk_BilledeId], [Fk_KategoriId], [Fk_MaerkeId]) VALUES (66, N' Senotherm pejsemaling ', 150, N'<p>Senotherm pejsemaling<br />
Alle de kendte br&aelig;ndeovnsfabrikater bliver i dag malet med Senotherm. Brug derfor den samme maling n&aring;r ovnen skal friskes op eller m&aring;ske males om.<br />
&nbsp;<br />
&nbsp;<br />
Produkt detaljer:<br />
S&oslash;rg for god reng&oslash;ring af emnet og giv hellere to tynde lag end et tykt, s&aring; holder malingen bedre.<br />
Senotherm kan ogs&aring; bruges til grill, udst&oslash;dningsr&oslash;r og alle andre steder hvor en varmebestandig maling er p&aring;kr&aelig;vet.<br />
&nbsp;<br />
&nbsp;<br />
Anden beskrivelse:<br />
V&aelig;gt pr. enhed:&nbsp; &nbsp;<br />
&nbsp;0,40</p>
', 77, 2, 9)
SET IDENTITY_INSERT [dbo].[Vare] OFF
ALTER TABLE [dbo].[Nyheder] ADD  DEFAULT (getdate()) FOR [Dato]
GO
ALTER TABLE [dbo].[Tilbud]  WITH CHECK ADD  CONSTRAINT [FK_Tilbud_Vare] FOREIGN KEY([Fk_VareId])
REFERENCES [dbo].[Vare] ([V_Id])
GO
ALTER TABLE [dbo].[Tilbud] CHECK CONSTRAINT [FK_Tilbud_Vare]
GO
ALTER TABLE [dbo].[Vare]  WITH CHECK ADD  CONSTRAINT [FK_Vare_Billeder] FOREIGN KEY([Fk_BilledeId])
REFERENCES [dbo].[Billeder] ([B_Id])
GO
ALTER TABLE [dbo].[Vare] CHECK CONSTRAINT [FK_Vare_Billeder]
GO
ALTER TABLE [dbo].[Vare]  WITH CHECK ADD  CONSTRAINT [FK_Vare_Kategorier] FOREIGN KEY([Fk_KategoriId])
REFERENCES [dbo].[Kategorier] ([K_Id])
GO
ALTER TABLE [dbo].[Vare] CHECK CONSTRAINT [FK_Vare_Kategorier]
GO
ALTER TABLE [dbo].[Vare]  WITH CHECK ADD  CONSTRAINT [FK_Vare_Maerke] FOREIGN KEY([Fk_MaerkeId])
REFERENCES [dbo].[Maerke] ([M_Id])
GO
ALTER TABLE [dbo].[Vare] CHECK CONSTRAINT [FK_Vare_Maerke]
GO
