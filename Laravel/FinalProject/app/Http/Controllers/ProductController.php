<?php

namespace App\Http\Controllers;

use App\Models\product;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = product::get();
        return response()->json(['products' => $products]);
    }
    public function RandomFeatured()
    {
        $products = product::inRandomOrder()->limit(8)->get();
        return response()->json(['products' => $products]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(): Response
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $user = $request->user();
        $userId = $user->id;
        $request->validate([
            'title' => 'required|string',
            'image' => 'required',
            'description' => 'required|string',
            'price' => 'required',
            'count'=>'required',
            'category_id'=>'required|numeric',
        ]);
        $img_path = 'images/products';
        $file = $request->file('image');
        if(empty($file)){
        return response()->json(['message' => 'image file is empty']);
        }
        else{
            $file_name = $file->getClientOriginalName();
            $path = $file->move($img_path,$file_name);
            $url = url(asset($path));
            product::create([
                'title' => $request->title,
                'image' => $file_name,
                'description' => $request->description,
                'price' => $request->price,
                'count' => $request->count,
                'user_id' => $userId,
                'category_id' => $request->category_id
            ]);
            return response()->json(['message' => 'product is created']);
        }
    // }
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        $product = product::find($id);
        return response()->json(['product' => $product]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id): Response
    {
        //
    }
    public function test(Request $request)
    {
        return response()->json(['message' => $request->image]);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $user = $request->user();
        $userId = $user->id;
        $product = product::find($request->id);
        $request->validate([
            'title' => 'required|string',
            'image' => 'required',
            'description' => 'required|string',
            'price' => 'required',
            'count'=>'required',
            'category_id'=>'required|numeric',
        ]);
        if($request->file('image')){
            $file = $request->file('image');
            $img_path = 'images/products';
            $file_name = $file->getClientOriginalName();
            $path = $file->move($img_path,$file_name);
            $url = url(asset($path));
            $product->update([
                'title' => $request->title,
                'image' => $file_name,
                'description' => $request->description,
                'price' => $request->price,
                'count' => $request->count,
                'user_id' => $userId,
                'category_id' => $request->category_id
            ]);
            return response()->json(['message' => 'product is updated']);
        }
        else{
            $product->update([
                'title' => $request->title,
                'image' => $request->image,
                'description' => $request->description,
                'price' => $request->price,
                'count' => $request->count,
                'user_id' => $userId,
                'category_id' => $request->category_id
            ]);
            return response()->json(['message' => 'product is updated']);
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $product = product::find($id);
        $product->delete();
        return response()->json(['message' => 'product is deleted'],200);
    }
    public function Search(Request $request)
    {
        $query = $request->input('query');
        $products = product::where('title','LIKE',"%$query%")->get();
        return response()->json($products);
    }
}
