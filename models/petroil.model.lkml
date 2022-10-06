connection: "petroil_cliente"

# include all the views
include: "/views/**/*.view"

datagroup: petroil_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: petroil_default_datagroup

explore: vis_ventas {

  join: usuario_petroil {
    view_label: "usuario"
    type: left_outer
    sql_on: ${vis_ventas.id_cliente}=${usuario_petroil.id_cliente};;
    relationship: one_to_many
  }
}
explore: usuario_petroil {}
