<?php namespace Dunglh\Shop;

use System\Classes\PluginBase;

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
}
