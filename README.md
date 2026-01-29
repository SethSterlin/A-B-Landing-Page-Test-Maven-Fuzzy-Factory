# **Analyzing Website Performance (A/B Testing Method)**

## **Project Background**

This project analyzes **user behavior at the very beginning of the website journey (Top of Funnel)**  
to understand **which page users land on first and whether they tend to leave the site immediately**.

The analysis uses **session-level data collected before and after the launch of a new landing page**  
to compare the performance of the **Homepage** versus a **Custom Landing Page** through **A/B testing**.

The primary objectives are to **reduce bounce rate**, **increase user engagement**, and **create more opportunities for downstream conversions**.

### **Project Highlights**

- Analyzed **entry pages and bounce rate** using session-level data  
- Discovered that **100% of sessions started on the Homepage**  
- Measured an overall **bounce rate of 59%**, indicating **significant top-funnel drop-off**  
- Designed and tested a **new landing page using A/B testing**  
- The new landing page **significantly reduced bounce rate** compared to the Homepage

---

## **Data Structure, Initial Checks, and Key Concepts**

### **Dataset used**

[Maven Fuzzy Factory](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Calculate%20Bounce%20Rate.sql)

This ERD consists of **six tables**: website_sessions, website_pageviews, orders, order_items, products, and order_item_refunds, representing the **full e-commerce funnel from traffic to refunds**.  
The dataset contains a total of **472,871 records across all tables**.

![ERD Schema](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Maven%20ERD.png?raw=true)

Prior to beginning the analysis, a variety of **quality control checks** were performed to become familiar with the dataset. SQL was used during this stage to **validate data integrity**, **identify missing or inconsistent values**, and **quickly explore large tables** through aggregation and filtering.

---

### **Web Analytics Concepts (Sessions vs Pageviews)**

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

> **Session = 1** (the entire visit)  
> **Pageviews = 5** (because the user viewed 5 different pages)

**Why It Matters**

By tracking sessions and pageviews, we can:

- **Understand how users move through the site**
- **Measure how engaging each page is**
- **Identify where users drop off or lose interest**
- **Optimize the experience to increase conversion rates**

### **What is the first pages users land?**

Based on session data collected prior to **June 9, 2012**, the following pages were identified as the **most visited on the website**:

The funnel below illustrates how user sessions progress through the website, from the **home page to the billing stage**.

- Most sessions start on the **/home page (10,403 sessions)**
- **Significant drop-offs** occur as users move from **product pages to the cart**
- Only a **small fraction of users** reach the checkout steps (**/shipping** and **/billing**)
- Overall, **approximately 1% of total sessions result in a completed purchase**

This funnel highlights **key opportunities to optimize landing pages and product pages** to improve conversion rates.

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Most-viewed%20website%20pages,%20ranked%20by%20session%20volume.png?raw=trueraw=true)

#### **Key Insight**

Although the homepage, products page, and the Mr. Fuzzy product page receive the **majority of traffic**, only around **1% of total sessions result in a completed purchase**.  
This suggests that a **large proportion of users drop off early in the funnel**, before reaching deeper engagement or checkout stages.

#### **Entry Page Attribution**

To better understand **where this drop-off begins**, traffic was attributed to the **first page viewed in each session (entry page attribution)**.  
Focusing on the **initial touchpoint** allows us to evaluate whether users are engaging with the site immediately upon landing.

#### **Finding**

The analysis shows that **all sessions during the observed period began on the homepage (/home)**, making it the **sole entry point for user traffic**.  
Given this structure, **early exits from the homepage would have a significant impact on overall conversion performance**.

As a result, the next step is to examine user behavior at the landing stage, with **Bounce Rate** serving as a **key metric to quantify immediate drop-offs**.

### **Bounce Rate**

![enter image description here](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/screenshot20250711184451.png?raw=true)

**Bounce Rate** is the percentage of website visitors who leave the site after viewing **only one page** without taking any further action.  
These visitors are called **Bounced Sessions** because their session ends after viewing just a single page.

---

## **Analysis Methodology**

### **Calculated Bounce Rate**

I calculate Bounce Rate because it helps me understand **how engaging and relevant** the landing pages are to visitors.  
A **high bounce rate** may indicate that users aren’t finding what they expect or that the page experience needs improvement.

Using this method, the Bounce Rate prior to June 14, 2012 was calculated to be **59.18%**, indicating a **high level of early user drop-off at the landing stage**.

> The problem is that I calculated the **Bounce Rate to be 59%**, which is **quite high**.

---

### **A/B Testing Methodology (Landing Page Experiment)**

An A/B test was conducted to evaluate whether the **new custom landing page (/lander-1)** reduced bounce rate compared to the **existing homepage (/home)** for **paid search traffic**.

---

### **Result Summary**

The new landing page (**/lander-1**) achieved a **lower bounce rate (53.22%)** compared to the homepage (**58.34%**), indicating **improved user engagement** for paid search traffic.  
This result suggests that **aligning landing page design more closely with user intent** can effectively reduce early session drop-offs.

![enter image description here](https://raw.githubusercontent.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/refs/heads/main/9effb71f-0020-4d98-a302-f2797e89445e.png)

---

### **Recomentations**

Based on the insights uncovered from **funnel analysis and A/B testing results**, the following recommendations are proposed to **improve user engagement and conversion performance**.

- **Redirect paid search traffic to the new landing page (/lander-1)**  
- **Prioritize landing page optimization over downstream funnel stages**  
- **Strengthen above-the-fold messaging to align with user intent**  
- **Expand A/B testing beyond Bounce Rate as the sole metric**  
- **Apply a segmented landing page strategy across acquisition channels**

---

## **Resources**

- SQL Scripts  
  - [Calculate Bounce Rate](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/Calculate%20Bounce%20Rate.sql)  
  - [A/B Testing](https://github.com/SethSterlin/A-B-Landing-Page-Test-Maven-Fuzzy-Factory/blob/main/AB%20testing.sql)

- Tableau  
  - [Most-viewed website pages ranked by session volume](https://public.tableau.com/views/Most-viewedwebsitepagesrankedbysessionvolume2/Dashboard1?:language=th-TH&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)
