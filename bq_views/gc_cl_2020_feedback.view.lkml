view: gc_cl_2020_feedback {
  sql_table_name: (select *, GENERATE_UUID() uuid
                  from `rebeccaland.internal.gc_cl_2020_feedback`)
    ;;

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
    primary_key: yes
  }

  dimension: additional_notes {
    type: string
    sql: ${TABLE}.additional_notes ;;
  }

  dimension: applicable_to_daily_work {
    group_label: "Scales of 1-5"
    description: "Scale of 1 to 5, 5 being positive"
    type: number
    sql: ${TABLE}.applicable_to_daily_work ;;
  }

  dimension: average_overall_from_individual {
    type: number
    sql: (${applicable_to_daily_work} + ${met_agenda_expectations} + ${met_depth_expectations}) / 3 ;;
    value_format_name: decimal_2
  }

  dimension: bi_level {
    label: "BI Level"
    type: string
    sql: ${TABLE}.BI_Level ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.Email_Address ;;
  }

  dimension: instructors {
    type: string
    sql: ${TABLE}.instructors ;;
  }

  dimension: keywords {
    type: string
    sql: ${TABLE}.keywords ;;
    hidden: yes
  }

  # dimension: keywords_separated {
  #   type: string
  #   sql: split(${keywords},',') ;;
  # }

  dimension: met_agenda_expectations {
    group_label: "Scales of 1-5"
    description: "Scale of 1 to 5, 5 being positive"
    type: number
    sql: ${TABLE}.met_agenda_expectations ;;
  }

  dimension: met_depth_expectations {
    group_label: "Scales of 1-5"
    description: "Scale of 1 to 5, 5 being positive"
    type: number
    sql: ${TABLE}.met_depth_expectations ;;
  }

  dimension_group: response {
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
    sql: ${TABLE}.Timestamp ;;
  }

### Measures
  measure: count_of_responses {
    type: count
    drill_fields: []
  }

  measure: average_applicable_to_daily_work {
    type: average
    sql: ${applicable_to_daily_work} ;;
    value_format_name: decimal_2
  }

  measure: average_met_agenda_expectations {
    type: average
    sql: ${met_agenda_expectations} ;;
    value_format_name: decimal_2
  }

  measure: average_met_depth_expectations {
    type: average
    sql: ${met_depth_expectations} ;;
    value_format_name: decimal_2
  }

  measure: average_overall_response {
    type: average
    sql: ${average_overall_from_individual} ;;
    value_format_name: decimal_2
  }

  measure: min_overall_response {
    type: min
    sql: ${average_overall_from_individual} ;;
    value_format_name: decimal_2
  }

  measure: max_overall_response {
    type: max
    sql: ${average_overall_from_individual} ;;
    value_format_name: decimal_2
  }
}

view: keywords_separated {
  dimension: keywords_separated {
    sql: keywords_separated ;;
  }
}
