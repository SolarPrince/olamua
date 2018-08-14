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

    /**
     * The attributes on which the product list can be ordered
     * @var array
     */
    public static $allowedSortingOptions = [
        'name asc' => 'Tên (a-z)',
        'name desc' => 'Tên (z-a)',
        'created_at desc' => 'Mới nhất',
        'sale_price asc' => 'Gía (tăng dần)',
        'sale_price desc' => 'Gía (giảm dần)',
    ];

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
