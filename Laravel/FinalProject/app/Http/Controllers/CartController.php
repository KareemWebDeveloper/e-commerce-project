<?php

namespace App\Http\Controllers;

use App\Models\cart;
use App\Models\product;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function store(Request $request , $id){
        $user = $request->user();
        $userId = $user->id;
        $product = product::find($id);
        $product_id = $product->id;

        if($request->quantity){
            $quantity = $request->quantity;
        }
        else{
            $quantity = 1;
        }
        $cart = cart::where('user_id',$userId )->where('product_id',$product_id)->first();
        if(!$cart){
            cart::create([
                'user_id' => $userId,
                'product_id' => $product_id,
                'quantity' => $quantity,
            ]);
        }
        else{
            $cart->update([
                'user_id' => $userId,
                'product_id' => $product_id,
                'quantity' => $quantity,
            ]);
        }

        return response()->json(['message' => 'product added to cart'],200);
    }
    public function show(Request $request){
        $user = $request->user();
        $userId = $user->id;
        $cart = cart::where('user_id',$userId)->first();
        if($cart){
            $userCart = cart::where('user_id',$userId)->get();
            return response()->json(['message' => $userCart ],200);
        }
        else{
            return response()->json(['notFound' => 'Prouct Not Found'],404);
        }
    }
    public function remove($id){
        $product = cart::find($id);
        $product->delete();
        return response()->json(['message' => 'product has been deleted from Your Cart' ],200);
    }
}
