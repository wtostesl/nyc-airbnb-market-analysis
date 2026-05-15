# NYC Airbnb Market Analysis
Excel + MySQL + Looker Studio analysis of 39,881 NYC Airbnb listings. Explores pricing patterns, neighbourhood performance, room type distribution and availability trends across New York City boroughs. End-to-end project: data extraction, cleaning, EDA and dashboard.

## Business Problem
Analyse the New York City short-term rental market to identify pricing patterns, availability trends, and neighbourhood performance across 39,881 listings.

## Dataset
- Source: Inside Airbnb (insideairbnb.com)
- Size: 39,881 listings
- Period: September 7th, 8th and 9th - 2022
- Tools: SQL (MySQL), Google Looker Studio

## Key Questions
- Are there any data integrity issues?
- What are the top 5 most expensive neighborhoods in the city? What is the average listing price for Airbnb price for these properties?
- What is the frequency distribution for rented properties across boroughs
- Are there any relationships in the data that could be used as predictors of the rental price?

## Methodology
Analytical Methodology: Five-Phase Framework 
**1. DISCOVERY (Microsoft Excel)**
  - Explored 39,881 records across 75 variables
  - Identified 6 business-critical dimensions as key columns
**2. QUALITY ASSESSMENT OF KEY COLUMNS (Microsoft Excel)**
  - Found 41% missing data for neighbourhood column
  - Identified format/type inconsistencies for price and bathrooms columns
**3. CLEANSE & TRANSFORMATION (MySQL)**
  - Alternative sourcing for missing data (use of neighbourhood_cleansed column)
  - Pattern matching for price standardization
  - Text-to-numeric conversion for bathrooms
**4. ANALYSIS & VALIDATION (MySQL)**
  - Multi-dimensional SQL analysis
  - Tested 6 price predictors
  - Statistical validation of findings
**5. COMMUNICATION OF INSIGHTS (Looker Studio)**
  - Business-focused dashboard
  - Actionable recommendations
  - Visual clarity prioritized

## Key Findings
**1. Data Quality — Significant issues resolved before analysis**
- The `neighbourhood` column had 41% missing values (16,414 out of 39,881 records), which would have compromised all geographic analysis. Resolved by using the `neighbourhood_cleansed` column (0% missing).

- Additional type inconsistencies corrected: `price` stored as text with dollar signs, `bathrooms` as descriptive text — both converted to numeric format via SQL pattern matching.

**2. Top 5 Most Expensive Neighbourhoods**
- Fort Wadsworth leads at **$650/night — 285% above the city average of $169**.
  
- Top 5: Fort Wadsworth ($650), Hollis Hills ($497), Navy Yard ($359), Tribeca ($357), Belle Harbor ($355).

- These premium neighbourhoods cluster in two zones: Manhattan's financial district and Brooklyn's waterfront — driven by views, business proximity, and high-end amenities.

**3. Borough Distribution — 80% concentrated in 2 boroughs**
- Manhattan holds 42% of all listings (16,847), Brooklyn 37% (14,845), Queens 15% (6,175), Bronx 4% (1,568), Staten Island 1% (446).

- Despite being NYC's largest borough by area, Queens has only 15% of listings — pointing to a significant supply gap relative to residential density.

**4. Price Predictors — Physical space and property type drive pricing; review scores do not**
- **Property type** is the strongest predictor: hotel rooms average $293/night, entire homes/apartments $218, private rooms $102, shared rooms $88 — a 3.3x spread between highest and lowest.

- **Physical space** shows a clear positive correlation: 1-bedroom listings average $138/night vs. $409 for 5+ bedrooms; 1 bed averages $134 vs. $312 for 5+ beds.

- **Review volume** correlates positively with price: properties with 1,200+ reviews average $392/night vs. $147 for those with under 400 — reflecting that higher-priced properties with better experiences accumulate more bookings over time, not that reviews drive prices up.

- **Review scores rating is a weak predictor**: average prices range only from $134 to $166 across all rating bands. Quality is consistent across price tiers — market positioning drives pricing, not guest satisfaction scores.

## Business Recommendations

**1. Invest in property type over cosmetic improvements.**
Converting a private room listing to an entire home/apartment has the highest measurable ROI of any single change — a 2.1x price increase on average ($102 → $218). Hosts should prioritise space separation or dedicated units over aesthetic upgrades, which do not meaningfully differentiate pricing.

**2. Expand into underserved boroughs — Queens in particular.**
With 79% of listings concentrated in Manhattan and Brooklyn, Queens represents the clearest supply opportunity: NYC's largest borough by area holds only 15% of Airbnb inventory. Investors and hosts targeting lower competition and growing demand should consider Queens as a primary market.

**3. Price based on property characteristics and location — not review scores.**
Since review scores show virtually no correlation with price ($134–$166 across all rating bands), pricing strategy should be anchored on bedrooms, bathrooms, property type, and neighbourhood. Chasing higher review scores as a pricing lever has no data support; focus instead on accurate market positioning.

**4. Use review volume as a demand signal, not a quality signal.**
Properties with 1,200+ reviews command $392/night on average — but this reflects accumulated booking history, not a feedback loop where more reviews
cause higher prices. For new listings, set pricing based on comparable property characteristics and let volume accumulate naturally over time.

## Dashboard
<img width="1168" height="666" alt="image" src="https://github.com/user-attachments/assets/93ccdf61-340d-459b-b693-985258462237" />

