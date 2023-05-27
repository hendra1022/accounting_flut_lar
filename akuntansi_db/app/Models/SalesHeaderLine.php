<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SalesHeaderLine extends Model
{
    use HasFactory;
    protected $fillable = [
        'line_no',
        'sh_id',
        'i_id',
        'qty',
        'unit_price',
        'net_amount',
        'note',
    ];
}
