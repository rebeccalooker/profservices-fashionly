connection: "thelook_events_redshift"

include: "/users_another.view.lkml"                # include all views in the views/ folder in this project
include: "/order_items.view"
explore: users {}

explore: order_items {}
