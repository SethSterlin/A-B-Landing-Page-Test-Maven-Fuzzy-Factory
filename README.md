




# Analyzing Website Performance (A/B Testing Method)

## Project Background

This project analyzes **user behavior at the very beginning of the website journey (Top of Funnel)**  
to understand **which page users land on first and whether they tend to leave the site immediately**.

The analysis uses **session-level data collected before and after the launch of a new landing page**  
to compare the performance of the **Homepage** versus a **Custom Landing Page** through **A/B testing**.

The primary objectives are to **reduce bounce rate**, **increase user engagement**, and **create more opportunities for downstream conversions**.

---

### Project Highlights

- Analyzed **entry pages and bounce rate** using session-level data  
- Discovered that **100% of sessions started on the Homepage**  
- Measured an overall **bounce rate of 59%**, indicating significant top-funnel drop-off  
- Designed and tested a **new landing page using A/B testing**  
- The new landing page **significantly reduced bounce rate** compared to the Homepage

---

## Data Structure & Initial Checks

### Dataset used

[Maven Fuzzy Factory](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Calculate%20Bounce%20Rate.sql)  

This ERD consists of six tables: website_sessions, website_pageviews, orders, order_items, products, and order_item_refunds, representing the full e-commerce funnel from traffic to refunds.
The dataset contains a total of 472,871 records across all tables.


![ERD Schema](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Maven%20ERD.png?raw=true)

Prior to beginning the analysis, a variety of quality control checks were performed to become familiar with the dataset. SQL was used during this stage to validate data integrity, identify missing or inconsistent values, and quickly explore large tables through aggregation and filtering.

---

## Objectives

1. Identify the first page users land on (Entry Page Attribution)  
2. Evaluate user engagement using **Bounce Rate**  
3. Test whether the new landing page reduces immediate exits  
4. Generate insights to improve **UX** and increase paid campaign effectiveness  

---

## Key Metrics & Analysis

### Key Metrics
- Sessions  
- Pageviews  
- Bounce Rate  
- Entry Page Distribution  

### Key Analyses
- Analyzed **most-visited pages** by session volume  
- Calculated bounce rate using:

> _**Which webpage do most users land on first, and how likely are they to continue browsing beyond that initial page?**_


**This project helps the business reduce customer drop-off** at the top of the funnel, identify which landing pages are most effective in retaining traffic, and make data-driven decisions to improve user experience and maximize ROI on paid ad campaigns.

By reducing bounce rate, we increase the likelihood of deeper site engagement, product discovery, and ultimately—more conversions and revenue.

Using session data collected prior to **June 9, 2012**, I analyzed the most visited pages, identified the main entry point, and evaluated user engagement by calculating bounce rates. These insights laid the groundwork for potential optimizations and further testing.

---

## What is a Session, Visit, and Pageview?

In web analytics, it's important to **understand the difference between a session, a visit, and a pageview**.

> **1 Session = 1 Visit**

A session (or visit) begins when a user enters your website and ends after a certain period of inactivity (usually 30 minutes) or when they leave the site.

> Think of it like a trip to a store:

When you walk into the store, look around, and leave — that’s one visit (one session).

> **1 Visit can include multiple pageviews**

During one session, a user might view several pages on your site. Each time a page loads, that’s called a pageview.
![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250711184209.png?raw=true)

**Example:** Example: A user visits your site and navigates through these pages in one session:
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

---

## What is the first pages users land?

Based on session data collected prior to **June 9, 2012**, the following pages were identified as the most visited on the website:

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Most-viewed%20website%20pages,%20ranked%20by%20session%20volume.png?raw=trueraw=true)

The **homepage**, the **products page**, and the **Mr. Fuzzy product page** get the **bulk of my traffic analysis**, accounting for the top three most-visited URLs before June 9, 2012. This indicates where users engage most and where optimization efforts should be focused first.

However, **Only around 1% of total sessions ended with a completed purchase**, meaning just a small fraction of users made it all the way to the confirmation page (/thank-you-for-your-order). This highlights a major drop-off in the conversion funnel and reveals opportunities to improve the checkout experience.

> To better understand where visitors are coming from, **we attribute traffic to the first page a user lands on when beginning a session**.

This approach, known as entry page attribution, helps us pinpoint which pages are driving initial engagement. By focusing on the very first touchpoint, we can evaluate the effectiveness of external campaigns (such as paid ads or search results) and understand how well the landing page aligns with user expectations.

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250706172851.png?raw=true)

From my analysis, I discovered that:

> 🏠 **All sessions started from the homepage (`/home`)**.

This finding highlights that the homepage served as the **exclusive entry point** for all traffic during the observed period. This likely reflects either a focused marketing strategy directing users to a single landing page or a limited site structure during the early launch phase.

👉 Therefore, any efforts to improve landing page performance or user flow should **start with first landing optimization**, since it’s the first point of contact for every visitor.

---

## What is Bounce Rate

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250711184451.png?raw=true)

**Bounce Rate** is the percentage of website visitors who leave the site after viewing only one page without taking any further action (such as clicking a link, making a purchase, or navigating to another page). These visitors are called **Bounced Sessions** because their session ends after viewing just a single page.

<p align="center"> 
  <img src="https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250711184711.png?raw=true" /> 
</p>

I calculate Bounce Rate because it helps me understand **how engaging and relevant** the landing pages are to visitors. A high bounce rate may indicate that users aren’t finding what they expect or that the page experience needs improvement.

> The problem is that I calculated the **Bounce Rate to be 59%**, which is quite high.

To address the high **Bounce Rate** (59%), a **custom landing page** is being developed specifically for search traffic. This new version is designed to better align with visitor intent and encourage deeper engagement.

An **A/B test** will be conducted to compare the **new custom landing page** against the **current homepage**, using **Bounce Rate** as the primary performance metric.

This experiment will help determine whether the new page design effectively reduces drop-offs and improves user interaction.

---

## A/B Test Methods – New Landing Page vs. Homepage

To compare the performance of the new landing page (`/lander-1`) against the existing homepage (`/home`), I used SQL queries to analyze real user session data.

The analysis involved:

-   Identifying sessions from the Google Search (nonbrand) paid campaign that occurred after the new landing page launch.
    
-   Extracting the first page each user visited in their session to determine the landing page.
    
-   Counting how many sessions viewed only that one page (bounced sessions).
    
-   **Calculating the bounce rate for each landing page by dividing bounced sessions by total sessions**.
    

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250706175055.png?raw=true)

This SQL-based approach allowed me to measure and compare user engagement on both pages, showing that the new landing page has a lower bounce rate and better retains visitors.

## A/B Test Results – New Landing Page vs. Homepage

The A/B test showed that the **new landing page (lander-1)** outperformed the existing **homepage** in terms of **bounce rate**:

-   **New Landing Page (lander-1):** 53.22%
    
-   **Homepage (/home):** 58.34%

## Recommended next analyses:

-  Evaluate downstream metrics (CTR to product pages, add-to-cart rate, conversion rate)

-  Identify remaining drop-off points within the funnel

-  Iterate on CTA placement and messaging based on funnel performance

## Resources

- SQL Scripts:  
  - [Calculate Bounce Rate](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Calculate%20Bounce%20Rate.sql)  
  - [A/B Testing](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/AB%20testing.sql)  

- Tableau:  
  - [Most-viewed website pages ranked by session volume](https://public.tableau.com/views/Most-viewedwebsitepagesrankedbysessionvolume2/Dashboard1?:language=th-TH&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
