<?php namespace Dunglh\Shop\Components;

use Cms\Classes\ComponentBase;
use Cms\Classes\Page;
use Dunglh\Shop\Models\Product as ProductModel;

class Product extends ComponentBase
{
    /**
     * @var RainLab\Blog\Models\Post The post model used for display.
     */
    public $post;

    /**
     * @var string Reference to the page name for linking to categories.
     */
    public $categoryPage;
    public function componentDetails()
    {
        return [
            'name'        => 'Product Component',
            'description' => 'Display product detail...'
        ];
    }

    public function defineProperties()
    {
        return [
            'slug' => [
                'title'       => 'Slug',
                'description' => 'Slug to get product',
                'default'     => '{{ :slug }}',
                'type'        => 'string'
            ],
            'categoryPage' => [
                'title'       => 'Trang danh mục',
                'description' => 'Dùng hiển thị link',
                'type'        => 'dropdown',
                'default'     => 'blog/category',
            ],
        ];
    }

    public function getCategoryPageOptions()
    {
        return Page::sortBy('baseFileName')->lists('baseFileName', 'baseFileName');
    }

    public function onRun()
    {
        $this->categoryPage = $this->page['categoryPage'] = $this->property('categoryPage');
        $this->product = $this->page['product'] = $this->loadProduct();
    }

    public function onRender()
    {
        if (empty($this->product)) {
            $this->product = $this->page['product'] = $this->loadProduct();
        }
    }

    protected function loadProduct()
    {
        $slug = $this->property('slug');

        $product = new ProductModel;

        $product = $product->isClassExtendedWith('RainLab.Translate.Behaviors.TranslatableModel')
            ? $product->transWhere('slug', $slug)
            : $product->where('slug', $slug);

        $product = $product->first();

        /*
         * Add a "url" helper attribute for linking to each category
         */
        if ($product && $product->categories->count()) {
            $product->categories->each(function($category) {
                $category->setUrl($this->categoryPage, $this->controller);
            });
        }

        return $product;
    }
}
