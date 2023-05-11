<?php

namespace App\Models;

use Carbon\Carbon;
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

    public function setPurchaseDateAttribute($value)
    {
        $this->attributes['purchase_date'] = Carbon::parse($value);
    }
}
