create database s02_bt03;
use s02_bt03;
create table vattu(
	ma_vt int primary key auto_increment,
    ten_vt varchar(255)
);
create table phieu_xuat(
	so_px int primary key auto_increment,
    ngay_xuat datetime
);
create table phieu_xuat_chi_tiet(
	so_px int,
    ma_vt int,
    don_gia_xuat double,
    so_luong_xuat int,
    constraint fk_phieu01 foreign key (so_px) references phieu_xuat(so_px),
    constraint fk_phieu02 foreign key (ma_vt) references vattu(ma_vt)
);
create table phieu_nhap(
	so_pn int primary key auto_increment,
    ngay_nhap datetime
);
create table phieu_nhap_chi_tiet(
	so_pn int,
    ma_vt int,
    primary key(so_pn,ma_vt),
    don_gia_nhap double,
    so_luong_nhap int,
    constraint fk_nhap01 foreign key (so_pn) references phieu_nhap(so_pn),
    constraint fk_nhap02 foreign key (ma_vt) references vattu(ma_vt)
);
create table ngay_cung_cap(
	ma_ncc int primary key auto_increment,
    ten_ncc varchar(255),
    dia_chi varchar(255),
    so_dt varchar(11)
);
create table chi_tiet_don_hang(
	ma_vt int,
    so_dh int primary key,
    constraint fk_chi_tiet_don_hang foreign key (ma_vt) references vattu(ma_vt)
);
create table don_dat_hang(
	so_dh int,
    ma_ncc int,
    primary key(so_dh,ma_ncc),
    ngay_dh datetime,
    constraint fk_don01 foreign key (so_dh) references chi_tiet_don_hang(so_dh),
    constraint fk_don02 foreign key (ma_ncc) references ngay_cung_cap(ma_ncc)
);