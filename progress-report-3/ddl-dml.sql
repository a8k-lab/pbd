/**
 * Progress Report 3: DDL DML
 * Kelas: IF-47-01 PJJ
 * Kelompok 2 - MyReading
 * 
 * Anggota Kelompok:
 * - Abdul Malik - (103042310065)
 * - Ana Zulfia - (103042310080)
 * - Dimas Adriansyah - (103042310038)
 */


-- DDL
-- (Data Definition Language)

-- Table penggguna
CREATE TABLE
  pengguna (
    id INT NOT NULL AUTO_INCREMENT,
    nama VARCHAR(255) NOT NULL,
    usia INT NOT NULL,
    jenis_peminatan_buku VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
  );

-- Table akun
CREATE TABLE
  akun (
    id INT NOT NULL AUTO_INCREMENT,
    id_pengguna INT NOT NULL,
    nama VARCHAR(255) NOT NULL,
    kata_sandi VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_akun_pengguna FOREIGN KEY (id_pengguna) REFERENCES pengguna (id)
  );

-- Table genre
CREATE TABLE
  genre (
    id INT NOT NULL AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
  );

-- Table buku
CREATE TABLE
  buku (
    id INT NOT NULL AUTO_INCREMENT,
    id_genre INT NOT NULL,
    nama VARCHAR(255) NOT NULL,
    penulis VARCHAR(255) NOT NULL,
    penerbit VARCHAR(100) NOT NULL,
    jenis VARCHAR(100) NOT NULL,
    jum_halaman INT NOT NULL,
    jum_bagian INT NOT NULL,
    harga INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_buku_genre FOREIGN KEY (id_genre) REFERENCES genre (id)
  );

-- Table riwayat baca
CREATE TABLE
  riwayat_baca (
    id INT NOT NULL AUTO_INCREMENT,
    id_pengguna INT NOT NULL,
    id_buku INT NOT NULL,
    nilai INT NOT NULL,
    komentar TEXT NOT NULL,
    tanggal DATE NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_riwayat_baca_pengguna FOREIGN KEY (id_pengguna) REFERENCES pengguna (id),
    CONSTRAINT fk_riwayat_baca_buku FOREIGN KEY (id_buku) REFERENCES buku (id)
  );

-- Table status riwayat bayar
CREATE TABLE
  status_riwayat_bayar (
    id INT NOT NULL AUTO_INCREMENT,
    id_pengguna INT NOT NULL,
    id_buku INT NOT NULL,
    id_riwayat_baca INT NOT NULL,
    harga INT NOT NULL,
    tanggal_bayar DATE NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_status_riwayat_baca FOREIGN KEY (id_pengguna) REFERENCES riwayat_baca (id)
  );


-- DML
-- (Data Manipulation Language)
-- Master table = pengguna, akun, genre, dan buku
-- Transactional table = riwayat_baca, status_riwayat_bayar

-- Master table
-- Insert 10 data ke table pengguna
INSERT INTO
  pengguna (nama, usia, jenis_peminatan_buku)
VALUES
  ('Abdul', 18, 'Fiksi'),
  ('Ana', 20, 'Non-Fiksi'),
  ('Dimas', 21, 'Biografi'),
  ('Malik', 20, 'Teknologi'),
  ('Zulfia', 29, 'Komik'),
  ('Adriansyah', 27, 'Sains'),
  ('Erlangga', 24, 'Sejarah'),
  ('Rico', 26, 'Filosofi'),
  ('Sahrir', 23, 'Hukum'),
  ('Nando', 24, 'Ekonomi');

-- Insert 10 data ke table akun
INSERT INTO
  akun (id_pengguna, nama, kata_sandi)
VALUES
  (1, 'abdul01', 'password1'),
  (2, 'ana01', 'password2'),
  (3, 'dimas01', 'password3'),
  (4, 'malik01', 'password4'),
  (5, 'zulfia01', 'password5'),
  (6, 'adriansyah01', 'password6'),
  (7, 'erlangga01', 'password7'),
  (8, 'rico01', 'password8'),
  (9, 'sahrir01', 'password9'),
  (10, 'nando01', 'password10');

-- Insert 10 data ke table genre
INSERT INTO
  genre (nama)
VALUES
  ('Fiksi'),
  ('Non-Fiksi'),
  ('Biografi'),
  ('Teknologi'),
  ('Komik'),
  ('Sains'),
  ('Sejarah'),
  ('Filosofi'),
  ('Hukum'),
  ('Ekonomi');

