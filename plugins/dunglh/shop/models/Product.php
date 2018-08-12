<?php namespace Dunglh\Shop\Models;

use Model;

/**
 * Model
 */
class Product extends Model
{
    use \October\Rain\Database\Traits\Validation;
    
    /**
     * @var array Validation rules
     */
    public $rules = [
    ];

    /**
     * @var string The database table used by the model.
     */
    public $table = 'dunglh_shop_products';

    public $belongsToMany = [
        'categories' => [
            'Dunglh\shop\Models\Category',
            'table' => 'dunglh_shop_products_categories',
            'order' => 'name'
        ]
    ];

    public $attachMany = [
        'images' => 'System\Models\File'
    ];
}
