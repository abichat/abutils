#' Fetch installed packages
#'
#' Fetch locally installed packages with informations about the sources.
#'
#' @param all_info Logical.
#'
#' @return A tibble.
#' @export
#'
#' @importFrom dplyr select mutate
#' @importFrom janitor clean_names
#' @importFrom rlang .data
#' @importFrom purrr map
#' @importFrom tibble as_tibble
#' @importFrom tidyr unnest
#' @importFrom utils installed.packages
#'
#' @examples
#' fetch_installed_packages()
fetch_installed_packages <- function(all_info = FALSE) {
  df <-
    installed.packages() %>%
    as_tibble() %>%
    clean_names() %>%
    # select(-c(enhances:md5sum)) %>%
    mutate(source = map(.data$package, package_source)) %>%
    unnest(.data$source)
  if (!all_info) {
    df <- select(df, .data$package, .data$version,
                 .data$built, .data$source, .data$repo)
  }
  return(df)
}

#' Find package source
#'
#' @param pkg Name of the package
#'
#' @return A 1*2 tibble
#'
#' @importFrom tibble tibble
#' @importFrom stringr str_detect
#' @importFrom utils packageDescription
#'
#' @examples
#' abutils:::package_source("stats")
#' abutils:::package_source("dplyr")
package_source <- function(pkg) {
  stopifnot(length(pkg) == 1)
  desc <- packageDescription(pkg)
  prio <- desc$Priority
  repo <- desc$Repository
  GHrepo <- desc$GithubRepo
  GHuser <- desc$GithubUsername
  BCurl <- desc$git_url
  if (!is.null(prio) && prio == "base") {
    df <- tibble(source = "Base", repo = NA)
  } else if (!is.null(GHrepo) && !is.null(GHuser)) {
    df <- tibble(source = "GitHub", repo = paste0(GHuser, "/", GHrepo))
  } else if (!is.null(BCurl) && str_detect(BCurl, "bioconductor.org")) {
    df <- tibble(source = "Bioconductor", repo = NA)
  } else if (!is.null(repo)) {
    if (repo == "CRAN") {
      df <- tibble(source = "CRAN", repo = NA)
    } else {
      df <- tibble(source = paste0("Other: ", repo), repo = NA)
    }
  } else {
    df <- tibble(source = "Other", repo = NA)
  }
  return(df)
}