-- Insert 10 data ke table buku
INSERT INTO
  buku (id_genre, nama, penulis, penerbit, jenis, jum_halaman, jum_bagian, harga)
VALUES
  (1, 'Pulang Pergi', 'Tere Liye', 'PT SABAK GRIP NUSANTARA', 'Fiksi', 200, 10, 50000),
  (2, 'Atomic Habits', 'James Clear', 'Penguin Books', 'Non-Fiksi', 300, 15, 60000),
  (3, 'Buya Hamka', 'Ahmad Fuadi', 'PT Falcon', 'Biografi', 250, 12, 55000), 
  (4, 'Refactoring', 'Martin Fowler', 'Addison-Wesley Professional', 'Teknologi', 400, 20, 70000), 
  (5, 'Jujutsu Kaisen', 'Gege Akutami', 'Addison-Wesley Professional', 'Komik', 150, 8, 45000), 
  (6, 'Kosmos', 'Carl Sagan', 'Random House', 'Sains', 350, 18, 65000),
  (7, 'The Martian', 'Andy Weir', 'Random House', 'Sejarah', 280, 14, 60000),
  (8, 'Filosofi Teras', 'Henry Manampiring', 'PT Kompas Gramedia', 'Filosofi', 320, 16, 67000),
  (9, 'Buku Hukum', 'Muhammad Yunus', 'PT Gramedia', 'Hukum', 300, 15, 64000),
  (10, 'Buku Ekonomi', 'Muhammad Yunus', 'PT Gramedia', 'Ekonomi', 310, 17, 66000);

-- Transactional table
-- Insert 20 data ke table riwayat_baca
INSERT INTO
  riwayat_baca (id_pengguna, id_buku, nilai, komentar, tanggal)
VALUES
  (1, 1, 8, 'Bagus sekali', '2023-01-01'),
  (2, 2, 7, 'Menarik', '2023-01-02'),
  (3, 3, 9, 'Sangat informatif', '2023-01-03'),
  (4, 4, 6, 'Biasa saja', '2023-01-04'),
  (5, 5, 8, 'Menghibur', '2023-01-05'),
  (6, 6, 7, 'Lumayan', '2023-01-06'),
  (7, 7, 9, 'Mendalam', '2023-01-07'),
  (8, 8, 8, 'Menginspirasi', '2023-01-08'),
  (9, 9, 6, 'Membosankan', '2023-01-09'),
  (10, 10, 7, 'Cukup bagus', '2023-01-10'),
  (1, 2, 8, 'Bagus', '2023-01-11'),
  (2, 3, 7, 'Menarik', '2023-01-12'),
  (3, 4, 9, 'Sangat informatif', '2023-01-13'),
  (4, 5, 6, 'Biasa saja', '2023-01-14'),
  (5, 6, 8, 'Menghibur', '2023-01-15'),
  (6, 7, 7, 'Lumayan', '2023-01-16'),
  (7, 8, 9, 'Mendalam', '2023-01-17'),
  (8, 9, 8, 'Menginspirasi', '2023-01-18'),
  (9, 10, 6, 'Membosankan', '2023-01-19'),
  (10, 1, 7, 'Cukup bagus', '2023-01-20');

-- Insert 20 data ke table status_riwayat_bayar
INSERT INTO
  status_riwayat_bayar (id_pengguna, id_buku, id_riwayat_baca, harga, tanggal_bayar)
VALUES
  (1, 1, 1, 50000, '2023-02-01'),
  (2, 2, 2, 60000, '2023-02-02'),
  (3, 3, 3, 55000, '2023-02-03'),
  (4, 4, 4, 70000, '2023-02-04'),
  (5, 5, 5, 45000, '2023-02-05'),
  (6, 6, 6, 65000, '2023-02-06'),
  (7, 7, 7, 60000, '2023-02-07'),
  (8, 8, 8, 67000, '2023-02-08'),
  (9, 9, 9, 64000, '2023-02-09'),
  (10, 10, 10, 66000, '2023-02-10'),
  (1, 2, 11, 60000, '2023-02-11'),
  (2, 3, 12, 55000, '2023-02-12'),
  (3, 4, 13, 70000, '2023-02-13'),
  (4, 5, 14, 45000, '2023-02-14'),
  (5, 6, 15, 65000, '2023-02-15'),
  (6, 7, 16, 60000, '2023-02-16'),
  (7, 8, 17, 67000, '2023-02-17'),
  (8, 9, 18, 64000, '2023-02-18'),
  (9, 10, 19, 66000, '2023-02-19'),
  (10, 1, 20, 50000, '2023-02-20');