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
        Schema::create('items', function (Blueprint $table) {
            $table->id();
            $table->string('name')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('phone');
            $table->string('active', 1)->default("1");
            $table->string('have_child')->default("0");
            $table->bigInteger('parent_id')->default("0");
            $table->bigInteger('ic_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('items');
    }
};
