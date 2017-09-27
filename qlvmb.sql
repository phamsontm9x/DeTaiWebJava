USE [master]
GO
/****** Object:  Database [qlvemaybay]    Script Date: 9/27/2017 9:42:33 PM ******/
CREATE DATABASE [qlvemaybay]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'qlvemaybay', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\qlvemaybay.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'qlvemaybay_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\qlvemaybay_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [qlvemaybay] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [qlvemaybay].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [qlvemaybay] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [qlvemaybay] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [qlvemaybay] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [qlvemaybay] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [qlvemaybay] SET ARITHABORT OFF 
GO
ALTER DATABASE [qlvemaybay] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [qlvemaybay] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [qlvemaybay] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [qlvemaybay] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [qlvemaybay] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [qlvemaybay] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [qlvemaybay] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [qlvemaybay] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [qlvemaybay] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [qlvemaybay] SET  DISABLE_BROKER 
GO
ALTER DATABASE [qlvemaybay] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [qlvemaybay] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [qlvemaybay] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [qlvemaybay] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [qlvemaybay] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [qlvemaybay] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [qlvemaybay] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [qlvemaybay] SET RECOVERY FULL 
GO
ALTER DATABASE [qlvemaybay] SET  MULTI_USER 
GO
ALTER DATABASE [qlvemaybay] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [qlvemaybay] SET DB_CHAINING OFF 
GO
ALTER DATABASE [qlvemaybay] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [qlvemaybay] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [qlvemaybay] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'qlvemaybay', N'ON'
GO
USE [qlvemaybay]
GO
/****** Object:  Table [dbo].[ChuyenBay]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuyenBay](
	[MaCB] [nchar](10) NOT NULL,
	[NgayDi] [date] NULL,
	[NgayDen] [date] NULL,
	[SLHKHT] [int] NULL,
	[SLHKTD] [int] NULL,
	[MaTB] [nchar](10) NULL,
 CONSTRAINT [PK_Table1] PRIMARY KEY CLUSTERED 
(
	[MaCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiaDiem]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaDiem](
	[MaDD] [nchar](10) NOT NULL,
	[TenDD] [nvarchar](50) NULL,
	[TenSB] [nvarchar](50) NULL,
 CONSTRAINT [PK_Điaiem] PRIMARY KEY CLUSTERED 
(
	[MaDD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[KhachHang] [nvarchar](50) NULL,
	[NgayTao] [datetime] NOT NULL,
	[TrangThai] [nvarchar](50) NULL,
	[MaCB] [nchar](10) NOT NULL,
	[Gia] [int] NULL,
	[MaNV] [nchar](10) NULL,
	[CMND] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangHangKhong]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangHangKhong](
	[MaHHK] [nvarchar](50) NOT NULL,
	[TenHHK] [nvarchar](50) NULL,
 CONSTRAINT [PK_HangHangKhong] PRIMARY KEY CLUSTERED 
(
	[MaHHK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[HoTen] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoanNganHang]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanNganHang](
	[SoTaiKhoan] [nchar](13) NULL,
	[MatKhau] [nchar](6) NULL,
	[Tien] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoanQuanTri]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanQuanTri](
	[username] [nchar](10) NOT NULL,
	[password] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaiKhoanQuanTri] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoanUser]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoanUser](
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[CMND] [int] NULL,
	[SDT] [int] NULL,
	[DiaChi] [nvarchar](100) NULL,
 CONSTRAINT [PK_TaiKhoanUser] PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinHanhKhach]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinHanhKhach](
	[HoTen] [nvarchar](50) NULL,
	[CMND] [nchar](12) NOT NULL,
	[SDT] [int] NULL,
	[HanhLy] [int] NULL,
	[LoaiVe] [nvarchar](50) NULL,
	[MaCB] [nchar](10) NOT NULL,
	[DichVu] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThongTinHanhKhach] PRIMARY KEY CLUSTERED 
(
	[CMND] ASC,
	[MaCB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TuyenBay]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TuyenBay](
	[MaTB] [nchar](10) NOT NULL,
	[MaDi] [nchar](10) NULL,
	[MaDen] [nchar](10) NULL,
	[GioDi] [time](0) NULL,
	[GioDen] [time](0) NULL,
	[MaHHKg] [nvarchar](50) NULL,
	[GiaThuong] [nchar](10) NULL,
	[GiaVIP] [nchar](10) NULL,
 CONSTRAINT [PK_TuyenBay] PRIMARY KEY CLUSTERED 
(
	[MaTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NhanVien]
GO
ALTER TABLE [dbo].[ThongTinHanhKhach]  WITH CHECK ADD  CONSTRAINT [FK_ThongTinHanhKhach_ChuyenBay] FOREIGN KEY([MaCB])
REFERENCES [dbo].[ChuyenBay] ([MaCB])
GO
ALTER TABLE [dbo].[ThongTinHanhKhach] CHECK CONSTRAINT [FK_ThongTinHanhKhach_ChuyenBay]
GO
ALTER TABLE [dbo].[TuyenBay]  WITH CHECK ADD  CONSTRAINT [FK_TuyenBay_DiaDiem1] FOREIGN KEY([MaDi])
REFERENCES [dbo].[DiaDiem] ([MaDD])
GO
ALTER TABLE [dbo].[TuyenBay] CHECK CONSTRAINT [FK_TuyenBay_DiaDiem1]
GO
ALTER TABLE [dbo].[TuyenBay]  WITH CHECK ADD  CONSTRAINT [FK_TuyenBay_HangHangKhong] FOREIGN KEY([MaHHKg])
REFERENCES [dbo].[HangHangKhong] ([MaHHK])
GO
ALTER TABLE [dbo].[TuyenBay] CHECK CONSTRAINT [FK_TuyenBay_HangHangKhong]
GO
/****** Object:  StoredProcedure [dbo].[trutien]    Script Date: 9/27/2017 9:42:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[trutien]
@sotaikhoan nchar(13),
@matkhau nchar(6),
@sotien int
as
begin
update TaiKhoanNganHang set Tien=(Tien -@sotien) where SoTaiKhoan=@sotaikhoan and MatKhau=@matkhau
end

GO
USE [master]
GO
ALTER DATABASE [qlvemaybay] SET  READ_WRITE 
GO
