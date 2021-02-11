view: order_items_2 {
  sql_table_name: public.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  parameter: select_timezone {
    type: string
    allowed_value: { value: "America/New_York" }
    allowed_value: { value: "America/Los_Angeles" }
  }

  dimension: created_time {
    type: string
    sql: @{sql_time_front} ${TABLE}.created_at @{sql_time_back} ;;
  }
  dimension: created_date {
    type: string
    sql: @{sql_date_front} ${TABLE}.created_at @{sql_date_back} ;;
  }
  dimension: created_week {
    type: string
    sql: @{sql_week_front} ${TABLE}.created_at @{sql_week_back} ;;
  }

  # dimension_group: created {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.created_at ;;
  # }

  # dimension_group: delivered {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.delivered_at ;;
  # }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  # dimension_group: shipped {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.shipped_at ;;
  # }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
