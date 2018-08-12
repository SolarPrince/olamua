<?php namespace Dunglh\Shop\Updates;

use Schema;
use October\Rain\Database\Updates\Migration;

class BuilderTableCreateDunglhShopProducts extends Migration
{
    public function up()
    {
        Schema::create('dunglh_shop_products', function($table)
        {
            $table->engine = 'InnoDB';
            $table->bigIncrements('id')->unsigned();
            $table->string('name');
            $table->string('slug')->index();
            $table->longText('description')->nullable();
            $table->double('price', 10, 0)->default(0);
            $table->double('sale_price', 10, 0)->default(0);
            $table->boolean('is_customizable')->default(0);
            $table->boolean('is_wrappable')->default(0);
            $table->boolean('is_featured')->default(0);
            $table->boolean('is_active')->default(1);
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });
    }
    
    public function down()
    {
        Schema::dropIfExists('dunglh_shop_products');
    }
}
