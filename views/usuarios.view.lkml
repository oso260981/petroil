view: usuarios {
  derived_table: {
    sql: SELECT * FROM `eon-internal-bigquery.POC.Usuario_petroil`
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

  dimension: id_usuario {
    type: number
    sql: ${TABLE}.id_usuario ;;
  }

  dimension: correo {
    type: string
    sql: ${TABLE}.correo ;;
  }

  set: detail {
    fields: [id_cliente, nb_cliente, id_usuario, correo]
  }
}
