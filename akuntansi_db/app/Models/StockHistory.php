<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StockHistory extends Model
{
    use HasFactory;
    protected $fillable = [
        'hl_id',
        'i_id',
        'transaction_type',
        'total_qty',
        'current_qty',
        'unit_price',
        'source_id',
    ];
}
