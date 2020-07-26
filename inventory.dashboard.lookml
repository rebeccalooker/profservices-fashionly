- dashboard: inventory_dashboard
  title: Inventory Dashboard
  layout: newspaper
  embed_style:
    background_color: "#dbd6d6"
    show_title: true
    title_color: "#000000"
    show_filters_bar: true
    tile_text_color: indigo
    text_tile_text_color: ''
  elements:
  - title: Total Products
    name: Total Products
    model: new_ef_sandbox
    explore: inventory_items
    type: single_value
    fields: [products.gross_revenue]
    filters:
      inventory_items.sold_indicator: 'Yes'
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
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
    single_value_title: Total Sales
    value_format: "$ #,###; ($ #,###)"
    listen:
      Brand: inventory_items.product_brand
    row: 9
    col: 8
    width: 8
    height: 3
  - title: Stock Count by Category
    name: Stock Count by Category
    model: new_ef_sandbox
    explore: products
    type: looker_column
    fields: [products.category, inventory_items.stock_count]
    sorts: [inventory_items.stock_count]
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
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
    show_null_points: true
    point_style: circle
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors: ['palette: Looker Classic']
    series_colors: {}
    y_axes: [{label: Product Count, orientation: left, series: [{id: products.count,
            name: Products Product Count, axisId: products.count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    listen:
      Brand: inventory_items.product_brand
    row: 12
    col: 0
    width: 16
    height: 8
  - title: Products with Low Inventory
    name: Products with Low Inventory
    model: new_ef_sandbox
    explore: products
    type: table
    fields: [products.category, products.name, inventory_items.stock_count]
    filters:
      inventory_items.stock_count: "<2"
    sorts: [inventory_items.stock_count 0, products.category, products.name]
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
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
    listen:
      Brand: inventory_items.product_brand
    row: 15
    col: 16
    width: 8
    height: 6
  - title: Total Profit
    name: Total Profit
    model: new_ef_sandbox
    explore: products
    type: single_value
    fields: [products.gross_revenue, products.cogs]
    sorts: [inventory_turnover desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: inventory_turnover, label: Inventory Turnover,
        expression: "${products.gross_revenue}/${products.cogs}", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
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
    hidden_fields: [products.cogs, products.gross_revenue]
    value_format: "#.##"
    single_value_title: Inventory Turnover
    listen:
      Brand: inventory_items.product_brand
    row: 6
    col: 4
    width: 4
    height: 3
  - name: Text Title
    type: text
    title_text: Text Title
    subtitle_text: Text SubTitle
    body_text: This is a Text
    row: 9
    col: 0
    width: 8
    height: 3
  - title: Inventory Movement
    name: Inventory Movement
    model: new_ef_sandbox
    explore: products
    type: looker_line
    fields: [inventory_items.count, inventory_items.sold_count, inventory_items.last_updated_month]
    fill_fields: [inventory_items.last_updated_month]
    sorts: [inventory_items.last_updated_month]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axes: [{label: !!null '', orientation: left, series: [{id: inventory_items.count,
            name: Inventory Items Count, axisId: inventory_items.count}, {id: inventory_items.sold_count,
            name: Inventory Items Sold Count, axisId: inventory_items.sold_count}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    hidden_series: []
    legend_position: center
    colors: ['palette: Looker Classic']
    series_types: {}
    point_style: none
    series_colors: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}, {reference_type: line, line_value: max, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: "#000000"}, {reference_type: line, line_value: min,
        range_start: max, range_end: min, margin_top: deviation, margin_value: mean,
        margin_bottom: deviation, label_position: right, color: "#000000"}]
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    hidden_fields: []
    value_format: "$ #,###; ($ #,###)"
    single_value_title: Total Profit (Loss)
    listen:
      Brand: inventory_items.product_brand
    row: 20
    col: 0
    width: 16
    height: 7
  - title: Average Item Profit
    name: Average Item Profit
    model: new_ef_sandbox
    explore: inventory_items
    type: single_value
    fields: [inventory_items.average_days_in_inventory, inventory_items.total_profit,
      inventory_items.average_item_profit, inventory_items.count]
    filters: {}
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
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
    hidden_fields: [inventory_items.total_profit, inventory_items.count, inventory_items.average_days_in_inventory]
    listen:
      Brand: inventory_items.product_brand
    row: 6
    col: 16
    width: 8
    height: 3
  - title: Most Profitable Age Group
    name: Most Profitable Age Group
    model: new_ef_sandbox
    explore: order_items
    type: single_value
    fields: [users.age_tier, order_items.sales]
    filters:
      order_items.sales: ">0"
    sorts: [order_items.sales desc]
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
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
    hidden_fields: [order_items.sales]
    listen:
      Brand: inventory_items.product_brand
    row: 6
    col: 8
    width: 8
    height: 3
  - title: Total Available Items
    name: Total Available Items
    model: new_ef_sandbox
    explore: inventory_items
    type: single_value
    fields: [inventory_items.stock_count]
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
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
    single_value_title: Total Available Items
    listen:
      Brand: inventory_items.product_brand
    row: 6
    col: 0
    width: 4
    height: 3
  - title: Untitled
    name: Untitled
    model: rebecca_fashionly
    explore: order_items
    type: looker_line
    fields: [order_items.created_month, order_items.total_sale_price, orders_completed.gross_margin_percentage]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_date: 13 months
    sorts: [order_items.created_month desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: order_items.total_sale_price, name: Total Sale Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: right, series: [{axisId: orders_completed.gross_margin_percentage,
            id: orders_completed.gross_margin_percentage, name: Gross Margin Percentage}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear}]
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
    label_value_format: "[>=1]$#,###;0%"
    series_types:
      of_total: column
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 9
    col: 16
    width: 8
    height: 6
  - title: New Tile
    name: New Tile
    model: rebecca_fashionly
    explore: order_items
    type: looker_grid
    fields: [order_items.created_month, order_items.count_orders_made, order_items.count_items_ordered,
      order_items.total_sale_price, order_items.average_sale_price]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_date: 6 months
    sorts: [order_items.created_month desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: true
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '24'
    rows_font_size: '20'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    note_state: expanded
    note_display: below
    note_text: Here is a note
    listen: {}
    row: 0
    col: 0
    width: 11
    height: 6
  - title: New Tile
    name: New Tile (2)
    model: rebecca_fashionly
    explore: users
    type: looker_grid
    fields: [users.id, users.max_age]
    sorts: [users.max_age desc]
    limit: 10
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: true
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    note_state: collapsed
    note_display: below
    note_text: here is another note
    listen: {}
    row: 0
    col: 11
    width: 8
    height: 6
  - title: New Tile
    name: New Tile (3)
    model: rebecca_fashionly
    explore: users
    type: looker_line
    fields: [users.created_date, users.count_of_users]
    fill_fields: [users.created_date]
    filters:
      users.created_date: 30 days
      users.first_name: N%
    sorts: [users.created_date desc]
    limit: 500
    query_timezone: America/New_York
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    listen: {}
    row: 21
    col: 16
    width: 8
    height: 6
  - title: Orders Made
    name: Orders Made
    model: rebecca_fashionly
    explore: order_items
    type: single_value
    fields: [order_items.count_orders_made]
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
    defaults_version: 1
    listen: {}
    row: 27
    col: 0
    width: 8
    height: 6
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: Calvin Klein
    allow_multiple_values: true
    required: false
    model: new_ef_sandbox
    explore: products
    listens_to_filters: []
    field: inventory_items.product_brand
