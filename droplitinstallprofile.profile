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
    'context', 'context_contrib', 'context_ui',

    // Date
    // 'date_api', 'date_timezone',

    // Features
    'features',

    // Image
    // 'imageapi', 'imageapi_gd', 'imagecache',

    // Token
    'token',

    // Transliteration
    'transliteration',

    // PURL
    'purl',
    'site_variables',

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
    'typogrify', 'spamspan',

    // Others
    'devel', 'jquery_update', 'menu_attributes', 'pathauto', 'poormanscron', 'print', 'print_mail', 'vertical_tabs',

    // Spaces design customizer
    // 'color', 'spaces_design',

    // VBO
    // 'views_bulk_operations',

  );

  return $modules;
}

/**
 * Implementation of hook_profile_task_list().
  */
function droplitinstallprofile_profile_task_list() {
}

/**
 * Implementation of hook_profile_tasks().
 */
function droplitinstallprofile_profile_tasks(&$task, $url) {
  _droplitinstallprofile_modify_settings();
  _droplitinstallprofile_modify_blocks();
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
  system_initialize_theme_blocks('singular');
  variable_set('theme_default', 'singular');
  // variable_set('admin_theme', 'toasted');
  $theme_settings = variable_get('theme_settings', array());
  $theme_settings['toggle_node_info_page'] = FALSE;
  variable_set('theme_settings', $theme_settings);
  $theme_key = 'singular';
} // function _droplitinstallprofile_modify_settings

/**
 * Modify the block settings.
 */
function _droplitinstallprofile_modify_blocks() {
  _block_rehash();  // Fill the DB with default block info for Singular.

  // Hide "Powered by Drupal".
  db_query("DELETE FROM {blocks} WHERE module = '%s' AND theme = '%s' " .
           "AND region = '%s'", 'system', 'singular', 'content');

  // Hide "Navigation".
  db_query("DELETE FROM {blocks} WHERE module = '%s' AND theme = '%s' " .
           "AND region = '%s'", 'user', 'singular', 'content');  
  
  // Hide "User login".
  db_query("UPDATE {blocks} SET status = %d, region = '%s' " .
           "WHERE theme = '%s' AND bid = %d AND module = '%s'",
           0, NULL, 'singular', 5, 'user');
} // function _droplitinstallprofile_modify_blocks