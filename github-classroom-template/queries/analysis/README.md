# Analysis Queries

This folder contains the main queries for your project deliverables.

## Guidelines

- **One query per file** (makes collaboration easier)
- **Descriptive filenames**: `top_restaurants_by_rating.sql` not `query1.sql`
- **Use the template format** from `../exploration/sample_query.sql`
- **Test thoroughly** before marking as complete
- **Update main README** with query status

## Suggested Query Organization

Group queries by topic:
- `business_*.sql` - Business-related queries
- `user_*.sql` - User behavior queries
- `review_*.sql` - Review analysis queries
- `category_*.sql` - Category/industry analysis

## Using GitHub Copilot

Write clear comments describing what you want:

```sql
-- Find restaurants in Phoenix with 4+ stars and at least 100 reviews
-- Include business name, exact address, rating, and review count
-- Sort by rating (highest first), then by review count
```

Then let Copilot generate the SQL!
