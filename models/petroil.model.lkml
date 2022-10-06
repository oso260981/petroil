connection: "petroil_cliente"

# include all the views
include: "/views/**/*.view"

datagroup: petroil_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: petroil_default_datagroup

explore: vis_ventas {}
explore: usuario_petroil {}
