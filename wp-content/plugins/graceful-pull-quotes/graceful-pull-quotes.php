<?php
/*
Plugin Name: Graceful Pull-Quotes
Plugin URI: http://striderweb.com/nerdaphernalia/features/wp-javascript-pull-quotes/
Description: Allows you to create customizable magazine-style pull-quotes without duplicating text in your markup or feeds.
Author: Stephen Rider
Author URI: http://striderweb.com/nerdaphernalia
Version: 2.6.1
Date: 2015-04-15
Text Domain: jspullquotes
Domain Path: /lang
*/

class jspullquotes {

/* To Do
	FIXME:	When script renders HTML comment content, it needs to encode characters and NOT encode tags!  related: http://core.trac.wordpress.org/ticket/8912 or 3603
	TODO:	allow user to specify location of "styles" folder
		- replace $style_path and $style_url with user options
	TODO:	add optional "Uninstall" routine to deactivation hook
	TODO:	find better way to combine style and "core" CSS files into single call
	TODO:	(??) Allow for semi-random styling
	TODO:	Option: [B]racket-capitalize quotes starting with lowercase letter
	TODO:  Make first-letter capitalization optional
*/

	var $option_version = '2.6';
	var $option_name = 'plugin_jspullquotes_settings';
	var $option_bools = array ( 'alt_sides', 'alt_text', 'skip_links', 'skip_internal_links', 'omit_styles' );
	var $tdSlug = 'jspullquotes';

	function __construct() {

		if ( ! defined( 'WP_CONTENT_DIR' ) )
			define( 'WP_CONTENT_DIR', ABSPATH . 'wp-content' );
		if ( ! defined( 'WP_CONTENT_URL' ) )
			define( 'WP_CONTENT_URL', get_option( 'siteurl' ) . '/wp-content' );
		if ( ! defined( 'WP_PLUGIN_DIR' ) )
			define( 'WP_PLUGIN_DIR', WP_CONTENT_DIR . '/plugins' );
		if ( ! defined( 'WP_PLUGIN_URL' ) )
			define( 'WP_PLUGIN_URL', WP_CONTENT_URL. '/plugins' );

		$this->plugin_dir = ( dirname( __FILE__ ) );
		$this->plugin_url = trailingslashit( WP_PLUGIN_URL ) . basename( dirname( __FILE__ ) );
// TODO: turn style_dir/url into user options:
		$this->style_dir = $this->plugin_dir . '/styles';
		$this->style_url = $this->plugin_url . '/styles';

/*
		$wud = wp_upload_dir();
		$this->style_dir = $wud['basedir'] . '/styles';
		$this->style_url = $wud['baseurl'] . '/styles';
error_log($this->style_dir);
error_log($this->style_url);
/**/

		load_plugin_textdomain( $this->tdSlug,
			'wp-content/plugins/' . basename( $this->plugin_dir ) . '/lang',
			basename( $this->plugin_dir ) . '/lang' );

		register_activation_hook( __FILE__, array( &$this, 'get_options' ) );
		add_action( 'admin_menu', array( &$this, 'add_settings_page' ) );

		$this->hook_header_links();
	}

	function hook_header_links() {
		$options = $this->get_options();
		if ( $options['links_location'] == 'footer' ) {
			add_action( 'wp_print_footer_scripts', array( &$this, 'wp_head' ) );
		} else {
			add_action( 'wp_head', array( &$this, 'wp_head' ) );
		}
	}

	function get_plugin_data( $param = null ) {
		// You can optionally pass a specific value to fetch, e.g. 'Version' -- but it's inefficient to do that multiple times
		// As of WP 2.5.1: 'Name', 'Title', 'Description', 'Author', 'Version'
		static $plugin_data;
		if ( ! $plugin_data ) {
			if ( ! function_exists( 'get_plugin_data' ) ) require_once( ABSPATH . 'wp-admin/includes/plugin.php' );
			$plugin_data = get_plugin_data( __FILE__ );
		}
		$output = $plugin_data;
		if ( $param && array_key_exists( $param, $plugin_data ) ) {
//			if ( in_array( $param, array_keys( $plugin_data ) ) ) {
				$output = $plugin_data[ $param ];
		}
		return $output;
	}

