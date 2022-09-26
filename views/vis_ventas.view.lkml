view: vis_ventas {
  derived_table: {
    sql: SELECT *,ROW_NUMBER() OVER(
       ORDER BY nb_Cliente) AS RowNum FROM `sipp-app.Tableros.Vis_Ventas` where nb_TipoFilial="NO Filial venta" and nb_cliente !="CLIENTES PUBLICO EN GENERAL " and nb_FamiliaProducto in ("Asfaltos","Diesel","Combustoleos","Lubricantes","IFO","Gasolinas")
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  dimension: is_top_10 {
   type: yesno
    sql:
    exists(
      select *
      from (
        select nb_cliente,sum(cantidadLitros)
        from `sipp-app.Tableros.Vis_Ventas`
        where nb_TipoFilial="NO Filial venta" and nb_cliente !="CLIENTES PUBLICO EN GENERAL " and nb_FamiliaProducto in ("Asfaltos","Diesel","Combustoleos","Lubricantes","IFO","Gasolinas")
        and ((( CAST(fh_movimiento AS TIMESTAMP)  ) >= (TIMESTAMP({% date_start created_date %})) AND ( CAST(fh_movimiento AS TIMESTAMP)  ) < (TIMESTAMP({% date_end created_date %}))))
        group by nb_cliente
        order by sum(cantidadLitros) desc
        limit 10
      ) top_10
       where ${nb_cliente} = top_10.nb_cliente
    ) ;;
  }

  dimension: is_top_25 {
    type: yesno
    sql:
    exists(
      select *
      from (
        select nb_cliente,sum(cantidadLitros)
        from `sipp-app.Tableros.Vis_Ventas`
        where nb_TipoFilial="NO Filial venta" and nb_cliente !="CLIENTES PUBLICO EN GENERAL " and nb_FamiliaProducto in ("Asfaltos","Diesel","Combustoleos","Lubricantes","IFO","Gasolinas")
        and ((( CAST(fh_movimiento AS TIMESTAMP)  ) >= (TIMESTAMP({% date_start created_date %})) AND ( CAST(fh_movimiento AS TIMESTAMP)  ) < (TIMESTAMP({% date_end created_date %}))))
        group by nb_cliente
        order by sum(cantidadLitros) desc
        limit 25
      ) top_25
       where ${nb_cliente} = top_25.nb_cliente
    ) ;;
  }


  dimension: RowNum {
    type: number
    sql: ${TABLE}.RowNum ;;
  }

  dimension: im_iva {
    type: number
    sql: ${TABLE}.im_Iva ;;
  }

  dimension: nu_dia {
    type: number
    sql: ${TABLE}.nu_Dia ;;
  }

  dimension: nu_mes {
    type: number
    sql: ${TABLE}.nu_Mes ;;
  }

  dimension: nb_pais {
    type: string
    sql: ${TABLE}.nb_Pais ;;
  }

  dimension: nb_zona {
    type: string
    sql: ${TABLE}.nb_Zona ;;
  }

  dimension: nu_anio {
    type: number
    sql: ${TABLE}.nu_Anio ;;
  }

  dimension: im_total {
    type: number
    sql: ${TABLE}.im_Total ;;
  }

  dimension: nb_estado {
    label: "Estado"
    type: string

    sql: ${TABLE}.nb_Estado ;;

  }

  dimension: de_estatus {
    type: string
    sql: ${TABLE}.de_Estatus ;;
  }

  dimension: id_cliente {
    type: number
    sql: ${TABLE}.id_Cliente ;;
  }

  dimension: nb_cliente {
    label: "Cliente"
    type: string
    sql: ${TABLE}.nb_Cliente ;;
  }

  dimension: nb_empresa {
    type: string
    sql: ${TABLE}.nb_Empresa ;;
  }

  dimension: fl_remision {
    type: string
    sql: ${TABLE}.fl_Remision ;;
  }

  dimension: id_producto {
    type: number
    sql: ${TABLE}.id_Producto ;;
  }

  dimension: id_remision {
    type: number
    sql: ${TABLE}.id_Remision ;;
  }

  dimension: id_vendedor {
    type: number
    sql: ${TABLE}.id_Vendedor ;;
  }

  dimension: im_subtotal {
    type: number
    sql: ${TABLE}.im_Subtotal ;;
  }

  dimension: nb_estacion {
    type: string
    sql: ${TABLE}.nb_Estacion ;;
  }

  dimension: nb_producto {
    type: string
    sql: ${TABLE}.nb_Producto ;;
  }

  dimension: nb_sucursal {
    label: "Sucursal"
    type: string
    sql: ${TABLE}.nb_Sucursal ;;


    drill_fields: [created_month,Litros]

  }

  dimension: nb_vendedor {
    type: string
    sql: ${TABLE}.nb_Vendedor ;;
  }

  dimension: nu_estacion {
    type: string
    sql: ${TABLE}.nu_Estacion ;;
  }

  dimension: fh_alta_grupo {
    type: string
    sql: ${TABLE}.fh_AltaGrupo ;;
  }

  dimension: fh_documento {
    type: string
    sql: ${TABLE}.fh_Documento ;;
  }

  dimension: id_ejercicio {
    type: number
    sql: ${TABLE}.id_Ejercicio ;;
  }

  dimension: im_descuento {
    type: number
    sql: ${TABLE}.im_Descuento ;;
  }

  dimension: nb_municipio {
    type: string
    sql: ${TABLE}.nb_Municipio ;;
  }

  dimension: fh_movimiento {
     type: date

    sql: CAST(CAST(${TABLE}.fh_movimiento AS TIMESTAMP) AS DATE)    ;;
  }


  dimension_group: created {
    label: "Periodo"
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      month_name,
      year
    ]
    sql: CAST(${TABLE}.fh_movimiento AS TIMESTAMP) ;;

  }

  dimension: fl_movimiento {
    type: string
    sql: ${TABLE}.fl_Movimiento ;;
  }

  dimension: nb_tipo_filial {
    type: string
    sql: ${TABLE}.nb_TipoFilial ;;
  }

  dimension: cantidad_litros {
    type: number
    sql: ${TABLE}.cantidadLitros ;;
  }

  dimension: cliente_activo {
    type: string
    sql: ${TABLE}.cliente_Activo ;;
  }

  dimension: de_tipo_cliente {
    type: string
    sql: ${TABLE}.de_TipoCliente ;;
  }

  dimension: fh_alta_cliente {
    type: string
    sql: ${TABLE}.fh_AltaCliente ;;
  }

  dimension: im_retenciones {
    type: number
    sql: ${TABLE}.im_Retenciones ;;
  }

  dimension: sn_combustible {
    type: yesno
    sql: ${TABLE}.sn_Combustible ;;
  }

  dimension: id_detalle_venta {
    type: number
    sql: ${TABLE}.id_DetalleVenta ;;
  }

  dimension: id_grupo_cliente {
    type: number
    sql: ${TABLE}.id_GrupoCliente ;;
  }

  dimension: nb_grupo_cliente {
    type: string
    sql: ${TABLE}.nb_GrupoCliente ;;
  }

  dimension: nb_tipo_producto {
    type: string
    sql: ${TABLE}.nb_TipoProducto ;;
  }

  dimension: id_tipo_de_negocio {
    type: number
    sql: ${TABLE}.id_tipoDeNegocio ;;
  }

  dimension: nb_tipo_de_negocio {
    type: string
    sql: ${TABLE}.nb_TipoDeNegocio ;;
  }

  dimension: de_tipo_movimiento {
    type: string
    sql: ${TABLE}.de_TipoMovimiento ;;
  }

  dimension: fl_folio_documento {
    type: string
    sql: ${TABLE}.fl_FolioDocumento ;;
  }

  dimension: im_precio_unitario {
    type: number
    sql: ${TABLE}.im_precioUnitario ;;
  }

  dimension: nb_tipo_de_estacion {
    type: string
    sql: ${TABLE}.nb_TipoDeEstacion ;;
  }

  dimension: sn_contar_estacion {
    type: number
    sql: ${TABLE}.sn_ContarEstacion ;;
  }

  dimension: sn_pertenece_grupo {
    type: string
    sql: ${TABLE}.sn_PerteneceGrupo ;;
  }

  dimension: cliente_suspendido {
    type: string
    sql: ${TABLE}.cliente_Suspendido ;;
  }

  dimension: nb_familia_producto {
    label: "Familia Producto"
    type: string
    sql: ${TABLE}.nb_FamiliaProducto ;;
  }

  dimension: nb_sector_economico {
    type: string
    sql: ${TABLE}.nb_SectorEconomico ;;
  }

  dimension: de_tipo_clientegrupo {
    type: string
    sql: ${TABLE}.de_TipoClientegrupo ;;
  }

  dimension: nb_vendedor_heredado {
    type: string
    sql: ${TABLE}.nb_VendedorHeredado ;;
  }

  dimension: fh_ultima_compra_grupo {
    type: string
    sql: ${TABLE}.fh_UltimaCompraGrupo ;;
  }

  dimension: fh_primera_compra_grupo {
    type: string
    sql: ${TABLE}.fh_PrimeraCompraGrupo ;;
  }

  dimension: nb_sub_sector_economico {
    type: string
    sql: ${TABLE}.nb_SubSectorEconomico ;;
  }

  dimension: fh_ultima_compra_cliente {
    type: string
    sql: ${TABLE}.fh_UltimaCompraCliente ;;
  }

  dimension: fh_primera_compra_cliente {
    type: string
    sql: ${TABLE}.fh_PrimeraCompraCliente ;;
  }

  dimension: nb_familia_tablero_ventas {
    type: string
    sql: ${TABLE}.nb_FamiliaTableroVentas ;;
    drill_fields: [created_month,Litros]

  }

  dimension: nb_tipo_vendedor_heredado {
    type: string
    sql: ${TABLE}.nb_TipoVendedorHeredado ;;
  }

  dimension: nu_orden_geografico_plaza {
    type: number
    sql: ${TABLE}.nu_OrdenGeograficoPlaza ;;
  }

  dimension: fh_primero_compra_grupo_plaza {
    type: string
    sql: ${TABLE}.fh_PrimeroCompraGrupoPlaza ;;
  }

  dimension: nb_abreviatura_tipo_estacion {
    type: string
    sql: ${TABLE}.nb_AbreviaturaTipoEstacion ;;
  }

  dimension: nu_orden_impresion_estaciones {
    type: number
    sql: ${TABLE}.nu_OrdenImpresionEstaciones ;;
  }

  dimension: _airbyte_ab_id {
    type: string
    sql: ${TABLE}._airbyte_ab_id ;;
  }

  dimension_group: _airbyte_emitted_at {
    type: time
    sql: ${TABLE}._airbyte_emitted_at ;;
  }





  measure: Litros {
    type: sum
    sql: ${cantidad_litros} ;;
    value_format:"#,##0.00"

    drill_fields: [created_month,Litros]

  }


  measure: Litros_map {
    label: "Litros"
    type: sum
    sql: ${cantidad_litros} ;;
    value_format:"#,##0.00"



  }









  dimension: top25_seleccion {

    type: number

    sql:
    CASE
      WHEN ${is_top_25} IS TRUE THEN ${cantidad_litros}
      ELSE 0
      END;;

  }


  measure: Litros_top25 {
    type: sum
    sql: ${top25_seleccion} ;;
  }





  measure: M_VentaTotal {
    type: sum
    sql: case when ${created_year} =  EXTRACT(YEAR FROM {% date_end created_date %}) then ${cantidad_litros} end ;;
    value_format:"#,##0.00"
    drill_fields: [created_month,Litros]
  }

  measure: LitrosYearAnterior {

    type: sum
    sql: case when ${created_year} =  EXTRACT(YEAR FROM {% date_end created_date %})-1 then ${cantidad_litros} end ;;
    value_format:"#,##0.00"
    drill_fields: [created_month,Litros]
  }

  measure: DifLitrosyearAnterior{
    label: "% Dif Año Anterior"
    type: number
    sql: (${M_VentaTotal}/  NULLIF( ${LitrosYearAnterior}, 0)  )-1 ;;
    value_format:"0.00%"
    drill_fields: [created_month,Litros]

    html: {% if value < 0  %}

    <p style="color: red;  font-size:100%; text-align:center">{{ rendered_value }}<img src="https://cdn-icons-png.flaticon.com/512/595/595007.png" height=15 width=15>  </p>

    {% elsif value >= 0 %}  <p style="color: green; font-size:100%; text-align:center">
    {{ rendered_value }}  <img src="https://cdn-icons-png.flaticon.com/512/1200/1200882.png" height=15 width=15></p>

    {% endif %};;


  }


  measure: M_ImporteTotal {

    type: sum
    sql: case when ${created_year} =  EXTRACT(YEAR FROM {% date_end created_date %}) then ${im_total} end ;;
    value_format:"#,##0.00"
    drill_fields: [created_month,Litros]
  }

  measure: PesYearAnterior {
    type: sum
    sql: case when ${created_year} =  EXTRACT(YEAR FROM {% date_end created_date %})-1 then ${im_total} end ;;
    value_format:"#,##0.00"
    drill_fields: [created_month,Litros]
  }

  measure: DifPesYearAnterior{
    label: "% Dif Año Anterior Dinero"
    type: number
    sql: (${M_ImporteTotal}/  NULLIF( ${PesYearAnterior}, 0)  )-1 ;;
    value_format:"0.00%"
    drill_fields: [created_month,Litros]

    html: {% if value < 0  %}

          <p style="color: red;  font-size:100%; text-align:center">{{ rendered_value }}<img src="https://cdn-icons-png.flaticon.com/512/595/595007.png" height=15 width=15>  </p>

          {% elsif value >= 0 %}  <p style="color: green; font-size:100%; text-align:center">
          {{ rendered_value }}  <img src="https://cdn-icons-png.flaticon.com/512/1200/1200882.png" height=15 width=15></p>

          {% endif %};;

    }



  measure: Importe_venta {
    label: "Importe de venta"
    type: sum
    sql: ${im_total} ;;
    value_format:"#,##0.00"
    drill_fields: [created_month,Litros]

  }


  dimension: field_name_1 {
    type: string
    sql: case when ${TABLE}.nb_estado="AGUASCALIENTES" then "21.88234"
              when ${TABLE}.nb_estado='BAJA CALIFORNIA' then '30.52815'
              when ${TABLE}.nb_estado='BAJA CALIFORNIA SUR' then '25.0321'
              when ${TABLE}.nb_estado='CAMPECHE' then '18.62675'
              when ${TABLE}.nb_estado='CHIAPAS' then '16.75973'
              when ${TABLE}.nb_estado='CHIHUAHUA' then '28.63528'
              when ${TABLE}.nb_estado='CIUDAD DE MÉXICO' then '19.42847'
              when ${TABLE}.nb_estado='COAHUILA DE ZARAGOZA' then '25.42321'
              when ${TABLE}.nb_estado='COLIMA' then '19.24997'
              when ${TABLE}.nb_estado='DURANGO' then '24.02032'
              when ${TABLE}.nb_estado='GUANAJUATO' then '20.52353'
              when ${TABLE}.nb_estado='HIDALGO' then '20.11697'
              when ${TABLE}.nb_estado='JALISCO' then '20.66682'
              when ${TABLE}.nb_estado='MICHOACÁN DE OCAMPO' then '19.70078'
              when ${TABLE}.nb_estado='MORELOS' then '18.9261'
              when ${TABLE}.nb_estado='MÉXICO' then '19.60492'
when ${TABLE}.nb_estado='NAYARIT' then '21.50951'
when ${TABLE}.nb_estado='NUEVO LEÓN' then '25.67507'
when ${TABLE}.nb_estado='OAXACA' then '17.06542'
when ${TABLE}.nb_estado='PUEBLA' then '19.03793'
when ${TABLE}.nb_estado='QUERÉTARO' then '20.58806'
when ${TABLE}.nb_estado='QUINTANA ROO' then '21.17429'
when ${TABLE}.nb_estado='SAN LUIS POTOSÍ' then '22.14982'
when ${TABLE}.nb_estado='SINALOA' then '23.2329'
when ${TABLE}.nb_estado='SONORA' then '29.1026'
when ${TABLE}.nb_estado='TAMAULIPAS' then '22.92157'
when ${TABLE}.nb_estado='TLAXCALA' then '19.31905'
when ${TABLE}.nb_estado='VERACRUZ DE IGNACIO DE LA LLAVE' then '19.18095'
when ${TABLE}.nb_estado='YUCATÁN' then '20.97537'
when ${TABLE}.nb_estado='ZACATECAS' then '22.76843'

      else "23.634501" end ;;

  }

  dimension: field_name_2 {
    type: string
     sql: case when ${TABLE}.nb_estado="AGUASCALIENTES" then "-102.28259"
               when ${TABLE}.nb_estado='BAJA CALIFORNIA' then '-115.92617'
               when ${TABLE}.nb_estado='BAJA CALIFORNIA SUR' then '-111.66256'
               when ${TABLE}.nb_estado='CAMPECHE' then '-90.13584'
               when ${TABLE}.nb_estado='CHIAPAS' then '-93.11308'
               when ${TABLE}.nb_estado='CHIHUAHUA' then '-106.08889'
               when ${TABLE}.nb_estado='CIUDAD DE MÉXICO' then '-99.12766'
               when ${TABLE}.nb_estado='COAHUILA DE ZARAGOZA' then '-101.0053'
               when ${TABLE}.nb_estado='COLIMA' then '-103.72714'
               when ${TABLE}.nb_estado='DURANGO' then '-104.65756'
               when ${TABLE}.nb_estado='GUANAJUATO' then '-100.8157'
               when ${TABLE}.nb_estado='HIDALGO' then '-98.73329'
               when ${TABLE}.nb_estado='JALISCO' then '-103.39182'
               when ${TABLE}.nb_estado='MICHOACÁN DE OCAMPO' then '-101.18443'
               when ${TABLE}.nb_estado='MORELOS' then '-99.23075'
              when ${TABLE}.nb_estado='MÉXICO' then '-99.06064'
when ${TABLE}.nb_estado='NAYARIT' then '-104.89569'
when ${TABLE}.nb_estado='NUEVO LEÓN' then '-100.31847'
when ${TABLE}.nb_estado='OAXACA' then '-96.72365'
when ${TABLE}.nb_estado='PUEBLA' then '-98.20346'
when ${TABLE}.nb_estado='QUERÉTARO' then '-100.38806'
when ${TABLE}.nb_estado='QUINTANA ROO' then '-86.84656'
when ${TABLE}.nb_estado='SAN LUIS POTOSÍ' then '-100.97916'
when ${TABLE}.nb_estado='SINALOA' then '-106.4062'
when ${TABLE}.nb_estado='SONORA' then '-110.97732'
when ${TABLE}.nb_estado='TAMAULIPAS' then '-98.07519'
when ${TABLE}.nb_estado='TLAXCALA' then '-98.19982'
when ${TABLE}.nb_estado='VERACRUZ DE IGNACIO DE LA LLAVE' then '-96.1429'
when ${TABLE}.nb_estado='YUCATÁN' then '-89.61696'
when ${TABLE}.nb_estado='ZACATECAS' then '-102.58141'


      else "-102.552784" end ;;

  }



  dimension: map {
    type: location
    sql_latitude:${field_name_1} ;;
    sql_longitude:${field_name_2} ;;

  }



  measure: Asfaltos {
    type: sum
    sql: case when ${nb_familia_producto} ="Asfaltos" then ${cantidad_litros}  end ;;
    value_format:"#,##0.00"
     drill_fields: [created_month,Litros]

  }

  measure: Combustoleos {
    type: sum
    sql: case when ${nb_familia_producto} ="Combustoleos" then ${cantidad_litros}  end ;;
    value_format:"#,##0.00"
    drill_fields: [created_month,Litros]

  }

  measure: Diesel {
    type: sum
    sql: case when ${nb_familia_producto} ="Diesel" then ${cantidad_litros}  end ;;
    value_format:"#,##0.00"
     drill_fields: [created_month,Litros]

  }

  measure: Gasolinas {
    type: sum
    sql: case when ${nb_familia_producto} ="Gasolinas" then ${cantidad_litros}  end ;;
    value_format:"#,##0.00"
     drill_fields: [created_month,Litros]

  }

  measure: IFO {
    type: sum
    sql: case when ${nb_familia_producto} ="IFO" then ${cantidad_litros}  end ;;
    value_format:"#,##0.00"
     drill_fields: [created_month,Litros]

  }

  measure: Lubricantes {
    type: sum
    sql: case when ${nb_familia_producto} ="Lubricantes" then ${cantidad_litros}  end ;;
    value_format:"#,##0.00"
     drill_fields: [created_month,Litros]

  }

  measure: grupo_Diesel{
    label: "Diesel"
    type: number
    sql: ${Diesel}+${Lubricantes} ;;
    value_format:"#,##0.00"
    drill_fields: [created_month,Litros]

  }

  measure: Total_litros {
    type: number
    sql: ${Asfaltos}+ ${Combustoleos}+${Diesel}+${Gasolinas}+${IFO}+${Lubricantes};;
    value_format:"#,##0.00"
     drill_fields: [created_month,Litros]

  }


  measure: Alcance {
    type: number
    sql: ${Litros_top25}/NULLIF (${Total_litros},0);;
    value_format:"0.00%"
    drill_fields: [created_month,Litros]
  }



  set: detail {
    fields: [
      im_iva,
      nu_dia,
      nu_mes,
      nb_pais,
      nb_zona,
      nu_anio,
      im_total,
      nb_estado,
      de_estatus,
      id_cliente,
      nb_cliente,
      nb_empresa,
      fl_remision,
      id_producto,
      id_remision,
      id_vendedor,
      im_subtotal,
      nb_estacion,
      nb_producto,
      nb_sucursal,
      nb_vendedor,
      nu_estacion,
      fh_alta_grupo,
      fh_documento,
      id_ejercicio,
      im_descuento,
      nb_municipio,
      fh_movimiento,
      fl_movimiento,
      nb_tipo_filial,
      cantidad_litros,
      cliente_activo,
      de_tipo_cliente,
      fh_alta_cliente,
      im_retenciones,
      sn_combustible,
      id_detalle_venta,
      id_grupo_cliente,
      nb_grupo_cliente,
      nb_tipo_producto,
      id_tipo_de_negocio,
      nb_tipo_de_negocio,
      de_tipo_movimiento,
      fl_folio_documento,
      im_precio_unitario,
      nb_tipo_de_estacion,
      sn_contar_estacion,
      sn_pertenece_grupo,
      cliente_suspendido,
      nb_familia_producto,
      nb_sector_economico,
      de_tipo_clientegrupo,
      nb_vendedor_heredado,
      fh_ultima_compra_grupo,
      fh_primera_compra_grupo,
      nb_sub_sector_economico,
      fh_ultima_compra_cliente,
      fh_primera_compra_cliente,
      nb_familia_tablero_ventas,
      nb_tipo_vendedor_heredado,
      nu_orden_geografico_plaza,
      fh_primero_compra_grupo_plaza,
      nb_abreviatura_tipo_estacion,
      nu_orden_impresion_estaciones,
      _airbyte_ab_id,
      _airbyte_emitted_at_time


    ]
  }
}
