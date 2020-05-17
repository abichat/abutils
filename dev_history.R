library(devtools)
library(usethis)
library(testthat)

# use_build_ignore("dev_history.R")

# use_gpl3_license("Antoine Bichat")

# use_pipe()

# use_r("packages")

# use_git()

# use_github()

# use_readme_rmd()

# badger::badge_last_commit()
# badgecreatr::badge_license()

# use_testthat()

# use_test("packages")

# use_github_action_check_release()

# use_r("regseq")
# use_test("regseq")

# cat(badgecreatr::badge_packageversion(), sep = "\n")

# use_version()

# use_news_md()

load_all()
document()
attachment::att_to_description()
use_tidy_description()

spell_check()
# spelling::update_wordlist()

test()

check()

goodpractice::goodpractice()
