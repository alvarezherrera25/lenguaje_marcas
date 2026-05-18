SELECT json_agg(
    json_build_object(
        'jornada', p.jornada,
        'fecha', p.fecha,
        'equipo_local', el.nombre,
        'goles_local', p.goles_local,
        'goles_visitante', p.goles_visitante,
        'equipo_visitante', ev.nombre
    )
) AS partidos_json
FROM partidos p
JOIN equipos el ON p.id_equipo_local = el.id_equipo
JOIN equipos ev ON p.id_equipo_visitante = ev.id_equipo
ORDER BY p.jornada, p.fecha;
