-- 1. INSERTAR 10 EQUIPOS
INSERT INTO equipos (nombre, ciudad, año_fundacion) VALUES
('Real Madrid CF', 'Madrid', 1902),
('FC Barcelona', 'Barcelona', 1899),
('Atlético de Madrid', 'Madrid', 1903),
('Real Sociedad', 'San Sebastián', 1909),
('Athletic Club', 'Bilbao', 1898),
('Girona FC', 'Girona', 1930),
('Real Betis', 'Sevilla', 1907),
('Sevilla FC', 'Sevilla', 1890),
('Valencia CF', 'Valencia', 1919),
('Villarreal CF', 'Villarreal', 1923);

-- 2. INSERTAR 10 ESTADIOS (Relación 1:1/1:N con Equipos)
INSERT INTO estadios (nombre, capacidad, id_equipo) VALUES
('Santiago Bernabéu', 81044, 1),
('Estadi Olímpic Lluís Companys', 55926, 2),
('Cívitas Metropolitano', 70460, 3),
('Reale Arena', 39500, 4),
('San Mamés', 53289, 5),
('Montilivi', 14624, 6),
('Benito Villamarín', 60721, 7),
('Ramón Sánchez-Pizjuán', 43883, 8),
('Mestalla', 49430, 9),
('Estadio de la Cerámica', 23000, 10);

-- 3. INSERTAR JUGADORES
INSERT INTO jugadores (nombre, posicion, dorsal, id_equipo) VALUES
('Vinícius Júnior', 'Delantero', 7, 1),
('Jude Bellingham', 'Centrocampista', 5, 1),
('Lamine Yamal', 'Delantero', 27, 2),
('Robert Lewandowski', 'Delantero', 9, 2),
('Antoine Griezmann', 'Delantero', 7, 3),
('Koke Resurrección', 'Centrocampista', 6, 3),
('Takefusa Kubo', 'Delantero', 14, 4),
('Nico Williams', 'Delantero', 11, 5),
('Artem Dovbyk', 'Delantero', 9, 6),
('Isco Alarcón', 'Centrocampista', 22, 7),
('Jesús Navas', 'Defensa', 16, 8),
('Gerard Moreno', 'Delantero', 7, 10);

-- 4. INSERTAR PARTIDOS
INSERT INTO partidos (jornada, fecha, id_equipo_local, id_equipo_visitante, goles_local, goles_visitante) VALUES
(1, '2024-02-10', 1, 6, 4, 0), -- Real Madrid vs Girona
(1, '2024-02-11', 2, 8, 1, 0), -- Barça vs Sevilla
(2, '2024-02-17', 3, 10, 5, 0), -- Atleti vs Villarreal
(2, '2024-02-18', 9, 1, 2, 2); -- Valencia vs Real Madrid

-- 5. ESTADÍSTICAS (N:M entre Jugadores y Partidos)
INSERT INTO estadisticas_partido (id_partido, id_jugador, minutos_jugados, goles_marcados, tarjetas_amarillas) VALUES
(1, 1, 90, 1, 0), -- Vinicius gol contra Girona
(1, 2, 75, 2, 1), -- Bellingham 2 goles contra Girona
(2, 4, 90, 1, 0), -- Lewandowski gol contra Sevilla
(3, 5, 90, 2, 0); -- Griezmann 2 goles contra Villarreal

commit;