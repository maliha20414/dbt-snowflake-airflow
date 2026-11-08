SELECT
    order_key,

    SUM(extended_price) AS gross_item_sales_amount,

    SUM(extended_price - discounted_amount) AS item_discount_amount,

    SUM(discounted_amount) AS net_item_sales_amount

FROM {{ ref('int_order_items') }}

GROUP BY order_key