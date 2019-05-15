view: orders {
  sql_table_name: thelook.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    link: {
      label: "Drill Down to See Customers"
      url: "/explore/events_ecommerce/users?fields=users.id,users.name"
      icon_url: "https://looker.com/favicon.ico" }
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_date ;;
  }

  dimension_group: custom_date_sort {
    type: time
    timeframes: [
      raw
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_date ;;
  }

dimension: one_year {
  type: date_year
  label: "1 - Year"
  group_label: "Custom Date Sort"
  sql: ${TABLE}.created_date ;;
}

dimension: one_quarter {
    type: date_quarter
    label: "2 - Quarter"
    group_label: "Custom Date Sort"
    sql: ${TABLE}.created_date ;;
  }

dimension: one_month {
    type: date_month
    label: "3 - Month"
    group_label: "Custom Date Sort"
    sql: ${TABLE}.created_date ;;
  }

  dimension: one_week {
    type: date_week
    label: "4 - Week"
    group_label: "Custom Date Sort"
    sql: ${TABLE}.created_date ;;
  }

  dimension: one_day {
    type: date
    label: "5 - Day"
    group_label: "Custom Date Sort"
    sql: ${TABLE}.created_date ;;
  }

  dimension: max_date {
    type: date
    sql: ${created_raw} ;;
    group_label: "Created Date"
  }

  dimension: custom_date {
    type: string
    sql: CAST(${created_raw} AS INT) ;;
    group_label: "Created Date"
  }



  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.last_name, users.id, users.first_name, order_items.count]
  }

  measure: date_max {
    type: max
    sql: ${created_raw} ;;
  }

#   measure: date_max {
#     type: number
#     sql: MAX(${TABLE}.created_date);;
#  }
}
