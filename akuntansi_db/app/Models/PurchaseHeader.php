<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PurchaseHeader extends Model
{
    use HasFactory;

    protected $fillable = [
        'transaction_date',
        's_id',
        'gross_amount',
        'net_amount',
        'note',
    ];

    public function setTransactionDateAttribute($value)
    {
        $this->attributes['transaction_date'] = Carbon::parse($value);
    }
}
