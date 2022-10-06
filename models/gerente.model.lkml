connection: "petroil_cliente"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
datagroup: petroil_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: petroil_default_datagroup

explore: vis_ventas {}
