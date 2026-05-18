SELECT json_agg(
    json_build_object(
        'jugador', j.nombre,
        'equipo', e.nombre,
        'goles_totales', stats.total_goles
    )
) AS goleadores_json
FROM jugadores j
JOIN equipos e ON j.id_equipo = e.id_equipo
JOIN (
    SELECT id_jugador, SUM(goles_marcados) as total_goles
    FROM estadisticas_partido
    GROUP BY id_jugador
    HAVING SUM(goles_marcados) > 0
) stats ON j.id_jugador = stats.id_jugador;
