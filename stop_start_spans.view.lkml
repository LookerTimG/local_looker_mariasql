view: stop_start_spans {
  sql_table_name: thelook.stop_start_spans ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: edate {
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
    sql: ${TABLE}.edate ;;
  }

  dimension_group: sdate {
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
    sql: ${TABLE}.sdate ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
