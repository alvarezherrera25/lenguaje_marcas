SELECT json_agg(
    json_build_object(
        'id_equipo', e.id_equipo,
        'nombre_equipo', e.nombre,
        'ciudad', e.ciudad,
        'estadio', es.nombre,
        'capacidad', es.capacidad
    )
) AS equipos_json
FROM equipos e
JOIN estadios es ON e.id_equipo = es.id_equipo;
