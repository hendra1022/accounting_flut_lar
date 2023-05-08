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
        Schema::create('purchase_headers', function (Blueprint $table) {
            $table->id();
            $table->dateTime("purchase_date");
            $table->bigInteger("s_id");
            $table->bigInteger("gross_amount");
            $table->bigInteger("net_amount");
            $table->bigInteger("note");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchase_headers');
    }
};
