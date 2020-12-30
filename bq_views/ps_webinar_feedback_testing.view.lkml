include: "/bq_views/ps_webinar_feedback.view"

view: ps_webinar_feedback_testing {
  extends: [ps_webinar_feedback]

  # measure: trainer_list {
  #   type: list
  #   list_field: 8_who_was_your_trainer_
  #   order_by_field: count_responses
  # }
}

view: brackets {
  derived_table: {
    sql_trigger_value: select 1 ;;
    cluster_keys: ["brackets"]
    # partition_keys: ["date_field"]
    sql: select 'asdf <br>' as brackets, current_date() as date_field
        union all
        select 'qwer <br>'
        union all
        select 'zxcv <br>'
        union all
        select '1234 <br>'
        union all
        select '5678 <br>'
        union all
        select 'no brackets'
        union all
        select 'also no brackets'
        ;;
  }
  dimension: brackets {
    type: string
    sql: ${TABLE}.brackets ;;
  }
  dimension: date_field {
    type: date
    sql: ${TABLE}.date_field ;;
  }
}
