# SQL | Nature and Parks Authority Websites Management  

This project focuses on database management and advanced SQL development for the Nature and Parks Authority's websites. The system handles user registrations, subscription purchases, data archival, and dynamic pricing calculations. It includes automated triggers, stored procedures, and advanced functions to ensure data integrity, enforce business rules, and optimize operations.  

## Features  
### 1. **User Registration Procedures**  
Two procedures handle visitor registrations, both inserting records into the *Visits* table while addressing specific use cases:  
- **Family Code Registration**:  
  - Accepts family code, number of visitors, site code, and date.  
  - Prevents overlapping registrations by utilizing triggers to ensure one record per family code.  
- **Standard Registration**:  
  - Handles individual registrations without family codes.  
  - Triggers validate dates to ensure the visit falls within the season's valid timeframe.  
  - Example: If the date is invalid, an error message displays, e.g., "Date must be between: Winter Start - Winter End."  

### 2. **Seasonal and Visit Validation**  
- **Triggers for Valid Dates**:  
  - Validates the registration date against the season's defined range, rejecting invalid dates.  
- **Visit Count Privileges**:  
  - Post-registration, a trigger with `GROUP BY` aggregates visitor counts per family code.  
  - Special privileges (e.g., free photo) are granted for members visiting three or more times.  

### 3. **Subscription Purchase Procedure**  
- Accepts participant ID and validates subscription eligibility using a dedicated function.  
- Ensures participants meet all criteria before completing the transaction.  

### 4. **Manual Archival Function**  
- A specialized function facilitates manual archiving of records.  
- Streamlines historical data management by moving outdated or inactive records to an archive table.  

### 5. **Dynamic Pricing Function**  
- Adds 10% to ticket prices for sites with the highest summer visitor counts over the past five years.  
- Utilizes *aggregate functions* and *JOIN* queries to calculate and update prices dynamically.  

## Key SQL Techniques  
- **Triggers**:  
  - Automated validations and real-time notifications for business rules enforcement.  
- **Stored Procedures**:  
  - Simplify repetitive tasks like registrations and subscription processing.  
- **Functions**:  
  - Advanced calculations for pricing, validations, and data transformation.  
- **Date Operations**:  
  - Validations ensure all dates align with predefined operational calendars.  

## Instructions for Use  
### Setup  
1. Clone the repository and execute the `schema.sql` file to initialize the database structure.  
2. Load the `data.sql` file to populate the database with sample records for testing.  

### Procedures and Functions  
1. **Register a Visit**:  
   - Call `RegisterVisit(FamilyCode, Visitors, SiteCode, Date)` to log a new visit.  
2. **Purchase a Subscription**:  
   - Execute `BuySubscription(ParticipantID)` to process new memberships.  
3. **Dynamic Pricing Update**:  
   - Run `UpdateSummerPricing()` to adjust site prices based on historical trends.  

## Example Scenarios  
### Visitor Registration  
- Input: `FamilyCode=12345, Visitors=4, SiteCode=987, Date='2024-08-01'`  
- Result: A record is added to the Visits table if the date is valid. Otherwise, an error message is displayed.  

### Dynamic Pricing  
- Sites with significant summer attendance over five years automatically receive a 10% price increase.  

### Free Perks  
- A visitor registering three times under the same family code receives a gift notification, e.g., "Congratulations! You’ve earned a free photo with the park’s iconic view."  

## Future Enhancements  
1. **Real-Time Monitoring**:  
   - Add dashboards to display live data on visitor registration trends and subscription sales.  
2. **API Integration**:  
   - Develop REST APIs to connect with frontend applications for seamless user interaction.  
3. **Predictive Analytics**:  
   - Incorporate machine learning to forecast attendance patterns and optimize pricing strategies.  

This project highlights the application of advanced SQL methodologies to streamline operations, enhance user experience, and drive decision-making for the Nature and Parks Authority.  
