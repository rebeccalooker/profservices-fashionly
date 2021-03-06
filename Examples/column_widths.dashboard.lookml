### Another example
- dashboard: new_dashboard
  title: New Dashboard
  layout: newspaper
  elements:
  - title: Untitled
    name: Untitled
    model: rebecca_fashionly
    explore: users
    type: table
    fields:
    - users.first_name
    - users.last_name
    - users.email
    - users.age
    - users.city
    - users.gender
    - users.state
    - users.traffic_source
    - users.zip
    - users.created_date
    - users.days_since_signup
    - users.months_since_signup
    - users.signup_days_cohort
    - users.signup_months_cohort
    sorts:
    - users.first_name
    limit: 5000
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: true
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 0
    col: 0
    width: 24
    height: 116
  - title: Untitled (copy)
    name: Untitled (copy)
    model: rebecca_fashionly
    explore: users
    type: table
    fields:
    - users.first_name
    - users.last_name
    - users.email
    sorts:
    - users.first_name
    limit: 5000
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    row: 116
    col: 0
    width: 24
    height: 116
