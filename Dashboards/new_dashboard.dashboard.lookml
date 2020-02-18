- dashboard: new_dashboard
  title: New Dashboard
  layout: newspaper
  elements:
  - name: Orders and Ages
    title: Orders and Ages
    model: bug_or_issues_reproduction
    explore: order_items
    type: looker_column
    fields: [order_items.created_month, order_items.count, users.count, order_items.count_of_orders]
    fill_fields: [order_items.created_month]
    filters:
      order_items.created_month: 6 months
    sorts: [order_items.created_month desc]
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      Brand: products.brand
    row: 0
    col: 0
    width: 8
    height: 6
  - title: states
    name: states
    model: rebecca_fashionly
    explore: users
    type: table
    fields: [users.state, users.average_days_since_signup]
    sorts: [users.state]
    limit: 500
    query_timezone: America/Los_Angeles
    listen:
      Brand: inventory_items.product_brand
    row: 0
    col: 8
    width: 8
    height: 6
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: Calvin Klein
    allow_multiple_values: true
    required: false
    model: rebecca_fashionly
    explore: products
    listens_to_filters: []
    field: products.brand
