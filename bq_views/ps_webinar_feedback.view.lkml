view: ps_webinar_feedback {
  sql_table_name: `rebeccaland.internal.ps_webinar_feedback`
    ;;
  view_label: "PS Webinar Feedback"

  dimension_group: _webinar {
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
    sql: ${TABLE}._10__When_was_your_training_ ;;
  }

  dimension: 1_how_likely_are_you_to_recommend_this_training_to_others {
    description: "Scale of 1-10"
    type: number
    sql: ${TABLE}._1__How_likely_are_you_to_recommend_this_training_to_others___1_10_ ;;
  }

  dimension: 2_which_looker_training_did_you_take {
    type: string
    sql: ${TABLE}._2__Which_Looker_training_did_you_take_ ;;
  }

  dimension: 3_were_the_objectives_of_the_training_were_clearly_defined {
    description: "Scale of 1-10"
    type: number
    sql: ${TABLE}._3__Were_the_objectives_of_the_training_were_clearly_defined___1_10_ ;;
  }

  dimension: 4_was_the_trainer_knowledgeable_about_the_training_topics {
    description: "Scale of 1-10"
    type: number
    sql: ${TABLE}._4__Was_the_trainer_was_knowledgeable_about_the_training_topics___1_10_ ;;
  }

  dimension: 5_did_get_what_you_wanted_out_of_today_s_training {
    label: "5 Did You Get What You Wanted Out Of Today's Training"
    description: "Scale of 1-10"
    type: number
    sql: ${TABLE}._5__Did_get_what_you_wanted_out_of_today_s_training___1_10_ ;;
  }

  dimension: 6_was_the_time_allotted_for_training_was_sufficient {
    description: "Scale of 1-10"
    type: number
    sql: ${TABLE}._6__Was_the_time_allotted_for_training_was_sufficient___1_10_ ;;
  }

  dimension: 7_what_aspects_of_this_training_could_be_improved_ {
    type: string
    sql: ${TABLE}._7__What_aspects_of_this_training_could_be_improved_ ;;
  }

  dimension: 8_who_was_your_trainer_ {
    type: string
    sql: ${TABLE}._8__Who_was_your_trainer_ ;;
  }

  dimension: 9_what_company_do_you_represent_ {
    type: string
    sql: ${TABLE}._9__What_company_do_you_represent_ ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.Browser ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.Device_Type ;;
  }

### NPS stuff {
  dimension: is_detractor_response_1 {
    hidden: yes
    type: yesno
    sql: ${1_how_likely_are_you_to_recommend_this_training_to_others} <= 6 ;;
  }

  dimension: is_detractor_response_3 {
    hidden: yes
    type: yesno
    sql: ${3_were_the_objectives_of_the_training_were_clearly_defined} <= 6 ;;
  }

  dimension: is_detractor_response_4 {
    hidden: yes
    type: yesno
    sql: ${4_was_the_trainer_knowledgeable_about_the_training_topics} <= 6 ;;
  }

  dimension: is_detractor_response_5 {
    hidden: yes
    type: yesno
    sql: ${5_did_get_what_you_wanted_out_of_today_s_training} <= 6 ;;
  }

  dimension: is_detractor_response_6 {
    hidden: yes
    type: yesno
    sql: ${6_was_the_time_allotted_for_training_was_sufficient} <= 6 ;;
  }

  dimension: is_neutral_response_1 {
    hidden: yes
    type: yesno
    sql: ${1_how_likely_are_you_to_recommend_this_training_to_others} = 7 or ${1_how_likely_are_you_to_recommend_this_training_to_others} = 8 ;;
  }

  dimension: is_neutral_response_3 {
    hidden: yes
    type: yesno
    sql: ${3_were_the_objectives_of_the_training_were_clearly_defined} = 7 or ${3_were_the_objectives_of_the_training_were_clearly_defined} = 8 ;;
  }

  dimension: is_neutral_response_4 {
    hidden: yes
    type: yesno
    sql: ${4_was_the_trainer_knowledgeable_about_the_training_topics} = 7 or ${4_was_the_trainer_knowledgeable_about_the_training_topics} = 8 ;;
  }

  dimension: is_neutral_response_5 {
    hidden: yes
    type: yesno
    sql: ${5_did_get_what_you_wanted_out_of_today_s_training} = 7 or ${5_did_get_what_you_wanted_out_of_today_s_training} = 8 ;;
  }

  dimension: is_neutral_response_6 {
    hidden: yes
    type: yesno
    sql: ${6_was_the_time_allotted_for_training_was_sufficient} = 7 or ${6_was_the_time_allotted_for_training_was_sufficient} = 8 ;;
  }

  dimension: is_promoter_response_1 {
    hidden: yes
    type: yesno
    sql: ${1_how_likely_are_you_to_recommend_this_training_to_others} >= 9 ;;
  }

  dimension: is_promoter_response_3 {
    hidden: yes
    type: yesno
    sql: ${3_were_the_objectives_of_the_training_were_clearly_defined} >= 9 ;;
  }

  dimension: is_promoter_response_4 {
    hidden: yes
    type: yesno
    sql: ${4_was_the_trainer_knowledgeable_about_the_training_topics} >= 9 ;;
  }

  dimension: is_promoter_response_5 {
    hidden: yes
    type: yesno
    sql: ${5_did_get_what_you_wanted_out_of_today_s_training} >= 9 ;;
  }

  dimension: is_promoter_response_6 {
    hidden: yes
    type: yesno
    sql: ${6_was_the_time_allotted_for_training_was_sufficient} >= 9 ;;
  }
### } NPS stuff

  dimension_group: survey_completed {
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
    sql: ${TABLE}.Completed_At ;;
  }

  dimension_group: survey_started {
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
    sql: ${TABLE}.Started_At ;;
  }

  dimension: survey_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.Unique_ID ;;
  }

  ### Counts {
  measure: count_responses {
    group_label: "Counts"
    type: count
    drill_fields: []
  }
  ### }

  ### Averages {
  measure: avg_1_likely_to_recommend {
    group_label: "Averages"
    type: average
    sql: ${1_how_likely_are_you_to_recommend_this_training_to_others} ;;
    value_format_name: decimal_1
  }

  measure: avg_3_objectives_defined {
    group_label: "Averages"
    type: average
    sql: ${3_were_the_objectives_of_the_training_were_clearly_defined} ;;
    value_format_name: decimal_1
  }

  measure: avg_4_knowledgeable_trainer {
    group_label: "Averages"
    type: average
    sql: ${4_was_the_trainer_knowledgeable_about_the_training_topics} ;;
    value_format_name: decimal_1
  }

  measure: avg_5_learned_enough {
    group_label: "Averages"
    type: average
    sql: ${5_did_get_what_you_wanted_out_of_today_s_training} ;;
    value_format_name: decimal_1
  }

  measure: avg_6_enough_time {
    group_label: "Averages"
    type: average
    sql: ${6_was_the_time_allotted_for_training_was_sufficient} ;;
    value_format_name: decimal_1
  }
  ### }

  ### Maximums {
  measure: max_1_likely_to_recommend {
    group_label: "Maximums"
    type: max
    sql: ${1_how_likely_are_you_to_recommend_this_training_to_others} ;;
    value_format_name: decimal_1
  }

  measure: max_3_objectives_defined {
    group_label: "Maximums"
    type: max
    sql: ${3_were_the_objectives_of_the_training_were_clearly_defined} ;;
    value_format_name: decimal_1
  }

  measure: max_4_knowledgeable_trainer {
    group_label: "Maximums"
    type: max
    sql: ${4_was_the_trainer_knowledgeable_about_the_training_topics} ;;
    value_format_name: decimal_1
  }

  measure: max_5_learned_enough {
    group_label: "Maximums"
    type: max
    sql: ${5_did_get_what_you_wanted_out_of_today_s_training} ;;
    value_format_name: decimal_1
  }

  measure: max_6_enough_time {
    group_label: "Maximums"
    type: max
    sql: ${6_was_the_time_allotted_for_training_was_sufficient} ;;
    value_format_name: decimal_1
  }
  ### }

  ### Minimums {
  measure: min_1_likely_to_recommend {
    group_label: "Minimums"
    type: min
    sql: ${1_how_likely_are_you_to_recommend_this_training_to_others} ;;
    value_format_name: decimal_1
  }

  measure: min_3_objectives_defined {
    group_label: "Minimums"
    type: min
    sql: ${3_were_the_objectives_of_the_training_were_clearly_defined} ;;
    value_format_name: decimal_1
  }

  measure: min_4_knowledgeable_trainer {
    group_label: "Minimums"
    type: min
    sql: ${4_was_the_trainer_knowledgeable_about_the_training_topics} ;;
    value_format_name: decimal_1
  }

  measure: min_5_learned_enough {
    group_label: "Minimums"
    type: min
    sql: ${5_did_get_what_you_wanted_out_of_today_s_training} ;;
    value_format_name: decimal_1
  }

  measure: min_6_enough_time {
    group_label: "Minimums"
    type: min
    sql: ${6_was_the_time_allotted_for_training_was_sufficient} ;;
    value_format_name: decimal_1
  }
  ### }
}
