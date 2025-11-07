# Model Shop Entity Relationship Diagram

```mermaid
erDiagram
    Customer {
        int customer_id PK
        string cust_name
        string cust_email
        string cust_phone
        string cust_address
    }

    Manufacturer {
        int manufacturer_id PK
        string manufacturer_name
        string manufacturer_website
    }

    Product {
        int product_id PK
        int manufacturer_id FK
        string product_name
        string model_type
        decimal model_price
        int min_order_qty
        string scale
    }

    Inventory {
        int product_id PK,FK
        int qoh
        int reorder_level
    }

    Invoice {
        int invoice_number PK
        int customer_id FK
        date invoice_date
        decimal total_amount
        decimal shipping_charge
        string invoice_status
    }

    Line {
        int invoice_number PK,FK
        int line_number PK
        int product_id FK
        int line_units
        decimal unit_price
        string line_status
        date ship_date
    }

    Shipment {
        int shipment_id PK
        int invoice_number FK
        int line_number FK
        int qty_shipped
        date ship_date
        string tracking_number
        string shipment_status
    }

    Customer ||--o{ Invoice : generates
    Manufacturer ||--o{ Product : produces
    Product ||--|| Inventory : "tracks stock"
    Product ||--o{ Line : "appears on"
    Invoice ||--|{ Line : contains
    Line ||--o{ Shipment : "shipped via"
    Invoice ||--o{ Shipment : has
```

## Notes

### Entity Details
- All IDs are unique and non-null integers
- Phone numbers must be 10 digits
- Prices and amounts must be >= 0
- Units and quantities must be positive integers

### Enum Values
- `invoice_status`: Open, Partially Shipped, Closed
- `line_status`: Backordered, Partial, Fulfilled
- `shipment_status`: Created, Shipped, Delivered
- `model_type`: Car, Aircraft, Ship, Decal
- `scale`: 1/144, 1/100, 1/72, 1/48, 1/35, 1/32, 1/24

### Key Business Rules
1. Invoice acts as order header (no separate order table)
2. Shipment handles partial deliveries
3. Inventory triggers reorder when qoh ≤ reorder_level
4. Line table snapshots prices at order time
5. Credit card processing is external
6. `qty_shipped` cannot exceed `line_units`
7. Shipment date must be ≥ invoice date