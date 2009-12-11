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
}