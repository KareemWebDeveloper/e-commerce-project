<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\categoryController;
use App\Http\Controllers\ProductController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/
Route::get("/allProudcts" ,  [ProductController::class, 'index']);
Route::get("/proudcts/{id}" ,  [ProductController::class, 'show']);
Route::get("/Featured" ,  [ProductController::class, 'RandomFeatured']);
Route::get("/Men" ,  [categoryController::class, 'MenCategory']);
Route::get("/Women" ,  [categoryController::class, 'WomenCategory']);
Route::get("/accessories" ,  [categoryController::class, 'accessories']);
Route::get("/footwear" ,  [categoryController::class, 'footwear']);
Route::get("/sales" ,  [categoryController::class, 'sales']);
Route::get("/KIDS" ,  [categoryController::class, 'KidsCategory']);
Route::get("/category" ,  [categoryController::class, 'index']);
Route::post("/login" ,  [AuthController::class, 'login']);
Route::post("/Register" ,  [AuthController::class, 'Register']);
Route::get("/search" ,  [ProductController::class, 'Search']);


Route::group(['middleware' => ['auth:sanctum']],function(){
    Route::post("/proudctss" ,  [ProductController::class, 'store']);
    Route::post("/proudcts/update" ,  [ProductController::class, 'update']);
    Route::delete("/proudcts/remove/{id}" ,  [ProductController::class, 'destroy']);
    Route::post("/category" ,  [categoryController::class, 'store']);
    Route::post("/addToCart/{id}" ,  [CartController::class, 'store']);
    Route::get("/showCart" ,  [CartController::class, 'show']);
    Route::get("/Profile" ,  [AuthController::class, 'showProfile']);
    Route::get("/is-admin" ,  [AuthController::class, 'userType']);
    Route::get("/Users" ,  [AuthController::class, 'showUsers']);
    Route::put("/Users/UpdateRole" ,  [AuthController::class, 'updateRole']);
    Route::put("/Profile/update" ,  [AuthController::class, 'update']);
    Route::delete("/cart/remove/{id}" ,  [CartController::class, 'remove']);
    Route::post("/logout" ,  [AuthController::class, 'Logout']);
    Route::post("/resetPw" ,  [AuthController::class, 'resetPw']);
    Route::post("/changePw" ,  [AuthController::class, 'changePw']);
});

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
// Route::resource("/proudcts" , ProductController::class);


