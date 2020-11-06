
test: users_in_2017 {
  explore_source: users {
    column: count_of_users_old {}
    filters: {
      field: users.created_date
      value: "2017"
    }
  }

  assert: there_are_users_in_2017 {
    expression: ${users.count_of_users_old} = 11478 ;;
  }
}
