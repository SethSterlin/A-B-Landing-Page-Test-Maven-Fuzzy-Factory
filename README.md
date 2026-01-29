




# Analyzing Website Performance (A/B Testing Method)

## Project Background

**Maven Fuzzy Factory** is a fictional e-commerce company that sells a flagship product called *The Original Mr. Fuzzy*, along with related merchandise.  
The dataset simulates real-world online retail operations, capturing the complete customer journey from website visits to purchases and refunds.

As the business grew, Maven Fuzzy Factory invested in **paid digital marketing channels**, particularly **Google Search (nonbrand)** campaigns, to attract new users to the website. However, despite increasing traffic, overall conversion performance remained low, with a large proportion of users leaving the site shortly after arrival.

This project analyzes **user behavior at the very beginning of the website journey (Top of Funnel)**  
to understand **which page users land on first and whether they tend to leave the site immediately**.

The analysis uses **session-level data collected before and after the launch of a new landing page**  
to compare the performance of the **Homepage** versus a **Custom Landing Page** through **A/B testing**.

The primary objectives are to **reduce bounce rate**, **increase user engagement**, and **create more opportunities for downstream conversions**.

### Project Highlights

- Analyzed **entry pages and bounce rate** using session-level data  
- Discovered that **100% of sessions started on the Homepage**  
- Measured an overall **bounce rate of 59%**, indicating significant top-funnel drop-off  
- Designed and tested a **new landing page using A/B testing**  
- The new landing page **significantly reduced bounce rate** compared to the Homepage

---

## Data Structure, Initial Checks, and Key Concepts

### Dataset used

[Maven Fuzzy Factory](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Calculate%20Bounce%20Rate.sql)  

This ERD consists of six tables: website_sessions, website_pageviews, orders, order_items, products, and order_item_refunds, representing the full e-commerce funnel from traffic to refunds.
The dataset contains a total of 472,871 records across all tables.


![ERD Schema](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Maven%20ERD.png?raw=true)

Prior to beginning the analysis, a variety of quality control checks were performed to become familiar with the dataset. SQL was used during this stage to validate data integrity, identify missing or inconsistent values, and quickly explore large tables through aggregation and filtering.

### Web Analytics Concepts (Sessions vs Pageviews)

In web analytics, it's important to **understand the difference between a session, a visit, and a pageview**.

> **1 Session = 1 Visit**

A session (or visit) begins when a user enters your website and ends after a certain period of inactivity (usually 30 minutes) or when they leave the site.

> Think of it like a trip to a store:

When you walk into the store, look around, and leave — that’s one visit (one session).

> **1 Visit can include multiple pageviews**

During one session, a user might view several pages on your site. Each time a page loads, that’s called a pageview.
![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250711184209.png?raw=true)

**Example:** A user visits your site and navigates through these pages in one session:
/home → /product → /the-original-mr-fuzzy → /cart → /billing

In this case:

> Session = 1 (the entire visit)

> Pageviews = 5 (because the user viewed 5 different pages)

**Why It Matters**
By tracking sessions and pageviews, we can:

Understand how users move through the site

Measure how engaging each page is

Identify where users drop off or lose interest

Optimize the experience to increase conversion rates

### What is the first pages users land?

Based on session data collected prior to **June 9, 2012**, the following pages were identified as the most visited on the website:

The funnel below illustrates how user sessions progress through the website, from the home page to the billing stage.

- Most sessions start on the **/home** page (10,403 sessions).
- Significant drop-offs occur as users move from **product pages to the cart**.
- Only a small fraction of users reach the checkout steps (**/shipping** and **/billing**).
- Overall, **approximately 1% of total sessions result in a completed purchase**.

This funnel highlights key opportunities to optimize landing pages and product pages to improve conversion rates.

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Most-viewed%20website%20pages,%20ranked%20by%20session%20volume.png?raw=trueraw=true)

#### Key Insight

Although the homepage, products page, and the Mr. Fuzzy product page receive the majority of traffic, only around 1% of total sessions result in a completed purchase. This suggests that a large proportion of users drop off early in the funnel, before reaching deeper engagement or checkout stages.

#### Entry Page Attribution

To better understand where this drop-off begins, traffic was attributed to the first page viewed in each session (entry page attribution). Focusing on the initial touchpoint allows us to evaluate whether users are engaging with the site immediately upon landing.

#### Finding

The analysis shows that all sessions during the observed period began on the homepage (/home), making it the sole entry point for user traffic. Given this structure, early exits from the homepage would have a significant impact on overall conversion performance.  
As a result, the next step is to examine user behavior at the landing stage, with **Bounce Rate** serving as a key metric to quantify immediate drop-offs.

### Bounce Rate

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250711184451.png?raw=true)

**Bounce Rate** is the percentage of website visitors who leave the site after viewing only one page without taking any further action (such as clicking a link, making a purchase, or navigating to another page). These visitors are called **Bounced Sessions** because their session ends after viewing just a single page.

