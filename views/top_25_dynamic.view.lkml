view: top_25_dynamic {
  derived_table: {
    sql:
      select nb_Cliente as Cliente,
      sum(cantidadLitros) as condicion,
      rank() over (order by sum(cantidadLitros) desc) as rank
      from `sipp-app.Tableros.Vis_Ventas`  AS ventas
      where
        {% condition rank_date_filter %} vis_ventas.fh_movimiento {% endcondition %}
      group by 1
      ;;
  }

  filter: rank_date_filter {
    type: date
  }

  dimension: Cliente {
    primary_key: yes
    sql: ${TABLE}.Cliente ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: CantidadLitros {
    type: number
    sql: ${TABLE}.condicion ;;
  }

  measure: cantidad_Litros {
    type: sum
    sql: ${CantidadLitros} ;;
  }

#  derived_table: {
#    sql:
#    select
#    country
#    , sum(revenue) as duration
#    , rank() over (order by sum(revenue) desc) as rank
#    from orders
#    where
#      {% condition rank_date_filter %} orders.date {% endcondition %}
#    group by 1
#    ;;
#  }

#  filter: rank_date_filter {
#    type: date
#  }
#
#  dimension: country {
#    primary_key: yes
#    sql: ${TABLE}.country ;;
#  }

#  dimension: rank {
#    type: number
#    sql: ${TABLE}.rank ;;
#  }
#}
  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: top_25_dynamic {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