	function set_defaults( $mode = 'merge', $curr_options = null ) {
	// $mode can also be set to "unset" or "reset"
		if ( 'unset' == $mode ) {
			delete_option( $this->option_name );
			return true;
		}

		$options = array(
			'last_opts_ver' => $this->option_version,
			'style' => 'Default.css',
			'def_side' => 'right', 
			'alt_sides' => true, 
			'alt_text' => true, 
			'skip_links' => true, 
			'skip_internal_links' => true, 
			'q_container' => 'aside',
			'omit_styles' => false,
			'quote_class' => 'pullquote', 
			'quote_class_alt' => 'pullquote pqRight',
			'links_location' => 'head'
		);
		if ( 'reset' == $mode ) {
			delete_option( $this->option_name );
			add_option( $this->option_name, $options );
		} else {
			if ( ! $curr_options ) $curr_options = get_option( $this->option_name );
			if ( $curr_options ) {
			// Merge existing prefs with new or missing defaults
				$options = array_merge( $options, $curr_options );
				$options['last_opts_ver'] = $this->option_version; // always update
				update_option( $this->option_name, $options );
			} else {
				add_option( $this->option_name, $options );
			}
		}
		return $options;
	}

// Check to see if new version.  If so, make necessary updates to settings
	function get_options() {
		static $options;
		if ( ! $options ) {
			// Option key has changed.  Check DB for old name and update if needed
			if ( $options = get_option( $this->option_name ) ) {
			} elseif ( $options = get_option( 'jspullquotes_options' ) ) {
				add_option( $this->option_name, $options );
				delete_option( 'jspullquotes_options' );
			} else {
				return $this->set_defaults();
			}

			if ( ! $options['last_opts_ver'] || version_compare( $this->option_version, $options['last_opts_ver'], '>' ) ) {
				// Update "true" (string) to true/false (boolean)
				foreach ( $this->option_bools as $bool ) { 
					$options[$bool] = $options[$bool] ? true : false;
				}
				if ( isset( $options['style_name'] ) ) {
					if ( '.css' != substr( $options['style_name'], -4 ) ) {
						$options['style_name'] .= '/pullquote.css';
					}
					$options['style'] = $options['style_name'];
					unset( $options['style_name'] );
				} else if ( $options['style_url'] ) {
					// remove styles url from beginning of style file
					$options['style'] = preg_replace( '|^' . preg_quote( $this->plugin_url . '/styles/', '|' ) . '|', '', $options['style_url'] );
					unset( $options['style_url'] );
				}
				if ( isset( $options['last_used'] ) ) unset( $options['last_used'] );

				$options = $this->set_defaults( 'merge', $options );
			}
		}
		return $options;
	}

// Not actually used.  Might be handy to have....
	function style_basename( $file ) {
	// cribbed from plugin_basename
		$file = str_replace( '\\', '/', $file ); // sanitize for Win32 installs
		$file = preg_replace( '|/+|', '/', $file ); // remove any duplicate slash
		$plugin_dir = str_replace( '\\', '/', $this->style_dir ); // sanitize for Win32 installs
		$plugin_dir = preg_replace( '|/+|', '/', $this->style_dir ); // remove any duplicate slash
		$file = preg_replace( '|^' . preg_quote( $this->style_dir, '|' ) . '/|', '', $file ); // get relative path from pull-quote styles dir
		return $file;
	}

// TODO: May be coming to WP Core, but until then we need this for get_pqcss() -- See http://core.trac.wordpress.org/ticket/18302
	function locate_template_uri( $template_names ) {
		$located = '';
		foreach ( (array) $template_names as $template_name ) {
			if ( !$template_name )
				continue;

			if ( file_exists( trailingslashit( get_stylesheet_directory() ) . $template_name)) {
				$located = trailingslashit( get_stylesheet_directory_uri() ) . $template_name;
				break;
			} else if ( file_exists( trailingslashit( get_template_directory() ) . $template_name) ) {
				$located = trailingslashit( get_template_directory_uri() ) . $template_name;
				break;
			}
		}

		return $located;
	}

// ========================
// BLOG PAGE CODE
// ========================

// Fetch the stylesheet URL used for the active pullquote style
	function get_pqcss( $theStyle = null ) {
		if( ! $theStyle ) {
			$options = $this->get_options();
			$theStyle = $options['style'];
		}
		$theStylePath = $this->plugin_url . '/resources/jspullquotes-default.css';
		if ( file_exists( locate_template( 'jspullquotes.css' ) ) ) {
			// A stylesheet embedded in a WordPress theme overrides Options Page selection
			$theStylePath = $this->locate_template_uri( 'jspullquotes.css' );
		} elseif ( file_exists( trailingslashit( $this->style_dir ) . $theStyle ) ) {
			$theStylePath = trailingslashit( $this->style_url ) . $theStyle;
		}
		return $theStylePath;
	}

// Add the links to the blog page
	function wp_head() {
		$options = $this->get_options();
		$plugin_version = $this->get_plugin_data( 'Version' );
		$optionsarray = '"' .
			$options['skip_links'] . '", "' .
			$options['skip_internal_links'] . '", "' . 
			$options['def_side'] . '", "' . 
			$options['alt_sides'] . '", "' . 
			$options['alt_text'] . '", "' .
			$options['q_container'] . '", "' .
			$options['quote_class'] . '", "' .
			$options['quote_class_alt'] . '"';
		$stylelinks = '';
		if ( ! $options['omit_styles'] ) {
			$currStyle = $this->get_pqcss( $options['style'] );
			$stylelinks = <<<EOT
	<link rel="stylesheet" href="{$this->plugin_url}/resources/jspullquotes-core.css" type="text/css" />
	<link rel="stylesheet" href="{$currStyle}" type="text/css" />
EOT;
		}
		echo <<<EOT
<!-- Graceful Pull-Quotes plugin v{$plugin_version} -->
{$stylelinks}
	<script type="text/javascript">
		var jspq_options = new Array({$optionsarray});
	</script>
	<script type="text/javascript" src="{$this->plugin_url}/resources/jspullquotes.js"></script>
<!-- end pull-quote additions -->\n
EOT;
	}

// ========================
// SETTINGS PAGE CODE
// ========================

// Add the configuration screen to the Design menu in Admin
	function add_settings_page() {
		if ( current_user_can('switch_themes') ) {
			$page = add_theme_page( __( 'Pull-Quote Settings', $this->tdSlug ), __( 'Pull-Quotes', $this->tdSlug ), 'switch_themes', 'pull-quotes', array( &$this, 'settings_page' ) );

//			add_action( "admin_head-$page", array( &$this, 'admin_head' ) );
			add_action( "admin_print_scripts-$page", array( &$this, 'admin_head' ) );

			add_filter( 'plugin_action_links_'.plugin_basename( __FILE__ ), array( &$this, 'filter_plugin_actions' ) );
			add_filter( 'ozh_adminmenu_icon', array( &$this, 'add_ozh_adminmenu_icon' ) );
		}
	}

// Add "preview" script to settings page head
	function admin_head() {
		echo <<<EOT
<!-- Graceful Pull-Quotes plugin -->
	<script src="{$this->plugin_url}/resources/preview.js" type="text/javascript" language="JavaScript" charset="utf-8"></script>
<!-- end pull-quote additions -->\n
EOT;
	}

// Add homepage link to settings page footer
	function admin_footer() {
		$pluginfo = $this->get_plugin_data();
		printf( '%1$s plugin | Version %2$s | by %3$s<br />', $pluginfo['Title'], $pluginfo['Version'], $pluginfo['Author'] );
	}

// Add action link(s) to plugins page
	function filter_plugin_actions( $links ) {
		$settings_link = '<a href="themes.php?page=pull-quotes">' . __('Settings') . '</a>';
		array_unshift( $links, $settings_link ); // before other links
		return $links;
	}

