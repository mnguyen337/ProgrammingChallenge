#Question 1: Impressions by Day
select sum(impressions) as impressions, date from marketing_performance group by date;

#Question 2: Ranking Top 3 Revenue-Generating States

select state, sum(revenue) as revenue from website_revenue group by state order by sum(revenue) DESC LIMIT 3;

#Question 3: Campaign Name 
select
    a.name AS campaign_name,
    sum(b.cost) as total_cost,
    sum(b.impressions) as total_impressions,
    sum(b.clicks) as total_clicks,
    sum(c.revenue) as total_revenue
from
    campaign_info as a
left join
    (
        select
            campaign_id,
            sum(cost) as cost,
            sum(impressions) AS impressions,
            sum(clicks) AS clicks
        from
            marketing_performance
        group by
            campaign_id
    ) as b on a.id = b.campaign_id
left join
    (
        select
            campaign_id,
            sum(revenue) as revenue
        from
            website_revenue
        group by
            campaign_id
    ) as c on a.id = c.campaign_id
group by
    a.name
order by
    total_revenue desc, total_clicks desc;

# I understand that this is probably not the most optimal way of writing this query. I had a little trouble joining the three tables.

#Question 4:

select name,geo, sum(conversions) as conversions from marketing_performance join campaign_info on marketing_performance.campaign_id = campaign_info.id where name = 'Campaign5' group by geo limit 1;

#Question 5:
select 
    a.name AS campaign_name,
    sum(b.cost) AS total_cost,
    sum(b.impressions) AS total_impressions,
    sum(b.clicks) AS total_clicks,
    sum(c.revenue) AS total_revenue
from
    campaign_info AS a
left join
    (
        select 
            campaign_id,
            sum(cost) as cost,
            sum(impressions) as impressions,
            sum(clicks) as clicks
        from
            marketing_performance
        group by
            campaign_id
    ) as b on a.id = b.campaign_id
left join
    (
        select
            campaign_id,
            sum(revenue) AS revenue
        from
            website_revenue
        group by
            campaign_id
    ) as c ON a.id = c.campaign_id
group by
    a.name
order by
    total_revenue desc , total_clicks desc limit 1; 
 
# In my opinion, the campaign that was most efficient is campaign 3 due to it having the most revenue, most number of clicks, and most number of impressions.
# Even though it cost the most to run the ad with a total cost of 1976.13, the ad was able to get a total revenue of 50152, total clicks 14506, and total impressions of 19785.
# I think the number of times a customer clicks on an ad is a good indicator of how effective it is as more clicks brings more traffic towards the product that is being advertised allowing for more user engagement.
# As for impressions, they are also important as the more times an ad shows up, the more people are able to see it and increase the chances of people seeing it and clicking on it.
# With this, by allowing an ad to be seen more frequently causing it to get more clicks, it will lead to more revenue produced by the ad making it more effective.

#BONUS QUESTION


select
    DATE_FORMAT(date, '%W') AS DayName,
    sum(clicks) AS TotalClicks,
    sum(impressions) AS TotalImpressions,
    sum(conversions) AS TotalConversions
from
    marketing_performance
group by
    DayName
order by
    TotalClicks DESC
LIMIT 1;

#based on what i said in question 5, Saturday is the best day to run ads because based on the data, it is the day that has the most clicks. As I stated before, I believe that the ads with the most clicks are the most effective ads.
