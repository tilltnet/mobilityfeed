
# mobilityfeed

<!-- badges: start -->
<!-- badges: end -->

The goal of mobilityfeed is to provide functions to interact with the [Mobility 
Database Catalog API](https://mobilitydata.github.io/mobility-feed-api/SwaggerUI/index.html).

Please refer to [https://mobilitydatabase.org/](https://mobilitydatabase.org/) for more information.

This is an early development version using `v1` of the mobility database catalog API.

## Installation

You can install the development version of mobilityfeed like so:

``` r
remotes::install_github("tilltnet/mobilityfeed")
```

## Example

To use the mobility database catalog API you'll need to register an account at
[https://mobilitydatabase.org/](https://mobilitydatabase.org/) and obtain a refresh
token. The Refresh Token will allow to obtain access/bearer tokens to interact 
with the API.

It is recommended to store your refresh token as an environment variable called 
"MOBILITY_FEED_API_REFRESH_TOKEN". This will allow the `mobilityfeed::get_token()`
function to automatically retrieve an access/bearer token. You can utilize 
`usethis::edit_r_environ()` to open your `.Renviron` file and add your refresh 
token as shown below. Make sure not to overwrite any existing contents of the
file.

```
MOBILITY_FEED_API_REFRESH_TOKEN="<YOUR-REFRESH-TOKEN-HERE>"
```

This is a basic example which shows you how to obtain the details URLs to the 
first 3 official GTFS feeds for Oregon and download the corresponding feed files:

``` r
library(mobilityfeed)

gtfs_oregon <-
  get_gtfs_feeds(subdivision_name = "Oregon", limit = 3, is_official = TRUE)
  
download_feeds(gtfs_oregon, "path/to/folder")
```

## To Do

- [ ] Add Examples to function docs
- [ ] automatically refresh bearer token when expired
- [ ] create pkgdown page
