- dashboard: dashboardnext
  title: Dashboard-Next!!
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Total Revenue
    name: Total Revenue
    model: rebecca_fashionly
    explore: order_items
    type: single_value
    fields: [order_items.total_gross_revenue]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#4CAF50"
    value_format: '[>=1000000]$0.00,," M";[>=1000]$0.00," k";$0'
    series_types: {}
    defaults_version: 1
    listen:
      Created Date: order_items.created_date
      State: users.state
      Country: users.country
    row: 3
    col: 6
    width: 6
    height: 4
  - title: New Users
    name: New Users
    model: rebecca_fashionly
    explore: users
    type: single_value
    fields: [users.count_of_users]
    limit: 500
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#c25c95"
    value_format: '[>=1000]0.00," k";0'
    defaults_version: 1
    listen:
      Created Date: users.created_date
      State: users.state
      Country: users.country
    row: 3
    col: 12
    width: 6
    height: 4
  - name: At a Glance
    type: text
    title_text: At a Glance
    subtitle_text: ''
    body_text: "<center>High-level KPIs</center>"
    row: 0
    col: 0
    width: 24
    height: 3
  - name: Trends over Time
    type: text
    title_text: Trends over Time
    subtitle_text: ''
    body_text: "<center>More detailed analysis</center>"
    row: 7
    col: 0
    width: 24
    height: 3
  - title: Orders Made
    name: Orders Made
    model: rebecca_fashionly
    explore: order_items
    type: looker_line
    fields: [order_items.created_date, order_items.count_orders_made]
    fill_fields: [order_items.created_date]
    filters: {}
    sorts: [order_items.created_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_types: {}
    defaults_version: 1
    listen:
      Created Date: order_items.created_date
      State: users.state
      Country: users.country
    row: 10
    col: 0
    width: 12
    height: 6
  - title: Users Registered
    name: Users Registered
    model: rebecca_fashionly
    explore: users
    type: looker_line
    fields: [users.created_date, users.count_of_users]
    fill_fields: [users.created_date]
    filters: {}
    sorts: [users.created_date desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    series_colors:
      users.count_of_users: "#c25c95"
    defaults_version: 1
    listen:
      Created Date: users.created_date
      State: users.state
      Country: users.country
    row: 10
    col: 12
    width: 12
    height: 6
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 30 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: rebecca_fashionly
    explore: order_items
    listens_to_filters: []
    field: order_items.created_date
  - name: State
    title: State
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: inline
      options:
      - Here is a value
      - Why don't checkboxes work
  - name: Country
    title: Country
    type: field_filter
    default_value: USA
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: rebecca_fashionly
    explore: order_items
    listens_to_filters: []
    field: users.country
