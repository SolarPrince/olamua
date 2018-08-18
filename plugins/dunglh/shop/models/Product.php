<?php namespace Dunglh\Shop\Models;

use Model;
use Dunglh\Shop\Classes\Helper as Helper;
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

    /**
     * Lists posts for the front end
     *
     * @param        $query
     * @param  array $options Display options
     *
     * @return Post
     */
    public function scopeListFrontEnd($query, $options)
    {
        /*
         * Default options
         */
        extract(array_merge([
            'page'       => 1,
            'perPage'    => 10,
            'sort'       => 'created_at',
            'categories' => null,
            'category'   => null,
            'search'     => '',
            'is_active'  => true,
        ], $options));

        $searchableFields = ['title', 'slug', 'description'];

        /*
         * Sorting
         */
        if (!is_array($sort)) {
            $sort = [$sort];
        }

        foreach ($sort as $_sort) {

            if (in_array($_sort, array_keys(self::$allowedSortingOptions))) {
                $parts = explode(' ', $_sort);
                if (count($parts) < 2) {
                    array_push($parts, 'desc');
                }
                list($sortField, $sortDirection) = $parts;
                if ($sortField == 'random') {
                    $sortField = Db::raw('RAND()');
                }
                $query->orderBy($sortField, $sortDirection);
            }
        }

        /*
         * Search
         */
        $search = trim($search);
        if (strlen($search)) {
            $query->searchWhere($search, $searchableFields);
        }

        /*
         * Categories
         */
        if ($categories !== null) {
            if (!is_array($categories)) $categories = [$categories];
            $query->whereHas('categories', function($q) use ($categories) {
                $q->whereIn('id', $categories);
            });
        }

        /*
         * Category, including children
         */
        if ($category !== null) {
            $category = Category::find($category);

            $categories = $category->getAllChildrenAndSelf()->lists('id');
            $query->whereHas('categories', function($q) use ($categories) {
                $q->whereIn('id', $categories);
            });
        }

        return $query->paginate($perPage, $page);
    }

    /**
     * Sets the "url" attribute with a URL to this object
     * @param string $pageName
     * @param Cms\Classes\Controller $controller
     */
    public function setUrl($pageName, $controller)
    {
        $params = [
            'id'   => $this->id,
            'slug' => $this->slug,
        ];

        if (array_key_exists('categories', $this->getRelations())) {
            $params['category'] = $this->categories->count() ? $this->categories->first()->slug : null;
        }

        return $this->url = $controller->pageUrl($pageName, $params);
    }

    /**
     * Set display price and sale
     */
    public function setDisplayPrice(){
        if($this->price > $this->sale_price && $this->sale_price > 0){
            $this->onSale = true;
            $this->display_price = '<del>'.Helper::vnNumberFormat($this->price).'đ</del> '.Helper::vnNumberFormat($this->sale_price).'đ';
        } else {
            $this->onSale = false;
            $this->display_price = Helper::vnNumberFormat($this->price).'đ';
        }
    }
}
