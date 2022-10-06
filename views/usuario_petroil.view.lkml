view: usuario_petroil {
  derived_table: {
    sql: SELECT id_Cliente,nb_cliente,case when id_Cliente between 1 and 40 then 'maria.granados@grupo-eon.com'
                                  when id_Cliente between 41 and 100 then 'rperez@petroil.com.mx'
                                  when id_Cliente between 101 and 500 then 'luis.hernandez@grupo-eon.com' else 'israel.santos@eon.com.mx' end usuario FROM `sipp-app.Tableros.Vis_Ventas` group by id_Cliente,nb_cliente order by id_cliente LIMIT 100
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id_cliente {
    type: number
    sql: ${TABLE}.id_Cliente ;;
  }

  dimension: nb_cliente {
    type: string
    sql: ${TABLE}.nb_cliente ;;
  }

  dimension: usuario {
    type: string
    sql: ${TABLE}.usuario ;;
  }

  set: detail {
    fields: [id_cliente, nb_cliente, usuario]
  }
}
