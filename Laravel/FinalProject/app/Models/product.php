<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User;

class product extends Model
{
    use HasFactory;
    protected $fillable = [
        'title',
        'image',
        'description',
        'price',
        'count',
        'user_id',
        'category_id',
    ];
    public function products(){
        return $this->belongsTo(user::class);
    }
}
