<?php
// $Id$

/**
 * Implementation of hook_profile_details().
 */
function droplitinstallprofile_profile_details() {
  return array(
    'name' => 'Droplit',
    'description' => 'Standard starter site for Droplits'
  );
}

/**
 * Implementation of hook_profile_modules().
 */
function droplitinstallprofile_profile_modules() {
  $modules = array(
     // Drupal core
    'block',
    'color',
    // 'comment',
    'dblog',
    'filter',
    'help',
    'menu',
    'node',
    'path',
    'search',
    'system',
    'taxonomy',
    'update',
    'user',

    // Admin
    'admin',

    // Views
    'views', 'views_ui',

    // OG
    // 'og', 'og_access', 'og_actions', 'og_views',

    // Context
    'context', 'context_layouts', 'context_ui', 
    // Date
    // 'date_api', 'date_timezone',

    // Features
    'features',

    // Image
    // 'imageapi', 'imageapi_gd', 'imagecache',

    // Token
    // 'token',

    // Transliteration
    'transliteration',

    // PURL
    'purl',
    // 'site_variables',

    // Strongarm
    'strongarm',

    // Core features
    // 'book',

    // Calendar, date
    // 'date', 'date_popup', 'litecal',

    // CCK
    'content', 'nodereference', 'text', 'optionwidgets',

    // Ctools
    'ctools', 'page_manager',

    // FeedAPI
    // 'feedapi', 'feedapi_node', 'feedapi_mapper', 'feedapi_inherit', 'parser_ical',

    // Notifications
    // 'notifications_team', 'mail2web', 'mailhandler',

    // Content profile
    // 'content_profile',

    // Formats
    // 'wysiwyg', 'ckeditor', 'htmlpurifier'

    // 'codefilter', 'markdown',
    // 'typogrify', 'spamspan',

    // Others
    'devel', 'diff', 'jquery_update', 'menu_attributes', 'poormanscron', 'print', 'print_mail', 'vertical_tabs',
    // 'pathauto', 
    // Spaces design customizer
    // 'color', 'spaces_design',
    'spaces', 'spaces_dashboard', 'spaces_ui', 'spaces_user',

    // VBO
    // 'views_bulk_operations',

  );

  return $modules;
}

/**
 * Implementation of hook_profile_task_list().
  */
function droplitinstallprofile_profile_task_list() {
  return array(
    'dip-configure' => st('Droplit Install Profile configuration'),
  );
}

/**
 * Implementation of hook_profile_tasks().
 */
