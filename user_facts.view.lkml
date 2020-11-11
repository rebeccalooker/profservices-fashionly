view: user_facts {
  derived_table: {
    sql: SELECT
        order_items.user_id as user_id
        , COUNT(DISTINCT order_items.order_id) as lifetime_orders
        , SUM(order_items.sale_price) AS lifetime_revenue
        , MIN(NULLIF(order_items.created_at,0)) as first_order
        , MAX(NULLIF(order_items.created_at,0)) as latest_order
        , COUNT(DISTINCT DATE_TRUNC('month', NULLIF(order_items.created_at,0))) as number_of_distinct_months_with_orders
        , SUM(order_items.sale_price) AS order_value
      FROM order_items
      GROUP BY user_id ;;

    # sql_trigger_value: select current_date ;;
    # datagroup_trigger: midnight

    # sortkeys: ["user_id"]
    # distribution: "user_id"
    }

    dimension_group: first_order {
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.first_order ;;
    }

    dimension_group: latest_order {
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.latest_order ;;
    }

    dimension: user_id {
      primary_key: yes
      sql: ${TABLE}.user_id ;;
      hidden: yes
    }

    dimension: order_value {
      type: number
      value_format_name: usd
      sql: ${TABLE}.order_value ;;
      hidden: yes
    }

    dimension: lifetime_orders {
      type: number
      sql: ${TABLE}.lifetime_orders ;;
      hidden: yes
    }

    dimension: lifetime_revenue {
      type: number
      sql: ${TABLE}.lifetime_revenue ;;
      hidden: yes
    }

    dimension: distinct_months_with_orders {
      type: number
      sql: ${TABLE}.number_of_distinct_months_with_orders ;;
    }

    measure: average_order_value {
      type: average
      sql:${TABLE}.order_value ;;
      value_format_name: usd
    }

    measure: average_lifetime_revenue {
      type: average
      sql: ${lifetime_revenue} ;;
      value_format_name: usd
    }

    measure: average_lifetime_orders {
      type: average
      sql: ${lifetime_orders} ;;
      value_format_name: decimal_1
    }
  }


# If necessary, uncomment the line below to include explore_source.
# include: "rebecca_fashionly.model.lkml"
# include: "order_items.view"

view: user_facts_ndt {
  derived_table: {
    # datagroup_trigger: rebecca_fashionly_default_datagroup
    # distribution_style: even
    sortkeys: ["id"]
    explore_source: users {
      column: id {}
      column: count_orders_made { field: order_items.count_orders_made }
      column: total_gross_revenue { field: order_items.total_gross_revenue }
      column: items_returned { field: order_items.items_returned }
      column: average_sale_price { field: order_items.average_sale_price }
      expression_custom_filter: ${users.country} = "USA" ;;
    }
  }
  dimension: id {
    type: number
    primary_key: yes
  }
  dimension: count_orders_made {
    type: number
  }
  dimension: total_gross_revenue {
    value_format: "$#,##0.00"
    type: number
  }
  dimension: items_returned {
    type: number
  }
  dimension: average_sale_price {
    value_format: "$#,##0.00"
    type: number
  }
}
