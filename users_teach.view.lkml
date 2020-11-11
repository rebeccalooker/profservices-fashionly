view: users_teach {
  sql_table_name: public.users ;;

  dimension: id {
    hidden:  no
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    value_format_name: id
  }

  dimension: age {
    type: number
    value_format_name: decimal_0
    sql: ${TABLE}.age ;;
  }

  dimension: ages_tier {
    label: "Age Tier"
    type: tier
    style: integer
    sql: ${TABLE}.age ;;
    tiers: [10, 20, 30, 40, 50, 60, 70, 80, 90]
  }

  dimension: city {
    group_label: "Address Fields"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    group_label: "Address Fields"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: days_since_sign_up {
    type: number
    sql: DATEDIFF(day, ${created_raw}, current_date) ;;
    hidden: yes
  }

  dimension_group: since_signup {
    type: duration
    intervals: [second, hour,day, week, month, year]
    sql_start: ${created_time} ;;
    sql_end: current_date ;;
  }

  dimension: days_since_signup_tier {
    type: tier
    sql: ${days_since_sign_up} ;;
    tiers: [0,90,180,500]
    style: integer
  }

  dimension: is_new_customer {
    type: yesno
    sql: ${days_since_sign_up} < 90 ;;
  }

  dimension: years_a_customer {
    type: number
    value_format_name: decimal_0
    sql: DATEDIFF(year, ${created_date}, current_date) ;;
    hidden: yes
  }

  # dimension: days_a_customer {
  #   type: number
  #   value_format_name: decimal_0
  #   sql: DATEDIFF(day, ${created_date}, current_date) ;;
  # }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    hidden:  yes
    type: string
    sql: initcap(${TABLE}.first_name) ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    hidden:  yes
    type: string
    sql: initcap(${TABLE}.last_name) ;;
  }

  dimension: full_name {
    type: string
    sql: ${first_name} || ' ' || ${last_name} ;;
  }

  dimension: latitude {
    hidden:  yes
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    hidden:  yes
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    group_label: "Address Fields"
    type: string
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: traffic_source_is_organic {
    description: "Whether the traffic source is specifically \"Organic\""
    type: yesno
    sql: ${traffic_source} = 'Organic' ;;
  }

  dimension: zip {
    group_label: "Address Fields"
    label: "ZIP"
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: region {
    # map_layer_name: map_regions
    group_label: "Address Fields"
    sql: CASE WHEN ${state} = 'Maine' THEN 'Northeast'
              WHEN ${state} = 'Massachusetts' THEN 'Northeast'
              WHEN ${state} = 'Rhode Island' THEN 'Northeast'
              WHEN ${state} = 'Connecticut' THEN 'Northeast'
              WHEN ${state} = 'New Hampshire' THEN 'Northeast'
              WHEN ${state} = 'Vermont' THEN 'Northeast'
              WHEN ${state} = 'New York' THEN 'Northeast'
              WHEN ${state} = 'Pennsylvania' THEN 'Northeast'
              WHEN ${state} = 'New Jersey' THEN 'Northeast'
              WHEN ${state} = 'Delaware' THEN 'Northeast'
              WHEN ${state} = 'Maryland' THEN 'Northeast'
              WHEN ${state} = 'West Virginia' THEN 'Southeast'
              WHEN ${state} = 'Virginia' THEN 'Southeast'
              WHEN ${state} = 'Kentucky' THEN 'Southeast'
              WHEN ${state} = 'Tennessee' THEN 'Southeast'
              WHEN ${state} = 'North Carolina' THEN 'Southeast'
              WHEN ${state} = 'South Carolina' THEN 'Southeast'
              WHEN ${state} = 'Georgia' THEN 'Southeast'
              WHEN ${state} = 'Alabama' THEN 'Southeast'
              WHEN ${state} = 'Mississippi' THEN 'Southeast'
              WHEN ${state} = 'Arkansas' THEN 'Southeast'
              WHEN ${state} = 'Louisiana' THEN 'Southeast'
              WHEN ${state} = 'Florida' THEN 'Southeast'
              WHEN ${state} = 'Ohio' THEN 'Midwest'
              WHEN ${state} = 'Indiana' THEN 'Midwest'
              WHEN ${state} = 'Michigan' THEN 'Midwest'
              WHEN ${state} = 'Illinois' THEN 'Midwest'
              WHEN ${state} = 'Missouri' THEN 'Midwest'
              WHEN ${state} = 'Wisconsin' THEN 'Midwest'
              WHEN ${state} = 'Minnesota' THEN 'Midwest'
              WHEN ${state} = 'Iowa' THEN 'Midwest'
              WHEN ${state} = 'Kansas' THEN 'Midwest'
              WHEN ${state} = 'Nebraska' THEN 'Midwest'
              WHEN ${state} = 'South Dakota' THEN 'Midwest'
              WHEN ${state} = 'North Dakota' THEN 'Midwest'
              WHEN ${state} = 'Texas' THEN 'Southwest'
              WHEN ${state} = 'Oklahoma' THEN 'Southwest'
              WHEN ${state} = 'New Mexico' THEN 'Southwest'
              WHEN ${state} = 'Arizona' THEN 'Southwest'
              WHEN ${state} = 'Colorado' THEN 'West'
              WHEN ${state} = 'Wyoming' THEN 'West'
              WHEN ${state} = 'Montana' THEN 'West'
              WHEN ${state} = 'Idaho' THEN 'West'
              WHEN ${state} = 'Washington' THEN 'West'
              WHEN ${state} = 'Oregon' THEN 'West'
              WHEN ${state} = 'Utah' THEN 'West'
              WHEN ${state} = 'Nevada' THEN 'West'
              WHEN ${state} = 'California' THEN 'West'
              WHEN ${state} = 'Alaska' THEN 'West'
              WHEN ${state} = 'Hawaii' THEN 'West'
              ELSE 'Outside US'
          END ;;
  }

  dimension: map_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
  }

  dimension: approx_location {
    group_label: "Address Fields"
    label: "Location"
    type: location
    drill_fields: [map_location]
    sql_latitude: round(${TABLE}.latitude,1) ;;
    sql_longitude: round(${TABLE}.longitude,1) ;;
  }

  measure: max_age {
    type: max
    sql: ${age} ;;
  }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, email, traffic_source, events.count, order_items.count]
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
  }

  measure: count_female_users {
    type: count
    filters: {
      field: gender
      value: "Female"
    }
  }
}
