# include: "/Model/rebecca_fashionly.model"

test: test_recent_event_data {
  explore_source: events {
    column: count { field: events.count }
    filters: {
#       field: created_date
      field: events.created_date
      value: "3 days"
    }
  }
  assert: recent_events_exist {
    expression: ${events.count} > 0 ;;
  }
}

test: test_2018_event_data {
  explore_source: events {
    column: count { field: events.count }
    filters: {
      field: events.created_date
      value: "2018"
    }
    timezone: "America/Los_Angeles"
  }
  assert: 2018_event_data_is_correct {
    expression: ${events.count} = 843862 ;;
  }
}
#

test: products_mens_items {
  explore_source: products {
    column: count {}
    filters: {
      field: products.department
      value: "Men"
    }
  }
  assert: count_of_mens_products_is_correct {
    expression: ${products.count} = 13131 ;;
  }
}
