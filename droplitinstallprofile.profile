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

    // Context
    'context', 'context_layouts', 'context_ui', 

    // Features
    'features',

    // Transliteration
    'transliteration',

    // PURL
    'purl',

    // Strongarm
    'strongarm',

    // CCK
    'content', 'nodereference', 'text', 'optionwidgets',

    // Ctools
    'ctools', 'page_manager',

    // Others
    'devel', 'diff', 'jquery_update', 'print', 'print_mail', 'vertical_tabs', 'install_profile_api',

    // Spaces design customizer
    // 'color', 'spaces_design',
    // 'spaces', 'spaces_dashboard', 'spaces_ui', 'spaces_user',

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
  install_include(array_merge(droplitinstallprofile_profile_modules()));
  _droplitinstallprofile_modify_settings();
  _droplitinstallprofile_modify_blocks();
  _droplitinstallprofile_set_content_types();
  _droplitinstallprofile_set_permissions();

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

    // Create the admin role.
    db_query("INSERT INTO {role} (name) VALUES ('%s')", 'admin');
    db_query("INSERT INTO {users_roles} VALUES (1, 3)");
    
    // Other variables worth setting.

    variable_set('site_footer', '<a href="http://droplits.com">Droplits: We Build Web Tools</a>');

    // Clear caches.
    drupal_flush_all_caches();

    // Enable the right theme. This must be handled after drupal_flush_all_caches()
    // which rebuilds the system table based on a stale static cache,
    // blowing away our changes.
    _droplitinstallprofile_system_theme_data();
    db_query("UPDATE {system} SET status = 0 WHERE type = 'theme'");
    db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' AND name = 'droplitimce'");
    db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' AND name = 'droplitcube'");
    db_query("UPDATE {system} SET status = 1 WHERE type = 'theme' AND name = 'rubik'");
    db_query("UPDATE {blocks} SET region = '' WHERE theme = 'droplitimce'");
    db_query("UPDATE {blocks} SET region = '' WHERE theme = 'droplitcube'");
    db_query("UPDATE {blocks} SET region = '' WHERE theme = 'rubik'");
    variable_set('theme_default', 'droplitcube');
    variable_set('admin_theme', 'rubik');

    system_initialize_theme_blocks('droplitimce');
    system_initialize_theme_blocks('droplitcube');
    system_initialize_theme_blocks('rubik');
  
  // Theme settings.
  $theme_settings = variable_get('theme_settings', array());
  $theme_settings['toggle_node_info_page'] = FALSE;
  variable_set('theme_settings', $theme_settings);


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

} // function _droplitinstallprofile_modify_settings


/**
 * Set the roles and permissions that will be used in this profile.
 */
function _droplitinstallprofile_set_permissions() {
  // Define new roles.
  // db_query("INSERT INTO {role} (rid, name) VALUES (3, 'admin')");

  // Make user 1 an administrator.
  // db_query("INSERT INTO {users_roles} VALUES (1, 3)");

  // Update "anonymous user" permissions.
  db_query("UPDATE {permission} SET perm = '%s' WHERE rid = %d",
           'access content, access print, access send to friend, search content', 1);

  // Update "authenticated user" permissions.
  db_query("UPDATE {permission} SET perm = '%s' WHERE rid = %d",
           'access content, access print, access send to friend, ' .
           'search content, change own username', 2);

  // Set administrator permissions (all permissions).
  $all_perm = 'use admin toolbar, administer blocks, administer menu, ' .
              'access content, administer nodes, create page content, ' .
              'delete any page content, delete own page content, delete revisions, ' .	      
              'edit any page content, edit own page content, revert revisions, view revisions, ' .
              'access print, administer print, node-specific print configuration, access send to friend, ' .
              'search content, use advanced search, administer files, administer site configuration, ' .
              'access user profiles, administer users, change own username ';
  db_query("INSERT INTO {permission} (rid, perm, tid) VALUES (3, '%s', 0)",
           $all_perm);

}

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
 * Set the content types for this profile.
 */
function _droplitinstallprofile_set_content_types() {
  // Define content types
  $page_description = st('A page is a for creating and displaying information that rarely changes, such as an \"About us\" section of a website. By default, a page entry does not allow visitor comments and is not featured on the site\'s initial home page.');
  $types = array (
    array(
      'type' => 'page',
      'name' => st('Page'),
      'module' => 'node',
      'description' => $page_description,
      'custom' => TRUE,
      'modified' => TRUE,
      'locked' => FALSE,
    ),
  );

  // Save the node types.
  foreach ($types as $type) {
    $type = (object) _node_type_set_defaults($type);
    node_type_save($type);
  }

  // Disable "Promoted to front page" for pages.
  variable_set('node_options_page', array('status'));

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