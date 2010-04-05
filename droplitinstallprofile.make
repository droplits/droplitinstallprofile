; $Id: droplitinstallprofile.make,v 1.1.2.5 2009/11/29 00:14:46 droplits Exp $
; Test Update
core = 6.x

; Contrib projects

projects[addanother][subdir] = "contrib"

projects[admin][subdir] = "contrib"
projects[admin][version] = 2.0-beta2

projects[advanced_help][subdir] = "contrib"

projects[calendar][type] = "module"
projects[calendar][download][type] = "cvs"
projects[calendar][download][module] = "contributions/modules/calendar"
projects[calendar][download][revision] = "DRUPAL-6--2"
projects[calendar][subdir] = "contrib"

projects[cck][subdir] = "contrib"

projects[ckeditor][type] = "module"
projects[ckeditor][download][type] = "cvs"
projects[ckeditor][download][module] = "contributions/modules/ckeditor"
projects[ckeditor][download][revision] = "DRUPAL-6--1"
projects[ckeditor][subdir] = "contrib"

projects[content_profile][subdir] = "contrib"
projects[content_taxonomy][subdir] = "contrib"

projects[context][subdir] = "contrib"
projects[context][version] = 3.0-beta4

projects[ctools][subdir] = "contrib"

projects[custom_breadcrumbs][type] = "module"
projects[custom_breadcrumbs][download][type] = "cvs"
projects[custom_breadcrumbs][download][module] = "contributions/modules/custom_breadcrumbs"
projects[custom_breadcrumbs][download][revision] = "DRUPAL-6--2"
projects[custom_breadcrumbs][subdir] = "contrib"

projects[date][type] = "module"
projects[date][download][type] = "cvs"
projects[date][download][module] = "contributions/modules/date"
projects[date][download][revision] = "DRUPAL-6--2"
projects[date][subdir] = "contrib"

projects[devel][subdir] = "contrib"
projects[diff][subdir] = "contrib"
projects[draggableviews][subdir] = "contrib"
projects[features][subdir] = "contrib"
projects[feeds][subdir] = "contrib"
projects[filefield][subdir] = "contrib"

projects[flag][subdir] = "contrib"
projects[flag][version] = 2.0-beta2

projects[flag_weights][subdir] = "contrib"
projects[form][subdir] = "contrib"
projects[globalredirect][subdir] = "contrib"
projects[google_analytics][subdir] = "contrib"
projects[hoverintent][subdir] = "contrib"
projects[imageapi][subdir] = "contrib"
projects[imagecache][subdir] = "contrib"
projects[imagefield][subdir] = "contrib"
projects[imce][subdir] = "contrib"
; projects[install_profile_api][subdir] = "contrib"

projects[jquery_ui][type] = "module"
projects[jquery_ui][download][type] = "cvs"
projects[jquery_ui][download][module] = "contributions/modules/jquery_ui"
projects[jquery_ui][download][revision] = "DRUPAL-6--1"
projects[jquery_ui][subdir] = "contrib"

projects[jquery_update][type] = "module"
projects[jquery_update][download][type] = "cvs"
projects[jquery_update][download][module] = "contributions/modules/jquery_update"
projects[jquery_update][download][revision] = "DRUPAL-6--2"
projects[jquery_update][subdir] = "contrib"

projects[menu_attributes][subdir] = "contrib"
; projects[modalframe][subdir] = "contrib"
; projects[modalframe_cck_editor][subdir] = "contrib"
; projects[modalframe_contrib][subdir] = "contrib"

projects[nice_menus][type] = "module"
projects[nice_menus][download][type] = "cvs"
projects[nice_menus][download][module] = "contributions/modules/nice_menus"
projects[nice_menus][download][revision] = "HEAD"
projects[nice_menus][subdir] = "contrib"

projects[onbeforeunload][subdir] = "contrib"
; projects[panels][subdir] = "contrib"
projects[pathauto][subdir] = "contrib"
projects[path_redirect][subdir] = "contrib"
projects[print][subdir] = "contrib"
projects[purl][subdir] = "contrib"
projects[sitedoc][subdir] = "contrib"


; projects[spaces][type] = "module"
; projects[spaces][download][type] = "cvs"
; projects[spaces][download][module] = "contributions/modules/spaces"
; projects[spaces][download][revision] = "DRUPAL-6--3"
; projects[spaces][subdir] = "contrib"

projects[spaces][subdir] = "contrib"
projects[spaces][version] = 3.0-beta2

; projects[spamspan][subdir] = "contrib"

projects[strongarm][subdir] = "contrib"

projects[themekey][subdir] = "contrib"
projects[token][subdir] = "contrib"
projects[transliteration][subdir] = "contrib"
projects[vertical_tabs][subdir] = "contrib"
projects[views][subdir] = "contrib"

projects[views_slideshow][type] = "module"
projects[views_slideshow][download][type] = "cvs"
projects[views_slideshow][download][module] = "contributions/modules/views_slideshow"
projects[views_slideshow][download][revision] = "DRUPAL-6--2"
projects[views_slideshow][subdir] = "contrib"

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
projects[droplitimce][type] = "theme"
projects[droplitimce][download][type] = "git"
projects[droplitimce][download][url] = "git://github.com/droplits/droplitimce.git"

projects[droplitcube][type] = "theme"
projects[droplitcube][download][type] = "git"
projects[droplitcube][download][url] = "git://github.com/droplits/droplitcube.git"

projects[rubik][type] = "theme"
projects[rubik][download][type] = "git"
projects[rubik][download][url] = "git://github.com/developmentseed/rubik.git"

projects[tao][type] = "theme"
projects[tao][download][type] = "git"
projects[tao][download][url] = "git://github.com/developmentseed/tao.git"

; Libraries

libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery-ui-1.7.2.zip"
libraries[jquery_ui][directory_name] = jquery.ui
libraries[jquery_ui][destination] = modules/contrib/jquery_ui

libraries[ckeditor][download][type] = "get"
; libraries[ckeditor][download][url] = "http://drupal.ckeditor.com/download/ckeditor_3.1_svn.zip"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/Nightly%20Build/ckeditor_nightly.zip"
libraries[ckeditor][destination] = modules/contrib/ckeditor/ckeditor
libraries[ckeditor][copy][] = *
