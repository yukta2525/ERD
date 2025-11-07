/*
==============================================================================
QUERY TEMPLATE
==============================================================================
Purpose:     [Describe what this query is meant to find or analyze]
Author:      [Your name]
Date:        [YYYY-MM-DD]
Dataset:     Yelp
Status:      [Exploration / In Progress / Complete]
==============================================================================
*/

-- Use GitHub Copilot: Write comments describing what you want, then let Copilot suggest the SQL
-- Example: Find the top 10 businesses by review count in Arizona

-- Your SQL query here
SELECT TOP 10
    business_id,
    name,
    city,
    stars,
    review_count
FROM businesses
WHERE state = 'AZ'
ORDER BY review_count DESC;

/*
==============================================================================
RESULTS & NOTES
==============================================================================
Expected Results: [What you expect to find]
Actual Results:   [What you actually found]
Performance:      [How long the query took]
Next Steps:       [What to explore next based on these results]
==============================================================================
*/
