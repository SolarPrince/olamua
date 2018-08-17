<?php namespace Dunglh\Shop;

use System\Classes\PluginBase;
use Dunglh\Shop\Models\Category;
use Event;

class Plugin extends PluginBase
{
    public function registerComponents()
    {
    	return [
            'Dunglh\Shop\Components\Products' => 'products',
            'Dunglh\Shop\Components\Product' => 'product'
    	];
    }

    public function registerSettings()
    {
    	
    }

    public function boot()
    {
        /*
         * Register menu items for the RainLab.Pages plugin
         */
        Event::listen('pages.menuitem.listTypes', function() {
            return [
                'product-category'       => 'Product category',
                'all-product-categories' => 'All product categories',
                // 'product-single'           => 'Product single',
                // 'all-products'      => 'All products',
            ];
        });

        Event::listen('pages.menuitem.getTypeInfo', function($type) {
            if ($type == 'product-category' || $type == 'all-product-categories') {
                return Category::getMenuTypeInfo($type);
            }
            // elseif ($type == 'blog-post' || $type == 'all-blog-posts') {
            //     return Post::getMenuTypeInfo($type);
            // }
        });

        Event::listen('pages.menuitem.resolveItem', function($type, $item, $url, $theme) {
            if ($type == 'product-category' || $type == 'all-product-categories') {
                return Category::resolveMenuItem($item, $url, $theme);
            }
            // elseif ($type == 'blog-post' || $type == 'all-blog-posts') {
            //     return Post::resolveMenuItem($item, $url, $theme);
            // }
        });
    }
}
