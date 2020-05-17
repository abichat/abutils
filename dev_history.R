library(devtools)
library(usethis)

# use_build_ignore("dev_history.R")

# use_gpl3_license("Antoine Bichat")

# use_pipe()

# use_r("packages")

# use_git()

# use_github()

# use_readme_rmd()

# badger::badge_last_commit()
# badgecreatr::badge_license()


load_all()
document()
attachment::att_to_description()
use_tidy_description()

spell_check()
# spelling::update_wordlist()

check()
