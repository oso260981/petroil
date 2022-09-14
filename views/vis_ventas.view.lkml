view: vis_ventas {
  derived_table: {
    sql: SELECT * FROM `eon-internal-bigquery.POC.Ventas_petroil` where nb_TipoFilial="NO Filial venta"
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }




  dimension: nb_empresa {
    type: string
    sql: ${TABLE}.nb_Empresa ;;
  }

  dimension: nb_sucursal {
    type: string
    sql: ${TABLE}.nb_Sucursal ;;
  }

  dimension: id_ejercicio {
    type: number
    sql: ${TABLE}.id_Ejercicio ;;
  }

  dimension: nu_anio {
    type: number
    sql: ${TABLE}.nu_Anio ;;
  }

  dimension: nu_mes {
    type: number
    sql: ${TABLE}.nu_Mes ;;
  }

  dimension: nu_dia {
    type: number
    sql: ${TABLE}.nu_Dia ;;
  }

  dimension: id_detalle_venta {
    type: number
    sql: ${TABLE}.id_DetalleVenta ;;
  }

  dimension: nb_zona {
    type: string
    sql: ${TABLE}.nb_Zona ;;
  }

  dimension: de_tipo_movimiento {
    type: string
    sql: ${TABLE}.de_TipoMovimiento ;;
  }

  dimension: id_cliente {
    type: number
    sql: ${TABLE}.id_Cliente ;;
  }

  dimension: nb_cliente {
    type: string
    sql: ${TABLE}.nb_Cliente ;;
  }

  dimension: de_tipo_cliente {
    type: string
    sql: ${TABLE}.de_TipoCliente ;;
  }

  dimension: de_tipo_clientegrupo {
    type: string
    sql: ${TABLE}.de_TipoClientegrupo ;;
  }

  dimension: nu_estacion {
    type: string
    sql: ${TABLE}.nu_Estacion ;;
  }

  dimension: nb_estacion {
    type: string
    sql: ${TABLE}.nb_Estacion ;;
  }

  dimension: nb_tipo_de_estacion {
    type: string
    sql: ${TABLE}.nb_TipoDeEstacion ;;
  }

  dimension: fl_folio_documento {
    type: string
    sql: ${TABLE}.fl_FolioDocumento ;;
  }

  dimension: fl_remision {
    type: string
    sql: ${TABLE}.fl_Remision ;;
  }

  dimension: fl_movimiento {
    type: string
    sql: ${TABLE}.fl_Movimiento ;;
  }

  dimension: id_remision {
    type: number
    sql: ${TABLE}.id_Remision ;;
  }

  dimension: nb_familia_producto {
    type: string
    sql: ${TABLE}.nb_FamiliaProducto ;;
  }

  dimension: nb_producto {
    type: string
    sql: ${TABLE}.nb_Producto ;;
  }

  dimension: id_producto {
    type: number
    sql: ${TABLE}.id_Producto ;;
  }

  dimension: cantidad_litros {
    type: number
    sql: ${TABLE}.cantidadLitros ;;
  }

  dimension: im_precio_unitario {
    type: number
    sql: ${TABLE}.im_precioUnitario ;;
  }

  dimension: im_subtotal {
    type: number
    sql: ${TABLE}.im_Subtotal ;;
  }

  dimension: im_iva {
    type: number
    sql: ${TABLE}.im_Iva ;;
  }

  dimension: im_retenciones {
    type: number
    sql: ${TABLE}.im_Retenciones ;;
  }

  dimension: im_descuento {
    type: number
    sql: ${TABLE}.im_Descuento ;;
  }

  dimension: im_total {
    type: number
    sql: ${TABLE}.im_Total ;;
  }

  dimension: de_estatus {
    type: string
    sql: ${TABLE}.de_Estatus ;;
  }

  dimension: fh_documento {
    type: string
    sql: ${TABLE}.fh_Documento ;;
  }

  dimension: fh_movimiento {
    type: date
    datatype: date
    sql: ${TABLE}.fh_movimiento ;;
  }

  dimension: nb_tipo_de_negocio {
    type: string
    sql: ${TABLE}.nb_TipoDeNegocio ;;
  }

  dimension: nb_sector_economico {
    type: string
    sql: ${TABLE}.nb_SectorEconomico ;;
  }

  dimension: nb_sub_sector_economico {
    type: string
    sql: ${TABLE}.nb_SubSectorEconomico ;;
  }

  dimension: nb_pais {
    type: string
    sql: ${TABLE}.nb_Pais ;;
  }

  dimension: nb_estado {
    type: string
    sql: ${TABLE}.nb_Estado ;;
  }

  dimension: nb_municipio {
    type: string
    sql: ${TABLE}.nb_Municipio ;;
  }

  dimension: nb_vendedor {
    type: string
    sql: ${TABLE}.nb_Vendedor ;;
  }

  dimension: nb_tipo_filial {
    type: string
    sql: ${TABLE}.nb_TipoFilial ;;
  }

  dimension: sn_pertenece_grupo {
    type: number
    sql: ${TABLE}.sn_PerteneceGrupo ;;
  }

  dimension: sn_contar_estacion {
    type: number
    sql: ${TABLE}.sn_ContarEstacion ;;
  }

  dimension: nb_abreviatura_tipo_estacion {
    type: string
    sql: ${TABLE}.nb_AbreviaturaTipoEstacion ;;
  }

  dimension: nu_orden_impresion_estaciones {
    type: string
    sql: ${TABLE}.nu_OrdenImpresionEstaciones ;;
  }

  dimension: nu_orden_geografico_plaza {
    type: number
    sql: ${TABLE}.nu_OrdenGeograficoPlaza ;;
  }

  dimension: id_grupo_cliente {
    type: string
    sql: ${TABLE}.id_GrupoCliente ;;
  }

  dimension: nb_grupo_cliente {
    type: string
    sql: ${TABLE}.nb_GrupoCliente ;;
  }

  dimension_group: fh_alta_grupo {
    type: time
    sql: ${TABLE}.fh_AltaGrupo ;;
  }

  dimension_group: fh_alta_cliente {
    type: time
    sql: ${TABLE}.fh_AltaCliente ;;
  }

  dimension: id_vendedor {
    type: number
    sql: ${TABLE}.id_Vendedor ;;
  }

  dimension: cliente_activo {
    type: number
    sql: ${TABLE}.cliente_Activo ;;
  }

  dimension: cliente_suspendido {
    type: number
    sql: ${TABLE}.cliente_Suspendido ;;
  }

  dimension_group: fh_primera_compra_cliente {
    type: time
    sql: ${TABLE}.fh_PrimeraCompraCliente ;;
  }

  dimension_group: fh_ultima_compra_cliente {
    type: time
    sql: ${TABLE}.fh_UltimaCompraCliente ;;
  }

  dimension_group: fh_primera_compra_grupo {
    type: time
    sql: ${TABLE}.fh_PrimeraCompraGrupo ;;
  }

  dimension_group: fh_ultima_compra_grupo {
    type: time
    sql: ${TABLE}.fh_UltimaCompraGrupo ;;
  }

  dimension: nb_tipo_producto {
    type: string
    sql: ${TABLE}.nb_TipoProducto ;;
  }

  dimension_group: fh_primero_compra_grupo_plaza {
    type: time
    sql: ${TABLE}.fh_PrimeroCompraGrupoPlaza ;;
  }

  dimension: nb_tipo_vendedor_heredado {
    type: number
    sql: ${TABLE}.nb_TipoVendedorHeredado ;;
  }

  dimension: nb_vendedor_heredado {
    type: string
    sql: ${TABLE}.nb_VendedorHeredado ;;
  }

  dimension: sn_combustible {
    type: yesno
    sql: ${TABLE}.sn_Combustible ;;
  }

  dimension: nb_familia_tablero_ventas {
    type: string
    sql: ${TABLE}.nb_FamiliaTableroVentas ;;
  }

  dimension: id_tipo_de_negocio {
    type: number
    sql: ${TABLE}.id_tipoDeNegocio ;;
  }

  dimension: familia_de_producto {
    type: string
    sql: ${TABLE}.Familia_de_Producto ;;
  }

  dimension: gsucursal {
    type: string
    sql: ${TABLE}.GSucursal ;;
  }

  dimension: num_semana {
    type: number
    sql: ${TABLE}.num_Semana ;;
  }

  dimension: pais__estado__municipio {
    type: string
    sql: ${TABLE}.Pais__Estado__Municipio ;;
  }

  dimension: sucursal {
    type: string
    sql: ${TABLE}.Sucursal ;;
  }

  dimension: tipo_de_venta {
    type: string
    sql: ${TABLE}.Tipo_de_Venta ;;
  }

  measure: litros {
    type: sum
    sql:${cantidad_litros};;
  }

  set: detail {
    fields: [

      nb_sucursal,
      id_ejercicio,
      nu_anio,
      nu_mes,
      nu_dia,
      id_detalle_venta,
      nb_zona,
      de_tipo_movimiento,
      id_cliente,
      nb_cliente,
      de_tipo_cliente,
      de_tipo_clientegrupo,
      nu_estacion,
      nb_estacion,
      nb_tipo_de_estacion,
      fl_folio_documento,
      fl_remision,
      fl_movimiento,
      id_remision,
      nb_familia_producto,
      nb_producto,
      id_producto,
      cantidad_litros,
      im_precio_unitario,
      im_subtotal,
      im_iva,
      im_retenciones,
      im_descuento,
      im_total,
      de_estatus,
      fh_documento,
      fh_movimiento,
      nb_tipo_de_negocio,
      nb_sector_economico,
      nb_sub_sector_economico,
      nb_pais,
      nb_estado,
      nb_municipio,
      nb_vendedor,
      nb_tipo_filial,
      sn_pertenece_grupo,
      sn_contar_estacion,
      nb_abreviatura_tipo_estacion,
      nu_orden_impresion_estaciones,
      nu_orden_geografico_plaza,
      id_grupo_cliente,
      nb_grupo_cliente,
      fh_alta_grupo_time,
      fh_alta_cliente_time,
      id_vendedor,
      cliente_activo,
      cliente_suspendido,
      fh_primera_compra_cliente_time,
      fh_ultima_compra_cliente_time,
      fh_primera_compra_grupo_time,
      fh_ultima_compra_grupo_time,
      nb_tipo_producto,
      fh_primero_compra_grupo_plaza_time,
      nb_tipo_vendedor_heredado,
      nb_vendedor_heredado,
      sn_combustible,
      nb_familia_tablero_ventas,
      id_tipo_de_negocio,
      familia_de_producto,
      gsucursal,
      num_semana,
      pais__estado__municipio,
      sucursal,
      tipo_de_venta
    ]
  }
}
