; $Id: droplitinstallprofile.make,v 1.1.2.5 2009/11/29 00:14:46 droplits Exp $
; Test Update
core = 6.x

; Contrib projects
projects[addanother][subdir] = "contrib"

projects[admin][type] = "module"
projects[admin][download][type] = "cvs"
projects[admin][download][module] = "contributions/modules/admin"
projects[admin][download][revision] = "DRUPAL-6--2"
projects[admin][subdir] = "contrib"

projects[admin_menu][subdir] = "contrib"
projects[advanced_help][subdir] = "contrib"
projects[backup_migrate][subdir] = "contrib"
projects[better_formats][subdir] = "contrib"
projects[cck][subdir] = "contrib"

projects[ckeditor][type] = "module"
projects[ckeditor][download][type] = "cvs"
projects[ckeditor][download][module] = "contributions/modules/ckeditor"
projects[ckeditor][download][revision] = "DRUPAL-6--1"
projects[ckeditor][subdir] = "contrib"

projects[context][type] = "module"
projects[context][download][type] = "cvs"
projects[context][download][module] = "contributions/modules/context"
projects[context][download][revision] = "DRUPAL-6--3"
projects[context][subdir] = "contrib"

projects[ctools][subdir] = "contrib"
projects[custom_breadcrumbs][subdir] = "contrib"
projects[data][subdir] = "contrib"
projects[devel][subdir] = "contrib"
projects[diff][subdir] = "contrib"
projects[features][subdir] = "contrib"
projects[feeds][subdir] = "contrib"
projects[globalredirect][subdir] = "contrib"
projects[google_analytics][subdir] = "contrib"
projects[htmlpurifier][subdir] = "contrib"
projects[imageapi][subdir] = "contrib"
projects[imagecache][subdir] = "contrib"
projects[imce][subdir] = "contrib"
projects[imce_wysiwyg][subdir] = "contrib"
projects[install_profile_api][subdir] ="contrib"
projects[jquery_ui][subdir] = "contrib"
projects[jquery_update][subdir] = "contrib"
projects[menu_attributes][subdir] = "contrib"
projects[pathauto][subdir] = "contrib"
projects[path_redirect][subdir] = "contrib"
projects[poormanscron][subdir] = "contrib"
projects[print][subdir] = "contrib"
projects[purl][subdir] = "contrib"

projects[spaces][type] = "module"
projects[spaces][download][type] = "cvs"
projects[spaces][download][module] = "contributions/modules/spaces"
projects[spaces][download][revision] = "DRUPAL-6--3"
projects[spaces][subdir] = "contrib"

projects[spamspan][subdir] = "contrib"

projects[strongarm][type] = "module"
projects[strongarm][download][type] = "cvs"
projects[strongarm][download][module] = "contributions/modules/strongarm"
projects[strongarm][download][revision] = "DRUPAL-6--2"
projects[strongarm][subdir] = "contrib"

projects[themekey][subdir] = "contrib"
projects[token][subdir] = "contrib"
projects[transliteration][subdir] = "contrib"
projects[typogrify][subdir] = "contrib"
projects[vertical_tabs][subdir] = "contrib"
projects[views][subdir] = "contrib"
projects[wysiwyg][subdir] ="contrib"
projects[xmlsitemap][subdir] = "contrib"

; Patched.
; Explicit versions specified to ensure patches apply cleanly.

; Custom modules
; projects[seed][subdir] = "custom"
; projects[seed][location] = "http://code.developmentseed.org/fserver"
; projects[] = "designkit"

; Features
projects[site_variables][subdir] = "features"
projects[site_variables][location] = "http://features.droplits.net/fserver"
projects[ckeditor_filter][subdir] = "features"
projects[ckeditor_filter][location] = "http://features.droplits.net/fserver"

; Themes
projects[droplitimce][type] = "theme"
projects[droplitimce][download][type] = "git"
projects[droplitimce][download][url] = "git://github.com/droplits/droplitimce.git"

projects[droplitrubik][type] = "theme"
projects[droplitrubik][download][type] = "git"
projects[droplitrubik][download][url] = "git://github.com/droplits/droplitrubik.git"

projects[tao][type] = "theme"
projects[tao][download][type] = "git"
projects[tao][download][url] = "git://github.com/developmentseed/tao.git"

projects[singular][location] = "http://code.developmentseed.org/fserver"

; Libraries

libraries[jquery_ui][download][type] = "get"
libraries[jquery_ui][download][url] = "http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip"
libraries[jquery_ui][directory_name] = jquery.ui
libraries[jquery_ui][destination] = modules/contrib/jquery_ui

libraries[htmlpurifier][download][type] = "get"
libraries[htmlpurifier][download][url] = "http://droplitinstallprofiledev.droplits.net/library.tar.gz"
libraries[htmlpurifier][directory_name] = library
libraries[htmlpurifier][destination] = modules/contrib/htmlpurifier

libraries[ckeditor][download][type] = "get"
libraries[ckeditor][download][url] = "http://drupal.ckeditor.com/download/ckeditor_3.1_svn.zip"
libraries[ckeditor][destination] = modules/contrib/ckeditor/ckeditor
libraries[ckeditor][copy][] = *