function droplitinstallprofile_profile_tasks(&$task, $url) {
  _droplitinstallprofile_modify_settings();
  _droplitinstallprofile_modify_blocks();

  if ($task == 'profile') {
    $batch = array(
      'operations' => $operations,
      'finished' => '_droplitinstallprofile_profile_batch_finished',
      'title' => st('Installing @drupal', array('@drupal' => drupal_install_profile_name())),
      'error_message' => st('The installation has encountered an error.'),
    );
    // Start a batch, switch to 'profile-install-batch' task. We need to
    // set the variable here, because batch_process() redirects.
    variable_set('install_task', 'profile-install-batch');
    batch_set($batch);
    batch_process($url, $url);
  }


  if ($task == 'dip-configure') {

    // Other variables worth setting.
    variable_set('site_footer', '<a href="http://droplits.com">Droplits: We Build Web Tools</a>');

    db_query("INSERT INTO {ckeditor_settings} (name, settings) VALUES
           ('Default', 'a:37:{s:15:"allow_user_conf";s:1:"f";s:7:"filters";a:2:{s:8:"filter/3";i:0;s:8:"filter/0";i:1;}s:2:"ss";s:1:"2";s:8:"min_rows";s:1:"3";s:9:"excl_mode";s:1:"0";s:4:"excl";s:0:"";s:11:"simple_incl";s:0:"";s:7:"default";s:1:"t";s:11:"show_toggle";s:1:"t";s:5:"popup";s:1:"f";s:4:"skin";s:4:"kama";s:7:"uicolor";s:7:"default";s:16:"uicolor_textarea";s:95:"<p>\r\n	Click on the <strong>UI Color Picker</strong> button to set your color preferences.</p>\r\n";s:12:"uicolor_user";s:0:"";s:7:"toolbar";s:11:"DrupalBasic";s:6:"expand";s:1:"t";s:5:"width";s:4:"100%";s:4:"lang";s:2:"en";s:9:"auto_lang";s:1:"t";s:10:"enter_mode";s:1:"p";s:16:"shift_enter_mode";s:2:"br";s:11:"font_format";s:35:"p;div;pre;address;h1;h2;h3;h4;h5;h6";s:8:"css_mode";s:4:"self";s:8:"css_path";s:30:"%tdroplitscube/droplitcube.css";s:9:"css_style";s:4:"self";s:11:"styles_path";s:33:"%tdroplitscube/ckeditor.styles.js";s:11:"filebrowser";s:4:"none";s:17:"filebrowser_image";s:0:"";s:17:"filebrowser_flash";s:0:"";s:13:"UserFilesPath";s:5:"%b%f/";s:21:"UserFilesAbsolutePath";s:7:"%d%b%f/";s:20:"ckeditor_load_method";s:11:"ckeditor.js";s:22:"ckeditor_load_time_out";s:1:"0";s:15:"theme_config_js";s:1:"f";s:7:"js_conf";s:0:"";s:10:"excl_regex";s:0:"";s:17:"simple_incl_regex";s:0:"";}')";

    // Clear caches.
    drupal_flush_all_caches();

    // Enable the right theme. This must be handled after drupal_flush_all_caches()
    // which rebuilds the system table based on a stale static cache,
    // blowing away our changes.
    _droplitinstallprofile_system_theme_data();
    db_query("UPDATE {system} SET status = 0 WHERE type = 'theme'");
    db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' AND name = 'droplitcube'");
    db_query("UPDATE {blocks} SET region = '' WHERE theme = 'droplitcube'");
    variable_set('theme_default', 'droplitcube');

    $task = 'finished';
  }  
  
} // function droplitinstallprofile_profile_tasks

/**
 * Modify the default settings of Drupal and contributed modules.
 */
function _droplitinstallprofile_modify_settings() {
  global $theme_key;

  // Basic Drupal settings.
  // variable_set('site_frontpage', 'home');
  // variable_set('user_register', 0);

  // Theme related.
  // system_initialize_theme_blocks('droplitcube');
  // variable_set('theme_default', 'singular');
  // $theme_settings = variable_get('theme_settings', array());
  // $theme_settings['toggle_node_info_page'] = FALSE;
  // variable_set('theme_settings', $theme_settings);
  // $theme_key = 'singular';
} // function _droplitinstallprofile_modify_settings

/**
 * Modify the block settings.
 */
function _droplitinstallprofile_modify_blocks() {
  _block_rehash();  // Fill the DB with default block info for Singular.

  // Hide "Powered by Drupal".
  db_query("DELETE FROM {blocks} WHERE module = '%s' AND theme = '%s' " .
           "AND region = '%s'", 'system', 'droplitcube', 'content');

  // Hide "Navigation".
  db_query("DELETE FROM {blocks} WHERE module = '%s' AND theme = '%s' " .
           "AND region = '%s'", 'user', 'droplitcube', 'content');  
  
  // Hide "User login".
  db_query("UPDATE {blocks} SET status = %d, region = '%s' " .
           "WHERE theme = '%s' AND bid = %d AND module = '%s'",
           0, NULL, 'droplitcube', 5, 'user');
} // function _droplitinstallprofile_modify_blocks

/**
 * Finished callback for the modules install batch.
 *
 * Advance installer task to language import.
 */
function _droplitinstallprofile_profile_batch_finished($success, $results) {
  variable_set('install_task', 'dip-configure');
}

/**
 * Reimplementation of system_theme_data(). The core function's static cache
 * is populated during install prior to active install profile awareness.
 * This workaround makes enabling themes in profiles/droplitinstallprofile/themes possible.
 */
function _droplitinstallprofile_system_theme_data() {
  global $profile;
  $profile = 'droplitinstallprofile';

  $themes = drupal_system_listing('\.info$', 'themes');
  $engines = drupal_system_listing('\.engine$', 'themes/engines');

  $defaults = system_theme_default();

  $sub_themes = array();
  foreach ($themes as $key => $theme) {
    $themes[$key]->info = drupal_parse_info_file($theme->filename) + $defaults;

    if (!empty($themes[$key]->info['base theme'])) {
      $sub_themes[] = $key;
    }

    $engine = $themes[$key]->info['engine'];
    if (isset($engines[$engine])) {
      $themes[$key]->owner = $engines[$engine]->filename;
      $themes[$key]->prefix = $engines[$engine]->name;
      $themes[$key]->template = TRUE;
    }

    // Give the stylesheets proper path information.
    $pathed_stylesheets = array();
    foreach ($themes[$key]->info['stylesheets'] as $media => $stylesheets) {
      foreach ($stylesheets as $stylesheet) {
        $pathed_stylesheets[$media][$stylesheet] = dirname($themes[$key]->filename) .'/'. $stylesheet;
      }
    }
    $themes[$key]->info['stylesheets'] = $pathed_stylesheets;

    // Give the scripts proper path information.
    $scripts = array();
    foreach ($themes[$key]->info['scripts'] as $script) {
      $scripts[$script] = dirname($themes[$key]->filename) .'/'. $script;
    }
    $themes[$key]->info['scripts'] = $scripts;

    // Give the screenshot proper path information.
    if (!empty($themes[$key]->info['screenshot'])) {
      $themes[$key]->info['screenshot'] = dirname($themes[$key]->filename) .'/'. $themes[$key]->info['screenshot'];
    }
  }

  foreach ($sub_themes as $key) {
    $themes[$key]->base_themes = system_find_base_themes($themes, $key);
    // Don't proceed if there was a problem with the root base theme.
    if (!current($themes[$key]->base_themes)) {
      continue;
    }
    $base_key = key($themes[$key]->base_themes);
    foreach (array_keys($themes[$key]->base_themes) as $base_theme) {
      $themes[$base_theme]->sub_themes[$key] = $themes[$key]->info['name'];
    }
    // Copy the 'owner' and 'engine' over if the top level theme uses a
    // theme engine.
    if (isset($themes[$base_key]->owner)) {
      if (isset($themes[$base_key]->info['engine'])) {
        $themes[$key]->info['engine'] = $themes[$base_key]->info['engine'];
        $themes[$key]->owner = $themes[$base_key]->owner;
        $themes[$key]->prefix = $themes[$base_key]->prefix;
      }
      else {
        $themes[$key]->prefix = $key;
      }
    }
  }

  // Extract current files from database.
  system_get_files_database($themes, 'theme');
  db_query("DELETE FROM {system} WHERE type = 'theme'");
  foreach ($themes as $theme) {
    $theme->owner = !isset($theme->owner) ? '' : $theme->owner;
    db_query("INSERT INTO {system} (name, owner, info, type, filename, status, throttle, bootstrap) VALUES ('%s', '%s', '%s', '%s', '%s', %d, %d, %d)", $theme->name, $theme->owner, serialize($theme->info), 'theme', $theme->filename, isset($theme->status) ? $theme->status : 0, 0, 0);
  }
}