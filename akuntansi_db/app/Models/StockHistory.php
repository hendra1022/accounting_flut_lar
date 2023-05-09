<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockHistory extends Model
{
    use HasFactory;
    protected $fillable = [
        'shl_id',
        'total_qty',
        'current_qty',
        'item_price',
    ];
}
