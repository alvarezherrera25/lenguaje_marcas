SELECT json_agg(
    json_build_object(
        'equipo', e.nombre,
        'fundacion', e.año_fundacion,
        'jugadores', (
            SELECT json_agg(
                json_build_object(
                    'nombre', j.nombre,
                    'posicion', j.posicion,
                    'dorsal', j.dorsal
                )
            )
            FROM jugadores j
            WHERE j.id_equipo = e.id_equipo
        )
    )
) AS plantillas_json
FROM equipos e;
