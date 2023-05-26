<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchaseHeaderLine extends Model
{
    use HasFactory;
    protected $fillable = [
        'line_no',
        'ph_id',
        'i_id',
        'qty',
        'unit_price',
        'net_amount',
        'note',
    ];
}
