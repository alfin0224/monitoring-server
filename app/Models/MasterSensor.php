<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MasterSensor extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'master_sensors';
    protected $primaryKey = 'sensor';
    public $incrementing = false;
    public $timestamps = false;

    protected $fillable = [
        'sensor',
        'sensor_name',
        'unit',
        'created_by',
    ];

    public function hardwareDetails()
    {
        return $this->hasMany(HardwareDetail::class, 'sensor');
    }
}