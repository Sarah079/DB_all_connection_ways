USE [master]
GO
/****** Object:  Database [272Demo18]    Script Date: 2021/09/20 08:39:43 ******/
CREATE DATABASE [272Demo18]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'272Demo18', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\272Demo18.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'272Demo18_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\272Demo18_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [272Demo18] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [272Demo18].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [272Demo18] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [272Demo18] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [272Demo18] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [272Demo18] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [272Demo18] SET ARITHABORT OFF 
GO
ALTER DATABASE [272Demo18] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [272Demo18] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [272Demo18] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [272Demo18] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [272Demo18] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [272Demo18] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [272Demo18] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [272Demo18] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [272Demo18] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [272Demo18] SET  DISABLE_BROKER 
GO
ALTER DATABASE [272Demo18] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [272Demo18] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [272Demo18] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [272Demo18] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [272Demo18] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [272Demo18] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [272Demo18] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [272Demo18] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [272Demo18] SET  MULTI_USER 
GO
ALTER DATABASE [272Demo18] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [272Demo18] SET DB_CHAINING OFF 
GO
ALTER DATABASE [272Demo18] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [272Demo18] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [272Demo18] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [272Demo18] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [272Demo18] SET QUERY_STORE = OFF
GO
USE [272Demo18]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 2021/09/20 08:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CountryCode] [nvarchar](50) NULL,
	[IMG] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchScores]    Script Date: 2021/09/20 08:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchScores](
	[teamH] [int] NULL,
	[teamA] [int] NULL,
	[scoreH] [int] NULL,
	[scoreA] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SoccerTeam]    Script Date: 2021/09/20 08:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SoccerTeam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CountryCode] [nvarchar](50) NOT NULL,
	[Website] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SportsFans]    Script Date: 2021/09/20 08:39:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SportsFans](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[favSoccerTeam] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([id], [CountryCode], [IMG]) VALUES (1, N'za', 0x89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF40000034E4944415458C3ED96BD8E1C451485BF5BD33D3FEB45482059A40EFC0A84444844A46448443C8713841CF1467E002444820422214282C8607BB667BAAAEE7150553D3D3FBBDEC889B7A49EEE99A9AE7BEE39E7DE2A78180FE3431F8659C757CFE3C7572BFEBFD9DF39F9F79FBEBED7A2AFBFFBE6CEFFC3A36B7CFB86CF7FFEADEF803582E7DF7FC976972A2CC38055BFA0EFCA05F0F4E913CC0C33ABD3CA5DD27497C4F8EC87F23D263C253C8E20A196F57AC31F3F3E0358774007CE9F7FBFE4DFFF06C00A0033CCC2F40CC6B75F3C9902B5E06D341000F1D75F10C2BD04750997D3A6844F3EC5CB73D7012C17C6B04FC4E4600133B000E015C471C0D3E0EDB709444E20610DACC02A009760BFC34B68BA0A9F57432466A7246B98870AA206375D0C7C09082963755DA3C852522E776DB7789DDF550289294F002C8412588D8522C16DD99FB190136AB2D4CB00DC412ABED01C809CE422658139E6860587898502F22CD34BF40396D2CC1B0EAA06752FABE45CA4980318A33326C742C0AC0637073F647FEF916209A4F2A6C9271FE082B0209F02D8EF770CBB44088B22C1CCFDAA2D63B7DBDD6AC43903C330548D0D974A4508B27CAA8CCC8904FB5864907BA1BD56435DE7A8FEDFE50572C66ADD070997B07A953A8DA70C88E4624CC282908B105AE310160C9BCCF86E0096D2643E3501DDAB1CC2BAFEDC84318B3139849AAD3B34F73BD83D7AC1DC0353D7A966B0568A12741D9953132667CC659259CDB6023033745286B7019084C562429B5A74FDA866544CE7555024F059172C004498B2BFB40F5C6620150F5409D450B4CB97E45309C654643073E494160C6079AA865323DED61788B1D141ABA3030BC252241D339049D9493997F427F73719A6DBD1467469376C5550BA4FFB4D93259050CE27003C136324C60C6151037BED05A1769443D0BB6490845A239AA8AFDDA496648A91E833003D09CB7B3ACA3E600B2B403818F152F039803933A1EB4BF3A96F4AD59012EECEDEC510C201C0552F3621F2D1F5926EBD22F41B2C2CAA1C76B1F75F2AC9264178FCB8002AEA130A09B83B1E2337C38EA1EB0F001EAD9784977FD1AD56F4FB2B16FDAA527F4CF18B17CB7B6D05BBD7C3B934409618C69157DB1BBACD663A135E039F01D7EFF93CFA06F8A71C4A617D381BBCB791801D0FE3831F6F01EB9633534AB16AD90000000049454E44AE426082)
INSERT [dbo].[Images] ([id], [CountryCode], [IMG]) VALUES (2, N'fr', 0x89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF40000034E4944415458C3ED96BD8E1C451485BF5BD33D3FEB45482059A40EFC0A84444844A46448443C8713841CF1467E002444820422214282C8607BB667BAAAEE7150553D3D3FBBDEC889B7A49EEE99A9AE7BEE39E7DE2A78180FE3431F8659C757CFE3C7572BFEBFD9DF39F9F79FBEBED7A2AFBFFBE6CEFFC3A36B7CFB86CF7FFEADEF803582E7DF7FC976972A2CC38055BFA0EFCA05F0F4E913CC0C33ABD3CA5DD27497C4F8EC87F23D263C253C8E20A196F57AC31F3F3E0358774007CE9F7FBFE4DFFF06C00A0033CCC2F40CC6B75F3C9902B5E06D341000F1D75F10C2BD04750997D3A6844F3EC5CB73D7012C17C6B04FC4E4600133B000E015C471C0D3E0EDB709444E20610DACC02A009760BFC34B68BA0A9F57432466A7246B98870AA206375D0C7C09082963755DA3C852522E776DB7789DDF550289294F002C8412588D8522C16DD99FB190136AB2D4CB00DC412ABED01C809CE422658139E6860587898502F22CD34BF40396D2CC1B0EAA06752FABE45CA4980318A33326C742C0AC0637073F647FEF916209A4F2A6C9271FE082B0209F02D8EF770CBB44088B22C1CCFDAA2D63B7DBDD6AC43903C330548D0D974A4508B27CAA8CCC8904FB5864907BA1BD56435DE7A8FEDFE50572C66ADD070997B07A953A8DA70C88E4624CC282908B105AE310160C9BCCF86E0096D2643E3501DDAB1CC2BAFEDC84318B3139849AAD3B34F73BD83D7AC1DC0353D7A966B0568A12741D9953132667CC659259CDB6023033745286B7019084C562429B5A74FDA866544CE7555024F059172C004498B2BFB40F5C6620150F5409D450B4CB97E45309C654643073E494160C6079AA865323DED61788B1D141ABA3030BC252241D339049D9493997F427F73719A6DBD1467469376C5550BA4FFB4D93259050CE27003C136324C60C6151037BED05A1769443D0BB6490845A239AA8AFDDA496648A91E833003D09CB7B3ACA3E600B2B403818F152F039803933A1EB4BF3A96F4AD59012EECEDEC510C201C0552F3621F2D1F5926EBD22F41B2C2CAA1C76B1F75F2AC9264178FCB8002AEA130A09B83B1E2337C38EA1EB0F001EAD9784977FD1AD56F4FB2B16FDAA527F4CF18B17CB7B6D05BBD7C3B934409618C69157DB1BBACD663A135E039F01D7EFF93CFA06F8A71C4A617D381BBCB791801D0FE3831F6F01EB9633534AB16AD90000000049454E44AE426082)
INSERT [dbo].[Images] ([id], [CountryCode], [IMG]) VALUES (3, N'ru', 0x89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF40000028C4944415458C3ED953D6FDB3010869F3B516E6C279D3B65EBD0AC1DB30728D03FDB35FF216B3A74C8DA254BDAD83145F13A889429FAA34D0B64690E302451E2BD0FEFCBF06AAFF6BF9B20E2BEDEDE76AA4A8CF14544B3D6878B8BD6012766C6F9F939663650898C3F554544B6C4693DDF03E33E331BEFF3738C715C2FFDDFDDDD019C38C0C518E9BA0E339B08AB2A6636429482255409518264F118E304444472B49D029397874E39C9DB33D76AF80C05E04A807D0EEADF6F8BAAFA4644767C9700BA0FE098E0318843DFD7BE7600FABE3FEA741F4C5D987FB2A7B4ACE9002E2F7BAEAE60B52AF3752802C753B09B49C14CC6AB192C16707D5D0040CF66F3C47A0DAA0D220DA08868DA487A9689E34ABAEA8898600DB30844CC7A62EC699A41B3028010143319857324A6F78700EA48E808354440318B88289B4DAC01222108DE838862469A015BF1E7036CD321A2C4D827DF91B615204E23D07582F765DF329EFEEF22304D4FCE3F08B3D99E14789F01EA134BEA65A9840F0158DA5342E4021CFC795F017CE1331FC37BD43FA022342268EA512DC6F33179ABAF79E2891053C07B33A21931BCE5866F7CCA003D80F748D70D4259B4EABD3A09459227EB56BC1FF7649F6688F784F48903868710B010B0C313A908F0340AB6D3887B07C2F6550853000FF8AEA3E93A6695E39D290748FED3DA03693BC568E3C8B514ED2E047C09F0D4B63C8A30730E296AA03CA954299012CE6C129969396E23138168C60658B52D74DD00B0592CF8319F333F3BC339C75C154D79D552CC6CCCF7BE86B422D798A149B4495701FA1078F49ED57A0DABD500D02C97DCA8F2C6394EDB9679D3D05485F5AF66A90BD6223C84805B2EE1FE1E41E41478079CF2B2F613F82E8838E0643B945ECC02F0C4ABFDF7F60B93F57C4220E0D88F0000000049454E44AE426082)
INSERT [dbo].[Images] ([id], [CountryCode], [IMG]) VALUES (4, N'na', 0x89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000005974944415458C3ED966B6C145518869F3333BBDDED6EE9C5765B2E224684508A5A53543018450C1A514CC018503126784142C04B4CBC44A33F8846F1128DC6282831048D128D445151825C938A72A9C8458B176A2D2DB65DBBDDB63B67CEE78F99EDCE6AFC638C7FE44B2633737272CEFBBEDFF77EE7C0A93815FFF75028E5D0B0D42D4FC6486706FFB585C7A4CA5879D72CA6D68F22B3B599CEA757A33BBB0170CA93E87486B9998311078821C293F7CEA77F2017C205255187886313711C006CDB4229B06DDB9F26C3D301F03C0F119830B68AC6097528ADC9ECDEC7086333EAEEDB86A75BA5319A973F061073000784A33F7572E2B70C3565594A221E9652E4BC289D7D099452A094FFCEEFA95461670411A1A6A2945BAF6964C2D82AB2FB0ED3F3CE47E8741F46046364188093AA22F8F3A9451D8B814197F2581F53CF68E3DCD33B716CD87FBC8E9DC7C6D1350C22AF8E0AD1F7E3AA69E399377312B69BA37BCD0632CD077C6822FE5CF11F137CA71E5F06F72CC1C933F8BD7F888A984BC3C876C655F560590A630CBB8E8D461B13624B480945AAB2943BE74DA5FECC6AB25F1DE4E4BA0F707B7E47A96073F1D511F139C71ACEA662C11CFABA3B7D35F2005CED613C8DF63C141A25608C66286770B509D54681FDB5974C64E1EC29D86E8E932FAF27BB7B6FC0D89F91FF460C563C46F9C2AB89354DA12DD3C58D9B57860088A03D43FF90A2A5AD121183E3C0C1F66A729A10009F7D6D5592150B2EA2E1AC14D92F5BE87C7D03BA3B0D8091E2D48808F1C649542CBA0E5356CA7BADDBD9F45333AD3DED6100869CEBD1D617E3B34363D9D93A06A5604847694FC7006F78C17933EBB965CE7944B54BD7736BC96CDF13CA75F1C6AA344ECDE2F9C4A737F243FA579EDAB5961FD31D94DA2560A438054383830C0CBAFCD0E1A02CAB20B71A4404EA4E4B72DF4D1733657C8ACCCE3D74AF7E072F601DF820B439C49A1AA85C7C3D5291646DCB26D61FDD82AB35C6186C2728CAB00243AE87D60641504A02DB59A0E0FACB27B378EEF944B44BD7AAD7E9FFA2F96F1B90958853B5640189194D1C4BFFCACA6DAB694DB783013106253064DCBF2AA08D90D306A514025896C5C8EA521EBC75068D134792DDBD8F132FAD439FEC0DF79E90029098761ED5CB6E465596F1E691CDACF9F6635CE3A14430222811C40811CB1976F17011BAAE47CEF540F9DD6EE195935932EF02A2DAA573E52B64B6EC4685D31C6A4A56224EF58A5B289B359DEF7B7FE1E1CF5FE4BBDE5F022B50B0A2113042D4E83F2920869CF69F5135491EBB632653EB4793DDF1151DCFBE81F75B2F4AFCB514C55D3839A389D4FD8BE1B4725E3DF4212FB76CF459237E9A45823E2488316020F71700F836BC61D66496DD7011259EA6E3D117C87CBA83A01C11552CBA934C907AE076465C7509477A8E73CFA6551CED6D2B728188F8AA890435E08F69F18A53505B19E79915B369AA1F4D76DB1E3A9E5E83E9EAC6520A13783FDCF993975E48EDC37761A7AA78A1E57D9EDFBF01D778050BC030EBFC98181F8C18F115F0420AAC5A7E05E78C1941FB43CFD11FB0B6002174002985954C50F7E852CAE75CC6E19E9F59BAF1090EF5FC4C91FF420A104A01A6F0D6C603CF14000C7CFD0DADCFBF85FEB19D885258015F090E1F1494CD9C46DDE3CBB16BAB78F6C0069EDAFB3639E3155F2E244FBD502862A4306604F10C2E4EB102EDAFBE4D6DCD286CC7C252168EB250CAC2526027138C7CC4677DA4F7384B373EE9B3568A122752CC36AC44DE0156BE06C46F56C6A0B410D18A5C1E808E47198839942462C4A225442D07475924A735925ABE08ABBA82370E7FC26B8736A1C5E3F4648D5F10F9F4840088082A9C8D702A3C410FE6C86506181087FE3C8048A2946FCD00254E94848278DCA6E2CAE9C41B26B0BD792BEF1EDBC6896C0F0A88FCD33B5A900E35944367FA4944E39C0C1A7E12A80392FFF17D340374F8975288157AC27F161A18E454FCEFE30F8AD8D5B71B03E0280000000049454E44AE426082)
INSERT [dbo].[Images] ([id], [CountryCode], [IMG]) VALUES (5, N'ug', 0x89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000003C24944415458C3ED963B68645518C77FDFB98F4976669D98E0265A045F11B793DDC5C6C24604C16D7C60A160E7066C6D04ED2CC4D8982A102C051B1B11D629C5464545D14D112D16C982715964E34EEECC7D9CCFE29C73E7CC6415144963BEE1CE39F775FEFFEFF53F174EECC44E4C2405B4DFEF2B702C478B25920A223D54FFD8DADA62381C46BC844EA743966564590640922488084992DCD697A66950559AA601A0AA2AAAAA623C1EA3AAED73DD6E97F5F57510399D0229C0EEEE2EFBFBFB530444A49DC7E3EC1C980208F3788CEF2F2F2F87699A02E4794E51145455F5AFC0FF2989A228C8F39CB2AA9CF75F5D867BD70E402B8C118CC18DE2E662040102EE8454009B05F5C9B68AB56055B1616E15E4804BCFC1234FF8F05B0BAA1542052AB85FE4A90AC8DF7B1F08B551507C9D81A8BAD7D5D59E6A85B53E07AE7800AD81DA030901B125D32E1A79EFB1248A02012C9CD2DE708702D4F83A7504F65ECFE93FAE3006239018C1E0D2304D6712F6E6E147F9A57F9A95D5FBC8AFFC48B2F3C5743A5A7EE2C28FD058C52AD051F63ECB015F030D301A8FD1A2C018213106E3C18CF36F2A25C9D90B9C79F9353E797F9BD5C7CEB374EE497EDB7E8BE6CA9793820BE028AA6081C65AAC550443431401ABA0D5189A0A693C9044E34CEE179F5DE7FAF51BFCBCB7C7F0D64DFABD79169E79851BDF7FDE460C4F42D4111275B5000ECB6A44E0A59D920BA70A86C3212282AA628C690B2A6E4B800F4735F7DC7D170F3EB0C6F6BB6F73E9FE2592175EE5F9EF86536D18BF6FAD6DD7EE76E1EB9D724220A8565996B7059CADFECDCDF7D8786783B36B0FB1B2B8C8F2991E6F6C6EB6EFCF6AC22CA13CCFDBEB2D81B22CFF9240601E6C3018D0340D179FBEC8C2E2126F7EF4319F0E064708CF0A53388F890A220B973FC87E3F7F6E0D2307181192C48B918049D4B5E28CF8CCCAC1448C224014DB08569DD6348D3A51D23BF8E6DB9F78EAC5EA4ED70516A044A87CD70750DF4B72B41DDB0AF34235DDFB91264878CCAF892294D4B10ED4B51322D51A4DA215344674EDA07114980865EBBD4C54708A4DB86741A91D6620706D23E3EAAA20874226422A2EFC226064A284613F088E1FD90B24DA07FC6155DB6B8D42AD4A73CA70ED6A3611A2B1C928AC90981431C6D58027208089545026F188F60A9D0E96B6CE623C41ABFE3985D2C2C864510AF2790ED3793AF33DE63A19596A48BD1C075061A608230213E58BA5D85D0BDE5BDC5F55D58C4663C6D91C70D31148E7BBFC70A87472434F13E6D2A40DFD7F65211D456939387498A10D7BC00AD03BE6AFD15BC0AFE23F4AE762513A26AB811127F6BFB73F011C460DC27C0042360000000049454E44AE426082)
INSERT [dbo].[Images] ([id], [CountryCode], [IMG]) VALUES (6, N'fr', 0xFFD8FFE000104A46494600010101000000000000FFE1002E4578696600004D4D002A00000008000240000003000000010073000040010001000000010000000000000000FFDB0043000A07070907060A0908090B0B0A0C0F19100F0E0E0F1E161712192420262523202322282D3930282A362B2223324432363B3D4040402630464B453E4A393F403DFFDB0043010B0B0B0F0D0F1D10101D3D2923293D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3D3DFFC000110800F901DA03012200021101031101FFC4001F0000010501010101010100000000000000000102030405060708090A0BFFC400B5100002010303020403050504040000017D01020300041105122131410613516107227114328191A1082342B1C11552D1F02433627282090A161718191A25262728292A3435363738393A434445464748494A535455565758595A636465666768696A737475767778797A838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F0100030101010101010101010000000000000102030405060708090A0BFFC400B51100020102040403040705040400010277000102031104052131061241510761711322328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728292A35363738393A434445464748494A535455565758595A636465666768696A737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F65A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2B36FBC49A369A48BED56CA061FC324EA0FE59AC993E25784A26C36BB6A4FF00B3B9BF90A00EA28AE593E2678464381AEDB0FA861FCC56959F8B740BF216D759B0958FF0ACEB9FCB3401AF45202194152083D0834B4005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140054379796F616AF73793C704118DCF248C02A8FA9ACDF12F892C3C2DA4497FA8C9B54711C63EF4ADFDD03D7F975AF9CBC63E39D4FC637A5EF1FCAB443FB9B58CFC883DFF00BC7DCFE181C5007A4F89FE39DBDB3BDBF872D45CB0E3ED3382A9F82F53F8E3E95E61ACF8E3C43AF337F686A970D1B1FF00548DB13FEF91C7E75CFD14005145140051451401A7A5789358D11C3699A95D5B63F8524214FD57A1FC6BD17C37F1D2FAD9921F105AADD45D0CF00D920FAAFDD3F862BC9E8A00FADB41F12E97E25B3FB4E937693A0FBCA38643E8C3A8AD5AF90B48D62FB41D423BDD32E5E0B88CF0CA7A8F423B83E86BE85F87BF11AD7C636DF66B8096FAAC6B97841E241FDE4F6F6EA3DC73401DC5145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400557BEBE834DB19EF2EE4115BC085DDCF602AC578EFC74F14B4715B787AD9F1E6013DCE0F6CFCABF9827F01401E75E36F17DD78CB5D92EE5252DA3CADB439E113FC4F526B9BA28A002BACF077C3CD5BC6327996CA20B15387BA907CBEE147F11FA71EA452FC3DF063F8CB5F5865DC9616F87B9917D3B28F73CFD0026BE98B3B382C2D22B5B4896182250891A0C05028038AD0FE0F786748453736CDA8CE072F72D95CFB28E3F3CD7576FA06936A816DF4BB28947409020FE95A14500519744D32E14ACDA759C8A7B340A7FA5733AC7C27F0B6AE8DB6C0594A7A496ADB31FF01FBBFA576945007CDDE34F857AB78551EEE03F6FD397932C6B868C7FB6BD87B8C8FA570B5F64BAABA1560194F041E86BC0BE2C7C3D4F0EDCFF006C6951EDD3677DB24407FA873E9FEC9FD0F1E9401E67562C6FAE34EBD86EECE568AE2160C8EA7904557A2803EA5F01F8BE1F1878763BB5C25D4788EE631FC2FEA3D8F51F976AE9ABE6BF84FE243A078D208A47C5A5FE2DE504F009FBA7F06C0FA135F4A5001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450021214124E00EA6BE4EF176B0DAF78AF52D44B12B34CDE5F3D1070BFF008E815F4CF8BEFCE99E10D5AED4E1E3B590A9F7DB81FA915F26D0014515A9E19D33FB63C4DA6D81195B8B84461FECE79FD33401F43FC30F0E2F873C196AAC9B6EAEC0B89C9EB961C0FC1703EB9AEC2902855000000E0014B4005145140051451400551D6B49835CD1AEF4DBA198AE632878E99E87EA0E0FE157A8A00F8EEFAD25B0BFB8B49C625B791A371E854E0FF2A82BACF89F6A2D7E236AE8A301E5127FDF4A18FEA4D727400E4768DD5D090CA7208F5AFAEB43BF1AAE85617DC7FA4C11CA7EA5413FAD7C875F51FC3590CBF0EF4563DA0DBCFB311FD2803A8A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2802A6A7A65AEB1A7CD637D179B6D30DB22648C8CE7B7D05735FF000A9FC1FF00F4075FFBFD27FF00155D851401C7FF00C2A7F07FFD01D7FEFF0049FF00C555AD2FE1DF86745D461BFD3F4C58AE6124A3F98E71918EE7D09AE9A8A0028A28A0028A28A0028A28A0028A2B37C43AD5BF87B42BBD4EE88F2EDE32C013F79BF857EA4E07E3401F397C50BA177F11B57653909288FF00EF950A7F506B93A9EF2EA5BEBC9EEA63BA59E4691CFA92727F9D4140057D4FF0F6DDADBE1FE8B1B0C37D955B1FEF7CDFD6BE61D3AC65D4F52B6B280132DC4AB12803BB1C0FE75F5E595B25959416B1FDC82358D7E8063FA5004D451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145155EFAFADB4DB392EAF66486DE21B9E47380A2801F717115ADBC93DC48B1431A96777380A07735F3B7C4CF1FC9E2FD405A58964D2ADDB3183C199BA6F3EDE83FC69DF117E25CFE2C99AC74F2F06908DC29E1A73FDE6F6F45FC4F3D380A0028A2B6BC2FE1ABDF156B70E9D62BCB7CD248465624EEC7FC3B9E2803B7F823E176BFD724D6E78FFD1AC72B1123EF4A47F4527F122BDEAB3B41D16D7C3DA35BE9B629B61817009EAC7BB1F7279AD1A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A2ABDF5F5BE9B6335E5E4A22B7814BBBB76028020D675AB2D034C9750D4A710DBC43963D49EC00EE4FA57CE3E39F8817FE32BD2198DBE9D1B661B607FF1E6F56FD076A6F8F7C7175E33D58C84B45A7C248B6833D07F78FAB1FD3A57274005145749E0EF04EA3E33D43C9B3411DB46479F72C3E58C7A7B9F6FE428028787FC3D7FE26D523B0D361F3246FBCDFC31AFF798F615F4A783BC1D61E0FD256D2D06F9DF0D3DC11F34ADFD00EC3B7D6A7F0C78574EF09694B65A6C58CF32CCDCBCADEA4FF4E82B6E800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800AF0DF8D9E316BCD407876CE4FF47B6C3DD107EFC9D42FD1473F53ED5ECFAA5FA697A55DDF4D8D96D0BCAD9FF6467FA57C8D7B772DFDF4F7770C5A59E4691D8F724E4FF3A00828A2B5BC33A05CF89B5EB6D2ED78799BE6723211072CC7E828035FC07E04BCF1A6A440DD0E9F091F68B8C74FF657D58FE9D4FBFD21A469165A169D158E9B02C16F10C2AA8EBEA4FA93EA699A1E8B67E1ED2A0D3B4F8847042B81EAC7BB1F524D68D00145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500145145001451450014514500717F172F8D8FC3AD436F0D394847E2C33FA035F3457BF7C779CC7E0DB48BFE7A5E2E7F05635E0340057B2FC02D254FF006AEACCB96056DA338E9FC4DFFB2D78D57D13F046DC43F0FD64C7335D48E4FD30BFFB2D007A151451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451400514514005145140051451401E51F1F49FEC0D294679B9638C7FB3FF00D7AF0CDA7D0FE55F643C68F80E8AC07A8CD37ECD07FCF18FFEF91401F1CED3E87F2AFA57E10204F86BA6F0412D2939FF00AE8D5D8FD9A0FF009E31FF00DF229EA8A8A15542A8E800C0A005A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A2BCE3E277C43D4BC17A858C1A7C16B2A5C44CEC6756241071C608AE27FE17CF887FE7CB4DFF00BF6FFF00C55007BED15E05FF000BE7C43FF3E5A6FF00DFB7FF00E2ABB5F865F10F53F1A6A57B6FA8DBDA44B0421D4C2AC0925B1CE49A00F48A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2803C37E3FF00FC86B48FFAF77FFD0ABC9ABD67E3FF00FC86B48FFAF77FFD0ABC9A800AF58F801FF21DD5BFEBD97FF42AF27AF58F801FF21DD5BFEBD97FF42A00F73A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A2800A28A280385F881F0DCF8E2F6D2E06A22D3ECF194C795BF764E7D45727FF000CFC7FE83C3FF017FF00B2AF66A2803C67FE19F8FF00D0787FE02FFF00655D5FC3FF0086C7C0F7D7772751177F6888478F2B66DC1CFA9AEEE8A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A28A0028A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A280128A5A2803FFFD9)
INSERT [dbo].[Images] ([id], [CountryCode], [IMG]) VALUES (7, N'fr', 0x89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF40000034E4944415458C3ED96BD8E1C451485BF5BD33D3FEB45482059A40EFC0A84444844A46448443C8713841CF1467E002444820422214282C8607BB667BAAAEE7150553D3D3FBBDEC889B7A49EEE99A9AE7BEE39E7DE2A78180FE3431F8659C757CFE3C7572BFEBFD9DF39F9F79FBEBED7A2AFBFFBE6CEFFC3A36B7CFB86CF7FFEADEF803582E7DF7FC976972A2CC38055BFA0EFCA05F0F4E913CC0C33ABD3CA5DD27497C4F8EC87F23D263C253C8E20A196F57AC31F3F3E0358774007CE9F7FBFE4DFFF06C00A0033CCC2F40CC6B75F3C9902B5E06D341000F1D75F10C2BD04750997D3A6844F3EC5CB73D7012C17C6B04FC4E4600133B000E015C471C0D3E0EDB709444E20610DACC02A009760BFC34B68BA0A9F57432466A7246B98870AA206375D0C7C09082963755DA3C852522E776DB7789DDF550289294F002C8412588D8522C16DD99FB190136AB2D4CB00DC412ABED01C809CE422658139E6860587898502F22CD34BF40396D2CC1B0EAA06752FABE45CA4980318A33326C742C0AC0637073F647FEF916209A4F2A6C9271FE082B0209F02D8EF770CBB44088B22C1CCFDAA2D63B7DBDD6AC43903C330548D0D974A4508B27CAA8CCC8904FB5864907BA1BD56435DE7A8FEDFE50572C66ADD070997B07A953A8DA70C88E4624CC282908B105AE310160C9BCCF86E0096D2643E3501DDAB1CC2BAFEDC84318B3139849AAD3B34F73BD83D7AC1DC0353D7A966B0568A12741D9953132667CC659259CDB6023033745286B7019084C562429B5A74FDA866544CE7555024F059172C004498B2BFB40F5C6620150F5409D450B4CB97E45309C654643073E494160C6079AA865323DED61788B1D141ABA3030BC252241D339049D9493997F427F73719A6DBD1467469376C5550BA4FFB4D93259050CE27003C136324C60C6151037BED05A1769443D0BB6490845A239AA8AFDDA496648A91E833003D09CB7B3ACA3E600B2B403818F152F039803933A1EB4BF3A96F4AD59012EECEDEC510C201C0552F3621F2D1F5926EBD22F41B2C2CAA1C76B1F75F2AC9264178FCB8002AEA130A09B83B1E2337C38EA1EB0F001EAD9784977FD1AD56F4FB2B16FDAA527F4CF18B17CB7B6D05BBD7C3B934409618C69157DB1BBACD663A135E039F01D7EFF93CFA06F8A71C4A617D381BBCB791801D0FE3831F6F01EB9633534AB16AD90000000049454E44AE426082)
INSERT [dbo].[Images] ([id], [CountryCode], [IMG]) VALUES (8, N'zxa', 0x89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000005464944415458C3ED967B88545518C07FE7CEBDB333BBAB56ABABAE5B5BE1AE22A2E0AB552BB06C535BCAFE3032D134942C51938AA0900A0A2948A99402859E88863DC94728A46CACA2B2AEEFDCDD7CACB1F95A35767666EFEB7CFD71EFDC9D49918868FFF1C0CC9973B973BEDFF7FE4C7A789937016E02F43C8052260BA7B97D1285D89ECBD2EAA9CC1D753FFEC573FCB9EE039CA307FF73A1B1E25EF8A90E26359CB24C2091509A7766CCA7D3B10168485FE4C11123A95CBB01FFF73378CDC711DF43C54C940265C40050E18592DDB58F0888EF0567CF437B1EDA711004095F3492490EBDF51A40C204CC8D950769B97A9286CB5DC1B50A76B41CE6F16163A9A91C41BC771FD25BBFC36B3D850AA52AA5F20024BC5D845098A0C3675A04AD25780F88DD56820EB04D1320693BCC2BF98D81BE62CBD5525C89E17B0EEB0FD5B3AFED24F3C73C40D9CC67B01BF792D9B1195C27D45A850059E1924B840A85071481482D82617721A6D51D844FAEE8E0B392CB4C19E232AAE82AEB2E9473CA2942198AE397DA7875C7469E185E4DEDA86AE2775591FE7113EEC913D73A212B2CBB02730460A22330BF3385969C2C4865842FB6A7D87DC861C1548FE5E5CD6CBEDA976FAF0CC4D1069ED67C726017F5679B595CFD3065739EA56B5F3DE96DDF228E9D2757F20F284085DA8B0E5C83E7655DD09D869EE7D1D0DCC58BAD36B31F4CF0D8688F71C557587DBE82E6AE22008E9C3FCB922D9F317BE4BD4C1F3791F8E021A4BE598FDB723C0AC448B58841078608BE4004F1FD7C0B00388E83E338B8AE62CD0F2EBB8F65583ABD9015E5C7F8FA72291BDACBB045E1DA3E1FEDDDC1CED3C77969622DE5F397E4699EBB673F5A6BB4D6F8BE8FEFFB880825D367C3F8F1DD00B66D93C964300C03A514F547E0604B27F36A12D48EC930CA3ACF7B7F54D09409ACD1D0FA1B4FB5BE9FEFEF282202DFABF0B96463210429B60AD8D5B83FDF02B66DE3791E22820A73CD71142B37D9D41DB278794621AB2A8EB2B1BD3F9F5F2CC3F18D1B169BC8E4A1EF1141B4468960FB5EE4AABC18701C07A514228261189139D35D82E75AC45018B8F8BE872BB11B498F820E4089A045A3422B58A223B808C0755D1CC7E92E324A912C502C989260D6A4386D6E8C852D7773A0B3779876DE3FB04098A2D978D0025A1337CC6B01B2419805185D69F1C6EC42CA4B145F5CE8CBC7E76F27AD6391E0A1FDCA58513393AA9201FF2A081B1B1BA9F97CFBB52E284A183C579BE4E9C971DA3C93B94D83D9DF790B4A055A5B319345D5352C1C3B994BED1916BFB29DBADD67733A0279002A2AC012A6A4D0ABD8A2A9E9F0B5161879A7F0D6DC0415FD149F5E28E5C3737790D631940AB41E565ACEAA697318DAAF8C1F7F6AE6CD77EB49A5ECEB3920AA01D1590408001C570795310B90882B9E7BC464D67D49DABC38B39AAAD8DBD927F8A3A189C74C964D9CC6E27B6AB8D89E61C10B5BD95977E63AFD30271125BB07DA2B74989E82EFFF0DE0EDB9853C3A21C6DAB65B5973A1823416281F140C2F1DC4EADA790C2B1DC40FDB9A59FE761D1D1DEEF5052BC96DCEA1E23AA73668C0C77541C25832019C7811CF9FA8624F47026599C4CD18F1789CA513A6B268DC43B45FB17976D93676FED20A4A61C58DB017E677C3FC82948531722C91CD0E0F2BE67703AC6CABA2C8EA4DFF020B3399A4AAAC9CD727CF6070C9007EAE6B65D547FB49675C060DEC453410A0A29F5973470795DB94B2FE97507B1BC7EE2051909386965588F1C7150A9209260DBD9B07FA0EE3D73D8759B9FD7B5A4E5E0EA6981BE4BCFA87A39888C6D036E2A6282A2C8800BCD35F6EAE048A010EF0152BFF9F7934057826D0059CEB8109D903BA4C44BC90A687C6F21E5E3701FE02078117C87837994F0000000049454E44AE426082)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (3, 6, 4, 2)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (5, 4, 2, 6)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (2, 7, 4, 6)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (2, 5, 4, 7)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (3, 6, 3, 0)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (7, 6, 0, 4)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (5, 3, 1, 7)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (6, 3, 7, 7)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (5, 4, 2, 0)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (5, 7, 6, 7)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (3, 7, 5, 3)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (3, 4, 1, 0)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (7, 6, 5, 4)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (7, 5, 7, 4)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (4, 3, 0, 4)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (2, 3, 5, 3)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (2, 7, 4, 3)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (6, 7, 7, 1)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (6, 7, 3, 2)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (2, 7, 0, 3)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (4, 3, 5, 5)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (5, 2, 1, 7)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (7, 4, 5, 3)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (6, 4, 0, 2)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (6, 4, 4, 1)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (2, 7, 1, 6)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (6, 5, 5, 0)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (7, 6, 2, 6)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (7, 5, 7, 5)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (5, 3, 5, 6)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (4, 3, 7, 0)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (7, 5, 7, 1)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (7, 4, 7, 1)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (4, 6, 0, 7)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (4, 6, 3, 0)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (3, 2, 5, 7)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (5, 6, 2, 1)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (5, 7, 4, 0)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (4, 5, 0, 6)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (7, 3, 0, 0)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (3, 5, 6, 2)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (2, 4, 0, 7)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (2, 3, 4, 1)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (5, 3, 0, 4)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (4, 2, 7, 2)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (3, 2, 7, 5)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (3, 5, 6, 6)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (2, 5, 0, 4)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (7, 5, 5, 7)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (3, 6, 1, 6)
INSERT [dbo].[MatchScores] ([teamH], [teamA], [scoreH], [scoreA]) VALUES (2, 7, 2, 7)
GO
SET IDENTITY_INSERT [dbo].[SoccerTeam] ON 

INSERT [dbo].[SoccerTeam] ([id], [Name], [CountryCode], [Website]) VALUES (2, N'OrlandoPirates', N'za', N'www.orlandopiratesfc.com')
INSERT [dbo].[SoccerTeam] ([id], [Name], [CountryCode], [Website]) VALUES (3, N'Swallows FC', N'za', N'www.swallowsfc.com')
INSERT [dbo].[SoccerTeam] ([id], [Name], [CountryCode], [Website]) VALUES (4, N'Olympique de Marseille', N'fr', N'https://www.om.fr/fr')
INSERT [dbo].[SoccerTeam] ([id], [Name], [CountryCode], [Website]) VALUES (5, N'FC Spartak Moscow', N'ru', N'https://spartak.com/')
INSERT [dbo].[SoccerTeam] ([id], [Name], [CountryCode], [Website]) VALUES (6, N'Vipers SC Buikwe', N'ug', N'https://viperssc.co.ug/about-team/')
INSERT [dbo].[SoccerTeam] ([id], [Name], [CountryCode], [Website]) VALUES (7, N'African Stars F.C.', N'na', N'https://en.wikipedia.org/wiki/African_Stars_F.C.')
SET IDENTITY_INSERT [dbo].[SoccerTeam] OFF
GO
SET IDENTITY_INSERT [dbo].[SportsFans] ON 

INSERT [dbo].[SportsFans] ([id], [Name], [Surname], [favSoccerTeam]) VALUES (3, N'Nataniel', N'la Roux', 3)
INSERT [dbo].[SportsFans] ([id], [Name], [Surname], [favSoccerTeam]) VALUES (4, N'Trevor', N'Moah', 4)
INSERT [dbo].[SportsFans] ([id], [Name], [Surname], [favSoccerTeam]) VALUES (5, N'Jacks', N'Devnarain', 5)
INSERT [dbo].[SportsFans] ([id], [Name], [Surname], [favSoccerTeam]) VALUES (6, N'Caster', N'Semenyi', 5)
INSERT [dbo].[SportsFans] ([id], [Name], [Surname], [favSoccerTeam]) VALUES (8, N'Peters', N'Mdoro', 7)
SET IDENTITY_INSERT [dbo].[SportsFans] OFF
GO
ALTER TABLE [dbo].[MatchScores]  WITH CHECK ADD FOREIGN KEY([teamA])
REFERENCES [dbo].[SoccerTeam] ([id])
GO
ALTER TABLE [dbo].[MatchScores]  WITH CHECK ADD FOREIGN KEY([teamH])
REFERENCES [dbo].[SoccerTeam] ([id])
GO
ALTER TABLE [dbo].[SportsFans]  WITH CHECK ADD FOREIGN KEY([favSoccerTeam])
REFERENCES [dbo].[SoccerTeam] ([id])
GO
USE [master]
GO
ALTER DATABASE [272Demo18] SET  READ_WRITE 
GO