<p align="center"> 
  <img src="https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250711184711.png?raw=true" /> 
</p>

---

## Analysis Methodology

### Calculated Bounce Rate

I calculate Bounce Rate because it helps me understand **how engaging and relevant** the landing pages are to visitors. A high bounce rate may indicate that users aren’t finding what they expect or that the page experience needs improvement.

Bounce Rate was calculated to measure the proportion of user sessions in which visitors left the website after viewing only a single page.

The calculation process involved:

- Identifying the first pageview of each session to determine the landing page

- Classifying sessions as bounced sessions if only one pageview occurred during the session

- Calculating Bounce Rate by dividing the number of bounced sessions by the total number of sessions within the analysis period

Using this method, the Bounce Rate prior to June 14, 2012 was calculated to be 59.18%, indicating a high level of early user drop-off at the landing stage.

> The problem is that I calculated the **Bounce Rate to be 59%**, which is quite high.

To address the high **Bounce Rate** (59%), a **custom landing page** is being developed specifically for search traffic. This new version is designed to better align with visitor intent and encourage deeper engagement.

An **A/B test** will be conducted to compare the **new custom landing page** against the **current homepage**, using **Bounce Rate** as the primary performance metric.

This experiment will help determine whether the new page design effectively reduces drop-offs and improves user interaction.

The full SQL query used to calculate Bounce Rate is available [here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Calculate%20Bounce%20Rate.sql)  

### A/B Testing Methodology (Landing Page Experiment)

An A/B test was conducted to evaluate whether the new custom landing page (/lander-1) reduced bounce rate compared to the existing homepage (/home) for paid search traffic.

The experiment focused exclusively on Google Search (nonbrand) sessions to ensure a consistent traffic source and user intent.

Experimental Design

The full SQL script used to perform this A/B test is available [here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/AB%20testing.sql)  

The analysis followed these steps:

Identify the launch point of the new landing page
The first appearance of /lander-1 was identified to establish the start of the test period and ensure only post-launch sessions were included.

Select relevant test sessions
Sessions were filtered to include only:

Sessions created after the new landing page launch

Traffic from Google Search (nonbrand) paid campaigns

Sessions occurring before July 28, 2012

Determine the landing page for each session
For each session, the first pageview was extracted to identify whether users landed on /home or /lander-1.

Identify bounced sessions
Sessions were classified as bounced if only one pageview occurred during the entire session.

Calculate Bounce Rate by landing page
Bounce Rate was calculated separately for /home and /lander-1 by dividing bounced sessions by total sessions for each landing page.

Result Summary

**The new landing page (/lander-1) achieved a lower bounce rate (53.22%) compared to the homepage (58.34%)**, indicating improved user engagement for paid search traffic.
This result suggests that aligning landing page design more closely with user intent can effectively reduce early session drop-offs.

![enter image description here](https://raw.githubusercontent.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/refs/heads/main/9effb71f-0020-4d98-a302-f2797e89445e.png)

---

### Recomentations

Based on the insights uncovered from funnel analysis and A/B testing results, the following recommendations are proposed to improve user engagement and conversion performance.

- **Redirect paid search traffic to the new landing page (/lander-1).**
The A/B test shows that the new landing page achieved a lower bounce rate (53.22%) compared to the homepage (58.34%) for Google Search (nonbrand) traffic. Routing paid traffic to /lander-1 should reduce early drop-offs and improve session quality.

- **Prioritize landing page optimization over downstream funnel stages.**
Since 100% of sessions enter through the homepage, early-stage engagement has the highest impact on overall conversion performance. Improving the landing experience should be treated as a higher priority than checkout-stage optimizations.

- **Strengthen above-the-fold messaging to align with user intent.**
The high pre-test bounce rate (~59%) indicates a mismatch between user expectations and landing page content. Clearer value propositions, stronger CTAs, and intent-matched messaging should be emphasized to encourage deeper site exploration.

- **Expand A/B testing beyond Bounce Rate as the sole metric.**
While Bounce Rate is effective for measuring immediate engagement, future experiments should also evaluate downstream metrics such as product page click-through rate, add-to-cart rate, and conversion rate to ensure business impact.

- **Apply a segmented landing page strategy across acquisition channels.**
The improvement seen in paid search traffic suggests that a single generic homepage may not effectively serve all traffic sources. Creating channel-specific landing pages could further improve engagement and conversion outcomes.

## Resources

- SQL Scripts:  
  - [Calculate Bounce Rate](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Calculate%20Bounce%20Rate.sql)  
  - [A/B Testing](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/AB%20testing.sql)  

- Tableau:  
  - [Most-viewed website pages ranked by session volume](https://public.tableau.com/views/Most-viewedwebsitepagesrankedbysessionvolume2/Dashboard1?:language=th-TH&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
