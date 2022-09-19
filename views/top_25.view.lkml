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
      RANK() OVER (ORDER BY SUM(cantidadLitros) DESC ) AS rank,
      ROW_NUMBER() OVER(ORDER BY nb_cliente) AS RowNum,


      FROM `sipp-app.Tableros.Vis_Ventas`  AS ventas
      where nb_TipoFilial="NO Filial venta" and nb_cliente not in ("CLIENTES PUBLICO EN GENERAL ") and nb_FamiliaProducto in ("Asfaltos","Diesel","Combustoleos","Lubricantes","IFO","Gasolinas")
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

    type: string
    sql: ${TABLE}.rank ;;
  }

  dimension: RowNum {

    type: number
    sql: ${TABLE}.RowNum ;;
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


  measure: Asfaltos {
    type: sum
    sql: case when ${nb_familia_producto} ="Asfaltos" then ${litros}  end ;;
    value_format:"#,##0.00"
    drill_fields: [detail*]

  }

  measure: Combustoleos {
    type: sum
    sql: case when ${nb_familia_producto} ="Combustoleos" then ${litros}  end ;;
    value_format:"#,##0.00"
    drill_fields: [detail*]

  }

  measure: Diesel {
    type: sum
    sql: case when ${nb_familia_producto} ="Diesel" then ${litros}  end ;;
    value_format:"#,##0.00"
    drill_fields: [detail*]

  }

  measure: Gasolinas {
    type: sum
    sql: case when ${nb_familia_producto} ="Gasolinas" then ${litros}  end ;;
    value_format:"#,##0.00"
    drill_fields: [detail*]

  }

  measure: IFO {
    type: sum
    sql: case when ${nb_familia_producto} ="IFO" then ${litros}  end ;;
    value_format:"#,##0.00"
    drill_fields: [detail*]

  }

  measure: Lubricantes {
    type: sum
    sql: case when ${nb_familia_producto} ="Lubricantes" then ${litros}  end ;;
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
