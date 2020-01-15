<!--

#################################################
### THIS FILE WAS AUTOGENERATED! DO NOT EDIT! ###
#################################################
# file to edit: index.ipynb
# command to build the docs after a change: nbdev_build_docs

-->

# Exploring large data storage formats

> InfoGroup dataset comes in plain CSV files and is rather big. Exploring alternatives for storage and processing.


# Data

<div class="codecell" markdown="1">
<div class="input_area" markdown="1">

```python
# Validated files
print(*lsdir('./out/valid'), sep='\n')
```

</div>
<div class="output_area" markdown="1">

    Name	Lines	Size
    ./out/valid/1997.csv	11263922	2G
    ./out/valid/1998.csv	10774212	2G
    ./out/valid/1999.csv	11020067	3G
    ./out/valid/2000.csv	11169277	3G
    ./out/valid/2001.csv	12549385	3G
    ./out/valid/2002.csv	12848950	3G
    ./out/valid/2003.csv	12743181	3G
    ./out/valid/2004.csv	12616725	3G
    ./out/valid/2005.csv	13196450	3G
    ./out/valid/2006.csv	13350451	3G
    ./out/valid/2007.csv	13701377	3G
    ./out/valid/2008.csv	13887804	3G
    ./out/valid/2009.csv	13669082	3G
    ./out/valid/2010.csv	13834281	3G
    ./out/valid/2011.csv	13468614	3G
    ./out/valid/2012.csv	14715369	3G
    ./out/valid/2013.csv	15954359	3G
    ./out/valid/2014.csv	15916904	3G
    ./out/valid/2015.csv	15628917	3G


</div>

</div>
<div class="codecell" markdown="1">
<div class="input_area" markdown="1">

```python
# Extracts: first 100k records
print(*lsdir('./out/extracts/100k'), sep='\n')
```

</div>
<div class="output_area" markdown="1">

    Name	Lines	Size
    ./out/extracts/100k/1997.csv	100001	23M
    ./out/extracts/100k/1998.csv	100001	27M
    ./out/extracts/100k/1999.csv	100001	30M
    ./out/extracts/100k/2000.csv	100001	27M
    ./out/extracts/100k/2001.csv	100001	27M
    ./out/extracts/100k/2002.csv	100001	29M
    ./out/extracts/100k/2003.csv	100001	21M
    ./out/extracts/100k/2004.csv	100001	22M
    ./out/extracts/100k/2005.csv	100001	20M
    ./out/extracts/100k/2006.csv	100001	22M
    ./out/extracts/100k/2007.csv	100001	20M
    ./out/extracts/100k/2008.csv	100001	20M
    ./out/extracts/100k/2009.csv	100001	20M
    ./out/extracts/100k/2010.csv	100001	20M
    ./out/extracts/100k/2011.csv	100001	20M
    ./out/extracts/100k/2012.csv	100001	20M
    ./out/extracts/100k/2013.csv	100001	20M
    ./out/extracts/100k/2014.csv	100001	21M
    ./out/extracts/100k/2015.csv	100001	24M


</div>

</div>

# Overview of options

## Google BigQuery

[Official page](https://cloud.google.com/bigquery/)

Pros

- Fast
- Easy to collaborate on
- SQL syntax
- Easy to ingest raw data: no need to normalize tables

Cons

- Costs
- Requires Internet connection
- Proprietary format, lock in
- Not available in RDC

## Relational database

- Can be on-permises or cloud.
- Many alternative implementations: SQLite, Postgres, MySQL, ...

Pros

- Robust standard
- Easily portable between providers
- SQL syntax

Cons

- Slow
  - Read-only might improve speeds
- Even slower if schemas are not optimized: normalization, indexing

## Data warehouse

- Similar to GBQ, but can be installed on-premises. Unlikely in RDC.
- Columnar storage optimized for analytics.

[ClickHouse](https://clickhouse.yandex/), maybe others.

## Plain CSV + pandas or Stata

Pros

- Universally supported format
- Human readable on disk (unless compressed)

Cons

- Slow
- In-memory processing

## Parquet, Arrow, dask

- Out of core processing
- Open standard
- Difference between serialization format (on disk storage) and processing. Pandas and dask can process both CSV and parquet files.
