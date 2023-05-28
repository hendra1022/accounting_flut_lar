<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('stock_histories', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('i_id');
            $table->bigInteger('hl_id');
            $table->smallInteger('transaction_type');
            $table->mediumInteger('total_qty');
            $table->mediumInteger('current_qty');
            $table->bigInteger('unit_price');
            $table->bigInteger('source_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('stock_histories');
    }
};
