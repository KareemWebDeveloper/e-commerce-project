<?php

namespace App\Http\Controllers;

use App\Models\category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class categoryController extends Controller
{
    public function index()
    {
        $Categories = category::get();
        return response()->json(['Categories' => $Categories]);
    }
    public function store(Request $request)
    {
        $user = $request->user();
        $userId = $user->id;
        $request->validate([
            'name' => 'required',
        ]);
        category::create([
            'name' => $request->name,
            'user_id' => $userId,
        ]);
        return response()->json(['message' => 'category is created'],200);
    }
    public function MenCategory()
    {
        $columnValue = 'MEN';
        $row = DB::table('categories')->where(DB::raw('UPPER(name)'),strtoupper($columnValue))->first();
        if ($row) {
            $rowId = $row->id;
            $category = category::find($rowId);
            $products = $category->products;
            if(count($products)>0){
            return response()->json(['products' => $products],200);
            }
            else{
                return response()->json(['message' => 'There is no Men products']);
            }
        }
        else{
            return response()->json(['message' => 'There is no Men products']);
        }
    }
    public function WomenCategory()
    {
        $columnValue = 'WOMEN';
        $row = DB::table('categories')->where(DB::raw('UPPER(name)'),strtoupper($columnValue))->first();
        if ($row) {
            $rowId = $row->id;
            $category = category::find($rowId);
            $products = $category->products;
            if(count($products)>0){
            return response()->json(['products' => $products],200);
            }
            else{
                return response()->json(['message' => 'There is no Women products']);
            }
        }
        else{
            return response()->json(['message' => 'There is no Women products']);
        }
    }
    public function KidsCategory()
    {
        $columnValue = 'KIDS';
        $row = DB::table('categories')->where(DB::raw('UPPER(name)'),strtoupper($columnValue))->first();
        if ($row) {
            $rowId = $row->id;
            $category = category::find($rowId);
            $products = $category->products;
            if(count($products)>0){
            return response()->json(['products' => $products],200);
            }
            else{
                return response()->json(['message' => 'There is no Kids products']);
            }
        }
        else{
            return response()->json(['message' => 'There is no Kids products']);
        }
    }
    public function accessories()
    {
        $columnValue = 'ACCESSORIES';
        $row = DB::table('categories')->where(DB::raw('UPPER(name)'),strtoupper($columnValue))->first();
        if ($row) {
            $rowId = $row->id;
            $category = category::find($rowId);
            $products = $category->products;
            if(count($products)>0){
            return response()->json(['products' => $products],200);
            }
            else{
                return response()->json(['message' => 'There is no Accessories products']);
            }
        }
        else{
            return response()->json(['message' => 'There is no Accessories products']);
        }
}
    public function footwear()
    {
        $columnValue = 'FOOTWEAR';
        $row = DB::table('categories')->where(DB::raw('UPPER(name)'),strtoupper($columnValue))->first();
        if ($row) {
            $rowId = $row->id;
            $category = category::find($rowId);
            $products = $category->products;
            if(count($products)>0){
            return response()->json(['products' => $products],200);
            }
            else{
                return response()->json(['message' => 'There is no FootWear products']);
            }
        }
        else{
            return response()->json(['message' => 'There is no FootWear products']);
        }
}
    public function sales()
    {
        $columnValue = 'SALES';
        $row = DB::table('categories')->where(DB::raw('UPPER(name)'),strtoupper($columnValue))->first();
        if ($row) {
            $rowId = $row->id;
            $category = category::find($rowId);
            $products = $category->products;
            if(count($products)>0){
            return response()->json(['products' => $products],200);
            }
            else{
                return response()->json(['message' => 'There is no Sales products']);
            }
        }
        else{
            return response()->json(['message' => 'There is no Sales products']);
        }
}
}
