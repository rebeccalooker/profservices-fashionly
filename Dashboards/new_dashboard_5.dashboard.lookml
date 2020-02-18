- dashboard: new_dashboard_5
  title: New Dashboard 5
  layout: newspaper
  embed_style:
    background_color: white
    show_title: true
    title_color: red
    show_filters_bar: false
    tile_text_color: red
    text_tile_text_color: red
  elements:
  - name: a title
    type: text
    title_text: a title
    subtitle_text: a subtitle
    body_text: a text box
    row: 0
    col: 8
    width: 8
    height: 6
  - title: User Names
    name: User Names
    model: rebecca_fashionly
    explore: users
    type: looker_grid
    fields: [users.full_name]
    sorts: [users.full_name]
    limit: 1000
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Untitled
    name: Untitled
    model: rebecca_fashionly
    explore: order_items
    type: single_value
    fields: [order_items.average_gross_revenue]
    limit: 5000
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 6
  filters:
  - name: Country
    title: Country
    type: field_filter
    default_value: USA
    allow_multiple_values: true
    required: false
    model: rebecca_fashionly
    explore: users
    listens_to_filters: []
    field: users.country
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: rebecca_fashionly
    explore: users
    listens_to_filters: [Country]
    field: users.state
