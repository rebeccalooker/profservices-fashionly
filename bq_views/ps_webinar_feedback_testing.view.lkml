include: "/bq_views/ps_webinar_feedback.view"

view: ps_webinar_feedback_testing {
  extends: [ps_webinar_feedback]

  measure: trainer_list {
    type: list
    list_field: 8_who_was_your_trainer_
    order_by_field: count_responses
  }
}
