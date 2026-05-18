 -- 1. Tabla equipos
CREATE TABLE equipos (
    id_equipo SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    ciudad VARCHAR(100) NOT NULL,
    año_fundacion INTEGER CHECK (año_fundacion > 1850 AND año_fundacion <= EXTRACT(YEAR FROM CURRENT_DATE))
);

-- 2. Tabla estadios (Relación 1:1 o 1:N con equipos)
CREATE TABLE estadios (
    id_estadio SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    capacidad INTEGER CHECK (capacidad > 0),
    id_equipo INTEGER NOT NULL,
    CONSTRAINT fk_estadio_equipo FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo) ON DELETE CASCADE
);

-- 3. Tabla jugadores (Relación 1:N con equipos)
CREATE TABLE jugadores (
    id_jugador SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    posicion VARCHAR(50) NOT NULL CHECK (posicion IN ('Portero', 'Defensa', 'Centrocampista', 'Delantero')),
    dorsal INTEGER CHECK (dorsal >= 1 AND dorsal <= 99),
    id_equipo INTEGER,
    CONSTRAINT fk_jugador_equipo FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo) ON DELETE SET NULL
);

-- 4. Tabla partidos
CREATE TABLE partidos (
    id_partido SERIAL PRIMARY KEY,
    jornada INTEGER NOT NULL CHECK (jornada >= 1 AND jornada <= 38),
    fecha DATE NOT NULL,
    id_equipo_local INTEGER NOT NULL,
    id_equipo_visitante INTEGER NOT NULL,
    goles_local INTEGER DEFAULT 0 CHECK (goles_local >= 0),
    goles_visitante INTEGER DEFAULT 0 CHECK (goles_visitante >= 0),
    CONSTRAINT fk_partido_local FOREIGN KEY (id_equipo_local) REFERENCES equipos(id_equipo),
    CONSTRAINT fk_partido_visitante FOREIGN KEY (id_equipo_visitante) REFERENCES equipos(id_equipo),
    CONSTRAINT check_equipos_distintos CHECK (id_equipo_local != id_equipo_visitante)
);

-- 5. Tabla estadisticas_partido (Tabla intermedia para relación N:M entre jugadores y partidos)
CREATE TABLE estadisticas_partido (
    id_partido INTEGER NOT NULL,
    id_jugador INTEGER NOT NULL,
    minutos_jugados INTEGER DEFAULT 0 CHECK (minutos_jugados >= 0 AND minutos_jugados <= 120),
    goles_marcados INTEGER DEFAULT 0 CHECK (goles_marcados >= 0),
    tarjetas_amarillas INTEGER DEFAULT 0 CHECK (tarjetas_amarillas >= 0 AND tarjetas_amarillas <= 2),
    tarjeta_roja BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (id_partido, id_jugador), -- Clave primaria compuesta
    CONSTRAINT fk_estadistica_partido FOREIGN KEY (id_partido) REFERENCES partidos(id_partido) ON DELETE CASCADE,
    CONSTRAINT fk_estadistica_jugador FOREIGN KEY (id_jugador) REFERENCES jugadores(id_jugador) ON DELETE CASCADE
);

