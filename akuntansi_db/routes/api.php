<?php

use App\Http\Controllers\UserLoginController;
use Illuminate\Support\Facades\Route;


Route::controller(UserLoginController::class)->group(function () {
    Route::get('/user_login/{test}', 'coba_get');
    Route::resource('user_login', UserLoginController::class);
});
