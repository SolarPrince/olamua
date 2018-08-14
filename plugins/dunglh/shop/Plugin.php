<?php namespace Dunglh\Shop;

use System\Classes\PluginBase;

class Plugin extends PluginBase
{
    public function registerComponents()
    {
    	return [
    		'Dunglh\Shop\Components\Products' => 'products'
    	];
    }

    public function registerSettings()
    {
    	
    }
}
