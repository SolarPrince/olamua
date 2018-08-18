<?php namespace Dunglh\Shop\Components;

use Cms\Classes\ComponentBase;
use Cms\Classes\Page;
use Dunglh\Shop\Models\Product as Product;
use Dunglh\Shop\Models\Category as ProductCategory;
use Db;
use Input;

class ShopBreadcrumbs extends ComponentBase
{
    protected $slug;
    protected $categoryPage;
    protected $productPage;
    protected $currentPage;
    protected $homeText;
    
    public function componentDetails()
    {
        return [
            'name'        => 'Shop breadcrumbs',
            'description' => 'Generate breadcrumbs for shop'
        ];
    }

    public function defineProperties()
    {
        return [
            'categoryPage' => [
                'title'       => 'CategoryPage',
                'description' => 'Page display product category',
                'type'        => 'dropdown',
                'default'     => 'loai-san-pham',
            ],
            'productPage' => [
                'title'       => 'ProductPage',
                'description' => 'Page display product detail',
                'type'        => 'dropdown',
                'default'     => 'san-pham',
            ],
            'slug' => [
                'title'       => 'Slug',
                'description' => 'To indentify current product or product category',
                'default'     => '{{ :slug }}',
                'type'        => 'string'
            ],
            'currentPage' => [
                'title'       => 'CurrentPage',
                'description' => 'Current page to display correct breadcrumbs',
                'type'        => 'dropdown',
                'default'     => 'san-pham',
            ],
            'homeText' => [
                'title'       => 'Home Text',
                'description' => 'Text for home breadcrumb',
                'type'        => 'string',
                'default'     => 'Trang chủ',
            ],
        ];
    }

    public function getCategoryPageOptions()
    {
        return Page::sortBy('baseFileName')->lists('baseFileName', 'baseFileName');
    }

    public function getProductPageOptions()
    {
        return Page::sortBy('baseFileName')->lists('baseFileName', 'baseFileName');
    }

    public function getCurrentPageOptions()
    {
        return Page::sortBy('baseFileName')->lists('baseFileName', 'baseFileName');
    }

    public function onRun()
    {
        $this->categoryPage = $this->page['categoryPage'] = $this->property('categoryPage');
        $this->productPage = $this->page['productPage'] = $this->property('productPage');
        $this->currentPage = $this->page['currentPage'] = $this->property('currentPage');
        $this->slug = $this->page['slug'] = $this->property('slug');
        $this->homeText = $this->page['homeText'] = $this->property('homeText');

        $controller = $this->controller;
        $parent_id = null;
        $categoryPath = [];

        if($this->currentPage == $this->productPage){
            $currentCategory = $this->loadCategoryForCurrentProduct();
            if ( $currentCategory ) {
                $parent_id = $currentCategory->parent_id;
                $categoryPath []= $currentCategory;
            }
        } else {
            $currentCategory = $this->loadCategory();
            if ( $currentCategory ) {
                $parent_id = $currentCategory->parent_id;
                $currentCategory->nolink = true;
                $categoryPath []= $currentCategory;
            }
        }

        $this->getLastestParent($parent_id, $categoryPath);
        $categoryPath = array_reverse($categoryPath);
        $breadCrumbs = [];
        //echo "<pre>"; var_dump($categoryPath);echo "</pre>";
        if ( $categoryPath ) {
            $breadCrumbs []= [
                'link' => url('/'),
                'name' => $this->homeText,
                'separator' => null
            ];
            foreach ( $categoryPath as $category ) {
                $params = [
                    'id' => $category->id, 
                    'slug' => $category->slug, 
                ];

                if ( $category->nolink )
                {
                    $breadCrumbs []= [
                        'link' => '#',
                        'name' => $category->name,
                        'separator' => null
                    ];    
                }
                else 
                {
                    $breadCrumbs []= [
                        'link' => $controller->pageUrl($this->categoryPage, $params),
                        'name' => $category->name,
                        'separator' => null
                    ];   
                }
            }
            
            if ( $breadCrumbs && $this->currentPage == $this->productPage ) {
                $product = Product::where('slug', $this->slug)->first();
                if ( $product ) {
                    $breadCrumbs []= [
                        'link' => '#',
                        'name' => $product->name,
                        'separator' => null
                    ];
                }
            }  
        }      
        //echo "<pre>"; var_dump($breadCrumbs); die;
        $this->breadCrumbs = $this->page['breadCrumbs'] = $breadCrumbs;
    }

    protected function loadCategoryForCurrentProduct()
    {
        if (!$slug = $this->property('slug'))
            return null;
        //find parent
        //echo $postSlug, "<br/>";
        //echo "<pre>"; var_dump($firstCategory);die;
        if ( Input::get('cslug', false) ) {
            $categoryId = Input::get('cslug', false);
            if (!$category = ProductCategory::whereSlug($categoryId)->first()) return null;
        }
        else {
            $firstCategory = Db::table('dunglh_shop_products')
            ->join('dunglh_shop_products_categories', 'dunglh_shop_products_categories.product_id', '=', 'dunglh_shop_products.id')
            ->join('dunglh_shop_categories', 'dunglh_shop_categories.id', '=', 'dunglh_shop_products_categories.category_id')
            ->select('dunglh_shop_categories.id')
            ->where('dunglh_shop_products.slug', $slug)
            ->first();

            $categoryId = 0;
            if ( $firstCategory ) {
                $categoryId = $firstCategory->id;
            }     

            if (!$category = ProductCategory::find($categoryId)) return null;
            //echo "<pre>"; var_dump($category->name); die;
        }

        return $category;
    }

    protected function loadCategory()
    {
        if (!$categoryId = $this->property('slug'))
            return null;

        if (!$category = ProductCategory::whereSlug($categoryId)->first())
            return null;

        return $category;
    }

    public function getLastestParent($parent_id, &$categoryPath = [])
    {
        if ( !$parent_id ) {
            return null;
        }
        //echo $parent_id,"<hr/>";
        $category = ProductCategory::where('id', intval($parent_id))->first();
        if ( is_object($category) && $category->id ) {
            $categoryPath []= $category;
            if ( intval($category->parent_id) ) $this->getLastestParent($category->parent_id, $categoryPath);
            return $categoryPath;
        }
        return null;
    }

}