connection: "rebecca_bq"

include: "/bq_views/*.view.lkml"

label: "Rebecca BQ"

case_sensitive: no

explore: ps_webinar_feedback { label: "PS Webinar Feedback" }

explore: ps_webinar_feedback_testing {
  description: "actually just testing BQ stuff"
  join: brackets {
    type: cross
  }
}

explore: gc_cl_2020_feedback {
  label: "Controlled Launch 2020 Feedback"
  view_label: "Feedback"

  join: keywords_separated {
    sql: , UNNEST(SPLIT(keywords,',')) AS keywords_separated ;;
  }
}
