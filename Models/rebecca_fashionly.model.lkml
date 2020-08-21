connection: "thelook_events_redshift"

# include all the views
include: "/order_items.view"
include: "/events.view"
include: "/users.view"
include: "/returns.view"
include: "/inventory_items.view"
include: "/products.view"
include: "/orders_completed.view"
include: "/suggestions.view"
include: "/product_comparisons.view"
include: "/user_facts.view"
include: "/user_facts_ndt.view"
include: "/users_ext.view"
include: "/monthly_user_orders.view"
include: "/distribution_centers.view"
include: "/date_series.view"
include: "/dynamic_table.view"
include: "/data_tests.lkml"
include: "/data_tests_2.lkml"

# include all the dashboards
#include: "/Examples/*.dashboard"
include: "/Dashboards/*.dashboard"
# include: "/Dashboards/inventory_test.dashboard"

aggregate_awareness: yes

datagroup: rebecca_fashionly_default_datagroup {
  sql_trigger: SELECT COUNT(*) FROM {{ _user_attributes['my_tables'] }}.columns ;;
  max_cache_age: "1 hour"
}

persist_with: rebecca_fashionly_default_datagroup

access_grant: info_for_not_nothugo {      # my own value is 'nothugo'
  user_attribute: department
  allowed_values: ["hugo"]
}

access_grant: can_see_sensitive_data {
  user_attribute: can_see_pii
  allowed_values: ["Yes"]
}

explore: events {
  fields: [ALL_FIELDS*, -users.average_spend_per_customer
                      , -users.total_sales_new_customers
                      , -users.number_of_customers_returning_items
                      , -users.percent_of_users_with_returns
                      , ]
  join: users {
    view_label: "Join level"
   type: left_outer
   sql_on: ${events.user_id} = ${users.id} ;;
   relationship: many_to_one
  }
}


explore: order_items {
  fields: [ALL_FIELDS*,
#     -users.count_orders_dynamic
    ]
#   always_filter: {
#     filters: { field: order_items.created_date value: "3 days" }
#   }
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
#     sql_where: ${users.country} = 'US' ;;
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

#   join: distribution_centers {
#     type: left_outer
#     sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
#     relationship: many_to_one
#   }

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

explore: products { # hidden:  yes   -- if just making this for suggestions
  join: suggestions {
    type: cross
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${products.id} = ${inventory_items.product_id} ;;
    relationship: one_to_many
    # sql_having: ${inventory_items.count} > 5 ;;
  }
}

explore: product_comparisons {
  view_label: "Product"
#   join: distribution_centers {
#    type: left_outer
#    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
#    relationship: many_to_one
#   }
#
#   join: inventory_items {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: one_to_many
#   }
#
#   join: order_items {
#     type: left_outer
#     sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
#     relationship: one_to_many
#   }
}

explore: users {

  access_filter: {
    user_attribute: country
    field: users.country
  }

  fields: [
    ALL_FIELDS*,
    -order_items.user_id,
    -order_items.id,
    -inventory_items.id,
    -inventory_items.product_distribution_center_id,
    -inventory_items.product_id,
    -inventory_items.created_date
  ]

#   join: dynamic_view {
#     type: left_outer
#     sql_on: ${users.id} = ${dynamic_view.order_id} ;;
#     relationship: many_to_one
#   }

  join: order_items {
    type: left_outer
    sql_on: ${users.id} = ${order_items.user_id} ;;
    relationship: one_to_many
  }

  join: orders_completed {
    view_label: "Orders"
    type: left_outer
    sql_on: ${users.id} = ${orders_completed.user_id} ;;
    relationship: one_to_many
  }

  join: returns {
    type: left_outer
    sql_on: ${users.id} = ${returns.user_id} ;;
    relationship: one_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

#   join: event_facts {
#     view_label: "Session Details"
#     type: left_outer
#     sql_on: ${users.id} = ${event_facts.user_id} ;;
#     relationship: one_to_many
#   }

  join: user_facts {
    view_label: "Customer Facts"
    type: inner
    sql_on: ${users.id} = ${user_facts.customer_id} ;;
    relationship: one_to_one
  }

#   join: user_order_sequences {
#     view_label: "Customer Facts"
#     from: order_sequences
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${users.id} = ${user_order_sequences.user_id} ;;
#     fields: [user_order_sequences.min_inter_order_days,
#       user_order_sequences.is_quick_repurchase_customer,
#       user_order_sequences.avg_days_between_orders,
#       user_order_sequences.max_days_between_orders]
#   }

#   join: order_sequences {
#     view_label: "Orders"
#     type: left_outer
#     relationship: one_to_many
#     sql_on: ${users.id} = ${order_sequences.user_id}
#             and ${order_items.order_id} = ${order_sequences.order_id} ;;
#     fields: [order_sequences.order_sequence_number,
#       order_sequences.days_until_next_order,
#       order_sequences.is_first_purchase,
#       order_sequences.has_subsequent_order]
#   }
  join: suggestions {
    type: inner
    sql_on: ${users.state} = ${suggestions.state} ;;
    relationship: many_to_one
  }
}

explore: users_ext {
  label: "Users+"
  extends: [users]          ## activate the joins so you don't need to retype them
  view_name: users      ## set view name back to the original explore's base view name
  from: users_ext       ## change the base view of the Explore to the users_ext view
  view_label: "Users"
}

# explore: custom_dimension_test {
#   from: users_ext
#   view_name: users_ext
#   fields: [ALL_FIELDS*,
#           users_ext.total_sales_to_women,
#           users_ext.average_gross_margin,
#           users_ext.total_gross_margin,
#           users_ext.average_spend_per_customer,
#           users_ext.total_sales_new_customers,
#           users_ext.number_of_customers_returning_items,
#           users_ext.percent_of_users_with_returns,
#           ]
# }

explore: order_items_basic {
  extends: [order_items]
  view_name: order_items
  join: users {
    from: users_ext
    type: inner
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  hidden: yes
}

explore: users_with_ndt {
  extends: [users]
  view_name: users
  from: users

  join: user_facts_ndt {
    sql_on: ${users.id} = ${user_facts_ndt.id} ;;
    type: inner
    relationship: one_to_one
  }
}

explore: monthly_user_orders {}

explore: dynamic_table {
  fields: [dynamic_table.id, dynamic_table.created_date,
    dynamic_table.select_table
    ]
}

explore: suggestions { hidden: yes }
