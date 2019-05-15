- dashboard: testdashboard
  title: TestDashBoard
  layout: newspaper
  load_configuration: wait
  elements:
  - title: Test Title
    name: Test Title
    model: thelook_local
    explore: products
    type: table
    fields:
    - products.brand
    - products.count
    sorts:
    - products.count desc
    limit: 500
    query_timezone: America/Denver
    row: 0
    col: 0
    width: 8
    height: 6
