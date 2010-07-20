; $Id: droplitinstallprofile.make,v 1.1.8 2010/04/05 03:11:46 droplits Exp $
; Test Update
core = 6.x

; Contrib projects

projects[addanother][subdir] = "contrib"

projects[admin][subdir] = "contrib"
; projects[admin][version] = 2.0-beta4 

projects[advanced_help][subdir] = "contrib"

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

; projects[content_profile][subdir] = "contrib"
; projects[content_taxonomy][subdir] = "contrib"

projects[context][subdir] = "contrib"
projects[context][version] = 3.0-beta5

projects[ctools][subdir] = "contrib"

projects[custom_breadcrumbs][subdir] = "contrib"
projects[custom_breadcrumbs][version] = 2.0-beta3

projects[date][subdir] = "contrib"
projects[date][version] = 2.x-dev

projects[devel][subdir] = "contrib"
; projects[diff][subdir] = "contrib"
projects[draggableviews][subdir] = "contrib"
projects[features][subdir] = "contrib"
projects[feeds][subdir] = "contrib"
projects[filefield][subdir] = "contrib"

projects[flag][subdir] = "contrib"
projects[flag][version] = 2.0-beta3

projects[flag_weights][subdir] = "contrib"
projects[globalredirect][subdir] = "contrib"
projects[google_analytics][subdir] = "contrib"
projects[hoverintent][subdir] = "contrib"
projects[imageapi][subdir] = "contrib"
projects[imagecache][subdir] = "contrib"
projects[imagefield][subdir] = "contrib"

projects[imce][subdir] = "contrib"
; projects[imce][version] = 2.0-beta3

projects[jquery_ui][subdir] = "contrib"
projects[jquery_ui][version] = 1.x-dev

projects[jquery_update][subdir] = "contrib"
projects[jquery_update][version] = 2.x-dev

; projects[menu_attributes][subdir] = "contrib"

projects[modalframe][subdir] = "contrib"
projects[modalframe_cck_editor][subdir] = "contrib"
projects[modalframe_contrib][subdir] = "contrib"

projects[pathauto][subdir] = "contrib"
projects[path_redirect][subdir] = "contrib"
projects[print][subdir] = "contrib"
projects[purl][subdir] = "contrib"

projects[spaces][subdir] = "contrib"

projects[strongarm][subdir] = "contrib"

projects[themekey][subdir] = "contrib"
projects[token][subdir] = "contrib"

projects[transliteration][subdir] = "contrib"
projects[transliteration][version] = 3.x-dev

projects[vertical_tabs][subdir] = "contrib"

projects[views][subdir] = "contrib"

projects[views_slideshow][subdir] = "contrib"

; Patched.
; Explicit versions specified to ensure patches apply cleanly.

; Custom modules
projects[seed][subdir] = "custom"
projects[seed][location] = "http://code.developmentseed.org/fserver"

; Features

; Apr 6, 2010 - 6.x-1.4
projects[site_variables][subdir] = "features"
projects[site_variables][location] = "http://features.droplits.net/fserver"

; Apr 6, 2010 - 6.x-1.3
projects[droplitfilters][subdir] = "features"
projects[droplitfilters][location] = "http://features.droplits.net/fserver"

; Jan 9 2010  - 6.x-1.3
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
projects[rubik][location] = http://code.developmentseed.org/fserver

projects[tao][type] = "theme"
projects[tao][location] = http://code.developmentseed.org/fserver

; Libraries

libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery-ui-1.7.3.zip"
libraries[jquery_ui][directory_name] = jquery.ui
libraries[jquery_ui][destination] = modules/contrib/jquery_ui

libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://download.cksource.com/CKEditor/CKEditor/CKEditor%203.3.1/ckeditor_3.3.1.zip"
libraries[ckeditor][destination] = modules/contrib/ckeditor/ckeditor
libraries[ckeditor][copy][] = *