; $Id: droplitinstallprofile.make,v 1.1.8 2010/04/05 03:11:46 droplits Exp $
; Test Update
core = 6.x

; Contrib projects

projects[addanother][subdir] = "contrib"

projects[admin][subdir] = "contrib"
projects[admin][version] = 2.0-beta3

; projects[advanced_help][subdir] = "contrib"

; projects[calendar][type] = "module"
; projects[calendar][download][type] = "cvs"
; projects[calendar][download][module] = "contributions/modules/calendar"
; projects[calendar][download][revision] = "DRUPAL-6--2"
; projects[calendar][subdir] = "contrib"

projects[calendar][subdir] = "contrib"
projects[calendar][version] = 2.x-dev

projects[cck][subdir] = "contrib"

projects[ckeditor][subdir] = "contrib"
projects[ckeditor][version] = 1.x-dev

; projects[ckeditor][type] = "module"
; projects[ckeditor][download][type] = "cvs"
; projects[ckeditor][download][module] = "contributions/modules/ckeditor"
; projects[ckeditor][download][revision] = "DRUPAL-6--1"
; projects[ckeditor][subdir] = "contrib"

; projects[content_profile][subdir] = "contrib"
; projects[content_taxonomy][subdir] = "contrib"

projects[context][subdir] = "contrib"
projects[context][version] = 3.0-beta4

projects[ctools][subdir] = "contrib"

projects[custom_breadcrumbs][subdir] = "contrib"
projects[custom_breadcrumbs][version] = 2.0-beta3

; projects[custom_breadcrumbs][type] = "module"
; projects[custom_breadcrumbs][download][type] = "cvs"
; projects[custom_breadcrumbs][download][module] = "contributions/modules/custom_breadcrumbs"
; projects[custom_breadcrumbs][download][revision] = "DRUPAL-6--2"
; projects[custom_breadcrumbs][subdir] = "contrib"

projects[date][subdir] = "contrib"
projects[date][version] = 2.x-dev

; projects[date][type] = "module"
; projects[date][download][type] = "cvs"
; projects[date][download][module] = "contributions/modules/date"
; projects[date][download][revision] = "DRUPAL-6--2"
; projects[date][subdir] = "contrib"

projects[devel][subdir] = "contrib"
; projects[diff][subdir] = "contrib"
projects[draggableviews][subdir] = "contrib"
projects[features][subdir] = "contrib"
projects[feeds][subdir] = "contrib"
projects[filefield][subdir] = "contrib"

projects[flag][subdir] = "contrib"
projects[flag][version] = 2.0-beta2

projects[flag_weights][subdir] = "contrib"
projects[globalredirect][subdir] = "contrib"
projects[google_analytics][subdir] = "contrib"
projects[hoverintent][subdir] = "contrib"
projects[imageapi][subdir] = "contrib"
projects[imagecache][subdir] = "contrib"
projects[imagefield][subdir] = "contrib"

projects[imce][subdir] = "contrib"
projects[imce][version] = 2.0-beta1

projects[jquery_ui][subdir] = "contrib"
projects[jquery_ui][version] = 1.x-dev

; projects[jquery_ui][type] = "module"
; projects[jquery_ui][download][type] = "cvs"
; projects[jquery_ui][download][module] = "contributions/modules/jquery_ui"
; projects[jquery_ui][download][revision] = "DRUPAL-6--1"
; projects[jquery_ui][subdir] = "contrib"

projects[jquery_update][subdir] = "contrib"
projects[jquery_update][version] = 2.x-dev

; projects[jquery_update][type] = "module"
; projects[jquery_update][download][type] = "cvs"
; projects[jquery_update][download][module] = "contributions/modules/jquery_update"
; projects[jquery_update][download][revision] = "DRUPAL-6--2"
; projects[jquery_update][subdir] = "contrib"

projects[menu_attributes][subdir] = "contrib"

projects[modalframe][subdir] = "contrib"
projects[modalframe][version] = 1.x-dev

; projects[modalframe][subdir] = "contrib"
; projects[modalframe_cck_editor][subdir] = "contrib"
; projects[modalframe_contrib][subdir] = "contrib"

; projects[nice_menus][subdir] = "contrib"
; projects[nice_menus][version] = 2.1-alpha2

projects[pathauto][subdir] = "contrib"
projects[path_redirect][subdir] = "contrib"
projects[print][subdir] = "contrib"
projects[purl][subdir] = "contrib"

projects[spaces][subdir] = "contrib"
projects[spaces][version] = 3.0-beta2

projects[strongarm][subdir] = "contrib"

projects[themekey][subdir] = "contrib"
projects[token][subdir] = "contrib"

projects[transliteration][subdir] = "contrib"
projects[transliteration][version] = 3.x-dev

; projects[transliteration][type] = "module"
; projects[transliteration][download][type] = "cvs"
; projects[transliteration][download][module] = "contributions/modules/transliteration"
; projects[transliteration][download][revision] = "DRUPAL-6--3"
; projects[transliteration][subdir] = "contrib"

projects[vertical_tabs][subdir] = "contrib"

projects[views][subdir] = "contrib"

projects[views_slideshow][subdir] = "contrib"

; projects[views_slideshow][type] = "module"
; projects[views_slideshow][download][type] = "cvs"
; projects[views_slideshow][download][module] = "contributions/modules/views_slideshow"
; projects[views_slideshow][download][revision] = "DRUPAL-6--2"
; projects[views_slideshow][subdir] = "contrib"

; Patched.
; Explicit versions specified to ensure patches apply cleanly.

; Custom modules
; projects[seed][subdir] = "custom"
; projects[seed][location] = "http://code.developmentseed.org/fserver"
; projects[] = "designkit"

; Features
projects[site_variables][subdir] = "features"
projects[site_variables][location] = "http://features.droplits.net/fserver"
projects[droplitfilters][subdir] = "features"
projects[droplitfilters][location] = "http://features.droplits.net/fserver"
projects[droplitevent][subdir] = "features"
projects[droplitevent][location] = "http://features.droplits.net/fserver"

; Themes
projects[fusion][type] = "theme"
projects[acquia_prosper][type] = "theme"

projects[droplitimce][type] = "theme"
projects[droplitimce][download][type] = "git"
projects[droplitimce][download][url] = "git://github.com/droplits/droplitimce.git"

projects[droplitcube][type] = "theme"
projects[droplitcube][download][type] = "git"
projects[droplitcube][download][url] = "git://github.com/droplits/droplitcube.git"

projects[rubik][type] = "theme"
projects[rubik][location] = http://code.developmentseed.org/fserver

projects[tao][type] = "theme"
projects[tao][location] = http://code.developmentseed.org/fserver

; Libraries

libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery-ui-1.7.3.zip"
libraries[jquery_ui][directory_name] = jquery.ui
libraries[jquery_ui][destination] = modules/contrib/jquery_ui

libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.2/ckeditor_3.2.zip"
libraries[ckeditor][destination] = modules/contrib/ckeditor/ckeditor
libraries[ckeditor][copy][] = *