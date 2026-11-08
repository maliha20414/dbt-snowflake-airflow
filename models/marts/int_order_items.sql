SELECT
    line_item.order_item_key,
    line_item.part_key,
    line_item.line_number,
    orders.order_key,
    orders.customer_key,
    orders.order_date,
    line_item.extended_price,

    {{ discounted_amount(
        'line_item.extended_price',
        'line_item.discount_percentage'
    ) }} AS discounted_amount

FROM {{ ref('stg_tpch_orders') }} AS orders

JOIN {{ ref('stg_tpch_line_items') }} AS line_item
    ON orders.order_key = line_item.order_key