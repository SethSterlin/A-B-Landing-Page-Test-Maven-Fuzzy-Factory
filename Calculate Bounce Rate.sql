USE mavenfuzzyfactory;

SELECT
	*
FROM
	website_pageviews;
    
-- Most-viewed website pages, ranked by session volume
SELECT
	DENSE_RANK() OVER (ORDER BY COUNT(DISTINCT website_pageview_id) DESC) AS ranking,
	pageview_url,
    COUNT(DISTINCT website_pageview_id) AS session
FROM
	website_pageviews
WHERE
	created_at < '2012-06-09'
GROUP BY pageview_url
ORDER BY session DESC;

-- First Entry Page

USE mavenfuzzyfactory;

SELECT
	*
FROM
	website_pageviews;

-- STEP 1 : Finding the first website_pageview_id for relevant session
CREATE TEMPORARY TABLE first_pageviews
SELECT
	website_session_id,
    MIN(DISTINCT website_pageview_id) AS first_pageview_id
FROM
	website_pageviews
WHERE
	created_at < '2012-06-14'
GROUP BY 
	website_session_id;
    
SELECT * FROM first_pageviews;

-- STEP 2 : Identifying the landing page of each session
CREATE TEMPORARY TABLE total_session
SELECT
	fp.website_session_id,
    wp.pageview_url AS landing_page
FROM
	first_pageviews fp
    LEFT JOIN
    website_pageviews wp ON fp.first_pageview_id = wp.website_pageview_id;
    
SELECT * FROM total_session;

SELECT
	landing_page,
    COUNT(website_session_id)
FROM
	total_session
GROUP BY
	landing_page;

-- STEP 3 : Counting bounced sessions
CREATE TEMPORARY TABLE bounced_sessions
SELECT
	ts.website_session_id,
    ts.landing_page,
    COUNT(wp.website_pageview_id) AS count_pages_viewed
FROM
	total_session ts
    LEFT JOIN
    website_pageviews wp ON wp.website_session_id = ts.website_session_id
GROUP BY
	ts.website_session_id,
    ts.landing_page
HAVING
	COUNT(wp.website_pageview_id) = 1;
    
SELECT * FROM bounced_sessions;

-- STEP 4 : Calculate Bounce Rate
SELECT
	COUNT(bs.website_session_id) AS total_bounced_sessions,
	COUNT(ts.website_session_id) AS total_sessions,
	COUNT(bs.website_session_id) / COUNT(ts.website_session_id) AS bounce_rate
FROM
	total_session ts
    LEFT JOIN
    bounced_sessions bs ON ts.website_session_id = bs.website_session_id
ORDER BY
	ts.website_session_id;
    
-- bounce rate = 59.18%