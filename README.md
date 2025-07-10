

# Analyzing Website Performance
This project begins with a fundamental question:

> _Which webpage do most users land on first, and how likely are they to continue browsing beyond that initial page?_

Using session data collected prior to **June 9, 2012**, I analyzed the most visited pages, identified the main entry point, and evaluated user engagement by calculating bounce rates. These insights laid the groundwork for potential optimizations and further testing.

> **Key Question:**  
> _Can the new landing page reduce bounce rate and improve user engagement compared to the existing homepage?_
---

## What is the most-viewed website pages?

Based on session data collected prior to **June 9, 2012**, the following pages were identified as the most visited on the website:

<p align="center"> 
  <img src="https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Most%20viewed%20website%20pages.png?raw=true" width="45%"> 
  <img src="https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250706171915.png?raw=true" width="45%"> 
</p>

The **homepage**, the **products page**, and the **Mr. Fuzzy product page** get the **bulk of my traffic analysis**, accounting for the top three most-visited URLs before June 9, 2012. This indicates where users engage most and where optimization efforts should be focused first.

To better understand **traffic patterns** and how users enter the site, I queried the database to identify the **top entry pages**—the first pages users land on when they begin a session.

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250706172851.png?raw=true)

From my analysis, I discovered that:

> 🏠 **All sessions started from the homepage (`/home`)**.

This finding highlights that the homepage served as the **exclusive entry point** for all traffic during the observed period. This likely reflects either a focused marketing strategy directing users to a single landing page or a limited site structure during the early launch phase.

👉 Therefore, any efforts to improve landing page performance or user flow should **start with first landing optimization**, since it’s the first point of contact for every visitor.

---

## What is Bounce Rate

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250706173528.png?raw=true)

**Bounce Rate** is the percentage of website visitors who leave the site after viewing only one page without taking any further action (such as clicking a link, making a purchase, or navigating to another page). These visitors are called **Bounced Sessions** because their session ends after viewing just a single page.

<p align="center"> 
  <img src="https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250706175307.png?raw=true" alt="Bounce Rate Chart" /> 
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

-   Identifying sessions from the nonbrand Google Search paid campaign that occurred after the new landing page launch.
    
-   Extracting the first page each user visited in their session to determine the landing page.
    
-   Counting how many sessions viewed only that one page (bounced sessions).
    
-   Calculating the bounce rate for each landing page by dividing bounced sessions by total sessions.
    

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250706175055.png?raw=true)

This SQL-based approach allowed me to measure and compare user engagement on both pages, showing that the new landing page has a lower bounce rate and better retains visitors.

## A/B Test Results – New Landing Page vs. Homepage

The A/B test showed that the **new landing page (lander-1)** outperformed the existing **homepage** in terms of **bounce rate**:

-   **New Landing Page (lander-1):** 53.22%
    
-   **Homepage (/home):** 58.34%

## Resources

- SQL Scripts:  
  - [Calculate Bounce Rate](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Calculate%20Bounce%20Rate.sql)  
  - [A/B Testing](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/AB%20testing.sql)  

- Tableau Dashboard:  
  - [Most-viewed website pages ranked by session volume](https://public.tableau.com/views/Most-viewedwebsitepagesrankedbysessionvolume/Sheet1?:language=th-TH&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)  
