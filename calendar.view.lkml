view: calendar {
  sql_table_name: thelook.Calendar ;;

  dimension: cdate {
    type: date
    primary_key: yes
    sql: ${TABLE}.cdate ;;
  }

  dimension_group: cdate_types {
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
    sql: ${cdate} ;;
  }

#   dimension: formatted_cdate {
#     type:
#
#   }

  dimension: quarter {
    type: number
    sql: ${TABLE}.quarter ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
