view: vis_ventas {
  derived_table: {
    sql: SELECT * FROM `sipp-app.Tableros.Vis_Ventas` where nb_TipoFilial="NO Filial venta" and nb_cliente !="CLIENTES PUBLICO EN GENERAL" and nb_FamiliaProducto in ("Asfaltos","Diesel","Combustoleos","Lubricantes","IFO","Gasolinas")
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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
    type: string
    map_layer_name: countries
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
    type: string
    sql: ${TABLE}.nb_Sucursal ;;
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
    drill_fields: [detail*]

  }

  measure: M_VentaTotal {
    type: sum
    sql: ${cantidad_litros} ;;
    value_format:"#,##0.00"
    drill_fields: [detail*]

  }


  measure: LitrosyearAnterior{
    type: sum
    sql: if(EXTRACT(DAY FROM ${created_raw}) <= EXTRACT(DAY FROM CURRENT_TIMESTAMP()), ${cantidad_litros},0) ;;

    filters: [created_date: "last year"]
  }

  measure: DifLitrosyearAnterior{
    type: number
    sql: (${M_VentaTotal}/  NULLIF( ${LitrosyearAnterior}, 0)  )-1 ;;
    value_format:"#,##0.00"
    drill_fields: [detail*]
  }





  measure: Importe_venta {
    label: "Importe de venta"
    type: sum
    sql: ${im_total} ;;
    value_format:"#,##0.00"
    drill_fields: [detail*]

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
