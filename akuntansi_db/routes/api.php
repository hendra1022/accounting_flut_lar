<?php

use App\Http\Controllers\CustomerController;
use App\Http\Controllers\CustomerTypeController;
use App\Http\Controllers\ItemCategoryController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\PurchaseHeaderController;
use App\Http\Controllers\PurchaseHeaderLineController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\UserLoginController;
use Illuminate\Support\Facades\Route;


Route::controller(UserLoginController::class)->group(function () {
    Route::get('/user_login/id', 'coba_get');
    Route::resource('user_login', UserLoginController::class);
});

Route::controller(CustomerTypeController::class)->group(function () {
    // Route::get('/customer_type/id', 'coba_get');
    Route::get('/customer_type/filter', 'indexByParam');
    Route::resource('customer_type', CustomerTypeController::class);
});

Route::controller(CustomerController::class)->group(function () {
    Route::get('/customer/filter', 'indexByParam');
    Route::resource('customer', CustomerController::class);
});

Route::controller(SupplierController::class)->group(function () {
    Route::get('/supplier/filter', 'indexByParam');
    Route::resource('supplier', SupplierController::class);
});

Route::controller(ItemCategoryController::class)->group(function () {
    Route::get('/item_category/filter', 'indexByParam');
    Route::resource('item_category', ItemCategoryController::class);
});

Route::controller(ItemController::class)->group(function () {
    Route::get('/item/filter', 'indexByParam');
    Route::resource('item', ItemController::class);
});


Route::controller(PurchaseHeaderController::class)->group(function () {
    Route::get('/purchase_header/filter', 'indexByParam');
    Route::post('/purchase_header/store', 'storeHeaderAndLine');
    Route::resource('purchase_header', PurchaseHeaderController::class);
});

Route::controller(PurchaseHeaderLineController::class)->group(function () {
    Route::get('/purchase_header_line/filter', 'indexByParam');
    Route::resource('purchase_header_line', PurchaseHeaderLineController::class);
});
