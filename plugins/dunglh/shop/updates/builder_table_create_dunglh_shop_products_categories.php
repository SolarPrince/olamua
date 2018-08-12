<?php namespace Dunglh\Shop\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateDunglhShopProductsCategories extends Migration
{
    public function up()
    {
        Schema::create('dunglh_shop_products_categories', function($table)
        {
            $table->engine = 'InnoDB';
            $table->bigInteger('product_id');
            $table->integer('category_id');
            $table->primary(['product_id','category_id']);
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('dunglh_shop_products_categories');
    }
}
