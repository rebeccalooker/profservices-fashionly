- dashboard: training_kpis
  title: Training KPIs
  layout: newspaper
  description: Analyze various usage/activity metrics to determine which users should
    be proactively offered training opportunities
  query_timezone: query_saved
  elements:
  - title: 'Persona A: Interested but Lost'
    name: 'Persona A: Interested but Lost'
    model: system__activity
    explore: history
    type: table
    fields: [history.approximate_usage_in_minutes, dashboard.count, look.count, user.email]
    filters:
      history.created_time: 30 days
      history.approximate_usage_in_minutes: ">=60"
      dashboard.count: "<=3"
      look.count: "<=3"
    sorts: [total_content]
    limit: 500
    dynamic_fields: [{table_calculation: total_content, label: Total Content, expression: "${dashboard.count}+${look.count}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      history.approximate_usage_in_minutes:
        is_active: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: less than, value: 4, background_color: "#FFEB3B",
        font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 04aea65e-1372-4c50-ae0e-e1687bfdf103}, bold: true, italic: false,
        strikethrough: false, fields: [total_content]}]
    defaults_version: 1
    hidden_fields: [dashboard.count, look.count]
    series_types: {}
    note_state: collapsed
    note_display: below
    note_text: Total Content = dashboards + Looks combined
    listen: {}
    row: 2
    col: 0
    width: 8
    height: 6
  - title: Table Calculations - Dashboards & Looks
    name: Table Calculations - Dashboards & Looks
    model: i__looker
    explore: dashboard
    type: table
    fields: [user.email, dashboard.count, dashboards_with_no_table_calcs, look.count,
      looks_with_no_table_calcs]
    filters:
      user.email: "-EMPTY"
    sorts: [total_content_with_table_calcs]
    limit: 500
    dynamic_fields: [{table_calculation: total_content, label: Total Content, expression: "${dashboard.count}+${look.count}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: total_content_with_table_calcs, label: Total
          Content with Table Calcs, expression: "(${dashboard.count}-${dashboards_with_no_table_calcs})\
          \ + (${look.count}-${looks_with_no_table_calcs})", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: dashboards_with_no_table_calcs, based_on: dashboard.count, label: Dashboards
          with No Table Calcs, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: 'is_null(${query.dynamic_fields})'},
      {measure: looks_with_no_table_calcs, based_on: look.count, label: Looks with
          No Table Calcs, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: 'is_null(${query.dynamic_fields})'}]
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: equal to, value: 0, background_color: "#FFEB3B",
        font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: [total_content_with_table_calcs]}, {type: greater
          than, value: 4, background_color: "#FFEB3B", font_color: !!null '', color_application: {
          collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d, palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: true, italic: false, strikethrough: false, fields: [total_content]}]
    defaults_version: 1
    hidden_fields: [dashboard.count, dashboards_with_no_table_calcs, look.count, looks_with_no_table_calcs]
    series_types: {}
    note_state: expanded
    note_display: below
    note_text: This comes from the Dashboards i__looker Explore which, for Looks,
      only counts Looks that are on dashboards. So start with this list of names where
      both columns are shaded...
    listen: {}
    row: 26
    col: 3
    width: 9
    height: 8
  - name: Exploring in Looker
    type: text
    title_text: Exploring in Looker
    subtitle_text: People who may benefit from this training
    row: 0
    col: 0
    width: 24
    height: 2
  - name: 'Persona B: Waning Interest'
    title: 'Persona B: Waning Interest'
    merged_queries:
    - model: system__activity
      explore: history
      type: table
      fields: [user.email]
      filters:
        history.approximate_usage_in_minutes: "[15, 60]"
        user.email: "-EMPTY"
      sorts: [user.email]
      limit: 500
      query_timezone: America/New_York
      show_view_names: false
      show_row_numbers: true
      truncate_column_names: false
      hide_totals: false
      hide_row_totals: false
      table_theme: editable
      limit_displayed_rows: false
      enable_conditional_formatting: true
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      conditional_formatting: [{type: less than, value: 4, background_color: "#FFEB3B",
          font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
            palette_id: 04aea65e-1372-4c50-ae0e-e1687bfdf103}, bold: true, italic: false,
          strikethrough: false, fields: []}]
      defaults_version: 1
      hidden_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [user.email, history.created_week, history.approximate_usage_in_minutes]
      sorts: [history.created_week desc]
      limit: 500
      query_timezone: America/New_York
      join_fields:
      - field_name: user.email
        source_field_name: user.email
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Approx. Web Usage (Minutes), orientation: left, series: [{axisId: history.approximate_usage_in_minutes,
            id: aaron.lutkowitz@looker.com - history.approximate_usage_in_minutes,
            name: aaron.lutkowitz@looker.com}, {axisId: history.approximate_usage_in_minutes,
            id: adam@montrealanalytics.com - history.approximate_usage_in_minutes,
            name: adam@montrealanalytics.com}, {axisId: history.approximate_usage_in_minutes,
            id: alejandro@looker.com - history.approximate_usage_in_minutes, name: alejandro@looker.com},
          {axisId: history.approximate_usage_in_minutes, id: conrad@looker.com - history.approximate_usage_in_minutes,
            name: conrad@looker.com}, {axisId: history.approximate_usage_in_minutes,
            id: hugo.selbie@looker.com - history.approximate_usage_in_minutes, name: hugo.selbie@looker.com},
          {axisId: history.approximate_usage_in_minutes, id: joseph.belvedere@looker.com
              - history.approximate_usage_in_minutes, name: joseph.belvedere@looker.com},
          {axisId: history.approximate_usage_in_minutes, id: lyndsey.pileggi@looker.com
              - history.approximate_usage_in_minutes, name: lyndsey.pileggi@looker.com},
          {axisId: history.approximate_usage_in_minutes, id: margaret.abercrombie@looker.com
              - history.approximate_usage_in_minutes, name: margaret.abercrombie@looker.com},
          {axisId: history.approximate_usage_in_minutes, id: mrchrisschmidt@gmail.com
              - history.approximate_usage_in_minutes, name: mrchrisschmidt@gmail.com},
          {axisId: history.approximate_usage_in_minutes, id: nelson.yee@looker.com
              - history.approximate_usage_in_minutes, name: nelson.yee@looker.com},
          {axisId: history.approximate_usage_in_minutes, id: patricia.chai@looker.com
              - history.approximate_usage_in_minutes, name: patricia.chai@looker.com},
          {axisId: history.approximate_usage_in_minutes, id: peggy.beard@looker.com
              - history.approximate_usage_in_minutes, name: peggy.beard@looker.com},
          {axisId: history.approximate_usage_in_minutes, id: prasad.pagade@looker.com
              - history.approximate_usage_in_minutes, name: prasad.pagade@looker.com},
          {axisId: history.approximate_usage_in_minutes, id: scott.barber@looker.com
              - history.approximate_usage_in_minutes, name: scott.barber@looker.com},
          {axisId: history.approximate_usage_in_minutes, id: shiggins@google.com -
              history.approximate_usage_in_minutes, name: shiggins@google.com}, {
            axisId: history.approximate_usage_in_minutes, id: tim.lee@looker.com -
              history.approximate_usage_in_minutes, name: tim.lee@looker.com}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
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
    series_types: {}
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    type: looker_line
    pivots: [user.email]
    row: 5
    col: 8
    width: 16
    height: 9
  - name: 'Persona C: Prefers SQL Runner'
    title: 'Persona C: Prefers SQL Runner'
    merged_queries:
    - model: system__activity
      explore: event
      type: table
      fields: [event.count, user.email]
      filters:
        event.name: '"run_sql_query"'
      sorts: [event.count desc]
      limit: 500
      query_timezone: America/New_York
      join_fields: []
    - model: system__activity
      explore: history
      type: table
      fields: [history.query_run_count, user.email]
      filters:
        history.source: Explore
      sorts: [history.query_run_count desc]
      limit: 500
      query_timezone: America/New_York
      join_fields:
      - field_name: user.email
        source_field_name: user.email
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      event.count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: greater than, value: 1.49, background_color: "#FFEB3B",
        font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 04aea65e-1372-4c50-ae0e-e1687bfdf103}, bold: true, italic: false,
        strikethrough: false, fields: [sqlexplore_ratio]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: table
    series_types: {}
    sorts: [sqlexplore_ratio desc]
    dynamic_fields: [{table_calculation: sqlexplore_ratio, label: 'SQL:Explore Ratio',
        expression: "${event.count}/${history.query_run_count}", value_format: !!null '',
        value_format_name: decimal_1, _kind_hint: measure, _type_hint: number}]
    row: 8
    col: 0
    width: 8
    height: 6
  - name: ''
    type: text
    body_text: All applicable email addresses from each Persona tile should be contacted
      with an offer of Explore training.
    row: 2
    col: 8
    width: 16
    height: 3
  - name: Advanced Visualizations and Dashboards in Looker
    type: text
    title_text: Advanced Visualizations and Dashboards in Looker
    subtitle_text: People who may benefit from this training
    body_text: ''
    row: 14
    col: 0
    width: 24
    height: 2
  - name: Active Content Creators
    title: Active Content Creators
    merged_queries:
    - model: system__activity
      explore: history
      type: table
      fields: [history.approximate_usage_in_minutes, user.email, dashboard.count,
        look.count]
      filters:
        history.approximate_usage_in_minutes: ">=60"
        history.created_date: 30 days
        user.email: "-EMPTY"
      sorts: [history.approximate_usage_in_minutes desc]
      limit: 500
      dynamic_fields: [{table_calculation: total_content, label: Total Content, expression: "${dashboard.count}+${look.count}",
          value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
          _type_hint: number}]
      query_timezone: America/New_York
    - model: system__activity
      explore: event
      type: table
      fields: [event.count, user.email]
      filters:
        event.name: '"create_dashboard","create_dashboard_element","create_look",dashboard.run.start,"save_look","update_dashboard"'
        event.created_date: 30 days
      sorts: [event.count desc]
      limit: 500
      query_timezone: America/New_York
      join_fields:
      - field_name: user.email
        source_field_name: user.email
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: greater than, value: 14, background_color: "#FFEB3B",
        font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: [event.count]}, {type: greater than, value: 2,
        background_color: "#FFEB3B", font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: [total_content]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_grid
    series_types: {}
    hidden_fields: [dashboard.count, look.count]
    sorts: [event.count desc]
    row: 16
    col: 0
    width: 19
    height: 8
  - name: Other Advanced Modules
    type: text
    title_text: Other Advanced Modules
    subtitle_text: People who may benefit from these training offerings
    row: 24
    col: 0
    width: 24
    height: 2
  - title: Table Calculations - Looks
    name: Table Calculations - Looks
    model: i__looker
    explore: look
    type: table
    fields: [user.email, look.count, looks_with_no_table_calcs]
    filters:
      user.email: "-EMPTY"
    sorts: [looks_with_table_calcs desc]
    limit: 500
    dynamic_fields: [{table_calculation: looks_with_table_calcs, label: Looks with
          Table Calcs, expression: "(${look.count}-${looks_with_no_table_calcs})",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: looks_with_no_table_calcs, based_on: look.count,
        label: Looks with No Table Calcs, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: 'is_null(${query.dynamic_fields})'}]
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      look.count: Looks
    conditional_formatting: [{type: greater than, value: 0, background_color: "#c25c95",
        font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: [looks_with_table_calcs]}]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    hidden_fields: [dashboard.count, looks_with_no_table_calcs]
    series_types: {}
    note_state: expanded
    note_display: below
    note_text: "... and then REMOVE any that appear in this list, since it means these\
      \ people DID create table calcs on stand-alone Looks."
    listen: {}
    row: 26
    col: 12
    width: 9
    height: 8
  - title: Custom Fields - Dashboards & Looks
    name: Custom Fields - Dashboards & Looks
    model: i__looker
    explore: dashboard
    type: table
    fields: [user.email, dashboard.count, dashboards_with_custom_fields, look.count,
      looks_with_custom_fields]
    filters:
      user.email: "-EMPTY"
    sorts: [total_content_with_custom_fields]
    limit: 500
    dynamic_fields: [{table_calculation: total_content, label: Total Content, expression: "${dashboard.count}+${look.count}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: total_content_with_custom_fields,
        label: Total Content with Custom Fields, expression: "${dashboards_with_custom_fields}\
          \ + ${looks_with_custom_fields}", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number}, {measure: dashboards_with_custom_fields,
        based_on: dashboard.count, label: Dashboards with Custom Fields, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: 'contains(${query.dynamic_fields},"\"dimension\":")
          OR contains(${query.dynamic_fields},"\"measure\":")'}, {measure: looks_with_custom_fields,
        based_on: look.count, label: Looks with Custom Fields, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number, filter_expression: 'contains(${query.dynamic_fields},"\"dimension\":")
          OR contains(${query.dynamic_fields},"\"measure\":")'}]
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: 0, background_color: "#FFEB3B",
        font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: [total_content_with_custom_fields]}, {type: greater
          than, value: 4, background_color: "#FFEB3B", font_color: !!null '', color_application: {
          collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d, palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: true, italic: false, strikethrough: false, fields: [total_content]}]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    hidden_fields: [dashboard.count, dashboards_with_no_table_calcs, look.count, looks_with_no_table_calcs,
      dashboards_with_custom_fields, looks_with_custom_fields]
    series_types: {}
    listen: {}
    row: 34
    col: 3
    width: 9
    height: 7
  - title: Custom Fields - Looks
    name: Custom Fields - Looks
    model: i__looker
    explore: look
    type: table
    fields: [user.email, look.count, looks_with_custom_fields]
    filters:
      user.email: "-EMPTY"
    sorts: [looks_with_custom_fields desc]
    limit: 500
    dynamic_fields: [{measure: looks_with_custom_fields, based_on: look.count, label: Looks
          with Custom Fields, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: 'contains(${query.dynamic_fields},"\"dimension\":")
          OR contains(${query.dynamic_fields},"\"measure\":")'}]
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      look.count: Looks
    conditional_formatting: [{type: greater than, value: 0, background_color: "#c25c95",
        font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: [looks_with_custom_fields]}]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    hidden_fields: [dashboard.count, looks_with_no_table_calcs]
    series_types: {}
    row: 34
    col: 12
    width: 9
    height: 7
  - title: Advanced Filtering - Dashboards & Looks
    name: Advanced Filtering - Dashboards & Looks
    model: i__looker
    explore: dashboard
    type: table
    fields: [user.email, dashboard.count, dashboards_without_advanced_filtering, look.count,
      looks_without_advanced_filtering]
    filters:
      user.email: "-EMPTY"
    sorts: [total_content_with_advanced_filtering]
    limit: 500
    dynamic_fields: [{table_calculation: total_content, label: Total Content, expression: "${dashboard.count}+${look.count}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: total_content_with_advanced_filtering,
        label: Total Content with Advanced Filtering, expression: "(${dashboard.count}-${dashboards_without_advanced_filtering})+\n\
          (${look.count}-${looks_without_advanced_filtering})", value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, _type_hint: number}, {
        measure: dashboards_without_advanced_filtering, based_on: dashboard.count,
        label: Dashboards without Advanced Filtering, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: 'is_null(${query.filter_expression})'},
      {measure: looks_without_advanced_filtering, based_on: look.count, label: Looks
          without Advanced Filtering, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: 'is_null(${query.filter_expression})'}]
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: 0, background_color: "#FFEB3B",
        font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: [total_content_with_advanced_filtering]}, {
        type: greater than, value: 4, background_color: "#FFEB3B", font_color: !!null '',
        color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d, palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: true, italic: false, strikethrough: false, fields: [total_content]}]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    hidden_fields: [dashboard.count, dashboards_with_no_table_calcs, look.count, looks_with_no_table_calcs,
      dashboards_without_advanced_filtering, looks_without_advanced_filtering]
    series_types: {}
    listen: {}
    row: 41
    col: 3
    width: 9
    height: 7
  - title: Advanced Filtering - Looks
    name: Advanced Filtering - Looks
    model: i__looker
    explore: look
    type: table
    fields: [user.email, look.count, looks_without_advanced_filtering]
    filters:
      user.email: "-EMPTY"
    sorts: [looks_with_advanced_filtering desc]
    limit: 500
    dynamic_fields: [{measure: looks_without_advanced_filtering, based_on: look.count,
        label: Looks without Advanced Filtering, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: 'is_null(${query.filter_expression})'},
      {table_calculation: looks_with_advanced_filtering, label: Looks with Advanced
          Filtering, expression: "${look.count}-${looks_without_advanced_filtering}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      look.count: Looks
    conditional_formatting: [{type: greater than, value: 0, background_color: "#c25c95",
        font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: [looks_with_advanced_filtering]}]
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    defaults_version: 1
    hidden_fields: [dashboard.count, looks_with_no_table_calcs, looks_without_advanced_filtering]
    series_types: {}
    row: 41
    col: 12
    width: 9
    height: 7
  - name: " (2)"
    type: text
    body_text: Both the Total Content and Event column values should be yellow for
      the user to be offered the training.
    row: 16
    col: 19
    width: 5
    height: 8
  - title: Merged Results
    name: Merged Results
    model: system__activity
    explore: dashboard
    type: table
    fields: [user.email, dashboard.count, look.count, dashboards_without_merged_results]
    sorts: [dashboards_with_merged_results]
    limit: 500
    dynamic_fields: [{table_calculation: total_content, label: Total Content, expression: "${dashboard.count}+${look.count}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: dashboards_with_merged_results, label: Dashboards
          with Merged Results, expression: "${dashboard.count}-${dashboards_without_merged_results}",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {measure: dashboards_without_merged_results, based_on: dashboard.count,
        label: Dashboards without Merged Results, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: measure, _type_hint: number, filter_expression: 'is_null(${result_maker.merge_query_id})'},
      {measure: looks_without_merged_results, based_on: look.count, label: Looks without
          Merged Results, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, filter_expression: 'is_null(${result_maker.merge_query_id})'}]
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_labels:
      dashboard.count: Dashboards
    series_cell_visualizations:
      dashboard.count:
        is_active: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: equal to, value: 0, background_color: "#FFEB3B",
        font_color: !!null '', color_application: {collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d,
          palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: true, italic: false,
        strikethrough: false, fields: [dashboards_with_merged_results]}, {type: greater
          than, value: 9, background_color: "#FFEB3B", font_color: !!null '', color_application: {
          collection_id: 0a5cba20-3b6e-4739-b9e3-ba1d442d992d, palette_id: 56b9d528-ab62-436e-a74d-7a44fc9d45c7,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: number,
                value: !!null ''}, max: {type: maximum}}, mirror: true, reverse: false,
            stepped: false}}, bold: true, italic: false, strikethrough: false, fields: [
          total_content]}]
    hidden_fields: [look.count, dashboards_without_merged_results, dashboard.count]
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
    row: 48
    col: 3
    width: 9
    height: 7
