<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class AuthController extends Controller
{
    public function Register(Request $request){
        $fields = $request->validate([
            'name' => 'required|string',
            'email' => 'required|string|unique:users,email',
            'password' => 'required|string|confirmed',
            'age' => 'required|integer',
            'gender' => 'required|string',
            'phone' => 'required|string|unique:users,phone',
            'address' => 'string',
            'city' => 'string',
        ]);
        $user = User::create([
            'name' => $fields['name'],
            'email' => $fields['email'],
            'password' => bcrypt($fields['password']),
            'age' => $fields['age'],
            'gender' => $fields['gender'],
            'phone' => $fields['phone'],
            'address' => $fields['address'],
            'city' => $fields['city'],
        ]);
        $token = $user->createToken('UserToken')->plainTextToken;
        return response()->json(['Token' => $token , 'user' => $user]);
    }
    public function Logout(Request $request){
        auth()->user()->tokens()->delete();
        return response()->json(['message' => 'Logged out']);
    }
    public function login(Request $request){
        $fields = $request->validate([
            'email' => 'required|string',
            'password' => 'required|string',
        ]);
        //check email and password
        $user = User::where('email',$fields['email'])->first();
        if(!$user || !Hash::check($fields['password'], $user->password)){
            return response()->json(['message'=> 'email or password not correct'],401);
        }

        $token = $user->createToken('UserToken')->plainTextToken;
        return response()->json(['Token' => $token , 'user' => $user]);
    }
    public function showProfile(Request $request){
        $user = $request->user();
        return response()->json(['user' => $user]);
    }
    public function update(Request $request){
        $user = $request->user();
        $fields = $request->validate([
            'name' => 'required|string',
            'email' => ['required','email',Rule::unique('users')->ignore($user->id)],
            // 'password' => 'required|string|confirmed',
            'age' => 'required|integer',
            'gender' => 'required|string',
            'phone' => ['required','string',Rule::unique('users')->ignore($user->id)],
            'address' => 'required|string',
            'city' => 'string',
            'postCode' => 'string',
        ]);
        $user->update($fields);
        return response()->json(['message' => 'User info has been updated']);
    }
    public function userType(Request $request){
        $user = $request->user();
        if($user->type === 'admin'){
            return response()->json(['isAdmin'=> true]);
        }
        else{
            return response()->json(['isAdmin'=> false]);
        }
    }
    public function showUsers(Request $request){
        $user = $request->user();
        if($user->type === 'admin'){
            $users = User::get();
            return response()->json(['users'=> $users]);
        }
        else{
            return response()->json(['message'=> 'unauthorized'],401);
        }
    }
    public function resetPw(Request $request){
        $user = $request->user();
        $pw = $request->password;
        if(Hash::check($pw, $user->password)){
            return response()->json(['message'=> true],200);
        }
        else{
            return response()->json(['message'=> false],401);
        }
    }
    public function changePw(Request $request){
        $user = $request->user();
        $fields = $request->validate([
            'password' => 'required|string',
        ]);
        $user->update([
            'password' => bcrypt($fields['password']),
        ]);
        return response()->json(['message'=> 'password changed successfully'],200);
    }
    public function updateRole(Request $request){
        $fields = $request->validate([
            'email' => 'required|email',
            'type' => 'required|string'
        ]);
        $user = User::where('email',$fields['email'])->first();
        if($user){
            $user->update([
                'type' => $request->type
            ]);
            return response()->json(['message'=> 'user role updated successfully'],200);
        }
        else{
            return response()->json(['message'=> 'User does not exists'],404);
        }
    }
}
