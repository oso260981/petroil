view: top_25 {
  derived_table: {
    sql: SELECT

      nb_cliente,
      nb_FamiliaProducto,
      fh_movimiento,
      nb_TipoDeNegocio,
      nb_Sucursal,
      nb_Zona,
      nb_GrupoCliente,
      nb_Vendedor,
      nb_Empresa,


      SUM(cantidadLitros) AS litros,
      RANK() OVER (PARTITION BY  nb_cliente ORDER BY SUM(cantidadLitros) DESC ) AS rank

      FROM `sipp-app.Tableros.Vis_Ventas`  AS ventas
      where nb_TipoFilial="NO Filial venta" and nb_cliente not in ("CLIENTES PUBLICO EN GENERAL") and nb_FamiliaProducto in ("Asfaltos","Diesel","Combustoleos","Lubricantes","IFO","Gasolinas")
      GROUP BY
      nb_cliente,
      nb_FamiliaProducto,
      fh_movimiento,
      nb_TipoDeNegocio,
      nb_Sucursal,
      nb_Zona,
      nb_GrupoCliente,
      nb_Vendedor,
      nb_Empresa
      order by 10 desc
      ;;
  }




  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: nb_cliente {
    type: string
    sql: ${TABLE}.nb_cliente ;;
  }

  dimension: nb_familia_producto {
    label: "Familia Producto"
    type: string
    sql: ${TABLE}.nb_FamiliaProducto ;;
  }

  dimension: fh_movimiento {
    type: string
    sql: ${TABLE}.fh_movimiento ;;
  }

  dimension: nb_tipo_de_negocio {
    type: string
    sql: ${TABLE}.nb_TipoDeNegocio ;;
  }

  dimension: nb_sucursal {
    type: string
    sql: ${TABLE}.nb_Sucursal ;;
  }

  dimension: nb_zona {
    type: string
    sql: ${TABLE}.nb_Zona ;;
  }

  dimension: nb_grupo_cliente {
    type: string
    sql: ${TABLE}.nb_GrupoCliente ;;
  }

  dimension: nb_vendedor {
    type: string
    sql: ${TABLE}.nb_Vendedor ;;
  }

  dimension: nb_empresa {
    type: string
    sql: ${TABLE}.nb_Empresa ;;
  }

  dimension: litros {
    type: number
    sql: ${TABLE}.litros ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  measure: Litros_total {
    type: sum
    sql: ${litros} ;;
    value_format:"#,##0.00"
    drill_fields: [detail*]

  }


  measure: rank_total {
    type: number
    sql: ${rank} ;;

    drill_fields: [detail*]

  }



  measure: topLitros {
    type: sum
    sql: case when ${rank} <=25 then ${litros}  end ;;
    value_format:"#,##0.00"
    drill_fields: [detail*]

  }





  dimension_group: created {

    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: CAST(${TABLE}.fh_movimiento AS TIMESTAMP) ;;
  }


  set: detail {
    fields: [
      nb_cliente,
      fh_movimiento,
      nb_tipo_de_negocio,
      nb_sucursal,
      nb_zona,
      nb_grupo_cliente,
      nb_vendedor,
      nb_empresa,
      litros,
      rank
    ]
  }
}
