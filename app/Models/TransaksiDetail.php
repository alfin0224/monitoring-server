<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TransaksiDetail extends Model
{
    use HasFactory;
    public function transaction()
    {
        return $this->belongsTo(Transaksi::class, 'trans_id');
    }
    
    public function hardwareDetail()
    {
        return $this->belongsTo(HardwareDetail::class, 'hardware');
    }
    
    public function sensorDetail()
    {
        return $this->belongsTo(HardwareDetail::class, 'sensor');
    }
}