USE mavenfuzzyfactory;

SELECT
	*
FROM
	website_pageviews
WHERE
	pageview_url = '/lander-1';

-- STEP 1 : find out when the new landing page launched
SELECT
	MIN(created_at) AS first_launched,
    MIN(website_pageview_id) AS first_pageview_id
FROM
	website_pageviews
WHERE
	pageview_url = '/lander-1';
    
-- first launched = '2012-06-19 00:35:54'
-- first pageview id = 23504

SELECT * FROM website_sessions;

-- STEP 2 : finding the first website pageview id for relevant sessions
CREATE TEMPORARY TABLE first_test_pageviews
SELECT
	wp.website_session_id,
    MIN(wp.website_pageview_id) AS first_pageview_id
FROM
	website_pageviews wp
    JOIN
    website_sessions ws ON ws.website_session_id = wp.website_session_id
    AND ws.created_at < '2012-07-28'
    AND wp.website_pageview_id > 23504
    AND utm_source = 'gsearch'
    AND utm_campaign = 'nonbrand'
GROUP BY
	wp.website_session_id;
    
SELECT * FROM first_test_pageviews;

-- STEP 3 : Identifying the landing page of each session
CREATE TEMPORARY TABLE nonbrand_test_session
SELECT
	ftp.website_session_id,
    wp.pageview_url AS landing_page
FROM
	first_test_pageviews ftp
    LEFT JOIN
    website_pageviews wp ON wp.website_pageview_id = ftp.first_pageview_id
WHERE
	wp.pageview_url IN ('/home','/lander-1');
    
SELECT * FROM nonbrand_test_session;
    
-- STEP 4 : Counting Bounced Sessions
CREATE TEMPORARY TABLE bounced_test_sessions
SELECT
	nts.website_session_id,
	nts.landing_page,
    COUNT(wp.website_pageview_id) AS count_page_viewed
FROM
	nonbrand_test_session nts
    LEFT JOIN
    website_pageviews wp ON wp.website_session_id = nts.website_session_id
GROUP BY
	nts.website_session_id,
	nts.landing_page
HAVING
	COUNT(wp.website_pageview_id) = 1;
    
SELECT * FROM bounced_test_sessions;

-- STEP 4 : Calculate Bounce Rate
SELECT
	nts.landing_page,
	COUNT(DISTINCT bts.website_session_id) AS total_bounced_sessions,
	COUNT(DISTINCT nts.website_session_id) AS total_sessions,
	COUNT(DISTINCT bts.website_session_id) / COUNT(DISTINCT nts.website_session_id) AS bounce_rate
FROM
	bounced_test_sessions bts
    RIGHT JOIN
    nonbrand_test_session nts ON nts.website_session_id = bts.website_session_id
GROUP BY
	nts.landing_page;
    
-- New landing page has lower bounce rate as 53.22% < 58.34% of /home landing page
-- nonbrand campaign paid traffic is pointing to the new page (lander-1)