SELECT

count(*) as cnt, sum(price) as sum_price, sum(DEAL_AMOUNT) as deal_amount, SELLER_COUNTRY.NAME, DEAL_YEAR as deal_year

FROM TEST_KYLIN_FACT as TEST_KYLIN_FACT 
INNER JOIN TEST_ACCOUNT as SELLER_ACCOUNT
ON TEST_KYLIN_FACT.SELLER_ID = SELLER_ACCOUNT.ACCOUNT_ID
INNER JOIN TEST_CATEGORY_GROUPINGS as TEST_CATEGORY_GROUPINGS
ON TEST_KYLIN_FACT.LEAF_CATEG_ID = TEST_CATEGORY_GROUPINGS.LEAF_CATEG_ID AND TEST_KYLIN_FACT.LSTG_SITE_ID = TEST_CATEGORY_GROUPINGS.SITE_ID
INNER JOIN TEST_COUNTRY as SELLER_COUNTRY
ON SELLER_ACCOUNT.ACCOUNT_COUNTRY = SELLER_COUNTRY.COUNTRY

where SELLER_ACCOUNT.ACCOUNT_SELLER_LEVEL=1 and TEST_KYLIN_FACT.SELLER_COUNTRY_ABBR in ('I', 'F')
group by SELLER_COUNTRY.NAME, DEAL_YEAR
