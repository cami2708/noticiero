<?php
/**
 * Jetpack Compatibility File
 * See: http://jetpack.me/
 *
 * @package oxygen
 */

function oxygen_jetpack_setup() {
	add_theme_support( 'jetpack-responsive-videos' );
	add_image_size( 'oxygen-logo', 470, 140 );
	add_theme_support( 'site-logo', array( 'size' => 'oxygen-logo' ) );
}
add_action( 'after_setup_theme', 'oxygen_jetpack_setup' );

/**
 * Return early if Site Logo is not available.
 */
function oxygen_the_site_logo() {
	if ( ! function_exists( 'jetpack_the_site_logo' ) ) {
		return;
	} else {
		jetpack_the_site_logo();
	}
}