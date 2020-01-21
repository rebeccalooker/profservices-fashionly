view: suggestions {
  derived_table: {
    sql: select distinct state
          from public.users
          where country = {{ _user_attributes['country'] | | prepend: "'" | append: "'" }}
       ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

}
