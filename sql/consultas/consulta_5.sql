SELECT json_agg(row_to_json(resultado)) AS delanteros_json
FROM (
    SELECT j.nombre, j.dorsal, e.nombre AS equipo
    FROM jugadores j
    JOIN equipos e ON j.id_equipo = e.id_equipo
    WHERE j.posicion = 'Delantero'
) resultado;
