<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchaseHeader extends Model
{
    use HasFactory;

    protected $fillable = [
        'purchase_date',
        's_id',
        'gross_amount',
        'net_amount',
        'note',
    ];
}
