<?php namespace Dunglh\Shop\Components;

use Cms\Classes\ComponentBase;
use Cms\Classes\Page;
use Dunglh\Shop\Models\Product as Product;
use Dunglh\Shop\Models\Category as ProductCategory;

class Products extends ComponentBase
{
    /**
     * A collection of products to display
     * @var Collection
     */
    public $products;

    /**
     * Parameter to use for the page number
     * @var string
     */
    public $pageParam;

    /**
     * If the post list should be filtered by a category, the model to use.
     * @var Model
     */
    public $category;

    /**
     * Message to display when there are no messages.
     * @var string
     */
    public $noProductsMessage;

    /**
     * Reference to the page name for linking to products.
     * @var string
     */
    public $productPage;

    /**
     * Reference to the page name for linking to categories.
     * @var string
     */
    public $categoryPage;

    /**
     * If the post list should be ordered by another attribute.
     * @var string
     */
    public $sortOrder;

    public function componentDetails()
    {
        return [
            'name'        => 'Products Component',
            'description' => 'Products list on frontend page...'
        ];
    }

    public function defineProperties()
    {
        return [
            'pageNumber' => [
                'title'       => 'Số trang',
                'description' => 'Hiện đang ở trang thứ mấy',
                'type'        => 'string',
                'default'     => '{{ :page }}',
            ],
            'categoryFilter' => [
                'title'       => 'Danh mục',
                'description' => 'Nhập vào slug hay url danh mục để lấy ds sản phẩm, nếu bỏ trống thì lấy tất sản phẩm',
                'type'        => 'string',
                'default'     => ''
            ],
            'postsPerPage' => [
                'title'             => 'Số sản phẩm trên trang',
                'type'              => 'string',
                'validationPattern' => '^[0-9]+$',
                'validationMessage' => 'Vui lòng nhập số',
                'default'           => '10',
            ],
            'noPostsMessage' => [
                'title'        => 'No products message',
                'description'  => 'Lời nhắn hiển thị khi không có sản phẩm',
                'type'         => 'string',
                'default'      => 'Không có sản phẩm nào được tìm thấy',
                'showExternalParam' => false
            ],
            'sortOrder' => [
                'title'       => 'Sắp xếp theo',
                'description' => 'Sắp xếp sản phẩm theo',
                'type'        => 'dropdown',
                'default'     => 'created_at desc'
            ],
            'categoryPage' => [
                'title'       => 'Trang danh mục',
                'description' => 'Dùng hiển thị links',
                'type'        => 'dropdown',
                'default'     => 'danh-muc',
                'group'       => 'Links',
            ],
            'postPage' => [
                'title'       => 'Trang chi tiết sản phẩm',
                'description' => 'Dùng hiển thị links',
                'type'        => 'dropdown',
                'default'     => 'san-pham',
                'group'       => 'Links',
            ]
        ];
    }

    public function getCategoryPageOptions()
    {
        return Page::sortBy('baseFileName')->lists('baseFileName', 'baseFileName');
    }

    public function getPostPageOptions()
    {
        return Page::sortBy('baseFileName')->lists('baseFileName', 'baseFileName');
    }

    public function getSortOrderOptions()
    {
        return Product::$allowedSortingOptions;
    }

    public function onRun()
    {
        $this->prepareVars();

        $this->category = $this->page['category'] = $this->loadCategory();
        $this->products = $this->page['products'] = $this->listProducts();

        /*
         * If the page number is not valid, redirect
         */
        if ($pageNumberParam = $this->paramName('pageNumber')) {
            $currentPage = $this->property('pageNumber');

            if ($currentPage > ($lastPage = $this->products->lastPage()) && $currentPage > 1)
                return Redirect::to($this->currentPageUrl([$pageNumberParam => $lastPage]));
        }
    }

    protected function prepareVars()
    {
        $this->pageParam = $this->page['pageParam'] = $this->paramName('pageNumber');
        $this->noPostsMessage = $this->page['noPostsMessage'] = $this->property('noPostsMessage');

        /*
         * Page links
         */
        $this->productPage = $this->page['productPage'] = $this->property('productPage');
        $this->categoryPage = $this->page['categoryPage'] = $this->property('categoryPage');
    }

    protected function listProducts()
    {
        $category = $this->category ? $this->category->id : null;

        /*
         * List all the posts, eager load their categories
         */
        //$isPublished = !$this->checkEditor();

        $products = Product::with('categories')->listFrontEnd([
            'page'       => $this->property('pageNumber'),
            'sort'       => $this->property('sortOrder'),
            'perPage'    => $this->property('postsPerPage'),
            'search'     => trim(input('search')),
            'category'   => $category,
            'is_active'  => 1
        ]);

        /*
         * Add a "url" helper attribute for linking to each product and category
         */
        $products->each(function($products) {
            $products->setUrl($this->productPage, $this->controller);

            $products->categories->each(function($category) {
                $category->setUrl($this->categoryPage, $this->controller);
            });
        });

        return $products;
    }

    protected function loadCategory()
    {
        if (!$slug = $this->property('categoryFilter')) {
            return null;
        }

        $category = new ProductCategory;

        $category = $category->isClassExtendedWith('RainLab.Translate.Behaviors.TranslatableModel')
            ? $category->transWhere('slug', $slug)
            : $category->where('slug', $slug);

        $category = $category->first();

        return $category ?: null;
    }
}