	function add_ozh_adminmenu_icon( $hook ) {
		$icon = trailingslashit( WP_PLUGIN_URL ) . basename( dirname( __FILE__ ) ) . '/resources/menu_icon.png';
		if ( $hook == 'pull-quotes' ) return $icon;
		return $hook;
	}

// this function is used by the settings page to display set options in the form controls when the page is opened
// for text boxes or textarea
	function checktext( $options, $optname, $optdefault = '' ) {
		return $options[$optname] ? $options[$optname] : $optdefault;
	}

// finally, the Settings Page itself
	function settings_page() {	
		if ( isset( $_POST['save_settings'] ) ) {
			check_admin_referer( 'jspullquotes-update-options' );
			$newoptions = $_POST[$this->option_name];
			foreach( $this->option_bools as $bool ) { 
				// explicitly set all checkboxes true or false
				$newoptions[$bool] = isset( $newoptions[$bool] ) ? true : false;
			}
			$newoptions['last_opts_ver'] = $this->option_version; // always update
			update_option( $this->option_name, $newoptions );
			echo '<div id="message" class="updated fade"><p><strong>' . __('Settings saved.') . '</strong></p></div>';
		} 

		// get options for use in form-setting functions
		$opts = $this->get_options();

		// Get array of CSS files for Style dropdown
		if ( file_exists( $this->style_dir ) && $handle = opendir( $this->style_dir ) ) {
			$arrStyles = array();
			while ( false !== ( $file = readdir( $handle ) ) ) {
				if ( substr( $file, 0, 1) != '.' ) {
					$filename = basename( $file, '.css' );
					if( is_dir( trailingslashit( $this->style_dir ) . $file ) )
						$file .= '/pullquote.css';
					$arrStyles[] = array( 'name' => $filename, 'file'=> $file );
				}
			}
			closedir( $handle );
			unset( $handle, $file, $filename, $fileurl );
		}
		if ( ! isset( $arrStyles[0] ) ) {
		// If no styles, use the core Default style
			$arrStyles = array(
				array(
					'name'=>'Default',
					'file'=>'default_style'
					)
				);
		}

	?>
<div class="wrap">
	<h2><?php _e( 'Pull-Quote Settings', $this->tdSlug ); ?></h2>
	<form action="themes.php?page=pull-quotes" method="post">
		<?php
		if ( function_exists( 'wp_nonce_field' ) )
			wp_nonce_field( 'jspullquotes-update-options' );
		?>
		<h3><?php _e( 'Basic Options', $this->tdSlug ); ?></h3>
		<table class="form-table">
			<tbody>
				<tr valign="top">
					<th scope="row"><?php _e( 'Appearance', $this->tdSlug ); ?></th>
					<td><label for="style">
						<select name="<?php echo $this->option_name ?>[style]" id="style"<?php echo( isset( $arrStyles[1] ) ? '' : ' title="' . __( 'Only one style is available', $this->tdSlug ) . '" class="code disabled" disabled="disabled"' ) ?>>
<?php
			foreach ( $arrStyles as $style ) {
//				$deftag = ( $style['name'] == 'Default' ) ? true : false;
				echo '							<option value="' . $style['file'] . '"' . selected( $opts['style'], $style['file'], false ) . '>' . __( $style['name'], $this->tdSlug ) . "</option>\n";
			}
?>						</select>
					</label> <a href="#" onclick="pullquote_preview_pop('<?php echo( $this->plugin_url ); // FIXME: this link should only appear if there's JavaScript, or make it work without ?>/resources', '<?php echo( $this->style_url ); ?>', document.getElementById('style').value); return false;" title="<?php _e( 'show a preview of the selected style in a pop-up window', $this->tdSlug ); ?>" class="button-secondary"><?php _e( 'preview', $this->tdSlug ); ?></a><br />
					<?php _e( 'Note: a "jspullquotes.css" file in the active Theme directory will override this setting', $this->tdSlug ); ?></td>
				</tr>
<?php
		$cmbpicksides = '<select name="' . $this->option_name . '[def_side]" id="def_side">
							<option value="left"' . selected( $opts['def_side'], 'left', false ) . '>' . __( 'left', $this->tdSlug ) . '</option>
							<option value="right"' . selected( $opts['def_side'], 'right', false ) . '>' . __( 'right', $this->tdSlug ) . '</option>
						</select>';
?>
				<tr valign="top">
					<th scope="row"><?php _e( 'Position', $this->tdSlug ); ?></th>
					<td><label for="def_side">
						<?php echo( sprintf( __( 'Display quotes on %s side', $this->tdSlug ), $cmbpicksides ) ); ?></label><br />
						<label for="alt_sides"><input type="checkbox" name="<?php echo $this->option_name; ?>[alt_sides]" id="alt_sides" value="true"<?php checked( $opts['alt_sides'] ); ?> /> <?php _e( 'Successive quotes on one page alternate sides', $this->tdSlug ); ?></label><br />
						<label for="alt_text"><input type="checkbox" name="<?php echo $this->option_name; ?>[alt_text]" id="alt_text" value="true"<?php checked( $opts['alt_text'] ); ?> /> <?php _e( 'Use alternative text if available', $this->tdSlug ); ?></label> (<a href="<?php echo( $this->plugin_url ); ?>/resources/help/alt-text-info.<?php _e( 'en_US', $this->tdSlug ); ?>.htm"><?php _e( 'how?', $this->tdSlug ); ?></a>)</td>
				</tr>
			</tbody>
		</table>

		<h3><?php _e( 'Advanced Options', $this->tdSlug ); ?></h3>
<?php
		$cmbq_container = '<select name="' . $this->option_name . '[q_container]" id="q_container">
							<option value="aside"' . selected( $opts['q_container'], 'aside', false ) . '>&lt;aside&gt; (default)</option>
							<option value="blockquote"' . selected( $opts['q_container'], 'blockquote', false ) . '>&lt;blockquote&gt;</option>
							<option value="div"' . selected( $opts['q_container'], 'div', false ) . '>&lt;div&gt;</option>
						</select>';
		$cmbg_links_location = '<select name="' . $this->option_name . '[links_location]" id="links_location">
							<option value="head"' . selected( $opts['links_location'], 'head', false ) . '>Page Head (default)</option>
							<option value="footer"' . selected( $opts['links_location'], 'footer', false ) . '>Page Footer</option>
						</select>';
?>
		<table class="form-table">
			<tbody>
				<tr valign="top">
					<th scope="row"><?php _e( 'HTML Container', $this->tdSlug ); ?></th>
					<td><label for="q_container">
						<?php echo $cmbq_container . ' ' . __( 'Type of tag that will contain the pull-quote', $this->tdSlug ) ?></label></td>
				</tr>
				<tr valign="top">
					<th scope="row"><?php _e( 'HTML Links', $this->tdSlug ); ?></th>
					<td><label for="skip_links"><input type="checkbox" name="<?php echo $this->option_name; ?>[skip_links]" id="skip_links" value="true"<?php checked( $opts['skip_links'] ); ?> /> <?php _e( 'Remove external links from pull-quotes', $this->tdSlug ); ?></label> <strong><?php _e( '(recommended)', $this->tdSlug ); ?></strong><br />
						<label for="skip_internal_links"><input type="checkbox" name="<?php echo $this->option_name; ?>[skip_internal_links]" id="skip_internal_links" value="true"<?php checked( $opts['skip_internal_links'] ); ?> /> <?php _e( 'Remove internal links (href="#id") from pull-quotes', $this->tdSlug ); ?></label></td>
				</tr>
				<tr valign="top">
					<th scope="row"><abbr title="<?php _e( 'Cascading Style Sheets', $this->tdSlug ); ?>">CSS</abbr></th>
					<td>
						<label for="omit_styles"><input type="checkbox" name="<?php echo $this->option_name; ?>[omit_styles]" id="omit_styles" value="true"<?php checked( $opts['omit_styles'] ); ?> /> <?php _e( 'Do not link CSS', $this->tdSlug ); ?></label><br /><?php _e( 'Check this if you prefer to manually put your pull-quote styles elsewhere', $this->tdSlug ); ?><br />
						<br />
						<input type="text" name="<?php echo $this->option_name ?>[quote_class]" id="quote_class" value="<?php echo( $this->checktext( $opts,'quote_class','pullquote' ) ); ?>" /><label for="quote_class"> <?php _e( 'Class selector for default pull-quote', $this->tdSlug ); ?></label><br />
						<input type="text" name="<?php echo $this->option_name ?>[quote_class_alt]" id="quote_class_alt" value="<?php echo( $this->checktext( $opts, 'quote_class_alt', 'pullquote pqRight' ) ); ?>"/><label for="quote_class_alt"> <?php _e( 'Class selector for alt-side pull-quote', $this->tdSlug ); ?></label>
					</td>
				</tr>
				<tr valign="top">
					<th scope="row"><?php _e( 'Links Location', $this->tdSlug ); ?></th>
					<td><label for="links_location">
							<?php echo $cmbg_links_location . ' ' . __( 'Where on the page the Style and Script links will be written', $this->tdSlug ) ?></label></td>
				</tr>
			</tbody>
		</table>
		<div class="submit">
			<input type="submit" name="save_settings" class="button-primary" value="<?php _e( 'Save Changes' ) ?>" /></div>
	</form>
</div><!-- wrap -->
	<?php
		// add attribution to page footer
		add_action( 'in_admin_footer', array( &$this, 'admin_footer' ), 9 );
	}

	// DEPRECATED -- maybe safe to remove

	/*
	function p__( $text ) {
		_deprecated_function( __FUNCTION__, 'Graceful Pull-Quotes 2.5', '__()' );
		return __( $text, $this->tdSlug );
	}
	function p_e( $text ) {
		_deprecated_function( __FUNCTION__, 'Graceful Pull-Quotes 2.5', '_e()' );
		_e( $text, $this->tdSlug );
	}

	// for checkboxes
	function checkflag( $options, $optname ) {
		_deprecated_function( __FUNCTION__, 'Graceful Pull-Quotes 2.5', 'checked()' );
		return $options[$optname] ? ' checked="checked"' : '';
	}

	// for dropdowns
	function checkcombo( $options, $optname, $thisopt, $is_default = false ) {
		_deprecated_function( __FUNCTION__, 'Graceful Pull-Quotes 2.5', 'selected()' );
		return (
			( $is_default && ! $options[$optname] ) ||
			$options[$optname] == $thisopt
		) ? ' selected="selected"' : '';
	}
	*/
} // end class

$jspullquotes = new jspullquotes;

?>