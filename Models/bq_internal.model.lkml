connection: "rebecca_bq"

include: "/bq_views/*.view.lkml"

label: "Rebecca BQ"

case_sensitive: no

explore: ps_webinar_feedback { label: "PS Webinar Feedback" }

explore: ps_webinar_feedback_testing { description: "actually just testing BQ stuff" }
