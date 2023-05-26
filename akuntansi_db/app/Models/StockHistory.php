<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockHistory extends Model
{
    use HasFactory;
    protected $fillable = [
        'h_id',
        'i_id',
        'transaction_type',
        'total_qty',
        'current_qty',
        'item_price',
    ];
}
