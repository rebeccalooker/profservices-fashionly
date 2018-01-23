connection: "thelook_events"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: rebecca_fashionly_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rebecca_fashionly_default_datagroup

# explore: bsandell {}

# explore: company_list {}

# explore: distribution_centers {}

# explore: events {
#  join: users {
#    type: left_outer
#    sql_on: ${events.user_id} = ${users.id} ;;
#    relationship: many_to_one
#  }
# }

# explore: inventory_items {
#  join: products {
#    type: left_outer
#    sql_on: ${inventory_items.product_id} = ${products.id} ;;
#    relationship: many_to_one
#  }

#  join: distribution_centers {
#    type: left_outer
#    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
#    relationship: many_to_one
#  }
# }

explore: order_items {
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

  join: returns {
    type: left_outer
    sql_on: ${order_items.id} = ${returns.item_id} ;;
    relationship: one_to_one
  }

  join: orders_completed {
    view_label: "Order Items"
    type: left_outer
    sql_on: ${order_items.id} = ${orders_completed.item_id} ;;
    relationship: one_to_one
  }
}

# explore: products {
#  join: distribution_centers {
#    type: left_outer
#    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
#    relationship: many_to_one
#  }
# }

explore: users {
  label: "Customers"
  fields: [
    ALL_FIELDS*,
    -order_items.user_id,
    -order_items.id,
    -inventory_items.id,
    -inventory_items.product_distribution_center_id,
    -inventory_items.product_id,
    -inventory_items.created_date
    ]

  join: returns {
    type: left_outer
    sql_on: ${users.id} = ${returns.user_id} ;;
    relationship: one_to_one
  }

  join: order_items {
    type: left_outer
    sql_on: ${users.id} = ${order_items.user_id} ;;
    relationship: one_to_many
  }

  join: orders_completed {
    view_label: "Order Items"
    type: left_outer
    sql_on: ${users.id} = ${orders_completed.user_id} ;;
    relationship: one_to_many
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }
}

explore: user_patterns {
  label: "Customer Behavior"
#  join: users {
#    type: inner
#    sql_on: ${users.id} = ${user_patterns.customer_id} ;;
#    relationship: one_to_one
#  }
}
