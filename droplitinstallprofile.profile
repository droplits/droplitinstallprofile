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
    // 'spaces', 'spaces_dashboard', 'spaces_ui', 'spaces_user',

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

    // Set time zone
    $tz_offset = date('Z');
    variable_set('date_default_timezone', $tz_offset);
    
    variable_set('site_footer', '<a href="http://droplits.com">Droplits: We Build Web Tools</a>');

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


    db_query("UPDATE {system} SET status = 0 WHERE type = 'theme'");
    db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' AND name = 'droplitrubik'");
    db_query("UPDATE {blocks} SET region = '' WHERE theme = 'droplitrubik'");
    variable_set('admin_theme', 'droplitrubik');

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

  // Make an 'administrator' role
  db_query("INSERT INTO {role} (rid, name) VALUES (3, 'admin user')");

  // Add user 1 to the 'admin user' role
  db_query("INSERT INTO {users_roles} VALUES (1, 3)");

  // Theme related.
  // system_initialize_theme_blocks('droplitcube');
  // variable_set('theme_default', 'droplitcube');
  // $theme_settings = variable_get('theme_settings', array());
  // $theme_settings['toggle_node_info_page'] = FALSE;
  // variable_set('theme_settings', $theme_settings);
  // $theme_key = 'droplitcube';
} // function _droplitinstallprofile_modify_settings

/**
 * Modify the block settings.
 */
function _droplitinstallprofile_modify_blocks() {
  _block_rehash();  // Fill the DB with default block info for droplitcube.

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