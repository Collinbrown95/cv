---
title: "Sr. Data Architect / Technical Advisor"
company: "Consumer Prices Division - Statistics Canada"
date_range: "2024 - Present"
date: 4
summary: "Lead the development and oversight of our division's domain-specific data lake and medallion architecture, managing data ingestion, validation, and processing pipelines while serving as a technical advisor on data engineering practices."
---

The Consumer Prices Division (CPD) at Statistics Canada is responsible for producing the monthly Canadian Consumer Price Index (CPI) and related statistical products.

In CPD, I've led the design and development of our domain-specific data platform that enables the encorporation of third party provider data into the calculation of CPI components and related statistical products.

In this role, I've primarily delivered on three main workstreams.

1. Design and development of end-to-end data processing systems that expose `bronze`, `silver`, or `gold` data products used in downstream CPI calculations.

2. Organization of a set of horizontal capabilities to improve the experience of stream-aligned teams who use our data platform.

3. Specification of a domain-specific data architecture that explicitly aligns with our organization's Target Enterprise Architecture.

# 1. Data Processing System Design

- Reduced lead time for ingesting and integrating new data sources from 2-3 months to around 15 business days.

- Significantly reduced total cost of ownership for our data processing pipelines by simplifying our business process and reducing dependencies.

- Reduced worst-case running time across all daily ingestion pipelines from around 90 minutes to around 20 minutes.

<div style="text-align: center;">
  <img src="/experience/data-platform-architect/data-platform-architect-ingestion.svg" 
       alt="{{ .Text }}" 
       style="max-width: 100%; height: auto; display: inline-block;">
</div>

# 2. Data Platform Enablement

- Upskilled dozens of users to adopt a disciplined Medallion Architecture and standardized a divisional GitLab group to ensure code and documentation are carefully version controlled.

- Eliminated manual reporting by deploying daily cloud cost dashboards and high-fidelity alerting, replacing "alert fatigue" with actionable, differentiated insights into our operations.

- Developed custom integrations to automate data lineage tracking, downstream compliance verification, and aggregate/catalog our domain's data holdings.


<div style="text-align: center;">
  <img src="/experience/data-platform-architect/data-platform-architect-platform.svg" 
       alt="{{ .Text }}" 
       style="max-width: 100%; height: auto; display: inline-block;">
</div>

# 3. Data Architecture Specification

- Strategically aligned our domain's data architecture with enterprise goals and business requirements.

- Integrated horizontal concerns --- such as cost tracking, governance, and data lineage --- into our domain's data architecture, to ensure they are "baked in, not bolted on".

- Developed many proof of concepts to test assumptions about our data architecture, ensuring that stakeholder requirements validation wasn't just a "paper exercise".
